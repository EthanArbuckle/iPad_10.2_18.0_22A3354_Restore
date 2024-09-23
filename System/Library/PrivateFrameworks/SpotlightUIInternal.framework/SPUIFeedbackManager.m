@implementation SPUIFeedbackManager

+ (id)feedbackListener
{
  return (id)objc_msgSend(MEMORY[0x24BE84968], "sharedManager");
}

+ (void)didAppearFromSource:(unint64_t)a3 withQueryId:(unint64_t)a4 queryString:(id)a5 deviceIsAuthenticated:(BOOL)a6
{
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  BOOL v18;

  v10 = a5;
  if (didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__onceToken != -1)
    dispatch_once(&didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__onceToken, &__block_literal_global);
  v11 = didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke_4;
  block[3] = &unk_24F9D5D70;
  v14 = v10;
  v15 = a3;
  v18 = a6;
  v16 = a4;
  v17 = a1;
  v12 = v10;
  dispatch_async(v11, block);

}

void __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.spotlightui.presentationFeedback", 0);
  v1 = (void *)didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__queue;
  didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__queue = (uint64_t)v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BE38438]), "initWithDisplayType:handler:", 0, &__block_literal_global_62);
  v3 = (void *)didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__displayMonitor;
  didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__displayMonitor = v2;

}

void __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  v3 = didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke_3;
  block[3] = &unk_24F9D5CC8;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

void __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__isCurrentlyOverApp = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "elements", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v6, "bundleIdentifier");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          objc_msgSend(v6, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.Spotlight"));

          if ((v10 & 1) == 0)
            didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__isCurrentlyOverApp = 1;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

void __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke_4(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40) - 1;
  if (v2 > 7)
    v3 = 0;
  else
    v3 = qword_22E0A2908[v2];
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE84FA0]), "initWithEvent:", v3);
  objc_msgSend(v5, "setQueryId:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setPreexistingInput:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v5, "setIsOverApp:", didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__isCurrentlyOverApp);
  else
    objc_msgSend(v5, "setIsOnLockScreen:", 1);
  objc_msgSend(*(id *)(a1 + 56), "feedbackListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchViewDidAppear:", v5);

}

+ (void)didClearInputWithEvent:(unint64_t)a3 withQueryId:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE84DB0]), "initWithEvent:", a3);
  objc_msgSend(v7, "setQueryId:", a4);
  objc_msgSend(a1, "feedbackListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didClearInput:", v7);

}

+ (void)cardViewDidDisappearWithEvent:(unint64_t)a3 withQueryId:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE84DA8]), "initWithEvent:", a3);
  objc_msgSend(v7, "setQueryId:", a4);
  objc_msgSend(a1, "feedbackListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cardViewDidDisappear:", v7);

}

+ (void)didDisappearWithReason:(unint64_t)a3 withQueryId:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  if (a3 - 1 > 7)
    v6 = 0;
  else
    v6 = qword_22E0A2948[a3 - 1];
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE84FA8]), "initWithEvent:", v6);
  objc_msgSend(v8, "setQueryId:", a4);
  objc_msgSend(a1, "feedbackListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchViewDidDisappear:", v8);

}

+ (void)flushFeedbackWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;

  v3 = a3;
  v4 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BE84968], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parsecFeedbackListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    dispatch_group_enter(v4);
    objc_msgSend(v6, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __51__SPUIFeedbackManager_flushFeedbackWithCompletion___block_invoke;
    v14[3] = &unk_24F9D5CC8;
    v15 = v4;
    objc_msgSend(v9, "scheduleSendBarrierBlock:", v14);

  }
  dispatch_group_enter(v4);
  v10 = (void *)MEMORY[0x24BE84968];
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __51__SPUIFeedbackManager_flushFeedbackWithCompletion___block_invoke_2;
  v12[3] = &unk_24F9D5CC8;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "flushFeedbackWithCompletion:", v12);
  dispatch_group_notify(v11, MEMORY[0x24BDAC9B8], v3);

}

void __51__SPUIFeedbackManager_flushFeedbackWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__SPUIFeedbackManager_flushFeedbackWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
