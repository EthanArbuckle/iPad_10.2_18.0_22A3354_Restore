@implementation TCSCallLog

- (TCSCallLog)init
{
  TCSCallLog *v2;
  TCSCallLog *v3;
  uint64_t v4;
  NSMutableDictionary *calls;
  uint64_t v6;
  NSMutableOrderedSet *identifiers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TCSCallLog;
  v2 = -[TCSCallLog init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    calls = v3->_calls;
    v3->_calls = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v6 = objc_claimAutoreleasedReturnValue();
    identifiers = v3->_identifiers;
    v3->_identifiers = (NSMutableOrderedSet *)v6;

  }
  return v3;
}

- (void)addCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "uniqueProxyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v4, "status") == 6)
    {
      objc_msgSend(v4, "uniqueProxyIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");

      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_calls, "setObject:forKeyedSubscript:", v4, v7);
      -[NSMutableOrderedSet insertObject:atIndex:](self->_identifiers, "insertObject:atIndex:", v7, 0);
      os_unfair_lock_unlock(&self->_lock);
      -[TCSCallLog _trimCache](self, "_trimCache");

    }
    else
    {
      _TCSInitializeLogging();
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
        -[TCSCallLog addCall:].cold.2();
    }
  }
  else
  {
    _TCSInitializeLogging();
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      -[TCSCallLog addCall:].cold.1();
  }

}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_calls, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_trimCache
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSMutableDictionary *calls;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)-[NSMutableOrderedSet count](self->_identifiers, "count") >= 9)
  {
    v4 = -[NSMutableOrderedSet count](self->_identifiers, "count");
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 8, v4 - 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet objectsAtIndexes:](self->_identifiers, "objectsAtIndexes:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  calls = self->_calls;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __24__TCSCallLog__trimCache__block_invoke;
  v10[3] = &unk_24CFC27D8;
  v11 = v3;
  v9 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](calls, "enumerateKeysAndObjectsUsingBlock:", v10);
  objc_msgSend(v9, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](self->_calls, "removeObjectsForKeys:", v8);
  -[NSMutableOrderedSet removeObjectsInArray:](self->_identifiers, "removeObjectsInArray:", v8);
  os_unfair_lock_unlock(&self->_lock);

}

void __24__TCSCallLog__trimCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "dateAnsweredOrDialed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;

  if (v7 <= -21600.0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

- (NSMutableDictionary)calls
{
  return self->_calls;
}

- (void)setCalls:(id)a3
{
  objc_storeStrong((id *)&self->_calls, a3);
}

- (NSMutableOrderedSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_calls, 0);
}

- (void)addCall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21342E000, v0, v1, "%s: cannot add entry for TCSCall object lacking uPI: %@", v2, v3, v4, v5, 2u);
}

- (void)addCall:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21342E000, v0, v1, "%s: usage error, should not be adding an entry for a TCSCall object whose call state is not disconnected: %@", v2, v3, v4, v5, 2u);
}

@end
