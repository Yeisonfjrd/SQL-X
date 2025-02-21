# SQL-X

Este proyecto contiene scripts SQL para gestionar una base de datos similar a una red social tipo Twitter. La base de datos incluye tablas para usuarios, seguidores, tweets y likes.

---

## Diagrama de Arquitectura del Proyecto

```mermaid
graph LR
    subgraph "Twitter Clone System"
        subgraph "Data Access Layer"
            direction TB
            subgraph "User Queries"
                direction TB
                UserQueriesSQL["User Queries\nSQL"]
                style UserQueriesSQL fill:#f9f,stroke:#333,stroke-width:2px
                UserQueriesSQL --> Queries(Queries)
            end
            subgraph "Analytics Queries"
                direction TB
                AnalyticsQueriesSQL["Analytics Queries\nSQL"]
                style AnalyticsQueriesSQL fill:#f9f,stroke:#333,stroke-width:2px
                AnalyticsQueriesSQL --> AggregateCounts["Aggregate\nCounts"]
            end
            subgraph "Tweet Queries"
                direction TB
                TweetQueriesSQL["Tweet Queries\nSQL"]
                style TweetQueriesSQL fill:#f9f,stroke:#333,stroke-width:2px
                TweetQueriesSQL --> QueriesTweets(Queries)
            end
        end

        subgraph "Database Layer"
            direction TB
            subgraph "Database Components"
                direction TB
                subgraph "User Management"
                    direction TB
                    UserManagement["User Management\nusers table"]
                    style UserManagement fill:#ccf,stroke:#333,stroke-width:2px
                    UserManagement --> RefUsers["References\n1:N"]
                end
                subgraph "Follower Management"
                    direction TB
                    FollowerManagement["Follower Management\nfollowers table"]
                    style FollowerManagement fill:#ccf,stroke:#333,stroke-width:2px
                    FollowerManagement --> ReferencesFollowers["References\n1:N"]
                    FollowerManagement --> Validates["Validates via\nprevent self follow trigger"]
                end
                subgraph "Tweet Management"
                    direction TB
                    TweetManagement["Tweet Management\ntweets table"]
                    style TweetManagement fill:#ccf,stroke:#333,stroke-width:2px
                    TweetManagement --> RefTweets["References\n1:N"]
                end
                subgraph "Like Management"
                    direction TB
                    LikeManagement["Like Management\nsweet_like table"]
                    style LikeManagement fill:#ccf,stroke:#333,stroke-width:2px
                    LikeManagement --> PointLiked["Point liked the"]
                end
            end
            DatabaseMySQL["Main Database\nMySQL"]
            style DatabaseMySQL fill:#bea,stroke:#333,stroke-width:2px
            DatabaseComponents --> DatabaseMySQL
        end

        ExternalUser(External User)
        style ExternalUser fill:#87cefa,stroke:#333,stroke-width:2px

        ExternalUser -- Follows --> FollowerManagement
        ExternalUser -- Creates Likes --> LikeManagement

        Data Access Layer --> Database Layer
    end

---  <-- **Asegúrate de que haya esta línea en blanco aquí**

# SQL-X

Este proyecto contiene scripts SQL para gestionar una base de datos similar a una red social tipo Twitter. La base de datos incluye tablas para usuarios, seguidores, tweets y likes.