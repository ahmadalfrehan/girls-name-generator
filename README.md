# Girls Name Prediction Using Recurrent Neural Networks

This project aims to predict a girl's name given a starting letter using a Recurrent Neural Network (RNN). The model is exposed via a FastAPI backend, which is linked to a Flutter app for an interactive user experience.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Model Training](#model-training)
- [API Documentation](#api-documentation)
- [Flutter App](#flutter-app)
- [Contributing](#contributing)
- [License](#license)

## Overview

The project is designed to predict potential names for girls based on a given starting letter. It uses a Recurrent Neural Network (RNN) model for prediction and exposes the model through a FastAPI backend. The frontend is built using Flutter, providing an intuitive interface for users to interact with the name prediction service.

## Architecture

1. **Recurrent Neural Network Model**: Trained to predict girl's names based on the starting letter.
2. **FastAPI Backend**: Serves as the API layer that handles requests and interacts with the RNN model.
3. **Flutter Frontend**: A mobile application built with Flutter that provides a user-friendly interface to interact with the API.

## Features

- **RNN Model**: Utilizes deep learning to predict names based on a starting letter.
- **API Endpoint**: FastAPI backend provides a RESTful endpoint for predictions.
- **Flutter Integration**: A mobile app built with Flutter that consumes the API for real-time predictions.

## Installation

### Prerequisites

- Python 3.8 or higher
- Flutter SDK
- Virtual environment tools (like `venv` or `conda`)

### Clone the Repository

```bash
git clone https://github.com/your-username/girls-name-predictor.git
cd girls-name-predictor
