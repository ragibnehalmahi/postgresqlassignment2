# postgresqlassignment2
৩) Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Ans:Primary Key: একটি কলাম বা কলামসমষ্টি যা প্রতিটি রো-কে ইউনিকভাবে শনাক্ত করে। এটি NOT NULL এবং UNIQUE হয়।
Foreign Key: একটি কলাম যা অন্য টেবিলের Primary Key কে রেফার করে, এবং দুই টেবিলের মধ্যে সম্পর্ক (relationship) তৈরি করে।
৪) What is the difference between VARCHAR and CHAR data types?
Ans:VARCHAR(n): পরিবর্তনশীল দৈর্ঘ্যের টেক্সট, যেখানে সর্বোচ্চ দৈর্ঘ্য n।
CHAR(n): নির্দিষ্ট দৈর্ঘ্যের টেক্সট। ছোট হলে শেষে স্পেস যোগ হয়।
সাধারণত VARCHAR বেশি ব্যবহৃত হয় কারণ এটা স্টোরেজে সাশ্রয়ী।
৫) Explain the purpose of the WHERE clause in a SELECT statement.
Ans:WHERE ক্লজ ব্যবহৃত হয় নির্দিষ্ট শর্ত অনুযায়ী রো ফিল্টার করতে। যেমন:
SELECT * FROM students WHERE age > 18;
Meaning ছাত্রদের তালিকা থেকে সব কলাম দেখাও যাদের বয়স ১৮ বছরের বেশি
৭) How can you modify data using UPDATE statements?
Ans:UPDATE কমান্ড দিয়ে টেবিলের এক বা একাধিক রো-র ভ্যালু পরিবর্তন করা যায়:
UPDATE students SET age = 20 WHERE id = 1;
ডাটাবেসের ছাত্রদের তালিকায় যার আইডি নম্বর 1, তার বয়স 20 বছর করে আপডেট করো।
৮) What is the significance of the JOIN operation, and how does it work in PostgreSQL?
Ans:JOIN দিয়ে একাধিক টেবিলের তথ্য একসাথে মিলে ফলাফল দেখানো হয়।
উদাহরণ:
SELECT * FROM orders 
JOIN customers ON orders.customer_id = customers.id;
অর্ডার টেবিলের সমস্ত তথ্যের সাথে গ্রাহক টেবিলের সংশ্লিষ্ট তথ্যও একসাথে দেখাও, এরপর যেখানে অর্ডার টেবিলের customer_id কলামের মান গ্রাহক টেবিলের id কলামের সাথে মিলে যায়।


