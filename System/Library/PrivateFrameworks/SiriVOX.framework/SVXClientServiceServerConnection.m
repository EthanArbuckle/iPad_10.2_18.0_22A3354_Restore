@implementation SVXClientServiceServerConnection

- (SVXClientServiceServerConnection)initWithXPCConnection:(id)a3 performer:(id)a4 delegate:(id)a5
{
  id v10;
  id v11;
  id v12;
  SVXClientServiceServerConnection *v13;
  NSUUID *v14;
  NSUUID *uuid;
  NSXPCConnection *xpcConnection;
  void *v17;
  NSXPCConnection *v18;
  void *v19;
  NSXPCConnection *v20;
  uint64_t v21;
  NSXPCConnection *v22;
  SVXClientServiceRemoteDelegateSupplier *v23;
  SVXClientServiceRemoteDelegateSupplier *remoteDelegateSupplier;
  NSMutableArray *v25;
  NSMutableArray *pendingBlocksAfterConfigure;
  SVXAudioServicesUtils *v27;
  SVXAudioServicesUtils *audioServicesUtils;
  SVXInstanceInfoSupplier *v29;
  SVXInstanceInfoSupplier *instanceInfoSupplier;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXClientServiceServerConnection.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("performer != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXClientServiceServerConnection.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("xpcConnection != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXClientServiceServerConnection.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate != nil"));

LABEL_4:
  v40.receiver = self;
  v40.super_class = (Class)SVXClientServiceServerConnection;
  v13 = -[SVXClientServiceServerConnection init](&v40, sel_init);
  if (v13)
  {
    v14 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    uuid = v13->_uuid;
    v13->_uuid = v14;

    objc_storeStrong((id *)&v13->_xpcConnection, a3);
    xpcConnection = v13->_xpcConnection;
    SVXClientServiceDelegateCreateXPCInterface();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](xpcConnection, "setRemoteObjectInterface:", v17);

    -[NSXPCConnection setExportedObject:](v13->_xpcConnection, "setExportedObject:", v13);
    v18 = v13->_xpcConnection;
    SVXClientServiceCreateXPCInterface();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v18, "setExportedInterface:", v19);

    objc_initWeak(&location, v13);
    v20 = v13->_xpcConnection;
    v21 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __77__SVXClientServiceServerConnection_initWithXPCConnection_performer_delegate___block_invoke;
    v37[3] = &unk_24D24F0B8;
    objc_copyWeak(&v38, &location);
    -[NSXPCConnection setInterruptionHandler:](v20, "setInterruptionHandler:", v37);
    v22 = v13->_xpcConnection;
    v35[0] = v21;
    v35[1] = 3221225472;
    v35[2] = __77__SVXClientServiceServerConnection_initWithXPCConnection_performer_delegate___block_invoke_2;
    v35[3] = &unk_24D24F0B8;
    objc_copyWeak(&v36, &location);
    -[NSXPCConnection setInvalidationHandler:](v22, "setInvalidationHandler:", v35);
    objc_storeStrong((id *)&v13->_performer, a4);
    objc_storeWeak((id *)&v13->_delegate, v12);
    v23 = objc_alloc_init(SVXClientServiceRemoteDelegateSupplier);
    remoteDelegateSupplier = v13->_remoteDelegateSupplier;
    v13->_remoteDelegateSupplier = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingBlocksAfterConfigure = v13->_pendingBlocksAfterConfigure;
    v13->_pendingBlocksAfterConfigure = v25;

    v27 = objc_alloc_init(SVXAudioServicesUtils);
    audioServicesUtils = v13->_audioServicesUtils;
    v13->_audioServicesUtils = v27;

    v29 = -[SVXInstanceInfoSupplier initWithRemoteDelegateSupplier:performer:]([SVXInstanceInfoSupplier alloc], "initWithRemoteDelegateSupplier:performer:", v13->_remoteDelegateSupplier, v13->_performer);
    instanceInfoSupplier = v13->_instanceInfoSupplier;
    v13->_instanceInfoSupplier = v29;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (NSString)description
{
  id v3;
  void *v4;
  NSUUID *uuid;
  NSXPCConnection *xpcConnection;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10.receiver = self;
  v10.super_class = (Class)SVXClientServiceServerConnection;
  -[SVXClientServiceServerConnection description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  xpcConnection = self->_xpcConnection;
  -[SVXInstanceInfoSupplier cacheInstanceInfo](self->_instanceInfoSupplier, "cacheInstanceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {uuid = %@, xpcConnection = %@, instanceInfo = %@}"), v4, uuid, xpcConnection, v7);

  return (NSString *)v8;
}

- (void)getInstanceInfoWithCompletion:(id)a3
{
  -[SVXInstanceInfoSupplier getInstanceInfoWithConnection:completion:](self->_instanceInfoSupplier, "getInstanceInfoWithConnection:completion:", self->_xpcConnection, a3);
}

- (void)configureWithDeviceSetupManager:(id)a3 sessionManager:(id)a4 speechSynthesizer:(id)a5 synthesisManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SVXPerforming *performer;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  performer = self->_performer;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __118__SVXClientServiceServerConnection_configureWithDeviceSetupManager_sessionManager_speechSynthesizer_synthesisManager___block_invoke;
  v19[3] = &unk_24D24E920;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[SVXPerforming performBlock:](performer, "performBlock:", v19);

}

- (void)invalidate
{
  SVXPerforming *performer;
  _QWORD v3[5];

  performer = self->_performer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__SVXClientServiceServerConnection_invalidate__block_invoke;
  v3[3] = &unk_24D24EFF0;
  v3[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v3);
}

- (void)pingWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SVXClientServiceServerConnection pingWithReply:]";
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    performer = self->_performer;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__SVXClientServiceServerConnection_pingWithReply___block_invoke;
    v7[3] = &unk_24D24EF28;
    v7[4] = self;
    v8 = v4;
    -[SVXPerforming performBlock:](performer, "performBlock:", v7);

  }
LABEL_4:

}

- (void)fetchSessionStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SVXClientServiceServerConnection fetchSessionStateWithCompletion:]";
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    performer = self->_performer;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke;
    v7[3] = &unk_24D24EF28;
    v7[4] = self;
    v8 = v4;
    -[SVXPerforming performBlock:](performer, "performBlock:", v7);

  }
LABEL_4:

}

- (void)fetchSessionActivityStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SVXClientServiceServerConnection fetchSessionActivityStateWithCompletion:]";
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    performer = self->_performer;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke;
    v7[3] = &unk_24D24EF28;
    v7[4] = self;
    v8 = v4;
    -[SVXPerforming performBlock:](performer, "performBlock:", v7);

  }
LABEL_4:

}

- (void)fetchAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SVXClientServiceServerConnection fetchAlarmAndTimerFiringContextWithCompletion:]";
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    performer = self->_performer;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke;
    v7[3] = &unk_24D24EF28;
    v7[4] = self;
    v8 = v4;
    -[SVXPerforming performBlock:](performer, "performBlock:", v7);

  }
LABEL_4:

}

- (void)preheatWithActivationSource:(int64_t)a3
{
  void *v5;
  SVXPerforming *performer;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[SVXAudioServicesUtils shouldPrewarmAudioServicesActivate](self->_audioServicesUtils, "shouldPrewarmAudioServicesActivate"))
  {
    -[SVXAudioServicesUtils audioServicesActivateWithTimeout](self->_audioServicesUtils, "audioServicesActivateWithTimeout");
  }
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v7 = v5;
    if ((unint64_t)a3 > 9)
      v8 = CFSTR("(unknown)");
    else
      v8 = off_24D24D798[a3];
    v9 = v8;
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientServiceServerConnection preheatWithActivationSource:]";
    v13 = 2112;
    v14 = v9;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s activationSource = %@", buf, 0x16u);

  }
  performer = self->_performer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__SVXClientServiceServerConnection_preheatWithActivationSource___block_invoke;
  v10[3] = &unk_24D24EA18;
  v10[4] = self;
  v10[5] = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v10);
}

- (void)prewarmWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
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
  if (-[SVXAudioServicesUtils shouldPrewarmAudioServicesActivate](self->_audioServicesUtils, "shouldPrewarmAudioServicesActivate"))
  {
    -[SVXAudioServicesUtils audioServicesActivateWithTimeout](self->_audioServicesUtils, "audioServicesActivateWithTimeout");
  }
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SVXClientServiceServerConnection prewarmWithContext:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__SVXClientServiceServerConnection_prewarmWithContext_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)activateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
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
  -[SVXAudioServicesUtils audioServicesActivateWithTimeout](self->_audioServicesUtils, "audioServicesActivateWithTimeout");
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SVXClientServiceServerConnection activateWithContext:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__SVXClientServiceServerConnection_activateWithContext_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)deactivateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SVXClientServiceServerConnection deactivateWithContext:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__SVXClientServiceServerConnection_deactivateWithContext_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)performManualEndpointing
{
  NSObject *v3;
  SVXPerforming *performer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXClientServiceServerConnection performManualEndpointing]";
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__SVXClientServiceServerConnection_performManualEndpointing__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v5);
}

- (void)transitToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[6];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SVXClientServiceServerConnection transitToAutomaticEndpointingWithTimestamp:]";
    v10 = 2048;
    v11 = a3;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s timestamp = %lld", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke;
  v7[3] = &unk_24D24EA18;
  v7[4] = self;
  v7[5] = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);
}

- (void)fetchAudioPowerWithType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  SVXPerforming *performer;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v9 = v7;
    if ((unint64_t)a3 > 2)
      v10 = CFSTR("(unknown)");
    else
      v10 = off_24D24CCC8[a3];
    v11 = v10;
    *(_DWORD *)buf = 136315394;
    v16 = "-[SVXClientServiceServerConnection fetchAudioPowerWithType:completion:]";
    v17 = 2112;
    v18 = v11;
    _os_log_debug_impl(&dword_214934000, v9, OS_LOG_TYPE_DEBUG, "%s type = %@", buf, 0x16u);

    if (v6)
      goto LABEL_3;
  }
  else if (v6)
  {
LABEL_3:
    performer = self->_performer;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke;
    v12[3] = &unk_24D24EB40;
    v12[4] = self;
    v14 = a3;
    v13 = v6;
    -[SVXPerforming performBlock:](performer, "performBlock:", v12);

  }
}

- (void)prewarmRequest:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceServerConnection prewarmRequest:]";
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s request = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__SVXClientServiceServerConnection_prewarmRequest___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)synthesizeRequest:(id)a3 handlerUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SVXPerforming *performer;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[SVXClientServiceServerConnection synthesizeRequest:handlerUUID:completion:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s request = %@, handlerUUID = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __77__SVXClientServiceServerConnection_synthesizeRequest_handlerUUID_completion___block_invoke;
  v16[3] = &unk_24D24F068;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[SVXPerforming performBlock:](performer, "performBlock:", v16);

}

- (void)enqueueSpeechSynthesisRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SVXClientServiceServerConnection enqueueSpeechSynthesisRequest:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s request = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)cancelPendingSpeechSynthesisRequest:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceServerConnection cancelPendingSpeechSynthesisRequest:]";
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s request = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__SVXClientServiceServerConnection_cancelPendingSpeechSynthesisRequest___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)stopSpeechSynthesisRequest:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceServerConnection stopSpeechSynthesisRequest:]";
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s request = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__SVXClientServiceServerConnection_stopSpeechSynthesisRequest___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)setDeviceSetupContext:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceServerConnection setDeviceSetupContext:]";
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__SVXClientServiceServerConnection_setDeviceSetupContext___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)prepareForDeviceSetupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SVXClientServiceServerConnection prepareForDeviceSetupWithContext:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)sessionManager:(id)a3 willActivateWithContext:(id)a4
{
  id v5;
  NSObject *v6;
  SVXPerforming *performer;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientServiceServerConnection sessionManager:willActivateWithContext:]";
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_214934000, v6, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__SVXClientServiceServerConnection_sessionManager_willActivateWithContext___block_invoke;
  v9[3] = &unk_24D24F018;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)sessionManager:(id)a3 didActivateWithContext:(id)a4
{
  id v5;
  NSObject *v6;
  SVXPerforming *performer;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientServiceServerConnection sessionManager:didActivateWithContext:]";
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_214934000, v6, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__SVXClientServiceServerConnection_sessionManager_didActivateWithContext___block_invoke;
  v9[3] = &unk_24D24F018;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)sessionManager:(id)a3 didNotActivateWithContext:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  SVXPerforming *performer;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[SVXClientServiceServerConnection sessionManager:didNotActivateWithContext:error:]";
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_debug_impl(&dword_214934000, v9, OS_LOG_TYPE_DEBUG, "%s context = %@, error = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__SVXClientServiceServerConnection_sessionManager_didNotActivateWithContext_error___block_invoke;
  v13[3] = &unk_24D24EF00;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

}

- (void)sessionManager:(id)a3 willDeactivateWithContext:(id)a4
{
  id v5;
  NSObject *v6;
  SVXPerforming *performer;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientServiceServerConnection sessionManager:willDeactivateWithContext:]";
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_214934000, v6, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__SVXClientServiceServerConnection_sessionManager_willDeactivateWithContext___block_invoke;
  v9[3] = &unk_24D24F018;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)sessionManager:(id)a3 didDeactivateWithContext:(id)a4
{
  id v5;
  NSObject *v6;
  SVXPerforming *performer;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientServiceServerConnection sessionManager:didDeactivateWithContext:]";
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_214934000, v6, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__SVXClientServiceServerConnection_sessionManager_didDeactivateWithContext___block_invoke;
  v9[3] = &unk_24D24F018;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)audioPowerWillBeginUpdateForType:(int64_t)a3 wrapper:(id)a4
{
  id v6;
  void *v7;
  SVXPerforming *performer;
  id v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v10 = v7;
    if ((unint64_t)a3 > 2)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_24D24CCC8[a3];
    v12 = v11;
    *(_DWORD *)buf = 136315650;
    v17 = "-[SVXClientServiceServerConnection audioPowerWillBeginUpdateForType:wrapper:]";
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_214934000, v10, OS_LOG_TYPE_DEBUG, "%s type = %@, wrapper = %@", buf, 0x20u);

  }
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__SVXClientServiceServerConnection_audioPowerWillBeginUpdateForType_wrapper___block_invoke;
  v13[3] = &unk_24D24ECE8;
  v14 = v6;
  v15 = a3;
  v13[4] = self;
  v9 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

}

- (void)audioPowerDidEndUpdateForType:(int64_t)a3
{
  void *v5;
  SVXPerforming *performer;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v7 = v5;
    if ((unint64_t)a3 > 2)
      v8 = CFSTR("(unknown)");
    else
      v8 = off_24D24CCC8[a3];
    v9 = v8;
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientServiceServerConnection audioPowerDidEndUpdateForType:]";
    v13 = 2112;
    v14 = v9;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s type = %@", buf, 0x16u);

  }
  performer = self->_performer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__SVXClientServiceServerConnection_audioPowerDidEndUpdateForType___block_invoke;
  v10[3] = &unk_24D24EA18;
  v10[4] = self;
  v10[5] = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v10);
}

- (void)sessionWillChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  void *v7;
  SVXPerforming *performer;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  _QWORD v14[7];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v9 = v7;
    if ((unint64_t)a3 > 4)
      v10 = CFSTR("(unknown)");
    else
      v10 = off_24D24E7A8[a3];
    v11 = v10;
    if ((unint64_t)a4 > 4)
      v12 = CFSTR("(unknown)");
    else
      v12 = off_24D24E7A8[a4];
    v13 = v12;
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientServiceServerConnection sessionWillChangeFromState:toState:]";
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v13;
    _os_log_debug_impl(&dword_214934000, v9, OS_LOG_TYPE_DEBUG, "%s fromState = %@, toState = %@", buf, 0x20u);

  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__SVXClientServiceServerConnection_sessionWillChangeFromState_toState___block_invoke;
  v14[3] = &unk_24D24ED50;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);
}

- (void)sessionDidChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  void *v7;
  SVXPerforming *performer;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  _QWORD v14[7];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v9 = v7;
    if ((unint64_t)a3 > 4)
      v10 = CFSTR("(unknown)");
    else
      v10 = off_24D24E7A8[a3];
    v11 = v10;
    if ((unint64_t)a4 > 4)
      v12 = CFSTR("(unknown)");
    else
      v12 = off_24D24E7A8[a4];
    v13 = v12;
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientServiceServerConnection sessionDidChangeFromState:toState:]";
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v13;
    _os_log_debug_impl(&dword_214934000, v9, OS_LOG_TYPE_DEBUG, "%s fromState = %@, toState = %@", buf, 0x20u);

  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__SVXClientServiceServerConnection_sessionDidChangeFromState_toState___block_invoke;
  v14[3] = &unk_24D24ED50;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);
}

- (void)sessionWillPresentFeedbackWithDialogIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceServerConnection sessionWillPresentFeedbackWithDialogIdentifier:]";
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s dialogIdentifier = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__SVXClientServiceServerConnection_sessionWillPresentFeedbackWithDialogIdentifier___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)sessionWillStartSoundWithID:(int64_t)a3
{
  void *v5;
  SVXPerforming *performer;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v7 = v5;
    if ((unint64_t)a3 > 6)
      v8 = CFSTR("(unknown)");
    else
      v8 = off_24D24D238[a3];
    v9 = v8;
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientServiceServerConnection sessionWillStartSoundWithID:]";
    v13 = 2112;
    v14 = v9;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s soundID = %@", buf, 0x16u);

  }
  performer = self->_performer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__SVXClientServiceServerConnection_sessionWillStartSoundWithID___block_invoke;
  v10[3] = &unk_24D24EA18;
  v10[4] = self;
  v10[5] = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v10);
}

- (void)sessionDidStartSoundWithID:(int64_t)a3
{
  void *v5;
  SVXPerforming *performer;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v7 = v5;
    if ((unint64_t)a3 > 6)
      v8 = CFSTR("(unknown)");
    else
      v8 = off_24D24D238[a3];
    v9 = v8;
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientServiceServerConnection sessionDidStartSoundWithID:]";
    v13 = 2112;
    v14 = v9;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s soundID = %@", buf, 0x16u);

  }
  performer = self->_performer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__SVXClientServiceServerConnection_sessionDidStartSoundWithID___block_invoke;
  v10[3] = &unk_24D24EA18;
  v10[4] = self;
  v10[5] = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v10);
}

- (void)sessionDidStopSoundWithID:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  SVXPerforming *performer;
  id v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v10 = v7;
    if ((unint64_t)a3 > 6)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_24D24D238[a3];
    v12 = v11;
    *(_DWORD *)buf = 136315650;
    v17 = "-[SVXClientServiceServerConnection sessionDidStopSoundWithID:error:]";
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_214934000, v10, OS_LOG_TYPE_DEBUG, "%s soundID = %@, error = %@", buf, 0x20u);

  }
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__SVXClientServiceServerConnection_sessionDidStopSoundWithID_error___block_invoke;
  v13[3] = &unk_24D24ECE8;
  v14 = v6;
  v15 = a3;
  v13[4] = self;
  v9 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

}

- (void)sessionWillBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientServiceServerConnection sessionWillBecomeActiveWithActivationContext:turnID:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s activationContext = %@, turnID = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__SVXClientServiceServerConnection_sessionWillBecomeActiveWithActivationContext_turnID___block_invoke;
  v12[3] = &unk_24D24EF00;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)sessionDidBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientServiceServerConnection sessionDidBecomeActiveWithActivationContext:turnID:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s activationContext = %@, turnID = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__SVXClientServiceServerConnection_sessionDidBecomeActiveWithActivationContext_turnID___block_invoke;
  v12[3] = &unk_24D24EF00;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)sessionWillResignActiveWithOptions:(unint64_t)a3 duration:(double)a4
{
  void *v7;
  SVXPerforming *performer;
  NSObject *v9;
  void *v10;
  _QWORD v11[7];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v9 = v7;
    SVXSessionResignActiveOptionsGetNames(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v13 = "-[SVXClientServiceServerConnection sessionWillResignActiveWithOptions:duration:]";
    v14 = 2112;
    v15 = v10;
    v16 = 2048;
    v17 = a4;
    _os_log_debug_impl(&dword_214934000, v9, OS_LOG_TYPE_DEBUG, "%s options = %@, duration = %f", buf, 0x20u);

  }
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__SVXClientServiceServerConnection_sessionWillResignActiveWithOptions_duration___block_invoke;
  v11[3] = &unk_24D24ED50;
  v11[4] = self;
  v11[5] = a3;
  *(double *)&v11[6] = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);
}

- (void)sessionDidResignActiveWithDeactivationContext:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceServerConnection sessionDidResignActiveWithDeactivationContext:]";
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s deactivationContext = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__SVXClientServiceServerConnection_sessionDidResignActiveWithDeactivationContext___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)audioSessionWillBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  SVXPerforming *performer;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[SVXClientServiceServerConnection audioSessionWillBecomeActive:activationContext:deactivationContext:]";
    v20 = 1024;
    v21 = v6;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl(&dword_214934000, v10, OS_LOG_TYPE_DEBUG, "%s flag = %d, activationContext = %@, deactivationContext = %@", buf, 0x26u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __103__SVXClientServiceServerConnection_audioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke;
  v14[3] = &unk_24D24F130;
  v17 = v6;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);

}

- (void)audioSessionDidBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  SVXPerforming *performer;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[SVXClientServiceServerConnection audioSessionDidBecomeActive:activationContext:deactivationContext:]";
    v20 = 1024;
    v21 = v6;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl(&dword_214934000, v10, OS_LOG_TYPE_DEBUG, "%s flag = %d, activationContext = %@, deactivationContext = %@", buf, 0x26u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __102__SVXClientServiceServerConnection_audioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke;
  v14[3] = &unk_24D24F130;
  v17 = v6;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);

}

- (void)_performBlockAfterConfigure:(id)a3
{
  void (**v4)(void);
  void (**v5)(void);
  void (*v6)(void);
  NSMutableArray *pendingBlocksAfterConfigure;
  id v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(void);

  v4 = (void (**)(void))a3;
  v5 = v4;
  if (v4)
  {
    if (self->_isConfigured)
    {
      v6 = v4[2];
    }
    else
    {
      pendingBlocksAfterConfigure = self->_pendingBlocksAfterConfigure;
      if (pendingBlocksAfterConfigure)
      {
        v8 = objc_alloc(MEMORY[0x24BE09290]);
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __64__SVXClientServiceServerConnection__performBlockAfterConfigure___block_invoke;
        v10[3] = &unk_24D24E950;
        v11 = v5;
        v9 = (void *)objc_msgSend(v8, "initWithBlock:", v10);
        -[NSMutableArray addObject:](pendingBlocksAfterConfigure, "addObject:", v9);

        goto LABEL_7;
      }
      v6 = v4[2];
    }
    v6();
  }
LABEL_7:

}

- (void)_connectionInterrupted
{
  NSObject *v3;
  SVXPerforming *performer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  SVXClientServiceServerConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SVXClientServiceServerConnection _connectionInterrupted]";
    v8 = 2112;
    v9 = self;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__SVXClientServiceServerConnection__connectionInterrupted__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v5);
}

- (void)_connectionInvalidated
{
  NSObject *v3;
  SVXPerforming *performer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  SVXClientServiceServerConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SVXClientServiceServerConnection _connectionInvalidated]";
    v8 = 2112;
    v9 = self;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__SVXClientServiceServerConnection__connectionInvalidated__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v5);
}

- (void)_cleanUpXPCConnection
{
  NSXPCConnection *xpcConnection;
  NSObject *v4;
  NSXPCConnection *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  SVXClientServiceServerConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315394;
      v8 = "-[SVXClientServiceServerConnection _cleanUpXPCConnection]";
      v9 = 2112;
      v10 = self;
      _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v7, 0x16u);
      xpcConnection = self->_xpcConnection;
    }
    -[NSXPCConnection setExportedObject:](xpcConnection, "setExportedObject:", 0);
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clientServiceServerConnectionDidInvalidate:", self);

  }
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_synthesisManager, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_deviceSetupManager, 0);
  objc_storeStrong((id *)&self->_pendingBlocksAfterConfigure, 0);
  objc_storeStrong((id *)&self->_audioServicesUtils, 0);
  objc_storeStrong((id *)&self->_instanceInfoSupplier, 0);
  objc_storeStrong((id *)&self->_remoteDelegateSupplier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

uint64_t __58__SVXClientServiceServerConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpXPCConnection");
}

uint64_t __58__SVXClientServiceServerConnection__connectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpXPCConnection");
}

uint64_t __64__SVXClientServiceServerConnection__performBlockAfterConfigure___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

void __102__SVXClientServiceServerConnection_audioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_49);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyAudioSessionDidBecomeActive:activationContext:deactivationContext:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __102__SVXClientServiceServerConnection_audioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection audioSessionDidBecomeActive:activationContext:deactivationContext:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __103__SVXClientServiceServerConnection_audioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyAudioSessionWillBecomeActive:activationContext:deactivationContext:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __103__SVXClientServiceServerConnection_audioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection audioSessionWillBecomeActive:activationContext:deactivationContext:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __82__SVXClientServiceServerConnection_sessionDidResignActiveWithDeactivationContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_47_12037);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifySessionDidResignActiveWithDeactivationContext:", *(_QWORD *)(a1 + 40));

}

void __82__SVXClientServiceServerConnection_sessionDidResignActiveWithDeactivationContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionDidResignActiveWithDeactivationContext:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __80__SVXClientServiceServerConnection_sessionWillResignActiveWithOptions_duration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_46);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifySessionWillResignActiveWithOptions:duration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));

}

void __80__SVXClientServiceServerConnection_sessionWillResignActiveWithOptions_duration___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionWillResignActiveWithOptions:duration:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __87__SVXClientServiceServerConnection_sessionDidBecomeActiveWithActivationContext_turnID___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(a1[4] + 8), &__block_literal_global_45);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifySessionDidBecomeActiveWithActivationContext:turnID:", a1[5], a1[6]);

}

void __87__SVXClientServiceServerConnection_sessionDidBecomeActiveWithActivationContext_turnID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionDidBecomeActiveWithActivationContext:turnID:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __88__SVXClientServiceServerConnection_sessionWillBecomeActiveWithActivationContext_turnID___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(a1[4] + 8), &__block_literal_global_44);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifySessionWillBecomeActiveWithActivationContext:turnID:", a1[5], a1[6]);

}

void __88__SVXClientServiceServerConnection_sessionWillBecomeActiveWithActivationContext_turnID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionWillBecomeActiveWithActivationContext:turnID:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __68__SVXClientServiceServerConnection_sessionDidStopSoundWithID_error___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(a1[4] + 8), &__block_literal_global_43);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifySessionDidStopSoundWithID:error:", a1[6], a1[5]);

}

void __68__SVXClientServiceServerConnection_sessionDidStopSoundWithID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionDidStopSoundWithID:error:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __63__SVXClientServiceServerConnection_sessionDidStartSoundWithID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_42);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifySessionDidStartSoundWithID:", *(_QWORD *)(a1 + 40));

}

void __63__SVXClientServiceServerConnection_sessionDidStartSoundWithID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionDidStartSoundWithID:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __64__SVXClientServiceServerConnection_sessionWillStartSoundWithID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_41);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifySessionWillStartSoundWithID:", *(_QWORD *)(a1 + 40));

}

void __64__SVXClientServiceServerConnection_sessionWillStartSoundWithID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionWillStartSoundWithID:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __83__SVXClientServiceServerConnection_sessionWillPresentFeedbackWithDialogIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_40);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifySessionWillPresentFeedbackWithDialogIdentifier:", *(_QWORD *)(a1 + 40));

}

void __83__SVXClientServiceServerConnection_sessionWillPresentFeedbackWithDialogIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionWillPresentFeedbackWithDialogIdentifier:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __70__SVXClientServiceServerConnection_sessionDidChangeFromState_toState___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(a1[4] + 8), &__block_literal_global_39);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyDidChangeSessionStateFrom:to:", a1[5], a1[6]);

}

void __70__SVXClientServiceServerConnection_sessionDidChangeFromState_toState___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionDidChangeFromState:toState:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __71__SVXClientServiceServerConnection_sessionWillChangeFromState_toState___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(a1[4] + 8), &__block_literal_global_38);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyWillChangeSessionStateFrom:to:", a1[5], a1[6]);

}

void __71__SVXClientServiceServerConnection_sessionWillChangeFromState_toState___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionWillChangeFromState:toState:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __66__SVXClientServiceServerConnection_audioPowerDidEndUpdateForType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_37);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyDidEndUpdateAudioPowerWithType:", *(_QWORD *)(a1 + 40));

}

void __66__SVXClientServiceServerConnection_audioPowerDidEndUpdateForType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection audioPowerDidEndUpdateForType:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __77__SVXClientServiceServerConnection_audioPowerWillBeginUpdateForType_wrapper___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(a1[4] + 8), &__block_literal_global_36);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyWillBeginUpdateAudioPowerWithType:wrapper:", a1[6], a1[5]);

}

void __77__SVXClientServiceServerConnection_audioPowerWillBeginUpdateForType_wrapper___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection audioPowerWillBeginUpdateForType:wrapper:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __76__SVXClientServiceServerConnection_sessionManager_didDeactivateWithContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_35);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyDidDeactivateWithContext:", *(_QWORD *)(a1 + 40));

}

void __76__SVXClientServiceServerConnection_sessionManager_didDeactivateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionManager:didDeactivateWithContext:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __77__SVXClientServiceServerConnection_sessionManager_willDeactivateWithContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_34);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyWillDeactivateWithContext:", *(_QWORD *)(a1 + 40));

}

void __77__SVXClientServiceServerConnection_sessionManager_willDeactivateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionManager:willDeactivateWithContext:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __83__SVXClientServiceServerConnection_sessionManager_didNotActivateWithContext_error___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(a1[4] + 8), &__block_literal_global_33);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyDidNotActivateWithContext:error:", a1[5], a1[6]);

}

void __83__SVXClientServiceServerConnection_sessionManager_didNotActivateWithContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionManager:didNotActivateWithContext:error:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __74__SVXClientServiceServerConnection_sessionManager_didActivateWithContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_32);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyDidActivateWithContext:", *(_QWORD *)(a1 + 40));

}

void __74__SVXClientServiceServerConnection_sessionManager_didActivateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionManager:didActivateWithContext:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __75__SVXClientServiceServerConnection_sessionManager_willActivateWithContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDelegateWithConnection:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_31);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyWillActivateWithContext:", *(_QWORD *)(a1 + 40));

}

void __75__SVXClientServiceServerConnection_sessionManager_willActivateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionManager:willActivateWithContext:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke_2;
  v3[3] = &unk_24D24EA40;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_performBlockAfterConfigure:", v3);

}

void __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke_3;
    v9[3] = &unk_24D24EBE0;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v4, "prepareForSetupWithContext:completion:", v3, v9);
    v5 = v10;
LABEL_7:

    return;
  }
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientServiceServerConnection prepareForDeviceSetupWithContext:completion:]_block_invoke";
    v13 = 2112;
    v14 = v8;
    _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v5);
    goto LABEL_7;
  }
}

void __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "-[SVXClientServiceServerConnection prepareForDeviceSetupWithContext:completion:]_block_invoke_3";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s flow = %@, error = %@", (uint8_t *)&v9, 0x20u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

void __58__SVXClientServiceServerConnection_setDeviceSetupContext___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __58__SVXClientServiceServerConnection_setDeviceSetupContext___block_invoke_2;
  v2[3] = &unk_24D24EB68;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_performBlockAfterConfigure:", v2);

}

void __58__SVXClientServiceServerConnection_setDeviceSetupContext___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(_QWORD **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = (void *)v3[9];
    objc_msgSend(v3, "uuid");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContext:forUUID:", v4);

  }
  else
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v10 = "-[SVXClientServiceServerConnection setDeviceSetupContext:]_block_invoke_2";
      v11 = 2112;
      v12 = v7;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
  }
}

void __63__SVXClientServiceServerConnection_stopSpeechSynthesisRequest___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __63__SVXClientServiceServerConnection_stopSpeechSynthesisRequest___block_invoke_2;
  v2[3] = &unk_24D24EB68;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_performBlockAfterConfigure:", v2);

}

void __63__SVXClientServiceServerConnection_stopSpeechSynthesisRequest___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "stopRequest:withInterruptionBehavior:", *(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315394;
      v6 = "-[SVXClientServiceServerConnection stopSpeechSynthesisRequest:]_block_invoke_2";
      v7 = 2112;
      v8 = v4;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v5, 0x16u);
    }
  }
}

void __72__SVXClientServiceServerConnection_cancelPendingSpeechSynthesisRequest___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __72__SVXClientServiceServerConnection_cancelPendingSpeechSynthesisRequest___block_invoke_2;
  v2[3] = &unk_24D24EB68;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_performBlockAfterConfigure:", v2);

}

void __72__SVXClientServiceServerConnection_cancelPendingSpeechSynthesisRequest___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "cancelRequest:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315394;
      v6 = "-[SVXClientServiceServerConnection cancelPendingSpeechSynthesisRequest:]_block_invoke_2";
      v7 = 2112;
      v8 = v4;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v5, 0x16u);
    }
  }
}

void __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_2;
  v3[3] = &unk_24D24EA40;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_performBlockAfterConfigure:", v3);

}

void __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  SVXSpeechSynthesisResult *v8;
  SVXSpeechSynthesisResult *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_3;
    v11[3] = &unk_24D24EBB8;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v4, "enqueueRequest:languageCode:voiceName:gender:audioSessionID:preparation:finalization:taskTracker:analyticsContext:", v3, 0, 0, 0, 0, 0, v11, 0, 0);
    v5 = v12;
LABEL_7:

    return;
  }
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v14 = "-[SVXClientServiceServerConnection enqueueSpeechSynthesisRequest:completion:]_block_invoke";
    v15 = 2112;
    v16 = v10;
    _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    v8 = [SVXSpeechSynthesisResult alloc];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:](v8, "initWithType:utteranceInfo:error:", 4, 0, v5);
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v7 + 16))(v7, v9);

    goto LABEL_7;
  }
}

void __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceServerConnection enqueueSpeechSynthesisRequest:completion:]_block_invoke_3";
    v8 = 2112;
    v9 = v3;
    _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __77__SVXClientServiceServerConnection_synthesizeRequest_handlerUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __77__SVXClientServiceServerConnection_synthesizeRequest_handlerUUID_completion___block_invoke_2;
  v3[3] = &unk_24D24EB90;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_performBlockAfterConfigure:", v3);

}

void __77__SVXClientServiceServerConnection_synthesizeRequest_handlerUUID_completion___block_invoke_2(_QWORD *a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  SVXSpeechSynthesisResult *v5;
  void *v6;
  SVXSpeechSynthesisResult *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(a1[4] + 96), "synthesizeRequest:xpcConnection:handlerUUID:completion:", a1[5], *(_QWORD *)(a1[4] + 8), a1[6], a1[7]);
  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = 136315394;
      v10 = "-[SVXClientServiceServerConnection synthesizeRequest:handlerUUID:completion:]_block_invoke_2";
      v11 = 2112;
      v12 = v8;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v9, 0x16u);
    }
    v4 = a1[7];
    if (v4)
    {
      v5 = [SVXSpeechSynthesisResult alloc];
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:](v5, "initWithType:utteranceInfo:error:", 4, 0, v6);
      (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v4 + 16))(v4, v7);

    }
  }
}

void __51__SVXClientServiceServerConnection_prewarmRequest___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__SVXClientServiceServerConnection_prewarmRequest___block_invoke_2;
  v2[3] = &unk_24D24EB68;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_performBlockAfterConfigure:", v2);

}

void __51__SVXClientServiceServerConnection_prewarmRequest___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "prewarmRequest:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315394;
      v6 = "-[SVXClientServiceServerConnection prewarmRequest:]_block_invoke_2";
      v7 = 2112;
      v8 = v4;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v5, 0x16u);
    }
  }
}

void __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  uint64_t v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke_2;
  v3[3] = &unk_24D24EB18;
  v2 = (void *)a1[5];
  v1 = a1[6];
  v4 = (id)a1[4];
  v6 = v1;
  v5 = v2;
  objc_msgSend(v4, "_performBlockAfterConfigure:", v3);

}

void __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke_2(_QWORD *a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (void *)a1[5];
    v4 = *(void **)(a1[4] + 80);
    v5 = a1[6];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke_3;
    v10[3] = &unk_24D24EAF0;
    v11 = v3;
    objc_msgSend(v4, "fetchCurrentAudioPowerWithType:completion:", v5, v10);
    v6 = v11;
  }
  else
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      *(_DWORD *)buf = 136315394;
      v13 = "-[SVXClientServiceServerConnection fetchAudioPowerWithType:completion:]_block_invoke";
      v14 = 2112;
      v15 = v9;
      _os_log_error_impl(&dword_214934000, v7, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
    v8 = a1[5];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v6);
  }

}

void __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[SVXClientServiceServerConnection fetchAudioPowerWithType:completion:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s wrapper = %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_2;
  v3[3] = &unk_24D24E9F0;
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  return objc_msgSend(v4, "_performBlockAfterConfigure:", v3);
}

void __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_3;
    v7[3] = &__block_descriptor_40_e20_v16__0__SVXSession_8l;
    v7[4] = v3;
    objc_msgSend(v4, "getCurrentSessionUsingBlock:", v7);
  }
  else
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v9 = "-[SVXClientServiceServerConnection transitToAutomaticEndpointingWithTimestamp:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_214934000, v5, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
  }
}

void __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[SVXClientServiceServerConnection transitToAutomaticEndpointingWithTimestamp:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s session = %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(v3, "transitSpeechToAutomaticEndpointingWithTimestamp:", *(_QWORD *)(a1 + 32));

}

uint64_t __60__SVXClientServiceServerConnection_performManualEndpointing__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__SVXClientServiceServerConnection_performManualEndpointing__block_invoke_2;
  v3[3] = &unk_24D24EAA8;
  v3[4] = v1;
  return objc_msgSend(v1, "_performBlockAfterConfigure:", v3);
}

void __60__SVXClientServiceServerConnection_performManualEndpointing__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "getCurrentSessionUsingBlock:", &__block_literal_global_12098);
  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315394;
      v6 = "-[SVXClientServiceServerConnection performManualEndpointing]_block_invoke";
      v7 = 2112;
      v8 = v4;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v5, 0x16u);
    }
  }
}

void __60__SVXClientServiceServerConnection_performManualEndpointing__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection performManualEndpointing]_block_invoke_3";
    v6 = 2112;
    v7 = v2;
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s session = %@", (uint8_t *)&v4, 0x16u);
  }
  objc_msgSend(v2, "stopSpeech");

}

void __69__SVXClientServiceServerConnection_deactivateWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__SVXClientServiceServerConnection_deactivateWithContext_completion___block_invoke_2;
  v3[3] = &unk_24D24EA40;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_performBlockAfterConfigure:", v3);

}

uint64_t __69__SVXClientServiceServerConnection_deactivateWithContext_completion___block_invoke_2(_QWORD *a1, int a2)
{
  uint64_t result;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2)
    return objc_msgSend(*(id *)(a1[4] + 80), "deactivateWithContext:completion:", a1[5], a1[6]);
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v5 = a1[4];
    v6 = 136315394;
    v7 = "-[SVXClientServiceServerConnection deactivateWithContext:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v6, 0x16u);
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __67__SVXClientServiceServerConnection_activateWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__SVXClientServiceServerConnection_activateWithContext_completion___block_invoke_2;
  v3[3] = &unk_24D24EA40;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_performBlockAfterConfigure:", v3);

}

void __67__SVXClientServiceServerConnection_activateWithContext_completion___block_invoke_2(_QWORD *a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(a1[4] + 80), "activateWithContext:completion:", a1[5], a1[6]);
  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v6 = a1[4];
      v7 = 136315394;
      v8 = "-[SVXClientServiceServerConnection activateWithContext:completion:]_block_invoke_2";
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v7, 0x16u);
    }
    v4 = a1[6];
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    }
  }
}

void __66__SVXClientServiceServerConnection_prewarmWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__SVXClientServiceServerConnection_prewarmWithContext_completion___block_invoke_2;
  v3[3] = &unk_24D24EA40;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_performBlockAfterConfigure:", v3);

}

uint64_t __66__SVXClientServiceServerConnection_prewarmWithContext_completion___block_invoke_2(_QWORD *a1, int a2)
{
  uint64_t result;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2)
    return objc_msgSend(*(id *)(a1[4] + 80), "prewarmWithContext:completion:", a1[5], a1[6]);
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v5 = a1[4];
    v6 = 136315394;
    v7 = "-[SVXClientServiceServerConnection prewarmWithContext:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v6, 0x16u);
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__SVXClientServiceServerConnection_preheatWithActivationSource___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __64__SVXClientServiceServerConnection_preheatWithActivationSource___block_invoke_2;
  v3[3] = &unk_24D24E9F0;
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  return objc_msgSend(v4, "_performBlockAfterConfigure:", v3);
}

void __64__SVXClientServiceServerConnection_preheatWithActivationSource___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "preheatWithActivationSource:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315394;
      v6 = "-[SVXClientServiceServerConnection preheatWithActivationSource:]_block_invoke_2";
      v7 = 2112;
      v8 = v4;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v5, 0x16u);
    }
  }
}

void __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2;
  v2[3] = &unk_24D24E978;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_performBlockAfterConfigure:", v2);

}

void __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_3;
    v9[3] = &unk_24D24E9C8;
    v10 = v3;
    objc_msgSend(v4, "fetchCurrentAlarmAndTimerFiringContextWithCompletion:", v9);
    v5 = v10;
  }
  else
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v12 = "-[SVXClientServiceServerConnection fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke";
      v13 = 2112;
      v14 = v8;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v5);
  }

}

void __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[SVXClientServiceServerConnection fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s alarmAndTimerFiringContext = %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke_2;
  v2[3] = &unk_24D24E978;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_performBlockAfterConfigure:", v2);

}

void __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke_3;
    v9[3] = &unk_24D24E9A0;
    v10 = v3;
    objc_msgSend(v4, "fetchCurrentActivityStateWithCompletion:", v9);
    v5 = v10;
  }
  else
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v12 = "-[SVXClientServiceServerConnection fetchSessionActivityStateWithCompletion:]_block_invoke";
      v13 = 2112;
      v14 = v8;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v5);
  }

}

uint64_t __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceServerConnection fetchSessionActivityStateWithCompletion:]_block_invoke_3";
    v8 = 1024;
    v9 = a2;
    _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s isActive = %d", (uint8_t *)&v6, 0x12u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke_2;
  v2[3] = &unk_24D24E978;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_performBlockAfterConfigure:", v2);

}

void __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke_3;
    v9[3] = &unk_24D24E950;
    v10 = v3;
    objc_msgSend(v4, "fetchCurrentStateWithCompletion:", v9);
    v5 = v10;
  }
  else
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v12 = "-[SVXClientServiceServerConnection fetchSessionStateWithCompletion:]_block_invoke";
      v13 = 2112;
      v14 = v8;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v5);
  }

}

uint64_t __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke_3(uint64_t a1, unint64_t a2)
{
  void *v4;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v6 = v4;
    if (a2 > 4)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_24D24E7A8[a2];
    v8 = v7;
    v9 = 136315394;
    v10 = "-[SVXClientServiceServerConnection fetchSessionStateWithCompletion:]_block_invoke_3";
    v11 = 2112;
    v12 = v8;
    _os_log_debug_impl(&dword_214934000, v6, OS_LOG_TYPE_DEBUG, "%s currentState = %@", (uint8_t *)&v9, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__SVXClientServiceServerConnection_pingWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SVXClientServiceServerConnection_pingWithReply___block_invoke_2;
  v4[3] = &unk_24D24E978;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_performBlockAfterConfigure:", v4);

}

void __50__SVXClientServiceServerConnection_pingWithReply___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315138;
      v9 = "-[SVXClientServiceServerConnection pingWithReply:]_block_invoke_2";
      _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s reply", (uint8_t *)&v8, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315394;
      v9 = "-[SVXClientServiceServerConnection pingWithReply:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v8, 0x16u);
    }
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __46__SVXClientServiceServerConnection_invalidate__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[9];
  objc_msgSend(v2, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContext:forUUID:", 0, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeActivationListener:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAudioPowerUpdateListener:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeActivityListener:");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 80);
  *(_QWORD *)(v7 + 80) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 96);
  *(_QWORD *)(v11 + 96) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_cleanUpXPCConnection");
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 64);
    *(_QWORD *)(v15 + 64) = 0;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "invokeWithSignal:", -3, (_QWORD)v22);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v19);
    }

  }
}

void __118__SVXClientServiceServerConnection_configureWithDeviceSetupManager_sessionManager_speechSynthesizer_synthesisManager___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 56));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addActivationListener:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addAudioPowerUpdateListener:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addActivityListener:");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = 0;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "invokeWithSignal:", 0, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

void __77__SVXClientServiceServerConnection_initWithXPCConnection_performer_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __77__SVXClientServiceServerConnection_initWithXPCConnection_performer_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

@end
