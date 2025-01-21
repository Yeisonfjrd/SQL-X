# SQL-X

This project contains SQL scripts for managing a database similar to a social network like Twitter. The database includes tables for users, followers, tweets, and likes. Below are the expected results for some of the queries:

---

## Results

### Top 3 users with the most followers:
| user_id | user_handle   | followers |
|---------|---------------|-----------|
| 1       | juanperez     | 4         |
| 3       | rodrigoz      | 1         |
| 2       | mariagomez    | 1         |

---

### Tweets with the most likes:
| tweet_id | like_count |
|----------|------------|
| 3        | 2          |
| 4        | 1          |

---

### Prevent self-follow trigger:
The trigger prevents a user from following themselves. If attempted, the error message will be:
