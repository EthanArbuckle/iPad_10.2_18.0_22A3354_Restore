@implementation PTOutlet

- (id)addAction:(id)a3
{
  void *v4;
  unint64_t nextToken;
  id v6;
  void *v7;
  NSMutableDictionary *actionsByToken;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  nextToken = self->_nextToken;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", nextToken);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  actionsByToken = self->_actionsByToken;
  ++self->_nextToken;
  v9 = (void *)objc_msgSend(v6, "copy");

  v10 = (void *)MEMORY[0x1BCCC265C](v9);
  -[NSMutableDictionary setObject:forKey:](actionsByToken, "setObject:forKey:", v10, v7);

  return v7;
}

- (void)removeActionForToken:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_actionsByToken, "removeObjectForKey:", a3);
}

- (id)_init
{
  PTOutlet *v2;
  PTOutlet *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *actionsByToken;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTOutlet;
  v2 = -[PTOutlet init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_nextToken = 1;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    actionsByToken = v3->_actionsByToken;
    v3->_actionsByToken = v4;

  }
  return v3;
}

- (void)_invokeActions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(void);
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
  -[NSMutableDictionary allKeys](self->_actionsByToken, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[NSMutableDictionary objectForKey:](self->_actionsByToken, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v8[2]();

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByToken, 0);
}

@end
