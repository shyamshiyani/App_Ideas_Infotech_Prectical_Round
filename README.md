# E-Commerce App

An E-Commerce app built using Flutter that allows users to browse products, view details, add items to a cart, and place orders. All data is stored locally using SQLite for cart and order persistence. The product data is loaded from a JSON file.

## Features

- **Browse Products**: 
  - View product categories and featured products on the Home Screen.
  - Select a category to view a list of products with sorting and filtering options.
  
- **Product Details**: 
  - View detailed information about a product, including images, price, description, ratings, and reviews.
  - Add products to the shopping cart.

- **Shopping Cart**: 
  - View items added to the cart.

## Screens

1. **Home Screen**:
   - Displays a list of product categories.
   - Shows featured products.

2. **Product List Screen**:
   - Lists products in a selected category.
   - Offers sorting and filtering options.

3. **Product Details Screen**:
   - Displays detailed product information.
   - Allows adding the product to the shopping cart.

4. **Cart Screen**:
   - Displays the items added to the cart.

## Technical Overview

- **Local Storage**:
  - Data is stored locally using SQLite to persist cart contents and order history.
  
- **Data Source**:
  - Product data is fetched from a local JSON file.
