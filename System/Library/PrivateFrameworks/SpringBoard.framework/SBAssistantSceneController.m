@implementation SBAssistantSceneController

- (SBAssistantSceneController)initWithWindowScene:(id)a3
{
  id v4;
  SBAssistantSceneController *v5;
  SBAssistantSceneController *v6;
  uint64_t v7;
  NSHashTable *observers;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAssistantSceneController;
  v5 = -[SBAssistantSceneController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", v6);

  }
  return v6;
}

- (BOOL)isSystemAssistantExperienceAvailable
{
  void *v2;
  char v3;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemAssistantExperienceAvailable");

  return v3;
}

- (BOOL)isSystemAssistantExperienceEnabled
{
  void *v2;
  char v3;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemAssistantExperienceEnabled");

  return v3;
}

- (BOOL)isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled
{
  id WeakRetained;
  char v3;
  void *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v3 = objc_msgSend(WeakRetained, "isContinuityDisplayWindowScene");

  if ((v3 & 1) != 0)
    return 0;
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  return v6;
}

- (BOOL)isSystemAssistantExperiencePersistentSiriEnabled
{
  void *v2;
  char v3;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemAssistantExperiencePersistentSiriEnabled");

  return v3;
}

- (BOOL)isVisible
{
  void *v3;
  void *v4;
  char v5;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isVisibleInWindowScene:", v4);

  return v5;
}

- (SBAssistantSessionPresentationContext)presentationContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionForWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBAssistantSessionPresentationContext *)v6;
}

- (SBWindow)window
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionForWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindow *)v6;
}

- (SBAssistantRootViewController)assistantRootViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionForWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assistantRootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBAssistantRootViewController *)v6;
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v7;
    if (!v5)
    {
      -[SBAssistantSceneController observers](self, "observers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      v4 = v7;
    }
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SBAssistantSceneController observers](self, "observers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)dismissAssistantViewIfNecessary
{
  void *v3;
  id v4;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissAssistantViewIfNecessaryInWindowScene:", v3);

}

- (void)dismissAssistantViewIfNecessaryForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissAssistantViewIfNecessaryForGestureTranslation:velocity:windowScene:", v9, v7, v6, x, y);

}

- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3
{
  void *v5;
  id v6;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissAssistantViewIfNecessaryWithAnimation:windowScene:", a3, v5);

}

- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissAssistantViewIfNecessaryWithAnimation:windowScene:completion:", a3, v7, v6);

}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "assistantWillAppear:", self);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)assistantDidAppear:(id)a3 windowScene:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "assistantDidAppear:", self);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)assistantWillDisappear:(id)a3 windowScene:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "assistantWillDisappear:", self);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)assistantDidDisappear:(id)a3 windowScene:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "assistantDidDisappear:", self);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)assistantDidChangePresentation:(id)a3 windowScene:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBAssistantSceneController windowScene](self, "windowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "assistantDidChangePresentation:", self);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)assistantDidChangeSystemAssistantExperienceEnablement:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "assistantDidChangeSystemAssistantExperienceEnablement:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_windowScene);
}

@end
