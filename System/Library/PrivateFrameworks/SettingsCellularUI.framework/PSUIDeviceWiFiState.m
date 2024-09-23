@implementation PSUIDeviceWiFiState

+ (id)sharedInstance
{
  if (qword_253E96F78 != -1)
    dispatch_once(&qword_253E96F78, &__block_literal_global);
  return (id)_MergedGlobals_53;
}

void __37__PSUIDeviceWiFiState_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUIDeviceWiFiState initPrivate]([PSUIDeviceWiFiState alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_53;
  _MergedGlobals_53 = (uint64_t)v0;

}

- (id)initPrivate
{
  PSUIDeviceWiFiState *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSUIDeviceWiFiState;
  v2 = -[PSUIDeviceWiFiState init](&v5, sel_init);
  objc_msgSend(MEMORY[0x24BDE07E8], "sharedDefaultEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("path"), 5, 0);

  return v2;
}

- (PSUIDeviceWiFiState)init
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[PSUIDeviceWiFiState getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[PSUIDeviceWiFiState init]";
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDE07E8], "sharedDefaultEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("path"));

  v4.receiver = self;
  v4.super_class = (Class)PSUIDeviceWiFiState;
  -[PSUIDeviceWiFiState dealloc](&v4, sel_dealloc);
}

- (BOOL)isConnectedOverWiFi
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE07E8], "sharedDefaultEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PSUIDeviceWiFiState getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_2161C6000, v6, OS_LOG_TYPE_ERROR, "[NWPathEvaluator path] empty", (uint8_t *)&v9, 2u);
    }
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "status") != 1)
  {
    -[PSUIDeviceWiFiState getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Network path is not available", (uint8_t *)&v9, 2u);
    }
LABEL_11:
    LOBYTE(v5) = 0;
    goto LABEL_12;
  }
  v5 = objc_msgSend(v4, "usesInterfaceType:", 1);
  -[PSUIDeviceWiFiState getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "OFF";
    if (v5)
      v7 = "ON";
    v9 = 136315138;
    v10 = v7;
    _os_log_debug_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEBUG, "WiFi : %s", (uint8_t *)&v9, 0xCu);
  }
LABEL_12:

  return v5;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("wifi.st"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__PSUIDeviceWiFiState_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __70__PSUIDeviceWiFiState_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "-[PSUIDeviceWiFiState observeValueForKeyPath:ofObject:change:context:]_block_invoke";
    v5 = 2112;
    v6 = CFSTR("PSWiFiConnectivityChanged");
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PSWiFiConnectivityChanged"), 0);

}

@end
