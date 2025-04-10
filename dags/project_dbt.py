from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow',
    'retries': 1,
    'retry_delay': timedelta(minutes=2)
}

with DAG(
    dag_id='dbt_transformation_dag',
    default_args=default_args,
    start_date=datetime(2024, 1, 1),
    schedule_interval='@daily',  # tu peux aussi mettre '@once' pour un run unique
    catchup=False,
    tags=['dbt', 'snowflake']
) as dag:

    dbt_run = BashOperator(
        task_id='run_dbt',
        bash_command='cd /chemin/vers/ton/projet/dbt && dbt run',
        
    )

    dbt_test = BashOperator(
        task_id='test_dbt',
        bash_command='cd /chemin/vers/ton/projet/dbt && dbt test',
    )

    dbt_run >> dbt_test
