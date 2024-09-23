@implementation SSKDisplaySource

- (SSKDisplaySource)init
{
  void *v3;
  SSKDisplaySource *v4;

  objc_msgSend(MEMORY[0x24BE38058], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SSKDisplaySource initWithDisplayManager:](self, "initWithDisplayManager:", v3);

  return v4;
}

- (SSKDisplaySource)initWithDisplayManager:(id)a3
{
  id v6;
  SSKDisplaySource *v7;
  SSKDisplaySource *v8;
  NSMutableSet *v9;
  NSMutableSet *lock_observers;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplaySource.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayManager"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SSKDisplaySource;
  v7 = -[SSKDisplaySource init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_displayManager, a3);
    -[FBDisplayManager addObserver:](v8->_displayManager, "addObserver:", v8);
    v8->_lock._os_unfair_lock_opaque = 0;
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    lock_observers = v8->_lock_observers;
    v8->_lock_observers = v9;

  }
  return v8;
}

- (FBSDisplayIdentity)mainIdentity
{
  return (FBSDisplayIdentity *)-[FBDisplayManager mainIdentity](self->_displayManager, "mainIdentity");
}

- (FBSDisplayConfiguration)mainConfiguration
{
  return (FBSDisplayConfiguration *)-[FBDisplayManager mainConfiguration](self->_displayManager, "mainConfiguration");
}

- (NSSet)connectedIdentities
{
  return (NSSet *)-[FBDisplayManager connectedIdentities](self->_displayManager, "connectedIdentities");
}

- (id)configurationForIdentity:(id)a3
{
  return (id)-[FBDisplayManager configurationForIdentity:](self->_displayManager, "configurationForIdentity:", a3);
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)updateTransformsWithCompletion:(id)a3
{
  -[FBDisplayManager updateTransformsWithCompletion:](self->_displayManager, "updateTransformsWithCompletion:", a3);
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7;
  id v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_lock_observers;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "displaySource:didConnectIdentity:withConfiguration:", self, v7, v8, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7;
  id v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_lock_observers;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "displaySource:didUpdateIdentity:withConfiguration:", self, v7, v8, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_lock_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "displaySource:willDisconnectIdentity:", self, v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
}

@end
