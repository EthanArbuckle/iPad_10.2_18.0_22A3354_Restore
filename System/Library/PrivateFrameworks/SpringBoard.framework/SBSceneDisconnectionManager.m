@implementation SBSceneDisconnectionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_285);
  return (id)sharedManager__sharedManager;
}

void __44__SBSceneDisconnectionManager_sharedManager__block_invoke()
{
  SBSceneDisconnectionManager *v0;
  void *v1;

  v0 = objc_alloc_init(SBSceneDisconnectionManager);
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = (uint64_t)v0;

}

- (SBSceneDisconnectionManager)init
{
  SBSceneDisconnectionManager *v2;
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSceneDisconnectionManager;
  v2 = -[SBSceneDisconnectionManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "physicalMemory");

    v2->_numberOfRecentScenesExcludedFromDisconnection = vcvtps_u32_f32((float)(uint64_t)((double)v4 / 1000000000.0) * 2.5);
  }
  return v2;
}

- (void)_beginSceneCleanupWithBackgroundedSceneEntities:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t numberOfRecentScenesExcludedFromDisconnection;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD block[5];
  id v30;
  _QWORD v31[4];
  id v32;
  SBSceneDisconnectionManager *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[8];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_isExecuting)
  {
    self->_isExecuting = 1;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      +[SBMainSwitcherControllerCoordinator sharedInstanceIfExists](SBMainSwitcherControllerCoordinator, "sharedInstanceIfExists");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "recentAppLayouts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");
        numberOfRecentScenesExcludedFromDisconnection = self->_numberOfRecentScenesExcludedFromDisconnection;

        if (v10 <= numberOfRecentScenesExcludedFromDisconnection)
        {
          self->_isExecuting = 0;
        }
        else
        {
          objc_msgSend(v4, "bs_map:", &__block_literal_global_3_3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v25 = v12;
            v26 = v4;
            objc_msgSend(v12, "runningApplications");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "bs_filter:", &__block_literal_global_6_7);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v15 = v14;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v36;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v36 != v18)
                    objc_enumerationMutation(v15);
                  -[SBSceneDisconnectionManager liveScenesForApplication:](self, "liveScenesForApplication:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((unint64_t)objc_msgSend(v20, "count") >= 2)
                  {
                    v31[0] = MEMORY[0x1E0C809B0];
                    v31[1] = 3221225472;
                    v31[2] = __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_3;
                    v31[3] = &unk_1E8EB81E0;
                    v32 = v28;
                    v33 = self;
                    v21 = v8;
                    v34 = v8;
                    objc_msgSend(v20, "bs_filter:", v31);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v22, "count"))
                      objc_msgSend(v27, "unionSet:", v22);

                    v8 = v21;
                  }

                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
              }
              while (v17);
            }

            v4 = v26;
            if (objc_msgSend(v27, "count"))
            {
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_4;
              block[3] = &unk_1E8E9E820;
              block[4] = self;
              v30 = v27;
              dispatch_async(MEMORY[0x1E0C80D38], block);

            }
            else
            {
              SBLogWorkspace();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_INFO, "No scenes eligible for disconnection.", buf, 2u);
              }

              self->_isExecuting = 0;
            }

            v12 = v25;
          }
          else
          {
            self->_isExecuting = 0;
          }

        }
      }
      else
      {
        self->_isExecuting = 0;
        SBLogWorkspace();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_INFO, "Stopping scene disconnection – no main switcher instance found.", buf, 2u);
        }

      }
    }
    else
    {
      self->_isExecuting = 0;
    }
  }

}

uint64_t __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneHandle");
}

uint64_t __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsMultiwindow");

  return v3;
}

uint64_t __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 40), "shouldDisconnectScene:inSwitcher:", v3, *(_QWORD *)(a1 + 48));

  return v4;
}

uint64_t __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_5;
  v4[3] = &unk_1E8EA2B20;
  v4[4] = v2;
  return objc_msgSend(v2, "disconnectScenes:completion:", v1, v4);
}

void __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  SBLogWorkspace();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_5_cold_1((uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Completed scene disconnections.", v7, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
}

- (BOOL)shouldDisconnectScene:(id)a3 inSwitcher:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  unint64_t v10;
  BOOL v11;

  v6 = a4;
  objc_msgSend(a3, "sceneIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isValid")
     && (objc_msgSend(v7, "settings"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         v9 = objc_msgSend(v8, "isForeground"),
         v8,
         (v9 & 1) == 0)
     && (v10 = -[SBSceneDisconnectionManager positionOf:inSwitcher:](self, "positionOf:inSwitcher:", v7, v6),
         v10 != 0x7FFFFFFFFFFFFFFFLL)
     && v10 >= self->_numberOfRecentScenesExcludedFromDisconnection;

  return v11;
}

- (void)disconnectScenes:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  SBApplicationSceneEntityDestructionMakeIntent(1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SBSceneDisconnectionManager_disconnectScenes_completion___block_invoke;
  v9[3] = &unk_1E8EAE788;
  v10 = v5;
  v8 = v5;
  SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v6, v7, v9);

}

void __59__SBSceneDisconnectionManager_disconnectScenes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = v4;
    (*(void (**)(void))(v5 + 16))();
    v4 = v6;
  }

}

- (id)sceneManager
{
  return +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
}

- (id)liveScenesForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[SBSceneDisconnectionManager sceneManager](self, "sceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "externalApplicationSceneHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__SBSceneDisconnectionManager_liveScenesForApplication___block_invoke;
  v10[3] = &unk_1E8EB8208;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "bs_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __56__SBSceneDisconnectionManager_liveScenesForApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSameExecutableAsApplication:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isValid");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)positionOf:(id)a3 inSwitcher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t numberOfRecentScenesExcludedFromDisconnection;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "recentAppLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  numberOfRecentScenesExcludedFromDisconnection = self->_numberOfRecentScenesExcludedFromDisconnection;
  if (v9 >= numberOfRecentScenesExcludedFromDisconnection)
    v11 = self->_numberOfRecentScenesExcludedFromDisconnection;
  else
    v11 = v9;
  if (v11)
  {
    v12 = 0;
    while (1)
    {
      objc_msgSend(v7, "recentAppLayouts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "containsItemWithUniqueIdentifier:", v15);

      if ((v16 & 1) != 0)
        break;
      if (v11 == ++v12)
      {
        numberOfRecentScenesExcludedFromDisconnection = self->_numberOfRecentScenesExcludedFromDisconnection;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = numberOfRecentScenesExcludedFromDisconnection + 1;
  }

  return v12;
}

- (unint64_t)numberOfRecentScenesExcludedFromDisconnection
{
  return self->_numberOfRecentScenesExcludedFromDisconnection;
}

- (void)setNumberOfRecentScenesExcludedFromDisconnection:(unint64_t)a3
{
  self->_numberOfRecentScenesExcludedFromDisconnection = a3;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

void __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Error while disconnecting scenes: %@", (uint8_t *)&v2, 0xCu);
}

@end
