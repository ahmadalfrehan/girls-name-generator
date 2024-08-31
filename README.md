Girls Name Prediction Using Recurrent Neural Networks
This project aims to predict a girl's name given a starting letter using a Recurrent Neural Network (RNN). The model is exposed via a FastAPI backend, which is linked to a Flutter app for an interactive user experience.

Table of Contents
Overview
Architecture
Features
Installation
Usage
Model Training
API Documentation
Flutter App
Contributing
License
Overview
The project is designed to predict potential names for girls based on a given starting letter. It uses a Recurrent Neural Network (RNN) model for prediction and exposes the model through a FastAPI backend. The frontend is built using Flutter, providing an intuitive interface for users to interact with the name prediction service.

Architecture
Recurrent Neural Network Model: Trained to predict girl's names based on the starting letter.
FastAPI Backend: Serves as the API layer that handles requests and interacts with the RNN model.
Flutter Frontend: A mobile application built with Flutter that provides a user-friendly interface to interact with the API.
Features
RNN Model: Utilizes deep learning to predict names based on a starting letter.
API Endpoint: FastAPI backend provides a RESTful endpoint for predictions.
Flutter Integration: A mobile app built with Flutter that consumes the API for real-time predictions.
Installation
Prerequisites
Python 3.8 or higher
Flutter SDK
Virtual environment tools (like venv or conda)
Clone the Repository
bash
Copy code
git clone https://github.com/your-username/girls-name-predictor.git
cd girls-name-predictor
Backend Setup
Create a virtual environment and activate it:

bash
Copy code
python -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`
Install the required packages:

bash
Copy code
pip install -r requirements.txt
Run the FastAPI server:

bash
Copy code
uvicorn main:app --reload
The API will be running at http://127.0.0.1:8000.

Frontend Setup
Navigate to the Flutter app directory:

bash
Copy code
cd flutter_app
Install Flutter dependencies:

bash
Copy code
flutter pub get
Run the Flutter app:

bash
Copy code
flutter run
Usage
Start the FastAPI server to expose the model as an API.
Launch the Flutter app to interact with the model through a user-friendly interface.
Enter a starting letter in the Flutter app, and it will display predicted girl's names based on that letter.
Model Training
The model is trained on a dataset of girl's names. The RNN architecture includes:

Layers: Embedding, LSTM, Dense.
Loss Function: Categorical Crossentropy.
Optimizer: Adam.
Training scripts and dataset preprocessing details can be found in the model_training directory.

API Documentation
The FastAPI backend provides a simple RESTful API. The main endpoint is:

POST /predict-name/: Takes a JSON payload with the starting letter and returns a list of predicted names.
Example request:

json
Copy code
{
  "starting_letter": "A"
}
Example response:

json
Copy code
{
  "predicted_names": ["Alice", "Ava", "Amelia"]
}
Flutter App
The Flutter app is a simple interface that allows users to input a starting letter and view the predicted names. It communicates with the FastAPI backend to fetch predictions.

Contributing
Contributions are welcome! Please follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature/your-feature-name).
Make your changes.
Commit your changes (git commit -m 'Add some feature').
Push to the branch (git push origin feature/your-feature-name).
Open a pull request.
License
This project is licensed under the MIT License - see the LICENSE file for details.
