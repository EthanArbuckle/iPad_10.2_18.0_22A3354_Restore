@implementation NAFConnectionClientServiceDelegate

- (NAFConnectionClientServiceDelegate)initWithConnection:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  NAFConnectionClientServiceDelegate *v8;
  NAFConnectionClientServiceDelegate *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *targetQueue;
  OS_dispatch_queue *v12;
  id v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NAFConnectionClientServiceDelegate;
  v8 = -[NAFConnectionClientServiceDelegate init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    if (v7)
    {
      v10 = (OS_dispatch_queue *)v7;
      targetQueue = v9->_targetQueue;
      v9->_targetQueue = v10;
    }
    else
    {
      v12 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v13 = MEMORY[0x24BDAC9B8];
      targetQueue = v9->_targetQueue;
      v9->_targetQueue = v12;
    }

  }
  return v9;
}

- (id)_connectionDelegate
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)startUIRequestWithText:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__NAFConnectionClientServiceDelegate_startUIRequestWithText_completion___block_invoke;
  block[3] = &unk_2518580C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

void __72__NAFConnectionClientServiceDelegate_startUIRequestWithText_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_startUIRequestWithText:completion:", a1[5], a1[6]);

}

- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__NAFConnectionClientServiceDelegate_startUIRequestWithInfo_completion___block_invoke;
  block[3] = &unk_2518580C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

void __72__NAFConnectionClientServiceDelegate_startUIRequestWithInfo_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_startUIRequestWithInfo:completion:", a1[5], a1[6]);

}

- (void)requestDidReceiveCommand:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__NAFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke;
  block[3] = &unk_2518580C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

void __69__NAFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__NAFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke_2;
  v4[3] = &unk_251857C10;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(WeakRetained, "_handleCommand:reply:", v3, v4);

}

uint64_t __69__NAFConnectionClientServiceDelegate_requestDidReceiveCommand_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestHandleCommand:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NAFConnectionClientServiceDelegate *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke;
  block[3] = &unk_2518580C0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

void __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  dispatch_time_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  if (WL_AFIsInternalInstall() && (_AFPreferencesGetClientCommandDeliveryDelay(), v2 > 0.0))
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemUptime");
    v6 = v5;

    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
      __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_cold_1();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "_activeRequestUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    v11 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(NSObject **)(v10 + 16);
    block[2] = __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_672;
    block[3] = &unk_2518580E8;
    block[1] = 3221225472;
    block[4] = v10;
    v16 = v8;
    v17 = v11;
    v19 = v6;
    v18 = *(id *)(a1 + 48);
    v13 = v8;
    dispatch_after(v9, v12, block);

  }
  else
  {
    v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v14, "_handleCommand:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

void __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_672(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_activeRequestUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", a1[5]);

  v5 = (void *)*MEMORY[0x24BE08FB0];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_672_cold_1((uint64_t)a1, v5);
    v7 = objc_loadWeakRetained((id *)(a1[4] + 8));
    objc_msgSend(v7, "_handleCommand:reply:", a1[6], a1[7]);

  }
  else if (v6)
  {
    __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_672_cold_2();
  }
}

- (void)requestRequestedOpenApplicationWithBundleID:(id)a3 URL:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *targetQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  NAFConnectionClientServiceDelegate *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  targetQueue = self->_targetQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __92__NAFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke;
  v15[3] = &unk_251858110;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(targetQueue, v15);

}

void __92__NAFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_connectionDelegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(v11, "assistantConnection:openApplicationWithBundleID:URL:completion:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __92__NAFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)requestRequestedOpenURL:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NAFConnectionClientServiceDelegate *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__NAFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke;
  block[3] = &unk_2518580C0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

void __68__NAFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_connectionDelegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(v11, "assistantConnection:openURL:completion:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __68__NAFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)requestRequestedDismissAssistant
{
  NSObject *targetQueue;
  _QWORD block[5];

  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__NAFConnectionClientServiceDelegate_requestRequestedDismissAssistant__block_invoke;
  block[3] = &unk_251857888;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

void __70__NAFConnectionClientServiceDelegate_requestRequestedDismissAssistant__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[NAFConnectionClientServiceDelegate requestRequestedDismissAssistant]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_246FF4000, v2, OS_LOG_TYPE_INFO, "%s %@ Got dismiss assistant message", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_connectionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v4, "assistantConnectionDismissAssistant:", WeakRetained);

  }
}

- (void)requestRequestedDismissAssistantWithReason:(int64_t)a3
{
  NSObject *targetQueue;
  _QWORD v4[6];

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __81__NAFConnectionClientServiceDelegate_requestRequestedDismissAssistantWithReason___block_invoke;
  v4[3] = &unk_251857A40;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __81__NAFConnectionClientServiceDelegate_requestRequestedDismissAssistantWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 136315650;
    v8 = "-[NAFConnectionClientServiceDelegate requestRequestedDismissAssistantWithReason:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_246FF4000, v2, OS_LOG_TYPE_INFO, "%s %@ Got dismiss assistant message with reason : %ld", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_connectionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v5, "assistantConnection:dismissAssistantWithReason:", WeakRetained, *(_QWORD *)(a1 + 40));
LABEL_7:

    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v5, "assistantConnectionDismissAssistant:", WeakRetained);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)requestDidUpdateResponseMode:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__NAFConnectionClientServiceDelegate_requestDidUpdateResponseMode___block_invoke;
  v7[3] = &unk_251857720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

void __67__NAFConnectionClientServiceDelegate_requestDidUpdateResponseMode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  getAFFeatureFlagsClass();
  if (objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "isStateFeedbackEnabled"))
  {
    v2 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v7 = 136315650;
      v8 = "-[NAFConnectionClientServiceDelegate requestDidUpdateResponseMode:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_246FF4000, v2, OS_LOG_TYPE_INFO, "%s #modes %@ Got update to response mode : %@", (uint8_t *)&v7, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_connectionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v5, "assistantConnection:didUpdateResponseMode:", WeakRetained, *(_QWORD *)(a1 + 40));

    }
  }
}

- (void)requestDidAskForTimeoutExtension:(double)a3
{
  NSObject *targetQueue;
  _QWORD v4[6];

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__NAFConnectionClientServiceDelegate_requestDidAskForTimeoutExtension___block_invoke;
  v4[3] = &unk_251857A40;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __71__NAFConnectionClientServiceDelegate_requestDidAskForTimeoutExtension___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "requestDidAskForTimeoutExtension:", *(double *)(a1 + 40));

}

- (void)quickStopWasHandledWithActions:(unint64_t)a3
{
  NSObject *targetQueue;
  _QWORD v4[6];

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__NAFConnectionClientServiceDelegate_quickStopWasHandledWithActions___block_invoke;
  v4[3] = &unk_251857A40;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __69__NAFConnectionClientServiceDelegate_quickStopWasHandledWithActions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 136315650;
    v8 = "-[NAFConnectionClientServiceDelegate quickStopWasHandledWithActions:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_246FF4000, v2, OS_LOG_TYPE_INFO, "%s %@ Got quick stop handled message with actions %tu taken.", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_connectionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v5, "assistantConnection:didHandleQuickStopWithAction:", WeakRetained, *(_QWORD *)(a1 + 40));

  }
}

- (void)getBulletinContext:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__NAFConnectionClientServiceDelegate_getBulletinContext___block_invoke;
  v7[3] = &unk_251858138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

void __57__NAFConnectionClientServiceDelegate_getBulletinContext___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "_cachedBulletins");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  }
}

- (void)acousticIDRequestWillStart
{
  NSObject *targetQueue;
  _QWORD block[5];

  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__NAFConnectionClientServiceDelegate_acousticIDRequestWillStart__block_invoke;
  block[3] = &unk_251857888;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

void __64__NAFConnectionClientServiceDelegate_acousticIDRequestWillStart__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateWillStartAcousticIDRequest");

}

- (void)musicWasDetected
{
  NSObject *targetQueue;
  _QWORD block[5];

  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NAFConnectionClientServiceDelegate_musicWasDetected__block_invoke;
  block[3] = &unk_251857888;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

void __54__NAFConnectionClientServiceDelegate_musicWasDetected__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateDidDetectMusic");

}

- (void)acousticIDRequestDidFinishWithSuccess:(BOOL)a3
{
  NSObject *targetQueue;
  _QWORD v4[5];
  BOOL v5;

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __76__NAFConnectionClientServiceDelegate_acousticIDRequestDidFinishWithSuccess___block_invoke;
  v4[3] = &unk_251858160;
  v4[4] = self;
  v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __76__NAFConnectionClientServiceDelegate_acousticIDRequestDidFinishWithSuccess___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateDidFinishAcousticIDRequestWithSuccess:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setUserActivityInfo:(id)a3 webpageURL:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__NAFConnectionClientServiceDelegate_setUserActivityInfo_webpageURL___block_invoke;
  block[3] = &unk_251857F58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

void __69__NAFConnectionClientServiceDelegate_setUserActivityInfo_webpageURL___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellDelegateSetUserActivityInfo:webpageURL:", a1[5], a1[6]);

}

- (void)invalidateCurrentUserActivity
{
  NSObject *targetQueue;
  _QWORD block[5];

  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NAFConnectionClientServiceDelegate_invalidateCurrentUserActivity__block_invoke;
  block[3] = &unk_251857888;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

void __67__NAFConnectionClientServiceDelegate_invalidateCurrentUserActivity__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateInvalidateCurrentUserActivity");

}

- (void)cacheImage:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__NAFConnectionClientServiceDelegate_cacheImage___block_invoke;
  v7[3] = &unk_251857720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

void __49__NAFConnectionClientServiceDelegate_cacheImage___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateCacheImage:", *(_QWORD *)(a1 + 40));

}

- (void)extensionRequestWillStartForApplication:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__NAFConnectionClientServiceDelegate_extensionRequestWillStartForApplication___block_invoke;
  v7[3] = &unk_251857720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

void __78__NAFConnectionClientServiceDelegate_extensionRequestWillStartForApplication___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateExtensionRequestWillStartForApplication:", *(_QWORD *)(a1 + 40));

}

- (void)extensionRequestFinishedForApplication:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__NAFConnectionClientServiceDelegate_extensionRequestFinishedForApplication_error___block_invoke;
  block[3] = &unk_251857F58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

void __83__NAFConnectionClientServiceDelegate_extensionRequestFinishedForApplication_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellDelegateExtensionRequestFinishedForApplication:error:", a1[5], a1[6]);

}

- (void)shouldSpeakChanged:(BOOL)a3
{
  NSObject *targetQueue;
  _QWORD v4[5];
  BOOL v5;

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__NAFConnectionClientServiceDelegate_shouldSpeakChanged___block_invoke;
  v4[3] = &unk_251858160;
  v4[4] = self;
  v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __57__NAFConnectionClientServiceDelegate_shouldSpeakChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setShouldSpeak:", *(unsigned __int8 *)(a1 + 40));

}

- (void)audioSessionIDChanged:(unsigned int)a3
{
  NSObject *targetQueue;
  _QWORD v4[5];
  unsigned int v5;

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__NAFConnectionClientServiceDelegate_audioSessionIDChanged___block_invoke;
  v4[3] = &unk_251858188;
  v4[4] = self;
  v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __60__NAFConnectionClientServiceDelegate_audioSessionIDChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setAudioSessionID:", *(unsigned int *)(a1 + 40));

}

- (void)aceConnectionWillRetryOnError:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__NAFConnectionClientServiceDelegate_aceConnectionWillRetryOnError___block_invoke;
  v7[3] = &unk_251857720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

void __68__NAFConnectionClientServiceDelegate_aceConnectionWillRetryOnError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_aceConnectionWillRetryOnError:", *(_QWORD *)(a1 + 40));

}

- (void)speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__NAFConnectionClientServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper_reply___block_invoke;
  block[3] = &unk_2518580C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

uint64_t __98__NAFConnectionClientServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper_reply___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  v3 = objc_msgSend(WeakRetained, "_startInputAudioPowerUpdatesWithXPCWrapper:", a1[5]);

  v4 = objc_loadWeakRetained((id *)(a1[4] + 8));
  v5 = v4;
  if ((v3 & 1) != 0)
    v6 = 0;
  else
    v6 = a1[5];
  objc_msgSend(v4, "_tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper:", v6);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)speechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *targetQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;

  v8 = a3;
  v9 = a5;
  kdebug_trace();
  targetQueue = self->_targetQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __98__NAFConnectionClientServiceDelegate_speechRecordingDidBeginOnAVRecordRoute_audioSessionID_reply___block_invoke;
  v13[3] = &unk_2518581B0;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(targetQueue, v13);

}

void __98__NAFConnectionClientServiceDelegate_speechRecordingDidBeginOnAVRecordRoute_audioSessionID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setAudioSessionID:", *(unsigned int *)(a1 + 56));
  objc_msgSend(WeakRetained, "_setRecordRoute:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidBeginOnAVRecordRoute:audioSessionID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updateStateIfNotInSync");
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (void)speechRecordingDidChangeAVRecordRoute:(id)a3 isDucking:(BOOL)a4 isTwoShot:(BOOL)a5 speechEndHostTime:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  NSObject *targetQueue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  unint64_t v20;
  BOOL v21;
  BOOL v22;

  v12 = a3;
  v13 = a7;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __120__NAFConnectionClientServiceDelegate_speechRecordingDidChangeAVRecordRoute_isDucking_isTwoShot_speechEndHostTime_reply___block_invoke;
  block[3] = &unk_2518581D8;
  block[4] = self;
  v18 = v12;
  v21 = a4;
  v22 = a5;
  v19 = v13;
  v20 = a6;
  v15 = v13;
  v16 = v12;
  dispatch_async(targetQueue, block);

}

void __120__NAFConnectionClientServiceDelegate_speechRecordingDidChangeAVRecordRoute_isDucking_isTwoShot_speechEndHostTime_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setRecordRoute:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(WeakRetained, "_markIsDucking");
  if (*(_BYTE *)(a1 + 65))
    objc_msgSend(WeakRetained, "_markIsTwoShot");
  v2 = WeakRetained;
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "_updateSpeechEndHostTime:");
    v2 = WeakRetained;
  }
  objc_msgSend(v2, "_tellSpeechDelegateRecordingDidChangeAVRecordRoute:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

- (void)speechRecordingStartpointDetectedWithReply:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__NAFConnectionClientServiceDelegate_speechRecordingStartpointDetectedWithReply___block_invoke;
  v7[3] = &unk_251858200;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

uint64_t __81__NAFConnectionClientServiceDelegate_speechRecordingStartpointDetectedWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidDetectStartpoint");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)speechRecordingPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4
{
  id v6;
  NSObject *targetQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__NAFConnectionClientServiceDelegate_speechRecordingPerformTwoShotPromptWithType_reply___block_invoke;
  block[3] = &unk_251858228;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(targetQueue, block);

}

void __88__NAFConnectionClientServiceDelegate_speechRecordingPerformTwoShotPromptWithType_reply___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateToPerformTwoShotPromptWithType:reply:", a1[6], a1[5]);

}

- (void)speechRecordingDidEndWithReply:(id)a3
{
  id v5;
  NSObject *targetQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__NAFConnectionClientServiceDelegate_speechRecordingDidEndWithReply___block_invoke;
  block[3] = &unk_251858228;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(targetQueue, block);

}

void __69__NAFConnectionClientServiceDelegate_speechRecordingDidEndWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_extendRequestTimeoutForReason:durationInSeconds:", v2, 0.0);
  objc_msgSend(WeakRetained, "_checkAndSetIsCapturingSpeech:", 0);
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidEnd");
  objc_msgSend(WeakRetained, "_beginInterstitialsForReason:", v2);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

- (void)speechRecordingDidCancelWithReply:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__NAFConnectionClientServiceDelegate_speechRecordingDidCancelWithReply___block_invoke;
  v7[3] = &unk_251858200;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

void __72__NAFConnectionClientServiceDelegate_speechRecordingDidCancelWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_updateStateIfNotInSync");
  objc_msgSend(WeakRetained, "_checkAndSetIsCapturingSpeech:", 0);
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidCancel");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (void)speechRecordingDidFail:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NAFConnectionClientServiceDelegate_speechRecordingDidFail_reply___block_invoke;
  block[3] = &unk_2518580C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

uint64_t __67__NAFConnectionClientServiceDelegate_speechRecordingDidFail_reply___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_speechRecordingDidFailWithError:", a1[5]);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)willStopRecordingWithSignpostID:(unint64_t)a3
{
  NSObject *targetQueue;
  _QWORD v4[6];

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__NAFConnectionClientServiceDelegate_willStopRecordingWithSignpostID___block_invoke;
  v4[3] = &unk_251857A40;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __70__NAFConnectionClientServiceDelegate_willStopRecordingWithSignpostID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_willStopRecordingWithSignpostID:", *(_QWORD *)(a1 + 40));

}

- (void)speechRecognized:(id)a3
{
  id v5;
  NSObject *targetQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__NAFConnectionClientServiceDelegate_speechRecognized___block_invoke;
  block[3] = &unk_251858250;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(targetQueue, block);

}

void __55__NAFConnectionClientServiceDelegate_speechRecognized___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_markSpeechRecognized");
  objc_msgSend(WeakRetained, "_extendRequestTimeoutForReason:durationInSeconds:", v2, 0.0);
  objc_msgSend(WeakRetained, "_tellSpeechDelegateSpeechRecognized:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "_beginInterstitialsForReason:", v2);

}

- (void)speechRecognizedAdditionalInterpretation:(id)a3 refId:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__NAFConnectionClientServiceDelegate_speechRecognizedAdditionalInterpretation_refId___block_invoke;
  block[3] = &unk_251857F58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

void __85__NAFConnectionClientServiceDelegate_speechRecognizedAdditionalInterpretation_refId___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecognizedAdditionalSpeechInterpretation:refId:", a1[5], a1[6]);

}

- (void)speechRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *targetQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  targetQueue = self->_targetQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __98__NAFConnectionClientServiceDelegate_speechRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke;
  v15[3] = &unk_251858278;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(targetQueue, v15);

}

void __98__NAFConnectionClientServiceDelegate_speechRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidUpdateRecognitionPhrases:utterances:refId:", a1[5], a1[6], a1[7]);

}

- (void)speechRecordingWillBeginRecognitionUpdateForTask:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__NAFConnectionClientServiceDelegate_speechRecordingWillBeginRecognitionUpdateForTask___block_invoke;
  v7[3] = &unk_251857720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

void __87__NAFConnectionClientServiceDelegate_speechRecordingWillBeginRecognitionUpdateForTask___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecognitionUpdateWillBeginForTask:", *(_QWORD *)(a1 + 40));

}

- (void)speechRecognizedPartialResult:(id)a3
{
  id v5;
  NSObject *targetQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__NAFConnectionClientServiceDelegate_speechRecognizedPartialResult___block_invoke;
  block[3] = &unk_251858250;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(targetQueue, block);

}

void __68__NAFConnectionClientServiceDelegate_speechRecognizedPartialResult___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_extendExistingRequestTimeoutForReason:", v3);

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v4, "_tellSpeechDelegateSpeechRecognizedPartialResult:", *(_QWORD *)(a1 + 40));

}

- (void)speechRecognitionDidFail:(id)a3
{
  id v5;
  NSObject *targetQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__NAFConnectionClientServiceDelegate_speechRecognitionDidFail___block_invoke;
  block[3] = &unk_251858250;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(targetQueue, block);

}

void __63__NAFConnectionClientServiceDelegate_speechRecognitionDidFail___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_cancelRequestTimeoutForReason:", v3);

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v4, "_tellSpeechDelegateRecognitionDidFail:", *(_QWORD *)(a1 + 40));

}

- (void)audioSessionDidBeginInterruptionWithUserInfo:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__NAFConnectionClientServiceDelegate_audioSessionDidBeginInterruptionWithUserInfo___block_invoke;
  v7[3] = &unk_251857720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

void __83__NAFConnectionClientServiceDelegate_audioSessionDidBeginInterruptionWithUserInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioSessionDidBeginInterruptionWithUserInfo:", *(_QWORD *)(a1 + 40));

}

- (void)audioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4
{
  id v6;
  NSObject *targetQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__NAFConnectionClientServiceDelegate_audioSessionDidEndInterruption_userInfo___block_invoke;
  block[3] = &unk_2518582A0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(targetQueue, block);

}

void __78__NAFConnectionClientServiceDelegate_audioSessionDidEndInterruption_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioSessionDidEndInterruption:userInfo:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)audioPlaybackRequestWillStart:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__NAFConnectionClientServiceDelegate_audioPlaybackRequestWillStart___block_invoke;
  v7[3] = &unk_251857720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

void __68__NAFConnectionClientServiceDelegate_audioPlaybackRequestWillStart___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioPlaybackRequestWillStart:", *(_QWORD *)(a1 + 40));

}

- (void)audioPlaybackRequestDidStart:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__NAFConnectionClientServiceDelegate_audioPlaybackRequestDidStart___block_invoke;
  v7[3] = &unk_251857720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

void __67__NAFConnectionClientServiceDelegate_audioPlaybackRequestDidStart___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioPlaybackRequestDidStart:", *(_QWORD *)(a1 + 40));

}

- (void)audioPlaybackRequestDidStop:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *targetQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__NAFConnectionClientServiceDelegate_audioPlaybackRequestDidStop_error___block_invoke;
  block[3] = &unk_251857F58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(targetQueue, block);

}

void __72__NAFConnectionClientServiceDelegate_audioPlaybackRequestDidStop_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioPlaybackRequestDidStop:error:", a1[5], a1[6]);

}

- (void)willProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *targetQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  targetQueue = self->_targetQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81__NAFConnectionClientServiceDelegate_willProcessStartPlayback_intent_completion___block_invoke;
  v13[3] = &unk_2518582C8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(targetQueue, v13);

}

void __81__NAFConnectionClientServiceDelegate_willProcessStartPlayback_intent_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "_tellDelegateWillProcessStartPlayback:intent:completion:", a1[7], a1[5], a1[6]);

}

- (void)startPlaybackDidFail:(int64_t)a3
{
  NSObject *targetQueue;
  _QWORD v4[6];

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__NAFConnectionClientServiceDelegate_startPlaybackDidFail___block_invoke;
  v4[3] = &unk_251857A40;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(targetQueue, v4);
}

void __59__NAFConnectionClientServiceDelegate_startPlaybackDidFail___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateStartPlaybackDidFail:", *(_QWORD *)(a1 + 40));

}

- (void)audioSessionWillBecomeActive:(BOOL)a3
{
  NSObject *targetQueue;
  _QWORD v4[5];
  BOOL v5;

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__NAFConnectionClientServiceDelegate_audioSessionWillBecomeActive___block_invoke;
  v4[3] = &unk_251858160;
  v4[4] = self;
  v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __67__NAFConnectionClientServiceDelegate_audioSessionWillBecomeActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioSessionWillBecomeActive:", *(unsigned __int8 *)(a1 + 40));

}

- (void)audioSessionDidBecomeActive:(BOOL)a3
{
  NSObject *targetQueue;
  _QWORD v4[5];
  BOOL v5;

  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__NAFConnectionClientServiceDelegate_audioSessionDidBecomeActive___block_invoke;
  v4[3] = &unk_251858160;
  v4[4] = self;
  v5 = a3;
  dispatch_async(targetQueue, v4);
}

void __66__NAFConnectionClientServiceDelegate_audioSessionDidBecomeActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellDelegateAudioSessionDidBecomeActive:", *(unsigned __int8 *)(a1 + 40));

}

- (void)willProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__NAFConnectionClientServiceDelegate_willProcessAppLaunchWithBundleIdentifier___block_invoke;
  block[3] = &unk_2518582F0;
  objc_copyWeak(&v9, &to);
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&to);
}

void __79__NAFConnectionClientServiceDelegate_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_tellDelegateWillProcessAppLaunchWithBundleIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)appLaunchFailedWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__NAFConnectionClientServiceDelegate_appLaunchFailedWithBundleIdentifier___block_invoke;
  block[3] = &unk_2518582F0;
  objc_copyWeak(&v9, &to);
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&to);
}

void __74__NAFConnectionClientServiceDelegate_appLaunchFailedWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_tellDelegateFailedToLaunchAppWithBundleIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)networkDidBecomeActive
{
  NSObject *targetQueue;
  _QWORD v4[4];
  id v5;
  id to;

  objc_copyWeak(&to, (id *)&self->_connection);
  targetQueue = self->_targetQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__NAFConnectionClientServiceDelegate_networkDidBecomeActive__block_invoke;
  v4[3] = &unk_251857A90;
  objc_copyWeak(&v5, &to);
  dispatch_async(targetQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&to);
}

void __60__NAFConnectionClientServiceDelegate_networkDidBecomeActive__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_markNetworkDidBecomeActive");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
}

void __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_13();
  v4 = 2048;
  v5 = v0;
  OUTLINED_FUNCTION_14(&dword_246FF4000, v1, v2, "%s Delaying delivery of client command %@ by %f seconds...", (uint8_t *)v3);
  OUTLINED_FUNCTION_7();
}

void __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_672_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = (void *)MEMORY[0x24BDD1760];
  v5 = a2;
  objc_msgSend(v4, "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemUptime");
  v8 = v7 - *(double *)(a1 + 64);
  v10 = 136315650;
  v11 = "-[NAFConnectionClientServiceDelegate requestHandleCommand:reply:]_block_invoke";
  v12 = 2112;
  v13 = v3;
  v14 = 2048;
  v15 = v8;
  OUTLINED_FUNCTION_14(&dword_246FF4000, v5, v9, "%s Delayed delivery of client command %@ by %f seconds.", (uint8_t *)&v10);

  OUTLINED_FUNCTION_12();
}

void __65__NAFConnectionClientServiceDelegate_requestHandleCommand_reply___block_invoke_672_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_246FF4000, v0, v1, "%s Dropping delayed client command %@ because request already ended.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __92__NAFConnectionClientServiceDelegate_requestRequestedOpenApplicationWithBundleID_URL_reply___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_246FF4000, a1, a3, "%s Unexpected nil bundle ID", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __68__NAFConnectionClientServiceDelegate_requestRequestedOpenURL_reply___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_246FF4000, a1, a3, "%s Unexpected nil URL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
