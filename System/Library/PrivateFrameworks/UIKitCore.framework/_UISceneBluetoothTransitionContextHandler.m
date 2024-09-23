@implementation _UISceneBluetoothTransitionContextHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  return a3;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _UISceneConnectionOptionsContext *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_opt_new();
  if (objc_msgSend(a6, "isUISubclass"))
  {
    objc_msgSend(a6, "payload");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v23 = a3;
      v29[0] = CFSTR("UIApplicationLaunchOptionsBluetoothCentralsKey");
      v29[1] = CFSTR("UIApplicationLaunchOptionsBluetoothPeripheralsKey");
      v30[0] = CFSTR("_UISceneConnectionOptionsBluetoothCentralsKey");
      v30[1] = CFSTR("_UISceneConnectionOptionsBluetoothPeripheralsKey");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v10, "objectForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKey:", v19, v18);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v13);
      }

      a3 = v23;
    }
  }
  v20 = objc_alloc_init(_UISceneConnectionOptionsContext);
  v21 = (void *)objc_msgSend(v8, "copy");
  -[_UISceneConnectionOptionsContext setLaunchOptionsDictionary:](v20, "setLaunchOptionsDictionary:", v21);

  -[_UISceneConnectionOptionsContext setUnprocessedActions:](v20, "setUnprocessedActions:", a3);
  return v20;
}

@end
