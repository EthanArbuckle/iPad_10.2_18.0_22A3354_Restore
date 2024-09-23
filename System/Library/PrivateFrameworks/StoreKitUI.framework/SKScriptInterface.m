@implementation SKScriptInterface

+ (id)webScriptNameForSelector:(SEL)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKScriptInterface webScriptNameForSelector:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  SUWebScriptNameForSelector2();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___SKScriptInterface;
    objc_msgSendSuper2(&v15, sel_webScriptNameForSelector_, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

+ (void)initialize
{
}

- (SKProductPageViewController)parentProductPageViewController
{
  return (SKProductPageViewController *)objc_loadWeakRetained((id *)&self->_parentProductPageViewController);
}

- (void)setParentProductPageViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentProductPageViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentProductPageViewController);
}

- (id)makeStoreSheetRequest
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKScriptStoreSheetRequest *v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKScriptInterface(SKScriptStoreSheetRequest) makeStoreSheetRequest].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = objc_alloc_init(SKScriptStoreSheetRequest);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v11);
  return v11;
}

- (void)showStoreSheetWithRequest:(id)a3 animated:(BOOL)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void (*v18)(_QWORD *);
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  BOOL v22;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKScriptInterface(SKScriptStoreSheetRequest) showStoreSheetWithRequest:animated:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v6, "newNativeStorePageRequest");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __83__SKScriptInterface_SKScriptStoreSheetRequest__showStoreSheetWithRequest_animated___block_invoke;
    v20[3] = &unk_1E73A11D8;
    v20[4] = self;
    v21 = v15;
    v22 = a4;
    v16 = v15;
    v17 = (void *)SKUIWebCoreFramework();
    v18 = (void (*)(_QWORD *))SKUIWeakLinkedSymbolForString("WebThreadRunOnMainThread", v17);
    if (v18)
      v18(v20);

  }
  else
  {
    v19 = SKUIWebCoreFramework();
    objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("WebScriptObject"), v19), "throwException:", CFSTR("Invalid argument"));
  }

}

void __83__SKScriptInterface_SKScriptStoreSheetRequest__showStoreSheetWithRequest_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "parentProductPageViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "parentViewController");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      while (1)
      {
        v5 = (id)v2;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v5, "parentViewController");
        v3 = objc_claimAutoreleasedReturnValue();

        v2 = v3;
        if (!v3)
          goto LABEL_2;
      }
      v2 = (uint64_t)v5;
    }
  }
LABEL_2:
  v4 = (id)v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "_showPageWithRequest:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

+ (void)webScriptNameForSelector:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
