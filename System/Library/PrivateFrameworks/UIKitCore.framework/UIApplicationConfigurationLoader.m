@implementation UIApplicationConfigurationLoader

void __49___UIApplicationConfigurationLoader_sharedLoader__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = -[_UIApplicationConfigurationLoader _init]([_UIApplicationConfigurationLoader alloc], "_init");
  v1 = (void *)qword_1ECD7E800;
  qword_1ECD7E800 = (uint64_t)v0;

  v2 = *(void **)(qword_1ECD7E800 + 8);
  *(_QWORD *)(qword_1ECD7E800 + 8) = 0;

}

id __70___UIApplicationConfigurationLoader_startPreloadInitializationContext__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_loadInitializationContext");
}

uint64_t __63___UIApplicationConfigurationLoader__loadInitializationContext__block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63___UIApplicationConfigurationLoader__loadInitializationContext__block_invoke_2;
  v2[3] = &unk_1E16B1888;
  v3 = *(_OWORD *)(a1 + 32);
  return __UIAPPLICATION_IS_LOADING_INITIALIZATION_INFO_FROM_THE_SYSTEM__((uint64_t)v2);
}

void __63___UIApplicationConfigurationLoader__loadInitializationContext__block_invoke_2(uint64_t a1)
{
  NSString *v2;
  NSString *v3;
  Class v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(*(id *)(a1 + 32), "usesLocalInitializationContext"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_appInitializationContextFactoryClass");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = NSClassFromString(v2);
      if (v4 && (objc_opt_respondsToSelector() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UIApplicationConfigurationLoader.m"), 116, CFSTR("If specified to be non-null, the factory class must conform to _UIApplicationInitializationContextFactory."));

      }
    }
    else
    {
      v4 = 0;
    }
    v7 = -[objc_class _newApplicationInitializationContext](v4, "_newApplicationInitializationContext");
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0DC5B60], "defaultContext");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v7;
  }
  else
  {
    v3 = (NSString *)objc_alloc_init(MEMORY[0x1E0DC5B78]);
    -[NSString applicationInitializationContextWithParameters:](v3, "applicationInitializationContextWithParameters:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSString invalidate](v3, "invalidate");
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v6;

}

void __74___UIApplicationConfigurationLoader__appInitializationContextFactoryClass__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("UIApplicationInitializationContextFactoryClass"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECD7E810;
  qword_1ECD7E810 = v1;

}

@end
