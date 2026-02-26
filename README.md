# 🌊 FloodGuard AI

AI-Powered Hyperlocal Flood Risk & Response Platform

---

## 📂 Repository Overview

FloodGuard AI is a Flutter-based hyperlocal flood prediction and response mobile application. This repository contains the complete source code, backend integration, and AI-driven risk analysis system designed to enhance disaster preparedness and community resilience.

The project integrates real-time weather forecasting, rainfall data analysis, historical flood records, and community-sourced reports to generate intelligent flood probability predictions and personalized safety recommendations.

### 🎯 Target Users

Residents in flood-prone regions

Local communities

Emergency preparedness planners

### 🌟 Core Capabilities

Community flood reporting system

Area-based weather forecast selection

Rainfall threshold analysis

AI-powered flood risk prediction

Personalized safety recommendations

### 👥 Team

**YEOH JIA POH (Team Leader)**

ASHLEE SIA WEI TIEN

HAN ZHI CHOU

TAM KAI DIT

---

## Project Overview

### Problem Statement

**Flooding** is one of the most frequent and destructive natural disasters, especially in vulnerable communities with limited early warning systems.Many communitites lack:

- Real-time localized flood warnings

- Predictive flood intelligence

- Community-driven reporting systems

- Clear, AI-powered safety recommendations

## 🎯 Alignment with AI & Sustainable Development Goals (SDGs)

**FloodGuard AI** aligns with the United Nations Sustainable Development Goals (SDGs):

SDG 6 – Clean Water and Sanitation

SDG 11 – Sustainable Cities and Communities

SDG 13 – Climate Action

By improving access to disaster information and enabling early warning systems, FloodGuard supports water equity and climate resilience

## Our Solution

**FloodGuard AI** is a mobile-based intelligent flood monitoring system that combines:

- Community flood reporting

- Weather forecasting by selected area

- AI-generated safety recommendations

- Rainfall data analysis

The platform shifts from reactive response to predictive prevention.

---

## Key Features

### 🏘 1. Community Flood Reporting

Users can submit flood reports in real-time

Attach location data

Crowd-sourced flood verification

Strengthens local awareness and rapid response

This transforms users from passive recipients into active contributors.

### 🌦 2. Area-Based Weather Forecast

Users select specific areas

View weather forecast for chosen location

Rainfall probability and intensity indicators

Supports proactive decision-making

### 🤖 3. AI-Generated Intelligent Safety Recommendations

FloodGuard AI analyzes:

Historical flood records

Rainfall intensity

User location

Community reports

Then automatically generates:

Personalized safety instructions

Evacuation suggestions

Preparation checklists

Risk severity explanations

Instead of generic advice, users receive context-aware safety guidance.

### 🌧 4. Rainfall Data Analysis & Flood Prediction

The system:

Collects rainfall data from APIs

Compares it with historical flood thresholds

Detects abnormal precipitation patterns

Predicts potential flood occurrences

If rainfall exceeds learned danger thresholds → ⚠️ High flood probability alert is triggered.

### 🌩️ 5. Real-time Weather Forecasts

The system:

Allows users to choose a city in Malaysia and view its current weather condition and temperature

---

## 🛠 Technical Implementation

### 💻 Frontend

- Flutter (Cross-platform mobile development)
- Google Maps API (Location & visualization)
- Firebase Cloud Messaging (Push notifications)

### ☁️ Backend

- Firebase Firestore (Real-time database)
- Firebase Authentication (Secure login system)
- AI Prediction Model (Risk classification algorithm)

## 🔎 Google Technology Utilization (Cause & Effect)

We used **Google Maps Platform** to visualize real-time flood risk geographically.  
→ This allows users to clearly see affected zones and plan safer routes.

We used **Firebase Firestore** for real-time cloud data storage.  
→ This ensures instant synchronization of flood alerts across all users.

We used **Firebase Cloud Messaging (FCM)** for push notifications.  
→ This enables immediate flood warnings, improving emergency response time.

We used **Flutter** as the development framework.  
→ This ensures cross-platform accessibility (Android & iOS) with high performance.

---

## Implementation Details & Innovation

### 🏗 System Architecture

Frontend: Flutter mobile application (UI, map, community reporting)

Backend: Firebase (Firestore database, authentication, notifications)

Data Sources: Weather & rainfall APIs

AI Engine: Analyzes historical flood data + rainfall intensity + community reports

Output Layer: Flood probability score, alerts, and safety recommendations

### 🔄 Workflow

User selects an area or submits a community report

App retrieves real-time weather and rainfall data

System compares data with historical flood thresholds

AI calculates flood risk probability

Personalized safety recommendations are generated

High-risk detection triggers alerts to users

### 🚀 Innovation

Combines crowd-sourced reports + rainfall analytics + AI prediction

Generates intelligent, location-based safety guidance

Shifts from reactive monitoring to predictive flood prevention

---

## Challenges Faced

### 🔑 API Key Security & Management

We have met challenges protecting Google Maps and weather API keys from exposure. And it is quite a pain managing environment variables during deployment.

### 🌐 Real-Time Data Integration

We have met challenges where we need to synchronizing rainfall APIs, historical flood data and community reports while handling network latency and inconsistent data updates.

### 🤖 AI Risk Prediction Accuracy

We have also met challenges where we are working on the AI to define appropriate rainfall thresholds, balancing false positives and missed warnings, making it validating predictions using the accurate rainfall data.

---

## 📦 Installation and Setup Instruction

### (1) Clone the repository

```bash
git clone https://github.com/EugeneHZC/floodguard-ai.git
```

### (2) Navigate to the project

```bash
cd floodguard-ai
```

### (3) Install dependencies

```bash
flutter pub get
```

### (4) Run the app

```bash
flutter run
```

---

## Future Roadmap

### 🔮 Planned Features:

🌧 Real-time rainfall radar overlay

🛰 Satellite imagery integration

🏠 Nearby evacuation center locator

📡 IoT water level sensor integration

📈 Advanced machine learning flood prediction

🌐 Web dashboard for authorities

🌏 Multi-language support
