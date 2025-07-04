# Ejecutar como administrador

Write-Host "✅ Configurando reglas de Firewall para RTSP (puerto 554)..."

# Permitir tráfico desde Camara 
New-NetFirewallRule   -DisplayName "Permitir RTSP LAN (192.168.2.102)"    -Direction Inbound   -Protocol TCP   -LocalPort 554   -RemoteAddress 192.168.2.102    -Action Allow   -Profile Private   -Enabled True

# Permitir tráfico desde túnel WARP (172.16.0.2) 
New-NetFirewallRule  -DisplayName "Permitir RTSP desde túnel WARP  (172.16.0.2)"   -Direction Inbound   -Protocol TCP   -LocalPort 554   -RemoteAddress 172.16.0.2  -Action Allow   -Profile Private   -Enabled True

# (Opcional) Permitir tráfico UDP por si RTSP usa UDP también
New-NetFirewallRule -DisplayName "Permitir RTSP UDP desde túnel WARP" -Direction Inbound  -Protocol UDP -LocalPort 554 -RemoteAddress 172.16.0.2 -Action Allow -Profile Private  -Enabled True

Write-Host "✅ Reglas aplicadas con éxito. Reinicia WARP y prueba acceso al NVR."