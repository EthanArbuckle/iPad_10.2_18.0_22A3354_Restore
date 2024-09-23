@implementation _UISwipePropertyAnimator

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return -[NSHashTable containsObject:](self->_viewsToAnimateAdditively, "containsObject:", a3, a4);
}

- (void)addViewsToAnimateAdditively:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *viewsToAnimateAdditively;
  id v7;
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
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (!self->_viewsToAnimateAdditively)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      viewsToAnimateAdditively = self->_viewsToAnimateAdditively;
      self->_viewsToAnimateAdditively = v5;

    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v4;
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
          -[NSHashTable addObject:](self->_viewsToAnimateAdditively, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UISwipePropertyAnimator;
  v4 = -[UIViewPropertyAnimator copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[NSHashTable copy](self->_viewsToAnimateAdditively, "copy");
    v6 = (void *)v4[32];
    v4[32] = v5;

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsToAnimateAdditively, 0);
}

@end
