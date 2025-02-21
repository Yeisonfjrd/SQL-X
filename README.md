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
                UserQueriesSQL["User Queries\n(SQL)"]
                style UserQueriesSQL fill:#f9f,stroke:#333,stroke-width:2px
                UserQueriesSQL --> Queries["Queries"]
            end
            subgraph "Analytics Queries"
                direction TB
                AnalyticsQueriesSQL["Analytics Queries\n(SQL)"]
                style AnalyticsQueriesSQL fill:#f9f,stroke:#333,stroke-width:2px
                AnalyticsQueriesSQL --> AggregateCounts["Aggregate\nCounts"]
            end
            subgraph "Tweet Queries"
                direction TB
                TweetQueriesSQL["Tweet Queries\n(SQL)"]
                style TweetQueriesSQL fill:#f9f,stroke:#333,stroke-width:2px
                TweetQueriesSQL --> QueriesTweets["Queries"]
            end
        end

        subgraph "Database Layer"
            direction TB
            subgraph "Database Components"
                direction TB
                subgraph "User Management"
                    direction TB
                    UserManagement["User Management\n(users table)"]
                    style UserManagement fill:#ccf,stroke:#333,stroke-width:2px
                    UserManagement --> RefUsers["References\n(1:N)"]
                end
                subgraph "Follower Management"
                    direction TB
                    FollowerManagement["Follower Management\n(followers table)"]
                    style FollowerManagement fill:#ccf,stroke:#333,stroke-width:2px
                    FollowerManagement --> ReferencesFollowers["References\n(1:N)"]
                    FollowerManagement --> Validates["Validates via\nPrevent Self-Follow Trigger"]
                end
                subgraph "Tweet Management"
                    direction TB
                    TweetManagement["Tweet Management\n(tweets table)"]
                    style TweetManagement fill:#ccf,stroke:#333,stroke-width:2px
                    TweetManagement --> RefTweets["References\n(1:N)"]
                end
                subgraph "Like Management"
                    direction TB
                    LikeManagement["Like Management\n(likes table)"]
                    style LikeManagement fill:#ccf,stroke:#333,stroke-width:2px
                    LikeManagement --> PointLiked["Points to liked tweets"]
                end
            end
            DatabaseMySQL["Main Database\n(MySQL)"]
            style DatabaseMySQL fill:#bea,stroke:#333,stroke-width:2px
            DatabaseComponents --> DatabaseMySQL
        end

    ExternalUser["External User"] <--- **¡Indentación eliminada!**
    style ExternalUser fill:#87cefa,stroke:#333,stroke-width:2px <--- **¡Indentación eliminada!**

    ExternalUser -- Follows --> FollowerManagement <--- **¡Indentación eliminada!**
    ExternalUser -- Creates Likes --> LikeManagement <--- **¡Indentación eliminada!**

    Data Access Layer --> Database Layer <--- **¡Indentación eliminada!  (Línea 66)**
  end

---