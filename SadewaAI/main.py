# Model
import json
import pickle
import numpy as np

import pandas as pd

# Fast API
from fastapi.responses import JSONResponse
from starlette.middleware.cors import CORSMiddleware
from fastapi import FastAPI, Request
from fastapi import FastAPI, Request


app = FastAPI()

origins = [
    "http://localhost.tiangolo.com",
    "https://localhost.tiangolo.com",
    "http://localhost",
    "http://localhost:8000",
    "http://localhost:8080"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# url = 'https://exploreasy-71b4c-default-rtdb.firebaseio.com/'

# realtime_database = firebase.FirebaseApplication(url)

# temp_data = realtime_database.get('/data', None)

# # Mengambil hanya nilai dari dictionary dalam daftar
# values_list = []
# for item in temp_data:
#     values_list.append(list(item.values()))

# print(values_list[0][7])


# Fungsi untuk menghitung rekomendasi destinasi
def get_recommendations(dataframe):
    
    with open('./model.pickle', 'rb') as file:
        loaded_model = pickle.load(file)

    df1 = pd.read_csv('./Symptom-severity.csv')

    new_data = pd.DataFrame(dataframe)

    vals = new_data.values
    symptoms = df1['Symptom'].unique()

    for i in range(len(symptoms)):
        vals[vals == symptoms[i]] = df1[df1['Symptom'] == symptoms[i]]['weight'].values[0]

    cols = new_data.columns
    d = pd.DataFrame(vals, columns=cols)

    d = d.replace('dischromic _patches', 0)
    d = d.replace('spotting_ urination',0)
    df = d.replace('foul_smell_of urine',0)
    (df[cols] == 0).all()

    data = df.iloc[:,1:].values

    predictions = loaded_model.predict(data)
    print(predictions)
    return predictions  # Rekomendasi Disease


@app.get("/")
def read_root():
    return {"Symptoms": "Disease"}

@app.post("/recommendation")
async def tourist_recsys(info : Request):
    # try: 
    print(f"info {info}")
    req_info = await info.json()
    Symptom_1 = req_info.get('Symptom_1')
    Symptom_2 = req_info.get('Symptom_2')
    Symptom_3 = req_info.get('Symptom_3')
    Symptom_4 = req_info.get('Symptom_4')
    Symptom_5 = req_info.get('Symptom_5')
    print(Symptom_1)
    data = {
        'Symptom_1': Symptom_1,
        'Symptom_2': Symptom_2,
        'Symptom_3': Symptom_3,
        'Symptom_4': Symptom_4,
        'Symptom_5': Symptom_5,
        'Symptom_6': [0],
        'Symptom_7': [0],
        'Symptom_8': [0],
        'Symptom_9': [0],
        'Symptom_10': [0],
        'Symptom_11': [0],
        'Symptom_12': [0],
        'Symptom_13': [0],
        'Symptom_14': [0],
        'Symptom_15': [0],
        'Symptom_16': [0],
        'Symptom_17': [0],
        'Symptom_18': [0]
        }

    data = pd.DataFrame(data)
    print(data)
    # ==================================================================
    rec = get_recommendations(dataframe=data)
    recommendations = {"disease" : rec[0]}
    print(f"recommendations {recommendations}")
    # Mengonversi kembali menjadi JSON
    output = json.dumps(recommendations, indent=4)
    # ==================================================================
    return  json.loads(output)
    # except Exception as e:
    #     print(e)
    #     ex = {"status": False,
    #           "message": "Disease not found."}
    #     return JSONResponse(content=ex)