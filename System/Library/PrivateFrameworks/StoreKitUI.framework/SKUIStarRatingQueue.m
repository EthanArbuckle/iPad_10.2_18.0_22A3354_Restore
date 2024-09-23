@implementation SKUIStarRatingQueue

- (SKUIStarRatingQueue)init
{
  return -[SKUIStarRatingQueue initWithClientContext:reviewConfiguration:](self, "initWithClientContext:reviewConfiguration:", 0, 0);
}

- (SKUIStarRatingQueue)initWithClientContext:(id)a3 reviewConfiguration:(id)a4
{
  id v7;
  id v8;
  SKUIStarRatingQueue *v9;
  SKUIStarRatingQueue *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStarRatingQueue initWithClientContext:reviewConfiguration:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIStarRatingQueue;
  v9 = -[SKUIStarRatingQueue init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a3);
    objc_storeStrong((id *)&v10->_reviewConfiguration, a4);
  }

  return v10;
}

- (void)setRating:(int64_t)a3 forItemID:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SKUIStarRatingQueue _setRating:forItemID:account:completionBlock:](self, "_setRating:forItemID:account:completionBlock:", a3, v8, v11, v9);
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0DAF488]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__SKUIStarRatingQueue_setRating_forItemID_completionBlock___block_invoke;
    v13[3] = &unk_1E73A7760;
    v13[4] = self;
    v16 = a3;
    v14 = v8;
    v15 = v9;
    objc_msgSend(v12, "startWithAuthenticateResponseBlock:", v13);

  }
}

void __59__SKUIStarRatingQueue_setRating_forItemID_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "authenticateResponseType") == 4)
  {
    v3 = a1[7];
    v4 = (void *)a1[4];
    v5 = a1[5];
    objc_msgSend(v8, "authenticatedAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setRating:forItemID:account:completionBlock:", v3, v5, v6, a1[6]);

  }
  else
  {
    v7 = a1[6];
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, 0);
  }

}

- (void)_setRating:(int64_t)a3 forItemID:(id)a4 account:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  SKUIPostRatingOperation *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24[2];
  id location;
  _QWORD v26[5];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = *MEMORY[0x1E0DC4878];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__SKUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke;
  v26[3] = &__block_descriptor_40_e5_v8__0l;
  v26[4] = v13;
  v18 = (void *)objc_msgSend(v14, "beginBackgroundTaskWithName:expirationHandler:", v16, v26);

  v19 = -[SKUIPostRatingOperation initWithRating:forItemID:reviewConfiguration:]([SKUIPostRatingOperation alloc], "initWithRating:forItemID:reviewConfiguration:", a3, v10, self->_reviewConfiguration);
  objc_initWeak(&location, v19);
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __68__SKUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke_2;
  v22[3] = &unk_1E73A7788;
  objc_copyWeak(v24, &location);
  v20 = v12;
  v23 = v20;
  v24[1] = v18;
  -[SKUIPostRatingOperation setCompletionBlock:](v19, "setCompletionBlock:", v22);
  objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", v19);

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

}

void __68__SKUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(a1 + 32));

}

void __68__SKUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SKUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke_3;
  block[3] = &unk_1E73A5B18;
  v7 = WeakRetained;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  v9 = v4;
  v5 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __68__SKUIStarRatingQueue__setRating_forItemID_account_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "success") & 1) == 0 && v2)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4A8]), "initWithResponseDictionary:", v2);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "actions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      v9 = *MEMORY[0x1E0DAFCC0];
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "actionType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v9);

          if ((v12 & 1) != 0)
          {
            v3 = 1;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
    v3 = 0;
LABEL_13:

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    v14 = v3 ^ 1u;
    objc_msgSend(*(id *)(a1 + 32), "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, v14, v15);

  }
  if (*(_QWORD *)(a1 + 48) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endBackgroundTask:", *(_QWORD *)(a1 + 48));

  }
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_reviewConfiguration, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:reviewConfiguration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStarRatingQueue initWithClientContext:reviewConfiguration:]";
}

@end
