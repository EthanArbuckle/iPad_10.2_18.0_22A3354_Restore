@implementation SWLogger

- (SWLogger)init
{
  SWLogger *v2;
  uint64_t v3;
  NSMutableDictionary *values;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SWLogger;
  v2 = -[SWLogger init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    values = v2->_values;
    v2->_values = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)bindValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[SWLogger values](self, "values");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v6);

    }
  }
}

- (void)log:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)SWDefaultLog;
  if (os_log_type_enabled((os_log_t)SWDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[SWLogger constructLogWithMessage:](self, "constructLogWithMessage:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_218DB2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)logError:(id)a3
{
  void *v5;

  v5 = (void *)SWDefaultLog;
  if (os_log_type_enabled((os_log_t)SWDefaultLog, OS_LOG_TYPE_ERROR))
    -[SWLogger logError:].cold.1(v5, self, (uint64_t)a3);
}

- (void)logSensitive:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)SWDefaultLog;
  if (os_log_type_enabled((os_log_t)SWDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[SWLogger constructLogWithMessage:](self, "constructLogWithMessage:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_218DB2000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);

  }
}

- (id)constructLogWithMessage:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("["));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SWLogger values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[SWLogger values](self, "values");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@=%@"), v10, v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "appendString:", CFSTR("] "));
  objc_msgSend(v4, "appendString:", v14);

  return v4;
}

- (NSMutableDictionary)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

- (void)logError:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "constructLogWithMessage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543362;
  v8 = v6;
  _os_log_error_impl(&dword_218DB2000, v5, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v7, 0xCu);

}

@end
