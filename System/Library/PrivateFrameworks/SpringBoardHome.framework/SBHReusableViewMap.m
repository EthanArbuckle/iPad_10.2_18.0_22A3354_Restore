@implementation SBHReusableViewMap

- (SBHReusableViewMap)init
{
  SBHReusableViewMap *v2;
  uint64_t v3;
  NSMapTable *recycledViewsByClass;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHReusableViewMap;
  v2 = -[SBHReusableViewMap init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    recycledViewsByClass = v2->_recycledViewsByClass;
    v2->_recycledViewsByClass = (NSMapTable *)v3;

  }
  return v2;
}

- (SBHReusableViewMap)initWithDelegate:(id)a3
{
  id v4;
  SBHReusableViewMap *v5;
  SBHReusableViewMap *v6;

  v4 = a3;
  v5 = -[SBHReusableViewMap init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMapTable objectEnumerator](self->_recycledViewsByClass, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v16;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "removeFromSuperview");
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v14.receiver = self;
  v14.super_class = (Class)SBHReusableViewMap;
  -[SBHReusableViewMap dealloc](&v14, sel_dealloc);
}

- (id)viewOfClass:(Class)a3
{
  id v5;

  -[SBHReusableViewMap dequeueReusableViewOfClass:](self, "dequeueReusableViewOfClass:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = -[SBHReusableViewMap newViewOfClass:](self, "newViewOfClass:", a3);
  return v5;
}

- (id)newViewOfClass:(Class)a3
{
  void *v5;
  id v6;

  -[SBHReusableViewMap delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v5, "viewMap:makeNewViewOfClass:", self, a3), (v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = objc_alloc_init(a3);
  }

  return v6;
}

- (id)dequeueReusableViewOfClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v13;
  SBHReusableViewMap *v14;
  __int16 v15;
  Class v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSMapTable objectForKey:](self->_recycledViewsByClass, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "removeObject:", v6);
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearHasBeenCommitted");

    SBLogReusableViewCache();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218498;
      v14 = self;
      v15 = 2112;
      v16 = a3;
      v17 = 2048;
      v18 = objc_msgSend(v5, "count");
      v9 = "(%p) dequeued reusable view of class: %@ (%lu remaining)";
      v10 = v8;
      v11 = 32;
LABEL_6:
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }
  else
  {
    SBLogReusableViewCache();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218242;
      v14 = self;
      v15 = 2112;
      v16 = a3;
      v9 = "(%p) could not dequeue reusable view of class: %@";
      v10 = v8;
      v11 = 22;
      goto LABEL_6;
    }
  }

  return v6;
}

- (void)recycleView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSMapTable *recycledViewsByClass;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  SBHReusableViewMap *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[SBHReusableViewMap delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_invalidated)
    {
      v6 = 0;
    }
    else
    {
      v7 = objc_opt_class();
      -[NSMapTable objectForKey:](self->_recycledViewsByClass, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      if (v9 >= objc_msgSend(v5, "viewMap:maxRecycledViewsOfClass:", self, v7)
        || (objc_opt_respondsToSelector() & 1) != 0
        && !objc_msgSend(v5, "viewMap:shouldRecycleView:", self, v4))
      {
        SBLogReusableViewCache();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v24 = self;
          v25 = 2112;
          v26 = v7;
          v27 = 2048;
          v28 = v4;
          _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "(%p) will not recycle reusable view of class: %@/%p", buf, 0x20u);
        }
        v6 = 0;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0DC3F10];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __34__SBHReusableViewMap_recycleView___block_invoke;
        v21[3] = &unk_1E8D84C50;
        v11 = v4;
        v22 = v11;
        objc_msgSend(v10, "performWithoutAnimation:", v21);
        if (v8)
        {
          objc_msgSend(v8, "addObject:", v11);
        }
        else
        {
          recycledViewsByClass = self->_recycledViewsByClass;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](recycledViewsByClass, "setObject:forKey:", v14, v7);

        }
        SBLogReusableViewCache();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v24 = self;
          v25 = 2112;
          v26 = v7;
          v27 = 2048;
          v28 = (id)(v9 + 1);
          _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "(%p) recycled reusable view of class: %@ (%lu total)", buf, 0x20u);
        }

        v6 = 1;
        v12 = v22;
      }

    }
    objc_msgSend(v5, "recycledViewsContainerProviderForViewMap:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recycledViewsContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v6
      && v17
      && (objc_msgSend(v17, "window"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "window"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v20,
          v19,
          v19 == v20))
    {
      objc_msgSend(v18, "addSubview:", v4);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "viewMap:willDiscardView:", self, v4);
      objc_msgSend(v4, "removeFromSuperview");
    }

  }
}

uint64_t __34__SBHReusableViewMap_recycleView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareForReuse");
}

- (BOOL)isViewRecycled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[SBHReusableViewMap delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recycledViewsContainerProviderForViewMap:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recycledViewsContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = objc_msgSend(v4, "isDescendantOfView:", v7);
  else
    v8 = 0;

  return v8;
}

- (void)purgeViewsForClass:(Class)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  SBHReusableViewMap *v17;
  __int16 v18;
  Class v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  SBLogReusableViewCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v17 = self;
    v18 = 2112;
    v19 = a3;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "(%p) purge reusable views of class: %@", buf, 0x16u);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectForKey:](self->_recycledViewsByClass, "objectForKey:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "removeFromSuperview");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[NSMapTable removeObjectForKey:](self->_recycledViewsByClass, "removeObjectForKey:", a3);
}

- (void)purgeView:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  SBHReusableViewMap *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogReusableViewCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v20 = self;
    v21 = 2048;
    v22 = v4;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "(%p) purging %p / %@", buf, 0x20u);

  }
  objc_msgSend(v4, "removeFromSuperview");
  objc_msgSend(v4, "prepareForReuse");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable keyEnumerator](self->_recycledViewsByClass, "keyEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[NSMapTable objectForKey:](self->_recycledViewsByClass, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObject:", v4);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)purgeAllViews
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  SBHReusableViewMap *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  SBLogReusableViewCache();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = self;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "(%p) purge all reusable views", buf, 0xCu);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable keyEnumerator](self->_recycledViewsByClass, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[SBHReusableViewMap purgeViewsForClass:](self, "purgeViewsForClass:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMapTable removeAllObjects](self->_recycledViewsByClass, "removeAllObjects");
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  self->_invalidated = 1;
}

- (void)addRecycledViewsOfClass:(Class)a3 upToCount:(unint64_t)a4
{
  NSUInteger v7;
  unint64_t v8;
  id v9;

  v7 = -[NSMapTable count](self->_recycledViewsByClass, "count");
  v8 = a4 - v7;
  if (a4 > v7)
  {
    do
    {
      v9 = -[SBHReusableViewMap newViewOfClass:](self, "newViewOfClass:", a3);
      if (v9)
        -[SBHReusableViewMap recycleView:](self, "recycleView:", v9);

      --v8;
    }
    while (v8);
  }
}

- (void)enumerateRecycledViewsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v24 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMapTable objectEnumerator](self->_recycledViewsByClass, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v17 != v14)
                objc_enumerationMutation(v11);
              v4[2](v4, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), &v24);
              if (v24)
              {

                goto LABEL_18;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }
LABEL_18:

}

- (unint64_t)recycledViewCount
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_recycledViewsByClass;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        -[NSMapTable objectForKey:](self->_recycledViewsByClass, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "count");

      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)viewRecyclingCount
{
  return -1;
}

- (NSString)description
{
  return (NSString *)-[SBHReusableViewMap descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHReusableViewMap succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHReusableViewMap descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[SBHReusableViewMap succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHReusableViewMap recycledViewCount](self, "recycledViewCount"), CFSTR("recycledViewCount"));
  v6 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHReusableViewMap viewRecyclingCount](self, "viewRecyclingCount"), CFSTR("viewRecyclingCount"));
  return v4;
}

- (SBHReusableViewMapDelegate)delegate
{
  return (SBHReusableViewMapDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recycledViewsByClass, 0);
}

@end
