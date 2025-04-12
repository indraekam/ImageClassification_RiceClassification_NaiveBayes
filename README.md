# 🌾 Rice Quality Classification using Naive Bayes (MATLAB)

![Banner](assets/banner.png)

This project uses **image-based classification** to identify the **quality of rice grains** using the **Naive Bayes algorithm**.  
It is implemented in **MATLAB R2020** and uses image processing to extract visual features before classification.

---

![MATLAB](https://img.shields.io/badge/Platform-MATLAB_R2020-yellow?style=flat&logo=mathworks)
![Naive Bayes](https://img.shields.io/badge/Model-Naive_Bayes-blue?style=flat)
![Classification](https://img.shields.io/badge/Type-Image_Classification-green?style=flat)
![Domain](https://img.shields.io/badge/Application-Rice_Quality_Inspection-orange?style=flat)
![License](https://img.shields.io/badge/License-MIT-lightgrey?style=flat)

---

## 🎯 Objective

- Classify rice grain quality based on visual features from input images
- Use Naive Bayes classifier for decision making
- Enable automated and consistent rice quality evaluation
- Built and tested in MATLAB R2020

---

## 🛠️ Features

- Image preprocessing (RGB to Grayscale, noise removal, segmentation)
- Feature extraction (area, shape, length, width, color intensity, etc.)
- Naive Bayes training and prediction
- Classification result with label display

---

## 📂 Project Structure

```
RiceQuality_Classification_NaiveBayes/
├── klasifikasi_beras.m
├── klasifikasi_beras.fig
├── extract_training_glcm.m
├── nb_new.m
├── sample_images/
│   ├── good_rice1.jpg
│   ├── medium_rice2.jpg
│   └── broken_rice3.jpg
└── README.md
```

---

## 🚀 How to Run

1. Open the project in **MATLAB R2020**
2. Run `klasifikasi_beras.m` or `nb_new.m`
3. Upload a rice grain image
4. The script will output the predicted quality category

---

## 👨‍💻 Author

**Indra Eka Mandriana S.Kom**  
_Computer Vision and Pattern Recognition Enthusiast_

---

## ⭐ Found this helpful? Give it a ⭐ on GitHub!
