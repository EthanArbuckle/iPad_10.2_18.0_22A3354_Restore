@implementation AppleTypeCRetimerUpdateController

- (AppleTypeCRetimerUpdateController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5 forcingPower:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  AppleTypeCRetimerUpdateController *v11;
  uint64_t v12;
  ATCRTAPHardwareID *apHardwareID;
  objc_class *v14;
  void *v15;
  void *v16;
  AppleTypeCRetimerUpdateController *v17;
  objc_super v19;

  v6 = a6;
  v10 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AppleTypeCRetimerUpdateController;
  v11 = -[AppleTypeCRetimerUpdaterHelper initWithOptions:logFunction:logContext:](&v19, sel_initWithOptions_logFunction_logContext_, v10, a4, a5);
  if (!v11)
    goto LABEL_8;
  +[ATCRTAPHardwareID query](ATCRTAPHardwareID, "query");
  v12 = objc_claimAutoreleasedReturnValue();
  apHardwareID = v11->_apHardwareID;
  v11->_apHardwareID = (ATCRTAPHardwareID *)v12;

  if (!v11->_apHardwareID)
  {
    -[AppleTypeCRetimerUpdaterHelper log:](v11, "log:", CFSTR("Failed to query AP hardware information"));
    goto LABEL_11;
  }
  if (!-[AppleTypeCRetimerUpdateController initializeUpdaterInstancesForcingPower:](v11, "initializeUpdaterInstancesForcingPower:", v6))
  {
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleTypeCRetimerUpdaterHelper verboseLog:](v11, "verboseLog:", CFSTR("%@: options = %@"), v15, v10);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SingleStepMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11->_singleStepMode = objc_msgSend(v16, "BOOLValue");
  if (!-[AppleTypeCRetimerUpdateController initDebugFlags:](v11, "initDebugFlags:", v10))
  {

    goto LABEL_11;
  }
  v11->_skipSameVersion = -[AppleTypeCRetimerUpdateController shouldSkipSameVersion:](v11, "shouldSkipSameVersion:", v10);

LABEL_8:
  v17 = v11;
LABEL_12:

  return v17;
}

- (BOOL)initializeUpdaterInstancesForcingPower:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  NSMutableArray *updaterInstances;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  AppleTypeCRetimerUpdaterInstance *v13;
  AppleTypeCRetimerUpdaterInstance *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  updaterInstances = self->_updaterInstances;
  self->_updaterInstances = v5;

  +[AppleTypeCRetimerUpdaterIIC getRouterIDs](AppleTypeCRetimerUpdaterIIC, "getRouterIDs");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = -[AppleTypeCRetimerUpdaterInstance initWithRouterID:delegate:forcePower:]([AppleTypeCRetimerUpdaterInstance alloc], "initWithRouterID:delegate:forcePower:", objc_msgSend(v12, "unsignedCharValue"), self, v3);
        if (!v13)
        {
          -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Failed to create updater instance for router ID %@"), v12);
          v15 = 0;
          goto LABEL_11;
        }
        v14 = v13;
        -[NSMutableArray addObject:](self->_updaterInstances, "addObject:", v13);
        -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Created updater instance for router ID %@"), v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (id)queryInfoSingleStep
{
  unint64_t updaterIndex;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  updaterIndex = self->_updaterIndex;
  if (updaterIndex >= -[NSMutableArray count](self->_updaterInstances, "count"))
  {
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Too many queryInfo calls!"));
    return 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_updaterInstances, "objectAtIndexedSubscript:", self->_updaterIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryHardwareID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (LOBYTE(self->_updaterIndex) + 1);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer%u,Ticket"), CFSTR("%u"), 0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = CFSTR("HardwareID");
      objc_msgSend(v5, "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v16[1] = v7;
      v15[1] = CFSTR("TicketName");
      v15[2] = CFSTR("TagNumber");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v9;
      v15[3] = CFSTR("LocalSigningID");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "useLocalSigning"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[3] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", CFSTR("ATCRT %u: %@"), objc_msgSend(v4, "routerID"), v5);
      -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", CFSTR("ATCRT %u: info = %@"), objc_msgSend(v4, "routerID"), v11);
      v12 = objc_msgSend(v4, "useLocalSigning");
      v13 = "No";
      if (v12)
        v13 = "Yes";
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Using local signing: %s"), v13);

    }
    else
    {
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Failed to query hardware ID for router ID %u"), objc_msgSend(v4, "routerID"));
      v11 = 0;
    }

    return v11;
  }
}

- (id)queryInfoAggregate
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[3];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_updaterInstances;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v30;
    v28 = 1;
    LODWORD(v4) = 1;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        v6 = v3;
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v7, "queryHardwareID");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Failed to query hardware ID for router ID %u"), objc_msgSend(v7, "routerID"));
          v14 = 0;
          v15 = obj;
          goto LABEL_18;
        }
        v9 = (void *)v8;
        v4 = objc_msgSend(v7, "useLocalSigning") & v4;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer%u,Ticket"), CFSTR("%u"), 0, v28 + i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = CFSTR("HardwareID");
        objc_msgSend(v9, "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v11;
        v36[1] = v10;
        v35[1] = CFSTR("TicketName");
        v35[2] = CFSTR("TagNumber");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v28 + i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v36[2] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v6;
        objc_msgSend(v6, "addObject:", v13);
        -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", CFSTR("ATCRT %u: %@"), objc_msgSend(v7, "routerID"), v9);
        -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", CFSTR("ATCRT %u: info = %@"), objc_msgSend(v7, "routerID"), v13);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      v28 = (v28 + i);
      if (v27)
        continue;
      break;
    }
  }
  else
  {
    v4 = 1;
  }

  if (objc_msgSend(v3, "count"))
  {
    v16 = "No";
    if ((_DWORD)v4)
      v16 = "Yes";
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Using local signing: %s"), v16);
    v17 = (void *)MEMORY[0x24BDBCED8];
    v33[0] = CFSTR("InfoArray");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v18;
    v33[1] = CFSTR("LocalSigningID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithDictionary:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[ATCRTAPHardwareID query](ATCRTAPHardwareID, "query");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "personalizationParameters");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("APInfo"));

    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)queryInfo
{
  if (self->_singleStepMode)
    -[AppleTypeCRetimerUpdateController queryInfoSingleStep](self, "queryInfoSingleStep");
  else
    -[AppleTypeCRetimerUpdateController queryInfoAggregate](self, "queryInfoAggregate");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldSkipSameVersion:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  unsigned __int8 v8;
  const char *v9;
  char v10;
  char v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RestoreInternal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SkipSameVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");
  v9 = "No";
  if ((v8 & 1) != 0 || !v6)
  {
    if (v7)
      v11 = v6;
    else
      v11 = 1;
    v10 = v11 | v8;
    if (((v11 | v8) & 1) != 0)
      v9 = "Yes";
  }
  else
  {
    v10 = 0;
  }
  -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Skip same version: %s"), v9);

  return v10 & 1;
}

- (BOOL)initDebugFlags:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  objc_class *v10;
  void *v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DebugFlags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Unexpected type for retimer debug flags: %@"), v11);

LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v6 = objc_retainAutorelease(v5);
  v7 = strtoull((const char *)objc_msgSend(v6, "UTF8String"), 0, 0);
  v8 = v7;
  if (v7)
  {
    if (v7 != -1 || *__error() != 34)
      goto LABEL_6;
    goto LABEL_10;
  }
  if (*__error() == 22)
  {
LABEL_10:
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Unable to convert '%@' retimer debug flags string to a 64 bit number"), v6);
    goto LABEL_11;
  }
LABEL_6:
  self->_debugFlags = v8;
LABEL_7:
  v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)performUpdateWithDictionaryAggregate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  BOOL v19;
  NSMutableArray *obj;
  void *v22;
  void *v23;
  NSObject *group;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD block[4];
  id v30;
  AppleTypeCRetimerUpdateController *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", CFSTR("Perform update input = %@"), v4);
  v23 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = self->_updaterInstances;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        dispatch_get_global_queue(-2, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __74__AppleTypeCRetimerUpdateController_performUpdateWithDictionaryAggregate___block_invoke;
        block[3] = &unk_251CE3E08;
        v36 = v10 + i;
        v30 = v23;
        v31 = self;
        v32 = v12;
        v33 = v22;
        v34 = v6;
        v35 = v5;
        dispatch_group_async(group, v13, block);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      v10 += i;
    }
    while (v8);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    while (2)
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "BOOLValue"))
        {
          v19 = 0;
          goto LABEL_18;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
      if (v16)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_18:

  return v19;
}

void __74__AppleTypeCRetimerUpdateController_performUpdateWithDictionaryAggregate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer%u,Ticket"), CFSTR("%u"), 0, *(unsigned int *)(a1 + 80));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    objc_msgSend(*(id *)(a1 + 40), "log:", CFSTR("Warning: Unable to locate manifest for '%@'"), v6);
  v3 = objc_msgSend(*(id *)(a1 + 48), "performUpdateForFTABData:manifestData:apHardwareID:skipSameVersion:debugFlags:", *(_QWORD *)(a1 + 56), v2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 57), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "log:", CFSTR("Update failed for router ID %u"), objc_msgSend(*(id *)(a1 + 48), "routerID"));
  objc_msgSend(*(id *)(a1 + 64), "lock");
  v4 = *(void **)(a1 + 72);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(*(id *)(a1 + 64), "unlock");
}

- (BOOL)performUpdateWithDictionarySingleStep:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", CFSTR("Perform update input = %@"), v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasSuffix:", CFSTR("Ticket")))
        {
          v12 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  if (!v12)
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Warning: Unable to locate ticket name: %@"), v6);
  objc_msgSend(v6, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Warning: Unable to locate manifest: %@"), v6);
  -[NSMutableArray objectAtIndexedSubscript:](self->_updaterInstances, "objectAtIndexedSubscript:", self->_updaterIndex);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "performUpdateForFTABData:manifestData:apHardwareID:skipSameVersion:debugFlags:", v5, v13, self->_apHardwareID, self->_skipSameVersion, self->_debugFlags);
  if ((v15 & 1) == 0)
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Update failed for router ID %u"), objc_msgSend(v14, "routerID"));
  ++self->_updaterIndex;

  return v15;
}

- (BOOL)performUpdateWithDictionary:(id)a3
{
  if (self->_singleStepMode)
    return -[AppleTypeCRetimerUpdateController performUpdateWithDictionarySingleStep:](self, "performUpdateWithDictionarySingleStep:", a3);
  self->_aggregateUpdateComplete = 1;
  return -[AppleTypeCRetimerUpdateController performUpdateWithDictionaryAggregate:](self, "performUpdateWithDictionaryAggregate:", a3);
}

- (void)performReset
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_updaterInstances;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "performReset");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  sleep(1u);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_updaterInstances;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "printVersions", (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

- (BOOL)isDoneSingleStep
{
  unint64_t updaterIndex;

  updaterIndex = self->_updaterIndex;
  return updaterIndex == -[NSMutableArray count](self->_updaterInstances, "count");
}

- (BOOL)isDoneAggregate
{
  return self->_aggregateUpdateComplete;
}

- (BOOL)isDone
{
  if (self->_singleStepMode)
    return -[AppleTypeCRetimerUpdateController isDoneSingleStep](self, "isDoneSingleStep");
  else
    return -[AppleTypeCRetimerUpdateController isDoneAggregate](self, "isDoneAggregate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apHardwareID, 0);
  objc_storeStrong((id *)&self->_updaterInstances, 0);
}

@end
