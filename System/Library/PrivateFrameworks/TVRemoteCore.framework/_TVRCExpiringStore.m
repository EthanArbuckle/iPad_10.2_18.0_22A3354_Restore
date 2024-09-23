@implementation _TVRCExpiringStore

- (_TVRCExpiringStore)init
{
  _TVRCExpiringStore *v2;
  NSMutableSet *v3;
  NSMutableSet *store;
  uint64_t v5;
  NSMapTable *identifierToBlockMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVRCExpiringStore;
  v2 = -[_TVRCExpiringStore init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    store = v2->_store;
    v2->_store = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0x10000, 50);
    identifierToBlockMap = v2->_identifierToBlockMap;
    v2->_identifierToBlockMap = (NSMapTable *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)_TVRCExpiringStore;
  -[_TVRCExpiringStore dealloc](&v3, sel_dealloc);
}

- (BOOL)containsIdentifier:(id)a3
{
  return -[NSMutableSet containsObject:](self->_store, "containsObject:", a3);
}

- (void)addIdentifier:(id)a3 withExpiration:(double)a4 completion:(id)a5
{
  id v8;
  NSMapTable *identifierToBlockMap;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  if ((-[NSMutableSet containsObject:](self->_store, "containsObject:", v11) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_store, "addObject:", v11);
    -[_TVRCExpiringStore performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__removeIdentifierAndPerformCompletion_, v11, a4);
    if (v8)
    {
      identifierToBlockMap = self->_identifierToBlockMap;
      v10 = (void *)MEMORY[0x220746068](v8);
      -[NSMapTable setObject:forKey:](identifierToBlockMap, "setObject:forKey:", v10, v11);

    }
  }

}

- (void)removeIdentifier:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x24BEDCDF0];
  v5 = a3;
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__removeIdentifierAndPerformCompletion_, v5);
  -[NSMutableSet removeObject:](self->_store, "removeObject:", v5);
  -[NSMapTable removeObjectForKey:](self->_identifierToBlockMap, "removeObjectForKey:", v5);

}

- (void)_removeIdentifierAndPerformCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableSet removeObject:](self->_store, "removeObject:", v6);
  -[NSMapTable objectForKey:](self->_identifierToBlockMap, "objectForKey:", v6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  -[NSMapTable removeObjectForKey:](self->_identifierToBlockMap, "removeObjectForKey:", v6);

}

- (NSMutableSet)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (NSMapTable)identifierToBlockMap
{
  return self->_identifierToBlockMap;
}

- (void)setIdentifierToBlockMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToBlockMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToBlockMap, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
