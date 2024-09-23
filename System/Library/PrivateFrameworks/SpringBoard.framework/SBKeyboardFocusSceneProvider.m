@implementation SBKeyboardFocusSceneProvider

- (FBScene)spotlightScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneWithIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (FBScene *)v5;
}

- (id)sceneForIdentityToken:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusSceneProvider sceneForIdentityTokenStringRepresentation:](self, "sceneForIdentityTokenStringRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sceneForIdentityTokenStringRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneFromIdentityTokenStringRepresentation:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sceneFromIdentityTokenStringRepresentation:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)sceneForFocusTarget:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "sceneIdentityToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKeyboardFocusSceneProvider sceneForIdentityToken:](self, "sceneForIdentityToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isOverlayUIScene:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v3 = (void *)SBApp;
  v4 = a3;
  objc_msgSend(v3, "systemUIScenesCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlayUISceneController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jobLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "processHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "consistentJobLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqualToString:", v10);

  return v11;
}

- (BOOL)isSystemUISceneIdentityToken:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)SBApp;
  v4 = a3;
  objc_msgSend(v3, "systemUIScenesCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlayUISceneController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneFromIdentityToken:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (BOOL)anyConnectedSBWindowSceneContainsSceneIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectedWindowScenes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v21)
    {
      v6 = *(_QWORD *)v27;
      v20 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v8, "sceneManager", v20);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "externalApplicationSceneHandles");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v23 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "scene");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "identityToken");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = BSEqualObjects();

                if ((v17 & 1) != 0)
                {

                  v18 = 1;
                  goto LABEL_21;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v12)
                continue;
              break;
            }
          }

          v6 = v20;
        }
        v18 = 0;
        v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v21);
    }
    else
    {
      v18 = 0;
    }
LABEL_21:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
