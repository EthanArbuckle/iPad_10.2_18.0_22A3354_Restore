@implementation MSDSessionTaskManager

- (MSDSessionTaskManager)init
{
  MSDSessionTaskManager *v2;
  void *v3;
  MSDSessionTaskManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDSessionTaskManager;
  v2 = -[MSDSessionTaskManager init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    -[MSDSessionTaskManager setSharedStore:](v2, "setSharedStore:", v3);

    -[MSDSessionTaskManager setSharedStoreLock:](v2, "setSharedStoreLock:", 0);
    v4 = v2;
  }

  return v2;
}

- (id)getSessionTask:(id)a3
{
  os_unfair_lock_s *p_sharedStoreLock;
  id v5;
  void *v6;
  void *v7;

  p_sharedStoreLock = &self->_sharedStoreLock;
  v5 = a3;
  os_unfair_lock_lock(p_sharedStoreLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  os_unfair_lock_unlock(p_sharedStoreLock);
  return v7;
}

- (void)addSessionTask:(id)a3
{
  os_unfair_lock_s *p_sharedStoreLock;
  id v5;
  void *v6;
  void *v7;

  p_sharedStoreLock = &self->_sharedStoreLock;
  v5 = a3;
  os_unfair_lock_lock(p_sharedStoreLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "task"));
  objc_msgSend(v6, "setObject:forKey:", v5, v7);

  os_unfair_lock_unlock(p_sharedStoreLock);
}

- (void)removeSessionTask:(id)a3
{
  os_unfair_lock_s *p_sharedStoreLock;
  id v5;
  void *v6;
  void *v7;

  p_sharedStoreLock = &self->_sharedStoreLock;
  v5 = a3;
  os_unfair_lock_lock(p_sharedStoreLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "task"));

  objc_msgSend(v6, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(p_sharedStoreLock);
}

- (void)cancelAndRemoveAllSessionTask
{
  os_unfair_lock_s *p_sharedStoreLock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  p_sharedStoreLock = &self->_sharedStoreLock;
  os_unfair_lock_lock(&self->_sharedStoreLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

        if (!objc_msgSend(v11, "state"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "task"));
          objc_msgSend(v12, "cancel");

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
        objc_msgSend(v13, "removeObjectForKey:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_sharedStoreLock);
}

- (id)getTaskInState:(int)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = objc_alloc_init((Class)NSMutableArray);
  os_unfair_lock_lock(&self->_sharedStoreLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskManager sharedStore](self, "sharedStore"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

        if (objc_msgSend(v13, "state") == a3)
          objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_sharedStoreLock);
  return v5;
}

- (NSMapTable)sharedStore
{
  return (NSMapTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharedStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (os_unfair_lock_s)sharedStoreLock
{
  return self->_sharedStoreLock;
}

- (void)setSharedStoreLock:(os_unfair_lock_s)a3
{
  self->_sharedStoreLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedStore, 0);
}

@end
