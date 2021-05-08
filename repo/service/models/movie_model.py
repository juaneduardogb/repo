from typing import List

from pydantic import BaseModel


class MovieModel(BaseModel):
    title:str
    keywords: List[str] = []
    director: str
    rating:str
    year:int
