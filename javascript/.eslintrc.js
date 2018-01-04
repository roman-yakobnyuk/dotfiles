module.exports = {
    extends: ["airbnb-base", "prettier"],
    parserOptions: {
        sourceType: "module",
        ecmaFeatures: {
            jsx: true
        }
    },
    env: {
        es6: true,
        node: true
    },
    rules: {
        radix: 0,
        "no-unused-vars": [1, { vars: "local", args: "none" }],
        "default-case": 0,
        "no-param-reassign": 0
    }
};
