@implementation _UIClientToHostRelationshipGestureInteraction

- (void)willMoveToView:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_gestureRecognizers;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
          WeakRetained = objc_loadWeakRetained((id *)&self->_view);
          objc_msgSend(WeakRetained, "removeGestureRecognizer:", v9, (_QWORD)v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    -[_UIClientToHostRelationshipGestureInteraction _invalidatePointerPauseAssertion](self, "_invalidatePointerPauseAssertion");
  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_view = &self->_view;
  v6 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_gestureRecognizers;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
          WeakRetained = objc_loadWeakRetained((id *)p_view);
          objc_msgSend(WeakRetained, "addGestureRecognizer:", v12, (_QWORD)v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)addGestureRecognizer:(id)a3
{
  id v4;
  NSMutableArray *gestureRecognizers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id WeakRetained;
  id v9;

  v4 = a3;
  gestureRecognizers = self->_gestureRecognizers;
  v9 = v4;
  if (!gestureRecognizers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_gestureRecognizers;
    self->_gestureRecognizers = v6;

    v4 = v9;
    gestureRecognizers = self->_gestureRecognizers;
  }
  -[NSMutableArray addObject:](gestureRecognizers, "addObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "addGestureRecognizer:", v9);

  objc_msgSend(v9, "addTarget:action:", self, sel__wrappedRecognizerDidRecognize_);
  objc_msgSend(v9, "setDelegate:", self);

}

- (_UIClientToHostRelationshipGestureInteraction)initWithHostIdentifier:(id)a3
{
  id v5;
  _UIClientToHostRelationshipGestureInteraction *v6;
  _UIClientToHostRelationshipGestureInteraction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIClientToHostRelationshipGestureInteraction;
  v6 = -[_UIClientToHostRelationshipGestureInteraction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_hostIdentifier, a3);

  return v7;
}

+ (id)_hostGestureRecognizersForFailureRelationshipsWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (_MergedGlobals_1183 != -1)
    dispatch_once(&_MergedGlobals_1183, &__block_literal_global_432);
  objc_msgSend((id)qword_1ECD7F740, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD7F740, "setObject:forKey:", v4, v3);
  }

  return v4;
}

+ (id)hostGestureRecognizerForFailureRelationshipsWithIdentifier:(id)a3
{
  id v4;
  _UIRelationshipGestureRecognizer *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[_UIRelationshipGestureRecognizer initWithTarget:action:]([_UIRelationshipGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientRelationshipGestureRecognizer:%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer setName:](v5, "setName:", v6);

  -[_UIRelationshipGestureRecognizer setSucceedsOnTouchesEnded:](v5, "setSucceedsOnTouchesEnded:", 1);
  -[_UIRelationshipGestureRecognizer setFailsOnTouchesCancelled:](v5, "setFailsOnTouchesCancelled:", 0);
  objc_msgSend(a1, "_hostGestureRecognizersForFailureRelationshipsWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v5);
  return v5;
}

+ (void)dispatchGestureRecognizerStateChange:(int64_t)a3 toHostGestureWithIdentifier:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    objc_msgSend(a1, "_hostGestureRecognizersForFailureRelationshipsWithIdentifier:", a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_fail");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)removeGestureRecognizer:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(v4, "removeTarget:action:", self, sel__wrappedRecognizerDidRecognize_);
  -[NSMutableArray removeObject:](self->_gestureRecognizers, "removeObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "removeGestureRecognizer:", v4);

}

- (void)_invalidatePointerPauseAssertion
{
  _UIAssertion *pointerUpdatePauseAssertion;

  -[_UIAssertion _invalidate](self->_pointerUpdatePauseAssertion, "_invalidate");
  pointerUpdatePauseAssertion = self->_pointerUpdatePauseAssertion;
  self->_pointerUpdatePauseAssertion = 0;

}

- (void)_wrappedRecognizerDidRecognize:(id)a3
{
  id WeakRetained;
  void *v5;
  _UIClientToHostGestureChangeAction *v6;
  void *v7;
  _UIClientToHostGestureChangeAction *v8;
  void *v9;
  int v10;
  void *v11;
  _UIAssertion *v12;
  _UIAssertion *pointerUpdatePauseAssertion;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "state") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [_UIClientToHostGestureChangeAction alloc];
    -[_UIClientToHostRelationshipGestureInteraction hostIdentifier](self, "hostIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_UIClientToHostGestureChangeAction initWithHostGestureIdentifier:changeToState:](v6, "initWithHostGestureIdentifier:changeToState:", v7, objc_msgSend(v14, "state"));

    objc_msgSend(v5, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sendClientToHostAction:", v8);

    if (v10)
    {
      -[_UIAssertion _invalidate](self->_pointerUpdatePauseAssertion, "_invalidate");
      +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "obtainPointerUpdatePauseAssertion");
      v12 = (_UIAssertion *)objc_claimAutoreleasedReturnValue();
      pointerUpdatePauseAssertion = self->_pointerUpdatePauseAssertion;
      self->_pointerUpdatePauseAssertion = v12;

    }
  }
  else if (objc_msgSend(v14, "state") == 3 || objc_msgSend(v14, "state") == 5 || objc_msgSend(v14, "state") == 4)
  {
    -[_UIClientToHostRelationshipGestureInteraction performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__invalidatePointerPauseAssertion, 0, 0.5);
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5;
  void *v7;

  v5 = a3;
  if (-[NSMutableArray containsObject:](self->_gestureRecognizers, "containsObject:", v5)
    && objc_msgSend(v5, "_requiresSystemGesturesToFail"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIClientToHostRelationshipGestureInteraction.m"), 177, CFSTR("Wrapped recognizer for %@ must have requiresSystemGesturesToFail=NO, otherwise we'll be stuck waiting for the relationship recognizer to fail, causing a deadlock."), self);

  }
  return 1;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (NSArray)gestureRecognizers
{
  return &self->_gestureRecognizers->super;
}

- (_UIAssertion)pointerUpdatePauseAssertion
{
  return self->_pointerUpdatePauseAssertion;
}

- (void)setPointerUpdatePauseAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_pointerUpdatePauseAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerUpdatePauseAssertion, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
}

@end
