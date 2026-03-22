# Vector DB Reflection

## Vector DB Use Case

A traditional keyword-based search would not be enough for a law firm that wants lawyers to search 500-page contracts using plain-English questions like “What are the termination clauses?” Keyword search works well when the exact words in the query also appear in the document. But contracts often express the same idea using different wording, such as “right to terminate,” “grounds for cancellation,” “early exit,” or “termination for breach.” A pure keyword system can miss relevant passages if the wording does not match exactly, and it can also return too many noisy matches where the words appear but the meaning is different.

A vector database helps solve this by storing embeddings of contract chunks rather than relying only on literal text matching. Embeddings capture semantic meaning, so a question about termination clauses can retrieve sections that discuss ending the agreement even if they do not use the exact word “termination.” In practice, the contract would first be split into smaller chunks, each chunk would be converted into a vector embedding, and those vectors would be stored in the vector database. When a lawyer asks a question, the system embeds the question and retrieves the most semantically similar chunks.

Although ultimately, the best system is usually hybrid rather than vector-only. Keyword or metadata filters can still help narrow results by contract type, party name, jurisdiction, or date, while the vector database handles semantic retrieval. This combination gives more accurate, flexible, and lawyer-friendly contract search.
