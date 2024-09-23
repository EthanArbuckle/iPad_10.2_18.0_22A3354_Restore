@implementation SearchUIOpenMediaHandler

- (id)intent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CBDB58]);
  -[SearchUIOpenMediaHandler mediaMetadata](self, "mediaMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIMediaUtilities mediaSearchForMetadata:](SearchUIMediaUtilities, "mediaSearchForMetadata:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithMediaItems:mediaSearch:", 0, v5);

  return v6;
}

- (id)mediaMetadata
{
  void *v2;
  void *v3;

  -[SearchUICommandHandler command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsIntentPath
{
  void *v2;
  BOOL v3;

  -[SearchUIOpenMediaHandler clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SearchUIMediaUtilities bundleIdentifierSupportsOpenIntent:](SearchUIMediaUtilities, "bundleIdentifierSupportsOpenIntent:", v2);

  return v3;
}

- (id)clientSelectedBundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[SearchUICommandHandler command](self, "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientSelectedBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIOpenMediaHandler;
    -[SearchUIMediaHandler clientSelectedBundleIdentifier](&v9, sel_clientSelectedBundleIdentifier);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)actionProvider
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD aBlock[4];
  id v12;
  id v13;
  id v14;

  -[SearchUICommandHandler command](self, "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__SearchUIOpenMediaHandler_actionProvider__block_invoke;
  aBlock[3] = &unk_1EA1F75A0;
  v12 = v3;
  v13 = v5;
  v14 = v4;
  v6 = v4;
  v7 = v5;
  v8 = v3;
  v9 = _Block_copy(aBlock);

  return v9;
}

id __42__SearchUIOpenMediaHandler_actionProvider__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  _QWORD v24[5];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(a1[4], "mediaMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIMediaUtilities mediaDestinationsForMediaMetadata:](SearchUIMediaUtilities, "mediaDestinationsForMediaMetadata:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v12, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "image");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "loadImageWithScale:isDarkStyle:", 0, v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __42__SearchUIOpenMediaHandler_actionProvider__block_invoke_2;
        v24[3] = &unk_1EA1F7578;
        v24[4] = v12;
        v25 = a1[5];
        v26 = a1[6];
        objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, v16, 0, v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "addObject:", v17);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v2, "count"))
  {
    v18 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(a1[4], "mediaMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "disambiguationTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "menuWithTitle:children:", v20, v2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __42__SearchUIOpenMediaHandler_actionProvider__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCommand:", v3);

  +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeWithTriggerEvent:", 2);

  SearchUITapLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_impl(&dword_1DAD39000, v5, OS_LOG_TYPE_DEFAULT, "tapping %@", (uint8_t *)&v6, 0xCu);
  }

}

@end
