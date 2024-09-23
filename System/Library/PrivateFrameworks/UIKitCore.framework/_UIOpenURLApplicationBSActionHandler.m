@implementation _UIOpenURLApplicationBSActionHandler

- (id)_respondToApplicationActions:(id)a3 fromTransitionContext:(id)a4
{
  id v5;
  id v6;
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
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = v5;
  objc_msgSend(v5, "objectsPassingTest:", &__block_literal_global_687);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "url");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)UIApp, "_shouldHandleTestURL:", v13))
        {
          objc_msgSend((id)UIApp, "handleTestURL:", v13);
        }
        else
        {
          objc_msgSend((id)UIApp, "_setHandlingURL:url:", objc_msgSend(v13, "isInternalUIKitURL") ^ 1, v13);
          objc_msgSend(v6, "originatingProcess");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            objc_msgSend(v12, "workspaceOriginatingProcess");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (objc_msgSend(v6, "isUISubclass"))
          {
            objc_msgSend(v6, "payload");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = 0;
          }
          objc_msgSend((id)UIApp, "_applicationOpenURLAction:payload:origin:", v12, v15, v14);
          objc_msgSend((id)UIApp, "_setHandlingURL:url:", 0, 0);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  v16 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v16, "minusSet:", v7);

  return v16;
}

@end
