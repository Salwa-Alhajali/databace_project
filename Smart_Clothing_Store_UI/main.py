from tkinter import *
from product_page import product_ui

root = Tk()
root.title("Smart Clothing Store System")
root.geometry("500x400")

Label(root, text="SMART CLOTHING STORE SYSTEM",
      font=("Arial", 14, "bold")).pack()

Button(root, text="Open Product Page",
       command=lambda: product_ui(root),
       bg="blue", fg="white").pack(pady=20)

root.mainloop()