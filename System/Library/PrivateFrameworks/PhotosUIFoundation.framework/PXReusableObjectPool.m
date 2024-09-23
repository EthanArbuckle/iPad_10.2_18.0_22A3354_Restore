@implementation PXReusableObjectPool

- (void)checkInReusableObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "becomeReusable");
  if (self->_delegateFlags.respondsToObjectBecameReusable)
  {
    -[PXReusableObjectPool delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reusableObjectPool:objectBecameReusable:", self, v4);

  }
  v6 = objc_msgSend(v4, "_px_reuseIdentifier");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXReusableObjectPool reusableObjectsByReuseIdentifier](self, "reusableObjectsByReuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (id)v9;
    -[PXReusableObjectPool maximumPoolSizeByReuseIdentifier](self, "maximumPoolSizeByReuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    if (v13 && objc_msgSend(v10, "count") >= v13)
    {
      PFUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = 134218242;
        v16 = v13;
        v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_24430E000, v14, OS_LOG_TYPE_ERROR, "Dropping reusable object because we have reached our max pool size of %ld: %@", (uint8_t *)&v15, 0x16u);
      }

    }
    else
    {
      objc_msgSend(v10, "addObject:", v4);
    }
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v7);
  }

}

- (id)checkOutReusableObjectWithReuseIdentifier:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXReusableObjectPool reusableObjectsByReuseIdentifier](self, "reusableObjectsByReuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    -[PXReusableObjectPool objectCreationBlocksByReuseIdentifier](self, "objectCreationBlocksByReuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v10 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXReusableObjectPool.m"), 77, CFSTR("no creation handlers registered for reuse identifier %@"), v15);

    }
    v10[2](v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_px_setReuseIdentifier:", a3);
    if (self->_delegateFlags.respondsToDidCreateReusableObject)
    {
      -[PXReusableObjectPool delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reusableObjectPool:didCreateReusableObject:", self, v9);

    }
    goto LABEL_8;
  }
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", 0);
  objc_msgSend(v9, "prepareForReuse");
  if (self->_delegateFlags.respondsToObjectPreparedForReuse)
  {
    -[PXReusableObjectPool delegate](self, "delegate");
    v10 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reusableObjectPool:objectPreparedForReuse:", self, v9);
LABEL_8:

  }
  return v9;
}

- (NSMutableDictionary)reusableObjectsByReuseIdentifier
{
  return self->_reusableObjectsByReuseIdentifier;
}

- (NSMutableDictionary)maximumPoolSizeByReuseIdentifier
{
  return self->_maximumPoolSizeByReuseIdentifier;
}

- (NSMutableDictionary)objectCreationBlocksByReuseIdentifier
{
  return self->_objectCreationBlocksByReuseIdentifier;
}

- (void)registerReusableObjectForReuseIdentifier:(int64_t)a3 creationHandler:(id)a4
{
  -[PXReusableObjectPool registerReusableObjectForReuseIdentifier:maximumPoolSize:creationHandler:](self, "registerReusableObjectForReuseIdentifier:maximumPoolSize:creationHandler:", a3, 0, a4);
}

- (PXReusableObjectPool)init
{
  PXReusableObjectPool *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *objectCreationBlocksByReuseIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *reusableObjectsByReuseIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *maximumPoolSizeByReuseIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXReusableObjectPool;
  v2 = -[PXReusableObjectPool init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    objectCreationBlocksByReuseIdentifier = v2->_objectCreationBlocksByReuseIdentifier;
    v2->_objectCreationBlocksByReuseIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    reusableObjectsByReuseIdentifier = v2->_reusableObjectsByReuseIdentifier;
    v2->_reusableObjectsByReuseIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    maximumPoolSizeByReuseIdentifier = v2->_maximumPoolSizeByReuseIdentifier;
    v2->_maximumPoolSizeByReuseIdentifier = v7;

  }
  return v2;
}

- (void)registerReusableObjectForReuseIdentifier:(int64_t)a3 maximumPoolSize:(int64_t)a4 creationHandler:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  objc_msgSend(v8, "numberWithInteger:", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = _Block_copy(v10);
  -[PXReusableObjectPool objectCreationBlocksByReuseIdentifier](self, "objectCreationBlocksByReuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v15);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXReusableObjectPool maximumPoolSizeByReuseIdentifier](self, "maximumPoolSizeByReuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToDidCreateReusableObject = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToObjectBecameReusable = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToObjectPreparedForReuse = objc_opt_respondsToSelector() & 1;
  }

}

- (void)removeAllReusableObjectsWithReuseIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXReusableObjectPool reusableObjectsByReuseIdentifier](self, "reusableObjectsByReuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (PXReusableObjectPoolDelegate)delegate
{
  return (PXReusableObjectPoolDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableObjectsByReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_maximumPoolSizeByReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_objectCreationBlocksByReuseIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
