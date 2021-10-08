# Local developemtn tips

## Debugging

Reference Root from main typescript code in package.json

```json
  "devDependencies": {
    "@chimpwizards/wand": "file:../../main/src",
  }
```

Before submiting code revert back to

```json
  "devDependencies": {
    "@chimpwizards/wand": "^1.0.50",
  }
```
