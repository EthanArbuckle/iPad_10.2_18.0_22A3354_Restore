@implementation UIDynamicBehavior

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _UISetupPhysicsKit();
}

+ (BOOL)_isPrimitiveBehavior
{
  return 0;
}

- (void)_setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (void)_setItems:(id)a3
{
  id v5;
  NSMutableArray *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  NSMutableArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_items;
  -[UIDynamicBehavior _context](self, "_context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v6;
    v8 = v6;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      v12 = 1;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((objc_msgSend(v5, "containsObject:", v14) & 1) != 0)
            v12 = 0;
          else
            -[UIDynamicBehavior _reattachAutolayoutToItemIfNecessary:](self, "_reattachAutolayoutToItemIfNecessary:", v14);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }
    else
    {
      v12 = 1;
    }

    objc_storeStrong((id *)&self->_items, a3);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v5;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
          if ((v12 & 1) != 0
            || (-[NSMutableArray containsObject:](v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j)) & 1) == 0)
          {
            -[UIDynamicBehavior _detachAutolayoutFromItemIfNecessary:](self, "_detachAutolayoutFromItemIfNecessary:", v20);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

    v6 = v21;
  }
  else
  {
    objc_storeStrong((id *)&self->_items, a3);
  }

}

- (void)_addItem:(id)a3
{
  NSMutableArray *items;
  id v5;

  items = self->_items;
  v5 = a3;
  -[NSMutableArray addObject:](items, "addObject:", v5);
  -[UIDynamicBehavior _detachAutolayoutFromItemIfNecessary:](self, "_detachAutolayoutFromItemIfNecessary:", v5);

}

- (void)_removeItem:(id)a3
{
  id v4;

  v4 = a3;
  -[UIDynamicBehavior _reattachAutolayoutToItemIfNecessary:](self, "_reattachAutolayoutToItemIfNecessary:", v4);
  -[NSMutableArray removeObject:](self->_items, "removeObject:", v4);

}

- (id)_items
{
  return self->_items;
}

- (id)_context
{
  return objc_loadWeakRetained((id *)&self->_context);
}

- (UIDynamicAnimator)dynamicAnimator
{
  return (UIDynamicAnimator *)objc_loadWeakRetained((id *)&self->_context);
}

- (id)items
{
  return 0;
}

- (UIDynamicBehavior)init
{
  UIDynamicBehavior *v2;
  int v3;
  NSMutableArray *v4;
  NSMutableArray *items;
  NSMutableArray *addedBehaviors;
  NSMutableArray *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIDynamicBehavior;
  v2 = -[UIDynamicBehavior init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend((id)objc_opt_class(), "_isPrimitiveBehavior");
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v3)
    {
      items = v2->_items;
      v2->_items = v4;
    }
    else
    {
      addedBehaviors = v2->_addedBehaviors;
      v2->_addedBehaviors = v4;

      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      items = v2->_behaviors;
      v2->_behaviors = v7;
    }

  }
  return v2;
}

- (void)willMoveToAnimator:(UIDynamicAnimator *)dynamicAnimator
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_items;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "_wantsAutolayout", (_QWORD)v12))
        {
          if (dynamicAnimator)
          {
            if (v9)
            {
              v10 = objc_msgSend(v9, "_disableLayoutFlushingCount");
              if (v10 >= 1)
                v11 = v10 + 1;
              else
                v11 = 1;
              objc_msgSend(v9, "_setDisableLayoutFlushingCount:", v11);
              objc_msgSend(v9, "_disableLayoutFlushing");
            }
          }
          else
          {
            -[UIView _popDisableLayoutFlushing](v9);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_updateAutolayoutEngagementForItemIfNecessary:(id)a3 detach:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  char v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v12;
  if (v6)
  {
    v8 = objc_opt_respondsToSelector();
    v7 = v12;
    if ((v8 & 1) != 0)
    {
      v9 = objc_msgSend(v12, "_wantsAutolayout");
      v7 = v12;
      if (v9)
      {
        if (!v4)
        {
          -[UIView _popDisableLayoutFlushing](v12);
LABEL_11:
          v7 = v12;
          goto LABEL_12;
        }
        if (v12)
        {
          v10 = objc_msgSend(v12, "_disableLayoutFlushingCount");
          if (v10 >= 1)
            v11 = v10 + 1;
          else
            v11 = 1;
          objc_msgSend(v12, "_setDisableLayoutFlushingCount:", v11);
          objc_msgSend(v12, "_disableLayoutFlushing");
          goto LABEL_11;
        }
      }
    }
  }
LABEL_12:

}

- (void)_detachAutolayoutFromItemIfNecessary:(id)a3
{
  -[UIDynamicBehavior _updateAutolayoutEngagementForItemIfNecessary:detach:](self, "_updateAutolayoutEngagementForItemIfNecessary:detach:", a3, 1);
}

- (void)_reattachAutolayoutToItemIfNecessary:(id)a3
{
  -[UIDynamicBehavior _updateAutolayoutEngagementForItemIfNecessary:detach:](self, "_updateAutolayoutEngagementForItemIfNecessary:detach:", a3, 0);
}

- (void)_associate
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_addedBehaviors;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        objc_msgSend(WeakRetained, "_checkBehavior:", v8, (_QWORD)v11);

        v10 = objc_loadWeakRetained((id *)&self->_context);
        objc_msgSend(v10, "_registerBehavior:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_addedBehaviors, "removeAllObjects");
}

- (void)_dissociate
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  UIDynamicAnimator **p_context;
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
  -[NSMutableArray addObjectsFromArray:](self->_addedBehaviors, "addObjectsFromArray:", self->_behaviors);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_behaviors;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    p_context = &self->_context;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained((id *)p_context);
        objc_msgSend(WeakRetained, "_unregisterBehavior:", v9, (_QWORD)v11);

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (BOOL)allowsAnimatorToStop
{
  char v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)objc_opt_class(), "_isPrimitiveBehavior") & 1) != 0)
    return 0;
  if (!-[NSMutableArray count](self->_behaviors, "count"))
  {
    -[UIDynamicBehavior action](self, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      return 0;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_behaviors;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v3 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((v3 & 1) != 0)
          v3 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "allowsAnimatorToStop", (_QWORD)v11);
        else
          v3 = 0;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)addChildBehavior:(UIDynamicBehavior *)behavior
{
  id WeakRetained;
  id v5;
  id v6;
  UIDynamicBehavior *v7;

  v7 = behavior;
  if ((-[NSMutableArray containsObject:](self->_behaviors, "containsObject:") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);

    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)&self->_context);
      objc_msgSend(v5, "_checkBehavior:", v7);

      v6 = objc_loadWeakRetained((id *)&self->_context);
      objc_msgSend(v6, "_registerBehavior:", v7);

    }
    else
    {
      -[NSMutableArray addObject:](self->_addedBehaviors, "addObject:", v7);
    }
    -[NSMutableArray addObject:](self->_behaviors, "addObject:", v7);
  }

}

- (void)removeChildBehavior:(UIDynamicBehavior *)behavior
{
  id WeakRetained;
  id v5;
  UIDynamicBehavior *v6;

  v6 = behavior;
  if (-[NSMutableArray containsObject:](self->_behaviors, "containsObject:"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);

    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)&self->_context);
      objc_msgSend(v5, "_unregisterBehavior:", v6);

    }
    else
    {
      -[NSMutableArray removeObject:](self->_addedBehaviors, "removeObject:", v6);
    }
    -[NSMutableArray removeObject:](self->_behaviors, "removeObject:", v6);
  }

}

- (NSArray)childBehaviors
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_behaviors);
}

- (void)_changedParameterForBody:(id)a3
{
  id v4;

  objc_msgSend(a3, "setResting:", 0);
  -[UIDynamicBehavior _context](self, "_context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_tickle");

}

- (id)_itemsDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  UIDynamicBehavior *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[UIDynamicBehavior _items](self, "_items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return &stru_1E16EDF20;
  -[UIDynamicBehavior _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < 4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = self;
    -[UIDynamicBehavior _items](self, "_items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16);
          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("%@:%p"), v20, v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v21);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

    v22 = (void *)MEMORY[0x1E0CB3940];
    -[UIDynamicBehavior _items](v27, "_items");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("(%lu items: [%@])"), v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    return v26;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[UIDynamicBehavior _items](self, "_items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("(%lu items)"), objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)UIDynamicBehavior;
  -[UIDynamicBehavior description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIDynamicBehavior allowsAnimatorToStop](self, "allowsAnimatorToStop"))
    objc_msgSend(v5, "appendString:", CFSTR(" (Stoppable)"));
  if (self->_action)
    objc_msgSend(v5, "appendString:", CFSTR(" (A)"));
  return v5;
}

- (void)action
{
  return self->_action;
}

- (void)setAction:(void *)action
{
  objc_setProperty_nonatomic_copy(self, a2, action, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_addedBehaviors, 0);
  objc_storeStrong((id *)&self->_behaviors, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end
