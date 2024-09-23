@implementation SOSKappaManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SOSKappaManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (id)sharedInstance_inst_0;
}

void __33__SOSKappaManager_sharedInstance__block_invoke(uint64_t a1)
{
  const char *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  dispatch_queue_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SOS.queue.%@.%p"), objc_opt_class(), *(_QWORD *)(a1 + 32));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = (const char *)objc_msgSend(v7, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(v2, v3);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SOSKappaManager_sharedInstance__block_invoke_2;
  block[3] = &unk_1E5F76C80;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  v6 = v4;
  dispatch_sync(v6, block);

}

void __33__SOSKappaManager_sharedInstance__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithQueue:", *(_QWORD *)(a1 + 32));
  v2 = (void *)sharedInstance_inst_0;
  sharedInstance_inst_0 = v1;

}

- (SOSKappaManager)init
{
  -[SOSKappaManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (SOSKappaManager)initWithQueue:(id)a3
{
  NSObject *v5;
  SOSKappaManager *v6;
  NSObject *v7;
  uint64_t v8;
  NSHashTable *observers;
  const char *v10;
  NSObject *v11;
  id v12;
  SOSKappaManager *v13;
  NSObject *v14;
  _QWORD handler[4];
  id v17;
  id buf[2];
  objc_super v19;

  v5 = a3;
  dispatch_assert_queue_V2(v5);
  if (+[SOSEntitlement currentProcessHasEntitlement:](SOSEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.sos.trigger")))
  {
    v19.receiver = self;
    v19.super_class = (Class)SOSKappaManager;
    v6 = -[SOSKappaManager init](&v19, sel_init);
    if (v6)
    {
      sos_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,init", (uint8_t *)buf, 2u);
      }

      objc_storeStrong((id *)&v6->_serialQueue, a3);
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v8 = objc_claimAutoreleasedReturnValue();
      observers = v6->_observers;
      v6->_observers = (NSHashTable *)v8;

      objc_initWeak(buf, v6);
      v10 = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
      v11 = MEMORY[0x1E0C80D38];
      v12 = MEMORY[0x1E0C80D38];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __33__SOSKappaManager_initWithQueue___block_invoke;
      handler[3] = &unk_1E5F76CA8;
      objc_copyWeak(&v17, buf);
      notify_register_dispatch(v10, &v6->_connectionRequestNotificationToken, v11, handler);

      -[SOSKappaManager forceStartConnection](v6, "forceStartConnection");
      objc_destroyWeak(&v17);
      objc_destroyWeak(buf);
    }
    self = v6;
    v13 = self;
  }
  else
  {
    sos_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AF4DC000, v14, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,missing SOSTriggerEntitlement", (uint8_t *)buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

void __33__SOSKappaManager_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "serialQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__SOSKappaManager_initWithQueue___block_invoke_2;
    block[3] = &unk_1E5F75E48;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void __33__SOSKappaManager_initWithQueue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t state64;
  uint8_t buf[4];
  char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  notify_get_state(objc_msgSend(*(id *)(a1 + 32), "connectionRequestNotificationToken"), &state64);
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v5 = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
    v6 = 2048;
    v7 = state64;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,handling %s,state,%lld", buf, 0x16u);
  }

  if (state64)
    objc_msgSend(*(id *)(a1 + 32), "forceStartConnection");
}

- (void)dealloc
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  objc_super v5;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
    v4 = self->_connection;
    self->_connection = 0;

  }
  notify_cancel(self->_connectionRequestNotificationToken);
  v5.receiver = self;
  v5.super_class = (Class)SOSKappaManager;
  -[SOSKappaManager dealloc](&v5, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SOSKappaManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__SOSKappaManager_addObserver___block_invoke;
  v7[3] = &unk_1E5F76A08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __31__SOSKappaManager_addObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SOSKappaManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__SOSKappaManager_removeObserver___block_invoke;
  v7[3] = &unk_1E5F76A08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __34__SOSKappaManager_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)triggerKappaWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v13[5];
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,Kappa triggered,%@", buf, 0xCu);
  }

  -[SOSKappaManager serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke;
  block[3] = &unk_1E5F76D20;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v8 = v4;
  dispatch_async(v7, block);

  _Block_object_dispose(&v12, 8);
}

void __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  __int128 v14;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_2;
  v13[3] = &unk_1E5F76CD0;
  v9 = *(_OWORD *)(a1 + 40);
  v4 = (id)v9;
  v14 = v9;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(*(_QWORD *)(v6 + 8) + 40);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_35;
  v10[3] = &unk_1E5F76CF8;
  v12 = v6;
  v11 = v7;
  objc_msgSend(v5, "triggerSOSWithUUID:triggerMechanism:completion:", v8, 7, v10);

}

void __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 3, 0);

}

uint64_t __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_35(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t result;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  _BYTE v19[18];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  switch(a2)
  {
    case 0:
      sos_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_5;
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v18 = 138412290;
      *(_QWORD *)v19 = v9;
      v10 = "SOSKappaManager,successful response to Kappa trigger,%@";
      goto LABEL_16;
    case 1:
    case 3:
    case 4:
    case 6:
      sos_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v18 = 67109378;
        *(_DWORD *)v19 = a2;
        *(_WORD *)&v19[4] = 2112;
        *(_QWORD *)&v19[6] = v5;
        _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,failure response (%d) to Kappa trigger,%@", (uint8_t *)&v18, 0x12u);
      }

      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(NSObject **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = 0;
      goto LABEL_5;
    case 2:
      +[SOSKappaManager currentSOSStatus](SOSKappaManager, "currentSOSStatus");
      v7 = objc_claimAutoreleasedReturnValue();
      sos_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        -[NSObject uuid](v7, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        *(_QWORD *)v19 = v12;
        *(_WORD *)&v19[8] = 2112;
        *(_QWORD *)&v19[10] = v13;
        _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,already active response to Kappa trigger,%@,active flow,%@", (uint8_t *)&v18, 0x16u);

      }
      -[NSObject uuid](v7, "uuid");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      goto LABEL_5;
    case 5:
      sos_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v18 = 138412290;
        *(_QWORD *)v19 = v17;
        v10 = "SOSKappaManager,successful response to Kappa trigger,%@,pushed to paired device";
LABEL_16:
        _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v18, 0xCu);
      }
LABEL_5:

      break;
    default:
      break;
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (void)detectedAnomalyWithElectedDevice:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  sos_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = a3;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,anomaly detected,device,%d", buf, 8u);
  }

  if (a3 == 1)
  {
    -[SOSKappaManager serialQueue](self, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke;
    v9[3] = &unk_1E5F761B8;
    v9[4] = self;
    v10 = v6;
    dispatch_async(v8, v9);

  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

void __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_2;
  v8[3] = &unk_1E5F76708;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_38;
  v6[3] = &unk_1E5F76D48;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "triggerSOSWithUUID:triggerMechanism:completion:", v5, 7, v6);

}

void __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_2_cold_1((uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 3);

}

void __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_38(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2 == 5)
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v9[0]) = 0;
    v5 = "SOSKappaManager,successful response to anomaly detected on paired device";
    goto LABEL_7;
  }
  if (!a2)
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v9[0]) = 0;
    v5 = "SOSKappaManager,successful response to anomaly detected";
LABEL_7:
    v6 = v4;
    v7 = 2;
    goto LABEL_10;
  }
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    goto LABEL_11;
  v9[0] = 67109120;
  v9[1] = a2;
  v5 = "SOSKappaManager,failure response to anomaly detected,%d";
  v6 = v4;
  v7 = 8;
LABEL_10:
  _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)v9, v7);
LABEL_11:

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, unint64_t))(v8 + 16))(v8, +[SOSKappaManager mapServerResponseToKappaResponse:](SOSKappaManager, "mapServerResponseToKappaResponse:", a2));
}

+ (BOOL)isKappaEnabled
{
  return +[SOSUtilities kappaTriggersEmergencySOS](SOSUtilities, "kappaTriggersEmergencySOS");
}

+ (SOSStatus)currentSOSStatus
{
  return +[SOSUtilities mostRecentSOSStatus](SOSUtilities, "mostRecentSOSStatus");
}

- (void)setSendingLocationUpdate:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,sending location updates %d", (uint8_t *)v5, 8u);
  }

}

- (void)updateClientCurrentSOSInitiationState:(int64_t)a3
{
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,initiation state updated to %d", (uint8_t *)v5, 8u);
  }

}

- (void)updateClientCurrentSOSInteractiveState:(int64_t)a3
{
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,interactive state updated to %d", (uint8_t *)v5, 8u);
  }

}

- (void)updateClientCurrentSOSButtonPressState:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,button press state updated", v4, 2u);
  }

}

- (void)dismissClientSOSWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, uint64_t))a3;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,sos dismiss received", v5, 2u);
  }

  v3[2](v3, 1);
}

- (void)didDismissClientSOSBeforeSOSCall:(int64_t)a3
{
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,sos dismissal type is %d", (uint8_t *)v5, 8u);
  }

}

- (void)didUpdateSOSStatus:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  SOSKappaStatus *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SOSKappaManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,receiving update to SOSStatus: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = -[SOSKappaStatus initWithSOSStatus:]([SOSKappaStatus alloc], "initWithSOSStatus:", v4);
  -[SOSKappaStatus setSosKappaState:](v7, "setSosKappaState:", +[SOSKappaManager mapSOSFlowStateToKappaState:](SOSKappaManager, "mapSOSFlowStateToKappaState:", objc_msgSend(v4, "flowState")));
  -[SOSKappaManager updateObserversWithKappaStatus:](self, "updateObserversWithKappaStatus:", v7);

}

- (void)updateObserversWithKappaStatus:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isKappaFlow");
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,updating observers with status: %@", buf, 0xCu);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[SOSKappaManager observers](self, "observers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "copy");

    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "updatedSOSKappaStatus:", v4);
        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }
  }
  else if (v7)
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,not a Kappa flow so not updating observers with status: %@", buf, 0xCu);
  }

}

- (void)setConnection:(id)a3
{
  NSObject *v5;
  NSXPCConnection *v6;
  NSXPCConnection **p_connection;
  NSXPCConnection *connection;
  NSXPCConnection *v9;

  v9 = (NSXPCConnection *)a3;
  -[SOSKappaManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  connection = self->_connection;
  p_connection = &self->_connection;
  v6 = connection;
  if (connection != v9)
  {
    if (v6)
    {
      -[NSXPCConnection invalidate](v6, "invalidate");
      -[NSXPCConnection setInvalidationHandler:](*p_connection, "setInvalidationHandler:", 0);
      -[NSXPCConnection setInterruptionHandler:](*p_connection, "setInterruptionHandler:", 0);
    }
    objc_storeStrong((id *)p_connection, a3);
  }

}

- (NSXPCConnection)connection
{
  NSObject *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  -[SOSKappaManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  connection = self->_connection;
  if (!connection)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.sos"), 4096);
    v6 = self->_connection;
    self->_connection = v5;

    v7 = self->_connection;
    -[SOSKappaManager serialQueue](self, "serialQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v7, "_setQueue:", v8);

    v9 = self->_connection;
    SOSServerInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v9, "setRemoteObjectInterface:", v10);

    v11 = self->_connection;
    SOSClientInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v11, "setExportedInterface:", v12);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_7);
    objc_initWeak(&location, self);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __29__SOSKappaManager_connection__block_invoke_42;
    v17 = &unk_1E5F76638;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &v14);
    -[NSXPCConnection resume](self->_connection, "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __29__SOSKappaManager_connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  sos_default_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AF4DC000, v0, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,SOS server connection interrupted", v1, 2u);
  }

}

void __29__SOSKappaManager_connection__block_invoke_42(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,SOS server connection invalidated", buf, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SOSKappaManager_connection__block_invoke_43;
  block[3] = &unk_1E5F76638;
  objc_copyWeak(&v7, v3);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
}

void __29__SOSKappaManager_connection__block_invoke_43(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

- (void)forceStartConnection
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[SOSKappaManager connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_44);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SOSKappaManager_forceStartConnection__block_invoke_45;
  v5[3] = &unk_1E5F76D90;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "syncState:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__SOSKappaManager_forceStartConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "[WARN] SOSKappaManager,failed to send message on sosd launch due to error %@", (uint8_t *)&v4, 0xCu);
  }

}

void __39__SOSKappaManager_forceStartConnection__block_invoke_45(uint64_t a1)
{
  SOSKappaStatus *v2;
  void *v3;
  SOSKappaStatus *v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  SOSKappaStatus *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = [SOSKappaStatus alloc];
  +[SOSKappaManager currentSOSStatus](SOSKappaManager, "currentSOSStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SOSKappaStatus initWithSOSStatus:](v2, "initWithSOSStatus:", v3);

  -[SOSKappaStatus sosStatus](v4, "sosStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSKappaStatus setSosKappaState:](v4, "setSosKappaState:", +[SOSKappaManager mapSOSFlowStateToKappaState:](SOSKappaManager, "mapSOSFlowStateToKappaState:", objc_msgSend(v5, "flowState")));

  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSKappaManager,successfully connected to sosd with current SOSStatus: %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateObserversWithKappaStatus:", v4);

}

+ (unint64_t)mapServerResponseToKappaResponse:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 6)
    return 0;
  else
    return a3;
}

+ (int64_t)mapSOSFlowStateToKappaState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xB)
    return 0;
  else
    return a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (int)connectionRequestNotificationToken
{
  return self->_connectionRequestNotificationToken;
}

- (void)setConnectionRequestNotificationToken:(int)a3
{
  self->_connectionRequestNotificationToken = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__SOSKappaManager_triggerKappaWithCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1AF4DC000, log, OS_LOG_TYPE_ERROR, "SOSKappaManager,connection failure during Kappa trigger,%@,error,%@", (uint8_t *)&v4, 0x16u);
}

void __63__SOSKappaManager_detectedAnomalyWithElectedDevice_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF4DC000, a2, OS_LOG_TYPE_ERROR, "SOSKappaManager,error from remoteObjectProxyWithErrorHandler: %@", (uint8_t *)&v2, 0xCu);
}

@end
