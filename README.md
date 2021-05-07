# entrevista-ignaciogatti

Este repositorio propone una serie de clasificadores cuyo objetivo es determinar si una *review* de película es **buena** o **mala**.

## Análisis EDA

En la notebook **EDA dataset cliengo** se lleva adelante un análisis exploratorio de los datos presentes en el dataset. Básicamente, allí se estudia la estructura de las *reviews* y se trata de encontrar los primeros indicios que nos ayuden a discriminar una *review* **buena** de una **mala**. 

Dentro de la notebook se encuentra un breve reporte con las conclusiones obtenidas en base a los diversos estudios realizados.

## Diseño de clasificadores

En la notebook **Clasificador cliengo** se diseñan y entrenan una serie de clasificadores que se pueden denominar "clásicos" dentro del área de **Machine Learning**. A través de estos clasificadores es posible observar como se comportan las diversas técnicas de **Machine learning** para la tarea de clasificacin de *reviews*. Estos modelos fueron desarrollados utilizando la librería [**scikit-learn**](https://scikit-learn.org/stable/).

Dentro de esta notebook se encuentran el preprocesamiento de los datos, el entrenamiento de los modelos y la evaluación comparativa de los mismos.

## Clasificador XGBoost

En la notebook **Clasificador XGBoost cliengo** se diseña un clasificador utilizando la librería [**XGBoost**](https://xgboost.readthedocs.io/en/latest/index.html), una de las ms utilizadas a la hora de desarrollar clasificadores. En este caso se entrena un modelo y se lo compara con el mejor modelo obtenido en la noteboo anterior. 

En este caso, resulta interesante el análisis posterior realizado sobre el clasificador **XGBoost**. A partir de la librería [**SHAP**](https://shap.readthedocs.io/en/latest/) se puede observar cuáles son las palabras que más peso tienen para el modelo a la hora de predecir una *review*. Este análisis refuerza las conclusiones observadas en el análisis EDA.

## Clasificador con Word Embedding y LSTM

En la notebook **Word Embedding** se presenta la arquitectura de una **Deep Neural Network** sencilla que tiene dos capas: una que utiliza [**word embeddings pre-entrenados**](https://www.kaggle.com/rtatman/pretrained-word-vectors-for-spanish) y una capa [LSTM](https://www.tensorflow.org/api_docs/python/tf/keras/layers/LSTM).

Si bien el dataset sobre el cual se trabaja es pequeño, el objetivo es observar cómo se comporta el modelo de **Deep Neural Network**.
