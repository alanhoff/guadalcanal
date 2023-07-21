# Guadalcanal

Experimento para fins educativos sobre como montar um cluster de desktops virtuais utilizando containers e Guacamole.

### Instalação

```
git clone https://github.com/alanhoff/guadalcanal.git
cd guadalcanal

docker compose up -d

# Parar todas as instâncias
docker compose down
```

### Banco de dados

Dentro do arquivo [compose.yaml](./compose.yaml) troque as senhas das variáveis de ambiente `MARIADB_ROOT_PASSWORD` e `MYSQL_PASSWORD` antes de iniciar o projeto pela primeira vez.

O diretório [./database/datadir](./database/datadir) está sendo usado para persistência de dados, assim nenhum dado é perdido se o container for parado.

O script [guacamole.sql](./database/guacamole.sql) é utilizado pelo MariaDB como script de inicialização e será executado quando o container iniciar pela primeira vez. Modifique esse arquivo se você quiser adicionar ou alterar informações no banco de dados quando este for iniciado pela primeira vez.


### Guacamole

A interface gráfica estará disponível no endereço `http://localhost:8080/guacamole` e você poderá ter acesso administrativo utilizando o usuário `guacadmin` e a senha `guacadmin`.

### Desktop virtual

O serviço `desktop-01` contém o sistema operacional Ubuntu com a interface Xfce já instalada, o serviço RDP já está instalado e pode ser acessado pela porta padrão `3389` utilizando o usuário `abc` e a senha `abc`.

Todos os dados presentes no serviço serão apagados quando o container parar, por esse motivo o diretório [./desktop/desktop-01](./desktop/desktop-01) está sendo utilizado para persistir a pasta `$HOME` do usuário `abc`, dados gravados fora da pasta `$HOME` serão perdidos quando o container parar.

Prefira ter um container para cada usuário ao invés de utilizar um container com vários usuários.

### Referências

* [https://guacamole.apache.org/doc/gug/guacamole-docker.html](https://guacamole.apache.org/doc/gug/guacamole-docker.html)
* [https://docs.linuxserver.io/general/container-customization](https://docs.linuxserver.io/general/container-customization)
* [https://docs.linuxserver.io/images/docker-rdesktop](https://docs.linuxserver.io/images/docker-rdesktop)
* [https://hub.docker.com/_/mariadb](https://hub.docker.com/_/mariadb)

### Licença ISC

```
ISC License

Copyright 2023 Alan Hoffmeister

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```