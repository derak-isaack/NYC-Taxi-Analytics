from prefect_dbt_flow import dbt_flow
from prefect_dbt_flow.dbt import DbtProfile, DbtProject
from prefect.task_runners import SequentialTaskRunner


taxi_flow = dbt_flow(
    project=DbtProject(
        name="TLC_NYC",
        project_dir="D:/Projects/Taxi_Analysis/TLC_NYC",
        profiles_dir="D:/Projects/Taxi_Analysis/TLC_NYC/profiles.yml",
    ),
    profile=DbtProfile(
        target="dev",
        overrides={
            "type": "duckdb",
            "path": r"D:\Projects\Taxi_Analysis\taxi_nyc.db",
        },
    ),
    flow_kwargs={
        "task_runner": SequentialTaskRunner()
    }
)

if __name__ == "__main__":
    taxi_flow()