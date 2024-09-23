@implementation WFACEUtilities

+ (void)wf_handleCommand:(id)a3 onRemoteDevice:(id)a4 usingClient:(id)a5 commandHandler:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, id);
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  void (**v22)(id, _QWORD, id);
  _QWORD v23[4];
  id v24;
  id v25;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, id))a7;
  v15 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(a3, "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v15, "dataWithPropertyList:format:options:error:", v16, 200, 0, &v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v25;

  if (v18)
  {
    if (v14)
      v14[2](v14, 0, v18);
  }
  else
  {
    v19 = objc_alloc_init(MEMORY[0x1E0D88078]);
    objc_msgSend(v19, "setRemoteDevice:", v11);
    objc_msgSend(v19, "setRequiresResponseFromRemote:", 1);
    objc_msgSend(v19, "setSerializedCommand:", v17);
    v20 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __88__WFACEUtilities_wf_handleCommand_onRemoteDevice_usingClient_commandHandler_completion___block_invoke;
    v23[3] = &unk_1E7AF8838;
    v24 = v13;
    v21[0] = v20;
    v21[1] = 3221225472;
    v21[2] = __88__WFACEUtilities_wf_handleCommand_onRemoteDevice_usingClient_commandHandler_completion___block_invoke_2;
    v21[3] = &unk_1E7AF8860;
    v22 = v14;
    objc_msgSend(v12, "handleCommand:afterCurrentRequest:commandHandler:completion:", v19, 0, v23, v21);

  }
}

void __88__WFACEUtilities_wf_handleCommand_onRemoteDevice_usingClient_commandHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315906;
      v12 = "WFEnforceClass";
      v13 = 2114;
      v14 = v5;
      v15 = 2114;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v4;
      v8 = v16;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v11, 0x2Au);

    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v6, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

uint64_t __88__WFACEUtilities_wf_handleCommand_onRemoteDevice_usingClient_commandHandler_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
