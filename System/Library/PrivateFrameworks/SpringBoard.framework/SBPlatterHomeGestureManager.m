@implementation SBPlatterHomeGestureManager

- (SBPlatterHomeGestureManager)initWithDelegate:(id)a3
{
  id v4;
  SBPlatterHomeGestureManager *v5;
  SBPlatterHomeGestureManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBPlatterHomeGestureManager;
  v5 = -[SBPlatterHomeGestureManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (id)registerParticipant:(id)a3 windowScene:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPlatterHomeGestureManager.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

  }
  SBLogBanners();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Platter home gesture manager asked to register participant: %{public}@", buf, 0xCu);
  }

  -[SBPlatterHomeGestureManager _homeGestureContextForParticipant:creatingIfNecessary:withWindowScene:](self, "_homeGestureContextForParticipant:creatingIfNecessary:withWindowScene:", v7, 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)unregisterParticipant:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    SBLogBanners();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Platter home gesture manager asked to unregister participant: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    -[SBPlatterHomeGestureManager _homeGestureContextForParticipant:creatingIfNecessary:withWindowScene:](self, "_homeGestureContextForParticipant:creatingIfNecessary:withWindowScene:", v4, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeActiveAffordanceIfPossible:", 0);
    -[SBPlatterHomeGestureManager _removeHomeGestureContextForParticipant:](self, "_removeHomeGestureContextForParticipant:", v4);

  }
}

- (void)bannerManagerHomeGestureContext:(id)a3 homeGestureOwnershipDidChange:(BOOL)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBPlatterHomeGestureManager _participantForHomeGestureContext:](self, "_participantForHomeGestureContext:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "platterHomeGestureManager:participantOwningHomeGestureDidChange:", self, v6);

  }
}

- (void)wantsHomeGestureDidChangeForBannerManagerHomeGestureContext:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();
  -[SBPlatterHomeGestureManager _allParticipants](self, "_allParticipants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
    objc_msgSend(WeakRetained, "platterHomeGestureManager:orderedParticipants:", self, v7);
  else
    objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v10);
        -[SBPlatterHomeGestureManager _homeGestureContextForParticipant:creatingIfNecessary:withWindowScene:](self, "_homeGestureContextForParticipant:creatingIfNecessary:withWindowScene:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), 0, 0, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13 || !objc_msgSend(v16, "wantsToBeActiveAffordance"))
          objc_msgSend(v17, "becomeActiveAffordanceIfPossible:", 0);
        else
          v13 = v17;

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v13, "becomeActiveAffordanceIfPossible:", 1);
}

- (id)keyboardHomeAffordanceAssertionForBannerManagerHomeGestureContext:(id)a3
{
  void *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;

  -[SBPlatterHomeGestureManager _participantForHomeGestureContext:](self, "_participantForHomeGestureContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(WeakRetained, "platterHomeGestureManager:windowForParticipant:", self, v4),
          (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)v6;
      +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:](SBKeyboardHomeAffordanceAssertion, "assertionForGestureWindow:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)gestureRecognizerPriorityAssertionForBannerManagerHomeGestureContext:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  -[SBPlatterHomeGestureManager _participantForHomeGestureContext:](self, "_participantForHomeGestureContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "platterHomeGestureManager:gestureRecognizerPriorityAssertionForParticipant:reason:", self, v4, CFSTR("home gesture context"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_homeGestureContextForParticipant:(id)a3 creatingIfNecessary:(BOOL)a4 withWindowScene:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  SBPlatterHomeGestureManager *v10;
  SBPlatterHomeGestureContext *v11;
  BOOL v12;
  uint64_t v13;
  NSMapTable *participantsToHomeGestureContexts;
  id WeakRetained;
  uint64_t v16;
  NSObject *v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = self;
    objc_sync_enter(v10);
    -[NSMapTable objectForKey:](v10->_participantsToHomeGestureContexts, "objectForKey:", v8);
    v11 = (SBPlatterHomeGestureContext *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = 1;
    else
      v12 = !v6;
    if (v12)
      goto LABEL_17;
    if (!v10->_participantsToHomeGestureContexts)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v13 = objc_claimAutoreleasedReturnValue();
      participantsToHomeGestureContexts = v10->_participantsToHomeGestureContexts;
      v10->_participantsToHomeGestureContexts = (NSMapTable *)v13;

    }
    WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = objc_msgSend(WeakRetained, "platterHomeGestureManager:zStackParticipantIdentifierForParticipant:", v10, v8);
      if (v16 < 0)
      {
        SBLogBanners();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[SBPlatterHomeGestureManager _homeGestureContextForParticipant:creatingIfNecessary:withWindowScene:].cold.1((uint64_t)WeakRetained, (uint64_t)v8, v17);

        v11 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      v16 = 0;
    }
    v11 = -[SBPlatterHomeGestureContext initWithParticipant:participantIdentifier:windowScene:]([SBPlatterHomeGestureContext alloc], "initWithParticipant:participantIdentifier:windowScene:", v8, v16, v9);
    -[SBPlatterHomeGestureContext setDelegate:](v11, "setDelegate:", v10);
    -[NSMapTable setObject:forKey:](v10->_participantsToHomeGestureContexts, "setObject:forKey:", v11, v8);
LABEL_16:

LABEL_17:
    objc_sync_exit(v10);

    goto LABEL_18;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (id)_participantForHomeGestureContext:(id)a3
{
  id v4;
  SBPlatterHomeGestureManager *v5;
  NSMapTable *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  _BOOL4 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5->_participantsToHomeGestureContexts;
    v7 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          -[NSMapTable objectForKey:](v5->_participantsToHomeGestureContexts, "objectForKey:", v10, (_QWORD)v14);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          v12 = v11 == v4;

          if (v12)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_removeHomeGestureContextForParticipant:(id)a3
{
  id v4;
  SBPlatterHomeGestureManager *v5;
  NSMapTable *participantsToHomeGestureContexts;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMapTable removeObjectForKey:](v5->_participantsToHomeGestureContexts, "removeObjectForKey:", v7);
    if (!-[NSMapTable count](v5->_participantsToHomeGestureContexts, "count"))
    {
      participantsToHomeGestureContexts = v5->_participantsToHomeGestureContexts;
      v5->_participantsToHomeGestureContexts = 0;

    }
    objc_sync_exit(v5);

    v4 = v7;
  }

}

- (id)_allParticipants
{
  SBPlatterHomeGestureManager *v2;
  id v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v2->_participantsToHomeGestureContexts;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v3;
}

- (SBPlatterHomeGestureManagerDelegate)delegate
{
  return (SBPlatterHomeGestureManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_participantsToHomeGestureContexts, 0);
}

- (void)_homeGestureContextForParticipant:(uint64_t)a1 creatingIfNecessary:(uint64_t)a2 withWindowScene:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Delegate (%{public}@) failed to return a home gesture participant ID for platter home gesture participant '%{public}@'", (uint8_t *)&v3, 0x16u);
}

@end
