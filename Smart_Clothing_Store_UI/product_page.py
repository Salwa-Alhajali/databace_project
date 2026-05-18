from tkinter import *
from tkinter import messagebox
from db import get_conn

# ================= INSERT =================
def add_product(entries):
    conn = get_conn()
    cursor = conn.cursor()

    sql = """
    INSERT INTO product (id, p_name, brand, gender, categorie_id, description, p_type)
    VALUES (%s,%s,%s,%s,%s,%s,%s)
    """

    values = tuple(e.get() for e in entries)

    cursor.execute(sql, values)
    conn.commit()
    conn.close()

    messagebox.showinfo("Success", "Product Added")

# ================= UPDATE =================
def update_product(entries):
    conn = get_conn()
    cursor = conn.cursor()

    sql = """
    UPDATE product
    SET p_name=%s, brand=%s, gender=%s, categorie_id=%s, description=%s, p_type=%s
    WHERE id=%s
    """

    values = (
        entries[1].get(),
        entries[2].get(),
        entries[3].get(),
        entries[4].get(),
        entries[5].get(),
        entries[6].get(),
        entries[0].get()
    )

    cursor.execute(sql, values)
    conn.commit()
    conn.close()

    messagebox.showinfo("Success", "Product Updated")

# ================= DELETE =================
def delete_product(pid):
    conn = get_conn()
    cursor = conn.cursor()

    cursor.execute("DELETE FROM product WHERE id=%s", (pid,))
    conn.commit()
    conn.close()

    messagebox.showinfo("Success", "Product Deleted")

# ================= UI =================
def product_ui(root):
    frame = Frame(root)
    frame.pack()

    labels = ["ID","Name","Brand","Gender","Category","Description","Type"]
    entries = []

    for i, text in enumerate(labels):
        Label(frame, text=text).grid(row=i, column=0)
        e = Entry(frame)
        e.grid(row=i, column=1)
        entries.append(e)

    Button(frame, text="Add",
           command=lambda: add_product(entries),
           bg="green", fg="white").grid(row=7, column=0)

    Button(frame, text="Update",
           command=lambda: update_product(entries),
           bg="orange").grid(row=7, column=1)

    Button(frame, text="Delete",
           command=lambda: delete_product(entries[0].get()),
           bg="red", fg="white").grid(row=8, column=0, columnspan=2)