{% test subsequent_date(model, column_name) %}

    select *
    from {{ model }}
    where {{ column_name }} < created_at

{% endtest %}