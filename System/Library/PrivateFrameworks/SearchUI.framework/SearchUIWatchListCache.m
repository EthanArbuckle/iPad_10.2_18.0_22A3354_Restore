@implementation SearchUIWatchListCache

- (SearchUIWatchListCache)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIWatchListCache;
  return -[TLKAsyncCache init](&v3, sel_init);
}

- (void)getButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a5;
  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setIdentifier:", v11);

  objc_msgSend(v12, "setType:", v7);
  objc_msgSend(v12, "setIsHorizontallySrollingStyle:", v6);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__SearchUIWatchListCache_getButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke;
  v14[3] = &unk_1EA1F8230;
  v15 = v10;
  v13 = v10;
  -[TLKAsyncCache getObjectForKey:completionHandler:](self, "getObjectForKey:completionHandler:", v12, v14);

}

void __103__SearchUIWatchListCache_getButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "state");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v6, v4, v5);
}

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "type");
  v9 = objc_msgSend(v6, "isHorizontallySrollingStyle");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__SearchUIWatchListCache_computeObjectForKey_completionHandler___block_invoke;
  v11[3] = &unk_1EA1F7170;
  v12 = v5;
  v10 = v5;
  +[SearchUIWatchListUtilities computeButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:completion:](SearchUIWatchListUtilities, "computeButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:completion:", v7, v8, v9, v11);

}

void __64__SearchUIWatchListCache_computeObjectForKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = (id)objc_opt_new();
  objc_msgSend(v10, "setButtonModels:", v8);

  objc_msgSend(v10, "setState:", v9);
  objc_msgSend(v10, "setError:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
