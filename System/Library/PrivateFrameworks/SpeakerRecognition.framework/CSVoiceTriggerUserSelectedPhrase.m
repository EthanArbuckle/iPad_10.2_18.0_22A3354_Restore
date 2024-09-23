@implementation CSVoiceTriggerUserSelectedPhrase

- (CSVoiceTriggerUserSelectedPhrase)initWithEndpointId:(id)a3
{
  return -[CSVoiceTriggerUserSelectedPhrase initWithEndpointId:vtPreferences:](self, "initWithEndpointId:vtPreferences:", a3, 0);
}

- (CSVoiceTriggerUserSelectedPhrase)initWithEndpointId:(id)a3 vtPreferences:(id)a4
{
  id v7;
  id v8;
  CSVoiceTriggerUserSelectedPhrase *v9;
  CSVoiceTriggerUserSelectedPhrase *v10;
  VTPreferences *v11;
  VTPreferences *vtPrefrences;
  uint64_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSVoiceTriggerUserSelectedPhrase;
  v9 = -[CSVoiceTriggerUserSelectedPhrase init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointDeviceId, a3);
    if (v8)
    {
      v11 = (VTPreferences *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
      v11 = (VTPreferences *)objc_claimAutoreleasedReturnValue();
    }
    vtPrefrences = v10->_vtPrefrences;
    v10->_vtPrefrences = v11;

    objc_msgSend(MEMORY[0x24BE28488], "getSerialQueue:qualityOfService:", CFSTR("com.apple.com.CSUserSelectedVTPhraseMonitor"), 33);
    v13 = objc_claimAutoreleasedReturnValue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    v15 = -[CSVoiceTriggerUserSelectedPhrase _fetchUserSelectedPhraseType](v10, "_fetchUserSelectedPhraseType");
    v10->_uSelectedPhraseType = v15;
    v10->_mphSelected = -[CSVoiceTriggerUserSelectedPhrase _isMultiPhrase:](v10, "_isMultiPhrase:", v15);
    -[CSVoiceTriggerUserSelectedPhrase _registerForNotification](v10, "_registerForNotification");
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__CSVoiceTriggerUserSelectedPhrase_setDelegate___block_invoke;
  v7[3] = &unk_24CC85EE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)dealloc
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSVoiceTriggerUserSelectedPhrase dealloc]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BEC1DF8], 0);
  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerUserSelectedPhrase;
  -[CSVoiceTriggerUserSelectedPhrase dealloc](&v5, sel_dealloc);
}

- (unint64_t)_fetchUserSelectedPhraseType
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  NSObject *v6;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE28488], "isDarwinOS"))
    v3 = 3;
  else
    v3 = 2 * (self->_endpointDeviceId != 0);
  v4 = -[VTPreferences getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:](self->_vtPrefrences, "getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:", v3);
  v5 = 0;
  if (v5)
  {
    v6 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSVoiceTriggerUserSelectedPhrase _fetchUserSelectedPhraseType]";
      v10 = 2112;
      v11 = v5;
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s Error fetching the user selected phrase type %@", buf, 0x16u);
    }
  }

  return v4;
}

- (BOOL)_isMultiPhrase:(unint64_t)a3
{
  return a3 == 1;
}

- (void)vtPhraseTypeDidChangeNotificationReceived
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__CSVoiceTriggerUserSelectedPhrase_vtPhraseTypeDidChangeNotificationReceived__block_invoke;
  v4[3] = &unk_24CC85AB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_registerForNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_vtPhraseTypeDidChangeNotificationReceived, (CFStringRef)*MEMORY[0x24BEC1DF8], 0, CFNotificationSuspensionBehaviorDrop);
}

- (unint64_t)userSelectedPhraseType
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__CSVoiceTriggerUserSelectedPhrase_userSelectedPhraseType__block_invoke;
  v5[3] = &unk_24CC864E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)multiPhraseSelected
{
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CSVoiceTriggerUserSelectedPhrase_multiPhraseSelected__block_invoke;
  block[3] = &unk_24CC849E0;
  block[4] = &v8;
  objc_copyWeak(&v6, &location);
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

- (CSVoiceTriggerUserSelectedPhraseDelegate)delegate
{
  return (CSVoiceTriggerUserSelectedPhraseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (VTPreferences)vtPrefrences
{
  return self->_vtPrefrences;
}

- (void)setVtPrefrences:(id)a3
{
  objc_storeStrong((id *)&self->_vtPrefrences, a3);
}

- (NSUUID)endpointDeviceId
{
  return self->_endpointDeviceId;
}

- (void)setEndpointDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_endpointDeviceId, a3);
}

- (BOOL)mphSelected
{
  return self->_mphSelected;
}

- (void)setMphSelected:(BOOL)a3
{
  self->_mphSelected = a3;
}

- (unint64_t)uSelectedPhraseType
{
  return self->_uSelectedPhraseType;
}

- (void)setUSelectedPhraseType:(unint64_t)a3
{
  self->_uSelectedPhraseType = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endpointDeviceId, 0);
  objc_storeStrong((id *)&self->_vtPrefrences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__CSVoiceTriggerUserSelectedPhrase_multiPhraseSelected__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(WeakRetained, "mphSelected");

}

uint64_t __58__CSVoiceTriggerUserSelectedPhrase_userSelectedPhraseType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

void __77__CSVoiceTriggerUserSelectedPhrase_vtPhraseTypeDidChangeNotificationReceived__block_invoke(uint64_t a1)
{
  id *v1;
  id v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "setUSelectedPhraseType:", objc_msgSend(v2, "_fetchUserSelectedPhraseType"));

  WeakRetained = objc_loadWeakRetained(v1);
  v4 = objc_msgSend(WeakRetained, "mphSelected");

  v5 = objc_loadWeakRetained(v1);
  v6 = objc_msgSend(v5, "_isMultiPhrase:", objc_msgSend(v5, "uSelectedPhraseType"));

  if (v4 != (_DWORD)v6)
  {
    v7 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = "-[CSVoiceTriggerUserSelectedPhrase vtPhraseTypeDidChangeNotificationReceived]_block_invoke";
      v16 = 1024;
      v17 = v4;
      v18 = 1024;
      v19 = v6;
      _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s User multi-phrase selection change from %d -> %d", (uint8_t *)&v14, 0x18u);
    }
    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "setMphSelected:", v6);

    v9 = objc_loadWeakRetained(v1);
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_loadWeakRetained(v1);
      objc_msgSend(v11, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_loadWeakRetained(v1);
      objc_msgSend(v12, "CSVoiceTriggerUserSelectedPhraseDidChange:", objc_msgSend(v13, "mphSelected"));

    }
  }
}

id __48__CSVoiceTriggerUserSelectedPhrase_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

@end
