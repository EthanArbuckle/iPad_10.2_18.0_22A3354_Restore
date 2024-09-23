@implementation RBAssertionCollection

- (id)assertionWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (void)noteResolvedAssertion:(id)a3
{
  NSMutableSet *resolvedIdentifiers;
  id v4;

  resolvedIdentifiers = self->_resolvedIdentifiers;
  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](resolvedIdentifiers, "addObject:", v4);

}

- (id)assertionsForTargetIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_assertionsByTargetProcessIdentity, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "copy");
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (id)assertionsForTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isSystem"))
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = (void *)-[NSMutableSet copy](self->_systemAssertions, "copy");
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBAssertionCollection assertionsForTargetIdentity:](self, "assertionsForTargetIdentity:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)hasAssertionsForOriginator:(id)a3 exceedingCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") <= a4)
  {
    v14 = 0;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "isValid"))
          {
            if (++v11 > a4)
            {
              v14 = 1;
              goto LABEL_14;
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_14:

  }
  os_unfair_recursive_lock_unlock();

  return v14;
}

- (BOOL)hasResolvedAssertion:(id)a3
{
  NSMutableSet *resolvedIdentifiers;
  void *v4;

  resolvedIdentifiers = self->_resolvedIdentifiers;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(resolvedIdentifiers) = -[NSMutableSet containsObject:](resolvedIdentifiers, "containsObject:", v4);

  return (char)resolvedIdentifiers;
}

- (void)enumerateAssertionsForTargetProcessIdentity:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, unsigned __int8 *);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unsigned __int8 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, unsigned __int8 *))a4;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_assertionsByTargetProcessIdentity, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  v21 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(v10);
      v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
      v16 = (void *)MEMORY[0x22074BD78](v11);
      v7[2](v7, v15, &v21);
      LODWORD(v15) = v21;
      objc_autoreleasePoolPop(v16);
      if ((_DWORD)v15)
        break;
      if (v12 == ++v14)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        v12 = v11;
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)assertionsForOriginator:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_assertionsByOriginator, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "copy");
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (unint64_t)assertionCountForTargetProcessIdentity:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByTargetProcessIdentity, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (BOOL)hasAssertionsForOriginator:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "count") != 0;
  os_unfair_recursive_lock_unlock();
  return (char)v4;
}

- (unint64_t)count
{
  unint64_t v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = -[NSMutableDictionary count](self->_assertionsByIdentifier, "count");
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)addAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  _BYTE v19[14];
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v4, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assertionsByIdentifier, "setObject:forKeyedSubscript:", v4, v8);
  -[NSMutableDictionary objectForKey:](self->_assertionsByOriginator, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_assertionsByOriginator, "setObject:forKey:", v10, v7);
  }
  objc_msgSend(v10, "addObject:", v4);
  rbs_assertion_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[RBAssertionCollection addAssertion:].cold.1((uint64_t)v4, v11);

  rbs_assertion_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v17 = -[NSMutableDictionary count](self->_assertionsByIdentifier, "count");
    v18 = 67109634;
    *(_DWORD *)v19 = v17;
    *(_WORD *)&v19[4] = 2114;
    *(_QWORD *)&v19[6] = v7;
    v20 = 1024;
    v21 = objc_msgSend(v10, "count");
    _os_log_debug_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_DEBUG, "Now tracking %u assertions (%{public}@ holds %u).", (uint8_t *)&v18, 0x18u);
  }

  if ((objc_msgSend(v5, "isSystem") & 1) != 0)
  {
    -[NSMutableSet addObject:](self->_systemAssertions, "addObject:", v4);
  }
  else
  {
    -[NSMutableSet addObject:](self->_processAssertions, "addObject:", v4);
    -[NSMutableDictionary objectForKey:](self->_assertionsByTargetProcessIdentity, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_assertionsByTargetProcessIdentity, "setObject:forKey:", v13, v9);
    }
    objc_msgSend(v13, "addObject:", v4);
    rbs_assertion_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByTargetProcessIdentity, "objectForKeyedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      v18 = 138543618;
      *(_QWORD *)v19 = v9;
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)&v19[10] = v16;
      _os_log_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_INFO, "%{public}@ is now targeted by %u assertions", (uint8_t *)&v18, 0x12u);

    }
  }
  os_unfair_recursive_lock_unlock();

}

- (void)removeAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  int v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  _BYTE v28[20];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v4, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_assertionsByIdentifier, "removeObjectForKey:", v8);
  -[NSMutableSet removeObject:](self->_resolvedIdentifiers, "removeObject:", v8);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "removeObject:", v4);
  if (!objc_msgSend(v11, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_assertionsByOriginator, "removeObjectForKey:", v7);
  rbs_assertion_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v23 = -[NSMutableDictionary count](self->_assertionsByIdentifier, "count");
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v28 = v23;
    *(_WORD *)&v28[4] = 2114;
    *(_QWORD *)&v28[6] = v7;
    *(_WORD *)&v28[14] = 1024;
    *(_DWORD *)&v28[16] = objc_msgSend(v11, "count");
    _os_log_debug_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_DEBUG, "Now tracking %u assertions (%{public}@ holds %u).", buf, 0x18u);
  }

  rbs_assertion_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

  if (v14)
  {
    rbs_assertion_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[RBAssertionCollection removeAssertion:].cold.1((uint64_t)v8, (uint64_t)v5, v15);

    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_13);
  }
  if ((objc_msgSend(v5, "isSystem") & 1) != 0)
  {
    -[NSMutableSet removeObject:](self->_systemAssertions, "removeObject:", v4);
  }
  else
  {
    -[NSMutableSet removeObject:](self->_processAssertions, "removeObject:", v4);
    -[NSMutableDictionary objectForKey:](self->_assertionsByTargetProcessIdentity, "objectForKey:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v4);
    if (!objc_msgSend(v16, "count"))
      -[NSMutableDictionary removeObjectForKey:](self->_assertionsByTargetProcessIdentity, "removeObjectForKey:", v9);
    v24 = v9;
    rbs_assertion_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByTargetProcessIdentity, "objectForKeyedSubscript:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v28 = v24;
      *(_WORD *)&v28[8] = 2048;
      *(_QWORD *)&v28[10] = v19;
      _os_log_impl(&dword_21A8B4000, v17, OS_LOG_TYPE_INFO, "%{public}@ is now targeted by %lu assertions", buf, 0x16u);

    }
    rbs_assertion_log();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

    if (v21)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByTargetProcessIdentity, "objectForKeyedSubscript:", v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __41__RBAssertionCollection_removeAssertion___block_invoke_2;
      v25[3] = &unk_24DD463E0;
      v26 = v7;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v25);

    }
    v9 = v24;
  }
  os_unfair_recursive_lock_unlock();

}

- (RBAssertionCollection)init
{
  RBAssertionCollection *v2;
  RBAssertionCollection *v3;
  uint64_t v4;
  NSMutableDictionary *assertionsByIdentifier;
  uint64_t v6;
  NSMutableSet *processAssertions;
  uint64_t v8;
  NSMutableSet *systemAssertions;
  uint64_t v10;
  NSMutableDictionary *assertionsByTargetProcessIdentity;
  uint64_t v12;
  NSMutableDictionary *assertionsByOriginator;
  uint64_t v14;
  NSMutableSet *resolvedIdentifiers;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)RBAssertionCollection;
  v2 = -[RBAssertionCollection init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    assertionsByIdentifier = v3->_assertionsByIdentifier;
    v3->_assertionsByIdentifier = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    processAssertions = v3->_processAssertions;
    v3->_processAssertions = (NSMutableSet *)v6;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    systemAssertions = v3->_systemAssertions;
    v3->_systemAssertions = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    assertionsByTargetProcessIdentity = v3->_assertionsByTargetProcessIdentity;
    v3->_assertionsByTargetProcessIdentity = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    assertionsByOriginator = v3->_assertionsByOriginator;
    v3->_assertionsByOriginator = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    resolvedIdentifiers = v3->_resolvedIdentifiers;
    v3->_resolvedIdentifiers = (NSMutableSet *)v14;

  }
  return v3;
}

- (id)allAssertions
{
  NSMutableSet *processAssertions;
  uint64_t v4;
  void *v5;

  os_unfair_recursive_lock_lock_with_options();
  processAssertions = self->_processAssertions;
  if (!self->_systemAssertions)
    goto LABEL_5;
  if (!processAssertions)
  {
    processAssertions = self->_systemAssertions;
LABEL_5:
    v4 = -[NSMutableSet copy](processAssertions, "copy");
    goto LABEL_6;
  }
  -[NSMutableSet setByAddingObjectsFromSet:](processAssertions, "setByAddingObjectsFromSet:");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v5 = (void *)v4;
  os_unfair_recursive_lock_unlock();
  return v5;
}

- (void)enumerateAssertionsWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, unsigned __int8 *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unsigned __int8 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_assertionsByIdentifier, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x22074BD78](v7);
      v4[2](v4, v11, &v17);
      LODWORD(v11) = v17;
      objc_autoreleasePoolPop(v12);
      if ((_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        v8 = v7;
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateAssertionsForSystemTargetWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, unsigned __int8 *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unsigned __int8 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_systemAssertions, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x22074BD78](v7);
      v4[2](v4, v11, &v17);
      LODWORD(v11) = v17;
      objc_autoreleasePoolPop(v12);
      if ((_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        v8 = v7;
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateAssertionsForProcessTargetsWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, unsigned __int8 *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unsigned __int8 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_processAssertions, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x22074BD78](v7);
      v4[2](v4, v11, &v17);
      LODWORD(v11) = v17;
      objc_autoreleasePoolPop(v12);
      if ((_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        v8 = v7;
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateAssertionsForOriginator:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, unsigned __int8 *);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unsigned __int8 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, unsigned __int8 *))a4;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_assertionsByOriginator, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  v21 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(v10);
      v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
      v16 = (void *)MEMORY[0x22074BD78](v11);
      v7[2](v7, v15, &v21);
      LODWORD(v15) = v21;
      objc_autoreleasePoolPop(v16);
      if ((_DWORD)v15)
        break;
      if (v12 == ++v14)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        v12 = v11;
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __41__RBAssertionCollection_removeAssertion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  rbs_assertion_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __41__RBAssertionCollection_removeAssertion___block_invoke_cold_1(v2);

}

void __41__RBAssertionCollection_removeAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  rbs_assertion_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __41__RBAssertionCollection_removeAssertion___block_invoke_2_cold_1(a1, v3);

}

- (BOOL)hasAssertion:(id)a3
{
  id v4;
  NSMutableDictionary *assertionsByIdentifier;
  void *v6;
  void *v7;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  assertionsByIdentifier = self->_assertionsByIdentifier;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](assertionsByIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(assertionsByIdentifier) = v7 != 0;

  os_unfair_recursive_lock_unlock();
  return (char)assertionsByIdentifier;
}

- (unint64_t)assertionCountForOriginator:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedIdentifiers, 0);
  objc_storeStrong((id *)&self->_assertionsByTargetProcessIdentity, 0);
  objc_storeStrong((id *)&self->_assertionsByOriginator, 0);
  objc_storeStrong((id *)&self->_systemAssertions, 0);
  objc_storeStrong((id *)&self->_processAssertions, 0);
  objc_storeStrong((id *)&self->_assertionsByIdentifier, 0);
}

- (void)removeAssertion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_21A8B4000, log, OS_LOG_TYPE_DEBUG, "Removing assertion %{public}@ on %{public}@", (uint8_t *)&v3, 0x16u);
}

void __41__RBAssertionCollection_removeAssertion___block_invoke_cold_1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(a1, "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "explanation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_9(&dword_21A8B4000, v6, v7, "> %{public}@ ['%{public}@'] [%{public}@]", v8, v9, v10, v11, v12);

}

void __41__RBAssertionCollection_removeAssertion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a2, "explanation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_9(&dword_21A8B4000, v5, v6, "> %{public}@ ['%{public}@'] [%{public}@]", v7, v8, v9, v10, v11);

}

- (void)addAssertion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_DEBUG, "Adding assertion %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
