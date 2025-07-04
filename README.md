🚀 Workflow
1️⃣ Cloner le skeleton
```
git clone git@monrepo.com:symfony-docker-skeleton mon-projet
cd mon-projet
```

2️⃣ Lancer Docker

```
make up
```

3️⃣ Créer Symfony

```
make create
```

4️⃣ Installer

```
make install
```

5️⃣ Corriger permissions (si besoin)

```
make perms
```

6️⃣ Configurer la DB

Dans symfony/.env.local :

```
DATABASE_URL="postgresql://symfony:symfony@db:5432/symfony"
```

7️⃣ Accéder
http://localhost:8080