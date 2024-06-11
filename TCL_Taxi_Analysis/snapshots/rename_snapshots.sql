{% snapshot my_snapshot %}
{{
    config(
        target_database = generate_database_name('snapshotsdb'),
        target_schema = 'snapshots_schema',
        unique_key = 'id',
        strategy = 'timestamp',
        updated_at = 'updated_at_column'
    )
}}
SELECT *
FROM {{ ref('table_rename') }}

{% endsnapshot %}