#!/bin/bash

# Script di utilità per gestire il container shaka-website

case "$1" in
    start)
        echo "🚀 Avvio del container shaka-website..."
        docker-compose up -d
        echo "✅ Container avviato!"
        echo "🌐 Sito disponibile su: http://localhost:38080"
        echo "📁 Risorse: http://localhost:38080/risorse/"
        echo "📄 Template: http://localhost:38080/template/"
        ;;
    stop)
        echo "🛑 Fermando il container..."
        docker-compose down
        echo "✅ Container fermato!"
        ;;
    restart)
        echo "🔄 Riavviando il container..."
        docker-compose restart
        echo "✅ Container riavviato!"
        ;;
    logs)
        echo "📋 Mostrando i log..."
        docker-compose logs -f apache-web
        ;;
    status)
        echo "📊 Status del container:"
        docker-compose ps
        ;;
    *)
        echo "🔧 Uso: $0 {start|stop|restart|logs|status}"
        echo ""
        echo "Comandi disponibili:"
        echo "  start   - Avvia il container"
        echo "  stop    - Ferma il container"
        echo "  restart - Riavvia il container"
        echo "  logs    - Mostra i log"
        echo "  status  - Mostra lo status"
        exit 1
        ;;
esac