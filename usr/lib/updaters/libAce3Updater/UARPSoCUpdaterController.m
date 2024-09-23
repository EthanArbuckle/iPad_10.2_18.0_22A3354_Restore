@implementation UARPSoCUpdaterController

- (UARPSoCUpdaterController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  UARPSoCUpdaterController *v9;
  SoCUpdaterHelper *v10;
  SoCUpdaterHelper *log;
  uint64_t v12;
  NSMutableArray *updaters;
  int ShouldSkipSameVersion;
  const char *v15;
  void *v16;
  SoCUpdaterHelper *v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  NSString *restorePartition;
  void *v22;
  SoCUpdaterHelper *v23;
  objc_class *v24;
  void *v25;
  NSDictionary *personalizationRequests;
  UARPSoCUpdaterController *v27;
  objc_super v29;

  v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)UARPSoCUpdaterController;
  v9 = -[UARPSoCUpdaterController init](&v29, sel_init);
  if (v9)
  {
    v10 = -[SoCUpdaterHelper initWithOptions:logFunction:logContext:]([SoCUpdaterHelper alloc], "initWithOptions:logFunction:logContext:", v8, a4, a5);
    log = v9->_log;
    v9->_log = v10;

    v12 = objc_opt_new();
    updaters = v9->_updaters;
    v9->_updaters = (NSMutableArray *)v12;

    v9->_isDone = 0;
    if (!-[UARPSoCUpdaterController initializeUpdatersWithOptions:](v9, "initializeUpdatersWithOptions:", v8))
    {
      v27 = 0;
      goto LABEL_10;
    }
    ShouldSkipSameVersion = SoCUpdaterShouldSkipSameVersion(v8);
    v9->_skipSameVersion = ShouldSkipSameVersion;
    v15 = "No";
    if (ShouldSkipSameVersion)
      v15 = "Yes";
    -[SoCUpdaterHelper log:](v9->_log, "log:", CFSTR("Ace3 skip same version: %s"), v15);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Options"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9->_log;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](v17, "log:", CFSTR("%@: options = %@"), v19, v16);

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("RestoreSystemPartition"));
    v20 = objc_claimAutoreleasedReturnValue();
    restorePartition = v9->_restorePartition;
    v9->_restorePartition = (NSString *)v20;

    if (!v9->_restorePartition)
    {
      v9->_restorePartition = (NSString *)&stru_251CE20B8;

    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ForceLocalSigning"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_forceLocalSigning = objc_msgSend(v22, "BOOLValue");

    v23 = v9->_log;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper verboseLog:](v23, "verboseLog:", CFSTR("%@: _forceLocalSigning = %d"), v25, v9->_forceLocalSigning);

    personalizationRequests = v9->_personalizationRequests;
    v9->_personalizationRequests = 0;

  }
  v27 = v9;
LABEL_10:

  return v27;
}

- (id)firmwareTags
{
  void *v3;
  NSMutableArray *v4;
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
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_updaters;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "firmwareTagName", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)ticketNameTags
{
  void *v3;
  NSMutableArray *v4;
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
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_updaters;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "ticketName", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)queryInfo
{
  uint64_t v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!-[NSMutableArray count](self->_updaters, "count"))
    return 0;
  if (self->_forceLocalSigning)
  {
    v3 = 1;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = self->_updaters;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "useLocalSigning", (_QWORD)v17) & 1) != 0)
          {
            v3 = 1;
            goto LABEL_15;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v7)
          continue;
        break;
      }
    }
    v3 = 0;
LABEL_15:

  }
  v22[0] = self;
  v21[0] = CFSTR("UpdaterRef");
  v21[1] = CFSTR("TicketName");
  -[NSMutableArray objectAtIndexedSubscript:](self->_updaters, "objectAtIndexedSubscript:", 0, (_QWORD)v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ticketName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  v21[2] = CFSTR("RestoreSystemPartition");
  -[UARPSoCUpdaterController restorePartition](self, "restorePartition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v12;
  v21[3] = CFSTR("LocalSigningID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v13;
  v21[4] = CFSTR("ManifestPrefix");
  -[NSMutableArray objectAtIndexedSubscript:](self->_updaters, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "manifestPrefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)offerFirmwareDataWithDictionary:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *personalizationRequests;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSDictionary *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", CFSTR("%s: options = %@"), "-[UARPSoCUpdaterController offerFirmwareDataWithDictionary:]", v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  personalizationRequests = self->_updaters;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](personalizationRequests, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(personalizationRequests);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isDone"))
        {
          -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", CFSTR("%s: Skipping Offer Firmware. Updater(LUN:%d,RouterID:%d) has finished."), "-[UARPSoCUpdaterController offerFirmwareDataWithDictionary:]", objc_msgSend(v11, "logicUnitNumber"), objc_msgSend(v11, "routerID"));
        }
        else
        {
          if (!-[UARPSoCUpdaterController offerFirmwareForUpdater:inputDict:](self, "offerFirmwareForUpdater:inputDict:", v11, v4))
          {
            v14 = 0;
            goto LABEL_14;
          }
          objc_msgSend(v11, "personalizationRequestDict");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addEntriesFromDictionary:", v12);

        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](personalizationRequests, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  personalizationRequests = (NSMutableArray *)self->_personalizationRequests;
  self->_personalizationRequests = v13;
  v14 = 1;
LABEL_14:

  return v14;
}

- (BOOL)offerPersonalizationDataWithDictionary:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", CFSTR("%s: %@"), "-[UARPSoCUpdaterController offerPersonalizationDataWithDictionary:]", v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_updaters;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isDone"))
        {
          -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", CFSTR("%s: Skipping Offer Tss Response. Updater(LUN:%d,RouterID:%d) has finished."), "-[UARPSoCUpdaterController offerPersonalizationDataWithDictionary:]", objc_msgSend(v10, "logicUnitNumber"), objc_msgSend(v10, "routerID"));
        }
        else if (!objc_msgSend(v10, "offerPersonalizationResponse:", v4))
        {
          v11 = 0;
          goto LABEL_13;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)applyStagedFirmware
{
  BOOL v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = 1;
  self->_isDone = 1;
  -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", CFSTR("%s"), "-[UARPSoCUpdaterController applyStagedFirmware]");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_updaters;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDone"))
        {
          -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", CFSTR("%s: Skipping Apply. Updater(LUN:%d,RouterID:%d) has finished."), "-[UARPSoCUpdaterController applyStagedFirmware]", objc_msgSend(v9, "logicUnitNumber"), objc_msgSend(v9, "routerID"));
        }
        else
        {
          if (!objc_msgSend(v9, "applyStagedFirmware"))
          {
            v3 = 0;
            goto LABEL_15;
          }
          if ((objc_msgSend(v9, "isDone") & 1) == 0)
          {
            -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", CFSTR("%s: Updating is not finish yet for unit with LUN: %d, RouterID: %d"), "-[UARPSoCUpdaterController applyStagedFirmware]", objc_msgSend(v9, "logicUnitNumber"), objc_msgSend(v9, "routerID"));
            self->_isDone = 0;
          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
    v3 = 1;
  }
LABEL_15:

  return v3;
}

- (NSDictionary)personalizationRequests
{
  return self->_personalizationRequests;
}

- (id)createUpdaterInstanceFor:(unsigned int)a3 helper:(id)a4 options:(id)a5
{
  -[SoCUpdaterHelper log:](self->_log, "log:", CFSTR("%s: error subclass needs to override this method"), a4, a5, "-[UARPSoCUpdaterController createUpdaterInstanceFor:helper:options:]");
  return 0;
}

- (unsigned)numberOfAvailableUnits
{
  -[SoCUpdaterHelper log:](self->_log, "log:", CFSTR("%s: error subclass needs to override this property"), "-[UARPSoCUpdaterController numberOfAvailableUnits]");
  return 0;
}

- (BOOL)initializeUpdatersWithOptions:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  SoCUpdaterHelper *log;
  const __CFString *v12;
  uint64_t v14;

  v4 = a3;
  v5 = -[UARPSoCUpdaterController numberOfAvailableUnits](self, "numberOfAvailableUnits");
  if (v5)
  {
    v6 = v5;
    v7 = 1;
    while (1)
    {
      -[UARPSoCUpdaterController createUpdaterInstanceFor:helper:options:](self, "createUpdaterInstanceFor:helper:options:", v7, self->_log, v4);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        break;
      v9 = (void *)v8;
      -[NSMutableArray addObject:](self->_updaters, "addObject:", v8);
      -[SoCUpdaterHelper log:](self->_log, "log:", CFSTR("Created updater instance for LUN %d"), v7);

      v7 = (v7 + 1);
      if (v7 > v6)
      {
        v10 = 1;
        goto LABEL_9;
      }
    }
    log = self->_log;
    v14 = v7;
    v12 = CFSTR("Failed to create updater instance for LUN %d");
  }
  else
  {
    log = self->_log;
    v12 = CFSTR("No available units to be updated");
  }
  -[SoCUpdaterHelper log:](log, "log:", v12, v14);
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)offerFirmwareForUpdater:(id)a3 inputDict:(id)a4
{
  id v6;
  SoCUpdaterHelper *log;
  id v8;
  void *v9;
  char v10;

  v6 = a3;
  log = self->_log;
  v8 = a4;
  -[SoCUpdaterHelper verboseLog:](log, "verboseLog:", CFSTR("%s: options = %@"), "-[UARPSoCUpdaterController offerFirmwareForUpdater:inputDict:]", v8);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v6, "offerFirmwareData:", v9);
  }
  else
  {
    -[SoCUpdaterHelper log:](self->_log, "log:", CFSTR("%s: Unable to locate firmware data."), "-[UARPSoCUpdaterController offerFirmwareForUpdater:inputDict:]");
    v10 = 0;
  }

  return v10;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (NSString)restorePartition
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restorePartition, 0);
  objc_storeStrong((id *)&self->_personalizationRequests, 0);
  objc_storeStrong((id *)&self->_updaters, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
