@implementation SBRecentDisplayItemsController

- (SBRecentDisplayItemsController)initWithRemovalPersonality:(int64_t)a3 movePersonality:(int64_t)a4 transitionFromSources:(id)a5 maxDisplayItems:(unint64_t)a6 eventSource:(id)a7 applicationController:(id)a8
{
  id v15;
  id v16;
  id v17;
  SBRecentDisplayItemsController *v18;
  SBRecentDisplayItemsController *v19;
  uint64_t v20;
  BSInvalidatable *stateCaptureInvalidatable;
  uint64_t v22;
  SBHomeGestureSettings *homeGestureSettings;
  objc_super v25;

  v15 = a5;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SBRecentDisplayItemsController;
  v18 = -[SBRecentDisplayItemsController init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_removalPersonality = a3;
    v18->_movePersonality = a4;
    objc_storeStrong((id *)&v18->_relevantTransitionFromSources, a5);
    v19->_maxDisplayItems = a6;
    objc_storeStrong((id *)&v19->_appController, a8);
    objc_msgSend(v16, "addObserver:", v19);
    -[SBRecentDisplayItemsController _addStateCaptureHandler](v19, "_addStateCaptureHandler");
    v20 = objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = v19->_stateCaptureInvalidatable;
    v19->_stateCaptureInvalidatable = (BSInvalidatable *)v20;

    +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
    v22 = objc_claimAutoreleasedReturnValue();
    homeGestureSettings = v19->_homeGestureSettings;
    v19->_homeGestureSettings = (SBHomeGestureSettings *)v22;

  }
  return v19;
}

- (SBRecentDisplayItemsController)init
{
  return -[SBRecentDisplayItemsController initWithRemovalPersonality:movePersonality:transitionFromSources:maxDisplayItems:eventSource:applicationController:](self, "initWithRemovalPersonality:movePersonality:transitionFromSources:maxDisplayItems:eventSource:applicationController:", 0, 0, 0, 0, 0, 0);
}

- (void)setRecentDisplayItems:(id)a3
{
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *recentDisplayItems;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithOrderedSet:", a3);
  v4 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  recentDisplayItems = self->_recentDisplayItems;
  self->_recentDisplayItems = v4;

}

- (NSOrderedSet)recentDisplayItems
{
  return (NSOrderedSet *)self->_recentDisplayItems;
}

- (void)reset
{
  -[NSMutableOrderedSet removeAllObjects](self->_recentDisplayItems, "removeAllObjects");
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBRecentDisplayItemsController;
  -[SBRecentDisplayItemsController dealloc](&v3, sel_dealloc);
}

- (void)eventSource:(id)a3 userRemovedSuggestions:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  obj = a4;
  if ((self->_removalPersonality & 8) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __69__SBRecentDisplayItemsController_eventSource_userRemovedSuggestions___block_invoke;
          v20[3] = &unk_1E8E9DF50;
          v20[4] = v9;
          -[SBRecentDisplayItemsController _allDisplayItemsPassingTest:](self, "_allDisplayItemsPassingTest:", v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v17;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v17 != v13)
                  objc_enumerationMutation(v10);
                -[SBRecentDisplayItemsController _removeDisplayItem:](self, "_removeDisplayItem:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }
  }

}

uint64_t __69__SBRecentDisplayItemsController_eventSource_userRemovedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

- (void)eventSource:(id)a3 userDeletedApplications:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if ((self->_removalPersonality & 4) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          -[SBRecentDisplayItemsController _allDisplayItemsForBundleID:](self, "_allDisplayItemsForBundleID:", v11, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v18;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v18 != v15)
                  objc_enumerationMutation(v12);
                -[SBRecentDisplayItemsController _removeDisplayItem:](self, "_removeDisplayItem:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v14);
          }

          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }
  }

}

- (void)eventSource:(id)a3 applicationsBecameHidden:(id)a4
{
  -[SBRecentDisplayItemsController _applicationsBecameHidden:](self, "_applicationsBecameHidden:", a4);
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  id v5;
  id v6;

  if ((self->_movePersonality & 2) != 0)
  {
    v5 = a4;
    -[SBRecentDisplayItemsController _clearDelayAfterTransitionTimer](self, "_clearDelayAfterTransitionTimer");
    -[SBRecentDisplayItemsController _firstDisplayItemForBundleID:](self, "_firstDisplayItemForBundleID:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[SBRecentDisplayItemsController _moveDisplayItemToFront:](self, "_moveDisplayItemToFront:", v6);
  }
}

- (void)eventSource:(id)a3 keyboardFocusChangedToApplication:(id)a4
{
  id v5;

  if ((self->_movePersonality & 4) != 0)
  {
    -[SBRecentDisplayItemsController _firstDisplayItemForBundleID:](self, "_firstDisplayItemForBundleID:", a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBRecentDisplayItemsController _moveDisplayItemToFront:](self, "_moveDisplayItemToFront:", v5);

  }
}

- (void)eventSource:(id)a3 didBeginTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7
{
  id v12;
  id v13;
  int64_t movePersonality;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSSet *relevantTransitionFromSources;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  double v26;
  void *v27;
  id v28;

  v28 = a3;
  v12 = a5;
  v13 = a6;
  if (a4 == 1)
  {
    if ((self->_movePersonality & 1) != 0)
    {
      +[SBDisplayItem homeScreenDisplayItem](SBDisplayItem, "homeScreenDisplayItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentDisplayItemsController _moveDisplayItemToFront:](self, "_moveDisplayItemToFront:", v25);
LABEL_17:

    }
  }
  else if (a4 == 3)
  {
    -[SBRecentDisplayItemsController _clearDelayAfterTransitionTimer](self, "_clearDelayAfterTransitionTimer");
    movePersonality = self->_movePersonality;
    if ((movePersonality & 0x10) != 0)
    {
      objc_msgSend(v12, "elementWithRole:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentDisplayItemsController _displayItemForLayoutElement:](self, "_displayItemForLayoutElement:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentDisplayItemsController _addOrMoveDisplayItemToFront:](self, "_addOrMoveDisplayItemToFront:", v16);

      objc_msgSend(v12, "elementWithRole:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentDisplayItemsController _displayItemForLayoutElement:](self, "_displayItemForLayoutElement:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentDisplayItemsController _addOrMoveDisplayItemToFront:](self, "_addOrMoveDisplayItemToFront:", v18);

      objc_msgSend(v12, "elementWithRole:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentDisplayItemsController _displayItemForLayoutElement:](self, "_displayItemForLayoutElement:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentDisplayItemsController _addOrMoveDisplayItemToFront:](self, "_addOrMoveDisplayItemToFront:", v20);

      movePersonality = self->_movePersonality;
    }
    if ((movePersonality & 8) != 0)
    {
      relevantTransitionFromSources = self->_relevantTransitionFromSources;
      if (!relevantTransitionFromSources
        || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = -[NSSet containsObject:](relevantTransitionFromSources, "containsObject:", v22),
            v22,
            v23))
      {
        if (v13)
        {
          v24 = v13;
        }
        else
        {
          objc_msgSend(v12, "elementWithRole:", 1);
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        v25 = v24;
        if (a7 == 11
          && (-[SBHomeGestureSettings secondsToResetSwitcherListAfterTransition](self->_homeGestureSettings, "secondsToResetSwitcherListAfterTransition"), v26 > 0.0))
        {
          -[SBRecentDisplayItemsController _setupDelayAfterTransitionTimerForActivatingElement:](self, "_setupDelayAfterTransitionTimerForActivatingElement:", v25);
        }
        else
        {
          -[SBRecentDisplayItemsController _displayItemForLayoutElement:](self, "_displayItemForLayoutElement:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBRecentDisplayItemsController _addOrMoveDisplayItemToFront:](self, "_addOrMoveDisplayItemToFront:", v27);

        }
        goto LABEL_17;
      }
    }
  }

}

- (void)eventSource:(id)a3 userQuitApplicationInSwitcher:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((self->_removalPersonality & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[SBRecentDisplayItemsController _allDisplayItemsForBundleID:](self, "_allDisplayItemsForBundleID:", a4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[SBRecentDisplayItemsController _removeDisplayItem:](self, "_removeDisplayItem:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)eventSource:(id)a3 userDeletedWebBookmark:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((self->_removalPersonality & 4) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(a4, "webClip", a3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRecentDisplayItemsController _allDisplayItemsForWebClipID:](self, "_allDisplayItemsForWebClipID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[SBRecentDisplayItemsController _removeDisplayItem:](self, "_removeDisplayItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)_clearDelayAfterTransitionTimer
{
  NSTimer *delayAfterTransitionTimer;

  -[NSTimer invalidate](self->_delayAfterTransitionTimer, "invalidate");
  delayAfterTransitionTimer = self->_delayAfterTransitionTimer;
  self->_delayAfterTransitionTimer = 0;

}

- (void)_setupDelayAfterTransitionTimerForActivatingElement:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  NSTimer *v9;
  NSTimer *delayAfterTransitionTimer;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  -[SBHomeGestureSettings secondsToResetSwitcherListAfterTransition](self->_homeGestureSettings, "secondsToResetSwitcherListAfterTransition");
  v7 = v6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__SBRecentDisplayItemsController__setupDelayAfterTransitionTimerForActivatingElement___block_invoke;
  v12[3] = &unk_1E8EA3218;
  objc_copyWeak(&v14, &location);
  v8 = v4;
  v13 = v8;
  objc_msgSend(v5, "timerWithTimeInterval:repeats:block:", 0, v12, v7);
  v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  delayAfterTransitionTimer = self->_delayAfterTransitionTimer;
  self->_delayAfterTransitionTimer = v9;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTimer:forMode:", self->_delayAfterTransitionTimer, *MEMORY[0x1E0C99860]);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __86__SBRecentDisplayItemsController__setupDelayAfterTransitionTimerForActivatingElement___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_displayItemForLayoutElement:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_addOrMoveDisplayItemToFront:", v2);

  objc_msgSend(WeakRetained, "_clearDelayAfterTransitionTimer");
}

- (BOOL)_displayItemIsExecutableOnCurrentPlatform:(id)a3
{
  id v4;
  char v5;
  SBApplicationController *appController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "type"))
  {
    v5 = 1;
  }
  else
  {
    appController = self->_appController;
    objc_msgSend(v4, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationController applicationWithBundleIdentifier:](appController, "applicationWithBundleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "supports64Bit") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "placeholderForDisplayID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v12, "isAppClip");

    }
  }

  return v5;
}

- (BOOL)_isDisallowedDisplayItem:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("com.apple.purplebuddy"), 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v3, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v9, "isEqualToString:", v8);

        if ((v8 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_firstDisplayItemForUniqueID:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
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
  v5 = self->_recentDisplayItems;
  v6 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_displayItem:(id)a3 matchesBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") == 5
    && -[SBRecentDisplayItemsController _displayItemRepresentsAppClip:](self, "_displayItemRepresentsAppClip:", v6))
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:](SBWebApplication, "_webClipIdentifierFromWebAppIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBRecentDisplayItemsController _webClipForIdentifier:](self, "_webClipForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v7);

  }
  else
  {
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v7);
  }

  return v12;
}

- (id)_firstDisplayItemForBundleID:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
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
  v5 = self->_recentDisplayItems;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[SBRecentDisplayItemsController _displayItem:matchesBundleID:](self, "_displayItem:matchesBundleID:", v10, v4, (_QWORD)v13))
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)_allDisplayItemsForBundleID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SBRecentDisplayItemsController__allDisplayItemsForBundleID___block_invoke;
  v8[3] = &unk_1E8EA55B0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[SBRecentDisplayItemsController _allDisplayItemsPassingTest:](self, "_allDisplayItemsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __62__SBRecentDisplayItemsController__allDisplayItemsForBundleID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayItem:matchesBundleID:", a2, *(_QWORD *)(a1 + 40));
}

- (id)_allDisplayItemsForUniqueID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SBRecentDisplayItemsController__allDisplayItemsForUniqueID___block_invoke;
  v8[3] = &unk_1E8E9DF50;
  v9 = v4;
  v5 = v4;
  -[SBRecentDisplayItemsController _allDisplayItemsPassingTest:](self, "_allDisplayItemsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __62__SBRecentDisplayItemsController__allDisplayItemsForUniqueID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_allDisplayItemsForWebClipID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SBRecentDisplayItemsController__allDisplayItemsForWebClipID___block_invoke;
  v8[3] = &unk_1E8E9DF50;
  v9 = v4;
  v5 = v4;
  -[SBRecentDisplayItemsController _allDisplayItemsPassingTest:](self, "_allDisplayItemsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__SBRecentDisplayItemsController__allDisplayItemsForWebClipID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 5)
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:](SBWebApplication, "_webClipIdentifierFromWebAppIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_allDisplayItemsPassingTest:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_recentDisplayItems;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v4[2](v4, v11))
        {
          if (!v8)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array", (_QWORD)v13);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v8, "addObject:", v11, (_QWORD)v13);
        }
      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_displayItemForLayoutElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "workspaceEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isApplicationSceneEntity"))
  {
    objc_msgSend(v4, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isWebApplication"))
    {
      objc_msgSend(v3, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:](SBDisplayItem, "webAppDisplayItemWithWebAppIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v9 = (void *)v8;
    +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:sceneIdentifier:](SBDisplayItem, "applicationDisplayItemWithBundleIdentifier:sceneIdentifier:", v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isAppClipPlaceholderEntity"))
  {
    objc_msgSend(v4, "appClipPlaceholderEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "futureSceneIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isHomeScreenEntity"))
  {
    +[SBDisplayItem homeScreenDisplayItem](SBDisplayItem, "homeScreenDisplayItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_9:

  return v7;
}

- (void)_addOrMoveDisplayItemToFront:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableOrderedSet *recentDisplayItems;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "type"))
  {
    -[SBRecentDisplayItemsController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v5, "recentDisplayItemsControllerShouldRepresentAppClipsAsWebClips:", self)
      && -[SBRecentDisplayItemsController _displayItemRepresentsAppClip:](self, "_displayItemRepresentsAppClip:", v4))
    {
      objc_msgSend(v4, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRecentDisplayItemsController _associatedWebClipIdentifierForAppClipIdentifier:sceneIdentifier:](self, "_associatedWebClipIdentifierForAppClipIdentifier:sceneIdentifier:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {

        goto LABEL_21;
      }
      +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:](SBWebApplication, "_webAppIdentifierFromWebClipIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:](SBDisplayItem, "webAppDisplayItemWithWebAppIdentifier:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v10;
    }

  }
  if (-[NSMutableOrderedSet containsObject:](self->_recentDisplayItems, "containsObject:", v4))
  {
    -[SBRecentDisplayItemsController _moveDisplayItemToFront:](self, "_moveDisplayItemToFront:", v4);
  }
  else
  {
    if (-[NSMutableOrderedSet count](self->_recentDisplayItems, "count") && !objc_msgSend(v4, "type"))
    {
      recentDisplayItems = self->_recentDisplayItems;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __63__SBRecentDisplayItemsController__addOrMoveDisplayItemToFront___block_invoke;
      v22[3] = &unk_1E8EA55D8;
      v23 = v4;
      -[NSMutableOrderedSet indexesOfObjectsPassingTest:](recentDisplayItems, "indexesOfObjectsPassingTest:", v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[NSMutableOrderedSet objectsAtIndexes:](self->_recentDisplayItems, "objectsAtIndexes:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            -[SBRecentDisplayItemsController _removeDisplayItem:](self, "_removeDisplayItem:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++));
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        }
        while (v15);
      }

    }
    -[SBRecentDisplayItemsController _addDisplayItemToFront:](self, "_addDisplayItemToFront:", v4);
  }
LABEL_21:

}

uint64_t __63__SBRecentDisplayItemsController__addOrMoveDisplayItemToFront___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)_addDisplayItemToFront:(id)a3
{
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *WeakRetained;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  NSMutableOrderedSet *recentDisplayItems;
  unint64_t v14;
  NSUInteger maxDisplayItems;
  NSUInteger v16;
  NSObject *v17;
  NSMutableOrderedSet *v18;
  NSMutableOrderedSet *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  NSMutableOrderedSet *v30;
  __int16 v31;
  NSMutableOrderedSet *v32;
  uint64_t v33;
  NSRange v34;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (NSMutableOrderedSet *)a3;
  if (v4
    && -[SBRecentDisplayItemsController _displayItemIsExecutableOnCurrentPlatform:](self, "_displayItemIsExecutableOnCurrentPlatform:", v4)&& !-[SBRecentDisplayItemsController _isDisallowedDisplayItem:](self, "_isDisallowedDisplayItem:", v4))
  {
    WeakRetained = (NSMutableOrderedSet *)objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = -[NSMutableOrderedSet recentDisplayItemsController:shouldAddItem:](WeakRetained, "recentDisplayItemsController:shouldAddItem:", self, v4);
    else
      v6 = 1;
    v7 = (void *)MEMORY[0x1E0CF9688];
    -[NSMutableOrderedSet bundleIdentifier](v4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationWithBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "isHidden");
    SBLogDockRecents();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10 || !v6)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412546;
        v30 = WeakRetained;
        v31 = 2112;
        v32 = v4;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "delegate %@ returned NO for recentDisplayItemsController:shouldAddItem: %@", buf, 0x16u);
      }
    }
    else
    {
      if (v12)
      {
        recentDisplayItems = self->_recentDisplayItems;
        *(_DWORD *)buf = 138412546;
        v30 = v4;
        v31 = 2112;
        v32 = recentDisplayItems;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "will insertObject: %@; atIndex: 0; into: %@;",
          buf,
          0x16u);
      }

      -[NSMutableOrderedSet insertObject:atIndex:](self->_recentDisplayItems, "insertObject:atIndex:", v4, 0);
      v14 = -[NSMutableOrderedSet count](self->_recentDisplayItems, "count");
      v11 = 0;
      maxDisplayItems = self->_maxDisplayItems;
      if (v14 > maxDisplayItems)
      {
        v16 = -[NSMutableOrderedSet count](self->_recentDisplayItems, "count") - self->_maxDisplayItems;
        SBLogDockRecents();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v34.location = maxDisplayItems;
          v34.length = v16;
          NSStringFromRange(v34);
          v18 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
          v19 = self->_recentDisplayItems;
          *(_DWORD *)buf = 138412546;
          v30 = v18;
          v31 = 2112;
          v32 = v19;
          _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_INFO, "will removeObjectsInRange: %@; from: %@;", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:range:copyItems:", self->_recentDisplayItems, maxDisplayItems, v16, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        -[NSMutableOrderedSet removeObjectsInRange:](self->_recentDisplayItems, "removeObjectsInRange:", maxDisplayItems, v16);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSMutableOrderedSet recentDisplayItemsControllerDidUpdateDisplayItems:](WeakRetained, "recentDisplayItemsControllerDidUpdateDisplayItems:", self);
      if (v11)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v11 = v11;
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v25;
            do
            {
              v23 = 0;
              do
              {
                if (*(_QWORD *)v25 != v22)
                  objc_enumerationMutation(v11);
                -[NSMutableOrderedSet recentDisplayItemsController:didAddItem:andDropItem:](WeakRetained, "recentDisplayItemsController:didAddItem:andDropItem:", self, v4, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v23++), (_QWORD)v24);
              }
              while (v21 != v23);
              v21 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            }
            while (v21);
          }

        }
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NSMutableOrderedSet recentDisplayItemsController:didAddItem:](WeakRetained, "recentDisplayItemsController:didAddItem:", self, v4);
      }
    }

  }
}

- (void)_moveDisplayItemToFront:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableOrderedSet *recentDisplayItems;
  NSObject *v7;
  NSMutableOrderedSet *v8;
  id WeakRetained;
  int v10;
  id v11;
  __int16 v12;
  NSMutableOrderedSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && -[NSMutableOrderedSet containsObject:](self->_recentDisplayItems, "containsObject:", v4)
    && -[SBRecentDisplayItemsController _displayItemIsExecutableOnCurrentPlatform:](self, "_displayItemIsExecutableOnCurrentPlatform:", v4))
  {
    SBLogDockRecents();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      recentDisplayItems = self->_recentDisplayItems;
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = recentDisplayItems;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "will removeObject: %@; from: %@;", (uint8_t *)&v10, 0x16u);
    }

    -[NSMutableOrderedSet removeObject:](self->_recentDisplayItems, "removeObject:", v4);
    SBLogDockRecents();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = self->_recentDisplayItems;
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "will insertObject: %@; atIndex 0; into: %@;",
        (uint8_t *)&v10,
        0x16u);
    }

    -[NSMutableOrderedSet insertObject:atIndex:](self->_recentDisplayItems, "insertObject:atIndex:", v4, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "recentDisplayItemsControllerDidUpdateDisplayItems:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "recentDisplayItemsController:didMoveItemToFront:", self, v4);

  }
}

- (void)_removeDisplayItem:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableOrderedSet *recentDisplayItems;
  id WeakRetained;
  int v8;
  id v9;
  __int16 v10;
  NSMutableOrderedSet *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && -[NSMutableOrderedSet containsObject:](self->_recentDisplayItems, "containsObject:", v4))
  {
    SBLogDockRecents();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      recentDisplayItems = self->_recentDisplayItems;
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = recentDisplayItems;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "will removeObject: %@; from: %@;", (uint8_t *)&v8, 0x16u);
    }

    -[NSMutableOrderedSet removeObject:](self->_recentDisplayItems, "removeObject:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "recentDisplayItemsControllerDidUpdateDisplayItems:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "recentDisplayItemsController:didRemoveItem:", self, v4);

  }
}

- (void)_disallowAppFromAppearingWhileHidden:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBRecentDisplayItemsController _applicationsBecameHidden:](self, "_applicationsBecameHidden:", v4);

}

- (BOOL)_displayItemRepresentsAppClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (!objc_msgSend(v4, "type"))
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationController applicationWithBundleIdentifier:](self->_appController, "applicationWithBundleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isAppClip") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "placeholderForDisplayID:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "isAppClip");

    }
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "type") == 5)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:](SBWebApplication, "_webClipIdentifierFromWebAppIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBRecentDisplayItemsController _webClipForIdentifier:](self, "_webClipForIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAppClip");
LABEL_9:

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)_associatedWebClipIdentifierForAppClipIdentifier:(id)a3 sceneIdentifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0D23068];
  v6 = a4;
  objc_msgSend(v5, "storeForApplication:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneStoreForIdentifier:creatingIfNecessary:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("appClipIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_webClipForIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_opt_class();
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leafIconForIdentifier:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "webClip");
  else
    objc_msgSend(MEMORY[0x1E0CEAC08], "webClipWithIdentifier:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_addStateCaptureHandler
{
  void *v3;
  id v4;
  void *v5;
  id v7;
  id location;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpringBoard - SBRecentDisplayItemsController - %p"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v7, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v5;
}

__CFString *__57__SBRecentDisplayItemsController__addStateCaptureHandler__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  __CFString *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "description");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E8EC7EC0;
  }

  return v3;
}

- (void)_applicationsBecameHidden:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((self->_removalPersonality & 2) != 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          -[SBRecentDisplayItemsController _allDisplayItemsForBundleID:](self, "_allDisplayItemsForBundleID:", v10, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v17;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v17 != v14)
                  objc_enumerationMutation(v11);
                -[SBRecentDisplayItemsController _removeDisplayItem:](self, "_removeDisplayItem:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v13);
          }

          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }
  }

}

- (SBRecentDisplayItemsControllerDelegate)delegate
{
  return (SBRecentDisplayItemsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_storeStrong((id *)&self->_delayAfterTransitionTimer, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_relevantTransitionFromSources, 0);
  objc_storeStrong((id *)&self->_recentDisplayItems, 0);
}

@end
