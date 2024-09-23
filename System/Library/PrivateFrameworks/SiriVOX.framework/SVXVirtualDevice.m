@implementation SVXVirtualDevice

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7.receiver = self;
  v7.super_class = (Class)SVXVirtualDevice;
  -[SVXVirtualDevice description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {instanceContext = %@}"), v4, self->_instanceContext);

  return v5;
}

- (SVXVirtualDevice)initWithInstanceContext:(id)a3
{
  id v4;
  SVXVirtualDevice *v5;
  AFInstanceContext *v6;
  AFInstanceContext *instanceContext;
  uint64_t v8;
  AFAnalytics *analytics;
  uint64_t v10;
  AFPreferences *preferences;
  AFPreferences *v12;
  AFAnalytics *v13;
  AFInstanceContext *v14;
  AFPreferences *v15;
  AFAnalytics *v16;
  SVXQueuePerformer *v17;
  SVXModule *v18;
  uint64_t v19;
  SVXModule *v20;
  uint64_t v21;
  SVXModule *v22;
  SVXModule *v23;
  uint64_t v24;
  SVXQueuePerformer *v25;
  SVXModule *v26;
  SVXModule *v27;
  uint64_t v28;
  SVXQueuePerformer *v29;
  SVXModule *v30;
  void *v31;
  SVXModule *v32;
  uint64_t v33;
  SVXQueuePerformer *v34;
  AFAnalytics *v35;
  SVXModule *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  uint64_t v47;
  NSDictionary *modulesByIdentifier;
  void *v50;
  void *v51;
  SVXQueuePerformer *v52;
  SVXModule *v53;
  SVXModule *v54;
  SVXModule *v55;
  SVXQueuePerformer *v56;
  SVXQueuePerformer *v57;
  SVXVirtualDevice *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  SVXModule *v66;
  _QWORD v67[8];

  v67[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)SVXVirtualDevice;
  v5 = -[SVXVirtualDevice init](&v64, sel_init);
  if (v5)
  {
    v59 = v4;
    if (v4)
    {
      v6 = (AFInstanceContext *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE091F8], "defaultContext");
      v6 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v6;

    if (!v5->_instanceContext)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SVXVirtualDevice initWithInstanceContext:]");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("SVXVirtualDevice.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_instanceContext != nil"));

    }
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v8 = objc_claimAutoreleasedReturnValue();
    analytics = v5->_analytics;
    v5->_analytics = (AFAnalytics *)v8;

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v10 = objc_claimAutoreleasedReturnValue();
    preferences = v5->_preferences;
    v5->_preferences = (AFPreferences *)v10;

    v13 = v5->_analytics;
    v12 = v5->_preferences;
    v58 = v5;
    v14 = v5->_instanceContext;
    v15 = v12;
    v16 = v13;
    v17 = -[SVXQueuePerformer initWithIdentifier:qosClass:relativePriority:options:]([SVXQueuePerformer alloc], "initWithIdentifier:qosClass:relativePriority:options:", CFSTR("com.apple.SiriVOXService.session-manager"), 33, 0, 2);
    v18 = [SVXModule alloc];
    v19 = objc_opt_class();
    v56 = -[SVXQueuePerformer initWithIdentifier:qosClass:relativePriority:options:]([SVXQueuePerformer alloc], "initWithIdentifier:qosClass:relativePriority:options:", CFSTR("com.apple.SiriVOXService.client-service"), 33, 0, 2);
    v55 = -[SVXModule initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:](v18, "initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:", CFSTR("com.apple.SiriVOXService.client-service"), v19, v14, v15, v16, v56);
    v67[0] = v55;
    v54 = -[SVXModule initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:]([SVXModule alloc], "initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:", CFSTR("com.apple.SiriVOXService.service-command"), objc_opt_class(), v14, v15, v16, v17);
    v67[1] = v54;
    v57 = v17;
    v53 = -[SVXModule initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:]([SVXModule alloc], "initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:", CFSTR("com.apple.SiriVOXService.session-manager"), objc_opt_class(), v14, v15, v16, v17);
    v67[2] = v53;
    v20 = [SVXModule alloc];
    v21 = objc_opt_class();
    v52 = -[SVXQueuePerformer initWithIdentifier:qosClass:relativePriority:options:]([SVXQueuePerformer alloc], "initWithIdentifier:qosClass:relativePriority:options:", CFSTR("com.apple.SiriVOXService.speech-synthesis"), 33, 0, 2);
    v22 = -[SVXModule initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:](v20, "initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:", CFSTR("com.apple.SiriVOXService.speech-synthesis"), v21, v14, v15, v16, v52);
    v67[3] = v22;
    v23 = [SVXModule alloc];
    v24 = objc_opt_class();
    v25 = -[SVXQueuePerformer initWithIdentifier:qosClass:relativePriority:options:]([SVXQueuePerformer alloc], "initWithIdentifier:qosClass:relativePriority:options:", CFSTR("com.apple.SiriVOXService.synthesis-manager"), 33, 0, 2);
    v26 = -[SVXModule initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:](v23, "initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:", CFSTR("com.apple.SiriVOXService.synthesis-manager"), v24, v14, v15, v16, v25);
    v67[4] = v26;
    v27 = [SVXModule alloc];
    v28 = objc_opt_class();
    v29 = -[SVXQueuePerformer initWithIdentifier:qosClass:relativePriority:options:]([SVXQueuePerformer alloc], "initWithIdentifier:qosClass:relativePriority:options:", CFSTR("com.apple.SiriVOXService.system-observation"), 17, 0, 2);
    v30 = -[SVXModule initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:](v27, "initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:", CFSTR("com.apple.SiriVOXService.system-observation"), v28, v14, v15, v16, v29);
    v67[5] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[AFInstanceContext isDefault](v14, "isDefault"))
    {
      v32 = [SVXModule alloc];
      v33 = objc_opt_class();
      v34 = -[SVXQueuePerformer initWithIdentifier:qosClass:relativePriority:options:]([SVXQueuePerformer alloc], "initWithIdentifier:qosClass:relativePriority:options:", CFSTR("com.apple.SiriVOXService.device-setup"), 21, 0, 2);
      v35 = v16;
      v36 = -[SVXModule initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:](v32, "initWithIdentifier:instanceClass:instanceContext:preferences:analytics:performer:", CFSTR("com.apple.SiriVOXService.device-setup"), v33, v14, v15, v16, v34);
      v66 = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v66, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "arrayByAddingObjectsFromArray:", v37);
      v38 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v38;
    }
    else
    {
      v35 = v16;
    }

    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v31, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v40 = v31;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    v5 = v58;
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v61 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v45, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKey:", v45, v46);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v42);
    }

    v47 = objc_msgSend(v39, "copy");
    modulesByIdentifier = v58->_modulesByIdentifier;
    v58->_modulesByIdentifier = (NSDictionary *)v47;

    v4 = v59;
  }

  return v5;
}

- (void)startWithPlatformDependencies:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  NSDictionary *modulesByIdentifier;
  SVXModuleInstanceMap *v8;
  SVXModuleInstanceMap *moduleInstanceMap;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCapacity:", -[NSDictionary count](self->_modulesByIdentifier, "count"));
  modulesByIdentifier = self->_modulesByIdentifier;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__SVXVirtualDevice_startWithPlatformDependencies___block_invoke;
  v11[3] = &unk_24D24E610;
  v12 = v6;
  v10 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](modulesByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = -[SVXModuleInstanceMap initWithDictionaryRepresentation:]([SVXModuleInstanceMap alloc], "initWithDictionaryRepresentation:", v10);
  moduleInstanceMap = self->_moduleInstanceMap;
  self->_moduleInstanceMap = v8;

  -[SVXVirtualDevice _startWithModuleInstanceMap:platformDependencies:](self, "_startWithModuleInstanceMap:platformDependencies:", self->_moduleInstanceMap, v5);
}

- (void)stop
{
  SVXModuleInstanceMap *moduleInstanceMap;

  -[SVXVirtualDevice _stopWithModuleInstanceMap:](self, "_stopWithModuleInstanceMap:", self->_moduleInstanceMap);
  moduleInstanceMap = self->_moduleInstanceMap;
  self->_moduleInstanceMap = 0;

}

- (SVXPrewarmHandling)prewarmHandler
{
  return (SVXPrewarmHandling *)-[SVXModuleInstanceMap sessionManager](self->_moduleInstanceMap, "sessionManager");
}

- (SVXActivationHandling)activationHandler
{
  return (SVXActivationHandling *)-[SVXModuleInstanceMap sessionManager](self->_moduleInstanceMap, "sessionManager");
}

- (SVXDeactivationHandling)deactivationHandler
{
  return (SVXDeactivationHandling *)-[SVXModuleInstanceMap sessionManager](self->_moduleInstanceMap, "sessionManager");
}

- (SVXDeviceSetupManager)deviceSetupManager
{
  return -[SVXModuleInstanceMap deviceSetupManager](self->_moduleInstanceMap, "deviceSetupManager");
}

- (SVXSessionManager)sessionManager
{
  return -[SVXModuleInstanceMap sessionManager](self->_moduleInstanceMap, "sessionManager");
}

- (SVXSpeechSynthesizer)speechSynthesizer
{
  return -[SVXModuleInstanceMap speechSynthesizer](self->_moduleInstanceMap, "speechSynthesizer");
}

- (SVXClientServiceServer)clientServiceServer
{
  return -[SVXModuleInstanceMap clientServiceServer](self->_moduleInstanceMap, "clientServiceServer");
}

- (SVXMyriadEventHandling)myriadEventHandler
{
  return (SVXMyriadEventHandling *)-[SVXModuleInstanceMap sessionManager](self->_moduleInstanceMap, "sessionManager");
}

- (SVXSynthesisManager)synthesisManager
{
  return -[SVXModuleInstanceMap synthesisManager](self->_moduleInstanceMap, "synthesisManager");
}

- (void)_startWithModuleInstanceMap:(id)a3 platformDependencies:(id)a4
{
  id v6;
  id v7;
  NSDictionary *modulesByIdentifier;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  modulesByIdentifier = self->_modulesByIdentifier;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__SVXVirtualDevice__startWithModuleInstanceMap_platformDependencies___block_invoke;
  v11[3] = &unk_24D24E660;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](modulesByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v11);

}

- (void)_stopWithModuleInstanceMap:(id)a3
{
  id v4;
  NSDictionary *modulesByIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  modulesByIdentifier = self->_modulesByIdentifier;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SVXVirtualDevice__stopWithModuleInstanceMap___block_invoke;
  v7[3] = &unk_24D24E610;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](modulesByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (AFPreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_moduleInstanceMap, 0);
  objc_storeStrong((id *)&self->_modulesByIdentifier, 0);
}

void __47__SVXVirtualDevice__stopWithModuleInstanceMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "moduleInstanceWithIdentifier:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__SVXVirtualDevice__stopWithModuleInstanceMap___block_invoke_2;
  v10[3] = &unk_24D24EF00;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v13 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performBlock:", v10);

}

uint64_t __47__SVXVirtualDevice__stopWithModuleInstanceMap___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopWithModuleInstanceProvider:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "setIsActive:", 0);
}

void __69__SVXVirtualDevice__startWithModuleInstanceMap_platformDependencies___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "moduleInstanceWithIdentifier:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__SVXVirtualDevice__startWithModuleInstanceMap_platformDependencies___block_invoke_2;
  v10[3] = &unk_24D24E638;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performBlock:", v10);

}

uint64_t __69__SVXVirtualDevice__startWithModuleInstanceMap_platformDependencies___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startWithModuleInstanceProvider:platformDependencies:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "setIsActive:", 1);
}

void __50__SVXVirtualDevice_startWithPlatformDependencies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "instanceClass")), "initWithModule:", v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);

}

@end
