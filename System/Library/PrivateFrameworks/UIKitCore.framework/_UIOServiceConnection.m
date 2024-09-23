@implementation _UIOServiceConnection

+ (id)connectionWithBSServiceConnection:(id)a3 toServer:(id)a4
{
  id v5;
  id v6;
  id *v7;

  v5 = a4;
  v6 = a3;
  v7 = (id *)objc_opt_new();
  objc_storeWeak(v7 + 2, v6);

  objc_storeWeak(v7 + 3, v5);
  return v7;
}

- (int64_t)pid
{
  id WeakRetained;
  void *v3;
  void *v4;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "auditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "versionedPID");

  return v5;
}

- (NSString)bundleIdentifier
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)performOverlayServerAction:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if ((objc_msgSend(v4, "isPermitted") & 1) != 0)
  {
    objc_msgSend(v4, "performActionFromConnection:", self);
  }
  else
  {
    UIOLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Action is not permitted. Check implementation of -isPermitted.", v6, 2u);
    }

  }
}

- (void)sendAction:(id)a3
{
  BSServiceConnectionHost **p_connection;
  id v4;
  void *v5;
  id WeakRetained;

  p_connection = &self->_connection;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performOverlayClientAction:", v4);

}

- (BOOL)clientHasEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[_UIOServiceConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", v4);

  return v8;
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

- (void)removeAllObservers
{
  -[NSHashTable removeAllObjects](self->_observers, "removeAllObjects");
}

- (void)serviceConnectionDidInvalidate
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "serviceConnectionDidInvalidate:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (unint64_t)hash
{
  id WeakRetained;
  uint64_t v4;
  id v5;
  unint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v4 = objc_msgSend(WeakRetained, "hash");
  v5 = objc_loadWeakRetained((id *)&self->_server);
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (BSServiceConnectionHost)connection
{
  return (BSServiceConnectionHost *)objc_loadWeakRetained((id *)&self->_connection);
}

- (UIOServer)server
{
  return (UIOServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
