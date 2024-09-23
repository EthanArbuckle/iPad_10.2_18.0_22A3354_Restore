@implementation UIApplicationSceneClientSettingAppendCustomDescription

void __UIApplicationSceneClientSettingAppendCustomDescription_block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __UIApplicationSceneClientSettingAppendCustomDescription_block_invoke_2;
  v5[3] = &unk_1E16C80B8;
  v6 = WeakRetained;
  v4 = WeakRetained;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __UIApplicationSceneClientSettingAppendCustomDescription_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a2;
  +[_UIStatusBar stringForStatusBarStyle:](_UIStatusBar, "stringForStatusBarStyle:", objc_msgSend(v10, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v10, "stringValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", v9, v5, 1);
}

void __UIApplicationSceneClientSettingAppendCustomDescription_block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "description", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(WeakRetained, "appendObject:withName:", v8, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

@end
