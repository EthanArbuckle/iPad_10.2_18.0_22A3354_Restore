@implementation SBSystemPointerInteractionManager

- (BOOL)isViewRegistered:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_registeredViewsToDelegates, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)unregisterView:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_registeredViewsToDelegates, "removeObjectForKey:", a3);
}

- (void)registerView:(id)a3 delegate:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_registeredViewsToDelegates, "objectForKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemPointerInteractionManager.m"), 36, CFSTR("The view (%@) had already been registered previously."), v10);

  }
  -[NSMapTable setObject:forKey:](self->_registeredViewsToDelegates, "setObject:forKey:", v7, v10);

}

- (SBSystemPointerInteractionManager)initWithMultiDisplayUserInteractionCoordinator:(id)a3
{
  id v6;
  SBSystemPointerInteractionManager *v7;
  uint64_t v8;
  NSMapTable *registeredViewsToDelegates;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemPointerInteractionManager.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInteractionCoordinator"));

  }
  v12.receiver = self;
  v12.super_class = (Class)SBSystemPointerInteractionManager;
  v7 = -[SBSystemPointerInteractionManager init](&v12, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    registeredViewsToDelegates = v7->_registeredViewsToDelegates;
    v7->_registeredViewsToDelegates = (NSMapTable *)v8;

    objc_storeStrong((id *)&v7->_multiDisplayUserInteractionCoordinator, a3);
    objc_msgSend(v6, "addPointerInteractionObserver:", v7);
  }

  return v7;
}

- (SBWindowScene)activePointerWindowScene
{
  return -[SBMultiDisplayUserInteractionCoordinator activePointerWindowScene](self->_multiDisplayUserInteractionCoordinator, "activePointerWindowScene");
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[SBMultiDisplayUserInteractionCoordinator removePointerInteractionObserver:](self->_multiDisplayUserInteractionCoordinator, "removePointerInteractionObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBSystemPointerInteractionManager;
  -[SBSystemPointerInteractionManager dealloc](&v3, sel_dealloc);
}

- (void)pointerDidMoveToFromWindowScene:(id)a3 toWindowScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "pointerDidMoveToFromWindowScene:toWindowScene:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)pointerInteraction:(id)a3 window:(id)a4 regionForRequest:(id)a5 defaultRegion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  double v12;
  double v13;
  NSMapTable *v14;
  NSMapTable *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  char **v20;
  void *v21;
  char **v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v50;
  double v51;
  double v52;
  double v53;
  double v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  CGPoint v61;
  CGRect v62;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fixedCoordinateSpace");
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "location");
    objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v11);
    v53 = v13;
    v54 = v12;
    v14 = self->_registeredViewsToDelegates;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v15 = v14;
    v16 = (void *)-[NSMapTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v16)
    {
      v50 = v8;
      v17 = *(_QWORD *)v56;
      v18 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
      v51 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v52 = *MEMORY[0x1E0CEB4B0];
      v19 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
      v20 = &selRef_orderedReasons;
      while (2)
      {
        v21 = 0;
        v22 = v20;
        do
        {
          if (*(_QWORD *)v56 != v17)
            objc_enumerationMutation(v15);
          v23 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v21);
          -[NSMapTable objectForKey:](v15, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "convertPoint:fromCoordinateSpace:", v11, v54, v53);
          v26 = v25;
          v28 = v27;
          v29 = v19;
          v30 = v18;
          v32 = v51;
          v31 = v52;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v24, "pointerInteractionHitTestInsetsForView:", v23);
            v31 = v33;
            v32 = v34;
            v30 = v35;
            v29 = v36;
          }
          objc_msgSend(v23, "bounds");
          v62.origin.x = v32 + v37;
          v62.origin.y = v31 + v38;
          v39 = v29 + v32;
          v62.size.width = v40 - v39;
          v41 = v30 + v31;
          v62.size.height = v42 - v41;
          v61.x = v26;
          v61.y = v28;
          if (CGRectContainsPoint(v62, v61)
            && objc_msgSend(v24, "shouldBeginPointerInteractionRequest:atLocation:forView:", v9, v23, v26, v28))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v24, "regionAtLocation:forView:", v23, v26, v28);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v23);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = (void *)MEMORY[0x1E0CEA870];
              objc_msgSend(v23, "bounds");
              objc_msgSend(v44, "regionWithRect:identifier:", v43, v32 + v45, v31 + v46, v47 - v39, v48 - v41);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v8 = v50;
            objc_msgSend(v16, "setReferenceView:", v23);

            goto LABEL_21;
          }

          v21 = (char *)v21 + 1;
        }
        while (v16 != v21);
        v16 = (void *)-[NSMapTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        v20 = v22;
        if (v16)
          continue;
        break;
      }
      v8 = v50;
    }
LABEL_21:

  }
  else
  {
    SBLogSystemGesture();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[SBSystemPointerInteractionManager pointerInteraction:window:regionForRequest:defaultRegion:].cold.1(v11);
    v16 = 0;
  }

  return v16;
}

- (id)pointerInteraction:(id)a3 window:(id)a4 styleForRegion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a5;
  objc_msgSend(v6, "referenceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_registeredViewsToDelegates, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "styleForRegion:forView:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", v7);
    objc_msgSend(MEMORY[0x1E0CEA848], "effectWithPreview:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v11, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)pointerInteraction:(id)a3 window:(id)a4 willEnterRegion:(id)a5 animator:(id)a6
{
  UIView *v7;
  UIView *activePointerRegionView;

  objc_msgSend(a5, "referenceView", a3, a4);
  v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  activePointerRegionView = self->_activePointerRegionView;
  self->_activePointerRegionView = v7;

}

- (void)pointerInteraction:(id)a3 window:(id)a4 willExitRegion:(id)a5 animator:(id)a6
{
  UIView *activePointerRegionView;
  id v8;
  void *v9;
  id v10;

  activePointerRegionView = self->_activePointerRegionView;
  self->_activePointerRegionView = 0;
  v8 = a5;

  objc_msgSend(v8, "referenceView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_registeredViewsToDelegates, "objectForKey:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "pointerWillExitRegion");

}

- (UIView)activePointerRegionView
{
  return self->_activePointerRegionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePointerRegionView, 0);
  objc_storeStrong((id *)&self->_multiDisplayUserInteractionCoordinator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_registeredViewsToDelegates, 0);
}

- (void)pointerInteraction:(os_log_t)log window:regionForRequest:defaultRegion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "Asking the system pointer interaction manager for a UIPointerRegion without specifying a window", v1, 2u);
}

@end
