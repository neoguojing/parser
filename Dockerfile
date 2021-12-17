FROM python:3.7

WORKDIR /pyresparser
COPY . .

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -U pip setuptools virtualenv --force-reinstall  \
 && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir -r requirements.txt \
 && python setup.py install \
 && pip install en_core_web_sm-2.1.0.tar.gz \
 && cp -r nltk_data /usr/local/nltk_data

EXPOSE 8501

CMD ["streamlit", "run", "cv_parser.py", "--browser.serverAddress=0.0.0.0", "--server.maxUploadSize=100"]