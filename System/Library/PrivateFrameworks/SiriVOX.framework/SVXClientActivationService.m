@implementation SVXClientActivationService

- (void)handleRequestPermissionToActivateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SVXPerforming *performer;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__SVXClientActivationService_handleRequestPermissionToActivateWithContext_completion___block_invoke;
  v11[3] = &unk_24D24EED8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (void)handleWillActivateWithContext:(id)a3
{
  id v4;
  SVXPerforming *performer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__SVXClientActivationService_handleWillActivateWithContext___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)handleDidActivateWithContext:(id)a3
{
  id v4;
  SVXPerforming *performer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__SVXClientActivationService_handleDidActivateWithContext___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)handleDidNotActivateWithContext:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SVXPerforming *performer;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__SVXClientActivationService_handleDidNotActivateWithContext_error___block_invoke;
  v11[3] = &unk_24D24EF00;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (void)handleWillDeactivateWithContext:(id)a3
{
  id v4;
  SVXPerforming *performer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__SVXClientActivationService_handleWillDeactivateWithContext___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)handleDidDeactivateWithContext:(id)a3
{
  id v4;
  SVXPerforming *performer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__SVXClientActivationService_handleDidDeactivateWithContext___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (SVXClientActivationService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v9;
  id v10;
  id v11;
  SVXClientActivationService *v12;
  SVXClientActivationService *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SVXClientActivationService;
  v12 = -[SVXClientActivationService init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_performer, a5);
    objc_storeStrong((id *)&v13->_clientServiceProvider, a3);
    objc_storeStrong((id *)&v13->_analytics, a4);
  }

  return v13;
}

- (void)handleButtonEvent:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[SVXClientActivationService handleButtonEvent:]";
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s This SPI has been deprecated, please use -enqueueButtonEvent: instead.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)enqueueButtonEvent:(id)a3
{
  id v4;
  uint64_t v5;
  os_log_t *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  AFAnalytics *v12;
  uint64_t v13;
  uint64_t v14;
  AFAnalytics *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  AFAnalytics *analytics;
  uint64_t v21;
  os_log_t v22;
  SVXPerforming *performer;
  id v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = mach_absolute_time();
  v6 = (os_log_t *)MEMORY[0x24BE08FB0];
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[SVXClientActivationService enqueueButtonEvent:]";
    v31 = 2112;
    v32 = (uint64_t)v4;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s buttonEvent = %@", buf, 0x16u);
  }
  v8 = objc_msgSend(v4, "type");
  if (v8 == 2)
  {
    v17 = objc_msgSend(v4, "timestamp");
    if (v17)
      v18 = v17;
    else
      v18 = v5;
    v19 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SVXClientActivationService enqueueButtonEvent:]";
      v31 = 2048;
      v32 = v18;
      _os_log_debug_impl(&dword_214934000, v19, OS_LOG_TYPE_DEBUG, "%s SVXButtonEventTypeUp: time = %lld", buf, 0x16u);
    }
    analytics = self->_analytics;
    v21 = objc_msgSend(v4, "timestamp");
    if (v21)
      v14 = v21;
    else
      v14 = v18;
    v15 = analytics;
    v16 = 1411;
    goto LABEL_23;
  }
  if (v8 == 1)
  {
    v9 = objc_msgSend(v4, "timestamp");
    if (v9)
      v10 = v9;
    else
      v10 = v5;
    v11 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SVXClientActivationService enqueueButtonEvent:]";
      v31 = 2048;
      v32 = v10;
      _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s SVXButtonEventTypeDown: time = %lld", buf, 0x16u);
    }
    v12 = self->_analytics;
    v13 = objc_msgSend(v4, "timestamp");
    if (v13)
      v14 = v13;
    else
      v14 = v10;
    v15 = v12;
    v16 = 1410;
LABEL_23:
    -[AFAnalytics logEventWithType:machAbsoluteTime:context:](v15, "logEventWithType:machAbsoluteTime:context:", v16, v14, 0);
    goto LABEL_26;
  }
  v22 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
  {
    v25 = v22;
    v26 = objc_msgSend(v4, "type");
    *(_DWORD *)buf = 136315394;
    v30 = "-[SVXClientActivationService enqueueButtonEvent:]";
    v31 = 2048;
    v32 = v26;
    _os_log_debug_impl(&dword_214934000, v25, OS_LOG_TYPE_DEBUG, "%s Unspecified or unknown button event = %ld", buf, 0x16u);

  }
LABEL_26:
  performer = self->_performer;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __49__SVXClientActivationService_enqueueButtonEvent___block_invoke;
  v27[3] = &unk_24D24F018;
  v27[4] = self;
  v28 = v4;
  v24 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v27);

}

- (void)activateWithUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  SVXActivationContext *v10;
  void *v11;
  SVXActivationContext *v12;
  SVXPerforming *performer;
  id v14;
  SVXActivationContext *v15;
  _QWORD v16[5];
  SVXActivationContext *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = mach_absolute_time();
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[SVXClientActivationService activateWithUserInfo:completion:]";
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  v10 = [SVXActivationContext alloc];
  SVXClientInfoGetCurrent();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SVXActivationContext initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:](v10, "initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:", 2, v8, 0, 0, v11, 0, v6);

  performer = self->_performer;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke;
  v16[3] = &unk_24D24EED8;
  v16[4] = self;
  v17 = v12;
  v18 = v7;
  v14 = v7;
  v15 = v12;
  -[SVXPerforming performBlock:](performer, "performBlock:", v16);

}

- (void)activateWithText:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  SVXActivationContext *v11;
  void *v12;
  SVXActivationContext *v13;
  SVXPerforming *performer;
  id v15;
  SVXActivationContext *v16;
  _QWORD v17[5];
  SVXActivationContext *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = mach_absolute_time();
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SVXClientActivationService activateWithText:completion:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s text = %@", buf, 0x16u);
  }
  v10 = objc_alloc_init(MEMORY[0x24BE09288]);
  objc_msgSend(v10, "setText:", v6);
  v11 = [SVXActivationContext alloc];
  SVXClientInfoGetCurrent();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SVXActivationContext initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:](v11, "initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:", 2, v8, 0, 0, v12, v10, 0);

  performer = self->_performer;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__SVXClientActivationService_activateWithText_completion___block_invoke;
  v17[3] = &unk_24D24EED8;
  v17[4] = self;
  v18 = v13;
  v19 = v7;
  v15 = v7;
  v16 = v13;
  -[SVXPerforming performBlock:](performer, "performBlock:", v17);

}

- (void)activateWithButtonEvent:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  uint64_t v11;
  os_log_t *v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  SVXActivationContext *v16;
  void *v17;
  SVXActivationContext *v18;
  SVXPerforming *performer;
  SVXActivationContext *v20;
  NSObject *v21;
  os_log_t v22;
  NSObject *v23;
  unint64_t v24;
  __CFString *v25;
  os_log_t v26;
  __CFString *v27;
  uint64_t v28;
  _QWORD v29[5];
  SVXActivationContext *v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  v11 = mach_absolute_time();
  v12 = (os_log_t *)MEMORY[0x24BE08FB0];
  v13 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[SVXClientActivationService activateWithButtonEvent:userInfo:completion:]";
    v34 = 2112;
    v35 = v8;
    v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s buttonEvent = %@, userInfo = %@", buf, 0x20u);
  }
  v14 = v8;
  v15 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "_SVXClientActivationServiceValidateButtonEventForActivation";
    v34 = 2112;
    v35 = v14;
    _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s Validating button event %@ for activation...", buf, 0x16u);
  }
  if (v14)
  {
    if (-[__CFString type](v14, "type") == 1)
    {
      if (-[__CFString timestamp](v14, "timestamp"))
      {

        v16 = [SVXActivationContext alloc];
        SVXClientInfoGetCurrent();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[SVXActivationContext initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:](v16, "initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:", 1, v11, v14, 0, v17, 0, v9);

        performer = self->_performer;
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke;
        v29[3] = &unk_24D24EED8;
        v29[4] = self;
        v30 = v18;
        v31 = v10;
        v20 = v18;
        -[SVXPerforming performBlock:](performer, "performBlock:", v29);

        goto LABEL_16;
      }
      v26 = *v12;
      v20 = (SVXActivationContext *)v14;
      if (!os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v23 = v26;
      v28 = -[__CFString timestamp](v14, "timestamp");
      *(_DWORD *)buf = 136315394;
      v33 = "_SVXClientActivationServiceValidateButtonEventForActivation";
      v34 = 2048;
      v35 = (__CFString *)v28;
      _os_log_error_impl(&dword_214934000, v23, OS_LOG_TYPE_ERROR, "%s Rejected button event for activation because the timestamp is %llu.", buf, 0x16u);
    }
    else
    {
      v22 = *v12;
      v20 = (SVXActivationContext *)v14;
      if (!os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v23 = v22;
      v24 = -[__CFString type](v14, "type");
      if (v24 > 2)
        v25 = CFSTR("(unknown)");
      else
        v25 = off_24D24DBF0[v24];
      v27 = v25;
      *(_DWORD *)buf = 136315394;
      v33 = "_SVXClientActivationServiceValidateButtonEventForActivation";
      v34 = 2112;
      v35 = v27;
      _os_log_error_impl(&dword_214934000, v23, OS_LOG_TYPE_ERROR, "%s Rejected button event for activation because the type is %@.", buf, 0x16u);

    }
    v20 = (SVXActivationContext *)v14;
    goto LABEL_16;
  }
  v21 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "_SVXClientActivationServiceValidateButtonEventForActivation";
    _os_log_error_impl(&dword_214934000, v21, OS_LOG_TYPE_ERROR, "%s Rejected button event for activation because it is nil.", buf, 0xCu);
  }
  v20 = 0;
LABEL_16:

}

- (void)prewarmForSystemEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  SVXActivationContext *v10;
  void *v11;
  SVXActivationContext *v12;
  SVXPerforming *performer;
  SVXActivationContext *v14;
  _QWORD v15[5];
  SVXActivationContext *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = mach_absolute_time();
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SVXClientActivationService prewarmForSystemEvent:completion:]";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s systemEvent = %@", buf, 0x16u);
  }
  if (_SVXClientActivationServiceValidateSystemEventForActivation(v6))
  {
    v10 = [SVXActivationContext alloc];
    SVXClientInfoGetCurrent();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SVXActivationContext initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:](v10, "initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:", 5, v8, 0, v6, v11, 0, 0);

    performer = self->_performer;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke;
    v15[3] = &unk_24D24EED8;
    v15[4] = self;
    v16 = v12;
    v17 = v7;
    v14 = v12;
    -[SVXPerforming performBlock:](performer, "performBlock:", v15);

  }
}

- (void)activateWithSystemEvent:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  SVXActivationContext *v13;
  void *v14;
  SVXActivationContext *v15;
  SVXPerforming *performer;
  SVXActivationContext *v17;
  _QWORD v18[5];
  SVXActivationContext *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = mach_absolute_time();
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[SVXClientActivationService activateWithSystemEvent:userInfo:completion:]";
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s systemEvent = %@, userInfo = %@", buf, 0x20u);
  }
  if (_SVXClientActivationServiceValidateSystemEventForActivation(v8))
  {
    v13 = [SVXActivationContext alloc];
    SVXClientInfoGetCurrent();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SVXActivationContext initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:](v13, "initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:", 5, v11, 0, v8, v14, 0, v9);

    performer = self->_performer;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke;
    v18[3] = &unk_24D24EED8;
    v18[4] = self;
    v19 = v15;
    v20 = v10;
    v17 = v15;
    -[SVXPerforming performBlock:](performer, "performBlock:", v18);

  }
}

- (void)deactivateWithUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  SVXDeactivationContext *v14;
  void *v15;
  SVXDeactivationContext *v16;
  SVXPerforming *performer;
  id v18;
  SVXDeactivationContext *v19;
  _QWORD v20[5];
  SVXDeactivationContext *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[SVXClientActivationService deactivateWithUserInfo:completion:]";
    _os_log_error_impl(&dword_214934000, v9, OS_LOG_TYPE_ERROR, "%s Deprecated. Please use -deactivateWithUserInfo:options:completion: or -deactiateWithButtonEvent:userInfo:options:completion:", buf, 0xCu);
  }
  v10 = mach_absolute_time();
  v11 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[SVXClientActivationService deactivateWithUserInfo:completion:]";
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("deactivationSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v12, "integerValue") == 1)
      v13 = 1;
    else
      v13 = 2;
  }
  else
  {
    v13 = 2;
  }
  v14 = [SVXDeactivationContext alloc];
  SVXClientInfoGetCurrent();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SVXDeactivationContext initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:](v14, "initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:", v13, v10, 0, v15, v6, 0);

  performer = self->_performer;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke;
  v20[3] = &unk_24D24EED8;
  v20[4] = self;
  v21 = v16;
  v22 = v7;
  v18 = v7;
  v19 = v16;
  -[SVXPerforming performBlock:](performer, "performBlock:", v20);

}

- (void)deactivateWithUserInfo:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  SVXDeactivationContext *v13;
  void *v14;
  SVXDeactivationContext *v15;
  SVXPerforming *performer;
  id v17;
  SVXDeactivationContext *v18;
  _QWORD v19[5];
  SVXDeactivationContext *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = mach_absolute_time();
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[SVXClientActivationService deactivateWithUserInfo:options:completion:]";
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s userInfo = %@, options = %@", buf, 0x20u);
  }
  v13 = [SVXDeactivationContext alloc];
  SVXClientInfoGetCurrent();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SVXDeactivationContext initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:](v13, "initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:", 2, v11, 0, v14, v8, v9);

  performer = self->_performer;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke;
  v19[3] = &unk_24D24EED8;
  v19[4] = self;
  v20 = v15;
  v21 = v10;
  v17 = v10;
  v18 = v15;
  -[SVXPerforming performBlock:](performer, "performBlock:", v19);

}

- (void)deactivateWithButtonEvent:(id)a3 userInfo:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  SVXDeactivationContext *v16;
  void *v17;
  SVXDeactivationContext *v18;
  SVXPerforming *performer;
  id v20;
  SVXDeactivationContext *v21;
  _QWORD v22[5];
  SVXDeactivationContext *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = mach_absolute_time();
  v15 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[SVXClientActivationService deactivateWithButtonEvent:userInfo:options:completion:]";
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s buttonEvent = %@, userInfo = %@, options = %@", buf, 0x2Au);
  }
  v16 = [SVXDeactivationContext alloc];
  SVXClientInfoGetCurrent();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SVXDeactivationContext initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:](v16, "initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:", 1, v14, v10, v17, v11, v12);

  performer = self->_performer;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke;
  v22[3] = &unk_24D24EED8;
  v22[4] = self;
  v23 = v18;
  v24 = v13;
  v20 = v13;
  v21 = v18;
  -[SVXPerforming performBlock:](performer, "performBlock:", v22);

}

- (void)_enqueueButtonEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  NSMutableArray *queuedButtonEvents;
  NSMutableArray *v11;
  NSMutableArray *v12;
  id v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, _BYTE *);
  void *v19;
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "type");
    if (v7 > 2)
      v8 = CFSTR("(unknown)");
    else
      v8 = off_24D24DBF0[v7];
    v9 = v8;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SVXClientActivationService _enqueueButtonEvent:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    v23 = objc_msgSend(v4, "timestamp");
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s type = %@, timestamp = %llu", buf, 0x20u);

  }
  queuedButtonEvents = self->_queuedButtonEvents;
  if (!queuedButtonEvents)
  {
    v11 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 16);
    v12 = self->_queuedButtonEvents;
    self->_queuedButtonEvents = v11;

    queuedButtonEvents = self->_queuedButtonEvents;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __50__SVXClientActivationService__enqueueButtonEvent___block_invoke;
  v19 = &unk_24D24CE70;
  v13 = v4;
  v20 = v13;
  v21 = buf;
  -[NSMutableArray enumerateObjectsUsingBlock:](queuedButtonEvents, "enumerateObjectsUsingBlock:", &v16);
  v14 = self->_queuedButtonEvents;
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) == 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray addObject:](v14, "addObject:", v13, v16, v17, v18, v19);
  else
    -[NSMutableArray insertObject:atIndex:](v14, "insertObject:atIndex:", v13, v16, v17, v18, v19);
  if ((unint64_t)-[NSMutableArray count](self->_queuedButtonEvents, "count") >= 0x11)
    -[NSMutableArray removeLastObject](self->_queuedButtonEvents, "removeLastObject");
  -[SVXClientActivationService _stopPreheatTimer](self, "_stopPreheatTimer");
  v15 = objc_msgSend(v13, "type");
  if (v15 == 2)
  {
    -[SVXClientActivationService _processLastButtonActivationContext](self, "_processLastButtonActivationContext");
  }
  else if (v15 == 1)
  {
    -[SVXClientActivationService _startPreheatTimer](self, "_startPreheatTimer");
  }

  _Block_object_dispose(buf, 8);
}

- (void)_processLastButtonActivationContext
{
  SVXActivationContext *lastButtonActivationContext;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *queuedButtonEvents;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  SVXActivationContext *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  SVXActivationContext *v18;
  NSObject *v19;
  SVXActivationContext *v20;
  NSObject *v21;
  SVXActivationContext *v22;
  NSMutableArray *v23;
  SVXActivationContext *v24;
  SVXActivationContext *v25;
  SVXActivationContext *v26;
  SVXActivationContext *v27;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  NSMutableArray *v38;
  __int16 v39;
  SVXActivationContext *v40;
  _BYTE v41[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  lastButtonActivationContext = self->_lastButtonActivationContext;
  if (lastButtonActivationContext)
  {
    if (-[SVXActivationContext source](lastButtonActivationContext, "source") == 1)
    {
      -[SVXActivationContext buttonEvent](self->_lastButtonActivationContext, "buttonEvent");
      v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableArray type](v4, "type") == 1)
      {
        v5 = -[NSMutableArray timestamp](v4, "timestamp");
        if (v5)
        {
          v6 = v5;
          *(_QWORD *)v41 = 0;
          *(_QWORD *)&v41[8] = v41;
          *(_QWORD *)&v41[16] = 0x3032000000;
          v42 = __Block_byref_object_copy__5690;
          v43 = __Block_byref_object_dispose__5691;
          v44 = 0;
          v29 = 0;
          v30 = &v29;
          v31 = 0x2020000000;
          v32 = 0;
          queuedButtonEvents = self->_queuedButtonEvents;
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = __65__SVXClientActivationService__processLastButtonActivationContext__block_invoke;
          v28[3] = &unk_24D24CE98;
          v28[5] = &v29;
          v28[6] = v6;
          v28[4] = v41;
          -[NSMutableArray enumerateObjectsUsingBlock:](queuedButtonEvents, "enumerateObjectsUsingBlock:", v28);
          v8 = *(void **)(*(_QWORD *)&v41[8] + 40);
          v9 = (os_log_t *)MEMORY[0x24BE08FB0];
          v10 = *MEMORY[0x24BE08FB0];
          v11 = *MEMORY[0x24BE08FB0];
          if (v8)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              v12 = self->_lastButtonActivationContext;
              *(_DWORD *)buf = 136315906;
              v34 = "-[SVXClientActivationService _processLastButtonActivationContext]";
              v35 = 2112;
              v36 = *(double *)&v8;
              v37 = 2112;
              v38 = v4;
              v39 = 2112;
              v40 = v12;
              _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s Matched button up event %@ for button down event %@ of last button activation context %@.", buf, 0x2Au);
              v8 = *(void **)(*(_QWORD *)&v41[8] + 40);
            }
            objc_msgSend(v8, "timestamp");
            AFMachAbsoluteTimeGetTimeInterval();
            v14 = v13;
            v15 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v34 = "-[SVXClientActivationService _processLastButtonActivationContext]";
              v35 = 2048;
              v36 = v14;
              _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s buttonHoldDuration = %f", buf, 0x16u);
            }
            if (_SVXClientActivationServiceGetButtonHoldToTalkThreshold_onceToken != -1)
              dispatch_once(&_SVXClientActivationServiceGetButtonHoldToTalkThreshold_onceToken, &__block_literal_global_136);
            if (v14 <= *(double *)&_SVXClientActivationServiceGetButtonHoldToTalkThreshold_threshold)
              -[SVXClientActivationService _transitToAutomaticEndpointingWithTimestamp:](self, "_transitToAutomaticEndpointingWithTimestamp:", v30[3]);
            else
              -[SVXClientActivationService _performManualEndpointing](self, "_performManualEndpointing");
            v24 = self->_lastButtonActivationContext;
            self->_lastButtonActivationContext = 0;

            -[AFAnalytics logEventWithType:machAbsoluteTime:context:](self->_analytics, "logEventWithType:machAbsoluteTime:context:", 1410, v6, 0);
            -[AFAnalytics logEventWithType:machAbsoluteTime:context:](self->_analytics, "logEventWithType:machAbsoluteTime:context:", 1411, v30[3], 0);
          }
          else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v23 = self->_queuedButtonEvents;
            v22 = self->_lastButtonActivationContext;
            *(_DWORD *)buf = 136315650;
            v34 = "-[SVXClientActivationService _processLastButtonActivationContext]";
            v35 = 2112;
            v36 = *(double *)&v22;
            v37 = 2112;
            v38 = v23;
            _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, "%s Ignored because no matching button up event can be found in the button event queue. (_lastButtonActivationContext = %@, _queuedButtonEvents = %@)", buf, 0x20u);
          }
          _Block_object_dispose(&v29, 8);
          _Block_object_dispose(v41, 8);

          goto LABEL_30;
        }
        v21 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        {
          v27 = self->_lastButtonActivationContext;
          *(_DWORD *)v41 = 136315394;
          *(_QWORD *)&v41[4] = "-[SVXClientActivationService _processLastButtonActivationContext]";
          *(_WORD *)&v41[12] = 2112;
          *(_QWORD *)&v41[14] = v27;
          _os_log_error_impl(&dword_214934000, v21, OS_LOG_TYPE_ERROR, "%s Ignored because the timestamp of the button event in last button activation context is 0. (_lastButtonActivationContext = %@)", v41, 0x16u);
        }
      }
      else
      {
        v19 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        {
          v26 = self->_lastButtonActivationContext;
          *(_DWORD *)v41 = 136315394;
          *(_QWORD *)&v41[4] = "-[SVXClientActivationService _processLastButtonActivationContext]";
          *(_WORD *)&v41[12] = 2112;
          *(_QWORD *)&v41[14] = v26;
          _os_log_error_impl(&dword_214934000, v19, OS_LOG_TYPE_ERROR, "%s Ignored because the type of the button event in last button activation context is not down. (_lastButtonActivationContext = %@)", v41, 0x16u);
        }
      }
      v20 = self->_lastButtonActivationContext;
      self->_lastButtonActivationContext = 0;

LABEL_30:
      return;
    }
    v17 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v25 = self->_lastButtonActivationContext;
      *(_DWORD *)v41 = 136315394;
      *(_QWORD *)&v41[4] = "-[SVXClientActivationService _processLastButtonActivationContext]";
      *(_WORD *)&v41[12] = 2112;
      *(_QWORD *)&v41[14] = v25;
      _os_log_error_impl(&dword_214934000, v17, OS_LOG_TYPE_ERROR, "%s Ignored because the source of the last button activation context is not button. (_lastButtonActivationContext = %@)", v41, 0x16u);
    }
    v18 = self->_lastButtonActivationContext;
    self->_lastButtonActivationContext = 0;

  }
  else
  {
    v16 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v41 = 136315138;
      *(_QWORD *)&v41[4] = "-[SVXClientActivationService _processLastButtonActivationContext]";
      _os_log_impl(&dword_214934000, v16, OS_LOG_TYPE_INFO, "%s Ignored because the last button activation context is nil.", v41, 0xCu);
    }
  }
}

- (BOOL)_requestPermissionToActivateWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  char v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[SVXClientActivationService _requestPermissionToActivateWithContext:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v11, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend(v8, "clientActivationService:shouldActivateWithContext:", self, v4);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_prewarmWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  SVXClientServiceProviding *clientServiceProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  clientServiceProvider = self->_clientServiceProvider;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke;
  v14[3] = &unk_24D24DAD8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke_3;
  v12[3] = &unk_24D24DCA0;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v14, v12);

}

- (void)_activateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SVXClientServiceProviding *clientServiceProvider;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  SVXClientActivationService *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[SVXClientActivationService _activateWithContext:completion:]";
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  -[SVXClientActivationService _stopPreheatTimer](self, "_stopPreheatTimer");
  v9 = MEMORY[0x24BDAC760];
  clientServiceProvider = self->_clientServiceProvider;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__SVXClientActivationService__activateWithContext_completion___block_invoke;
  v15[3] = &unk_24D24CEC0;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __62__SVXClientActivationService__activateWithContext_completion___block_invoke_12;
  v13[3] = &unk_24D24DCA0;
  v14 = v18;
  v11 = v18;
  v12 = v6;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v15, v13);

}

- (void)_deactivateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SVXClientServiceProviding *clientServiceProvider;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SVXClientActivationService _deactivateWithContext:completion:]";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  -[SVXClientActivationService _stopPreheatTimer](self, "_stopPreheatTimer");
  v9 = MEMORY[0x24BDAC760];
  clientServiceProvider = self->_clientServiceProvider;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke;
  v15[3] = &unk_24D24DAD8;
  v16 = v6;
  v17 = v7;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke_13;
  v13[3] = &unk_24D24DCA0;
  v14 = v17;
  v11 = v17;
  v12 = v6;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v15, v13);

}

- (void)_performManualEndpointing
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SVXClientActivationService _performManualEndpointing]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](self->_clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", &__block_literal_global_5671, &__block_literal_global_14);
}

- (void)_transitToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  NSObject *v5;
  SVXClientServiceProviding *clientServiceProvider;
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SVXClientActivationService _transitToAutomaticEndpointingWithTimestamp:]";
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s Endpoint trigger timestamp = %lld", buf, 0x16u);
  }
  clientServiceProvider = self->_clientServiceProvider;
  v7[4] = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__SVXClientActivationService__transitToAutomaticEndpointingWithTimestamp___block_invoke;
  v8[3] = &__block_descriptor_40_e28_v16__0___SVXClientService__8l;
  v8[4] = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__SVXClientActivationService__transitToAutomaticEndpointingWithTimestamp___block_invoke_2;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v8, v7);
}

- (void)_preheatWithActivationSource:(int64_t)a3
{
  NSObject *v5;
  SVXClientServiceProviding *clientServiceProvider;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SVXClientActivationService _preheatWithActivationSource:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  clientServiceProvider = self->_clientServiceProvider;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__SVXClientActivationService__preheatWithActivationSource___block_invoke;
  v7[3] = &__block_descriptor_40_e28_v16__0___SVXClientService__8l;
  v7[4] = a3;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v7, &__block_literal_global_16_5664);
}

- (void)_startPreheatTimer
{
  NSUUID **p_preheatToken;
  id v4;
  SVXPerforming *performer;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_preheatToken = &self->_preheatToken;
  if (!self->_preheatToken)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_storeStrong((id *)p_preheatToken, v4);
    performer = self->_performer;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__SVXClientActivationService__startPreheatTimer__block_invoke;
    v8[3] = &unk_24D24F018;
    v8[4] = self;
    v6 = v4;
    v9 = v6;
    -[SVXPerforming performBlock:afterDelay:](performer, "performBlock:afterDelay:", v8, 0.25);
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[SVXClientActivationService _startPreheatTimer]";
      v12 = 2048;
      v13 = 0x3FD0000000000000;
      _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s Started preheat timer for %f seconds.", buf, 0x16u);
    }

  }
}

- (void)_stopPreheatTimer
{
  NSUUID *preheatToken;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  preheatToken = self->_preheatToken;
  if (preheatToken)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "-[SVXClientActivationService _stopPreheatTimer]";
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Stopped preheat timer.", (uint8_t *)&v5, 0xCu);
      preheatToken = self->_preheatToken;
    }
    self->_preheatToken = 0;

  }
}

- (void)_preheatTimerArrivedWithToken:(id)a3
{
  NSUUID *preheatToken;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[NSUUID isEqual:](self->_preheatToken, "isEqual:", a3))
  {
    preheatToken = self->_preheatToken;
    self->_preheatToken = 0;

    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[SVXClientActivationService _preheatTimerArrivedWithToken:]";
      _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s Preheat timer fired!", (uint8_t *)&v6, 0xCu);
    }
    -[SVXClientActivationService _preheatWithActivationSource:](self, "_preheatWithActivationSource:", 1);
  }
}

- (SVXClientActivationServiceDelegate)delegate
{
  return (SVXClientActivationServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preheatToken, 0);
  objc_storeStrong((id *)&self->_lastButtonActivationContext, 0);
  objc_storeStrong((id *)&self->_queuedButtonEvents, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

uint64_t __48__SVXClientActivationService__startPreheatTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preheatTimerArrivedWithToken:", *(_QWORD *)(a1 + 40));
}

uint64_t __59__SVXClientActivationService__preheatWithActivationSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "preheatWithActivationSource:", *(_QWORD *)(a1 + 32));
}

void __59__SVXClientActivationService__preheatWithActivationSource___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientActivationService _preheatWithActivationSource:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __74__SVXClientActivationService__transitToAutomaticEndpointingWithTimestamp___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "transitToAutomaticEndpointingWithTimestamp:", *(_QWORD *)(a1 + 32));
}

void __74__SVXClientActivationService__transitToAutomaticEndpointingWithTimestamp___block_invoke_2(uint64_t a1, void *a2)
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
    v7 = "-[SVXClientActivationService _transitToAutomaticEndpointingWithTimestamp:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    v10 = 2048;
    v11 = v5;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@, Endpoint trigger timestamp = %lld", (uint8_t *)&v6, 0x20u);
  }

}

void __55__SVXClientActivationService__performManualEndpointing__block_invoke_2(uint64_t a1, void *a2)
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
    v5 = "-[SVXClientActivationService _performManualEndpointing]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __55__SVXClientActivationService__performManualEndpointing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performManualEndpointing");
}

void __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke_2;
  v5[3] = &unk_24D24EF28;
  v6 = v4;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(a2, "deactivateWithContext:completion:", v6, v5);

}

void __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke_13(uint64_t a1, void *a2)
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
    v7 = "-[SVXClientActivationService _deactivateWithContext:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

uint64_t __64__SVXClientActivationService__deactivateWithContext_completion___block_invoke_2(uint64_t a1)
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
    v6 = "-[SVXClientActivationService _deactivateWithContext:completion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s done (context = %@)", (uint8_t *)&v5, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__SVXClientActivationService__activateWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__SVXClientActivationService__activateWithContext_completion___block_invoke_2;
  v6[3] = &unk_24D24DF48;
  v7 = v4;
  v5 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  objc_msgSend(a2, "activateWithContext:completion:", v7, v6);

}

void __62__SVXClientActivationService__activateWithContext_completion___block_invoke_12(uint64_t a1, void *a2)
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
    v7 = "-[SVXClientActivationService _activateWithContext:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __62__SVXClientActivationService__activateWithContext_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 136315650;
    v17 = "-[SVXClientActivationService _activateWithContext:completion:]_block_invoke_2";
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s done (context = %@, error = %@)", buf, 0x20u);
  }
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  v7 = (void *)a1[4];
  v8 = *(void **)(a1[5] + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__SVXClientActivationService__activateWithContext_completion___block_invoke_11;
  v12[3] = &unk_24D24EF00;
  v13 = v3;
  v9 = v7;
  v10 = a1[5];
  v14 = v9;
  v15 = v10;
  v11 = v3;
  objc_msgSend(v8, "performBlock:", v12);

}

void __62__SVXClientActivationService__activateWithContext_completion___block_invoke_11(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32) && objc_msgSend(*(id *)(a1 + 40), "source") == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "buttonEvent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "type");

    if (v3 == 1)
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v7 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40);
        v9 = 136315394;
        v10 = "-[SVXClientActivationService _activateWithContext:completion:]_block_invoke";
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s _lastButtonActivationContext = %@", (uint8_t *)&v9, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 48), "_processLastButtonActivationContext");
    }
  }
}

void __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke_2;
  v4[3] = &unk_24D24DE08;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "prewarmWithContext:completion:", v3, v4);

}

void __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke_3(uint64_t a1, void *a2)
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
    v7 = "-[SVXClientActivationService _prewarmWithContext:completion:]_block_invoke_3";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

uint64_t __61__SVXClientActivationService__prewarmWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__SVXClientActivationService__processLastButtonActivationContext__block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = objc_msgSend(v7, "timestamp");
  if (v8 < a1[6])
  {
LABEL_2:
    *a4 = 1;
    goto LABEL_11;
  }
  v9 = v8;
  v10 = objc_msgSend(v7, "type");
  if (v10 == 2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v7, "timestamp");
    v12 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      v14 = 136315394;
      v15 = "-[SVXClientActivationService _processLastButtonActivationContext]_block_invoke";
      v16 = 2048;
      v17 = v13;
      _os_log_debug_impl(&dword_214934000, v12, OS_LOG_TYPE_DEBUG, "%s queuedButtonEvent: button up, timestamp = %lld", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (v10 == 1)
  {
    v11 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "-[SVXClientActivationService _processLastButtonActivationContext]_block_invoke";
      v16 = 2048;
      v17 = v9;
      _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s queuedButtonEvent: button down, timestamp = %lld", (uint8_t *)&v14, 0x16u);
    }
    if (v9 == a1[6])
      goto LABEL_2;
  }
LABEL_11:

}

void __50__SVXClientActivationService__enqueueButtonEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  v9 = objc_msgSend(v7, "timestamp");
  v10 = objc_msgSend(v8, "timestamp");

  if (v9 > v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke_2;
  v5[3] = &unk_24D24EF28;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "_deactivateWithContext:completion:", v3, v5);

}

void __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke_3;
    v3[3] = &unk_24D24DE08;
    v4 = v1;
    objc_msgSend(v2, "performBlock:", v3);

  }
}

uint64_t __84__SVXClientActivationService_deactivateWithButtonEvent_userInfo_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke_2;
  v5[3] = &unk_24D24EF28;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "_deactivateWithContext:completion:", v3, v5);

}

void __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke_3;
    v3[3] = &unk_24D24DE08;
    v4 = v1;
    objc_msgSend(v2, "performBlock:", v3);

  }
}

uint64_t __72__SVXClientActivationService_deactivateWithUserInfo_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke_2;
  v5[3] = &unk_24D24EF28;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "_deactivateWithContext:completion:", v3, v5);

}

void __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke_3;
    v3[3] = &unk_24D24DE08;
    v4 = v1;
    objc_msgSend(v2, "performBlock:", v3);

  }
}

uint64_t __64__SVXClientActivationService_deactivateWithUserInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "_requestPermissionToActivateWithContext:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke_2;
    v5[3] = &unk_24D24DEF8;
    v4 = *(id *)(a1 + 48);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v2, "_activateWithContext:completion:", v3, v5);

  }
}

void __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke_3;
    v6[3] = &unk_24D24EF28;
    v8 = v4;
    v7 = v3;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

uint64_t __74__SVXClientActivationService_activateWithSystemEvent_userInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke_2;
  v5[3] = &unk_24D24EF28;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "_prewarmWithContext:completion:", v3, v5);

}

void __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke_3;
    v3[3] = &unk_24D24DE08;
    v4 = v1;
    objc_msgSend(v2, "performBlock:", v3);

  }
}

uint64_t __63__SVXClientActivationService_prewarmForSystemEvent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "_requestPermissionToActivateWithContext:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke_2;
    v5[3] = &unk_24D24DEF8;
    v4 = *(id *)(a1 + 48);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v2, "_activateWithContext:completion:", v3, v5);

  }
}

void __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke_3;
    v6[3] = &unk_24D24EF28;
    v8 = v4;
    v7 = v3;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

uint64_t __74__SVXClientActivationService_activateWithButtonEvent_userInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__SVXClientActivationService_activateWithText_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "_requestPermissionToActivateWithContext:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__SVXClientActivationService_activateWithText_completion___block_invoke_2;
    v5[3] = &unk_24D24DEF8;
    v4 = *(id *)(a1 + 48);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v2, "_activateWithContext:completion:", v3, v5);

  }
}

void __58__SVXClientActivationService_activateWithText_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__SVXClientActivationService_activateWithText_completion___block_invoke_3;
    v6[3] = &unk_24D24EF28;
    v8 = v4;
    v7 = v3;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

uint64_t __58__SVXClientActivationService_activateWithText_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "_requestPermissionToActivateWithContext:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke_2;
    v5[3] = &unk_24D24DEF8;
    v4 = *(id *)(a1 + 48);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v2, "_activateWithContext:completion:", v3, v5);

  }
}

void __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke_3;
    v6[3] = &unk_24D24EF28;
    v8 = v4;
    v7 = v3;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

uint64_t __62__SVXClientActivationService_activateWithUserInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __49__SVXClientActivationService_enqueueButtonEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueButtonEvent:", *(_QWORD *)(a1 + 40));
}

void __61__SVXClientActivationService_handleDidDeactivateWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "clientActivationService:didDeactivateWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __62__SVXClientActivationService_handleWillDeactivateWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "clientActivationService:willDeactivateWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __68__SVXClientActivationService_handleDidNotActivateWithContext_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_stopPreheatTimer");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "clientActivationService:didNotActivateWithContext:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __59__SVXClientActivationService_handleDidActivateWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_stopPreheatTimer");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "clientActivationService:didActivateWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __60__SVXClientActivationService_handleWillActivateWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_stopPreheatTimer");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "clientActivationService:willActivateWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __86__SVXClientActivationService_handleRequestPermissionToActivateWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_requestPermissionToActivateWithContext:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v2, 0);
  return result;
}

@end
