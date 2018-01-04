# JS Dotfiles

## Dependencies

#### ESLint

Eslint dependencies

1. Install ESlint

```
npm install -g eslint
npm insatll -g eslint-plugin-import
```

2. Install (AirBnB Base style plugin)[https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb-base]

```
// Install all dependencies for it, may not need anything else
npm info "eslint-config-airbnb-base@latest" peerDependencies

npm install -g eslint-config-airbnb-base
```

3. Intall Prettier config to disable rules managed in Prettier

```
npm install -g eslint-config-prettier
```

#### Prettier

1. Install Prettier

```
npm install -g prettier
```



## TODO

Make prettier use version from the project, and then global if not present.