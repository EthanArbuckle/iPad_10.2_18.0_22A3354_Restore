@implementation SBWindowSceneManager

- (id)_embeddedDisplayWindowScene
{
  return (id)-[NSMutableSet bs_firstObjectPassingTest:](self->_mutableConnectedWindowScenes, "bs_firstObjectPassingTest:", &__block_literal_global_75);
}

- (id)windowSceneForDisplayIdentity:(id)a3
{
  id v4;
  NSMutableSet *mutableConnectedWindowScenes;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "expectsSecureRendering") || !objc_msgSend(v4, "sb_displayWindowingMode"))
  {
    -[SBWindowSceneManager _embeddedDisplayWindowScene](self, "_embeddedDisplayWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    mutableConnectedWindowScenes = self->_mutableConnectedWindowScenes;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__SBWindowSceneManager_windowSceneForDisplayIdentity___block_invoke;
    v8[3] = &unk_1E8EA6F48;
    v9 = v4;
    -[NSMutableSet bs_firstObjectPassingTest:](mutableConnectedWindowScenes, "bs_firstObjectPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (SBWindowScene)activeDisplayWindowScene
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[SBExternalDisplaySettingsDomain rootSettings](SBExternalDisplaySettingsDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activeDisplayTrackingMethodology");

  if (v4 == 1)
  {
    -[SBWindowSceneManager activeDisplayWindowSceneFollowingUserInteraction](self, "activeDisplayWindowSceneFollowingUserInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v4)
  {
    -[SBWindowSceneManager activeDisplayWindowSceneFollowingKeyboard](self, "activeDisplayWindowSceneFollowingKeyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (SBWindowScene *)v5;
}

- (SBWindowScene)activeDisplayWindowSceneFollowingUserInteraction
{
  void *v3;
  void *v4;

  -[SBMultiDisplayUserInteractionCoordinator activeWindowScene](self->_userInteractionCoordinator, "activeWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWindowSceneManager _validateSuggestedActiveWindowScene:usingMethodology:](self, "_validateSuggestedActiveWindowScene:usingMethodology:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowScene *)v4;
}

- (id)_validateSuggestedActiveWindowScene:(id)a3 usingMethodology:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  id v11;
  void *v12;
  _BYTE v14[24];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "isInvalidating"))
  {
    SBLogActiveDisplay();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      SBStringForActiveDisplayTrackingMethodology(a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_fbsDisplayIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v14 = 138543874;
      *(_QWORD *)&v14[4] = v8;
      *(_WORD *)&v14[12] = 2048;
      *(_QWORD *)&v14[14] = v6;
      *(_WORD *)&v14[22] = 2114;
      v15 = v9;
      v10 = "[%{public}@] focus scene <%p> on display %{public}@ is in the process of invalidating, falling back to repor"
            "ting the embedded scene as the active scene";
LABEL_7:
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, v10, v14, 0x20u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isInvalidated"))
  {
    SBLogKeyboardFocus();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      SBStringForActiveDisplayTrackingMethodology(a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_fbsDisplayIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v14 = 138543874;
      *(_QWORD *)&v14[4] = v8;
      *(_WORD *)&v14[12] = 2048;
      *(_QWORD *)&v14[14] = v6;
      *(_WORD *)&v14[22] = 2114;
      v15 = v9;
      v10 = "[%{public}@] focus scene <%p> on display %{public}@ is invalidated!?!?!?!?, falling back to reporting the em"
            "bedded scene as the active scene";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v6)
  {
    v11 = v6;
    goto LABEL_10;
  }
LABEL_9:
  -[SBWindowSceneManager _embeddedDisplayWindowScene](self, "_embeddedDisplayWindowScene", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v12 = v11;

  return v12;
}

uint64_t __54__SBWindowSceneManager_windowSceneForSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fbsDisplayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sceneManagerForDisplayIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "existingSceneHandleForSceneIdentity:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "sceneIfExists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sb_displayIdentityForSceneManagers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __51__SBWindowSceneManager__embeddedDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isMainDisplayWindowScene"))
    v3 = objc_msgSend(v2, "isExternalDisplayWindowScene") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (id)windowSceneForSceneHandle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWindowSceneManager windowSceneForDisplayIdentity:](self, "windowSceneForDisplayIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __54__SBWindowSceneManager_windowSceneForDisplayIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "_fbsDisplayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualObjects();

  return v3;
}

- (NSSet)connectedWindowScenes
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableConnectedWindowScenes, "copy");
}

- (id)windowSceneForSceneIdentifier:(id)a3
{
  void *v4;
  NSMutableSet *mutableConnectedWindowScenes;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  mutableConnectedWindowScenes = self->_mutableConnectedWindowScenes;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SBWindowSceneManager_windowSceneForSceneIdentifier___block_invoke;
  v9[3] = &unk_1E8EA6F48;
  v10 = v4;
  v6 = v4;
  -[NSMutableSet bs_firstObjectPassingTest:](mutableConnectedWindowScenes, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SBWindowSceneManager)initWithUserInteractionCoordinator:(id)a3
{
  id v5;
  SBWindowSceneManager *v6;
  NSMutableSet *v7;
  NSMutableSet *mutableConnectedWindowScenes;
  _SBActiveDisplayKeyboardFocusTracker *v9;
  _SBActiveDisplayKeyboardFocusTracker *keyboardFocusTracker;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBWindowSceneManager;
  v6 = -[SBWindowSceneManager init](&v12, sel_init);
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutableConnectedWindowScenes = v6->_mutableConnectedWindowScenes;
    v6->_mutableConnectedWindowScenes = v7;

    v9 = objc_alloc_init(_SBActiveDisplayKeyboardFocusTracker);
    keyboardFocusTracker = v6->_keyboardFocusTracker;
    v6->_keyboardFocusTracker = v9;

    objc_storeStrong((id *)&v6->_userInteractionCoordinator, a3);
  }

  return v6;
}

- (SBWindowScene)activeDisplayWindowSceneFollowingKeyboard
{
  void *v3;
  void *v4;

  -[_SBActiveDisplayKeyboardFocusTracker activeWindowScene](self->_keyboardFocusTracker, "activeWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWindowSceneManager _validateSuggestedActiveWindowScene:usingMethodology:](self, "_validateSuggestedActiveWindowScene:usingMethodology:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowScene *)v4;
}

- (id)windowSceneForPersistentIdentifier:(id)a3
{
  id v4;
  NSMutableSet *mutableConnectedWindowScenes;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  mutableConnectedWindowScenes = self->_mutableConnectedWindowScenes;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SBWindowSceneManager_windowSceneForPersistentIdentifier___block_invoke;
  v9[3] = &unk_1E8EA6F48;
  v10 = v4;
  v6 = v4;
  -[NSMutableSet bs_firstObjectPassingTest:](mutableConnectedWindowScenes, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __59__SBWindowSceneManager_windowSceneForPersistentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fbsDisplayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sceneManagerForDisplayIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "existingSceneHandleForPersistenceIdentifier:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "sceneIfExists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sb_displayIdentityForSceneManagers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_sceneWillConnect:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = objc_opt_class();
  v8 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
    -[NSMutableSet addObject:](self->_mutableConnectedWindowScenes, "addObject:", v7);

}

- (void)_sceneDidDisconnect:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = objc_opt_class();
  v8 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
    -[NSMutableSet removeObject:](self->_mutableConnectedWindowScenes, "removeObject:", v7);

}

- (NSMutableSet)mutableConnectedWindowScenes
{
  return self->_mutableConnectedWindowScenes;
}

- (_SBActiveDisplayKeyboardFocusTracker)keyboardFocusTracker
{
  return self->_keyboardFocusTracker;
}

- (void)setKeyboardFocusTracker:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardFocusTracker, a3);
}

- (SBMultiDisplayUserInteractionCoordinator)userInteractionCoordinator
{
  return self->_userInteractionCoordinator;
}

- (void)setUserInteractionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_userInteractionCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInteractionCoordinator, 0);
  objc_storeStrong((id *)&self->_keyboardFocusTracker, 0);
  objc_storeStrong((id *)&self->_mutableConnectedWindowScenes, 0);
}

@end
