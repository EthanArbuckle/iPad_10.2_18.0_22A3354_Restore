@implementation WFRemoteExecuteActionIfApplicable

void __WFRemoteExecuteActionIfApplicable_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  WFRemoteExecutionErrorEvent *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setDidRunRemotely:", 1);
  objc_msgSend(v20, "error");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSource:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "pairedDeviceModelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDestinationType:", v11);

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActionIdentifier:", v12);

  objc_msgSend(v10, "setCompleted:", v5 != 0);
  objc_msgSend(v10, "track");
  if (v5)
  {
    v13 = objc_alloc_init(WFRemoteExecutionErrorEvent);
    -[WFRemoteExecutionErrorEvent setSource:](v13, "setSource:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "pairedDeviceModelIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionErrorEvent setDestinationType:](v13, "setDestinationType:", v14);

    objc_msgSend(v9, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionErrorEvent setErrorDomain:](v13, "setErrorDomain:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "code"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteExecutionErrorEvent setErrorCode:](v13, "setErrorCode:", v17);

    -[WFEvent track](v13, "track");
  }
  v18 = *(_QWORD *)(a1 + 56);
  if (v20)
  {
    objc_msgSend(v20, "output");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v18 + 16))(v18, v19, v9);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v18 + 16))(v18, 0, v9);
  }

}

@end
