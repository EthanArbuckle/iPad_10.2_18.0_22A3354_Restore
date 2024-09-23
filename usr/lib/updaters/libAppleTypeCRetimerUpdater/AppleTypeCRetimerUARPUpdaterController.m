@implementation AppleTypeCRetimerUARPUpdaterController

- (AppleTypeCRetimerUARPUpdaterController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5 forcingPower:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  AppleTypeCRetimerUARPUpdaterController *v11;
  uint64_t v12;
  ATCRTAPHardwareID *apHardwareID;
  objc_class *v14;
  void *v15;
  int ShouldSkipSameVersion;
  const char *v17;
  AppleTypeCRetimerUARPUpdaterController *v18;
  objc_super v20;

  v6 = a6;
  v10 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AppleTypeCRetimerUARPUpdaterController;
  v11 = -[AppleTypeCRetimerUpdaterHelper initWithOptions:logFunction:logContext:](&v20, sel_initWithOptions_logFunction_logContext_, v10, a4, a5);
  if (v11)
  {
    +[ATCRTAPHardwareID query](ATCRTAPHardwareID, "query");
    v12 = objc_claimAutoreleasedReturnValue();
    apHardwareID = v11->_apHardwareID;
    v11->_apHardwareID = (ATCRTAPHardwareID *)v12;

    if (v11->_apHardwareID)
    {
      if (-[AppleTypeCRetimerUARPUpdaterController initializeUpdaterInstancesForcingPower:](v11, "initializeUpdaterInstancesForcingPower:", v6))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AppleTypeCRetimerUpdaterHelper verboseLog:](v11, "verboseLog:", CFSTR("%@: options = %@"), v15, v10);

        if (-[AppleTypeCRetimerUARPUpdaterController initDebugFlags:](v11, "initDebugFlags:", v10))
        {
          ShouldSkipSameVersion = SoCUpdaterShouldSkipSameVersion(v10);
          v11->_skipSameVersion = ShouldSkipSameVersion;
          v17 = "No";
          if (ShouldSkipSameVersion)
            v17 = "Yes";
          -[AppleTypeCRetimerUpdaterHelper log:](v11, "log:", CFSTR("Skip same version: %s"), v17);
          goto LABEL_8;
        }
      }
    }
    else
    {
      -[AppleTypeCRetimerUpdaterHelper log:](v11, "log:", CFSTR("Failed to query AP hardware information"));
    }
    v18 = 0;
    goto LABEL_11;
  }
LABEL_8:
  v18 = v11;
LABEL_11:

  return v18;
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
  AppleTypeCRetimerUARPUpdaterInstance *v13;
  AppleTypeCRetimerUARPUpdaterInstance *v14;
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

  AppleTypeCRetimerGetRouterIDsForIicPrefix(CFSTR("uatcrt"));
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
        v13 = -[AppleTypeCRetimerUARPUpdaterInstance initWithRouterID:delegate:forcePower:]([AppleTypeCRetimerUARPUpdaterInstance alloc], "initWithRouterID:delegate:forcePower:", objc_msgSend(v12, "unsignedCharValue"), self, v3);
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

- (id)queryInfo
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableArray *obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  _QWORD v33[3];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_updaterInstances;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v27;
    v25 = 1;
    LODWORD(v4) = 1;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v6, "queryHardwareID");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Failed to query hardware ID for router ID %u"), objc_msgSend(v6, "routerID"));
          v14 = 0;
          goto LABEL_16;
        }
        v8 = (void *)v7;
        v9 = v3;
        v4 = objc_msgSend(v6, "useLocalSigning") & v4;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer%u,Ticket"), CFSTR("%u"), 0, v25 + i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = CFSTR("HardwareID");
        objc_msgSend(v8, "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v11;
        v33[1] = v10;
        v32[1] = CFSTR("TicketName");
        v32[2] = CFSTR("TagNumber");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v25 + i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v9;
        objc_msgSend(v9, "addObject:", v13);
        -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", CFSTR("ATCRT %u: %@"), objc_msgSend(v6, "routerID"), v8);
        -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", CFSTR("ATCRT %u: info = %@"), objc_msgSend(v6, "routerID"), v13);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      v25 = (v25 + i);
      if (v24)
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
    v15 = "No";
    if ((_DWORD)v4)
      v15 = "Yes";
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Using local signing: %s"), v15);
    v16 = (void *)MEMORY[0x24BDBCED8];
    v30[0] = CFSTR("InfoArray");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v17;
    v30[1] = CFSTR("LocalSigningID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryWithDictionary:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    obj = (NSMutableArray *)v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)performUpdateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  UARPSuperBinary *v6;
  UARPSuperBinary *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  UARPSuperBinary *v28;
  NSMutableArray *obj;
  void *v30;
  AppleTypeCRetimerUARPUpdaterController *v31;
  id v32;
  NSObject *group;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[4];
  id v40;
  AppleTypeCRetimerUARPUpdaterController *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", CFSTR("Perform update input = %@"), v4);
  v34 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[UARPSuperBinary initWithData:delegate:delegateQueue:]([UARPSuperBinary alloc], "initWithData:delegate:delegateQueue:", v5, 0, 0);
    v7 = v6;
    if (v6)
    {
      -[UARPSuperBinary getBver](v6, "getBver");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
      {
        v28 = v7;
        -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Candidate retimer firmware version: %@"), v8);
        group = dispatch_group_create();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = self;
        v32 = objc_alloc_init(MEMORY[0x24BDD1648]);
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        obj = self->_updaterInstances;
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v49;
          v13 = 1;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v49 != v12)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              v16 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v15, "name");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringWithFormat:", CFSTR("com.apple.%@.updater"), v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = objc_retainAutorelease(v18);
              v20 = dispatch_queue_create((const char *)objc_msgSend(v19, "UTF8String"), 0);
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __70__AppleTypeCRetimerUARPUpdaterController_performUpdateWithDictionary___block_invoke;
              block[3] = &unk_251CE3F98;
              v47 = v13 + i;
              v40 = v34;
              v41 = v31;
              v42 = v15;
              v43 = v5;
              v44 = v9;
              v45 = v32;
              v46 = v30;
              dispatch_group_async(group, v20, block);

            }
            v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
            v13 += i;
          }
          while (v11);
        }

        dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
        v21 = 1;
        v31->_isDone = 1;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v22 = v30;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v36;
          while (2)
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v36 != v25)
                objc_enumerationMutation(v22);
              if (!objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "BOOLValue"))
              {
                v21 = 0;
                goto LABEL_23;
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
            if (v24)
              continue;
            break;
          }
          v21 = 1;
        }
LABEL_23:

        v7 = v28;
      }
      else
      {
        -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Failed to locate Bver."));
        v21 = 0;
      }

    }
    else
    {
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Failed to parse super binary."));
      v21 = 0;
    }

  }
  else
  {
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Unable to locate super binary."));
    v21 = 0;
  }

  return v21;
}

void __70__AppleTypeCRetimerUARPUpdaterController_performUpdateWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer%u,Ticket"), CFSTR("%u"), 0, *(unsigned int *)(a1 + 88));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    objc_msgSend(*(id *)(a1 + 40), "log:", CFSTR("Warning: Unable to locate manifest for '%@'"), v6);
  v3 = objc_msgSend(*(id *)(a1 + 48), "performUpdateForSuperBinaryData:manifestData:apHardwareID:skipSameVersion:debugFlags:bver:", *(_QWORD *)(a1 + 56), v2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), *(_QWORD *)(a1 + 64));
  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "log:", CFSTR("Update failed for router ID %u"), objc_msgSend(*(id *)(a1 + 48), "routerID"));
  objc_msgSend(*(id *)(a1 + 72), "lock");
  v4 = *(void **)(a1 + 80);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(*(id *)(a1 + 72), "unlock");
}

- (BOOL)performReset
{
  void *v3;
  AppleTypeCRetimerUARPUpdaterController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t k;
  NSMutableArray *obj;
  id v28;
  NSObject *group;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD block[6];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  group = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v4 = self;
  obj = self->_updaterInstances;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.%@.apply"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_retainAutorelease(v12);
        v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __54__AppleTypeCRetimerUARPUpdaterController_performReset__block_invoke;
        block[3] = &unk_251CE3FC0;
        block[4] = v9;
        block[5] = v4;
        v39 = v28;
        v40 = v3;
        dispatch_group_async(group, v14, block);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v6);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  -[AppleTypeCRetimerUpdaterHelper log:](v4, "log:", CFSTR("Wait %u seconds for retimer(s) to reboot."), 2);
  sleep(2u);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = v3;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v35;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v15);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "BOOLValue"))
        {
          LOBYTE(v24) = 0;
          v20 = v15;
          goto LABEL_25;
        }
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v17)
        continue;
      break;
    }
  }

  -[AppleTypeCRetimerUpdaterHelper log:](v4, "log:", CFSTR("Verifying retimer(s) booted version."));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v4->_updaterInstances;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    v24 = 1;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v24 &= objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * k), "printVersions");
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
    }
    while (v22);
  }
  else
  {
    LOBYTE(v24) = 1;
  }
LABEL_25:

  return v24;
}

uint64_t __54__AppleTypeCRetimerUARPUpdaterController_performReset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "applyFirmware");
  if ((v2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "log:", CFSTR("Apply failed for router ID %u"), objc_msgSend(*(id *)(a1 + 32), "routerID"));
  objc_msgSend(*(id *)(a1 + 48), "lock");
  v3 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return objc_msgSend(*(id *)(a1 + 48), "unlock");
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apHardwareID, 0);
  objc_storeStrong((id *)&self->_updaterInstances, 0);
}

@end
