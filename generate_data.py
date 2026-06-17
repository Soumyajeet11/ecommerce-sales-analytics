import pandas as pd
import random

order_items = []

for item_id in range(1, 12001):
    order_items.append([
        item_id,
        random.randint(1, 5000),   # order_id
        random.randint(1, 100),    # product_id
        random.randint(1, 5)       # quantity
    ])

order_items_df = pd.DataFrame(
    order_items,
    columns=[
        "order_item_id",
        "order_id",
        "product_id",
        "quantity"
    ]
)

order_items_df.to_csv("order_items.csv", index=False)

print("12000 order items generated successfully!")