@implementation SearchUIOpenCoreSpotlightItemHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SearchUIOpenCoreSpotlightItemHandler *v21;
  unint64_t v22;

  v8 = a3;
  v9 = a5;
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cardSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appEntityAnnotation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SearchUICommandHandler rowModel](self, "rowModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cardSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appEntityAnnotation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__SearchUIOpenCoreSpotlightItemHandler_performCommand_triggerEvent_environment___block_invoke;
    v18[3] = &unk_1EA1F6118;
    v19 = v8;
    v22 = a4;
    v20 = v9;
    v21 = self;
    +[SearchUIToolKitUtilities performOpenIntentForAnnotation:bundleId:completionHandler:](SearchUIToolKitUtilities, "performOpenIntentForAnnotation:bundleId:completionHandler:", v15, v16, v18);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SearchUIOpenCoreSpotlightItemHandler;
    -[SearchUIOpenUserActivityHandler performCommand:triggerEvent:environment:](&v17, sel_performCommand_triggerEvent_environment_, v8, a4, v9);
  }

}

void __80__SearchUIOpenCoreSpotlightItemHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  if ((a2 & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__SearchUIOpenCoreSpotlightItemHandler_performCommand_triggerEvent_environment___block_invoke_2;
    v7[3] = &unk_1EA1F60F0;
    v3 = *(id *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 56);
    v8 = v3;
    v11 = v4;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v9 = v5;
    v10 = v6;
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v7);

  }
}

id __80__SearchUIOpenCoreSpotlightItemHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)SearchUIOpenCoreSpotlightItemHandler;
  return objc_msgSendSuper2(&v5, sel_performCommand_triggerEvent_environment_, v2, v1, v3);
}

- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  id v7;
  objc_class *v8;
  void (**v9)(id, void *, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E0CA5920];
  v9 = (void (**)(id, void *, void *))a5;
  v10 = [v8 alloc];
  v11 = (void *)objc_msgSend(v10, "initWithActivityType:", *MEMORY[0x1E0CA5F10]);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v17, "coreSpotlightIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CA5F18]);
  objc_msgSend(v7, "searchString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CA5F08]);
  objc_msgSend(v17, "actionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CA5D08]);
  objc_msgSend(v11, "setUserInfo:", v12);
  objc_msgSend(v17, "applicationBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v11, v16);

}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  int v18;
  SearchUIFallbackPeekViewController *v19;
  SearchUIFallbackPeekViewController *v20;
  id v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coreSpotlightIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CD3248]);
  objc_msgSend(v6, "searchString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithSearchableItemUniqueIdentifier:queryString:applicationBundleIdentifier:previewTitle:", v9, v12, v10, v13);

  if (objc_msgSend(MEMORY[0x1E0CD3250], "canPreviewItem:", v14))
  {
    objc_msgSend(v8, "identifyingResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[SearchUIUtilities resultIsSiriAction:](SearchUIUtilities, "resultIsSiriAction:", v15);

    if (!v16)
    {
      v21 = objc_alloc(MEMORY[0x1E0CD3250]);
      v24[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (SearchUIFallbackPeekViewController *)objc_msgSend(v21, "initWithPreviewItems:", v22);

      goto LABEL_11;
    }
  }
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v10, "isEqualToString:", v17);

  if (v18)
  {
    +[SearchUICalendarStore eventControllerWithIdentifier:](SearchUICalendarStore, "eventControllerWithIdentifier:", v9);
    v19 = (SearchUIFallbackPeekViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v20 = 0;
      goto LABEL_11;
    }
    v19 = -[SearchUIFallbackPeekViewController initWithDetailedRowModel:]([SearchUIFallbackPeekViewController alloc], "initWithDetailedRowModel:", v8);
  }
  v20 = v19;
LABEL_11:

  return v20;
}

- (BOOL)supportsCopy
{
  return 0;
}

- (id)itemProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SearchUIOpenCoreSpotlightItemHandler;
  -[SearchUICommandHandler itemProvider](&v18, sel_itemProvider);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    -[SearchUICommandHandler rowModel](self, "rowModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifyingResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemProviderFileTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFileProviderTypeIdentifiers:", v9);

    -[SearchUICommandHandler rowModel](self, "rowModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifyingResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemProviderDataTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataProviderTypeIdentifiers:", v12);

    -[SearchUICommandHandler command](self, "command");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setApplicationBundleIdentifier:", v14);

    -[SearchUICommandHandler command](self, "command");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "coreSpotlightIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCoreSpotlightIdentifier:", v16);

    +[SearchUIItemProviderUtilities itemProviderForItem:](SearchUIItemProviderUtilities, "itemProviderForItem:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
