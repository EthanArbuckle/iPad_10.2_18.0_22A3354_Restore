@implementation UIApplicationSceneSessionSet

void ___UIApplicationSceneSessionSet_block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend((id)UIApp, "_discardedSceneSessionIdentifiersSinceLastRunWithContext:knownSessions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)UIApp, "_discardSceneSessionsWithPersistentIdentifiers:skippingPersistenceDeletion:", v1, 0);

}

void ___UIApplicationSceneSessionSet_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[_UICanvasUserActivityManager _knownSceneSessionMap](_UICanvasUserActivityManager, "_knownSceneSessionMap");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1EDDC8500;
  qword_1EDDC8500 = v1;

  +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationInitializationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "persistedSceneIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v0, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend((id)qword_1EDDC8500, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = ___UIApplicationSceneSessionSet_block_invoke_2;
  v14[3] = &unk_1E16B1B50;
  v15 = v4;
  v16 = v0;
  v12 = v0;
  v13 = v4;
  objc_msgSend(v11, "performBlock:", v14);

}

@end
