@implementation _LTDConfigurationCache

- (_LTDConfigurationCache)init
{
  _LTDConfigurationCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  uint64_t v5;
  NSMutableDictionary *conditions;
  _LTDConfigurationCache *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_LTDConfigurationCache;
  v2 = -[_LTDConfigurationCache init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 9);
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 9);
    conditions = v2->_conditions;
    v2->_conditions = (NSMutableDictionary *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    v7 = v2;
  }

  return v2;
}

- (void)setObject:(id)a3 forType:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKey:](self->_cache, "setObject:forKey:", v7, v8);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_conditions, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_conditions, "removeObjectForKey:", v8);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v9, "lock");
  objc_msgSend(v9, "broadcast");
  objc_msgSend(v9, "unlock");
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_LTDConfigurationCache setObject:forType:].cold.1();

}

+ (id)_errorForType:(int64_t)a3 reason:(unint64_t)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Timeout waiting on cache value for type %zd"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = 11;
  }
  else if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cache-miss with writer pass-through on cache value for type %zd"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = 2;
  }
  else
  {
    if (a4)
    {
      v7 = 0;
      return v7;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No value found in cache for type %zd"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = 7;
  }
  objc_msgSend(v5, "ltd_errorWithCode:description:userInfo:", v6, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)objectForType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  char v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v11 = objc_msgSend(v10, "lt_ensureTypesForKeys:values:", v9, 0), v12 = v10, (v11 & 1) == 0))
  {

    v12 = 0;
  }

  if (!v12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_conditions, "objectForKeyedSubscript:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      os_unfair_lock_unlock(&self->_lock);
      v15 = _LTOSLogAssets();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[_LTDConfigurationCache objectForType:error:].cold.5();
      objc_msgSend(v14, "lock");
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateByAddingTimeInterval:", _LTDPreferencesConfigurationCacheTimeout());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v14, "waitUntilDate:", v17);

      objc_msgSend(v14, "unlock");
      v19 = _LTOSLogAssets();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[_LTDConfigurationCache objectForType:error:].cold.4();
        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
      else if ((v18 & 1) != 0)
      {
LABEL_12:
        os_unfair_lock_lock(&self->_lock);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_opt_class();
        v22 = v20;
        if (!v22
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (v23 = objc_msgSend(v22, "lt_ensureTypesForKeys:values:", v21, 0), v12 = v22, (v23 & 1) == 0))
        {

          v12 = 0;
        }

        os_unfair_lock_unlock(&self->_lock);
        if (v12)
          goto LABEL_21;
        objc_msgSend((id)objc_opt_class(), "_errorForType:reason:", a3, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = _LTOSLogAssets();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          -[_LTDConfigurationCache objectForType:error:].cold.2();
          if (!a4)
            goto LABEL_20;
        }
        else if (!a4)
        {
LABEL_20:

LABEL_21:
          goto LABEL_32;
        }
        *a4 = objc_retainAutorelease(v24);
        goto LABEL_20;
      }
      objc_msgSend((id)objc_opt_class(), "_errorForType:reason:", a3, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = _LTOSLogAssets();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[_LTDConfigurationCache objectForType:error:].cold.3((uint64_t)v27, a3, v28);
        if (!a4)
          goto LABEL_30;
      }
      else if (!a4)
      {
LABEL_30:

        goto LABEL_31;
      }
      *a4 = objc_retainAutorelease(v27);
      goto LABEL_30;
    }
    v14 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_conditions, "setObject:forKeyedSubscript:", v14, v7);
    v26 = _LTOSLogAssets();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      -[_LTDConfigurationCache objectForType:error:].cold.1();
      if (!a4)
        goto LABEL_25;
    }
    else if (!a4)
    {
LABEL_25:
      os_unfair_lock_unlock(&self->_lock);
LABEL_31:

      v12 = 0;
      goto LABEL_32;
    }
    objc_msgSend((id)objc_opt_class(), "_errorForType:reason:", a3, 1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_32:

  return v12;
}

- (void)objectForType:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = 0;
  v6 = (void (**)(id, void *, id))a4;
  -[_LTDConfigurationCache objectForType:error:](self, "objectForType:error:", a3, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v8)
  {
    v9 = 0;
    v10 = v8;
  }
  else
  {
    v9 = v7;
    v10 = 0;
  }
  v6[2](v6, v9, v10);

}

- (void)removeObjectForType:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;

  v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_LTDConfigurationCache removeObjectForType:].cold.1();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", v6);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_conditions, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_conditions, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v7, "lock");
  objc_msgSend(v7, "broadcast");
  objc_msgSend(v7, "unlock");

}

- (void)removeAllObjects
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2491B9000, log, OS_LOG_TYPE_DEBUG, "Configuration cache remove all", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)setObject:forType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "Configuration cache set and signaled waiters for type %zd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)objectForType:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "Configuration cache-miss, writer pass-through for type %zd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)objectForType:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Received no result in cache for key %{public}@: %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)objectForType:(NSObject *)a3 error:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, a2, a3, "Timed out loading configuration cache object for type %zd: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_2();
}

- (void)objectForType:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "Configuration reader block-wait end for type %zd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)objectForType:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "Configuration cache-miss, reader block-wait for type %zd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)removeObjectForType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "Configuration cache remove type: %zd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
