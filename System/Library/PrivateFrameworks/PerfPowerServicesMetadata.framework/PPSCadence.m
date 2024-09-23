@implementation PPSCadence

+ (id)cadenceEventXPCWithFrequency:(int)a3
{
  _QWORD block[4];
  int v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PPSCadence_cadenceEventXPCWithFrequency___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v5 = a3;
  if (cadenceEventXPCWithFrequency__onceToken != -1)
    dispatch_once(&cadenceEventXPCWithFrequency__onceToken, block);
  return (id)cadenceEventXPCWithFrequency___cadences;
}

- (PPSCadence)initWithCadenceTuples:(id)a3
{
  id v4;
  void *v5;
  PPSCadence *v6;
  uint64_t v7;
  NSArray *cadenceTuples;
  PPSCadence *v9;
  NSObject *v10;
  objc_super v12;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v12.receiver = self;
    v12.super_class = (Class)PPSCadence;
    v6 = -[PPSCadence init](&v12, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v5);
      cadenceTuples = v6->_cadenceTuples;
      v6->_cadenceTuples = (NSArray *)v7;

    }
    self = v6;
    v9 = self;
  }
  else
  {
    PPSMetricLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PPSCadence initWithCadenceTuples:].cold.1(v10);

    v9 = 0;
  }

  return v9;
}

void __43__PPSCadence_cadenceEventXPCWithFrequency___block_invoke(uint64_t a1)
{
  PPSCadenceTuple *v1;
  PPSCadence *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 5, *(int *)(a1 + 32));
  if (v1)
  {
    v2 = [PPSCadence alloc];
    v6[0] = v1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PPSCadence initWithCadenceTuples:](v2, "initWithCadenceTuples:", v3);
    v5 = (void *)cadenceEventXPCWithFrequency___cadences;
    cadenceEventXPCWithFrequency___cadences = v4;

  }
}

- (id)json
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PPSCadence *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v23;
  const __CFString *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[PPSCadence cadenceTuples](self, "cadenceTuples");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = 0x24BDBC000uLL;
  if (v5)
  {
    v7 = 0;
    v23 = v3;
    do
    {
      v26[0] = CFSTR("type");
      v8 = (void *)MEMORY[0x24BDD16E0];
      -[PPSCadence cadenceTuples](self, "cadenceTuples", v23);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithInt:", objc_msgSend(v10, "type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = CFSTR("value");
      v27[0] = v11;
      v12 = (void *)MEMORY[0x24BDD16E0];
      -[PPSCadence cadenceTuples](self, "cadenceTuples");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v14, "value"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v15;
      objc_msgSend(*(id *)(v6 + 3696), "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v16 = self;
      v17 = v6;
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v23;
      objc_msgSend(v23, "addObject:", v18);

      v6 = v17;
      self = v16;
      ++v7;
      -[PPSCadence cadenceTuples](v16, "cadenceTuples");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

    }
    while (v20 > v7);
  }
  v24 = CFSTR("cadences");
  v25 = v3;
  objc_msgSend(*(id *)(v6 + 3696), "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (PPSCadence)cadenceWithJSONObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PPSCadence *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (+[PPSCadence isValidCadenceJSON:](PPSCadence, "isValidCadenceJSON:", v3))
  {
    v4 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cadences"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          +[PPSCadenceTuple cadenceTupleWithJSONObject:](PPSCadenceTuple, "cadenceTupleWithJSONObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            PPSStorageLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              +[PPSCadence(JSON) cadenceWithJSONObject:].cold.1(v3);

            v12 = 0;
            goto LABEL_15;
          }
          v11 = (void *)v10;
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }

    v12 = -[PPSCadence initWithCadenceTuples:]([PPSCadence alloc], "initWithCadenceTuples:", v4);
LABEL_15:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)isValidCadenceJSON:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  BOOL v6;
  NSObject *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PPSCadence(JSON) isValidCadenceJSON:].cold.2();
    goto LABEL_8;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cadences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    PPSStorageLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PPSCadence(JSON) isValidCadenceJSON:].cold.1(v3);
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  v6 = 1;
LABEL_9:

  return v6;
}

+ (PPSCadence)cadenceWithProto:(id)a3
{
  id v3;
  void *v4;
  PPSCadence *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PPSCadenceTuple *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "cadences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (PPSCadence *)objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "cadences", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "type"), objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "value"));
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    v5 = -[PPSCadence initWithCadenceTuples:]([PPSCadence alloc], "initWithCadenceTuples:", v6);
  }
  else
  {
    v6 = 0;
  }

  return v5;
}

- (id)proto
{
  PPSPBCadence *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(PPSPBCadence);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PPSCadence cadenceTuples](self, "cadenceTuples", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setType:", objc_msgSend(v9, "type"));
        objc_msgSend(v10, "setValue:", objc_msgSend(v9, "value"));
        -[PPSPBCadence addCadences:](v3, "addCadences:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)cadenceEventSBC
{
  if (cadenceEventSBC_onceToken != -1)
    dispatch_once(&cadenceEventSBC_onceToken, &__block_literal_global_7);
  return (id)cadenceEventSBC__cadences;
}

void __29__PPSCadence_cadenceEventSBC__block_invoke()
{
  PPSCadenceTuple *v0;
  PPSCadence *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v0 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 1, 0);
  if (v0)
  {
    v1 = [PPSCadence alloc];
    v5[0] = v0;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[PPSCadence initWithCadenceTuples:](v1, "initWithCadenceTuples:", v2);
    v4 = (void *)cadenceEventSBC__cadences;
    cadenceEventSBC__cadences = v3;

  }
}

+ (id)cadenceInit
{
  if (cadenceInit_onceToken != -1)
    dispatch_once(&cadenceInit_onceToken, &__block_literal_global_16);
  return (id)cadenceInit__cadences;
}

void __25__PPSCadence_cadenceInit__block_invoke()
{
  PPSCadenceTuple *v0;
  PPSCadence *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v0 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 4, 0);
  if (v0)
  {
    v1 = [PPSCadence alloc];
    v5[0] = v0;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[PPSCadence initWithCadenceTuples:](v1, "initWithCadenceTuples:", v2);
    v4 = (void *)cadenceInit__cadences;
    cadenceInit__cadences = v3;

  }
}

+ (id)cadenceInit_EventSBC
{
  if (cadenceInit_EventSBC_onceToken != -1)
    dispatch_once(&cadenceInit_EventSBC_onceToken, &__block_literal_global_17_0);
  return (id)cadenceInit_EventSBC__cadences;
}

void __34__PPSCadence_cadenceInit_EventSBC__block_invoke()
{
  PPSCadenceTuple *v0;
  void *v1;
  PPSCadenceTuple *v2;
  void *v3;
  PPSCadence *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v0 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 4, 0);
  v1 = (void *)cadenceInit_EventSBC__eventInit;
  cadenceInit_EventSBC__eventInit = (uint64_t)v0;

  v2 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 1, 0);
  v3 = (void *)cadenceInit_EventSBC__eventSBC;
  cadenceInit_EventSBC__eventSBC = (uint64_t)v2;

  if (cadenceInit_EventSBC__eventInit)
  {
    if (cadenceInit_EventSBC__eventSBC)
    {
      v4 = [PPSCadence alloc];
      v8[0] = cadenceInit_EventSBC__eventInit;
      v8[1] = cadenceInit_EventSBC__eventSBC;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PPSCadence initWithCadenceTuples:](v4, "initWithCadenceTuples:", v5);
      v7 = (void *)cadenceInit_EventSBC__cadences;
      cadenceInit_EventSBC__cadences = v6;

    }
  }
}

+ (id)cadenceEventSBC_EventScreenStateChange
{
  if (cadenceEventSBC_EventScreenStateChange_onceToken != -1)
    dispatch_once(&cadenceEventSBC_EventScreenStateChange_onceToken, &__block_literal_global_19);
  return (id)cadenceEventSBC_EventScreenStateChange__cadences;
}

void __52__PPSCadence_cadenceEventSBC_EventScreenStateChange__block_invoke()
{
  PPSCadenceTuple *v0;
  void *v1;
  PPSCadenceTuple *v2;
  void *v3;
  PPSCadence *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v0 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 1, 0);
  v1 = (void *)cadenceEventSBC_EventScreenStateChange__eventSBC;
  cadenceEventSBC_EventScreenStateChange__eventSBC = (uint64_t)v0;

  v2 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 3, 2);
  v3 = (void *)cadenceEventSBC_EventScreenStateChange__eventScreenStateChange;
  cadenceEventSBC_EventScreenStateChange__eventScreenStateChange = (uint64_t)v2;

  if (cadenceEventSBC_EventScreenStateChange__eventSBC)
  {
    if (cadenceEventSBC_EventScreenStateChange__eventScreenStateChange)
    {
      v4 = [PPSCadence alloc];
      v8[0] = cadenceEventSBC_EventScreenStateChange__eventSBC;
      v8[1] = cadenceEventSBC_EventScreenStateChange__eventScreenStateChange;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PPSCadence initWithCadenceTuples:](v4, "initWithCadenceTuples:", v5);
      v7 = (void *)cadenceEventSBC_EventScreenStateChange__cadences;
      cadenceEventSBC_EventScreenStateChange__cadences = v6;

    }
  }
}

- (NSArray)cadenceTuples
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cadenceTuples, 0);
}

- (void)initWithCadenceTuples:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24399D000, log, OS_LOG_TYPE_ERROR, "Cadence Tuples empty or nil", v1, 2u);
}

@end
