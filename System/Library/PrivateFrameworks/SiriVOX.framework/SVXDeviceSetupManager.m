@implementation SVXDeviceSetupManager

- (void)prepareForSetupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SVXDeviceSetupManager prepareForSetupWithContext:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  -[SVXAudioServicesUtils audioServicesActivateWithTimeout](self->_audioServicesUtils, "audioServicesActivateWithTimeout");
  -[SVXModule performer](self->_module, "performer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__SVXDeviceSetupManager_prepareForSetupWithContext_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "performBlock:", v12);

}

- (void)setContext:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXDeviceSetupManager setContext:forUUID:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@, uuid = %@", buf, 0x20u);
  }
  -[SVXModule performer](self->_module, "performer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__SVXDeviceSetupManager_setContext_forUUID___block_invoke;
  v12[3] = &unk_24D24EF00;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "performBlock:", v12);

}

- (void)getContextWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SVXDeviceSetupManager_getContextWithCompletion___block_invoke;
  v7[3] = &unk_24D24EF28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)addListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SVXDeviceSetupManager_addListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)removeListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__SVXDeviceSetupManager_removeListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (SVXDeviceSetupManager)initWithModule:(id)a3
{
  id v5;
  SVXDeviceSetupManager *v6;
  SVXDeviceSetupManager *v7;
  SVXDeviceSetupAnnouncer *v8;
  SVXDeviceSetupAnnouncer *announcer;
  SVXAudioServicesUtils *v10;
  SVXAudioServicesUtils *audioServicesUtils;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SVXDeviceSetupManager;
  v6 = -[SVXDeviceSetupManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_module, a3);
    v8 = objc_alloc_init(SVXDeviceSetupAnnouncer);
    announcer = v7->_announcer;
    v7->_announcer = v8;

    v10 = objc_alloc_init(SVXAudioServicesUtils);
    audioServicesUtils = v7->_audioServicesUtils;
    v7->_audioServicesUtils = v10;

  }
  return v7;
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__SVXDeviceSetupManager_startWithModuleInstanceProvider_platformDependencies___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[SVXModule performer](self->_module, "performer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__SVXDeviceSetupManager_stopWithModuleInstanceProvider___block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)sessionManager:(id)a3 didActivateWithContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__SVXDeviceSetupManager_sessionManager_didActivateWithContext___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)_prepareForSetupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  _BYTE *v16;
  _BYTE buf[24];
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  SVXDeviceSetupFlowScene *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SVXDeviceSetupManager _prepareForSetupWithContext:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  -[SVXModule performer](self->_module, "performer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v18 = __Block_byref_object_copy__12599;
  v19 = __Block_byref_object_dispose__12600;
  v20 = -[SVXDeviceSetupFlowScene initWithSceneID:displayKeyFrames:]([SVXDeviceSetupFlowScene alloc], "initWithSceneID:displayKeyFrames:", 5, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SVXDeviceSetupManager__prepareForSetupWithContext_completion___block_invoke;
  block[3] = &unk_24D24EF50;
  v15 = v7;
  v16 = buf;
  v14 = v9;
  v11 = v7;
  v12 = v9;
  dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(buf, 8);
}

- (void)_setContext:(id)a3 forUUID:(id)a4
{
  NSDate *v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  NSMutableDictionary *contextsByUUID;
  SVXDeviceSetupFlowScene *activatedDeviceSetupFlowScene;
  NSDate *v12;
  NSDate *beginDate;
  NSDate *endDate;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSObject *v17;
  NSDate *v18;
  int v19;
  NSObject *v20;
  void *v21;
  SVXDeviceSetupFlowScene *v22;
  NSDate *v23;
  NSDate *v24;
  NSMutableDictionary *v25;
  NSObject *v26;
  NSDate *v27;
  NSDate *v28;
  NSDate *v29;
  void *v30;
  NSDate *v31;
  NSDate *v32;
  _QWORD v33[5];
  NSDate *v34;
  NSDate *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  NSDate *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = (NSDate *)a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v37 = "-[SVXDeviceSetupManager _setContext:forUUID:]";
    v38 = 2112;
    v39 = v6;
    v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s context = %@, uuid = %@", buf, 0x20u);
  }
  contextsByUUID = self->_contextsByUUID;
  if (v6)
  {
    if (!-[NSMutableDictionary count](contextsByUUID, "count"))
    {
      activatedDeviceSetupFlowScene = self->_activatedDeviceSetupFlowScene;
      self->_activatedDeviceSetupFlowScene = 0;

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
      beginDate = self->_beginDate;
      self->_beginDate = v12;

      endDate = self->_endDate;
      self->_endDate = 0;

      if (!self->_contextsByUUID)
      {
        v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v16 = self->_contextsByUUID;
        self->_contextsByUUID = v15;

      }
      v17 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        v18 = self->_beginDate;
        *(_DWORD *)buf = 136315394;
        v37 = "-[SVXDeviceSetupManager _setContext:forUUID:]";
        v38 = 2112;
        v39 = v18;
        _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s Begin device setup at %@.", buf, 0x16u);
      }
    }
    -[NSMutableDictionary setObject:forKey:](self->_contextsByUUID, "setObject:forKey:", v6, v7);
LABEL_10:
    v19 = 1;
    goto LABEL_11;
  }
  -[NSMutableDictionary objectForKey:](contextsByUUID, "objectForKey:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_contextsByUUID, "removeObjectForKey:", v7);
    if (!-[NSMutableDictionary count](self->_contextsByUUID, "count"))
    {
      v22 = self->_activatedDeviceSetupFlowScene;
      self->_activatedDeviceSetupFlowScene = 0;

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v24 = self->_endDate;
      self->_endDate = v23;

      v25 = self->_contextsByUUID;
      self->_contextsByUUID = 0;

      v26 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        v27 = self->_endDate;
        *(_DWORD *)buf = 136315394;
        v37 = "-[SVXDeviceSetupManager _setContext:forUUID:]";
        v38 = 2112;
        v39 = v27;
        _os_log_impl(&dword_214934000, v26, OS_LOG_TYPE_INFO, "%s End device setup at %@.", buf, 0x16u);
      }
      v28 = self->_beginDate;
      v29 = self->_endDate;
      -[SVXModule performer](self->_module, "performer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __45__SVXDeviceSetupManager__setContext_forUUID___block_invoke;
      v33[3] = &unk_24D24EF00;
      v33[4] = self;
      v34 = v28;
      v35 = v29;
      v31 = v29;
      v32 = v28;
      objc_msgSend(v30, "performBlock:afterDelay:", v33, 60.0);

    }
    goto LABEL_10;
  }
  v19 = 0;
LABEL_11:
  v20 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[SVXDeviceSetupManager _setContext:forUUID:]";
    v38 = 1024;
    LODWORD(v39) = v19;
    _os_log_impl(&dword_214934000, v20, OS_LOG_TYPE_INFO, "%s needsUpdate = %d", buf, 0x12u);
  }
  if (v19)
    -[SVXDeviceSetupManager _updateEffectiveContext](self, "_updateEffectiveContext");

}

- (void)_updateEffectiveContext
{
  uint64_t v3;
  NSMutableDictionary *contextsByUUID;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12599;
  v19 = __Block_byref_object_dispose__12600;
  v20 = 0;
  v3 = MEMORY[0x24BDAC760];
  contextsByUUID = self->_contextsByUUID;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__SVXDeviceSetupManager__updateEffectiveContext__block_invoke;
  v14[3] = &unk_24D24EF78;
  v14[4] = &v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](contextsByUUID, "enumerateKeysAndObjectsUsingBlock:", v14);
  v5 = (NSObject **)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = (void *)v16[5];
    *(_DWORD *)buf = 136315394;
    v22 = "-[SVXDeviceSetupManager _updateEffectiveContext]";
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s latestContext = %@", buf, 0x16u);
  }
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __48__SVXDeviceSetupManager__updateEffectiveContext__block_invoke_12;
  v13[3] = &unk_24D24EFA0;
  v13[4] = self;
  v8 = (void *)MEMORY[0x2199D950C](v13);
  v9 = (void *)v16[5];
  if (v9)
  {
    objc_msgSend(v9, "mutatedCopyWithMutator:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = v10;
    goto LABEL_9;
  }
  if (self->_beginDate || self->_endDate)
  {
    v10 = +[SVXDeviceSetupContext newWithBuilder:](SVXDeviceSetupContext, "newWithBuilder:", v8);
    goto LABEL_8;
  }
  v11 = 0;
LABEL_9:
  v12 = *v5;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SVXDeviceSetupManager _updateEffectiveContext]";
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s effectiveContext = %@", buf, 0x16u);
  }
  -[SVXDeviceSetupManager _setEffectiveContext:](self, "_setEffectiveContext:", v11);

  _Block_object_dispose(&v15, 8);
}

- (void)_setEffectiveContext:(id)a3
{
  id v4;
  SVXDeviceSetupContext *v5;
  SVXDeviceSetupContext *v6;
  SVXDeviceSetupContext *v7;
  BOOL v8;
  NSObject *v9;
  SVXDeviceSetupContext *effectiveContext;
  SVXDeviceSetupContext *v11;
  SVXDeviceSetupContext *v12;
  int v13;
  const char *v14;
  __int16 v15;
  SVXDeviceSetupContext *v16;
  __int16 v17;
  SVXDeviceSetupContext *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_effectiveContext;
  v6 = (SVXDeviceSetupContext *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v8 = -[SVXDeviceSetupContext isEqual:](v5, "isEqual:", v6);

      if (v8)
        goto LABEL_11;
    }
    else
    {

    }
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      effectiveContext = self->_effectiveContext;
      v13 = 136315650;
      v14 = "-[SVXDeviceSetupManager _setEffectiveContext:]";
      v15 = 2112;
      v16 = effectiveContext;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s %@ -> %@", (uint8_t *)&v13, 0x20u);
    }
    v11 = (SVXDeviceSetupContext *)-[SVXDeviceSetupContext copy](v7, "copy");
    v12 = self->_effectiveContext;
    self->_effectiveContext = v11;

    -[SVXDeviceSetupAnnouncer deviceSetupManager:didUpdateContext:](self->_announcer, "deviceSetupManager:didUpdateContext:", self, self->_effectiveContext);
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveContext, 0);
  objc_storeStrong((id *)&self->_activatedDeviceSetupFlowScene, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_contextsByUUID, 0);
  objc_storeStrong((id *)&self->_announcer, 0);
  objc_storeStrong((id *)&self->_audioServicesUtils, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

void __48__SVXDeviceSetupManager__updateEffectiveContext__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5;
  id v6;

  v6 = a3;
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "timestamp");
  if (v5 < objc_msgSend(v6, "timestamp"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);

}

void __48__SVXDeviceSetupManager__updateEffectiveContext__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v4 = a2;
  objc_msgSend(v4, "setFlowScene:", v3);
  objc_msgSend(v4, "setBeginDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(v4, "setEndDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));

}

void __45__SVXDeviceSetupManager__setContext_forUUID___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v23 = 136315394;
    v24 = "-[SVXDeviceSetupManager _setContext:forUUID:]_block_invoke";
    v25 = 2112;
    v26 = v18;
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s contextsByUUID = %@", (uint8_t *)&v23, 0x16u);
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v23 = 136315650;
    v24 = "-[SVXDeviceSetupManager _setContext:forUUID:]_block_invoke";
    v25 = 2112;
    v26 = v20;
    v27 = 2112;
    v28 = v19;
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s beginDate = %@ (actual), beginDate = %@ (expected)", (uint8_t *)&v23, 0x20u);
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v22 = *(_QWORD *)(a1 + 48);
    v23 = 136315650;
    v24 = "-[SVXDeviceSetupManager _setContext:forUUID:]_block_invoke";
    v25 = 2112;
    v26 = v21;
    v27 = 2112;
    v28 = v22;
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s endDate = %@ (actual), endDate = %@ (expected)", (uint8_t *)&v23, 0x20u);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
    goto LABEL_20;
  v4 = *(void **)(a1 + 40);
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v6 = v4;
  if (v5 == v6)
  {

  }
  else
  {
    v7 = v6;
    if (!v5 || !v6)
      goto LABEL_19;
    v8 = objc_msgSend(v5, "isEqual:", v6);

    if (!v8)
    {
LABEL_20:
      v12 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
      {
        v23 = 136315138;
        v24 = "-[SVXDeviceSetupManager _setContext:forUUID:]_block_invoke";
        _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s No need to clean up device setup.", (uint8_t *)&v23, 0xCu);
      }
      return;
    }
  }
  v9 = *(void **)(a1 + 48);
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v10 = v9;
  if (v5 == v10)
  {

    goto LABEL_24;
  }
  v7 = v10;
  if (!v5 || !v10)
  {
LABEL_19:

    goto LABEL_20;
  }
  v11 = objc_msgSend(v5, "isEqual:", v10);

  if (!v11)
    goto LABEL_20;
LABEL_24:
  v13 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    v23 = 136315138;
    v24 = "-[SVXDeviceSetupManager _setContext:forUUID:]_block_invoke";
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s Clean up device setup.", (uint8_t *)&v23, 0xCu);
  }
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 56);
  *(_QWORD *)(v14 + 56) = 0;

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 64);
  *(_QWORD *)(v16 + 64) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_updateEffectiveContext");
}

void __64__SVXDeviceSetupManager__prepareForSetupWithContext_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = v2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(v2, "addObject:");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__SVXDeviceSetupManager__prepareForSetupWithContext_completion___block_invoke_2;
  v7[3] = &unk_24D24EF28;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

void __64__SVXDeviceSetupManager__prepareForSetupWithContext_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  SVXDeviceSetupFlow *v5;
  id v6;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = objc_alloc(MEMORY[0x24BDD17C8]);
    AFBuildVersion();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v2, "initWithFormat:", CFSTR("HomePod Siri Device Setup Flow (Build %@)"), v3);

    v4 = *(_QWORD *)(a1 + 40);
    v5 = -[SVXDeviceSetupFlow initWithIdentifier:scenes:]([SVXDeviceSetupFlow alloc], "initWithIdentifier:scenes:", v6, *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, SVXDeviceSetupFlow *, _QWORD))(v4 + 16))(v4, v5, 0);

  }
}

void __63__SVXDeviceSetupManager_sessionManager_didActivateWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "systemEvent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "type") == 7)
    {
      objc_msgSend(v2, "deviceSetupFlowScene");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
      {
        v5 = objc_msgSend(v3, "copy");
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 72);
        *(_QWORD *)(v6 + 72) = v5;

        v8 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
          v10 = 136315394;
          v11 = "-[SVXDeviceSetupManager sessionManager:didActivateWithContext:]_block_invoke";
          v12 = 2112;
          v13 = v9;
          _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s activatedDeviceSetupFlowScene = %@", (uint8_t *)&v10, 0x16u);
        }
        objc_msgSend(*(id *)(a1 + 32), "_updateEffectiveContext");
      }

    }
  }
}

void __56__SVXDeviceSetupManager_stopWithModuleInstanceProvider___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeActivationListener:");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

uint64_t __78__SVXDeviceSetupManager_startWithModuleInstanceProvider_platformDependencies___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 40), "speechSynthesizer");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(a1 + 40), "sessionManager");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addActivationListener:");
}

uint64_t __40__SVXDeviceSetupManager_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__SVXDeviceSetupManager_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__SVXDeviceSetupManager_getContextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  return result;
}

uint64_t __44__SVXDeviceSetupManager_setContext_forUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContext:forUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63__SVXDeviceSetupManager_prepareForSetupWithContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareForSetupWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
