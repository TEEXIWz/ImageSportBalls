FROM python:3.9
WORKDIR /ImageSportBalls
COPY ./requirements.txt /ImageSportBalls/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /ImageSportBalls/requirements.txt

COPY ./app /ImageSportBalls/app

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 -y

ENV PYTHONPATH="${PYTHONPATH}:/ImageSportBalls"

CMD [ "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]