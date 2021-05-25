FROM alpine
RUN apk update && apk add python3 && apk add py3-pip
# Copiando todos os arquivos do diretorio corrente para o dir api_simulator dentro do
# do diretorio raiz do container
COPY . /api_simulator

# Setando diretorio padrao
WORKDIR /api_simulator

# Instalando dependencias
RUN python3 -m venv .venv && \
	source .venv/bin/activate && \
	pip3 install -r requirements.txt

# Expor a porta do container
ENV APP_PORT=59980

# Executando app quando o container inicializar
CMD [ "/api_simulator/.venv/bin/python3", "/api_simulator/api-simulator.py" ] 
