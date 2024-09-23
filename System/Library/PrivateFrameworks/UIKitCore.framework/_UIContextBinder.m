@implementation _UIContextBinder

- (id)_enrolledBindablePointersAsCopy:(BOOL)a3
{
  NSPointerArray *enrolledBindables;
  NSPointerArray *v5;

  enrolledBindables = self->_enrolledBindables;
  if (a3)
    return (id)-[NSPointerArray copy](enrolledBindables, "copy");
  v5 = enrolledBindables;
  return v5;
}

- (id)_attachedBindablePointersAsCopy:(BOOL)a3
{
  NSPointerArray *attachedBindables;
  NSPointerArray *v5;

  attachedBindables = self->_attachedBindables;
  if (a3)
    return (id)-[NSPointerArray copy](attachedBindables, "copy");
  v5 = attachedBindables;
  return v5;
}

- (NSArray)attachedBindables
{
  return -[NSPointerArray allObjects](self->_attachedBindables, "allObjects");
}

- (BOOL)bindableIsTopmostAttached:(id)a3
{
  id v4;
  NSPointerArray *attachedBindables;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  attachedBindables = self->_attachedBindables;
  if (-[NSPointerArray count](attachedBindables, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = -[NSPointerArray pointerAtIndex:](attachedBindables, "pointerAtIndex:", v6);
      if (v8)
      {
        if ((id)v8 == v4)
        {
          v9 = v7 == 0;
          goto LABEL_9;
        }
        ++v7;
      }
      ++v6;
    }
    while (v6 < -[NSPointerArray count](attachedBindables, "count"));
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)detachBindable:(id)a3
{
  id v5;
  _UIContextBinder *v6;
  NSPointerArray *attachedBindables;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(v5, "_contextBinder");
  v6 = (_UIContextBinder *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContextBinder.m"), 151, CFSTR("Cannot detach bindable in a binder which doesn't own it"));

  }
  v10 = v5;
  attachedBindables = self->_attachedBindables;
  if (-[NSPointerArray count](attachedBindables, "count"))
  {
    v8 = 0;
    while (-[NSPointerArray pointerAtIndex:](attachedBindables, "pointerAtIndex:", v8) != v10)
    {
      if (++v8 >= -[NSPointerArray count](attachedBindables, "count"))
        goto LABEL_10;
    }
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSPointerArray removePointerAtIndex:](attachedBindables, "removePointerAtIndex:", v8);
      -[NSPointerArray compact](attachedBindables, "compact");
    }
  }
LABEL_10:

  __UIContextBinderDetachContext(self, v10);
}

- (void)updateBindable:(id)a3
{
  id v5;
  _UIContextBinder *v6;
  NSPointerArray *attachedBindables;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(v5, "_contextBinder");
  v6 = (_UIContextBinder *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContextBinder.m"), 157, CFSTR("Cannot update bindable in a binder which doesn't own it"));

  }
  v10 = v5;
  attachedBindables = self->_attachedBindables;
  if (-[NSPointerArray count](attachedBindables, "count"))
  {
    v8 = 0;
    while (-[NSPointerArray pointerAtIndex:](attachedBindables, "pointerAtIndex:", v8) != v10)
    {
      if (++v8 >= -[NSPointerArray count](attachedBindables, "count"))
        goto LABEL_7;
    }

    __UIContextBinderAttachContext(self, v10);
  }
  else
  {
LABEL_7:

  }
}

- (void)createContextsWithTest:(id)a3 creationAction:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _UIContextBinder *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, id))a4;
  -[_UIContextBinder updateBindableOrderWithTest:](self, "updateBindableOrderWithTest:", a3);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_UIContextBinder enrolledBindables](self, "enrolledBindables", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = self;
        v14 = v12;
        if (-[_UIContextBinder permitContextCreationForBindable:](v13, "permitContextCreationForBindable:", v14))
        {
          -[_UIContextBinder _contextForBindable:](v13, "_contextForBindable:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableOrderedSet removeObject:](self->_contexts, "removeObject:", v15);
          -[NSMutableOrderedSet addObject:](self->_contexts, "addObject:", v15);

        }
        if (v6)
          v6[2](v6, v14);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (NSArray)enrolledBindables
{
  return -[NSPointerArray allObjects](self->_enrolledBindables, "allObjects");
}

- (void)updateBindableOrderWithTest:(id)a3
{
  -[_UIContextBinder updateBindableOrderWithTest:force:](self, "updateBindableOrderWithTest:force:", a3, 0);
}

- (void)updateBindableOrderWithTest:(id)a3 force:(BOOL)a4
{
  unsigned int (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _UIContextBinder *v14;
  id v15;
  BOOL v16;
  void *v17;
  char v18;
  uint64_t v19;
  id obj;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned int (**)(id, _QWORD))a3;
  if (a4 || -[_UIContextBinder contextManagementPolicy](self, "contextManagementPolicy") != 1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[_UIContextBinder attachedBindables](self, "attachedBindables");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v8;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (!v9)
      goto LABEL_26;
    v10 = v9;
    v11 = *(_QWORD *)v23;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
        if (!v6 || v6[2](v6, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12)))
        {
          objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
          v14 = self;
          v15 = v13;
          v16 = -[_UIContextBinder permitContextCreationForBindable:](v14, "permitContextCreationForBindable:", v15);
          if (v16)
          {
            -[_UIContextBinder _contextForBindable:](v14, "_contextForBindable:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableOrderedSet removeObject:](self->_contexts, "removeObject:", v17);
            -[NSMutableOrderedSet addObject:](self->_contexts, "addObject:", v17);

            if (v17)
            {
              __UIContextBinderAttachContext(v14, v15);
              objc_msgSend(v15, "_boundContext");
              v14 = (_UIContextBinder *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                objc_msgSend(v15, "_bindingDescription");
                if (v21)
                {
                  -[_UIContextBinder orderAbove:](v14, "orderAbove:", 0);
                  LODWORD(v15) = 1;
                  goto LABEL_17;
                }
LABEL_16:
                LODWORD(v15) = 0;
              }
              else
              {
                v21 = 0;
              }
LABEL_17:
              v18 = !v16;

            }
            else
            {
              LODWORD(v15) = 0;
              v18 = 1;
            }
            objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
            if ((v18 & 1) == 0 && (_DWORD)v15)
              objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
            goto LABEL_21;
          }

          goto LABEL_16;
        }
LABEL_21:
        ++v12;
      }
      while (v10 != v12);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v10 = v19;
      if (!v19)
      {
LABEL_26:

        break;
      }
    }
  }

}

- (BOOL)permitContextCreationForBindable:(id)a3
{
  id v4;
  char v5;
  id WeakRetained;
  _QWORD v8[3];

  v4 = a3;
  -[NSPointerArray compact](self->_enrolledBindables, "compact");
  if (-[NSPointerArray count](self->_enrolledBindables, "count"))
  {
    if (-[_UIContextBinder contextManagementPolicy](self, "contextManagementPolicy") == 1)
    {
      v5 = 1;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_contextCreationPolicyHolder);
      if (v4)
        objc_msgSend(v4, "_bindingDescription");
      else
        memset(v8, 0, sizeof(v8));
      v5 = objc_msgSend(WeakRetained, "_permitContextCreationForBindingDescription:", v8);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)contextManagementPolicy
{
  return self->_contextManagementPolicy;
}

- (void)attachBindable:(id)a3
{
  id v5;
  _UIContextBinder *v6;
  _UIContextBinder *v7;
  id v8;
  NSPointerArray *attachedBindables;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  objc_msgSend(v5, "_contextBinder");
  v6 = (_UIContextBinder *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContextBinder.m"), 142, CFSTR("Cannot attach bindable in a binder which doesn't own it"));

  }
  v7 = self;
  v8 = v5;
  attachedBindables = v7->_attachedBindables;
  if (-[NSPointerArray count](attachedBindables, "count"))
  {
    v10 = 0;
    while (-[NSPointerArray pointerAtIndex:](attachedBindables, "pointerAtIndex:", v10) != v8)
    {
      if (++v10 >= -[NSPointerArray count](attachedBindables, "count"))
        goto LABEL_10;
    }
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSPointerArray removePointerAtIndex:](attachedBindables, "removePointerAtIndex:", v10);
      -[NSPointerArray compact](attachedBindables, "compact");
    }
  }
LABEL_10:
  -[NSPointerArray insertPointer:atIndex:](v7->_attachedBindables, "insertPointer:atIndex:", v8, 0);

  __UIContextBinderDetachContext(v7, v8);
  v11 = v7;
  v14 = v8;
  if ((objc_msgSend(v11, "permitContextCreationForBindable:") & 1) != 0)
  {
    objc_msgSend(v11, "_contextForBindable:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11[4], "removeObject:", v12);
    objc_msgSend(v11[4], "addObject:", v12);

    if (v12)
      __UIContextBinderAttachContext(v11, v14);
  }
  else
  {

  }
}

- (_UIContextBinding)substrate
{
  return self->_substrate;
}

- (id)_contextForBindable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_boundContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)objc_opt_class();
    -[_UIContextBinder substrate](self, "substrate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createContextForBindable:withSubstrate:", v4, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_setBoundContext:", v5);
    if (os_variant_has_internal_diagnostics())
    {
      v9 = _contextForBindable____s_category;
      if (!_contextForBindable____s_category)
      {
        v9 = __UILogCategoryGetNode("ContextCreation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&_contextForBindable____s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = 138412802;
        v13 = v5;
        v14 = 1024;
        v15 = objc_msgSend(v5, "contextId");
        v16 = 2112;
        v17 = v4;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "Created CAContext: %@; contextId: 0x%X; bindable: %@",
          (uint8_t *)&v12,
          0x1Cu);

      }
    }
  }

  return v5;
}

+ (id)createContextForBindable:(id)a3 withSubstrate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  if (v5)
    objc_msgSend(v5, "_bindingDescription");
  v7 = (void *)objc_opt_new();
  +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "displayIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithUnsignedInt:", objc_msgSend(v11, "displayID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v12, *MEMORY[0x1E0CD2A18]);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v13, *MEMORY[0x1E0CD2A28]);

  objc_msgSend(v5, "_contextOptionsWithInitialOptions:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  __UIKIT_IS_REQUESTING_A_CACONTEXT_FROM_COREANIMATION(0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCommitPriority:", 100);
  if (v5)
  {
    objc_msgSend(v5, "_bindableLevel");
    *(float *)&v17 = v17;
    objc_msgSend(v16, "setLevel:", v17);
    objc_msgSend(v5, "_bindingLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLayer:", v18);

  }
  return v16;
}

- (void)enrollBindable:(id)a3
{
  id v4;
  _UIContextBinder *v5;
  _UIContextBinder *v6;
  _UIContextBinder *v7;
  id v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "_contextBinder");
  v5 = (_UIContextBinder *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != self)
  {
    -[_UIContextBinder expellBindable:](v5, "expellBindable:", v4);
    -[NSPointerArray addPointer:](self->_enrolledBindables, "addPointer:", v4);
    -[NSPointerArray addPointer:](self->_enrolledUnsafeUnretainedBindables, "addPointer:", v4);
    objc_msgSend(v4, "_setContextBinder:", self);
    if (v4)
    {
      objc_msgSend(v4, "_bindingDescription");
      if (v10)
      {
        v7 = self;
        v8 = v4;
        if (-[_UIContextBinder permitContextCreationForBindable:](v7, "permitContextCreationForBindable:", v8))
        {
          -[_UIContextBinder _contextForBindable:](v7, "_contextForBindable:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableOrderedSet removeObject:](v7->_contexts, "removeObject:", v9);
          -[NSMutableOrderedSet addObject:](v7->_contexts, "addObject:", v9);

        }
      }
    }
  }

}

- (void)setContextCreationPolicyHolder:(id)a3
{
  objc_storeWeak((id *)&self->_contextCreationPolicyHolder, a3);
}

- (_UIContextBinder)initWithSubstrate:(id)a3
{
  id v5;
  _UIContextBinder *v6;
  _UIContextBinder *v7;
  uint64_t v8;
  NSPointerArray *enrolledBindables;
  uint64_t v10;
  NSPointerArray *enrolledUnsafeUnretainedBindables;
  uint64_t v12;
  NSPointerArray *attachedBindables;
  uint64_t v14;
  NSMutableOrderedSet *contexts;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIContextBinder;
  v6 = -[_UIContextBinder init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_substrate, a3);
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v8 = objc_claimAutoreleasedReturnValue();
    enrolledBindables = v7->_enrolledBindables;
    v7->_enrolledBindables = (NSPointerArray *)v8;

    objc_msgSend(MEMORY[0x1E0CB3868], "pointerArrayWithOptions:", 2);
    v10 = objc_claimAutoreleasedReturnValue();
    enrolledUnsafeUnretainedBindables = v7->_enrolledUnsafeUnretainedBindables;
    v7->_enrolledUnsafeUnretainedBindables = (NSPointerArray *)v10;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v12 = objc_claimAutoreleasedReturnValue();
    attachedBindables = v7->_attachedBindables;
    v7->_attachedBindables = (NSPointerArray *)v12;

    v14 = objc_opt_new();
    contexts = v7->_contexts;
    v7->_contexts = (NSMutableOrderedSet *)v14;

  }
  return v7;
}

- (void)setContextManagementPolicy:(int64_t)a3
{
  self->_contextManagementPolicy = a3;
  if (a3 == 1)
  {
    -[_UIContextBinder updateBindableOrderWithTest:force:](self, "updateBindableOrderWithTest:force:", 0, 1);
  }
  else if (!a3)
  {
    -[_UIContextBinder purgeContextsWithPurgeAction:](self, "purgeContextsWithPurgeAction:");
    -[_UIContextBinder createContextsWithTest:creationAction:](self, "createContextsWithTest:creationAction:", 0, 0);
  }
}

- (void)purgeContextsWithPurgeAction:(id)a3 afterPurgeAction:(id)a4
{
  void (**v6)(id, id);
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  NSPointerArray *attachedBindables;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, id))a3;
  v7 = (void (**)(_QWORD))a4;
  if (!-[_UIContextBinder contextManagementPolicy](self, "contextManagementPolicy"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[_UIContextBinder enrolledBindables](self, "enrolledBindables", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
          attachedBindables = self->_attachedBindables;
          if (-[NSPointerArray count](attachedBindables, "count"))
          {
            v15 = 0;
            while (-[NSPointerArray pointerAtIndex:](attachedBindables, "pointerAtIndex:", v15) != v13)
            {
              if (++v15 >= -[NSPointerArray count](attachedBindables, "count"))
                goto LABEL_11;
            }

            __UIContextBinderDetachContext(self, v13);
          }
          else
          {
LABEL_11:

          }
          __UIContextBinderDisposeContextForBindable(self, v13, 0);
          if (v6)
            v6[2](v6, v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    if (v7)
      v7[2](v7);
  }

}

- (void)purgeContextsWithPurgeAction:(id)a3
{
  -[_UIContextBinder purgeContextsWithPurgeAction:afterPurgeAction:](self, "purgeContextsWithPurgeAction:afterPurgeAction:", a3, 0);
}

- (void)expellBindable:(id)a3
{
  _UIContextBinder *v5;
  NSPointerArray *enrolledBindables;
  uint64_t v7;
  NSPointerArray *enrolledUnsafeUnretainedBindables;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "_contextBinder");
  v5 = (_UIContextBinder *)objc_claimAutoreleasedReturnValue();

  if (v5 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContextBinder.m"), 133, CFSTR("Cannot expell bindable from a binder which doesn't own it"));

  }
  -[_UIContextBinder detachBindable:](self, "detachBindable:", v11);
  __UIContextBinderDisposeContextForBindable(self, v11, 1);
  enrolledBindables = self->_enrolledBindables;
  if (-[NSPointerArray count](enrolledBindables, "count"))
  {
    v7 = 0;
    while (-[NSPointerArray pointerAtIndex:](enrolledBindables, "pointerAtIndex:", v7) != v11)
    {
      if (++v7 >= -[NSPointerArray count](enrolledBindables, "count"))
        goto LABEL_10;
    }
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSPointerArray removePointerAtIndex:](enrolledBindables, "removePointerAtIndex:", v7);
      -[NSPointerArray compact](enrolledBindables, "compact");
    }
  }
LABEL_10:
  enrolledUnsafeUnretainedBindables = self->_enrolledUnsafeUnretainedBindables;
  if (-[NSPointerArray count](enrolledUnsafeUnretainedBindables, "count"))
  {
    v9 = 0;
    while (-[NSPointerArray pointerAtIndex:](enrolledUnsafeUnretainedBindables, "pointerAtIndex:", v9) != v11)
    {
      if (++v9 >= -[NSPointerArray count](enrolledUnsafeUnretainedBindables, "count"))
        goto LABEL_17;
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSPointerArray removePointerAtIndex:](enrolledUnsafeUnretainedBindables, "removePointerAtIndex:", v9);
      -[NSPointerArray compact](enrolledUnsafeUnretainedBindables, "compact");
    }
  }
LABEL_17:
  objc_msgSend(v11, "_setContextBinder:", 0);

}

- (NSArray)enrolledUnsafeUnretainedBindables
{
  return -[NSPointerArray allObjects](self->_enrolledUnsafeUnretainedBindables, "allObjects");
}

- (BOOL)bindableEnrolled:(id)a3
{
  id v4;
  NSPointerArray *enrolledBindables;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  enrolledBindables = self->_enrolledBindables;
  if (-[NSPointerArray count](enrolledBindables, "count"))
  {
    v6 = 0;
    do
    {
      v7 = -[NSPointerArray pointerAtIndex:](enrolledBindables, "pointerAtIndex:", v6);
      v8 = v7 == (_QWORD)v4;
      if ((id)v7 == v4)
        break;
      ++v6;
    }
    while (v6 < -[NSPointerArray count](enrolledBindables, "count"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)recreateContextForBindable:(id)a3
{
  _BOOL4 v4;
  void *v5;
  id v6;
  NSPointerArray *attachedBindables;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = -[_UIContextBinder bindableEnrolled:](self, "bindableEnrolled:", v9);
  v5 = v9;
  if (v4)
  {
    v6 = v9;
    attachedBindables = self->_attachedBindables;
    if (-[NSPointerArray count](attachedBindables, "count"))
    {
      v8 = 0;
      while (-[NSPointerArray pointerAtIndex:](attachedBindables, "pointerAtIndex:", v8) != v6)
      {
        if (++v8 >= -[NSPointerArray count](attachedBindables, "count"))
          goto LABEL_6;
      }

      __UIContextBinderDetachContext(self, v6);
      __UIContextBinderDisposeContextForBindable(self, v6, 1);
      -[_UIContextBinder updateBindableOrderWithTest:force:](self, "updateBindableOrderWithTest:force:", 0, 1);
    }
    else
    {
LABEL_6:

    }
    v5 = v9;
  }

}

- (_UIContextBinderContextCreationPolicyHolding)contextCreationPolicyHolder
{
  return (_UIContextBinderContextCreationPolicyHolding *)objc_loadWeakRetained((id *)&self->_contextCreationPolicyHolder);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextCreationPolicyHolder);
  objc_storeStrong((id *)&self->_substrate, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_attachedBindables, 0);
  objc_storeStrong((id *)&self->_enrolledUnsafeUnretainedBindables, 0);
  objc_storeStrong((id *)&self->_enrolledBindables, 0);
}

@end
