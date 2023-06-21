from locust import HttpUser, task

class VisitCount(HttpUser):
    @task
    def visit_count(self):
        self.client.get("/")