@implementation WFSilentModeSettingsClient

- (void)getStateWithCompletionHandler:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  id v4;

  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  if (+[WFSilentModeSettingsClient canRunIntent](WFSilentModeSettingsClient, "canRunIntent"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC7960]);
    v3[2](v3, objc_msgSend(v4, "silentModeActive"), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFSettingsClientErrorDomain"), 4, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, id))v3)[2](v3, 0, v4);
  }

}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v5)(id, uint64_t);
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  if (+[WFSilentModeSettingsClient canRunIntent](WFSilentModeSettingsClient, "canRunIntent"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC7960]);
    objc_msgSend(v7, "setSilentMode:reason:client:", v4, CFSTR("Shortcuts settings client asked for it"), 2);
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFSettingsClientErrorDomain"), 4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v6;
  }
  v5[2](v5, v6);

}

+ (void)createClientWithCompletionHandler:(id)a3
{
  void (**v3)(id, id, _QWORD);
  id v4;

  v3 = (void (**)(id, id, _QWORD))a3;
  if (+[WFSilentModeSettingsClient canRunIntent](WFSilentModeSettingsClient, "canRunIntent"))
  {
    v4 = (id)objc_opt_new();
    v3[2](v3, v4, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFSettingsClientErrorDomain"), 4, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, id))v3)[2](v3, 0, v4);
  }

}

+ (BOOL)canRunIntent
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCapability:", *MEMORY[0x1E0DC80D0]);

  return v3;
}

+ (id)publisher
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SilentMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)reversePublisher
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SilentMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFSettingsClientBiomeReversalArbiter reversePublisherOptions](WFSettingsClientBiomeReversalArbiter, "reversePublisherOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publisherWithOptions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)reversalArbiter
{
  WFSettingsClientBiomeReversalArbiter *v3;
  void *v4;
  void *v5;
  WFSettingsClientBiomeReversalArbiter *v6;

  v3 = [WFSettingsClientBiomeReversalArbiter alloc];
  objc_msgSend(a1, "publisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reversePublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFSettingsClientBiomeReversalArbiter initWithPublisher:reversePublisher:](v3, "initWithPublisher:reversePublisher:", v4, v5);

  return v6;
}

+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "reversalArbiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WFSilentModeSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E7AE9DA8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getBookmarkForCurrentStateWithCompletionHandler:", v7);

}

+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "reversalArbiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "biomeBookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__WFSilentModeSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke;
  v11[3] = &unk_1E7AE9DD0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "getReversalStateWithBookmark:completionHandler:", v9, v11);

}

void __77__WFSilentModeSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v3 = objc_msgSend(a2, "starting");
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __78__WFSilentModeSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  WFSettingsClientBookmark *v7;
  id v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v5)
  {
    v7 = -[WFSettingsClientBookmark initWithBiomeBookmark:]([WFSettingsClientBookmark alloc], "initWithBiomeBookmark:", v5);
    (*(void (**)(uint64_t, WFSettingsClientBookmark *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, a3);
  }

}

@end
