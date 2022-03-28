{% macro historical_date(date_column) %}

        CASE WHEN {{ date_column }} < {{ dbt_utils.current_timestamp() }} THEN TRUE ELSE FALSE END AS is_historical_date

{% endmacro %}