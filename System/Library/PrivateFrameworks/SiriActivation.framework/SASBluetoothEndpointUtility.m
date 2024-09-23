@implementation SASBluetoothEndpointUtility

- (void)_setEndpointTypeWithNotification:(id)a3
{
  NSObject *serialBluetoothEndpointQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  serialBluetoothEndpointQueue = self->_serialBluetoothEndpointQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__SASBluetoothEndpointUtility__setEndpointTypeWithNotification___block_invoke;
  v5[3] = &unk_1E91FBE70;
  objc_copyWeak(&v6, &location);
  dispatch_async(serialBluetoothEndpointQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __64__SASBluetoothEndpointUtility__setEndpointTypeWithNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  os_log_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  char v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pickableRoutesForCategory:andMode:", *MEMORY[0x1E0CFEB78], CFSTR("SpeechRecognition"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    v6 = (os_log_t *)MEMORY[0x1E0CFE6A0];
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v21;
      v9 = (_QWORD *)MEMORY[0x1E0D481C0];
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", *v9, (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if ((v13 & 1) != 0)
          break;
        if (v7 == ++v10)
        {
          v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D480D8]);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_14;
    }
    else
    {
LABEL_10:

    }
    v14 = (id)*MEMORY[0x1E0D48100];
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      __64__SASBluetoothEndpointUtility__setEndpointTypeWithNotification___block_invoke_cold_1();
LABEL_14:
    objc_msgSend(WeakRetained, "_endpointType", (_QWORD)v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v14);

    if ((v16 & 1) == 0)
    {
      v17 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        objc_msgSend(WeakRetained, "_endpointType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v25 = "-[SASBluetoothEndpointUtility _setEndpointTypeWithNotification:]_block_invoke";
        v26 = 2112;
        v27 = v19;
        v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s Endpoint type changed, from %@ to %@.", buf, 0x20u);

      }
      objc_msgSend(WeakRetained, "_setEndpointType:", v14);
    }

  }
}

- (NSString)_endpointType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

void __64__SASBluetoothEndpointUtility__setEndpointTypeWithNotification___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s Endpoint type is not found from AVSystemController, setting it to %@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (SASBluetoothEndpointUtility)init
{
  SASBluetoothEndpointUtility *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialBluetoothEndpointQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SASBluetoothEndpointUtility;
  v2 = -[SASBluetoothEndpointUtility init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.siri.SerialBluetoothEndpointQueue", 0);
    serialBluetoothEndpointQueue = v2->_serialBluetoothEndpointQueue;
    v2->_serialBluetoothEndpointQueue = (OS_dispatch_queue *)v3;

    -[SASBluetoothEndpointUtility _registerListenersAndSetEndpointTypeWithNotification:](v2, "_registerListenersAndSetEndpointTypeWithNotification:", 0);
  }
  return v2;
}

- (BOOL)isConnectedToBluetoothVehicle
{
  NSString *endpointType;
  NSObject *v4;

  endpointType = self->_endpointType;
  if (endpointType)
    return -[NSString isEqualToString:](endpointType, "isEqualToString:", *MEMORY[0x1E0D48108]);
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    -[SASBluetoothEndpointUtility isConnectedToBluetoothVehicle].cold.1(v4);
  return 0;
}

- (void)dealloc
{
  void *v3;
  NSString *endpointType;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  endpointType = self->_endpointType;
  self->_endpointType = 0;

  v5.receiver = self;
  v5.super_class = (Class)SASBluetoothEndpointUtility;
  -[SASBluetoothEndpointUtility dealloc](&v5, sel_dealloc);
}

- (void)_registerListenersAndSetEndpointTypeWithNotification:(id)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  os_log_t *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)MEMORY[0x1E0D47E50];
  v7 = (_QWORD *)MEMORY[0x1E0D48040];
  v8 = *MEMORY[0x1E0D48040];
  v21[0] = *MEMORY[0x1E0D47E50];
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D48288];
  v18 = 0;
  v11 = objc_msgSend(v5, "setAttribute:forKey:error:", v9, v10, &v18);
  v12 = v18;
  v13 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    -[SASBluetoothEndpointUtility _registerListenersAndSetEndpointTypeWithNotification:].cold.1();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__registerListenersAndSetEndpointTypeWithNotification_, *MEMORY[0x1E0D48208], v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__setEndpointTypeWithNotification_, *v6, v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__setEndpointTypeWithNotification_, *v7, v5);

  -[SASBluetoothEndpointUtility _setEndpointTypeWithNotification:](self, "_setEndpointTypeWithNotification:", 0);
  v17 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SASBluetoothEndpointUtility _registerListenersAndSetEndpointTypeWithNotification:]";
    _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_INFO, "%s Registered AVSystemController listeners", buf, 0xCu);
  }

}

- (void)_setEndpointType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointType, 0);
  objc_storeStrong((id *)&self->_serialBluetoothEndpointQueue, 0);
}

- (void)isConnectedToBluetoothVehicle
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SASBluetoothEndpointUtility isConnectedToBluetoothVehicle]";
  _os_log_error_impl(&dword_1D132F000, log, OS_LOG_TYPE_ERROR, "%s This should hopefully not happen, endpointType not initialized before called, returning as not Bluetooth.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_registerListenersAndSetEndpointTypeWithNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s Failed to subscribe to AVSystemController notifications due to error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
