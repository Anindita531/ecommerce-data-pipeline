import pandas as pd
import mysql.connector

def load_orders(file_path):

    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="yourpassword",
        database="ecommerce"
    )
    cursor = conn.cursor()

    df = pd.read_csv(file_path)

    # clean missing values
    df = df.where(pd.notnull(df), None)

    # keep required columns only
    df = df[
        [
            "order_id",
            "customer_id",
            "order_status",
            "order_purchase_timestamp",
            "order_approved_at",
            "order_delivered_carrier_date",
            "order_delivered_customer_date",
            "order_estimated_delivery_date"
        ]
    ]

    query = """
    INSERT INTO orders (
        order_id, customer_id, order_status,
        order_purchase_timestamp, order_approved_at,
        order_delivered_carrier_date, order_delivered_customer_date,
        order_estimated_delivery_date
    )
    VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
    """

    data = [tuple(row) for row in df.to_numpy()]

    cursor.executemany(query, data)
    conn.commit()

    print("✅ Orders loaded successfully")

    conn.close()


# run
load_orders("olist_orders_dataset.csv")