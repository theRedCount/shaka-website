# LulSeb Docker Setup

Questo setup Docker utilizza Apache HTTP Server per servire il sito web LulSeb con le seguenti caratteristiche:

## Struttura

- **app/website** → Servito sulla root (http://localhost:38080/)
- **app/risorse** → Servito con directory indexing su (http://localhost:38080/risorse/)
- **app/template** → Servito con directory indexing su (http://localhost:38080/template/)

## Caratteristiche

✅ **Live Editing**: Tutti i file sono montati come volumi, le modifiche sono immediate  
✅ **Directory Indexing**: Abilitato per le cartelle risorse e template  
✅ **Compressione**: Gzip abilitato per migliori performance  
✅ **Security Headers**: Headers di sicurezza configurati  
✅ **URL Rewriting**: Supporto per URL SEO-friendly  

## Come usare

### 1. Avvia il container
```bash
docker-compose up -d
```

### 2. Accedi al sito
- **Sito principale**: http://localhost:38080/
- **Risorse**: http://localhost:38080/risorse/
- **Template**: http://localhost:38080/template/

### 3. Modifica i file
Puoi modificare qualsiasi file nelle cartelle:
- `app/website/` - Il sito principale
- `app/risorse/` - File di risorse (immagini, documenti, etc.)
- `app/template/` - Template e file HTML

Le modifiche saranno visibili immediatamente nel browser.

### 4. Ferma il container
```bash
docker-compose down
```

## Log

Per vedere i log di Apache:
```bash
docker-compose logs -f apache-web
```

## Troubleshooting

### Cambiare porta
Se la porta 38080 è occupata, modifica nel `docker-compose.yml`:
```yaml
ports:
  - "3000:80"  # Cambia 38080 con la porta desiderata
```

### Riavviare il servizio
```bash
docker-compose restart apache-web
```

### Rebuilding
Se modifichi la configurazione Apache:
```bash
docker-compose down
docker-compose up -d
```