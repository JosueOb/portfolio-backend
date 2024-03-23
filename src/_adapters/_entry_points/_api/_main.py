from fastapi import FastAPI

_api = FastAPI()


@_api.get("/")
async def root():
    return {"message": "Hello World"}


def create_api() -> FastAPI:
    return _api
