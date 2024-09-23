@implementation SVXSiriActivationListenerDelegate

- (SVXSiriActivationListenerDelegate)initWithVirtualDeviceManager:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  SVXSiriActivationSupportPredicate *v8;
  SVXInstrumentationUtilities *v9;
  SVXActivationUtils *v10;
  SVXSiriActivationListenerDelegate *v11;

  v4 = (objc_class *)MEMORY[0x24BE092C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithServicePort:", 2);
  +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(SVXSiriActivationSupportPredicate);
  v9 = objc_alloc_init(SVXInstrumentationUtilities);
  v10 = objc_alloc_init(SVXActivationUtils);
  v11 = -[SVXSiriActivationListenerDelegate initWithSiriActivationListener:mainQueuePerformer:siriActivationSupportPredicate:virtualDeviceManager:instrumentationUtils:activationUtils:](self, "initWithSiriActivationListener:mainQueuePerformer:siriActivationSupportPredicate:virtualDeviceManager:instrumentationUtils:activationUtils:", v6, v7, v8, v5, v9, v10);

  return v11;
}

- (SVXSiriActivationListenerDelegate)initWithSiriActivationListener:(id)a3 mainQueuePerformer:(id)a4 siriActivationSupportPredicate:(id)a5 virtualDeviceManager:(id)a6 instrumentationUtils:(id)a7 activationUtils:(id)a8
{
  id v15;
  id v16;
  id v17;
  SVXSiriActivationListenerDelegate *v18;
  SVXSiriActivationListenerDelegate *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SVXSiriActivationListenerDelegate;
  v18 = -[SVXSiriActivationListenerDelegate init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_siriActivationListener, a3);
    objc_storeStrong((id *)&v19->_mainQueuePerformer, a4);
    objc_storeStrong((id *)&v19->_siriActivationSupportPredicate, a5);
    objc_storeStrong((id *)&v19->_virtualDeviceManager, a6);
    objc_storeStrong((id *)&v19->_instrumentationUtils, a7);
    objc_storeStrong((id *)&v19->_activationUtils, a8);
  }

  return v19;
}

- (void)start
{
  -[AFSiriActivationListener startWithDelegate:](self->_siriActivationListener, "startWithDelegate:", self);
}

- (void)stop
{
  -[AFSiriActivationListener stop](self->_siriActivationListener, "stop");
}

- (void)siriActivationListener:(id)a3 prewarmWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  SVXQueuePerformer *mainQueuePerformer;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:prewarmWithRequestInfo:context:completion:]";
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s requestInfo = %@, context = %@", buf, 0x20u);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke;
  v17[3] = &unk_24D24F068;
  v17[4] = self;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  v14 = v9;
  v15 = v11;
  v16 = v10;
  -[SVXQueuePerformer performBlock:withOptions:](mainQueuePerformer, "performBlock:withOptions:", v17, 2);

}

- (void)siriActivationListener:(id)a3 activateWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  SVXQueuePerformer *mainQueuePerformer;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]";
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s requestInfo = %@, context = %@", buf, 0x20u);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke;
  v17[3] = &unk_24D24F068;
  v17[4] = self;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  v14 = v9;
  v15 = v11;
  v16 = v10;
  -[SVXQueuePerformer performBlock:withOptions:](mainQueuePerformer, "performBlock:withOptions:", v17, 2);

}

- (void)siriActivationListener:(id)a3 deactivateForReason:(int64_t)a4 options:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  SVXQueuePerformer *mainQueuePerformer;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  int64_t v23;
  unint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  v12 = a7;
  v13 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    AFSiriDeactivationReasonGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AFSiriDeactivationOptionsGetNames();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v26 = "-[SVXSiriActivationListenerDelegate siriActivationListener:deactivateForReason:options:context:completion:]";
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s reason = %@, options = %@, context = %@", buf, 0x2Au);

  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke;
  v20[3] = &unk_24D24C3F0;
  v20[4] = self;
  v21 = v11;
  v22 = v12;
  v23 = a4;
  v24 = a5;
  v18 = v12;
  v19 = v11;
  -[SVXQueuePerformer performBlock:withOptions:](mainQueuePerformer, "performBlock:withOptions:", v20, 2);

}

- (void)siriActivationListener:(id)a3 myriadEventWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  SVXQueuePerformer *mainQueuePerformer;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]";
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s requestInfo = %@, context = %@", buf, 0x20u);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke;
  v17[3] = &unk_24D24F068;
  v17[4] = self;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  v14 = v9;
  v15 = v11;
  v16 = v10;
  -[SVXQueuePerformer performBlock:withOptions:](mainQueuePerformer, "performBlock:withOptions:", v17, 2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationUtils, 0);
  objc_storeStrong((id *)&self->_instrumentationUtils, 0);
  objc_storeStrong((id *)&self->_siriActivationSupportPredicate, 0);
  objc_storeStrong((id *)&self->_virtualDeviceManager, 0);
  objc_storeStrong((id *)&self->_mainQueuePerformer, 0);
  objc_storeStrong((id *)&self->_siriActivationListener, 0);
}

void __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke_2;
  v4[3] = &unk_24D24C418;
  v5 = v2;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "getVirtualDeviceForActivationContext:completion:", v5, v4);

}

void __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "myriadEventHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "speechRequestOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "activationEvent");

      v8 = *MEMORY[0x24BE08FB0];
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO);
      if (v7 == 28)
      {
        if (v9)
        {
          *(_DWORD *)buf = 136315394;
          v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]_block_invoke";
          v23 = 2112;
          v24 = (uint64_t)v4;
          _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s Handling continuous voice trigger %@...", buf, 0x16u);
        }
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke_15;
        v18[3] = &unk_24D24EF28;
        v19 = v4;
        v20 = *(id *)(a1 + 48);
        objc_msgSend(v5, "continuousVoiceTriggerDetectedWithCompletion:", v18);

        v10 = v19;
        goto LABEL_19;
      }
      if (v9)
      {
        v15 = *(void **)(a1 + 32);
        v16 = v8;
        *(_DWORD *)buf = 136315650;
        v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]_block_invoke";
        v23 = 2048;
        v24 = objc_msgSend(v15, "source");
        v25 = 2112;
        v26 = v4;
        _os_log_impl(&dword_214934000, v16, OS_LOG_TYPE_INFO, "%s Unknown myriad source %ld or event %@...", buf, 0x20u);

      }
      v14 = *(_QWORD *)(a1 + 48);
      if (!v14)
        goto LABEL_20;
LABEL_18:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v10);
LABEL_19:

      goto LABEL_20;
    }
    v13 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]_block_invoke";
      v23 = 2112;
      v24 = (uint64_t)v4;
      _os_log_error_impl(&dword_214934000, v13, OS_LOG_TYPE_ERROR, "%s Unable to get the myriad event handler from virtual device %@.", buf, 0x16u);
    }
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      goto LABEL_18;
    v5 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]_block_invoke_2";
    v23 = 2112;
    v24 = v17;
    _os_log_error_impl(&dword_214934000, v11, OS_LOG_TYPE_ERROR, "%s Unable to find a virtual device for context %@.", buf, 0x16u);
  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v5);
    goto LABEL_20;
  }
LABEL_21:

}

uint64_t __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s Continuous voice trigger handled %@.", (uint8_t *)&v5, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke_2;
  v5[3] = &unk_24D24C3C8;
  v6 = v2;
  v4 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v3, "getVirtualDeviceForActivationContext:completion:", v6, v5);

}

void __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "deactivationHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE08FB0];
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:deactivateForReason:options:context:completion:]_block_invoke";
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Deactivating %@...", buf, 0x16u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "createDeactivationContextWithReason:options:context:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke_13;
      v13[3] = &unk_24D24EF28;
      v14 = v4;
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v5, "deactivateWithContext:completion:", v7, v13);

      v8 = v14;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:deactivateForReason:options:context:completion:]_block_invoke";
        v18 = 2112;
        v19 = v4;
        _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s Unable to get the deactivation handler from virtual device %@.", buf, 0x16u);
      }
      v11 = *(_QWORD *)(a1 + 48);
      if (!v11)
      {
        v5 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 10, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v8);
    }

LABEL_15:
    goto LABEL_16;
  }
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:deactivateForReason:options:context:completion:]_block_invoke_2";
    v18 = 2112;
    v19 = v12;
    _os_log_error_impl(&dword_214934000, v9, OS_LOG_TYPE_ERROR, "%s Unable to find a virtual device for context %@.", buf, 0x16u);
  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v5);
    goto LABEL_15;
  }
LABEL_16:

}

uint64_t __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SVXSiriActivationListenerDelegate siriActivationListener:deactivateForReason:options:context:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s Deactivated %@.", (uint8_t *)&v5, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2;
  v6[3] = &unk_24D24C3A0;
  v7 = v2;
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "getVirtualDeviceForActivationContext:completion:", v7, v6);

}

void __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "activationHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "wantsActivation:", *(_QWORD *)(a1 + 32));
      v7 = *MEMORY[0x24BE08FB0];
      if (v6)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke";
          v23 = 2112;
          v24 = v4;
          _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s Activating %@...", buf, 0x16u);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "createActivationContextWithRequestInfo:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_10;
        v18[3] = &unk_24D24DEF8;
        v19 = v4;
        v20 = *(id *)(a1 + 56);
        objc_msgSend(v5, "activateWithContext:completion:", v8, v18);

        v9 = v19;
        goto LABEL_20;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      {
        v17 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke";
        v23 = 2112;
        v24 = v17;
        v25 = 2112;
        v26 = v4;
        _os_log_error_impl(&dword_214934000, v7, OS_LOG_TYPE_ERROR, "%s Unable to activate with context %@ for virtual device %@.", buf, 0x20u);
      }
      v13 = *(_QWORD *)(a1 + 56);
      if (!v13)
        goto LABEL_21;
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = 4;
    }
    else
    {
      v12 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke";
        v23 = 2112;
        v24 = v4;
        _os_log_error_impl(&dword_214934000, v12, OS_LOG_TYPE_ERROR, "%s Unable to get the activation handler from virtual device %@.", buf, 0x16u);
      }
      v13 = *(_QWORD *)(a1 + 56);
      if (!v13)
      {
        v5 = 0;
        goto LABEL_21;
      }
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = 9;
    }
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), v15, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v9);
LABEL_20:

    goto LABEL_21;
  }
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v16 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke_2";
    v23 = 2112;
    v24 = v16;
    _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, "%s Unable to find a virtual device for context %@.", buf, 0x16u);
  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v5);
LABEL_21:

  }
}

void __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke";
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s Failed to activate %@. (error = %@)", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Activated %@.", (uint8_t *)&v8, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_2;
  v6[3] = &unk_24D24C3A0;
  v7 = v2;
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "getVirtualDeviceForActivationContext:completion:", v7, v6);

}

void __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "prewarmHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE08FB0];
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:prewarmWithRequestInfo:context:completion:]_block_invoke";
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Prewarming %@...", buf, 0x16u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "createActivationContextWithRequestInfo:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_7;
      v13[3] = &unk_24D24EF28;
      v14 = v4;
      v15 = *(id *)(a1 + 56);
      objc_msgSend(v5, "prewarmWithContext:completion:", v7, v13);

      v8 = v14;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:prewarmWithRequestInfo:context:completion:]_block_invoke";
        v18 = 2112;
        v19 = v4;
        _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s Unable to get the prewarm handler from virtual device %@.", buf, 0x16u);
      }
      v11 = *(_QWORD *)(a1 + 56);
      if (!v11)
      {
        v5 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 8, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v8);
    }

LABEL_15:
    goto LABEL_16;
  }
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:prewarmWithRequestInfo:context:completion:]_block_invoke_2";
    v18 = 2112;
    v19 = v12;
    _os_log_error_impl(&dword_214934000, v9, OS_LOG_TYPE_ERROR, "%s Unable to find a virtual device for context %@.", buf, 0x16u);
  }
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v5);
    goto LABEL_15;
  }
LABEL_16:

}

uint64_t __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SVXSiriActivationListenerDelegate siriActivationListener:prewarmWithRequestInfo:context:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s Prewarmed %@.", (uint8_t *)&v5, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

@end
