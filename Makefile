install:
	poetry install

jupyter:
	poetry run jupyter lab

mlflow-server:
	poetry run mlflow server --backend-store-uri sqlite:///backend.sqlite

mlflow-ui:
	poetry run mlflow ui

preprocess:
	poetry run python scripts/preprocess_data.py --raw_data_path data/raw/ --dest_path data/processed/

train:
	poetry run python scripts/train.py --data_path data/processed/

tune:
	poetry run python scripts/hpo.py --data_path data/processed/ --num_trials 10

prefect:
	poetry run prefect server start

prefect-worker:
	poetry run prefect worker start --pool zoompool --work-queue default
