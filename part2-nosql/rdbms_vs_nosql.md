# RDBMS vs NoSQL

## Database Recommendation

For a healthcare startup building a patient management system, I would recommend MySQL as the primary database. Healthcare data is highly sensitive and requires strong guarantees around accuracy and consistency. This is where ACID properties become critical—ensuring that transactions are atomic, data remains consistent, and updates are reliably stored even in the event of system failures.

A patient management system deals with structured and highly relational data, such as patients, doctors, appointments, prescriptions, and billing records. These relationships are best enforced using a relational database, where foreign keys and constraints maintain integrity. An inconsistent or partially updated patient record could lead to serious operational or legal consequences, so consistency should be prioritized over availability, aligning with the CAP theorem.

MongoDB, on the other hand, follows a more flexible schema design and BASE properties, making it better suited for systems where scalability and rapid changes are more important than strict consistency. While this is useful in many modern applications, it is not ideal for core healthcare systems where data correctness is non-negotiable.

However, if the startup also needs to implement a fraud detection module, the recommendation can evolve. Fraud detection often involves large volumes of semi-structured or unstructured data such as logs, behavioral patterns, and real-time event streams. In this case, using a NoSQL solution alongside MySQL would be beneficial.

Therefore, the optimal approach would be a hybrid architecture: MySQL for the core patient management system, ensuring data integrity and consistency, and a NoSQL database for handling high-volume, flexible fraud detection data.