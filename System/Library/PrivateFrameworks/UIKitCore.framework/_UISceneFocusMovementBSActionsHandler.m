@implementation _UISceneFocusMovementBSActionsHandler

- (_UISceneFocusMovementBSActionsHandler)init
{
  _UISceneFocusMovementBSActionsHandler *v2;
  uint64_t v3;
  NSMutableDictionary *pendingFocusMovementActions;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISceneFocusMovementBSActionsHandler;
  v2 = -[_UISceneFocusMovementBSActionsHandler init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    pendingFocusMovementActions = v2->_pendingFocusMovementActions;
    v2->_pendingFocusMovementActions = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__focusSystemSceneComponentDidPerformInitialSetupNotification_, CFSTR("_UIFocusSystemSceneComponentDidFinishInitialization"), 0);

  }
  return v2;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *pendingFocusMovementActions;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "objectsPassingTest:", &__block_literal_global_316);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "_focusSystemSceneComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "focusSystem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v13 = v10;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v26;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(v12, "_handleFocusMovementAction:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17++), (_QWORD)v25);
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v15);
        }

      }
      else
      {
        objc_msgSend(v9, "_FBSScene");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identityToken");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        pendingFocusMovementActions = self->_pendingFocusMovementActions;
        objc_msgSend(v10, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](pendingFocusMovementActions, "setObject:forKey:", v22, v20);

      }
    }
  }
  v23 = (void *)objc_msgSend(v8, "mutableCopy", (_QWORD)v25);
  objc_msgSend(v23, "minusSet:", v10);

  return v23;
}

- (void)_focusSystemSceneComponentDidPerformInitialSetupNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", 0x1E16F0880);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v7)
    {
      -[NSMutableDictionary objectForKey:](self->_pendingFocusMovementActions, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        -[NSMutableDictionary objectForKey:](self->_pendingFocusMovementActions, "objectForKey:", v7, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v5, "_handleFocusMovementAction:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v12);
        }

      }
    }
  }
  -[NSMutableDictionary removeObjectForKey:](self->_pendingFocusMovementActions, "removeObjectForKey:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingFocusMovementActions, 0);
}

@end
