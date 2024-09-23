@implementation ICSCDPStatusUpdateHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSCDPStatusUpdateHook changeControllerForAction:](self, "changeControllerForAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE7EE50]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  -[ICSCDPStatusUpdateHook changeControllerForAction:](self, "changeControllerForAction:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[ICSCDPStatusUpdateHook _processAttributes:](self, "_processAttributes:", a4);
  objc_msgSend(v12, "name");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[ICSCDPStatusUpdateHook _updateStatusWithAction:forObjectModel:completion:](self, "_updateStatusWithAction:forObjectModel:completion:", v13, v11, v10);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSCDPStatusUpdateHook _processAttributes:](self, "_processAttributes:", v7);

  objc_opt_class();
  objc_msgSend(v11, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE7EE50]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  -[ICSCDPStatusUpdateHook _updateStatusWithAction:forObjectModel:completion:](self, "_updateStatusWithAction:forObjectModel:completion:", v10, v11, v6);
}

- (void)_processAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE7EE78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  self->_presentationType = -[ICSCDPStatusUpdateHook _presentationTypeForString:](self, "_presentationTypeForString:", v7);
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICSCDPStatusUpdateHook _processAttributes:].cold.1((uint64_t)self, (uint64_t *)&self->_presentationType, v8);

}

- (unint64_t)_presentationTypeForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE7EE68]) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE7EE70]) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE7EE80]))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_updateStatusWithAction:(id)a3 forObjectModel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  RUIServerHookResponse *v13;
  RUIServerHookResponse *serverHookResponse;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id location;
  _BYTE v35[32];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v23 = a4;
  v9 = a5;
  -[ICSCDPStatusUpdateHook changeControllerForAction:](self, "changeControllerForAction:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ICSCDPStatusUpdateHook delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentationContextForHook:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (RUIServerHookResponse *)objc_alloc_init(MEMORY[0x24BE7EE00]);
    serverHookResponse = self->_serverHookResponse;
    self->_serverHookResponse = v13;

    objc_initWeak(&location, self);
    v15 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke;
    v29[3] = &unk_251C61A68;
    objc_copyWeak(&v33, &location);
    v16 = v9;
    v32 = v16;
    v17 = v23;
    v30 = v17;
    v18 = v8;
    v31 = v18;
    objc_msgSend(v10, "setUserActionCallback:", v29);
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_28;
    v24[3] = &unk_251C61A90;
    objc_copyWeak(&v28, &location);
    v27 = v16;
    v25 = v17;
    v19 = v18;
    v26 = v19;
    objc_msgSend(v10, "setCompletionCallback:", v24);
    _AAUILogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_opt_class();
      -[ICSCDPStatusUpdateHook _updateStatusWithAction:forObjectModel:completion:].cold.2(v21, (uint64_t)v19, (uint64_t)v35, v20);
    }

    objc_msgSend(v10, "presentWithViewController:presentationType:", v12, self->_presentationType);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    _AAUILogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[ICSCDPStatusUpdateHook _updateStatusWithAction:forObjectModel:completion:].cold.1((uint64_t)self, (uint64_t)v8, v22);

    objc_msgSend(MEMORY[0x24BDD1540], "aa_errorWithCode:", -3, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v12);
  }

}

void __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleUserInteractionWithCallback:onModel:forHookAction:userAction:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
  }
  else
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_cold_1(v6);

  }
}

void __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleCompletionWithCallback:onModel:forHookAction:userAction:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, v5);
  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_28_cold_1(v8);

  }
}

- (id)changeControllerForAction:(id)a3
{
  return 0;
}

- (id)additionalPayloadForAction:(id)a3 error:(id)a4
{
  return 0;
}

- (void)_handleUserInteractionWithCallback:(id)a3 onModel:(id)a4 forHookAction:(id)a5 userAction:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  const __CFString *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 - 1 < 2)
    goto LABEL_4;
  if (!a6)
  {
    _AAUILogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = objc_opt_class();
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_24B4C1000, v14, OS_LOG_TYPE_DEFAULT, "%@: Status for %@ not being updated due to user decline.", (uint8_t *)&v15, 0x16u);
    }

    v13 = CFSTR("onUserDecline");
    goto LABEL_8;
  }
  if (a6 == 3)
  {
LABEL_4:
    v13 = CFSTR("onUserAccept");
LABEL_8:
    -[ICSCDPStatusUpdateHook _invokeJSCallback:onModel:](self, "_invokeJSCallback:onModel:", v13, v11);
  }

}

- (void)_handleCompletionWithCallback:(id)a3 onModel:(id)a4 forHookAction:(id)a5 userAction:(unint64_t)a6 error:(id)a7
{
  void (**v12)(id, _BOOL8, void *);
  id v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *v17;
  _BOOL8 v19;
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v29;
  _QWORD v30[2];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v12 = (void (**)(id, _BOOL8, void *))a3;
  v13 = a4;
  v14 = a5;
  v15 = (__CFString *)a7;
  v16 = v15;
  if (!a6 && !v15)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0AB28], -7003, 0);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _AAUILogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v32 = objc_opt_class();
      v33 = 2112;
      v34 = v14;
      v35 = 2112;
      v36 = v16;
      _os_log_debug_impl(&dword_24B4C1000, v17, OS_LOG_TYPE_DEBUG, "%@: User declined status update for %@ and no error was provided. Using %@", buf, 0x20u);
    }

  }
  v19 = a6 != 3 && v16 == 0;
  _AAUILogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_opt_class();
    v22 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v32 = v21;
    v33 = 2112;
    if (v19)
      v22 = CFSTR("YES");
    v34 = v14;
    v35 = 2112;
    v36 = v22;
    v37 = 2112;
    v38 = v16;
    _os_log_impl(&dword_24B4C1000, v20, OS_LOG_TYPE_DEFAULT, "%@: Calling completion callback for %@ with (didChange: %@, error: %@)", buf, 0x2Au);
  }

  if (v16)
  {
    v23 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v25;
  v30[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSCDPStatusUpdateHook _invokeJSCallback:onModel:withArguments:](self, "_invokeJSCallback:onModel:withArguments:", CFSTR("onCompletion"), v13, v26);

  -[ICSCDPStatusUpdateHook additionalPayloadForAction:error:](self, "additionalPayloadForAction:error:", v14, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIServerHookResponse setAdditionalPayload:](self->_serverHookResponse, "setAdditionalPayload:", v27);

  v29 = a6 == 3 || v16 == 0;
  v12[2](v12, v29, v16);
  -[ICSCDPStatusUpdateHook postCompletionProcessingForAction:error:](self, "postCompletionProcessingForAction:error:", v14, v16);

}

- (void)_invokeJSCallback:(id)a3 onModel:(id)a4
{
  -[ICSCDPStatusUpdateHook _invokeJSCallback:onModel:withArguments:](self, "_invokeJSCallback:onModel:withArguments:", a3, a4, MEMORY[0x24BDBD1A8]);
}

- (void)_invokeJSCallback:(id)a3 onModel:(id)a4 withArguments:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  objc_msgSend(v8, "clientInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  v13 = objc_msgSend(v12, "length");
  _AAUILogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      v17 = 138413058;
      v18 = objc_opt_class();
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_24B4C1000, v14, OS_LOG_TYPE_DEFAULT, "%@: Calling %@ callback using %@ with arguments: %@", (uint8_t *)&v17, 0x2Au);
    }

    v16 = (id)objc_msgSend(v8, "invokeScriptFunction:withArguments:", v12, v9);
  }
  else
  {
    if (v15)
    {
      v17 = 138412546;
      v18 = objc_opt_class();
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_24B4C1000, v14, OS_LOG_TYPE_DEFAULT, "%@: Skipping %@ callback, no function provided.", (uint8_t *)&v17, 0x16u);
    }

  }
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
  objc_storeStrong((id *)&self->_serverHookResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionControllers, 0);
}

- (void)_processAttributes:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  OUTLINED_FUNCTION_0_2(&dword_24B4C1000, a3, (uint64_t)a3, "%@: presentation type is: %lu", (uint8_t *)&v4);
}

- (void)_updateStatusWithAction:(uint64_t)a1 forObjectModel:(uint64_t)a2 completion:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 138412546;
  v6 = objc_opt_class();
  v7 = 2112;
  v8 = a2;
  _os_log_fault_impl(&dword_24B4C1000, a3, OS_LOG_TYPE_FAULT, "%@: Unexpected action processed - %@", (uint8_t *)&v5, 0x16u);
}

- (void)_updateStatusWithAction:(uint64_t)a3 forObjectModel:(NSObject *)a4 completion:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_2(&dword_24B4C1000, a4, a3, "%@: Presenting CDP status change controller for %@", (uint8_t *)a3);
}

void __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24B4C1000, log, OS_LOG_TYPE_ERROR, "AAUICDPStatusUpdateHook not present when userActionCallback was called. Skipping user interaction JS callbacks.", v1, 2u);
}

void __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_28_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_24B4C1000, log, OS_LOG_TYPE_FAULT, "AAUICDPStatusUpdateHook not present when completionCallback was called. Status update may have been successful, but JS callbacks/refreshUrl handling will not be invoked.", v1, 2u);
}

@end
