RESTful API for a URL shortener service.

The RESTful API service should have the following features:

## v1:

    -User Registration.
    -User Login (returns API key using Sanctum).
    -Using the API key one can send a long URL and will get a shortened one in response. (If the long URL is already in
      the system, don’t create a new shortened URL, return the previous one). Only the users with a valid API key can use this service.
    -Ensure that all shortened URLs are unique so that they do not collide and cause unwanted bugs. But if a user submits
      the same Long URL multiple times, they'll get the same short URL for that long URL.
    -The user can see the list of URLs they registered using an Endpoint.
      If we browse any shortened URL in the browser, it should redirect us to the actual URL (You should create a simple redirect web route for this, not an API route).

## v2:

    -Manage multiple versioning of the API.
    -Keep count of the visits of the short URLs.

## Remember:

No need to implement a UI.
In our last live class, we explained how you should implement this assignment. If you missed the class, make sure to revisit the recorded video of the live class!

Good luck!
