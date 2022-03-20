{% test historical_date(model, column_name) %}

    select *
    from {{ model }}
    where {{ column_name }} > NOW()

{% endtest %}