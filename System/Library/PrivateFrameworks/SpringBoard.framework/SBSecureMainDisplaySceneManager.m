@implementation SBSecureMainDisplaySceneManager

- (BOOL)_shouldAutoHostScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "clientProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isApplicationProcess"))
  {
    objc_msgSend(v3, "clientProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCurrentProcess");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)_shouldTrackScenesForDeactivation
{
  return 1;
}

- (id)newSceneIdentityForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSecureMainDisplaySceneManager _sceneIdentifierForBundleIdentifier:](self, "_sceneIdentifierForBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSecureMainDisplaySceneManager sceneIdentityForApplication:uniqueIdentifier:](self, "sceneIdentityForApplication:uniqueIdentifier:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sceneIdentityForApplication:(id)a3
{
  return -[SBSecureMainDisplaySceneManager newSceneIdentityForApplication:](self, "newSceneIdentityForApplication:", a3);
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a3, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSecureMainDisplaySceneManager _sceneIdentifierForBundleIdentifier:](self, "_sceneIdentifierForBundleIdentifier:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4
{
  return -[SBSecureMainDisplaySceneManager newSceneIdentityForApplication:](self, "newSceneIdentityForApplication:", a3, a4);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "mutableCopy");
  -[NSMapTable objectForKey:](self->_blsActionHandlersForScenes, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "respondToActions:forFBScene:", v7, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "intersectSet:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  v14.receiver = self;
  v14.super_class = (Class)SBSecureMainDisplaySceneManager;
  -[SBSceneManager scene:didReceiveActions:](&v14, sel_scene_didReceiveActions_, v6, v7);

}

- (void)addActionHandler:(id)a3 forScene:(id)a4
{
  id v6;
  NSMapTable *blsActionHandlersForScenes;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  if (!blsActionHandlersForScenes)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_blsActionHandlersForScenes;
    self->_blsActionHandlersForScenes = v8;

    blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  }
  -[NSMapTable objectForKey:](blsActionHandlersForScenes, "objectForKey:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3690]);
    -[NSMapTable setObject:forKey:](self->_blsActionHandlersForScenes, "setObject:forKey:", v10, v6);
  }
  objc_msgSend(v10, "addObject:", v11);

}

- (void)removeActionHandler:(id)a3 forScene:(id)a4
{
  NSMapTable *blsActionHandlersForScenes;
  id v6;
  id v7;

  blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  v6 = a3;
  -[NSMapTable objectForKey:](blsActionHandlersForScenes, "objectForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);

}

- (id)_sceneIdentifierForBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR(" (Secure)"));
}

- (void)_noteDidChangeToVisibility:(unint64_t)a3 previouslyExisted:(BOOL)a4 forScene:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a5;
  -[SBSceneManager externalForegroundApplicationSceneHandles](self, "externalForegroundApplicationSceneHandles");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[SBBackgroundActivityAttributionManager sharedInstance](SBBackgroundActivityAttributionManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateForegroundApplicationSceneHandles:withOptions:completion:", v13, -1, 0);

  objc_msgSend(v7, "clientProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (objc_msgSend(v9, "isApplicationProcess"))
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applicationWithBundleIdentifier:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "setHasProminentlyIndicatedLocationUseWhileForeground:", 0);
      if (a3 == 1)
      {
        if (objc_msgSend(v10, "hasRegisteredBackgroundActivityWithIdentifier:", *MEMORY[0x1E0DB0AF0]))
          objc_msgSend((id)SBApp, "nowLocatingAppDidEnterForeground:", v10);
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blsActionHandlersForScenes, 0);
}

@end
