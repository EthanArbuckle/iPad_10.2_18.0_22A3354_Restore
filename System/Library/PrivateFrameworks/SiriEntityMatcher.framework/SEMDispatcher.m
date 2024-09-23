@implementation SEMDispatcher

+ (void)initialize
{
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2463130D8;
  block[3] = &unk_251783388;
  block[4] = a1;
  if (qword_25441F948 != -1)
    dispatch_once(&qword_25441F948, block);
  return (id)qword_25441F950;
}

- (SEMDispatcher)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMDispatcher)initWithIndexSiteManager:(id)a3 settings:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  SEMDispatcher *v12;
  SEMDispatcher *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SEMDispatcher;
  v12 = -[SEMDispatcher init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_indexSiteManager, a3);
    objc_storeStrong((id *)&v13->_settings, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (void)setupXPCListeners
{
  id v3;
  const char *v4;
  NSXPCListener *v5;
  NSXPCListener *adminServiceListener;
  const char *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  CCSetChangeXPCListener *v12;
  CCSetChangeXPCListener *setChangeListener;
  _QWORD v14[5];

  if (!self->_adminServiceListener)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1998]);
    v5 = (NSXPCListener *)objc_msgSend_initWithMachServiceName_(v3, v4, (uint64_t)CFSTR("com.apple.siri.inference.EntityMatcher.admin"));
    adminServiceListener = self->_adminServiceListener;
    self->_adminServiceListener = v5;

    objc_msgSend_setDelegate_(self->_adminServiceListener, v7, (uint64_t)self);
    objc_msgSend_resume(self->_adminServiceListener, v8, v9);
  }
  if (!self->_setChangeListener)
  {
    v10 = objc_alloc(MEMORY[0x24BE156F0]);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_2463133CC;
    v14[3] = &unk_251783670;
    v14[4] = self;
    v12 = (CCSetChangeXPCListener *)objc_msgSend_initWithIdentifier_batchHandlerBlock_queue_useCase_(v10, v11, (uint64_t)CFSTR("com.apple.siri.inference.EntityMatcher"), v14, self->_queue, 0x251784FD0);
    setChangeListener = self->_setChangeListener;
    self->_setChangeListener = v12;

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  const char *v7;
  id v8;
  NSObject *v9;
  char ShouldAcceptNewConnection;
  int v12;
  const char *v13;
  __int16 v14;
  NSXPCListener *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (NSXPCListener *)a3;
  v8 = a4;
  if (self->_adminServiceListener == v6)
  {
    ShouldAcceptNewConnection = objc_msgSend__adminServiceShouldAcceptNewConnection_(self, v7, (uint64_t)v8);
  }
  else
  {
    v9 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[SEMDispatcher listener:shouldAcceptNewConnection:]";
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, "%s Unrecognized listener passed to delegate: %@", (uint8_t *)&v12, 0x16u);
    }
    ShouldAcceptNewConnection = 0;
  }

  return ShouldAcceptNewConnection;
}

- (BOOL)_adminServiceShouldAcceptNewConnection:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  SEMAdminConnection *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_valueForEntitlement_(v4, v5, (uint64_t)CFSTR("com.apple.siri.inference.EntityMatcher.admin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v7, (uint64_t)&unk_25756EF10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExportedInterface_(v4, v9, (uint64_t)v8);

    v10 = [SEMAdminConnection alloc];
    v12 = (void *)objc_msgSend_initWithSettings_indexSiteManager_queue_(v10, v11, (uint64_t)self->_settings, self->_indexSiteManager, self->_queue);
    objc_msgSend_setExportedObject_(v4, v13, (uint64_t)v12);

    objc_msgSend_resume(v4, v14, v15);
    v16 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v17 = v16;
      v25 = 136315394;
      v26 = "-[SEMDispatcher _adminServiceShouldAcceptNewConnection:]";
      v27 = 1024;
      v28 = objc_msgSend_processIdentifier(v4, v18, v19);
      v20 = "%s New connection established to process with pid=(%d)";
LABEL_6:
      _os_log_impl(&dword_2462C4000, v17, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v25, 0x12u);

    }
  }
  else
  {
    v21 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v17 = v21;
      v25 = 136315394;
      v26 = "-[SEMDispatcher _adminServiceShouldAcceptNewConnection:]";
      v27 = 1024;
      v28 = objc_msgSend_processIdentifier(v4, v22, v23);
      v20 = "%s Connecting process with pid=(%d) is not entitled for admin service - rejecting connection.";
      goto LABEL_6;
    }
  }

  return v6 != 0;
}

- (void)runMaintenanceWithShouldDefer:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  int isEvaluationEnabled;
  NSObject *v9;
  const char *v10;
  const __CFString *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)os_transaction_create();
  isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(self->_settings, v6, v7);
  v9 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("Running");
    if (isEvaluationEnabled)
      v11 = CFSTR("Evaluation enabled. Ignoring");
    v12 = 136315394;
    v13 = "-[SEMDispatcher runMaintenanceWithShouldDefer:]";
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_2462C4000, v9, OS_LOG_TYPE_INFO, "%s %@ Maintenance", (uint8_t *)&v12, 0x16u);
  }
  if ((isEvaluationEnabled & 1) == 0)
    objc_msgSend_performMaintenance_(self->_indexSiteManager, v10, (uint64_t)v4);

}

- (void)handleSettingsChange
{
  const char *v3;
  uint64_t v4;
  id v5;

  v5 = (id)os_transaction_create();
  objc_msgSend_handleSettingsChange(self->_indexSiteManager, v3, v4);

}

- (void)handleXPCEvent:(id)a3
{
  void *v4;
  const char *string;
  const char *v6;
  __CFString *v7;
  const char *v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  int isEvaluationEnabled;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  const __CFString *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x24BDACF50]);
  objc_msgSend_stringWithUTF8String_(v4, v6, (uint64_t)string);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("sem_handling_event:%@"), v7);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_cStringUsingEncoding_(v9, v10, 4);
  v11 = (void *)os_transaction_create();
  if ((objc_msgSend_isEqualToString_(v7, v12, *MEMORY[0x24BE08DE8]) & 1) != 0
    || objc_msgSend_isEqualToString_(v7, v13, *MEMORY[0x24BE094A8]))
  {
    isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(self->_settings, v13, v14);
    v16 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v19 = CFSTR("Handling");
      *(_DWORD *)buf = 136315650;
      v24 = "-[SEMDispatcher handleXPCEvent:]";
      v25 = 2112;
      if (isEvaluationEnabled)
        v19 = CFSTR("Evaluation enabled. Ignoring");
      v26 = v19;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_2462C4000, v16, OS_LOG_TYPE_INFO, "%s %@ settings change notification: %@", buf, 0x20u);
    }
    if ((isEvaluationEnabled & 1) == 0)
      objc_msgSend_handleSettingsChange(self, v17, v18);
  }
  else if (objc_msgSend_isEqual_(v7, v13, (uint64_t)CFSTR("com.apple.sysdiagnose.sysdiagnoseStarted")))
  {
    v20 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SEMDispatcher handleXPCEvent:]";
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_2462C4000, v20, OS_LOG_TYPE_INFO, "%s Handling sysdiagnose started notification: %@", buf, 0x16u);
    }
    objc_msgSend_handleSysdiagnoseStarted(self->_indexSiteManager, v21, v22);
  }

}

- (void)handleSetChangeBatch:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  int isEvaluationEnabled;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  const __CFString *v12;
  SEMIndexSiteManager *indexSiteManager;
  void *v14;
  const char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)os_transaction_create();
  isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(self->_settings, v6, v7);
  v9 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v12 = CFSTR("Handling");
    v16 = 136315650;
    v17 = "-[SEMDispatcher handleSetChangeBatch:]";
    v18 = 2112;
    if (isEvaluationEnabled)
      v12 = CFSTR("Evaluation enabled. Ignoring");
    v19 = v12;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_2462C4000, v9, OS_LOG_TYPE_INFO, "%s %@ Cascade change notification for sets: %@", (uint8_t *)&v16, 0x20u);
  }
  if ((isEvaluationEnabled & 1) == 0)
  {
    indexSiteManager = self->_indexSiteManager;
    objc_msgSend_allObjects(v4, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleUpdatedSets_(indexSiteManager, v15, (uint64_t)v14);

  }
}

- (id)administrator
{
  SEMAdministrator *v3;
  SEMAdminConnection *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = [SEMAdministrator alloc];
  v4 = [SEMAdminConnection alloc];
  v6 = (void *)objc_msgSend_initWithSettings_indexSiteManager_queue_(v4, v5, (uint64_t)self->_settings, self->_indexSiteManager, self->_queue);
  v8 = (void *)objc_msgSend_initWithAdminService_timeout_queue_(v3, v7, (uint64_t)v6, self->_queue, 30.0);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setChangeListener, 0);
  objc_storeStrong((id *)&self->_adminServiceListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_indexSiteManager, 0);
}

@end
