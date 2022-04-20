

* db https://dbdiagram.io/d/625f564d1072ae0b6ab11b1a

Rodar Bundler
```bash
bundler install
```
Rodar migrate
```bash
rails db:migrat
```

Rodar servidor rails

```bash
rails s
```

#Request

* user/create
POST
```bash
{
    "name": "",
    "email": ",
    "password": ""
}
```
* user/login
POST
```bash
{
    "email": "",
    "password": ""
}
```

## a partir daqui só é possivel fazer request logado


* contact/create
POST
```bash
{
    "name": "",
    "relationship": "",
    "phone": ""
}
```
Phone é um parametro não obrigatorio

* contact/findContacts
GET
Nenhum parametro (apenas contatos salvo pela conta)

* contact/deleteContacts
POST
```bash
{
    "id": ""
}
```
Pegar id no find


* contact/updateContacts
POST
```bash
{
    "id": "",
    "name": "",
    "relationship": "",
    "phone": ""
}
```
Apenas o id é obrigatorio

* user/sign_out

Deslogar do usuário atual

* ...
