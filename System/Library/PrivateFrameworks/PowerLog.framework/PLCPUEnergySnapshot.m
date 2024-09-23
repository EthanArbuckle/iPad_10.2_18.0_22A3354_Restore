@implementation PLCPUEnergySnapshot

- (PLCPUEnergySnapshot)initWithIdentifier:(id)a3 andMockData:(id)a4
{
  id v6;
  id v7;
  PLCPUEnergySnapshot *v8;
  PLCPUEnergySnapshot *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLCPUEnergySnapshot;
  v8 = -[PLCPUEnergySnapshot init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PLCPUEnergySnapshot setMockData:](v8, "setMockData:", v7);
    -[PLCPUEnergySnapshot snapshotCPUEnergy:](v9, "snapshotCPUEnergy:", v6);
  }

  return v9;
}

- (double)computeEnergyDiffUntilNow:(id)a3 andAdjustSnapshotToNow:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PLCPUEnergySnapshot *v7;
  void *v8;
  PLCPUEnergySnapshot *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;

  v4 = a4;
  v6 = a3;
  v7 = [PLCPUEnergySnapshot alloc];
  -[PLCPUEnergySnapshot mockData](self, "mockData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLCPUEnergySnapshot initWithIdentifier:andMockData:](v7, "initWithIdentifier:andMockData:", v6, v8);

  -[PLCPUEnergySnapshot computeEnergyDiff:](v9, "computeEnergyDiff:", self);
  v11 = v10;
  if (v4)
  {
    PLLogDiscretionaryEnergyMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PLCPUEnergySnapshot computeEnergyDiffUntilNow:andAdjustSnapshotToNow:].cold.2();

    -[PLCPUEnergySnapshot setCpuEnergy:](self, "setCpuEnergy:", -[PLCPUEnergySnapshot cpuEnergy](v9, "cpuEnergy"));
    -[PLCPUEnergySnapshot setCpuEnergyBilledToMe:](self, "setCpuEnergyBilledToMe:", -[PLCPUEnergySnapshot cpuEnergyBilledToMe](v9, "cpuEnergyBilledToMe"));
    -[PLCPUEnergySnapshot setCpuEnergyBilledToOthers:](self, "setCpuEnergyBilledToOthers:", -[PLCPUEnergySnapshot cpuEnergyBilledToOthers](v9, "cpuEnergyBilledToOthers"));
    PLLogDiscretionaryEnergyMonitor();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PLCPUEnergySnapshot computeEnergyDiffUntilNow:andAdjustSnapshotToNow:].cold.1();

  }
  return v11;
}

- (double)computeEnergyDiff:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  v4 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLCPUEnergySnapshot computeEnergyDiff:].cold.1();

  v6 = 0.0;
  if (-[PLCPUEnergySnapshot isValid](self, "isValid"))
  {
    if (objc_msgSend(v4, "isValid"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLCPUEnergySnapshot cpuEnergy](self, "cpuEnergy") - objc_msgSend(v4, "cpuEnergy"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLCPUEnergySnapshot cpuEnergyBilledToMe](self, "cpuEnergyBilledToMe")- objc_msgSend(v4, "cpuEnergyBilledToMe"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLCPUEnergySnapshot cpuEnergyBilledToOthers](self, "cpuEnergyBilledToOthers")- objc_msgSend(v4, "cpuEnergyBilledToOthers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      if (v9 >= 0.0 && v12 >= 0.0 && v15 >= 0.0)
      {
        if ((v9 + v12 - v15) / 3600000000.0 >= 0.0)
          v6 = (v9 + v12 - v15) / 3600000000.0;
        else
          v6 = 0.0;
      }
    }
  }

  return v6;
}

- (BOOL)isValid
{
  return -[PLCPUEnergySnapshot cpuEnergy](self, "cpuEnergy")
      || -[PLCPUEnergySnapshot cpuEnergyBilledToMe](self, "cpuEnergyBilledToMe")
      || -[PLCPUEnergySnapshot cpuEnergyBilledToOthers](self, "cpuEnergyBilledToOthers") != 0;
}

- (BOOL)snapshotCPUEnergy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  _QWORD *v15;
  int v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCPUEnergySnapshot mockData](self, "mockData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CPUCoalitionsMock"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCPUEnergySnapshot getCoalitionIDForIdentifier:](self, "getCoalitionIDForIdentifier:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "unsignedLongLongValue"))
    {
      objc_msgSend(v11, "longLongValue");
      PLLogDiscretionaryEnergyMonitor();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLCPUEnergySnapshot snapshotCPUEnergy:].cold.2();

      v15 = malloc_type_malloc(0x160uLL, 0x1000040AF73A19AuLL);
      v16 = coalition_info_resource_usage();
      v12 = v16 == 0;
      if (v16)
      {
        if (!v15)
        {
LABEL_14:
          v12 = 0;
          goto LABEL_17;
        }
      }
      else
      {
        -[PLCPUEnergySnapshot setCpuEnergy:](self, "setCpuEnergy:", v15[11]);
        -[PLCPUEnergySnapshot setCpuEnergyBilledToMe:](self, "setCpuEnergyBilledToMe:", v15[20]);
        -[PLCPUEnergySnapshot setCpuEnergyBilledToOthers:](self, "setCpuEnergyBilledToOthers:", v15[21]);
      }
      free(v15);
      goto LABEL_17;
    }
    PLLogDiscretionaryEnergyMonitor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PLCPUEnergySnapshot snapshotCPUEnergy:].cold.1();

    goto LABEL_14;
  }
  PLLogDiscretionaryEnergyMonitor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v19 = 138412546;
    v20 = v4;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_19EA99000, v8, OS_LOG_TYPE_INFO, "Reading mock coalitions data for identifier=%@, mockDataForIdentifier=%@", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cpuEnergy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCPUEnergySnapshot setCpuEnergy:](self, "setCpuEnergy:", objc_msgSend(v9, "longLongValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cpuEnergyBilledToMe"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCPUEnergySnapshot setCpuEnergyBilledToMe:](self, "setCpuEnergyBilledToMe:", objc_msgSend(v10, "longLongValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cpuEnergyBilledToOthers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCPUEnergySnapshot setCpuEnergyBilledToOthers:](self, "setCpuEnergyBilledToOthers:", objc_msgSend(v11, "longLongValue"));
  v12 = 1;
LABEL_17:

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cpuEnergy=%llu, cpuEnergyBilledToMe=%llu, cpuEnergyBilledToOthers=%llu"), -[PLCPUEnergySnapshot cpuEnergy](self, "cpuEnergy"), -[PLCPUEnergySnapshot cpuEnergyBilledToMe](self, "cpuEnergyBilledToMe"), -[PLCPUEnergySnapshot cpuEnergyBilledToOthers](self, "cpuEnergyBilledToOthers"));
}

- (void)refreshCoalitionIDMapping
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  +[PLCPUEnergySnapshot coalitionIDToCoalitionNameMapping](PLCPUEnergySnapshot, "coalitionIDToCoalitionNameMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, a1, v3, "After refresh coalitionIDToCoalitionNameMapping count=%lu", v4);

  OUTLINED_FUNCTION_8();
}

- (id)getCoalitionIDForIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PLCPUEnergySnapshot identifierToCoalitionID](PLCPUEnergySnapshot, "identifierToCoalitionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PLLogDiscretionaryEnergyMonitor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLCPUEnergySnapshot getCoalitionIDForIdentifier:].cold.2((uint64_t)v4, v8);

    +[PLCPUEnergySnapshot identifierToCoalitionID](PLCPUEnergySnapshot, "identifierToCoalitionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PLCPUEnergySnapshot searchCoalitionsCacheForID:](self, "searchCoalitionsCacheForID:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "unsignedLongLongValue"))
    {
      PLLogDiscretionaryEnergyMonitor();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v4;
        _os_log_impl(&dword_19EA99000, v12, OS_LOG_TYPE_INFO, "coalitionID not found, refreshing coalition mapping and searching again for identifier=%@", (uint8_t *)&v17, 0xCu);
      }

      -[PLCPUEnergySnapshot refreshCoalitionIDMapping](self, "refreshCoalitionIDMapping");
      -[PLCPUEnergySnapshot searchCoalitionsCacheForID:](self, "searchCoalitionsCacheForID:", v4);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    if (!objc_msgSend(v11, "unsignedLongLongValue"))
    {
      PLLogDiscretionaryEnergyMonitor();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PLCPUEnergySnapshot getCoalitionIDForIdentifier:].cold.1();

    }
    if (objc_msgSend(v11, "unsignedLongLongValue"))
    {
      +[PLCPUEnergySnapshot identifierToCoalitionID](PLCPUEnergySnapshot, "identifierToCoalitionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v4);

    }
    v5 = v11;
    v10 = v5;
  }

  return v10;
}

- (id)searchCoalitionsCacheForID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PLCPUEnergySnapshot searchCoalitionsCacheForID:].cold.1();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  +[PLCPUEnergySnapshot coalitionIDToCoalitionNameMapping](PLCPUEnergySnapshot, "coalitionIDToCoalitionNameMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke;
  v9[3] = &unk_1E4165D60;
  v6 = v3;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqualToString:", &stru_1E41668B0) & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v11, "length") > 9)
    {
      objc_msgSend(v11, "substringFromIndex:", 10);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v11;
    }
  }
  else
  {
    v12 = v10;
  }
  v13 = v12;
  v14 = (_QWORD *)(a1 + 32);
  if ((objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", *v14) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", *v14))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    if ((objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      PLLogDiscretionaryEnergyMonitor();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke_cold_1();

      +[PLCPUEnergySnapshot identifierToAccountingName](PLCPUEnergySnapshot, "identifierToAccountingName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        +[PLCPUEnergySnapshot identifierToAccountingName](PLCPUEnergySnapshot, "identifierToAccountingName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, *v14);

        PLLogDiscretionaryEnergyMonitor();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          +[PLCPUEnergySnapshot identifierToAccountingName](PLCPUEnergySnapshot, "identifierToAccountingName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412290;
          v22 = v20;
          _os_log_impl(&dword_19EA99000, v19, OS_LOG_TYPE_INFO, "identifierToAccountingName=%@", (uint8_t *)&v21, 0xCu);

        }
      }
    }
    *a4 = 1;
  }

}

+ (NSMutableDictionary)identifierToCoalitionID
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_identifierToCoalitionID;
  if (!_identifierToCoalitionID)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)_identifierToCoalitionID;
    _identifierToCoalitionID = (uint64_t)v3;

    v2 = (void *)_identifierToCoalitionID;
  }
  return (NSMutableDictionary *)v2;
}

+ (void)setIdentifierToCoalitionID:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)_identifierToCoalitionID != a3)
  {
    v3 = objc_msgSend(a3, "mutableCopy");
    v4 = (void *)_identifierToCoalitionID;
    _identifierToCoalitionID = v3;

  }
}

+ (NSMutableDictionary)coalitionIDToCoalitionNameMapping
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_coalitionIDToCoalitionNameMapping;
  if (!_coalitionIDToCoalitionNameMapping)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)_coalitionIDToCoalitionNameMapping;
    _coalitionIDToCoalitionNameMapping = (uint64_t)v3;

    v2 = (void *)_coalitionIDToCoalitionNameMapping;
  }
  return (NSMutableDictionary *)v2;
}

+ (void)setCoalitionIDToCoalitionNameMapping:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)_coalitionIDToCoalitionNameMapping != a3)
  {
    v3 = objc_msgSend(a3, "mutableCopy");
    v4 = (void *)_coalitionIDToCoalitionNameMapping;
    _coalitionIDToCoalitionNameMapping = v3;

  }
}

+ (NSMutableDictionary)identifierToAccountingName
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_identifierToAccountingName;
  if (!_identifierToAccountingName)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)_identifierToAccountingName;
    _identifierToAccountingName = (uint64_t)v3;

    v2 = (void *)_identifierToAccountingName;
  }
  return (NSMutableDictionary *)v2;
}

+ (void)setIdentifierToAccountingName:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)_identifierToAccountingName != a3)
  {
    v3 = objc_msgSend(a3, "mutableCopy");
    v4 = (void *)_identifierToAccountingName;
    _identifierToAccountingName = v3;

  }
}

- (unint64_t)cpuEnergy
{
  return self->_cpuEnergy;
}

- (void)setCpuEnergy:(unint64_t)a3
{
  self->_cpuEnergy = a3;
}

- (unint64_t)cpuEnergyBilledToMe
{
  return self->_cpuEnergyBilledToMe;
}

- (void)setCpuEnergyBilledToMe:(unint64_t)a3
{
  self->_cpuEnergyBilledToMe = a3;
}

- (unint64_t)cpuEnergyBilledToOthers
{
  return self->_cpuEnergyBilledToOthers;
}

- (void)setCpuEnergyBilledToOthers:(unint64_t)a3
{
  self->_cpuEnergyBilledToOthers = a3;
}

- (NSMutableDictionary)mockData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMockData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockData, 0);
}

- (void)computeEnergyDiffUntilNow:andAdjustSnapshotToNow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "after adjusting snapshot self=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)computeEnergyDiffUntilNow:andAdjustSnapshotToNow:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "adjusting snapshot self=%@ to now", v2);
  OUTLINED_FUNCTION_1();
}

- (void)computeEnergyDiff:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EA99000, v0, v1, "computing energy diff between self=%@ and otherSnapshot=%@");
  OUTLINED_FUNCTION_1();
}

- (void)snapshotCPUEnergy:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_19EA99000, v0, v1, "coalitionID not found, unable to snapshot identifer=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)snapshotCPUEnergy:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "Getting cpu energy from coalitions snapshot for  coalitionID=%llu", v2);
  OUTLINED_FUNCTION_1();
}

- (void)getCoalitionIDForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_19EA99000, v0, v1, "coalitionID not found after refresh, for identifer=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)getCoalitionIDForIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[PLCPUEnergySnapshot identifierToCoalitionID](PLCPUEnergySnapshot, "identifierToCoalitionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_19EA99000, a2, v4, "coalitionID found in identifierToCoalitionID for identifier=%@, identifierToCoalitionID=%@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)searchCoalitionsCacheForID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "searching cache for coalitionID for identifier=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13(&dword_19EA99000, v0, (uint64_t)v0, "identifier received is not equal to accountingIdentifier: identifier=%@, accountingIdentifier=%@", v1);
  OUTLINED_FUNCTION_1();
}

@end
