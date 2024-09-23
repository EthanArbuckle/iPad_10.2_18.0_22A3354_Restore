@implementation PKHostPlugIn

- (NSUUID)supersedingUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSupersededBy:(id)a3
{
  objc_storeWeak((id *)&self->_supersededBy, a3);
}

- (PKHostPlugIn)initWithForm:(id)a3 host:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKHostPlugIn *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  dispatch_queue_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  dispatch_queue_t v22;
  void *v23;
  void *v24;
  NSMutableSet *v25;
  NSMutableSet *requests;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "external");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)PKHostPlugIn;
  v9 = -[PKPlugInCore initWithForm:externalProviders:](&v28, sel_initWithForm_externalProviders_, v6, v8);

  if (v9)
  {
    -[PKHostPlugIn setSourceForm:](v9, "setSourceForm:", v6);
    -[PKHostPlugIn setHost:](v9, "setHost:", v7);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("overrider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
      -[PKHostPlugIn setSupersedingUUID:](v9, "setSupersedingUUID:", v11);

    }
    +[PKCapabilities frameworkQueueAttr](PKCapabilities, "frameworkQueueAttr");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[PKPlugInCore identifier](v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("PKPlugIn sync (%@)"), v14);

    v16 = objc_retainAutorelease(v15);
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), v12);
    -[PKHostPlugIn set_syncQueue:](v9, "set_syncQueue:", v17);

    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[PKPlugInCore identifier](v9, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("PKPlugIn start (%@)"), v19);

    v21 = objc_retainAutorelease(v20);
    v22 = dispatch_queue_create((const char *)objc_msgSend(v21, "UTF8String"), v12);
    -[PKHostPlugIn set_startQueue:](v9, "set_startQueue:", v22);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extensions"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHostPlugIn setDiscoveryExtensions:](v9, "setDiscoveryExtensions:", v23);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("service-extension"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHostPlugIn setServiceExtension:](v9, "setServiceExtension:", v24);

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    requests = v9->_requests;
    v9->_requests = v25;

  }
  return v9;
}

- (void)set_syncQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (void)set_startQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (void)setSourceForm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (void)setServiceExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (void)setHost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (void)setDiscoveryExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (int64_t)userElection
{
  NSObject *v3;
  NSObject *v4;
  int64_t v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[PKHostPlugIn _syncQueue](self, "_syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1AF25A6C4;
  v11[3] = &unk_1E5F40600;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v3, v11);

  pklog_handle_for_category(10);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[PKPlugInCore uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13[3];
    *(_DWORD *)buf = 138544386;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2080;
    v23 = "-[PKHostPlugIn userElection]";
    v24 = 2048;
    v25 = v10;
    _os_log_debug_impl(&dword_1AF254000, v4, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] %s: %ld", buf, 0x34u);

  }
  v5 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (void)updateFromForm:(id)a3 host:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKHostPlugIn;
  v6 = a4;
  -[PKPlugInCore updateFromForm:](&v11, sel_updateFromForm_, a3);
  -[PKHostPlugIn sourceForm](self, "sourceForm", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPlugInCore annotations](self, "annotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v7, "dictionaryChanging:to:", CFSTR("annotations"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHostPlugIn setSourceForm:](self, "setSourceForm:", v10);

  -[PKHostPlugIn setHost:](self, "setHost:", v6);
}

- (NSDictionary)sourceForm
{
  return (NSDictionary *)objc_getProperty(self, a2, 408, 1);
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (OS_dispatch_queue)_syncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 272, 1);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)PKHostPlugIn;
  -[PKPlugInCore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<id<PKPlugIn>: %p; core = %@, instance = [%@], state = %lu, useCount = %d>"),
                 self,
                 v4,
                 v5,
                 -[PKHostPlugIn state](self, "state"),
                 -[PKHostPlugIn useCount](self, "useCount"));

  return (NSString *)v6;
}

- (NSUserDefaults)defaults
{
  PKHostDefaults *v3;
  NSUserDefaults *defaults;

  if (!self->_defaults)
  {
    v3 = -[PKHostDefaults initWithPlugIn:]([PKHostDefaults alloc], "initWithPlugIn:", self);
    defaults = self->_defaults;
    self->_defaults = &v3->super;

  }
  return self->_defaults;
}

- (void)setUserElection:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  pklog_handle_for_category(10);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPlugInCore uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2080;
    v19 = "-[PKHostPlugIn setUserElection:]";
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_1AF254000, v5, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] %s: %ld", buf, 0x34u);

  }
  -[PKHostPlugIn _syncQueue](self, "_syncQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1AF25BCDC;
  v11[3] = &unk_1E5F40628;
  v11[4] = self;
  v11[5] = a3;
  dispatch_sync(v9, v11);

  -[PKHostPlugIn host](self, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setElection:forPlugIn:", a3, self);

}

- (NSDictionary)extensionState
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1AF25BE28;
  v11 = sub_1AF25BE38;
  v12 = 0;
  -[PKHostPlugIn _syncQueue](self, "_syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1AF25BE40;
  v6[3] = &unk_1E5F40600;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  if (!v8[5])
  {
    v8[5] = MEMORY[0x1E0C9AA70];

  }
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)setExtensionState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[PKHostPlugIn _syncQueue](self, "_syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF25BF50;
  block[3] = &unk_1E5F40650;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v5, block);

  -[PKHostPlugIn host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExtensionState:forPlugIn:", v7, self);

}

- (void)suspend
{
  MEMORY[0x1E0DE7D20](self->_pluginConnection, sel_suspend);
}

- (void)resume
{
  -[NSXPCConnection resume](self->_pluginConnection, "resume");
}

- (BOOL)active
{
  return -[PKHostPlugIn state](self, "state") == 1;
}

- (BOOL)spent
{
  return -[PKHostPlugIn state](self, "state") == 4;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;

  v6 = a4;
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB3C78]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("synchronous"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    objc_msgSend(v6, "invoke");
  }
  else
  {
    objc_msgSend(v6, "retainArguments");
    -[PKHostPlugIn _replyQueue](self, "_replyQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1AF25C0BC;
    block[3] = &unk_1E5F40678;
    v13 = v6;
    dispatch_async(v11, block);

  }
}

- (void)setHostPrincipal:(id)a3 withProtocol:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[PKHostPlugIn plugInPrincipal](self, "plugInPrincipal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PKHostPlugIn setQueuedHostPrincipal:](self, "setQueuedHostPrincipal:", v8);
    -[PKHostPlugIn setQueuedHostProtocol:](self, "setQueuedHostProtocol:", v6);
  }

}

- (id)createInstanceWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  PKHostPlugIn *v6;
  uint64_t v7;
  void *v8;
  PKHostPlugIn *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1AF25BE28;
  v16 = sub_1AF25BE38;
  v17 = 0;
  -[PKHostPlugIn _syncQueue](self, "_syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1AF25C280;
  v11[3] = &unk_1E5F40600;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v5, v11);

  v6 = [PKHostPlugIn alloc];
  v7 = v13[5];
  -[PKHostPlugIn host](self, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKHostPlugIn initWithForm:host:](v6, "initWithForm:host:", v7, v8);

  -[PKHostPlugIn setMultipleInstanceUUID:](v9, "setMultipleInstanceUUID:", v4);
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (NSUUID)effectiveUUID
{
  void *v3;

  -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
  else
    -[PKPlugInCore uuid](self, "uuid");
  return (NSUUID *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_validatePersona
{
  int current_persona;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BYTE v18[20];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[28];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (-[PKPlugInCore usesHostPersona](self, "usesHostPersona"))
  {
    current_persona = voucher_get_current_persona();
    if (current_persona != -1)
    {
      v4 = current_persona;
      v41 = 0u;
      memset(v42, 0, sizeof(v42));
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v22 = 0u;
      LODWORD(v22) = 1;
      if ((kpersona_info() & 0x80000000) != 0)
      {
        v12 = *__error();
        pklog_handle_for_category(13);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          -[PKPlugInCore uuid](self, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPlugInCore identifier](self, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPlugInCore version](self, "version");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138544642;
          *(_QWORD *)v18 = v13;
          *(_WORD *)&v18[8] = 2114;
          *(_QWORD *)&v18[10] = v14;
          *(_WORD *)&v18[18] = 2112;
          v19 = (uint64_t)v15;
          LOWORD(v20) = 2112;
          *(_QWORD *)((char *)&v20 + 2) = v16;
          WORD5(v20) = 1024;
          HIDWORD(v20) = v4;
          LOWORD(v21) = 2080;
          *(_QWORD *)((char *)&v21 + 2) = strerror(v12);
          _os_log_error_impl(&dword_1AF254000, v5, OS_LOG_TYPE_ERROR, "[u %{public}@:m %{public}@] [%@(%@)] Could not get current persona info for id:%d with error:%s", (uint8_t *)&v17, 0x3Au);

        }
        goto LABEL_10;
      }
      if (DWORD2(v22) != 2 && DWORD2(v22) != 5)
      {
        pklog_handle_for_category(13);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          sub_1AF2744A8((uint64_t)self, (uint64_t)v5, v6, v7, v8, v9, v10, v11, v17, *(uint64_t *)&v18[4], *(uint64_t *)&v18[12], v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23,
            *((uint64_t *)&v23 + 1),
            v24,
            *((uint64_t *)&v24 + 1),
            v25,
            *((uint64_t *)&v25 + 1));
LABEL_10:

      }
    }
  }
}

- (void)beginUsing:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_beginUsingWithSubsystemOptions_completion_);
}

- (void)beginUsingWithSubsystemOptions:(id)a3 completion:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_beginUsingRequest_withSubsystemOptions_completion_);
}

- (void)beginUsingRequest:(id)a3 withSubsystemOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  uint8_t v33;
  uint64_t block;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  PKHostPlugIn *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, void *);
  void *v45;
  PKHostPlugIn *v46;
  id v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKHostPlugIn _validatePersona](self, "_validatePersona");
  v11 = PKGetThreadPriority();
  pklog_handle_for_category(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  pklog_handle_for_category(7);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    -[PKPlugInCore identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore uuid](self, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v50 = v16;
    v51 = 2114;
    v52 = v17;
    v53 = 1026;
    v54 = v11;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "HostBeginUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  priority=%{public, signpost.description:attribute}d ", buf, 0x1Cu);

  }
  v18 = MEMORY[0x1E0C809B0];
  v42 = MEMORY[0x1E0C809B0];
  v43 = 3221225472;
  v44 = sub_1AF25C7B4;
  v45 = &unk_1E5F406A0;
  v47 = v10;
  v48 = v13;
  v46 = self;
  v19 = v10;
  v20 = (void *)MEMORY[0x1AF45AEB8](&v42);
  v21 = _CFXPCCreateXPCObjectFromCFObject();
  v22 = (void *)v21;
  if (v9 && !v21)
  {
    pklog_handle_for_category(8);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      sub_1AF274558((uint64_t)self, (uint64_t)v9, (uint64_t)v23, v24, v25, v26, v27, v28, v33, block, v35, (uint64_t)v36, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, (uint64_t)v40, (uint64_t)v41, v42, v43,
        (uint64_t)v44,
        (uint64_t)v45,
        (uint64_t)v46,
        (uint64_t)v47,
        v48);

  }
  -[PKHostPlugIn _startQueue](self, "_startQueue");
  v29 = objc_claimAutoreleasedReturnValue();
  block = v18;
  v35 = 3221225472;
  v36 = sub_1AF25C8E4;
  v37 = &unk_1E5F406C8;
  v38 = self;
  v39 = v8;
  v40 = v22;
  v41 = v20;
  v30 = v20;
  v31 = v22;
  v32 = v8;
  dispatch_async(v29, &block);

}

- (void)beginUsingRequest:(id)a3 completion:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_beginUsingRequest_withSubsystemOptions_completion_);
}

- (BOOL)beginUsingWithError:(id *)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_beginUsingWithSubsystemOptions_error_);
}

- (BOOL)beginUsingWithSubsystemOptions:(id)a3 error:(id *)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_beginUsingRequest_withSubsystemOptions_error_);
}

- (BOOL)beginUsingRequest:(id)a3 withSubsystemOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD *);
  void *v32;
  PKHostPlugIn *v33;
  id v34;
  id v35;
  _BYTE *v36;
  uint8_t v37[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  _BOOL4 v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PKHostPlugIn _validatePersona](self, "_validatePersona");
  v10 = PKGetThreadPriority();
  pklog_handle_for_category(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  pklog_handle_for_category(7);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    -[PKPlugInCore identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore uuid](self, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 1026;
    LODWORD(v44) = v10;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "HostBeginUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  priority=%{public, signpost.description:attribute}d ", buf, 0x1Cu);

  }
  v17 = _CFXPCCreateXPCObjectFromCFObject();
  v18 = (void *)v17;
  if (v9 && !v17)
  {
    pklog_handle_for_category(7);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      sub_1AF27460C((uint64_t)v9, v19);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v44 = sub_1AF25BE28;
  v45 = sub_1AF25BE38;
  v46 = 0;
  -[PKHostPlugIn _startQueue](self, "_startQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = sub_1AF25CC74;
  v32 = &unk_1E5F40718;
  v33 = self;
  v21 = v8;
  v34 = v21;
  v22 = v18;
  v35 = v22;
  v36 = buf;
  dispatch_sync(v20, &v29);

  v23 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (a5 && v23)
    *a5 = objc_retainAutorelease(v23);
  pklog_handle_for_category(7);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    -[PKPlugInCore identifier](self, "identifier", v29, v30, v31, v32, v33, v34);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore uuid](self, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v37 = 138478339;
    v38 = v26;
    v39 = 2114;
    v40 = v27;
    v41 = 1026;
    v42 = v23 == 0;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v25, OS_SIGNPOST_INTERVAL_END, v12, "HostBeginUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  success=%{public, signpost.description:attribute}d ", v37, 0x1Cu);

  }
  _Block_object_dispose(buf, 8);

  return v23 == 0;
}

- (BOOL)beginUsingRequest:(id)a3 error:(id *)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_beginUsingRequest_withSubsystemOptions_error_);
}

- (void)addRequestUUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _BYTE v20[20];
  void *v21;
  _BYTE v22[24];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PKHostPlugIn _syncQueue](self, "_syncQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    pklog_handle_for_category(7);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[PKPlugInCore uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore version](self, "version");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544386;
      *(_QWORD *)v20 = v7;
      *(_WORD *)&v20[8] = 2114;
      *(_QWORD *)&v20[10] = v8;
      *(_WORD *)&v20[18] = 2112;
      v21 = v9;
      *(_WORD *)v22 = 2112;
      *(_QWORD *)&v22[2] = v10;
      *(_WORD *)&v22[10] = 2112;
      *(_QWORD *)&v22[12] = v4;
      _os_log_impl(&dword_1AF254000, v6, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] adding request: %@", (uint8_t *)&v19, 0x34u);

    }
    -[PKHostPlugIn requests](self, "requests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v4);

    pklog_handle_for_category(7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1AF274680((uint64_t)self, (uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, *(uint64_t *)&v20[4], *(uint64_t *)&v20[12], v21, *(uint64_t *)v22, *(uint64_t *)&v22[8], *(uint64_t *)&v22[16], v23, v24, v25, v26,
        v27,
        v28,
        v29,
        v30,
        v31);

  }
}

- (void)startPlugInRequest:(id)a3 synchronously:(BOOL)a4 subsystemOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const char *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  PKHostPlugIn *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t current_persona;
  int v46;
  NSObject *v47;
  void *v48;
  uid_t v49;
  uid_t v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *spida;
  void *spidb;
  os_signpost_id_t spid;
  id spidc;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void (**v86)(_QWORD, _QWORD, _QWORD);
  void *v87;
  PKHostPlugIn *v88;
  void *v89;
  _BOOL4 v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  _QWORD v95[5];
  id v96;
  id v97;
  id v98;
  id v99;
  void (**v100)(_QWORD, _QWORD, _QWORD);
  _QWORD *v101;
  os_signpost_id_t v102;
  BOOL v103;
  const char *v104;
  const char *v105;
  _QWORD v106[5];
  _QWORD v107[4];
  id v108;
  id v109;
  _QWORD *v110;
  id v111;
  id location;
  _QWORD v113[5];
  id v114;
  _QWORD block[5];
  id v116;
  id v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  uint8_t v123[4];
  void *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  uid_t v132;
  __int16 v133;
  uid_t v134;
  __int16 v135;
  int v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  const char *v140;
  uint8_t buf[32];
  _DWORD v142[8];
  _QWORD v143[4];
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[28];
  _QWORD v159[4];

  v90 = a4;
  v159[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v94 = a5;
  v11 = a6;
  -[PKHostPlugIn _startQueue](self, "_startQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[PKHostPlugIn _replyQueue](self, "_replyQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[PKPlugInCore identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("PlugInKit reply:%@"), v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend(v16, "UTF8String");
    +[PKCapabilities frameworkQueueAttr](PKCapabilities, "frameworkQueueAttr");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create(v17, v18);
    -[PKHostPlugIn set_replyQueue:](self, "set_replyQueue:", v19);

  }
  objc_msgSend(v10, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "launchPersona");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHostPlugIn host](self, "host");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = 0;
  v120 = &v119;
  v121 = 0x2020000000;
  v122 = 0;
  -[PKHostPlugIn _syncQueue](self, "_syncQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF25DB9C;
  block[3] = &unk_1E5F40740;
  block[4] = self;
  v23 = v20;
  v116 = v23;
  v24 = v11;
  v117 = v24;
  v118 = &v119;
  dispatch_sync(v22, block);

  if (*((_BYTE *)v120 + 24))
  {
    pklog_handle_for_category(7);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v25))
    {
      -[PKPlugInCore identifier](self, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore uuid](self, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PKHostPlugIn useCount](self, "useCount");
      *(_DWORD *)buf = 138478339;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2050;
      *(_QWORD *)&buf[24] = v28;
      _os_signpost_emit_with_name_impl(&dword_1AF254000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HostStartBypass", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  count=%{public, signpost.description:attribute}lu ", buf, 0x20u);

    }
    goto LABEL_29;
  }
  -[PKPlugInCore diagnose](self, "diagnose");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    pklog_handle_for_category(7);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      -[PKPlugInCore uuid](self, "uuid");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore identifier](self, "identifier");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore version](self, "version");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v89;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v87;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v83;
      LOWORD(v142[0]) = 2112;
      *(_QWORD *)((char *)v142 + 2) = v39;
      _os_log_debug_impl(&dword_1AF254000, v30, OS_LOG_TYPE_DEBUG, "[u %{public}@:m %{public}@] [%@(%@)] suspending startQueue", buf, 0x2Au);

    }
    -[PKHostPlugIn _startQueue](self, "_startQueue");
    v31 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v31);

    v113[0] = 0;
    v113[1] = v113;
    v113[2] = 0x3032000000;
    v113[3] = sub_1AF25BE28;
    v113[4] = sub_1AF25BE38;
    v114 = 0;
    objc_initWeak(&location, self);
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = sub_1AF25DE58;
    v107[3] = &unk_1E5F40768;
    objc_copyWeak(&v111, &location);
    v82 = v21;
    v108 = v82;
    v109 = v24;
    v110 = v113;
    v86 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1AF45AEB8](v107);
    -[PKHostPlugIn setTerminating:](self, "setTerminating:", 0);
    objc_msgSend(v82, "activatePlugIn:", self);
    v32 = (PKHostPlugIn *)objc_claimAutoreleasedReturnValue();
    v88 = v32;
    if (v32 == self)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKHostPlugIn.m"), 521, CFSTR("inactive/activating self %@ not in active dictionary"), self);

      if (v88)
        goto LABEL_14;
    }
    else if (v32)
    {
LABEL_14:
      pklog_handle_for_category(7);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        -[PKPlugInCore uuid](self, "uuid");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore identifier](self, "identifier");
        spida = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore version](self, "version");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore uuid](v88, "uuid");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKHostPlugIn multipleInstanceUUID](v88, "multipleInstanceUUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore identifier](v88, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore version](v88, "version");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        *(_QWORD *)&buf[4] = v92;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v84;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = spida;
        LOWORD(v142[0]) = 2112;
        *(_QWORD *)((char *)v142 + 2) = v76;
        HIWORD(v142[2]) = 2114;
        *(_QWORD *)&v142[3] = v74;
        LOWORD(v142[5]) = 2114;
        *(_QWORD *)((char *)&v142[5] + 2) = v40;
        HIWORD(v142[7]) = 2112;
        v143[0] = v41;
        LOWORD(v143[1]) = 2112;
        *(_QWORD *)((char *)&v143[1] + 2) = v42;
        _os_log_error_impl(&dword_1AF254000, v33, OS_LOG_TYPE_ERROR, "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; different plugin with same identifier already act"
          "ive: [u %{public}@:m %{public}@] [%@(%@)] ",
          buf,
          0x52u);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("other version in use: %@"), v88);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      pkError(16, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v86)[2](v86, v35, 0);

LABEL_28:
      objc_destroyWeak(&v111);
      objc_destroyWeak(&location);
      _Block_object_dispose(v113, 8);

      goto LABEL_29;
    }
    -[PKHostPlugIn _syncQueue](self, "_syncQueue");
    v44 = objc_claimAutoreleasedReturnValue();
    v106[0] = MEMORY[0x1E0C809B0];
    v106[1] = 3221225472;
    v106[2] = sub_1AF25E14C;
    v106[3] = &unk_1E5F40678;
    v106[4] = self;
    dispatch_sync(v44, v106);

    MEMORY[0x1AF45B2E4]();
    v159[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = 0u;
    memset(v158, 0, sizeof(v158));
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v144 = 0u;
    memset(v143, 0, sizeof(v143));
    memset(v142, 0, sizeof(v142));
    memset(buf, 0, sizeof(buf));
    v104 = 0;
    v105 = 0;
    current_persona = voucher_get_current_persona();
    v46 = current_persona;
    memset(buf, 0, sizeof(buf));
    memset(v142, 0, sizeof(v142));
    memset(v143, 0, sizeof(v143));
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    memset(v158, 0, sizeof(v158));
    *(_DWORD *)buf = 1;
    pklog_get_persona_type_and_name(current_persona, (uint64_t)buf, &v105, &v104);
    pklog_handle_for_category(7);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v72 = v46;
      -[PKPlugInCore uuid](self, "uuid");
      spidb = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore identifier](self, "identifier");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore version](self, "version");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = geteuid();
      v50 = getuid();
      *(_DWORD *)v123 = 138545410;
      v124 = spidb;
      v125 = 2114;
      v126 = v75;
      v127 = 2112;
      v128 = v73;
      v129 = 2112;
      v130 = v48;
      v131 = 1024;
      v132 = v49;
      v133 = 1024;
      v134 = v50;
      v135 = 1024;
      v136 = v72;
      v137 = 2080;
      v138 = v105;
      v139 = 2080;
      v140 = v104;
      _os_log_impl(&dword_1AF254000, v47, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] Ready plugins sent as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v123, 0x50u);

    }
    pklog_handle_for_category(7);
    v51 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_make_with_pointer(v51, self);

    pklog_handle_for_category(7);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      -[PKPlugInCore identifier](self, "identifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore uuid](self, "uuid");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)&buf[4] = v54;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v55;
      _os_signpost_emit_with_name_impl(&dword_1AF254000, v53, OS_SIGNPOST_INTERVAL_BEGIN, spid, "HostToDaemonReadyPlugIns", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);

    }
    v56 = objc_alloc(MEMORY[0x1E0CB3B38]);
    -[PKPlugInCore infoKey:](self, "infoKey:", CFSTR("CFBundleIdentifier"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v56, "initWithServiceName:", v57);

    -[PKHostPlugIn setPluginConnection:](self, "setPluginConnection:", v58);
    -[PKHostPlugIn setBootstrapWithSubsystemOptions:](self, "setBootstrapWithSubsystemOptions:", v94);
    -[PKHostPlugIn preferredLanguages](self, "preferredLanguages");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (!v59)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v61 = v60;
    if (!v59)

    -[PKHostPlugIn environment](self, "environment");
    v62 = objc_claimAutoreleasedReturnValue();
    -[PKHostPlugIn sandboxProfile](self, "sandboxProfile");
    v63 = objc_claimAutoreleasedReturnValue();
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = sub_1AF25E158;
    v95[3] = &unk_1E5F40880;
    v102 = spid;
    v95[4] = self;
    v100 = v86;
    v64 = v82;
    v85 = (void *)v63;
    v65 = (void *)v62;
    v66 = v21;
    v67 = v61;
    v68 = v64;
    v96 = v64;
    v101 = v113;
    spidc = v58;
    v97 = spidc;
    v69 = v77;
    v98 = v69;
    v103 = v90;
    v99 = v23;
    v70 = v68;
    v71 = v67;
    v21 = v66;
    objc_msgSend(v70, "readyPlugIns:synchronously:environment:languages:persona:sandbox:ready:", v69, v90, v65, v71, v93, v85, v95);

    goto LABEL_28;
  }
  pklog_handle_for_category(7);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    -[PKPlugInCore uuid](self, "uuid");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v91;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v36;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v37;
    LOWORD(v142[0]) = 2112;
    *(_QWORD *)((char *)v142 + 2) = v38;
    HIWORD(v142[2]) = 2112;
    *(_QWORD *)&v142[3] = v25;
    _os_log_error_impl(&dword_1AF254000, v29, OS_LOG_TYPE_ERROR, "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; failed pre-screen: %@",
      buf,
      0x34u);

  }
  (*((void (**)(id, NSObject *))v24 + 2))(v24, v25);
LABEL_29:

  _Block_object_dispose(&v119, 8);
}

- (void)preparePlugInUsingService:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  Protocol *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  const char *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKHostPlugIn queuedHostProtocol](self, "queuedHostProtocol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[PKHostPlugIn queuedHostProtocol](self, "queuedHostProtocol");
    v10 = (Protocol *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithUTF8String:", protocol_getName(v10));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3B50];
    -[PKHostPlugIn queuedHostProtocol](self, "queuedHostProtocol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interfaceWithProtocol:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKHostPlugIn pluginConnection](self, "pluginConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteObjectInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_beginUsingPlugIn_ready_, 0, 0);

  }
  v16 = -[PKPlugInCore hubProtocolVersion](self, "hubProtocolVersion");
  if (v16 == 2)
  {
    v23 = (void *)objc_opt_new();
    -[PKPlugInCore identifier](self, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("identifier"));

    -[PKPlugInCore uuid](self, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("uuid"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPlugInCore hubProtocolVersion](self, "hubProtocolVersion"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("version"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPlugInCore isRBManaged](self, "isRBManaged"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, CFSTR("isRBManaged"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PKPlugInCore extensionPointPlatform](self, "extensionPointPlatform"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, CFSTR("epPlatform"));

    if (v8)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v8, CFSTR("hostProtocol"));
    pklog_handle_for_category(7);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPlugInCore uuid](self, "uuid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore identifier](self, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore version](self, "version");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[PKPlugInCore isRBManaged](self, "isRBManaged");
      v35 = "non-";
      *(_DWORD *)buf = 138544130;
      v41 = v31;
      v42 = 2112;
      v43 = v32;
      if (v34)
        v35 = (const char *)&unk_1AF27B697;
      v44 = 2112;
      v45 = v33;
      v46 = 2080;
      v47 = v35;
      _os_log_impl(&dword_1AF254000, v30, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Sending prepareUsing to %smanaged extension; this should launch it if not already running.",
        buf,
        0x2Au);

    }
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1AF260A50;
    v36[3] = &unk_1E5F408D0;
    v37 = v7;
    objc_msgSend(v6, "prepareUsing:reply:", v23, v36);

  }
  else if (v16 == 1)
  {
    pklog_handle_for_category(7);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPlugInCore uuid](self, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore identifier](self, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore version](self, "version");
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v41 = v18;
      v42 = 2114;
      v43 = v19;
      v44 = 2112;
      v45 = v20;
      v46 = 2112;
      v47 = v21;
      _os_log_impl(&dword_1AF254000, v17, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] Sending legacy prepareUsingPlugIn to extension; this should launch it if no"
        "t already running.",
        buf,
        0x2Au);

    }
    -[PKPlugInCore identifier](self, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = sub_1AF2609D4;
    v38[3] = &unk_1E5F408A8;
    v39 = v7;
    objc_msgSend(v6, "prepareUsingPlugIn:hostProtocol:reply:", v22, v8, v38);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("unexpected hub protocol version:%ld"), -[PKPlugInCore hubProtocolVersion](self, "hubProtocolVersion"));
  }

}

- (void)setBootstrapWithSubsystemOptions:(id)a3
{
  xpc_object_t v4;
  char *v5;
  void *v6;
  void *v7;
  xpc_object_t value;

  value = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = getenv("CLASSIC");
  if (v5)
    xpc_dictionary_set_string(v4, "CLASSIC", v5);
  if (value)
    xpc_dictionary_set_value(v4, "SubsystemOptions", value);
  if (xpc_dictionary_get_count(v4))
  {
    -[PKHostPlugIn pluginConnection](self, "pluginConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_bootstrap();

  }
}

- (BOOL)loadExtensions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PKSandboxExtension *v15;
  uint64_t v16;
  void *v17;
  PKSandboxExtension *v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        if (v8 <= 1)
          v11 = 1;
        else
          v11 = v8;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v7);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
          v15 = [PKSandboxExtension alloc];
          -[PKPlugInCore external](self, "external");
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v16, "sandbox");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[PKSandboxExtension initWithExtension:provider:](v15, "initWithExtension:provider:", v14, v17);

          -[PKHostPlugIn sandboxExtensions](self, "sandboxExtensions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = objc_msgSend(v19, "containsObject:", v18);

          if ((v16 & 1) == 0)
          {
            -[PKSandboxExtension consume](v18, "consume");
            -[PKHostPlugIn sandboxExtensions](self, "sandboxExtensions");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              -[PKHostPlugIn sandboxExtensions](self, "sandboxExtensions");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "arrayByAddingObject:", v18);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKHostPlugIn setSandboxExtensions:](self, "setSandboxExtensions:", v13);

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v18);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKHostPlugIn setSandboxExtensions:](self, "setSandboxExtensions:", v12);
            }

          }
          ++v10;
        }
        while (v11 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    v6 = v22;
  }

  return 1;
}

- (BOOL)isSandboxed
{
  if (qword_1EEE37698 != -1)
    dispatch_once(&qword_1EEE37698, &unk_1E5F40498);
  return byte_1EEE37690;
}

- (BOOL)useBundle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKHostPlugIn discoveryExtensions](self, "discoveryExtensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PKHostPlugIn discoveryExtensions](self, "discoveryExtensions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

  }
  else
  {
    v9 = 1;
  }

  if (!v9)
  {
    pklog_handle_for_category(7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_1AF2757B4((uint64_t)self, (uint64_t)v6, (uint64_t)v10, v11, v12, v13, v14, v15, v29, v30, v31, v32, v34, v35, v36, v37, v38, v39, v40,
        v41,
        v42,
        v43,
        v44,
        v45);

    -[PKHostPlugIn discoveryExtensions](self, "discoveryExtensions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v6)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v36 = (uint64_t)v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(a4) = -[PKHostPlugIn loadExtensions:error:](self, "loadExtensions:error:", v19, a4);
      }
      else
      {
        if (!a4)
        {
LABEL_16:

          goto LABEL_17;
        }
        -[PKPlugInCore uuid](self, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore identifier](self, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPlugInCore version](self, "version");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        pkErrorf(11, CFSTR("[u %@:m %@] [%@(%@)] sandbox extensions for relative path [%@] not vended by plugin"), v22, v23, v24, v25, v26, v27, (uint64_t)v19);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a4) = 0;
      }
      v17 = v18;
    }
    else
    {
      objc_msgSend(v16, "allValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(a4) = -[PKHostPlugIn loadExtensions:error:](self, "loadExtensions:error:", v19, a4);
    }

    v18 = v17;
    goto LABEL_16;
  }
  LOBYTE(a4) = 1;
LABEL_17:

  return (char)a4;
}

- (void)endUsing:(id)a3
{
  -[PKHostPlugIn endUsingRequest:completion:](self, "endUsingRequest:completion:", 0, a3);
}

- (void)endUsingRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  PKHostPlugIn *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1AF25BE28;
  v19 = sub_1AF25BE38;
  v20 = 0;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHostPlugIn _syncQueue](self, "_syncQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF2610F0;
  block[3] = &unk_1E5F40918;
  v10 = v8;
  v12 = v10;
  v13 = self;
  v14 = &v15;
  dispatch_sync(v9, block);

  v7[2](v7, v16[5]);
  _Block_object_dispose(&v15, 8);

}

- (BOOL)endUsingWithError:(id *)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_endUsingRequest_error_);
}

- (BOOL)endUsingRequest:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1AF25BE28;
  v14 = sub_1AF25BE38;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1AF26150C;
  v9[3] = &unk_1E5F406F0;
  v9[4] = &v10;
  -[PKHostPlugIn endUsingRequest:completion:](self, "endUsingRequest:completion:", v6, v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v11[5]);
  v7 = v11[5] == 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)unwind:(unint64_t)a3 force:(BOOL)a4
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  PKManager *v28;
  void *v29;
  PKManager *v30;
  void *v31;
  BOOL v32;
  NSObject *v33;
  NSObject *v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  NSObject *v42;
  __int16 v43;
  NSObject *v44;
  __int16 v45;
  NSObject *v46;
  __int16 v47;
  NSObject *v48;
  __int16 v49;
  unsigned int v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if (-[PKHostPlugIn state](self, "state") != 1)
      return;
    if (!a4 && !-[PKHostPlugIn useCount](self, "useCount"))
      sub_1AF2759E0();
  }
  if (a3 != 2)
  {
    v6 = -[PKHostPlugIn useCount](self, "useCount") - 1;
    -[PKHostPlugIn setUseCount:](self, "setUseCount:", v6);
    if ((_DWORD)v6)
    {
      pklog_handle_for_category(7);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
LABEL_31:

        return;
      }
      -[PKPlugInCore uuid](self, "uuid");
      v8 = objc_claimAutoreleasedReturnValue();
      -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
      v9 = objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore identifier](self, "identifier");
      v10 = objc_claimAutoreleasedReturnValue();
      -[PKPlugInCore version](self, "version");
      v11 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v42 = v8;
      v43 = 2114;
      v44 = v9;
      v45 = 2112;
      v46 = v10;
      v47 = 2112;
      v48 = v11;
      v49 = 1024;
      v50 = -[PKHostPlugIn useCount](self, "useCount");
      _os_log_impl(&dword_1AF254000, v7, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] plugin still active after removing one ref count, remaining = %u", buf, 0x30u);
      goto LABEL_23;
    }
  }
  pklog_handle_for_category(7);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPlugInCore uuid](self, "uuid");
    v13 = objc_claimAutoreleasedReturnValue();
    -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v16 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v13;
    v43 = 2114;
    v44 = v14;
    v45 = 2112;
    v46 = v15;
    v47 = 2112;
    v48 = v16;
    _os_log_impl(&dword_1AF254000, v12, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] all extension sessions ended", buf, 0x2Au);

  }
  -[PKHostPlugIn messageTraceUsage](self, "messageTraceUsage");
  -[PKHostPlugIn host](self, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deactivatePlugIn:", self);

  if (a3 != 2)
  {
    -[PKHostPlugIn service](self, "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shutdownPlugIn");

  }
  -[PKHostPlugIn changeState:](self, "changeState:", a3);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PKHostPlugIn sandboxExtensions](self, "sandboxExtensions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v38;
    do
    {
      v22 = 0;
      if (v20 <= 1)
        v23 = 1;
      else
        v23 = v20;
      do
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v22++), "expel");
      }
      while (v23 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    }
    while (v20);
  }

  -[PKHostPlugIn setSandboxExtensions:](self, "setSandboxExtensions:", 0);
  -[PKHostPlugIn setUseCount:](self, "setUseCount:", 0);
  -[PKHostPlugIn setPlugInPrincipal:](self, "setPlugInPrincipal:", 0);
  -[PKHostPlugIn setEmbeddedPrincipal:](self, "setEmbeddedPrincipal:", 0);
  -[PKHostPlugIn setService:](self, "setService:", 0);
  -[PKHostPlugIn setSyncService:](self, "setSyncService:", 0);
  -[PKHostPlugIn pluginConnection](self, "pluginConnection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "invalidate");

  -[PKHostPlugIn setPluginConnection:](self, "setPluginConnection:", 0);
  -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHostPlugIn changeState:](self, "changeState:", 4 * (v25 != 0));

  -[PKPlugInCore launchPersonas](self, "launchPersonas");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27 >= 2)
  {
    v28 = [PKManager alloc];
    -[PKPlugInCore external](self, "external");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PKManager initWithExternalProviders:](v28, "initWithExternalProviders:", v29);
    -[PKPlugInCore url](self, "url");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v32 = -[PKManager terminatePlugInAtURL:withError:](v30, "terminatePlugInAtURL:withError:", v31, &v36);
    v7 = v36;

    pklog_handle_for_category(7);
    v33 = objc_claimAutoreleasedReturnValue();
    v8 = v33;
    if (!v32)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_1AF275934(self, (uint64_t)v7, v8);
      goto LABEL_30;
    }
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
LABEL_30:

      goto LABEL_31;
    }
    -[PKPlugInCore uuid](self, "uuid");
    v9 = objc_claimAutoreleasedReturnValue();
    -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
    v10 = objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v34 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v9;
    v43 = 2114;
    v44 = v10;
    v45 = 2112;
    v46 = v11;
    v47 = 2112;
    v48 = v34;
    _os_log_impl(&dword_1AF254000, v8, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] terminated multi-persona plugin", buf, 0x2Au);

LABEL_23:
    goto LABEL_30;
  }
}

- (void)changeState:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PKHostPlugIn _syncQueue](self, "_syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  pklog_handle_for_category(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[PKPlugInCore uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHostPlugIn multipleInstanceUUID](self, "multipleInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugInCore version](self, "version");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v16 = v7;
    v17 = 2114;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = a3;
    _os_log_impl(&dword_1AF254000, v6, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] state := %lu", buf, 0x34u);

  }
  if (-[PKHostPlugIn state](self, "state") != a3)
  {
    -[PKHostPlugIn setState:](self, "setState:", a3);
    -[PKHostPlugIn notificationBlock](self, "notificationBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[PKHostPlugIn _replyQueue](self, "_replyQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = sub_1AF261C44;
      v13[3] = &unk_1E5F40940;
      v13[4] = self;
      v14 = v11;
      dispatch_async(v12, v13);

    }
  }
}

- (id)notificationBlock
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setNotificationBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (void)setPreferredLanguages:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (NSString)sandboxProfile
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSandboxProfile:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (NSXPCConnection)pluginConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPluginConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (OS_dispatch_queue)_replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264, 1);
}

- (void)set_replyQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (OS_dispatch_queue)_startQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 280, 1);
}

- (PKCorePlugInProtocol)service
{
  return (PKCorePlugInProtocol *)objc_getProperty(self, a2, 288, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (PKCorePlugInProtocol)syncService
{
  return (PKCorePlugInProtocol *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSyncService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (void)setSupersedingUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (PKPlugIn)supersededBy
{
  return (PKPlugIn *)objc_loadWeakRetained((id *)&self->_supersededBy);
}

- (NSUUID)multipleInstanceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (void)setMultipleInstanceUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSString)serviceExtension
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (NSDictionary)discoveryExtensions
{
  return (NSDictionary *)objc_getProperty(self, a2, 336, 1);
}

- (NSArray)sandboxExtensions
{
  return (NSArray *)objc_getProperty(self, a2, 344, 1);
}

- (void)setSandboxExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (id)queuedHostPrincipal
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setQueuedHostPrincipal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (Protocol)queuedHostProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 360, 1);
}

- (void)setQueuedHostProtocol:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unsigned)useCount
{
  return self->_useCount;
}

- (void)setUseCount:(unsigned int)a3
{
  self->_useCount = a3;
}

- (id)plugInPrincipal
{
  return objc_getProperty(self, a2, 376, 1);
}

- (void)setPlugInPrincipal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (id)embeddedPrincipal
{
  return objc_getProperty(self, a2, 384, 1);
}

- (void)setEmbeddedPrincipal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSBundle)embeddedBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 392, 1);
}

- (void)setEmbeddedBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (BOOL)terminating
{
  return self->_terminating;
}

- (void)setTerminating:(BOOL)a3
{
  self->_terminating = a3;
}

- (NSDate)beganUsingAt
{
  return (NSDate *)objc_getProperty(self, a2, 400, 1);
}

- (void)setBeganUsingAt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSDictionary)environment
{
  return (NSDictionary *)objc_getProperty(self, a2, 416, 1);
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSMutableSet)requests
{
  return (NSMutableSet *)objc_getProperty(self, a2, 424, 1);
}

- (PKHost)host
{
  return (PKHost *)objc_getProperty(self, a2, 432, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sourceForm, 0);
  objc_storeStrong((id *)&self->_beganUsingAt, 0);
  objc_storeStrong((id *)&self->_embeddedBundle, 0);
  objc_storeStrong(&self->_embeddedPrincipal, 0);
  objc_storeStrong(&self->_plugInPrincipal, 0);
  objc_storeStrong((id *)&self->_queuedHostProtocol, 0);
  objc_storeStrong(&self->_queuedHostPrincipal, 0);
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
  objc_storeStrong((id *)&self->_discoveryExtensions, 0);
  objc_storeStrong((id *)&self->_serviceExtension, 0);
  objc_storeStrong((id *)&self->_multipleInstanceUUID, 0);
  objc_destroyWeak((id *)&self->_supersededBy);
  objc_storeStrong((id *)&self->_supersedingUUID, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->__startQueue, 0);
  objc_storeStrong((id *)&self->__syncQueue, 0);
  objc_storeStrong((id *)&self->__replyQueue, 0);
  objc_storeStrong((id *)&self->_pluginConnection, 0);
  objc_storeStrong((id *)&self->_sandboxProfile, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong(&self->_notificationBlock, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
