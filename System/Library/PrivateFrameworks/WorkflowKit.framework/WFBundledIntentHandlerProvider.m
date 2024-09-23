@implementation WFBundledIntentHandlerProvider

- (WFBundledIntentHandlerProvider)init
{
  WFBundledIntentHandlerProvider *v2;
  void *v3;
  WFBundledIntentHandlerProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFBundledIntentHandlerProvider;
  v2 = -[WFBundledIntentHandlerProvider init](&v6, sel_init);
  if (v2)
  {
    -[objc_class sharedInstance](getINCLocalExtensionRegistryClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerLocalExtension:", v2);

    v4 = v2;
  }

  return v2;
}

- (NSString)localExtensionIdentifier
{
  return (NSString *)CFSTR("com.apple.shortcuts.bundled-intent");
}

- (id)handlerForIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (handlerForIntent__onceToken != -1)
      dispatch_once(&handlerForIntent__onceToken, &__block_literal_global_445);
    v5 = (void *)handlerForIntent__intentHandlerForIdentifier;
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)handlerForIntent__intentHandlerForIdentifier;
    if (v7)
    {
      objc_msgSend(v3, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend((id)handlerForIntent__intentHandlerForIdentifier, "removeAllObjects");
      v12 = (void *)handlerForIntent__intentHandlerForIdentifier;
      objc_msgSend(v3, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_codableDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "typeName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WF%@IntentHandler"), v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(NSClassFromString(v16));

      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v13);
    }
  }
  else
  {
    getWFGeneralLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFBundledIntentHandlerProvider handlerForIntent:]";
      v20 = 2114;
      v21 = v3;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Unable to get handler for intent: %{public}@", buf, 0x16u);
    }

    v10 = 0;
  }

  return v10;
}

void __51__WFBundledIntentHandlerProvider_handlerForIntent___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)handlerForIntent__intentHandlerForIdentifier;
  handlerForIntent__intentHandlerForIdentifier = (uint64_t)v0;

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WFBundledIntentHandlerProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

+ (id)localIntentHandlerLaunchID
{
  void *v2;
  void *v3;

  +[WFBundledIntentHandlerProvider sharedInstance](WFBundledIntentHandlerProvider, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localExtensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __48__WFBundledIntentHandlerProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

@end
