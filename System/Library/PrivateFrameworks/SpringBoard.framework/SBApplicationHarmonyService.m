@implementation SBApplicationHarmonyService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_40 != -1)
    dispatch_once(&sharedInstance_onceToken_40, &__block_literal_global_271);
  return (id)sharedInstance___sharedInstance_21;
}

void __45__SBApplicationHarmonyService_sharedInstance__block_invoke()
{
  SBApplicationHarmonyService *v0;
  void *v1;

  v0 = objc_alloc_init(SBApplicationHarmonyService);
  v1 = (void *)sharedInstance___sharedInstance_21;
  sharedInstance___sharedInstance_21 = (uint64_t)v0;

}

- (SBApplicationHarmonyService)init
{
  SBApplicationHarmonyService *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBApplicationHarmonyService;
  v2 = -[SBApplicationHarmonyService init](&v5, sel_init);
  if (v2)
  {
    +[SBApplicationServer sharedInstance](SBApplicationServer, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHarmonyDelegate:", v2);

  }
  return v2;
}

- (void)applicationServer:(id)a3 client:(id)a4 fetchWhitePointAdaptivityStyleForDisplayId:(unsigned int)a5 withCompletion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = a6;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D22990], "sharedUIAppClientAuthenticator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "authenticateClient:", v9);

    if (v12)
    {
      v13 = v10;
      BSDispatchMain();

    }
    else
    {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, -1);
    }
  }

}

uint64_t __114__SBApplicationHarmonyService_applicationServer_client_fetchWhitePointAdaptivityStyleForDisplayId_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x1E0CD2728], "displays", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "displayId") == *(_DWORD *)(a1 + 40))
        {
          objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v9 == v8;

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);

    if (v5)
    {
      +[SBHarmonyController sharedInstance](SBHarmonyController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "whitePointAdaptivityStyle");

    }
  }
  else
  {

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
