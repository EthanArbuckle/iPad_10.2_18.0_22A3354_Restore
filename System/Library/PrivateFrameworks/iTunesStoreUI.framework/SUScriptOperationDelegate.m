@implementation SUScriptOperationDelegate

- (void)dealloc
{
  objc_super v3;

  self->_lock = 0;
  -[SUScriptOperationDelegate cancelAllOperations](self, "cancelAllOperations");

  self->_operations = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptOperationDelegate;
  -[SUScriptOperationDelegate dealloc](&v3, sel_dealloc);
}

- (void)cancelAllOperations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableArray copy](self->_operations, "copy");
  -[NSMutableArray removeAllObjects](self->_operations, "removeAllObjects");
  -[NSLock unlock](self->_lock, "unlock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setDelegate:", 0);
        objc_msgSend(v8, "setScriptOptions:", 0);
        objc_msgSend(v8, "cancel");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)enqueueOperation:(id)a3
{
  NSMutableArray *operations;

  -[NSLock lock](self->_lock, "lock");
  operations = self->_operations;
  if (!operations)
  {
    operations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_operations = operations;
  }
  -[NSMutableArray addObject:](operations, "addObject:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(a3, "setDelegate:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", a3);
}

- (void)_removeOperation:(id)a3
{
  objc_msgSend(a3, "setDelegate:", 0);
  objc_msgSend(a3, "setScriptOptions:", 0);
  -[NSLock lock](self->_lock, "lock");
  -[NSMutableArray removeObject:](self->_operations, "removeObject:", a3);
  -[NSLock unlock](self->_lock, "unlock");
}

@end
