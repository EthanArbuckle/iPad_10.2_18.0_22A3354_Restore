@implementation SBHomeAffordanceInteractionManager

- (SBHomeAffordanceInteractionManager)initWithWindowScene:(id)a3
{
  id v4;
  SBHomeAffordanceInteractionManager *v5;
  SBHomeAffordanceInteractionManager *v6;
  uint64_t v7;
  UITapGestureRecognizer *bounceTapRecognizer;
  uint64_t v9;
  UITapGestureRecognizer *revealTapRecognizer;
  UITapGestureRecognizer *v11;
  UITapGestureRecognizer *revealDoubleTapRecognizer;
  uint64_t v13;
  UIScreenEdgePanGestureRecognizer *revealEdgePanRecognizer;
  uint64_t v15;
  NSHashTable *registeredHomeAffordanceInteractions;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBHomeAffordanceInteractionManager;
  v5 = -[SBHomeAffordanceInteractionManager init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v6, sel__bounceTapRecognized_);
    bounceTapRecognizer = v6->_bounceTapRecognizer;
    v6->_bounceTapRecognizer = (UITapGestureRecognizer *)v7;

    -[UITapGestureRecognizer setName:](v6->_bounceTapRecognizer, "setName:", CFSTR("homeGrabber.bounce.tap"));
    -[UITapGestureRecognizer setCancelsTouchesInView:](v6->_bounceTapRecognizer, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer setDelaysTouchesBegan:](v6->_bounceTapRecognizer, "setDelaysTouchesBegan:", 0);
    -[UITapGestureRecognizer setDelaysTouchesEnded:](v6->_bounceTapRecognizer, "setDelaysTouchesEnded:", 0);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v6->_bounceTapRecognizer, "setAllowedTouchTypes:", &unk_1E91CE968);
    -[UITapGestureRecognizer setDelegate:](v6->_bounceTapRecognizer, "setDelegate:", v6);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v6, sel__revealTapRecognized_);
    revealTapRecognizer = v6->_revealTapRecognizer;
    v6->_revealTapRecognizer = (UITapGestureRecognizer *)v9;

    -[UITapGestureRecognizer setName:](v6->_revealTapRecognizer, "setName:", CFSTR("homeGrabber.reveal.tap"));
    -[UITapGestureRecognizer setCancelsTouchesInView:](v6->_revealTapRecognizer, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer setDelaysTouchesBegan:](v6->_revealTapRecognizer, "setDelaysTouchesBegan:", 0);
    -[UITapGestureRecognizer setDelaysTouchesEnded:](v6->_revealTapRecognizer, "setDelaysTouchesEnded:", 0);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v6->_revealTapRecognizer, "setAllowedTouchTypes:", &unk_1E91CE980);
    -[UITapGestureRecognizer setDelegate:](v6->_revealTapRecognizer, "setDelegate:", v6);
    v11 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEAA88]);
    revealDoubleTapRecognizer = v6->_revealDoubleTapRecognizer;
    v6->_revealDoubleTapRecognizer = v11;

    -[UITapGestureRecognizer setName:](v6->_revealDoubleTapRecognizer, "setName:", CFSTR("homeGrabber.reveal.doubleTap"));
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v6->_revealDoubleTapRecognizer, "setNumberOfTapsRequired:", 2);
    -[UITapGestureRecognizer setCancelsTouchesInView:](v6->_revealDoubleTapRecognizer, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer setDelaysTouchesBegan:](v6->_revealDoubleTapRecognizer, "setDelaysTouchesBegan:", 0);
    -[UITapGestureRecognizer setDelaysTouchesEnded:](v6->_revealDoubleTapRecognizer, "setDelaysTouchesEnded:", 0);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v6->_revealDoubleTapRecognizer, "setAllowedTouchTypes:", &unk_1E91CE998);
    -[UITapGestureRecognizer setDelegate:](v6->_revealDoubleTapRecognizer, "setDelegate:", v6);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v6->_revealTapRecognizer, "requireGestureRecognizerToFail:", v6->_revealDoubleTapRecognizer);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA958]), "initWithTarget:action:type:options:", v6, sel__edgePanChanged_, 3, 0);
    revealEdgePanRecognizer = v6->_revealEdgePanRecognizer;
    v6->_revealEdgePanRecognizer = (UIScreenEdgePanGestureRecognizer *)v13;

    -[UIScreenEdgePanGestureRecognizer setName:](v6->_revealEdgePanRecognizer, "setName:", CFSTR("homeGrabber.edgePan"));
    -[UIScreenEdgePanGestureRecognizer setCancelsTouchesInView:](v6->_revealEdgePanRecognizer, "setCancelsTouchesInView:", 0);
    -[UIScreenEdgePanGestureRecognizer setDelaysTouchesBegan:](v6->_revealEdgePanRecognizer, "setDelaysTouchesBegan:", 0);
    -[UIScreenEdgePanGestureRecognizer setDelaysTouchesEnded:](v6->_revealEdgePanRecognizer, "setDelaysTouchesEnded:", 0);
    -[UIScreenEdgePanGestureRecognizer setEdges:](v6->_revealEdgePanRecognizer, "setEdges:", 15);
    -[UIScreenEdgePanGestureRecognizer setAllowedTouchTypes:](v6->_revealEdgePanRecognizer, "setAllowedTouchTypes:", &unk_1E91CE9B0);
    -[UIScreenEdgePanGestureRecognizer setDelegate:](v6->_revealEdgePanRecognizer, "setDelegate:", v6);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v15 = objc_claimAutoreleasedReturnValue();
    registeredHomeAffordanceInteractions = v6->_registeredHomeAffordanceInteractions;
    v6->_registeredHomeAffordanceInteractions = (NSHashTable *)v15;

    -[SBHomeAffordanceInteractionManager _updateBounceTapGestureRecognizers](v6, "_updateBounceTapGestureRecognizers");
  }

  return v6;
}

- (void)registerHomeAffordanceInteraction:(id)a3
{
  UITapGestureRecognizer *bounceDoubleTapRecognizer;
  UITapGestureRecognizer *bounceDoubleTapFailureRecognizer;
  id v6;

  -[NSHashTable addObject:](self->_registeredHomeAffordanceInteractions, "addObject:", a3);
  if (!self->_gesturesEnabled && -[NSHashTable count](self->_registeredHomeAffordanceInteractions, "count"))
  {
    self->_gesturesEnabled = 1;
    -[SBHomeAffordanceInteractionManager _systemGestureManager](self, "_systemGestureManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:withType:", self->_bounceTapRecognizer, 96);
    objc_msgSend(v6, "addGestureRecognizer:withType:", self->_revealTapRecognizer, 99);
    objc_msgSend(v6, "addGestureRecognizer:withType:", self->_revealDoubleTapRecognizer, 100);
    objc_msgSend(v6, "addGestureRecognizer:withType:", self->_revealEdgePanRecognizer, 101);
    bounceDoubleTapRecognizer = self->_bounceDoubleTapRecognizer;
    if (bounceDoubleTapRecognizer)
      objc_msgSend(v6, "addGestureRecognizer:withType:", bounceDoubleTapRecognizer, 97);
    bounceDoubleTapFailureRecognizer = self->_bounceDoubleTapFailureRecognizer;
    if (bounceDoubleTapFailureRecognizer)
      objc_msgSend(v6, "addGestureRecognizer:withType:", bounceDoubleTapFailureRecognizer, 98);
    objc_msgSend(v6, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 119, self->_revealEdgePanRecognizer);
    objc_msgSend(v6, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 120, self->_revealEdgePanRecognizer);
    objc_msgSend(v6, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 104, self->_revealEdgePanRecognizer);
    objc_msgSend(v6, "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 105, self->_revealEdgePanRecognizer);

  }
}

- (void)unregisterHomeAffordanceInteraction:(id)a3
{
  id v4;

  -[NSHashTable removeObject:](self->_registeredHomeAffordanceInteractions, "removeObject:", a3);
  if (self->_gesturesEnabled && !-[NSHashTable count](self->_registeredHomeAffordanceInteractions, "count"))
  {
    self->_gesturesEnabled = 0;
    -[SBHomeAffordanceInteractionManager _systemGestureManager](self, "_systemGestureManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", self->_bounceTapRecognizer);
    objc_msgSend(v4, "removeGestureRecognizer:", self->_revealTapRecognizer);
    objc_msgSend(v4, "removeGestureRecognizer:", self->_revealDoubleTapRecognizer);
    objc_msgSend(v4, "removeGestureRecognizer:", self->_revealEdgePanRecognizer);
    if (self->_bounceDoubleTapRecognizer)
      objc_msgSend(v4, "removeGestureRecognizer:");
    if (self->_bounceDoubleTapFailureRecognizer)
      objc_msgSend(v4, "removeGestureRecognizer:");

  }
}

- (id)acquireDisableHomeAffordanceDoubleTapGestureAssertionWithReason:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithArray:", &unk_1E91CE9C8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeAffordanceInteractionManager _systemGestureManager](self, "_systemGestureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acquireSystemGestureDisableAssertionForReason:forSystemGestureTypes:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateHomeAffordanceHitTestRectForHomeAffordanceInteraction:(id)a3
{
  _BOOL8 v4;
  id v5;

  v4 = self->_currentHomeAffordanceInteraction == a3;
  v5 = a3;
  -[SBHomeAffordanceInteractionManager _homeAffordanceHitTestRectOfSize:forHomeAffordanceInteraction:](self, "_homeAffordanceHitTestRectOfSize:forHomeAffordanceInteraction:", v4, v5);
  objc_msgSend(v5, "setHomeAffordanceHitTestRect:");

}

- (id)newHomeAffordanceInteraction
{
  return -[SBHomeAffordanceInteraction initWithHomeAffordanceInteractionManager:]([SBHomeAffordanceInteraction alloc], "initWithHomeAffordanceInteractionManager:", self);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeAffordanceInteractionManager gestureRecognizer:shouldReceiveTouch:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SBHomeAffordanceInteractionManager.m"), 184, CFSTR("this call must be made on the main thread"));

  }
  if (self->_bounceTapRecognizer == v6)
  {
    -[SBHomeAffordanceInteractionManager _firstHomeAffordanceInteractionForGestureRecognizer:touch:](self, "_firstHomeAffordanceInteractionForGestureRecognizer:touch:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = v9 != 0;

  }
  else if (self->_bounceDoubleTapRecognizer == v6 || self->_bounceDoubleTapFailureRecognizer == v6)
  {
    if ((objc_msgSend(v7, "_isPointerTouch") & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      -[SBHomeAffordanceInteractionManager _firstHomeAffordanceInteractionForGestureRecognizer:touch:](self, "_firstHomeAffordanceInteractionForGestureRecognizer:touch:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10 != 0;

    }
    -[SBHomeAffordanceInteractionManager _logShouldReceiveTouchIfNeeded:forGestureRecognizer:touch:](self, "_logShouldReceiveTouchIfNeeded:forGestureRecognizer:touch:", v8, v6, v7);
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)_assistantController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_systemGestureManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "systemGestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_bounceTapRecognized:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeAffordanceInteractionManager _bounceTapRecognized:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBHomeAffordanceInteractionManager.m"), 208, CFSTR("this call must be made on the main thread"));

  }
  SBLogHomeAffordance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBHomeAffordanceInteractionManager _bounceTapRecognized:].cold.1(v4);

  v6 = objc_msgSend(v4, "sbf_hasPointerTouch");
  -[SBHomeAffordanceInteractionManager _systemGestureManager](self, "_systemGestureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "areSystemGesturesDisabledForAccessibility");

  -[SBHomeAffordanceInteractionManager _firstHomeAffordanceInteractionForGestureRecognizer:](self, "_firstHomeAffordanceInteractionForGestureRecognizer:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (v8 & 1) != 0)
    -[SBHomeAffordanceInteractionManager _didRecognizeTapWithHomeAffordanceInteraction:](self, "_didRecognizeTapWithHomeAffordanceInteraction:", v9);
  else
    -[SBHomeAffordanceInteractionManager _didRecognizeClickWithHomeAffordanceInteraction:](self, "_didRecognizeClickWithHomeAffordanceInteraction:", v9);

}

- (void)_bounceDoubleTapRecognized:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeAffordanceInteractionManager _bounceDoubleTapRecognized:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBHomeAffordanceInteractionManager.m"), 225, CFSTR("this call must be made on the main thread"));

  }
  SBLogHomeAffordance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBHomeAffordanceInteractionManager _bounceDoubleTapRecognized:].cold.1(v4);

  -[SBHomeAffordanceInteractionManager _firstHomeAffordanceInteractionForGestureRecognizer:](self, "_firstHomeAffordanceInteractionForGestureRecognizer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeAffordanceInteractionManager _didRecognizeDoubleTapWithHomeAffordanceInteraction:](self, "_didRecognizeDoubleTapWithHomeAffordanceInteraction:", v6);

}

- (void)_bounceDoubleTapFailureRecognized:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeAffordanceInteractionManager _bounceDoubleTapFailureRecognized:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBHomeAffordanceInteractionManager.m"), 234, CFSTR("this call must be made on the main thread"));

  }
  SBLogHomeAffordance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBHomeAffordanceInteractionManager _bounceDoubleTapFailureRecognized:].cold.1(v4);

  -[SBHomeAffordanceInteractionManager _firstHomeAffordanceInteractionForGestureRecognizer:](self, "_firstHomeAffordanceInteractionForGestureRecognizer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeAffordanceInteractionManager _didFailToRecognizeDoubleTapWithHomeAffordanceInteraction:](self, "_didFailToRecognizeDoubleTapWithHomeAffordanceInteraction:", v6);

}

- (void)_revealTapRecognized:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeAffordanceInteractionManager _revealTapRecognized:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("SBHomeAffordanceInteractionManager.m"), 243, CFSTR("this call must be made on the main thread"));

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_registeredHomeAffordanceInteractions, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_class();
        v11 = v9;
        if (v10)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v13 = v12;

        objc_msgSend(v13, "_noteActiveForTouchThatShouldUnhideImmediately:", objc_msgSend(v11, "isHidden"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)_edgePanChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeAffordanceInteractionManager _edgePanChanged:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SBHomeAffordanceInteractionManager.m"), 252, CFSTR("this call must be made on the main thread"));

  }
  if (objc_msgSend(v4, "state") == 1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = (void *)-[NSHashTable copy](self->_registeredHomeAffordanceInteractions, "copy", 0);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_opt_class();
          v12 = v10;
          if (v11)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v13 = v12;
            else
              v13 = 0;
          }
          else
          {
            v13 = 0;
          }
          v14 = v13;

          objc_msgSend(v14, "_noteActiveForTouchThatShouldUnhideImmediately:", 0);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

  }
}

- (CGRect)_homeAffordanceHitTestRectOfSize:(int64_t)a3 forHomeAffordanceInteraction:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v5 = a4;
  objc_msgSend(v5, "homeAffordanceFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (a3 == 1)
  {
    objc_msgSend(v5, "expandedHomeAffordanceHitTestRectOutsets");
  }
  else
  {
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    if (!a3)
      objc_msgSend(v5, "standardHomeAffordanceHitTestRectOutsets", 0.0, 0.0, 0.0, 0.0);
  }
  v18 = v7 + v16;
  v19 = v9 + v17;
  v20 = v11 - (v14 + v16);
  v21 = v13 - (v15 + v17);

  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)_logShouldReceiveTouchIfNeeded:(BOOL)a3 forGestureRecognizer:(id)a4 touch:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  NSObject *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;
  CGPoint v47;
  CGRect v48;

  v6 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  SBLogHomeAffordance();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

  if (v11)
  {
    -[SBHomeAffordanceInteractionManager _firstHomeAffordanceInteractionForGestureRecognizer:touch:](self, "_firstHomeAffordanceInteractionForGestureRecognizer:touch:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _UISystemGestureLocationForTouchInView();
      v16 = v15;
      v18 = v17;
      objc_msgSend(v13, "homeAffordanceHitTestRect");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
    }
    else
    {
      v14 = 0;
      v20 = *MEMORY[0x1E0C9D628];
      v22 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v24 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v18 = INFINITY;
      v16 = INFINITY;
    }
    SBLogHomeAffordance();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v9, "_isPointerTouch");
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v47.x = v16;
      v47.y = v18;
      NSStringFromCGPoint(v47);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v48.origin.x = v20;
      v48.origin.y = v22;
      v48.size.width = v24;
      v48.size.height = v26;
      NSStringFromCGRect(v48);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v35 = v28;
      v36 = 1026;
      v37 = v6;
      v38 = 1026;
      v39 = v33;
      v40 = 2114;
      v41 = v30;
      v42 = 2114;
      v43 = v31;
      v44 = 2114;
      v45 = v32;
        "n in view: %{public}@; hit test rect in view: %{public}@)",
        buf,
        0x36u);

    }
  }

}

- (id)_firstHomeAffordanceInteractionForGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "sbf_activeTouches", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[SBHomeAffordanceInteractionManager _firstHomeAffordanceInteractionForGestureRecognizer:touch:](self, "_firstHomeAffordanceInteractionForGestureRecognizer:touch:", v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)_firstHomeAffordanceInteractionForGestureRecognizer:(id)a3 touch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGPoint v25;
  CGRect v26;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_registeredHomeAffordanceInteractions, "copy", 0);
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _UISystemGestureLocationForTouchInView();
        v15 = v14;
        v17 = v16;
        objc_msgSend(v12, "homeAffordanceHitTestRect");
        v25.x = v15;
        v25.y = v17;
        if (CGRectContainsPoint(v26, v25))
        {
          v9 = v12;

          goto LABEL_11;
        }

      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)_updateBounceTapGestureRecognizers
{
  void *v3;
  uint64_t v4;
  UITapGestureRecognizer *bounceDoubleTapRecognizer;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *v7;
  void *v8;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *bounceDoubleTapFailureRecognizer;
  void *v11;
  void *v12;
  UITapGestureRecognizer *v13;
  void *v14;

  -[SBHomeAffordanceInteractionManager _assistantController](self, "_assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  -[UITapGestureRecognizer _wantsGESEvents:](self->_bounceTapRecognizer, "_wantsGESEvents:", v4);
  bounceDoubleTapRecognizer = self->_bounceDoubleTapRecognizer;
  if ((_DWORD)v4)
  {
    if (!bounceDoubleTapRecognizer)
    {
      v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__bounceDoubleTapRecognized_);
      v7 = self->_bounceDoubleTapRecognizer;
      self->_bounceDoubleTapRecognizer = v6;

      -[UITapGestureRecognizer setName:](self->_bounceDoubleTapRecognizer, "setName:", CFSTR("homeGrabber.bounce.doubleTap"));
      -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_bounceDoubleTapRecognizer, "setNumberOfTapsRequired:", 2);
      -[UITapGestureRecognizer setCancelsTouchesInView:](self->_bounceDoubleTapRecognizer, "setCancelsTouchesInView:", 0);
      -[UITapGestureRecognizer setDelaysTouchesBegan:](self->_bounceDoubleTapRecognizer, "setDelaysTouchesBegan:", 0);
      -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_bounceDoubleTapRecognizer, "setDelaysTouchesEnded:", 0);
      -[UITapGestureRecognizer setAllowedTouchTypes:](self->_bounceDoubleTapRecognizer, "setAllowedTouchTypes:", &unk_1E91CE9E0);
      -[UITapGestureRecognizer setDelegate:](self->_bounceDoubleTapRecognizer, "setDelegate:", self);
      -[UITapGestureRecognizer _wantsGESEvents:](self->_bounceDoubleTapRecognizer, "_wantsGESEvents:", 1);
      if (self->_gesturesEnabled)
      {
        -[SBHomeAffordanceInteractionManager _systemGestureManager](self, "_systemGestureManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addGestureRecognizer:withType:", self->_bounceDoubleTapRecognizer, 97);

      }
    }
    if (!self->_bounceDoubleTapFailureRecognizer)
    {
      v9 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__bounceDoubleTapFailureRecognized_);
      bounceDoubleTapFailureRecognizer = self->_bounceDoubleTapFailureRecognizer;
      self->_bounceDoubleTapFailureRecognizer = v9;

      -[UITapGestureRecognizer setName:](self->_bounceDoubleTapFailureRecognizer, "setName:", CFSTR("homeGrabber.bounce.doubleTapFailure"));
      -[UITapGestureRecognizer setCancelsTouchesInView:](self->_bounceDoubleTapFailureRecognizer, "setCancelsTouchesInView:", 0);
      -[UITapGestureRecognizer setDelaysTouchesBegan:](self->_bounceDoubleTapFailureRecognizer, "setDelaysTouchesBegan:", 0);
      -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_bounceDoubleTapFailureRecognizer, "setDelaysTouchesEnded:", 0);
      -[UITapGestureRecognizer setAllowedTouchTypes:](self->_bounceDoubleTapFailureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE9F8);
      -[UITapGestureRecognizer setDelegate:](self->_bounceDoubleTapFailureRecognizer, "setDelegate:", self);
      -[UITapGestureRecognizer _wantsGESEvents:](self->_bounceDoubleTapFailureRecognizer, "_wantsGESEvents:", 1);
      if (self->_gesturesEnabled)
      {
        -[SBHomeAffordanceInteractionManager _systemGestureManager](self, "_systemGestureManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addGestureRecognizer:withType:", self->_bounceDoubleTapFailureRecognizer, 98);

      }
      -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_bounceDoubleTapFailureRecognizer, "requireGestureRecognizerToFail:", self->_bounceDoubleTapRecognizer);
    }
  }
  else
  {
    if (bounceDoubleTapRecognizer)
    {
      if (self->_gesturesEnabled)
      {
        -[SBHomeAffordanceInteractionManager _systemGestureManager](self, "_systemGestureManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeGestureRecognizer:", self->_bounceDoubleTapRecognizer);

        bounceDoubleTapRecognizer = self->_bounceDoubleTapRecognizer;
      }
      self->_bounceDoubleTapRecognizer = 0;

    }
    v13 = self->_bounceDoubleTapFailureRecognizer;
    if (v13)
    {
      if (self->_gesturesEnabled)
      {
        -[SBHomeAffordanceInteractionManager _systemGestureManager](self, "_systemGestureManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeGestureRecognizer:", self->_bounceDoubleTapFailureRecognizer);

        v13 = self->_bounceDoubleTapFailureRecognizer;
      }
      self->_bounceDoubleTapFailureRecognizer = 0;

    }
  }
}

- (void)_didRecognizeClickWithHomeAffordanceInteraction:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v9 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v9;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "_noteClick");
  -[SBHomeAffordanceInteractionManager _assistantController](self, "_assistantController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

}

- (void)_didRecognizeTapWithHomeAffordanceInteraction:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  SBHomeAffordanceInteraction *currentHomeAffordanceInteraction;
  SBHomeAffordanceInteraction *v12;
  SBHomeAffordanceInteraction *v13;
  SBHomeAffordanceInteraction *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "_noteTap");
  -[SBHomeAffordanceInteractionManager _assistantController](self, "_assistantController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  if (v10)
  {
    currentHomeAffordanceInteraction = self->_currentHomeAffordanceInteraction;
    v12 = (SBHomeAffordanceInteraction *)v15;
    v13 = self->_currentHomeAffordanceInteraction;
    self->_currentHomeAffordanceInteraction = v12;
    v14 = currentHomeAffordanceInteraction;

    -[SBHomeAffordanceInteraction setNeedsUpdate](v14, "setNeedsUpdate");
    -[SBHomeAffordanceInteraction notifyDidRecognizeSingleTap](self->_currentHomeAffordanceInteraction, "notifyDidRecognizeSingleTap");
    -[SBHomeAffordanceInteraction setNeedsUpdate](self->_currentHomeAffordanceInteraction, "setNeedsUpdate");

  }
}

- (void)_didRecognizeDoubleTapWithHomeAffordanceInteraction:(id)a3
{
  void *v5;
  int v6;
  SBHomeAffordanceInteraction *currentHomeAffordanceInteraction;
  SBHomeAffordanceInteraction *v8;
  id v9;

  -[SBHomeAffordanceInteractionManager _assistantController](self, "_assistantController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  if (v6)
  {
    currentHomeAffordanceInteraction = self->_currentHomeAffordanceInteraction;
    self->_currentHomeAffordanceInteraction = 0;
    v8 = currentHomeAffordanceInteraction;

    -[SBHomeAffordanceInteraction notifyDidRecognizeDoubleTap](v8, "notifyDidRecognizeDoubleTap");
    -[SBHomeAffordanceInteraction setNeedsUpdate](v8, "setNeedsUpdate");

    if (a3)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D97840]);
      objc_msgSend(v9, "activateFromSource:", 47);
      objc_msgSend(v9, "invalidate");

    }
  }
}

- (void)_didFailToRecognizeDoubleTapWithHomeAffordanceInteraction:(id)a3
{
  void *v4;
  int v5;
  SBHomeAffordanceInteraction *currentHomeAffordanceInteraction;
  SBHomeAffordanceInteraction *v7;

  -[SBHomeAffordanceInteractionManager _assistantController](self, "_assistantController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  if (v5)
  {
    currentHomeAffordanceInteraction = self->_currentHomeAffordanceInteraction;
    self->_currentHomeAffordanceInteraction = 0;
    v7 = currentHomeAffordanceInteraction;

    -[SBHomeAffordanceInteraction notifyDidFailToRecognizeDoubleTap](v7, "notifyDidFailToRecognizeDoubleTap");
    -[SBHomeAffordanceInteraction setNeedsUpdate](v7, "setNeedsUpdate");

  }
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (int64_t)hitTestRectSize
{
  return self->_hitTestRectSize;
}

- (void)setHitTestRectSize:(int64_t)a3
{
  self->_hitTestRectSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_currentHomeAffordanceInteraction, 0);
  objc_storeStrong((id *)&self->_registeredHomeAffordanceInteractions, 0);
  objc_storeStrong((id *)&self->_revealEdgePanRecognizer, 0);
  objc_storeStrong((id *)&self->_revealDoubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_revealTapRecognizer, 0);
  objc_storeStrong((id *)&self->_bounceDoubleTapFailureRecognizer, 0);
  objc_storeStrong((id *)&self->_bounceDoubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_bounceTapRecognizer, 0);
}

- (void)_bounceTapRecognized:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  OUTLINED_FUNCTION_2_2();
}

- (void)_bounceDoubleTapRecognized:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  OUTLINED_FUNCTION_2_2();
}

- (void)_bounceDoubleTapFailureRecognized:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  OUTLINED_FUNCTION_2_2();
}

@end
