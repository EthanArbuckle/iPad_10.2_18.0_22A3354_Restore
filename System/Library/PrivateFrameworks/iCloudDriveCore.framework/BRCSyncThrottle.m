@implementation BRCSyncThrottle

- (BOOL)matchesItem:(id)a3 nsecsToRetry:(unint64_t *)a4 now:(unint64_t)a5
{
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = -[NSPredicate evaluateWithObject:](self->_predicate, "evaluateWithObject:", v8);
  if (v9)
  {
    objc_msgSend(v8, "clientZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = -[BRCThrottle nsecsToNextRetry:now:increment:](self, "nsecsToNextRetry:now:increment:", objc_msgSend(v10, "throttleHashWithItemID:", v11), a5, 1);

  }
  return v9;
}

- (BOOL)_validateThrottleParams:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      -[BRCSyncThrottle _validateThrottleParams:].cold.3();
    goto LABEL_12;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("platforms"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      -[BRCSyncThrottle _validateThrottleParams:].cold.2();
    goto LABEL_11;
  }
  BRPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCSyncThrottle _validateThrottleParams:].cold.1((uint64_t)v3, (uint64_t)v8, v9);
LABEL_11:

LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
  v7 = 1;
LABEL_13:

  return v7;
}

- (BRCSyncThrottle)initWithName:(id)a3 andParameters:(id)a4
{
  id v6;
  id v7;
  BRCSyncThrottle *v8;
  void *v9;
  uint64_t v10;
  NSPredicate *predicate;
  BRCSyncThrottle *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (-[BRCSyncThrottle _validateThrottleParams:](self, "_validateThrottleParams:", v7))
  {
    v14.receiver = self;
    v14.super_class = (Class)BRCSyncThrottle;
    v8 = -[BRCThrottle initWithName:andParameters:](&v14, sel_initWithName_andParameters_, v6, v7);
    if (v8)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("predicate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        predicate = v8->_predicate;
        v8->_predicate = (NSPredicate *)v10;

      }
    }
    self = v8;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)_validateThrottleParams:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  BRPlatform();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] throttle dict %@ isn't for our platform %@%@", (uint8_t *)&v7, 0x20u);

}

- (void)_validateThrottleParams:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Platforms %@ isn't an array%@");
}

- (void)_validateThrottleParams:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Throttle %@ isn't a dictionary%@");
}

@end
