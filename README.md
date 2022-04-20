

* db https://dbdiagram.io/d/625f564d1072ae0b6ab11b1a

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
{
    "name": "",
    "email": ",
    "password": ""
}

* user/login
POST
{
    "email": "",
    "password": ""
}


## a partir daqui só é possivel fazer request logado


* contact/create
POST

{
    "name": "",
    "relationship": "",
    "phone": ""
}
Phone é um parametro não obrigatorio

* contact/findContacts
GET
Nenhum parametro (apenas contatos salvo pela conta)

* contact/deleteContacts
POST
{
    "id": ""
}
Pegar id no find


* contact/updateContacts
POST

{
    "id": "9",
    "name": "Brunooo",
    "relationship": "goku2447",
    "phone": "7317317"
}
Apenas o id é obrigatorio

* user/sign_out

Deslogar do usuário atual

* ...
