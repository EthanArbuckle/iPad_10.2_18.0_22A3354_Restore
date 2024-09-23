@implementation SVXAudioServicesUtils

- (BOOL)shouldPrewarmAudioServicesActivate
{
  return MGGetProductType() != 1540760353;
}

- (BOOL)audioServicesActivateWithTimeout
{
  os_log_t *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SVXAudioServicesUtils audioServicesActivateWithTimeout]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Activating audio services with timeout...", (uint8_t *)&v8, 0xCu);
  }
  v5 = -[SVXAudioServicesUtils _activate](self, "_activate");
  v6 = *v3;
  if (v5)
  {
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[SVXAudioServicesUtils audioServicesActivateWithTimeout]";
      v10 = 1024;
      v11 = v5;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s Failed to activate audio services with timeout. (result = %d)", (uint8_t *)&v8, 0x12u);
    }
  }
  else if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SVXAudioServicesUtils audioServicesActivateWithTimeout]";
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Activated audio services with timeout.", (uint8_t *)&v8, 0xCu);
  }
  return v5 == 0;
}

- (int)_activate
{
  int inPropertyData;

  inPropertyData = 1;
  return AudioServicesSetProperty(0x61637474u, 0, 0, 4u, &inPropertyData);
}

@end
