@implementation SVXClientServiceConnection

- (void)dealloc
{
  objc_super v3;

  -[SVXClientServiceConnection _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SVXClientServiceConnection;
  -[SVXClientServiceConnection dealloc](&v3, sel_dealloc);
}

- (SVXClientServiceConnection)initWithComponents:(unint64_t)a3 delegate:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  SVXClientServiceConnection *v9;

  v6 = (void *)MEMORY[0x24BE091F8];
  v7 = a4;
  objc_msgSend(v6, "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SVXClientServiceConnection initWithComponents:instanceContext:delegate:](self, "initWithComponents:instanceContext:delegate:", a3, v8, v7);

  return v9;
}

- (SVXClientServiceConnection)initWithComponents:(unint64_t)a3 instanceContext:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  SVXQueuePerformer *v11;
  SVXClientAudioSystemService *v12;
  void *v13;
  SVXClientActivationService *v14;
  void *v15;
  void *v16;
  SVXClientDeviceService *v17;
  void *v18;
  void *v19;
  void *v20;
  SVXClientAudioPowerService *v21;
  void *v22;
  SVXClientAudioPowerService *v23;
  void *v24;
  void *v25;
  SVXClientSessionService *v26;
  void *v27;
  SVXClientSessionService *v28;
  void *v29;
  SVXClientSpeechSynthesisService *v30;
  void *v31;
  SVXClientSpeechSynthesisService *v32;
  void *v33;
  SVXClientKeepAliveService *v34;
  void *v35;
  SVXClientKeepAliveService *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  SVXQueuePerformer *v42;
  SVXQueuePerformer *v43;
  SVXClientServiceConnection *v44;
  SVXClientAudioPowerService *v45;
  SVXClientAudioPowerService *v46;
  SVXClientDeviceService *v47;
  SVXClientAudioSystemService *v48;
  SVXClientActivationService *v49;
  void *v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  unint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[SVXClientServiceConnection initWithComponents:instanceContext:delegate:]";
    v53 = 2048;
    v54 = a3;
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s components = %lu", buf, 0x16u);
  }
  v11 = -[SVXQueuePerformer initWithIdentifier:qosClass:relativePriority:options:]([SVXQueuePerformer alloc], "initWithIdentifier:qosClass:relativePriority:options:", CFSTR("Client Service Connection"), 33, 0, 2);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE090C8]), "initWithInstanceContext:", v8);
  if ((a3 & 2) != 0)
  {
    v14 = [SVXClientActivationService alloc];
    objc_msgSend(v9, "clientServiceConnection:performerForComponent:", self, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v49 = -[SVXClientActivationService initWithClientServiceProvider:analytics:performer:](v14, "initWithClientServiceProvider:analytics:performer:", self, v50, v15);
    }
    else
    {
      +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[SVXClientActivationService initWithClientServiceProvider:analytics:performer:](v14, "initWithClientServiceProvider:analytics:performer:", self, v50, v19);

    }
    if ((a3 & 4) != 0)
    {
LABEL_5:
      v12 = [SVXClientAudioSystemService alloc];
      objc_msgSend(v9, "clientServiceConnection:performerForComponent:", self, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v48 = -[SVXClientAudioSystemService initWithClientServiceProvider:analytics:performer:](v12, "initWithClientServiceProvider:analytics:performer:", self, v50, v13);
      }
      else
      {
        +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[SVXClientAudioSystemService initWithClientServiceProvider:analytics:performer:](v12, "initWithClientServiceProvider:analytics:performer:", self, v50, v16);

      }
      if ((a3 & 8) != 0)
        goto LABEL_11;
LABEL_16:
      v47 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v49 = 0;
    if ((a3 & 4) != 0)
      goto LABEL_5;
  }
  v48 = 0;
  if ((a3 & 8) == 0)
    goto LABEL_16;
LABEL_11:
  v17 = [SVXClientDeviceService alloc];
  objc_msgSend(v9, "clientServiceConnection:performerForComponent:", self, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v47 = -[SVXClientDeviceService initWithClientServiceProvider:analytics:performer:](v17, "initWithClientServiceProvider:analytics:performer:", self, v50, v18);
  }
  else
  {
    +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[SVXClientDeviceService initWithClientServiceProvider:analytics:performer:](v17, "initWithClientServiceProvider:analytics:performer:", self, v50, v20);

  }
LABEL_19:
  if ((a3 & 0x10) == 0)
  {
    v46 = 0;
    if ((a3 & 0x20) != 0)
      goto LABEL_21;
LABEL_31:
    v45 = 0;
    if ((a3 & 0x40) != 0)
      goto LABEL_27;
LABEL_32:
    v28 = 0;
    if ((a3 & 0x80) == 0)
      goto LABEL_37;
LABEL_33:
    v30 = [SVXClientSpeechSynthesisService alloc];
    objc_msgSend(v9, "clientServiceConnection:performerForComponent:", self, 7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = -[SVXClientSpeechSynthesisService initWithClientServiceProvider:analytics:performer:](v30, "initWithClientServiceProvider:analytics:performer:", self, v50, v31);
    }
    else
    {
      +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
      v42 = v11;
      v37 = v8;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[SVXClientSpeechSynthesisService initWithClientServiceProvider:analytics:performer:](v30, "initWithClientServiceProvider:analytics:performer:", self, v50, v38);

      v8 = v37;
      v11 = v42;
    }

    if ((a3 & 0x100) != 0)
      goto LABEL_38;
LABEL_42:
    v36 = 0;
    goto LABEL_45;
  }
  v23 = [SVXClientAudioPowerService alloc];
  objc_msgSend(v9, "clientServiceConnection:performerForComponent:", self, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v46 = -[SVXClientAudioPowerService initWithType:clientServiceProvider:analytics:performer:](v23, "initWithType:clientServiceProvider:analytics:performer:", 1, self, v50, v24);
  }
  else
  {
    +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[SVXClientAudioPowerService initWithType:clientServiceProvider:analytics:performer:](v23, "initWithType:clientServiceProvider:analytics:performer:", 1, self, v50, v29);

  }
  if ((a3 & 0x20) == 0)
    goto LABEL_31;
LABEL_21:
  v21 = [SVXClientAudioPowerService alloc];
  objc_msgSend(v9, "clientServiceConnection:performerForComponent:", self, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v45 = -[SVXClientAudioPowerService initWithType:clientServiceProvider:analytics:performer:](v21, "initWithType:clientServiceProvider:analytics:performer:", 2, self, v50, v22);
  }
  else
  {
    +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[SVXClientAudioPowerService initWithType:clientServiceProvider:analytics:performer:](v21, "initWithType:clientServiceProvider:analytics:performer:", 2, self, v50, v25);

  }
  if ((a3 & 0x40) == 0)
    goto LABEL_32;
LABEL_27:
  v26 = [SVXClientSessionService alloc];
  objc_msgSend(v9, "clientServiceConnection:performerForComponent:", self, 6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = -[SVXClientSessionService initWithClientServiceProvider:analytics:performer:](v26, "initWithClientServiceProvider:analytics:performer:", self, v50, v27);
  }
  else
  {
    +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[SVXClientSessionService initWithClientServiceProvider:analytics:performer:](v26, "initWithClientServiceProvider:analytics:performer:", self, v50, v33);

  }
  if ((a3 & 0x80) != 0)
    goto LABEL_33;
LABEL_37:
  v32 = 0;
  if ((a3 & 0x100) == 0)
    goto LABEL_42;
LABEL_38:
  v34 = [SVXClientKeepAliveService alloc];
  objc_msgSend(v9, "clientServiceConnection:performerForComponent:", self, 8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = -[SVXClientKeepAliveService initWithClientServiceProvider:analytics:performer:](v34, "initWithClientServiceProvider:analytics:performer:", self, v50, v35);
  }
  else
  {
    +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
    v43 = v11;
    v39 = v8;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[SVXClientKeepAliveService initWithClientServiceProvider:analytics:performer:](v34, "initWithClientServiceProvider:analytics:performer:", self, v50, v40);

    v8 = v39;
    v11 = v43;
  }

LABEL_45:
  v44 = -[SVXClientServiceConnection initWithQueuePerformer:activationService:audioSystemService:deviceService:inputAudioPowerService:outputAudioPowerService:sessionService:speechSynthesisService:keepAliveService:instanceContext:delegate:](self, "initWithQueuePerformer:activationService:audioSystemService:deviceService:inputAudioPowerService:outputAudioPowerService:sessionService:speechSynthesisService:keepAliveService:instanceContext:delegate:", v11, v49, v48, v47, v46, v45, v28, v32, v36, v8, v9);

  return v44;
}

- (SVXClientServiceConnection)initWithQueuePerformer:(id)a3 activationService:(id)a4 audioSystemService:(id)a5 deviceService:(id)a6 inputAudioPowerService:(id)a7 outputAudioPowerService:(id)a8 sessionService:(id)a9 speechSynthesisService:(id)a10 keepAliveService:(id)a11 instanceContext:(id)a12 delegate:(id)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;
  id v24;
  id v26;
  id v27;
  id v29;
  SVXXPCConnectionFactory *v31;
  SVXClientServiceConnection *v33;

  v29 = a13;
  v27 = a12;
  v16 = a11;
  v24 = a10;
  v17 = a9;
  v23 = a8;
  v18 = a7;
  v19 = a6;
  v26 = a5;
  v20 = a4;
  v21 = a3;
  v31 = objc_alloc_init(SVXXPCConnectionFactory);
  v33 = -[SVXClientServiceConnection initWithQueuePerformer:activationService:audioSystemService:deviceService:inputAudioPowerService:outputAudioPowerService:sessionService:speechSynthesisService:keepAliveService:instanceContext:connectionFactory:delegate:](self, "initWithQueuePerformer:activationService:audioSystemService:deviceService:inputAudioPowerService:outputAudioPowerService:sessionService:speechSynthesisService:keepAliveService:instanceContext:connectionFactory:delegate:", v21, v20, v26, v19, v18, v23, v17, v24, v16, v27, v31, v29);

  return v33;
}

- (SVXClientServiceConnection)initWithQueuePerformer:(id)a3 activationService:(id)a4 audioSystemService:(id)a5 deviceService:(id)a6 inputAudioPowerService:(id)a7 outputAudioPowerService:(id)a8 sessionService:(id)a9 speechSynthesisService:(id)a10 keepAliveService:(id)a11 instanceContext:(id)a12 connectionFactory:(id)a13 delegate:(id)a14
{
  id v19;
  id v20;
  id v21;
  SVXClientServiceConnection *v22;
  NSObject *v23;
  AFInstanceContext *v24;
  AFInstanceContext *instanceContext;
  id v28;
  id v29;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  SVXClientServiceConnection *v42;
  objc_super v43;
  uint8_t buf[4];
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v28 = a4;
  v39 = a4;
  v29 = a5;
  v38 = a5;
  v37 = a6;
  v36 = a7;
  v35 = a8;
  v34 = a9;
  v33 = a10;
  v32 = a11;
  v19 = a12;
  v20 = a13;
  v21 = a14;
  v43.receiver = self;
  v43.super_class = (Class)SVXClientServiceConnection;
  v22 = -[SVXClientServiceConnection init](&v43, sel_init);
  if (v22)
  {
    v31 = v21;
    v23 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[SVXClientServiceConnection initWithQueuePerformer:activationService:audioSystemService:deviceService:input"
            "AudioPowerService:outputAudioPowerService:sessionService:speechSynthesisService:keepAliveService:instanceCon"
            "text:connectionFactory:delegate:]";
      _os_log_impl(&dword_214934000, v23, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    objc_storeStrong((id *)&v22->_queuePerformer, a3);
    objc_storeStrong((id *)&v22->_activationService, v28);
    objc_storeStrong((id *)&v22->_audioSystemService, v29);
    objc_storeStrong((id *)&v22->_deviceService, a6);
    objc_storeStrong((id *)&v22->_inputAudioPowerService, a7);
    objc_storeStrong((id *)&v22->_outputAudioPowerService, a8);
    objc_storeStrong((id *)&v22->_sessionService, a9);
    objc_storeStrong((id *)&v22->_speechSynthesisService, a10);
    objc_storeStrong((id *)&v22->_keepAliveService, a11);
    if (v19)
    {
      v24 = (AFInstanceContext *)v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE091F8], "defaultContext");
      v24 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v22->_instanceContext;
    v22->_instanceContext = v24;
    v21 = v31;

    objc_storeStrong((id *)&v22->_connectionFactory, a13);
    objc_storeWeak((id *)&v22->_delegate, v31);
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __249__SVXClientServiceConnection_initWithQueuePerformer_activationService_audioSystemService_deviceService_inputAudioPowerService_outputAudioPowerService_sessionService_speechSynthesisService_keepAliveService_instanceContext_connectionFactory_delegate___block_invoke;
    v41[3] = &unk_24D24DCC8;
    v42 = v22;
    -[SVXClientServiceConnection pingWithReply:](v42, "pingWithReply:", v41);

  }
  return v22;
}

- (SVXPerforming)performer
{
  return (SVXPerforming *)self->_queuePerformer;
}

- (SVXClientActivationServicing)activationService
{
  return (SVXClientActivationServicing *)self->_activationService;
}

- (SVXClientAudioPowerServicing)inputAudioPowerService
{
  return (SVXClientAudioPowerServicing *)self->_inputAudioPowerService;
}

- (SVXClientAudioPowerServicing)outputAudioPowerService
{
  return (SVXClientAudioPowerServicing *)self->_outputAudioPowerService;
}

- (SVXClientSpeechSynthesisServicing)speechSynthesisService
{
  return (SVXClientSpeechSynthesisServicing *)self->_speechSynthesisService;
}

- (SVXClientDeviceServicing)deviceService
{
  return (SVXClientDeviceServicing *)self->_deviceService;
}

- (SVXClientAudioSystemServicing)audioSystemService
{
  return (SVXClientAudioSystemServicing *)self->_audioSystemService;
}

- (SVXClientSessionServicing)sessionService
{
  return (SVXClientSessionServicing *)self->_sessionService;
}

- (SVXClientKeepAliveServicing)keepAliveService
{
  return (SVXClientKeepAliveServicing *)self->_keepAliveService;
}

- (void)invalidate
{
  SVXQueuePerformer *queuePerformer;
  _QWORD v3[5];

  queuePerformer = self->_queuePerformer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__SVXClientServiceConnection_invalidate__block_invoke;
  v3[3] = &unk_24D24EFF0;
  v3[4] = self;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v3);
}

- (void)pingWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  SVXQueuePerformer *queuePerformer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SVXClientServiceConnection pingWithReply:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__SVXClientServiceConnection_pingWithReply___block_invoke;
  v8[3] = &unk_24D24EF28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v8);

}

- (void)activateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXQueuePerformer *queuePerformer;
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
    v16 = "-[SVXClientServiceConnection activateWithContext:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__SVXClientServiceConnection_activateWithContext_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v12);

}

- (void)deactivateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXQueuePerformer *queuePerformer;
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
    v16 = "-[SVXClientServiceConnection deactivateWithContext:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__SVXClientServiceConnection_deactivateWithContext_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v12);

}

- (void)performManualEndpointing
{
  NSObject *v3;
  SVXQueuePerformer *queuePerformer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXClientServiceConnection performManualEndpointing]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__SVXClientServiceConnection_performManualEndpointing__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v5);
}

- (void)transitToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  NSObject *v5;
  SVXQueuePerformer *queuePerformer;
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
    v9 = "-[SVXClientServiceConnection transitToAutomaticEndpointingWithTimestamp:]";
    v10 = 2048;
    v11 = a3;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s timestamp = %lld", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__SVXClientServiceConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke;
  v7[3] = &unk_24D24EA18;
  v7[4] = self;
  v7[5] = a3;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v7);
}

- (void)fetchSessionStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SVXQueuePerformer *queuePerformer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SVXClientServiceConnection fetchSessionStateWithCompletion:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__SVXClientServiceConnection_fetchSessionStateWithCompletion___block_invoke;
  v8[3] = &unk_24D24EF28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v8);

}

- (void)fetchSessionActivityStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SVXQueuePerformer *queuePerformer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SVXClientServiceConnection fetchSessionActivityStateWithCompletion:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__SVXClientServiceConnection_fetchSessionActivityStateWithCompletion___block_invoke;
  v8[3] = &unk_24D24EF28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v8);

}

- (void)fetchAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  id v4;
  SVXQueuePerformer *queuePerformer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queuePerformer = self->_queuePerformer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__SVXClientServiceConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke;
  v7[3] = &unk_24D24EF28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v7);

}

- (void)preheatWithActivationSource:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  SVXQueuePerformer *queuePerformer;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    if ((unint64_t)a3 > 9)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_24D24D798[a3];
    v8 = v7;
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientServiceConnection preheatWithActivationSource:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s activationSource = %@", buf, 0x16u);

  }
  queuePerformer = self->_queuePerformer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__SVXClientServiceConnection_preheatWithActivationSource___block_invoke;
  v10[3] = &unk_24D24EA18;
  v10[4] = self;
  v10[5] = a3;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v10);
}

- (void)prewarmWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXQueuePerformer *queuePerformer;
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
    v16 = "-[SVXClientServiceConnection prewarmWithContext:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__SVXClientServiceConnection_prewarmWithContext_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v12);

}

- (void)fetchAudioPowerWithType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  SVXQueuePerformer *queuePerformer;
  id v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 2)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24CCC8[a3];
    v10 = v9;
    *(_DWORD *)buf = 136315394;
    v17 = "-[SVXClientServiceConnection fetchAudioPowerWithType:completion:]";
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s type = %@", buf, 0x16u);

  }
  queuePerformer = self->_queuePerformer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__SVXClientServiceConnection_fetchAudioPowerWithType_completion___block_invoke;
  v13[3] = &unk_24D24EB40;
  v13[4] = self;
  v14 = v6;
  v15 = a3;
  v12 = v6;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v13);

}

- (void)prewarmRequest:(id)a3
{
  id v4;
  NSObject *v5;
  SVXQueuePerformer *queuePerformer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceConnection prewarmRequest:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SVXClientServiceConnection_prewarmRequest___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v8);

}

- (void)synthesizeRequest:(id)a3 handlerUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SVXQueuePerformer *queuePerformer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[SVXClientServiceConnection synthesizeRequest:handlerUUID:completion:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s request = %@, handlerUUID = %@", buf, 0x20u);
  }
  queuePerformer = self->_queuePerformer;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __71__SVXClientServiceConnection_synthesizeRequest_handlerUUID_completion___block_invoke;
  v16[3] = &unk_24D24F068;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v16);

}

- (void)enqueueSpeechSynthesisRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXQueuePerformer *queuePerformer;
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
    v16 = "-[SVXClientServiceConnection enqueueSpeechSynthesisRequest:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__SVXClientServiceConnection_enqueueSpeechSynthesisRequest_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v12);

}

- (void)cancelPendingSpeechSynthesisRequest:(id)a3
{
  id v4;
  NSObject *v5;
  SVXQueuePerformer *queuePerformer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceConnection cancelPendingSpeechSynthesisRequest:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__SVXClientServiceConnection_cancelPendingSpeechSynthesisRequest___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v8);

}

- (void)stopSpeechSynthesisRequest:(id)a3
{
  id v4;
  NSObject *v5;
  SVXQueuePerformer *queuePerformer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceConnection stopSpeechSynthesisRequest:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__SVXClientServiceConnection_stopSpeechSynthesisRequest___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v8);

}

- (void)setDeviceSetupContext:(id)a3
{
  id v4;
  NSObject *v5;
  SVXQueuePerformer *queuePerformer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientServiceConnection setDeviceSetupContext:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__SVXClientServiceConnection_setDeviceSetupContext___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v8);

}

- (void)prepareForDeviceSetupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXQueuePerformer *queuePerformer;
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
    v16 = "-[SVXClientServiceConnection prepareForDeviceSetupWithContext:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__SVXClientServiceConnection_prepareForDeviceSetupWithContext_completion___block_invoke;
  v12[3] = &unk_24D24EED8;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v12);

}

- (void)getInstanceInfoWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[SVXClientServiceConnection getInstanceInfoWithCompletion:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  if (v4)
  {
    -[AFInstanceContext info](self->_instanceContext, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);

  }
}

- (void)requestPermissionToActivateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[SVXClientServiceConnection requestPermissionToActivateWithContext:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v9, 0x16u);
  }
  -[SVXClientActivationService handleRequestPermissionToActivateWithContext:completion:](self->_activationService, "handleRequestPermissionToActivateWithContext:completion:", v6, v7);

}

- (void)notifyWillActivateWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection notifyWillActivateWithContext:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v6, 0x16u);
  }
  -[SVXClientActivationService handleWillActivateWithContext:](self->_activationService, "handleWillActivateWithContext:", v4);

}

- (void)notifyDidActivateWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection notifyDidActivateWithContext:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v6, 0x16u);
  }
  -[SVXClientActivationService handleDidActivateWithContext:](self->_activationService, "handleDidActivateWithContext:", v4);

}

- (void)notifyDidNotActivateWithContext:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[SVXClientServiceConnection notifyDidNotActivateWithContext:error:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@, error = %@", (uint8_t *)&v9, 0x20u);
  }
  -[SVXClientActivationService handleDidNotActivateWithContext:error:](self->_activationService, "handleDidNotActivateWithContext:error:", v6, v7);

}

- (void)notifyWillDeactivateWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection notifyWillDeactivateWithContext:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v6, 0x16u);
  }
  -[SVXClientActivationService handleWillDeactivateWithContext:](self->_activationService, "handleWillDeactivateWithContext:", v4);

}

- (void)notifyDidDeactivateWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection notifyDidDeactivateWithContext:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v6, 0x16u);
  }
  -[SVXClientActivationService handleDidDeactivateWithContext:](self->_activationService, "handleDidDeactivateWithContext:", v4);

}

- (void)notifyWillChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 4)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24E7A8[a3];
    v10 = v9;
    if ((unint64_t)a4 > 4)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_24D24E7A8[a4];
    v12 = v11;
    v13 = 136315650;
    v14 = "-[SVXClientServiceConnection notifyWillChangeSessionStateFrom:to:]";
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", (uint8_t *)&v13, 0x20u);

  }
  -[SVXClientSessionService handleWillChangeStateFrom:to:](self->_sessionService, "handleWillChangeStateFrom:to:", a3, a4);
}

- (void)notifyDidChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 4)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24E7A8[a3];
    v10 = v9;
    if ((unint64_t)a4 > 4)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_24D24E7A8[a4];
    v12 = v11;
    v13 = 136315650;
    v14 = "-[SVXClientServiceConnection notifyDidChangeSessionStateFrom:to:]";
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", (uint8_t *)&v13, 0x20u);

  }
  -[SVXClientSessionService handleDidChangeStateFrom:to:](self->_sessionService, "handleDidChangeStateFrom:to:", a3, a4);
}

- (void)notifySessionWillPresentFeedbackWithDialogIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection notifySessionWillPresentFeedbackWithDialogIdentifier:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s dialogIdentifier = %@", (uint8_t *)&v6, 0x16u);
  }
  -[SVXClientSessionService handleWillPresentFeedbackWithDialogIdentifier:](self->_sessionService, "handleWillPresentFeedbackWithDialogIdentifier:", v4);

}

- (void)notifySessionWillStartSoundWithID:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    if ((unint64_t)a3 > 6)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_24D24D238[a3];
    v8 = v7;
    v9 = 136315394;
    v10 = "-[SVXClientServiceConnection notifySessionWillStartSoundWithID:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s soundID = %@", (uint8_t *)&v9, 0x16u);

  }
  -[SVXClientSessionService handleWillStartSoundWithID:](self->_sessionService, "handleWillStartSoundWithID:", a3);
}

- (void)notifySessionDidStartSoundWithID:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    if ((unint64_t)a3 > 6)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_24D24D238[a3];
    v8 = v7;
    v9 = 136315394;
    v10 = "-[SVXClientServiceConnection notifySessionDidStartSoundWithID:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s soundID = %@", (uint8_t *)&v9, 0x16u);

  }
  -[SVXClientSessionService handleDidStartSoundWithID:](self->_sessionService, "handleDidStartSoundWithID:", a3);
}

- (void)notifySessionDidStopSoundWithID:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 6)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24D238[a3];
    v10 = v9;
    v11 = 136315650;
    v12 = "-[SVXClientServiceConnection notifySessionDidStopSoundWithID:error:]";
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s soundID = %@, error = %@", (uint8_t *)&v11, 0x20u);

  }
  -[SVXClientSessionService handleDidStopSoundWithID:error:](self->_sessionService, "handleDidStopSoundWithID:error:", a3, v6);

}

- (void)notifySessionWillBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[SVXClientServiceConnection notifySessionWillBecomeActiveWithActivationContext:turnID:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s activationContext = %@, turnID = %@", (uint8_t *)&v9, 0x20u);
  }
  -[SVXClientSessionService handleWillBecomeActiveWithActivationContext:turnID:](self->_sessionService, "handleWillBecomeActiveWithActivationContext:turnID:", v6, v7);

}

- (void)notifySessionDidBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[SVXClientServiceConnection notifySessionDidBecomeActiveWithActivationContext:turnID:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s activationContext = %@, turnID = %@", (uint8_t *)&v9, 0x20u);
  }
  -[SVXClientSessionService handleDidBecomeActiveWithActivationContext:turnID:](self->_sessionService, "handleDidBecomeActiveWithActivationContext:turnID:", v6, v7);

}

- (void)notifySessionWillResignActiveWithOptions:(unint64_t)a3 duration:(double)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    SVXSessionResignActiveOptionsGetNames(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[SVXClientServiceConnection notifySessionWillResignActiveWithOptions:duration:]";
    v12 = 2112;
    v13 = v9;
    v14 = 2048;
    v15 = a4;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s options = %@, duration = %f", (uint8_t *)&v10, 0x20u);

  }
  -[SVXClientSessionService handleWillResignActiveWithOptions:duration:](self->_sessionService, "handleWillResignActiveWithOptions:duration:", a3, a4);
}

- (void)notifySessionDidResignActiveWithDeactivationContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection notifySessionDidResignActiveWithDeactivationContext:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s deactivationContext = %@", (uint8_t *)&v6, 0x16u);
  }
  -[SVXClientSessionService handleDidResignActiveWithDeactivationContext:](self->_sessionService, "handleDidResignActiveWithDeactivationContext:", v4);

}

- (void)notifyWillBeginUpdateAudioPowerWithType:(int64_t)a3 wrapper:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 2)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24CCC8[a3];
    v10 = v9;
    v13 = 136315650;
    v14 = "-[SVXClientServiceConnection notifyWillBeginUpdateAudioPowerWithType:wrapper:]";
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s type = %@, wrapper = %@", (uint8_t *)&v13, 0x20u);

  }
  if (a3 == 1)
  {
    v11 = 48;
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    v11 = 56;
LABEL_10:
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09100]), "initWithXPCWrapper:", v6);
    objc_msgSend(*(id *)((char *)&self->super.isa + v11), "handleWillBeginUpdateAudioPowerWithProvider:", v12);

  }
}

- (void)notifyDidEndUpdateAudioPowerWithType:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    if ((unint64_t)a3 > 2)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_24D24CCC8[a3];
    v8 = v7;
    v10 = 136315394;
    v11 = "-[SVXClientServiceConnection notifyDidEndUpdateAudioPowerWithType:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s type = %@", (uint8_t *)&v10, 0x16u);

  }
  if (a3 == 1)
  {
    v9 = 48;
  }
  else
  {
    if (a3 != 2)
      return;
    v9 = 56;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v9), "handleDidEndUpdateAudioPower");
}

- (void)notifyAudioSessionWillBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315906;
    v12 = "-[SVXClientServiceConnection notifyAudioSessionWillBecomeActive:activationContext:deactivationContext:]";
    v13 = 1024;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s flag = %d, activationContext = %@, deactivationContext = %@", (uint8_t *)&v11, 0x26u);
  }
  -[SVXClientAudioSystemService handleAudioSessionWillBecomeActive:activationContext:deactivationContext:](self->_audioSystemService, "handleAudioSessionWillBecomeActive:activationContext:deactivationContext:", v6, v8, v9);

}

- (void)notifyAudioSessionDidBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315906;
    v12 = "-[SVXClientServiceConnection notifyAudioSessionDidBecomeActive:activationContext:deactivationContext:]";
    v13 = 1024;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s flag = %d, activationContext = %@, deactivationContext = %@", (uint8_t *)&v11, 0x26u);
  }
  -[SVXClientAudioSystemService handleAudioSessionDidBecomeActive:activationContext:deactivationContext:](self->_audioSystemService, "handleAudioSessionDidBecomeActive:activationContext:deactivationContext:", v6, v8, v9);

}

- (void)handleSpeechSynthesisSynthesizedBufferForHandlerUUID:(id)a3 audioChunkData:(id)a4 audioChunkIndex:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v14 = 136315906;
    v15 = "-[SVXClientServiceConnection handleSpeechSynthesisSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:reply:]";
    v16 = 2112;
    v17 = v10;
    v18 = 2048;
    v19 = a5;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s handlerUUID = %@, audioChunkIndex = %tu, audioChunkData = %@", (uint8_t *)&v14, 0x2Au);
  }
  -[SVXClientSpeechSynthesisService handleSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:reply:](self->_speechSynthesisService, "handleSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:reply:", v10, v11, a5, v12);

}

- (void)getClientServiceUsingBlock:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  SVXQueuePerformer *queuePerformer;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queuePerformer = self->_queuePerformer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__SVXClientServiceConnection_getClientServiceUsingBlock_errorHandler___block_invoke;
  v11[3] = &unk_24D24BD18;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v11);

}

- (void)_invalidate
{
  id WeakRetained;

  if (!self->_isInvalid)
  {
    self->_isInvalid = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clientServiceConnectionDidInvalidate:", self);

  }
  -[SVXClientServiceConnection _cleanUpComponents](self, "_cleanUpComponents");
  -[SVXClientServiceConnection _cleanUpConnection](self, "_cleanUpConnection");
}

- (id)_clientServiceWithErrorHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_isInvalid)
  {
    if (!v4)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);
    v7 = 0;
  }
  else
  {
    -[SVXClientServiceConnection _connection](self, "_connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v7;
}

- (void)_clientServiceDidChange:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[SVXClientActivationService clientServiceDidChange:](self->_activationService, "clientServiceDidChange:");
  -[SVXClientAudioSystemService clientServiceDidChange:](self->_audioSystemService, "clientServiceDidChange:", v3);
  -[SVXClientDeviceService clientServiceDidChange:](self->_deviceService, "clientServiceDidChange:", v3);
  -[SVXClientAudioPowerService clientServiceDidChange:](self->_inputAudioPowerService, "clientServiceDidChange:", v3);
  -[SVXClientAudioPowerService clientServiceDidChange:](self->_outputAudioPowerService, "clientServiceDidChange:", v3);
  -[SVXClientSessionService clientServiceDidChange:](self->_sessionService, "clientServiceDidChange:", v3);
  -[SVXClientSpeechSynthesisService clientServiceDidChange:](self->_speechSynthesisService, "clientServiceDidChange:", v3);
  -[SVXClientKeepAliveService clientServiceDidChange:](self->_keepAliveService, "clientServiceDidChange:", v3);
}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    -[SVXXPCConnectionFactory createWithMachServiceName:options:](self->_connectionFactory, "createWithMachServiceName:options:", CFSTR("com.apple.SiriVOXService.client"), 0);
    v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    -[SVXQueuePerformer queue](self->_queuePerformer, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v6, "_setQueue:", v7);

    v8 = self->_connection;
    SVXClientServiceCreateXPCInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v10 = self->_connection;
    SVXClientServiceDelegateCreateXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v10, "setExportedInterface:", v11);

    objc_initWeak(&location, self);
    v12 = self->_connection;
    v13 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __41__SVXClientServiceConnection__connection__block_invoke;
    v18[3] = &unk_24D24F0B8;
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v18);
    v14 = self->_connection;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __41__SVXClientServiceConnection__connection__block_invoke_2;
    v16[3] = &unk_24D24F0B8;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", v16);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)connectionInterrupted
{
  NSObject *v3;
  SVXQueuePerformer *queuePerformer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXClientServiceConnection connectionInterrupted]";
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SVXClientServiceConnection_connectionInterrupted__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v5);
}

- (void)connectionInvalidated
{
  NSObject *v3;
  SVXQueuePerformer *queuePerformer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXClientServiceConnection connectionInvalidated]";
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SVXClientServiceConnection_connectionInvalidated__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXQueuePerformer performBlock:](queuePerformer, "performBlock:", v5);
}

- (void)_cleanUpConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection setExportedObject:](connection, "setExportedObject:", 0);
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
}

- (void)_cleanUpComponents
{
  SVXClientActivationService *activationService;
  SVXClientAudioSystemService *audioSystemService;
  SVXClientDeviceService *deviceService;
  SVXClientAudioPowerService *inputAudioPowerService;
  SVXClientAudioPowerService *outputAudioPowerService;
  SVXClientSessionService *sessionService;
  SVXClientSpeechSynthesisService *speechSynthesisService;
  SVXClientKeepAliveService *keepAliveService;

  activationService = self->_activationService;
  self->_activationService = 0;

  audioSystemService = self->_audioSystemService;
  self->_audioSystemService = 0;

  deviceService = self->_deviceService;
  self->_deviceService = 0;

  inputAudioPowerService = self->_inputAudioPowerService;
  self->_inputAudioPowerService = 0;

  outputAudioPowerService = self->_outputAudioPowerService;
  self->_outputAudioPowerService = 0;

  sessionService = self->_sessionService;
  self->_sessionService = 0;

  speechSynthesisService = self->_speechSynthesisService;
  self->_speechSynthesisService = 0;

  keepAliveService = self->_keepAliveService;
  self->_keepAliveService = 0;

}

- (AFInstanceContext)instanceContext
{
  return self->_instanceContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_keepAliveService, 0);
  objc_storeStrong((id *)&self->_audioSystemService, 0);
  objc_storeStrong((id *)&self->_deviceService, 0);
  objc_storeStrong((id *)&self->_speechSynthesisService, 0);
  objc_storeStrong((id *)&self->_outputAudioPowerService, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerService, 0);
  objc_storeStrong((id *)&self->_activationService, 0);
  objc_storeStrong((id *)&self->_sessionService, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuePerformer, 0);
}

uint64_t __51__SVXClientServiceConnection_connectionInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24) || !*(_QWORD *)(v2 + 88))
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SVXClientServiceConnection connectionInvalidated]_block_invoke";
      _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_DEFAULT, "%s Invalidate", buf, 0xCu);
      v2 = *(_QWORD *)(a1 + 32);
    }
    return objc_msgSend((id)v2, "_invalidate");
  }
  else
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SVXClientServiceConnection connectionInvalidated]_block_invoke";
      _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_DEFAULT, "%s KeepAlive", buf, 0xCu);
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v2, "_cleanUpConnection");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 88);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__SVXClientServiceConnection_connectionInvalidated__block_invoke_23;
    v8[3] = &unk_24D24DCC8;
    v8[4] = v6;
    return objc_msgSend(v7, "connectWithCompletion:", v8);
  }
}

void __51__SVXClientServiceConnection_connectionInvalidated__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SVXClientServiceConnection_connectionInvalidated__block_invoke_2;
  v7[3] = &unk_24D24F018;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __51__SVXClientServiceConnection_connectionInvalidated__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[SVXClientServiceConnection connectionInvalidated]_block_invoke_2";
      v8 = 2112;
      v9 = v2;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s Failed KeepAlive (error = %@)", (uint8_t *)&v6, 0x16u);
    }
    return objc_msgSend(*(id *)(a1 + 40), "_invalidate");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[SVXClientServiceConnection connectionInvalidated]_block_invoke";
      _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_DEFAULT, "%s Done KeepAlive", (uint8_t *)&v6, 0xCu);
    }
    return objc_msgSend(*(id *)(a1 + 40), "_clientServiceDidChange:", 1);
  }
}

uint64_t __51__SVXClientServiceConnection_connectionInterrupted__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cleanUpConnection");
  return objc_msgSend(*(id *)(a1 + 32), "_clientServiceDidChange:", 0);
}

void __41__SVXClientServiceConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInterrupted");

}

void __41__SVXClientServiceConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInvalidated");

}

void __70__SVXClientServiceConnection_getClientServiceUsingBlock_errorHandler___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(a1[4] + 24))
  {
    v1 = a1[5];
    if (v1)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

    }
  }
  else
  {
    v2 = a1[6];
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }
}

void __74__SVXClientServiceConnection_prepareForDeviceSetupWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__SVXClientServiceConnection_prepareForDeviceSetupWithContext_completion___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForDeviceSetupWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __74__SVXClientServiceConnection_prepareForDeviceSetupWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection prepareForDeviceSetupWithContext:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __52__SVXClientServiceConnection_setDeviceSetupContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_clientServiceWithErrorHandler:", &__block_literal_global_20);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDeviceSetupContext:", *(_QWORD *)(a1 + 40));

}

void __52__SVXClientServiceConnection_setDeviceSetupContext___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientServiceConnection setDeviceSetupContext:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __57__SVXClientServiceConnection_stopSpeechSynthesisRequest___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_clientServiceWithErrorHandler:", &__block_literal_global_19);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSpeechSynthesisRequest:", *(_QWORD *)(a1 + 40));

}

void __57__SVXClientServiceConnection_stopSpeechSynthesisRequest___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientServiceConnection stopSpeechSynthesisRequest:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __66__SVXClientServiceConnection_cancelPendingSpeechSynthesisRequest___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_clientServiceWithErrorHandler:", &__block_literal_global_18);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPendingSpeechSynthesisRequest:", *(_QWORD *)(a1 + 40));

}

void __66__SVXClientServiceConnection_cancelPendingSpeechSynthesisRequest___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientServiceConnection cancelPendingSpeechSynthesisRequest:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __71__SVXClientServiceConnection_enqueueSpeechSynthesisRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__SVXClientServiceConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueSpeechSynthesisRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __71__SVXClientServiceConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  SVXSpeechSynthesisResult *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[SVXClientServiceConnection enqueueSpeechSynthesisRequest:completion:]_block_invoke_2";
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:]([SVXSpeechSynthesisResult alloc], "initWithType:utteranceInfo:error:", 4, 0, v3);
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v5 + 16))(v5, v6);

  }
}

void __71__SVXClientServiceConnection_synthesizeRequest_handlerUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__SVXClientServiceConnection_synthesizeRequest_handlerUUID_completion___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synthesizeRequest:handlerUUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __71__SVXClientServiceConnection_synthesizeRequest_handlerUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  SVXSpeechSynthesisResult *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[SVXClientServiceConnection synthesizeRequest:handlerUUID:completion:]_block_invoke_2";
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:]([SVXSpeechSynthesisResult alloc], "initWithType:utteranceInfo:error:", 4, 0, v3);
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v5 + 16))(v5, v6);

  }
}

void __45__SVXClientServiceConnection_prewarmRequest___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_clientServiceWithErrorHandler:", &__block_literal_global_16);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prewarmRequest:", *(_QWORD *)(a1 + 40));

}

void __45__SVXClientServiceConnection_prewarmRequest___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientServiceConnection prewarmRequest:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __65__SVXClientServiceConnection_fetchAudioPowerWithType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__SVXClientServiceConnection_fetchAudioPowerWithType_completion___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAudioPowerWithType:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __65__SVXClientServiceConnection_fetchAudioPowerWithType_completion___block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection fetchAudioPowerWithType:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __60__SVXClientServiceConnection_prewarmWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__SVXClientServiceConnection_prewarmWithContext_completion___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prewarmWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __60__SVXClientServiceConnection_prewarmWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection prewarmWithContext:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __58__SVXClientServiceConnection_preheatWithActivationSource___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_clientServiceWithErrorHandler:", &__block_literal_global_15);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preheatWithActivationSource:", *(_QWORD *)(a1 + 40));

}

void __58__SVXClientServiceConnection_preheatWithActivationSource___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientServiceConnection preheatWithActivationSource:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __76__SVXClientServiceConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __76__SVXClientServiceConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAlarmAndTimerFiringContextWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __76__SVXClientServiceConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __70__SVXClientServiceConnection_fetchSessionActivityStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__SVXClientServiceConnection_fetchSessionActivityStateWithCompletion___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchSessionActivityStateWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __70__SVXClientServiceConnection_fetchSessionActivityStateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection fetchSessionActivityStateWithCompletion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __62__SVXClientServiceConnection_fetchSessionStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__SVXClientServiceConnection_fetchSessionStateWithCompletion___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchSessionStateWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __62__SVXClientServiceConnection_fetchSessionStateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection fetchSessionStateWithCompletion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __73__SVXClientServiceConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__SVXClientServiceConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_2;
  v4[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitToAutomaticEndpointingWithTimestamp:", *(_QWORD *)(a1 + 40));

}

void __73__SVXClientServiceConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[SVXClientServiceConnection transitToAutomaticEndpointingWithTimestamp:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    v10 = 2048;
    v11 = v5;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@, timestamp = %lld", (uint8_t *)&v6, 0x20u);
  }

}

void __54__SVXClientServiceConnection_performManualEndpointing__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_clientServiceWithErrorHandler:", &__block_literal_global_626);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performManualEndpointing");

}

void __54__SVXClientServiceConnection_performManualEndpointing__block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientServiceConnection performManualEndpointing]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __63__SVXClientServiceConnection_deactivateWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__SVXClientServiceConnection_deactivateWithContext_completion___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __63__SVXClientServiceConnection_deactivateWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection deactivateWithContext:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __61__SVXClientServiceConnection_activateWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__SVXClientServiceConnection_activateWithContext_completion___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __61__SVXClientServiceConnection_activateWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection activateWithContext:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __44__SVXClientServiceConnection_pingWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SVXClientServiceConnection_pingWithReply___block_invoke_2;
  v4[3] = &unk_24D24DCA0;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_clientServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pingWithReply:", *(_QWORD *)(a1 + 40));

}

void __44__SVXClientServiceConnection_pingWithReply___block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientServiceConnection pingWithReply:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __40__SVXClientServiceConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __249__SVXClientServiceConnection_initWithQueuePerformer_activationService_audioSystemService_deviceService_inputAudioPowerService_outputAudioPowerService_sessionService_speechSynthesisService_keepAliveService_instanceContext_connectionFactory_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[1];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __249__SVXClientServiceConnection_initWithQueuePerformer_activationService_audioSystemService_deviceService_inputAudioPowerService_outputAudioPowerService_sessionService_speechSynthesisService_keepAliveService_instanceContext_connectionFactory_delegate___block_invoke_2;
  v7[3] = &unk_24D24F018;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __249__SVXClientServiceConnection_initWithQueuePerformer_activationService_audioSystemService_deviceService_inputAudioPowerService_outputAudioPowerService_sessionService_speechSynthesisService_keepAliveService_instanceContext_connectionFactory_delegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_clientServiceDidChange:", *(_QWORD *)(a1 + 32) == 0);
}

@end
