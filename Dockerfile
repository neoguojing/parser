FROM python:3.7

WORKDIR /pyresparser
COPY . .

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -U pip setuptools virtualenv --force-reinstall  \
 && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir -r requirements.txt \
 && python setup.py install \
 && pip install en_core_web_sm-2.1.0.tar.gz \
 && cp -r nltk_data /usr/local/nltk_data

EXPOSE 10001

CMD ["python", "run", "parser.py"]