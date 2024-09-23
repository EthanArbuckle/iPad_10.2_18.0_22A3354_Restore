@implementation POUISettingsManager

- (POUISettingsManager)init
{
  NSObject *v3;
  POUISettingsManager *v4;
  POUIServiceConnection *v5;
  POUIServiceConnection *serviceConnection;
  objc_super v8;

  PO_LOG_POUISettingsManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POUISettingsManager init].cold.1((uint64_t)self, v3);

  v8.receiver = self;
  v8.super_class = (Class)POUISettingsManager;
  v4 = -[POUISettingsManager init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(POUIServiceConnection);
    serviceConnection = v4->_serviceConnection;
    v4->_serviceConnection = v5;

  }
  return v4;
}

- (id)deviceStatus
{
  NSObject *v3;
  POUIServiceConnection *serviceConnection;
  id v5;
  _QWORD v7[5];
  _BYTE buf[24];
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POUISettingsManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[POUISettingsManager deviceStatus]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__POUISettingsManager_deviceStatus__block_invoke;
  v7[3] = &unk_24EC02500;
  v7[4] = buf;
  -[POUIServiceConnection deviceStatusWithCompletion:](serviceConnection, "deviceStatusWithCompletion:", v7);
  v5 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v5;
}

void __35__POUISettingsManager_deviceStatus__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)statusForUserName:(id)a3
{
  id v4;
  NSObject *v5;
  POUIServiceConnection *serviceConnection;
  id v7;
  _QWORD v9[5];
  _BYTE buf[24];
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POUISettingsManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[POUISettingsManager statusForUserName:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  serviceConnection = self->_serviceConnection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__POUISettingsManager_statusForUserName___block_invoke;
  v9[3] = &unk_24EC02528;
  v9[4] = buf;
  -[POUIServiceConnection statusForUser:completion:](serviceConnection, "statusForUser:completion:", v4, v9);
  v7 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v7;
}

void __41__POUISettingsManager_statusForUserName___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)startDeviceAction:(int64_t)a3
{
  NSObject *v5;
  POUIServiceConnection *serviceConnection;
  _QWORD v7[5];
  _BYTE buf[24];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POUISettingsManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[POUISettingsManager startDeviceAction:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v9 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__POUISettingsManager_startDeviceAction___block_invoke;
  v7[3] = &unk_24EC02550;
  v7[4] = buf;
  -[POUIServiceConnection startDeviceAction:completion:](serviceConnection, "startDeviceAction:completion:", a3, v7);
  _Block_object_dispose(buf, 8);
}

uint64_t __41__POUISettingsManager_startDeviceAction___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)startUserAction:(int64_t)a3 forUserName:(id)a4
{
  id v6;
  POUIServiceConnection *serviceConnection;
  _QWORD v8[5];
  _QWORD v9[3];
  char v10;

  v6 = a4;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  serviceConnection = self->_serviceConnection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__POUISettingsManager_startUserAction_forUserName___block_invoke;
  v8[3] = &unk_24EC02550;
  v8[4] = v9;
  -[POUIServiceConnection startAction:forUserName:completion:](serviceConnection, "startAction:forUserName:completion:", a3, v6, v8);
  _Block_object_dispose(v9, 8);

}

uint64_t __51__POUISettingsManager_startUserAction_forUserName___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

- (void)init
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[POUISettingsManager init]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_22307D000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

@end
