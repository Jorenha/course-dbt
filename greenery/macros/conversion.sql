{% macro conversion(condition, event_column, tot_events_column) %}

        ROUND((COUNT(DISTINCT CASE WHEN {{ condition }} IS NOT NULL THEN {{ event_column }} END)::numeric/ COUNT(DISTINCT {{ tot_events_column }})::numeric ) * 100, 2) AS conversion

{% endmacro %}