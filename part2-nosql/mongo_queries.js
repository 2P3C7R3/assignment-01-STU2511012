// insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "ELEC101",
    name: "Sony 60 Inch 4k Smart TV",
    category: "Electronics",
    brand: "Sony",
    price: 34999,
    currency: "INR",
    stock: 12,
    warranty: {
      period_months: 24,
      type: "Manufacturer"
    },
    specifications: {
      screen_size_inches: 60,
      resolution: "3840x2160",
      voltage: "220-240V",
      connectivity: ["Wi-Fi", "Bluetooth", "HDMI", "USB"]
    },
    ratings: {
      average: 4.5,
      count: 126
    },
    tags: ["smart-tv", "4k", "home-entertainment"]
  },
  {
    _id: "CLOT201",
    name: "American Eagle",
    category: "Clothing",
    brand: "Arrow",
    price: 2799,
    currency: "INR",
    stock: 52,
    sizes: ["S", "M", "L", "XL"],
    material: {
      primary_fabric: "Cotton",
      blend_percentages: [
        { component: "Cotton", percent: 97 },
        { component: "Elastane", percent: 3 }
      ]
    },
    variants: [
      { color: "Navy Blue", sku: "CLOT201-NV", available_stock: 20 },
      { color: "White", sku: "CLOT201-WH", available_stock: 32 }
    ],
    care_instructions: ["Machine wash cold", "Do not bleach", "Iron on low heat"]
  },
  {
    _id: "GROC3001",
    name: "Organic Greek Yogurt",
    category: "Groceries",
    brand: "Amul",
    price: 220,
    currency: "INR",
    stock: 85,
    expiry_date: new Date("2024-12-20T00:00:00Z"),
    weight: {
      value: 400,
      unit: "g"
    },
    storage: {
      temperature: "2-4C",
      instructions: "Keep refrigerated"
    },
    nutritional_info: {
      serving_size_g: 100,
      calories: 92,
      protein_g: 9,
      fat_g: 4,
      carbohydrates_g: 6
    },
    ingredients: ["Milk", "Live cultures"]
  }
]);

// find() — retrieve all Electronics products with price > 20000
db.products.find(
  { category: "Electronics", price: { $gt: 20000 } }
);

// find() — retrieve all Groceries expiring before 2025-01-01
db.products.find(
  { category: "Groceries", expiry_date: { $lt: new Date("2025-01-01T00:00:00Z") } }
);

// updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "ELEC1001" },
  { $set: { discount_percent: 10 } }
);

// createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });
// This index improves performance for frequent category-based queries,
// reducing scan time when filtering products by category.