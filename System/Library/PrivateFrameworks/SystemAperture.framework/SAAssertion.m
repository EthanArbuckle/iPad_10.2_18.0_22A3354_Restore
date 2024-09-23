@implementation SAAssertion

- (BOOL)isValid
{
  return self->_valid;
}

- (void)addInvalidationBlock:(id)a3
{
  id v4;
  SAAssertion *v5;
  NSMutableOrderedSet *invalidationBlocks;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    invalidationBlocks = v5->_invalidationBlocks;
    if (!invalidationBlocks)
    {
      v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
      v8 = v5->_invalidationBlocks;
      v5->_invalidationBlocks = v7;

      invalidationBlocks = v5->_invalidationBlocks;
    }
    v9 = (void *)MEMORY[0x24958F45C](v10);
    -[NSMutableOrderedSet addObject:](invalidationBlocks, "addObject:", v9);

    objc_sync_exit(v5);
    v4 = v10;
  }

}

- (SAAssertion)init
{
  SAAssertion *v2;
  SAAssertion *v3;
  uint64_t v4;
  NSDate *creationDate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SAAssertion;
  v2 = -[SAAssertion init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_valid = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = objc_claimAutoreleasedReturnValue();
    creationDate = v3->_creationDate;
    v3->_creationDate = (NSDate *)v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (-[SAAssertion isValid](self, "isValid"))
    -[SAAssertion invalidateWithReason:](self, "invalidateWithReason:", CFSTR("deallocation"));
  v3.receiver = self;
  v3.super_class = (Class)SAAssertion;
  -[SAAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[SAAssertion _descriptionConstituents](self, "_descriptionConstituents");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
              objc_msgSend(v8, "objectForKey:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "appendFormat:", CFSTR("; %@: %@"), v13, v14);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v10);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));

  return (NSString *)v3;
}

- (void)invalidateWithReason:(id)a3
{
  id v5;
  SAAssertion *v6;
  uint64_t v7;
  NSString *invalidationReason;
  NSObject *v9;
  id *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  SAAssertion *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAAssertion.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[reason length] > 0"));

  }
  if (-[SAAssertion isValid](self, "isValid"))
  {
    v6 = self;
    objc_sync_enter(v6);
    v6->_valid = 0;
    v7 = objc_msgSend(v5, "copy");
    invalidationReason = v6->_invalidationReason;
    v6->_invalidationReason = (NSString *)v7;

    v9 = SALogElement;
    if (os_log_type_enabled((os_log_t)SALogElement, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v6;
      _os_log_impl(&dword_247C57000, v9, OS_LOG_TYPE_DEFAULT, "Assertion did invalidate: %{public}@", buf, 0xCu);
    }
    v10 = v6;
    objc_sync_enter(v10);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v10[1];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14++) + 16))();
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    v15 = v10[1];
    v10[1] = 0;

    objc_sync_exit(v10);
    objc_sync_exit(v10);

  }
  else
  {
    v16 = SALogSystem;
    if (os_log_type_enabled((os_log_t)SALogSystem, OS_LOG_TYPE_ERROR))
      -[SAAssertion invalidateWithReason:].cold.1((uint64_t)self, v16);
  }

}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_invalidationReason, 0);
  objc_storeStrong((id *)&self->_invalidationBlocks, 0);
}

- (NSString)_invalidationReason
{
  return self->_invalidationReason;
}

- (NSArray)_descriptionConstituents
{
  id v3;
  BOOL v4;
  void *v5;
  NSString *invalidationReason;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = -[SAAssertion isValid](self, "isValid");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isValid"));

  if (!v4)
  {
    invalidationReason = self->_invalidationReason;
    if (invalidationReason)
      objc_msgSend(v3, "setObject:forKey:", invalidationReason, CFSTR("invalidation reason"));
  }
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (void)invalidateWithReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_247C57000, a2, OS_LOG_TYPE_ERROR, "Attempt to invalidate invalid assertion: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
