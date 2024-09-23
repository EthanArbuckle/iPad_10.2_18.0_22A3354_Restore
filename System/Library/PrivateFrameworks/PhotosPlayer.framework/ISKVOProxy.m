@implementation ISKVOProxy

- (ISKVOProxy)initWithTarget:(id)a3 keyPaths:(id)a4 identifier:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ISKVOProxy *v15;
  ISKVOProxy *v16;
  uint64_t v17;
  NSArray *keyPaths;
  uint64_t v19;
  NSString *identifier;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ISKVOProxy;
  v15 = -[ISKVOProxy init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeStrong(&v16->_target, a3);
    v17 = objc_msgSend(v12, "copy");
    keyPaths = v16->_keyPaths;
    v16->_keyPaths = (NSArray *)v17;

    v19 = objc_msgSend(v13, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v19;

  }
  return v16;
}

- (void)startObservingTarget
{
  NSArray *v3;
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
  v3 = self->_keyPaths;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(self->_target, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 5, 0, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)stopObservingTarget
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *keyPaths;
  id target;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_keyPaths;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(self->_target, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++), (_QWORD)v10);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  keyPaths = self->_keyPaths;
  self->_keyPaths = 0;

  target = self->_target;
  self->_target = 0;

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[ISKVOProxy delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "observeChangeforKVOProxyIdentifier:keyPath:change:", self->_identifier, v9, v8);

}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_keyPaths;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(self->_target, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ISKVOProxy;
  -[ISKVOProxy dealloc](&v8, sel_dealloc);
}

- (ISKVOProxyDelegate)delegate
{
  return (ISKVOProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
