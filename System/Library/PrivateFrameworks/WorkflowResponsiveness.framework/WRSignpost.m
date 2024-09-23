@implementation WRSignpost

- (WRSignpost)initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 eventIdentifierFieldName:(id)a6 individuationFieldName:(id)a7 environmentFieldNames:(id)a8 networkBound:(BOOL)a9 diagnostics:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  WRSignpost *v23;
  uint64_t v24;
  NSString *subsystem;
  uint64_t v26;
  NSString *category;
  uint64_t v28;
  NSString *name;
  uint64_t v30;
  NSString *eventIdentifierFieldName;
  uint64_t v32;
  NSString *individuationFieldName;
  uint64_t v34;
  NSArray *environmentFieldNames;
  uint64_t v36;
  NSArray *diagnostics;
  objc_super v39;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)WRSignpost;
  v23 = -[WRSignpost init](&v39, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    subsystem = v23->_subsystem;
    v23->_subsystem = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    category = v23->_category;
    v23->_category = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    name = v23->_name;
    v23->_name = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    eventIdentifierFieldName = v23->_eventIdentifierFieldName;
    v23->_eventIdentifierFieldName = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    individuationFieldName = v23->_individuationFieldName;
    v23->_individuationFieldName = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    environmentFieldNames = v23->_environmentFieldNames;
    v23->_environmentFieldNames = (NSArray *)v34;

    v23->_networkBound = a9;
    v36 = objc_msgSend(v22, "copy");
    diagnostics = v23->_diagnostics;
    v23->_diagnostics = (NSArray *)v36;

  }
  return v23;
}

- (uint64_t)matchesSignpost:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_8;
  objc_msgSend(v3, "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6))
    goto LABEL_7;
  objc_msgSend(v4, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v8))
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v12 = 1;
LABEL_9:

  return v12;
}

- (uint64_t)hasChangesRelativeTo:(id)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  unint64_t v19;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && a1 != v3)
  {
    objc_msgSend(a1, "diagnostics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend(v4, "diagnostics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 == v9)
    {
      objc_msgSend(a1, "diagnostics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
      {
        v12 = 0;
        do
        {
          objc_msgSend(a1, "diagnostics");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "diagnostics");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v14, "isEqual:", v16);
          if (!v17)
            break;
          ++v12;
          objc_msgSend(a1, "diagnostics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

        }
        while (v12 < v19);
        v5 = v17 ^ 1u;
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WRSignpost *v4;
  BOOL v5;

  v4 = (WRSignpost *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[WRSignpost compare:](self, "compare:", v4) == 0;
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WRSignpost subsystem](self, "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    -[WRSignpost category](self, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v9);

    if (!v7)
    {
      -[WRSignpost name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "compare:", v11);

    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WRSignpost name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)debugDescription
{
  id v3;
  NSString *subsystem;
  NSString *category;
  NSString *name;
  const __CFString *eventIdentifierFieldName;
  NSString *individuationFieldName;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  subsystem = self->_subsystem;
  category = self->_category;
  name = self->_name;
  if (self->_eventIdentifierIsSignpostID)
    eventIdentifierFieldName = CFSTR("signpost id");
  else
    eventIdentifierFieldName = (const __CFString *)self->_eventIdentifierFieldName;
  individuationFieldName = self->_individuationFieldName;
  -[NSArray debugDescription](self->_environmentFieldNames, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:%@:%@ (event:%@ indiv:%@ env:%@ thresholds:%lu)"), subsystem, category, name, eventIdentifierFieldName, individuationFieldName, v9, -[NSArray count](self->_diagnostics, "count"));

  return v10;
}

- (int)diagnosticThresholdCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[WRSignpost diagnostics](self, "diagnostics", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v6, "hasTriggerThresholdCount") & 1) != 0)
        {
          LODWORD(v3) = objc_msgSend(v6, "triggerThresholdCount");
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasDiagnosticThresholdCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[WRSignpost diagnostics](self, "diagnostics", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasTriggerThresholdCount") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (double)diagnosticThresholdIntervalSeconds
{
  void *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WRSignpost diagnostics](self, "diagnostics", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  v4 = 0.0;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasTriggerThresholdDurationSum") & 1) != 0)
        {
          objc_msgSend(v8, "triggerThresholdDurationSum");
          v4 = v9;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (uint64_t)hasDiagnosticThresholdIntervalSeconds
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  objc_msgSend(a1, "diagnostics", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "hasTriggerThresholdDurationSum") & 1) != 0)
        {
          v2 = 1;
          goto LABEL_12;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_12:

  return v2;
}

- (NSString)subsystem
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)eventIdentifierFieldName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)eventIdentifierIsSignpostID
{
  return self->_eventIdentifierIsSignpostID;
}

- (NSString)individuationFieldName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)environmentFieldNames
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)networkBound
{
  return self->_networkBound;
}

- (NSArray)diagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)hasDiagnosticThresholdInterval
{
  return self->_hasDiagnosticThresholdInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_environmentFieldNames, 0);
  objc_storeStrong((id *)&self->_individuationFieldName, 0);
  objc_storeStrong((id *)&self->_eventIdentifierFieldName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end
