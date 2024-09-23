@implementation PSYSyncSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_deepCopy
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init((Class)objc_opt_class());
  -[PSYSyncSession pairingIdentifier](self, "pairingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPairingIdentifier:", v4);

  objc_msgSend(v3, "setSwitchIndex:", -[PSYSyncSession switchIndex](self, "switchIndex"));
  -[PSYSyncSession sessionIdentifier](self, "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionIdentifier:", v5);

  objc_msgSend(v3, "setSyncSessionType:", -[PSYSyncSession syncSessionType](self, "syncSessionType"));
  objc_msgSend(v3, "setSupportsMigrationSync:", -[PSYSyncSession supportsMigrationSync](self, "supportsMigrationSync"));
  v6 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[PSYSyncSession activities](self, "activities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
  objc_msgSend(v3, "setActivities:", v8);

  objc_msgSend(v3, "setSyncSessionState:", -[PSYSyncSession syncSessionState](self, "syncSessionState"));
  return v3;
}

- (PSYSyncSession)initWithPairingIdentifier:(id)a3 switchIndex:(int64_t)a4 sessionIdentifier:(id)a5 syncSessionType:(unint64_t)a6 supportsMigrationSync:(BOOL)a7 activities:(id)a8 state:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  PSYSyncSession *v19;
  PSYSyncSession *v20;
  uint64_t v21;
  NSArray *activities;
  objc_super v24;

  v16 = a3;
  v17 = a5;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PSYSyncSession;
  v19 = -[PSYSyncSession init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_pairingIdentifier, a3);
    v20->_switchIndex = a4;
    objc_storeStrong((id *)&v20->_sessionIdentifier, a5);
    v20->_supportsMigrationSync = a7;
    v20->_syncSessionType = a6;
    v21 = objc_msgSend(v18, "copy");
    activities = v20->_activities;
    v20->_activities = (NSArray *)v21;

    v20->_syncSessionState = a9;
  }

  return v20;
}

- (PSYSyncSession)initWithCoder:(id)a3
{
  id v4;
  PSYSyncSession *v5;
  uint64_t v6;
  NSUUID *pairingIdentifier;
  uint64_t v8;
  NSUUID *sessionIdentifier;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSYSyncSession;
  v5 = -[PSYSyncSession init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    pairingIdentifier = v5->_pairingIdentifier;
    v5->_pairingIdentifier = (NSUUID *)v6;

    v5->_switchIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("switchIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v8;

    v5->_syncSessionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syncSessionType"));
    v5->_supportsMigrationSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMigrationSync"));
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("activities"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSYSyncSession setActivities:](v5, "setActivities:", v13);
    v5->_syncSessionState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syncSessionState"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *pairingIdentifier;
  id v5;

  pairingIdentifier = self->_pairingIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pairingIdentifier, CFSTR("pairingIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_syncSessionType, CFSTR("syncSessionType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsMigrationSync, CFSTR("isMigrationSync"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activities, CFSTR("activities"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_syncSessionState, CFSTR("syncSessionState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_switchIndex, CFSTR("switchIndex"));

}

- (void)setActivities:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *activities;
  NSDictionary *v7;
  NSDictionary *activityMap;
  id v9;

  if (self->_activities != a3)
  {
    v4 = a3;
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    activities = self->_activities;
    self->_activities = v5;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("activityInfo.label"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v9);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    activityMap = self->_activityMap;
    self->_activityMap = v7;

  }
}

- (id)firstIncompleteActivity
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
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
  -[PSYSyncSession activities](self, "activities", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "activityState") != 2)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)runningActivities
{
  void *v3;
  void *v4;
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
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PSYSyncSession activities](self, "activities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "activityState") == 1)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)incompleteActivities
{
  void *v3;
  void *v4;
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
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PSYSyncSession activities](self, "activities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "activityState") != 2)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)completedActivities
{
  void *v3;
  void *v4;
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
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PSYSyncSession activities](self, "activities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "activityState") == 2)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)completedActivityLabelsSet
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PSYSyncSession activities](self, "activities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "activityState") == 2)
        {
          objc_msgSend(v9, "activityInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "label");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)activityForLabel:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_activityMap, "objectForKeyedSubscript:", a3);
}

- (id)activityForService:(id)a3
{
  id v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_activityMap;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      -[NSDictionary objectForKeyedSubscript:](self->_activityMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), (_QWORD)v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activityInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "machServiceName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v4);

      if ((v13 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (id)syncSessionByUpdatingActivities:(id)a3
{
  id v4;
  PSYSyncSession *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PSYSyncSession *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v5;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        -[PSYSyncSession syncSessionByReplacingActivity:](v10, "syncSessionByReplacingActivity:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v5 = (PSYSyncSession *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)syncSessionByReplacingActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *activities;
  id v8;
  uint64_t v9;
  PSYSyncSession *v10;
  uint64_t v11;
  void *v12;
  size_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(v4, "activityInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  activities = self->_activities;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __49__PSYSyncSession_syncSessionByReplacingActivity___block_invoke;
  v21[3] = &unk_24C5E54D0;
  v8 = v6;
  v22 = v8;
  v9 = -[NSArray indexOfObjectPassingTest:](activities, "indexOfObjectPassingTest:", v21);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v11 = v9;
    -[NSArray objectAtIndexedSubscript:](self->_activities, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", v4))
    {
      v10 = self;
    }
    else
    {
      v13 = -[NSArray count](self->_activities, "count");
      v14 = malloc_type_calloc(v13, 8uLL, 0x80040B8603338uLL);
      if (!v14)
      {
        psy_log();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

        if (v19)
        {
          psy_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[PSYSyncSession syncSessionByReplacingActivity:].cold.1(v20);

        }
        abort();
      }
      v15 = v14;
      -[NSArray getObjects:range:](self->_activities, "getObjects:range:", v14, 0, v13);
      v15[v11] = v4;
      -[PSYSyncSession _deepCopy](self, "_deepCopy");
      v10 = (PSYSyncSession *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSYSyncSession setActivities:](v10, "setActivities:", v16);
      free(v15);

    }
  }

  return v10;
}

uint64_t __49__PSYSyncSession_syncSessionByReplacingActivity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "activityInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)syncSessionByUpdatingSyncSessionState:(unint64_t)a3
{
  PSYSyncSession *v4;

  if (self->_syncSessionState == a3)
  {
    v4 = self;
  }
  else
  {
    v4 = (PSYSyncSession *)objc_alloc_init((Class)objc_opt_class());
    objc_storeStrong((id *)&v4->_pairingIdentifier, self->_pairingIdentifier);
    v4->_switchIndex = self->_switchIndex;
    objc_storeStrong((id *)&v4->_sessionIdentifier, self->_sessionIdentifier);
    -[PSYSyncSession setActivities:](v4, "setActivities:", self->_activities);
    v4->_syncSessionType = self->_syncSessionType;
    v4->_supportsMigrationSync = self->_supportsMigrationSync;
    v4->_syncSessionState = a3;
  }
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSUUID hash](self->_sessionIdentifier, "hash");
  v4 = -[NSUUID hash](self->_pairingIdentifier, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_activities, "hash") ^ self->_switchIndex;
}

- (BOOL)isEqual:(id)a3
{
  PSYSyncSession *v4;
  PSYSyncSession *v5;
  PSYSyncSession *v6;
  char v7;

  v4 = (PSYSyncSession *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (v5->_syncSessionType == self->_syncSessionType
        && v5->_supportsMigrationSync == self->_supportsMigrationSync
        && v5->_syncSessionState == self->_syncSessionState
        && -[NSUUID isEqual:](v5->_pairingIdentifier, "isEqual:", self->_pairingIdentifier)
        && v6->_switchIndex == self->_switchIndex
        && -[NSUUID isEqual:](v6->_sessionIdentifier, "isEqual:", self->_sessionIdentifier))
      {
        v7 = -[NSArray isEqualToArray:](v6->_activities, "isEqualToArray:", self->_activities);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (double)sessionProgress
{
  double result;
  NSUInteger v4;
  unint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  result = 1.0;
  if (self->_syncSessionState != 2)
  {
    v4 = -[NSArray count](self->_activities, "count", 1.0);
    if (v4)
    {
      v5 = v4;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = self->_activities;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v16;
        v11 = 0.0;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v6);
            v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            if (objc_msgSend(v13, "activityState", (_QWORD)v15) == 2)
            {
              ++v9;
            }
            else if (objc_msgSend(v13, "activityState") == 1)
            {
              objc_msgSend(v13, "activityProgress");
              v11 = v11 + v14;
            }
          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v8);
      }
      else
      {
        v9 = 0;
        v11 = 0.0;
      }

      return v11 / (double)v5 + (double)v9 / (double)v5;
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  unint64_t syncSessionState;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v34;
  NSArray *obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_pairingIdentifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_switchIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_sessionIdentifier, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringfromPSYSyncSessionType(self->_syncSessionType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_supportsMigrationSync)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  syncSessionState = self->_syncSessionState;
  if (syncSessionState > 2)
    v12 = &stru_24C5E5898;
  else
    v12 = off_24C5E54F0[syncSessionState];
  -[PSYSyncSession sessionProgress](self, "sessionProgress");
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p;\n\tpairingID=%@[%@] session=%@ type=%@ migration=%@ state='%@' progress=%1.3f activities:\n"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
    v12,
    v13);

  v40 = 0;
  v34 = objc_msgSend(MEMORY[0x24BE6E630], "getDropoutCounter:", &v40);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = self->_activities;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v19 = (void *)objc_msgSend(CFSTR("\t"), "mutableCopy");
        objc_msgSend(v18, "activityInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.pairedsync."), &stru_24C5E5898);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = objc_msgSend(v18, "activityState");
        v24 = &stru_24C5E5898;
        if (v23 <= 2)
          v24 = off_24C5E54F0[v23];
        objc_msgSend(v19, "appendFormat:", CFSTR("%@ '%@'"), v22, v24);
        if (objc_msgSend(v18, "activityState") == 1)
        {
          if (objc_msgSend(v18, "sawADropout"))
            v25 = 49;
          else
            v25 = 63;
          if (!objc_msgSend(v18, "startDropoutCount"))
            goto LABEL_28;
          v26 = objc_msgSend(v18, "startDropoutCount");
          v27 = v34;
          if (v26 != v40)
            v27 = 1;
          v28 = v27 == 0;
        }
        else
        {
          if (!objc_msgSend(v18, "activityState"))
          {
            v25 = 63;
            goto LABEL_28;
          }
          v28 = objc_msgSend(v18, "sawADropout") == 0;
        }
        if (v28)
          v25 = 48;
        else
          v25 = 49;
LABEL_28:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" X%c"), v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appendString:", v29);

        if (objc_msgSend(v18, "activityState") == 1)
        {
          objc_msgSend(v18, "activityProgress");
          objc_msgSend(v19, "appendFormat:", CFSTR("; progress=%1.3f"), v30);
        }
        else if (objc_msgSend(v18, "activityState") == 2)
        {
          objc_msgSend(v18, "error");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(v18, "error");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "appendFormat:", CFSTR("; error=\"%@\"), v32);

          }
        }
        objc_msgSend(v3, "appendString:", v19);
        objc_msgSend(v3, "appendString:", CFSTR("\n"));

      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v15);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unint64_t)syncSessionType
{
  if (self->_syncSessionType == 2 && !self->_supportsMigrationSync)
    return 0;
  else
    return self->_syncSessionType;
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairingIdentifier, a3);
}

- (int64_t)switchIndex
{
  return self->_switchIndex;
}

- (void)setSwitchIndex:(int64_t)a3
{
  self->_switchIndex = a3;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (void)setSyncSessionType:(unint64_t)a3
{
  self->_syncSessionType = a3;
}

- (BOOL)supportsMigrationSync
{
  return self->_supportsMigrationSync;
}

- (void)setSupportsMigrationSync:(BOOL)a3
{
  self->_supportsMigrationSync = a3;
}

- (NSArray)activities
{
  return self->_activities;
}

- (unint64_t)syncSessionState
{
  return self->_syncSessionState;
}

- (void)setSyncSessionState:(unint64_t)a3
{
  self->_syncSessionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_activityMap, 0);
}

- (void)syncSessionByReplacingActivity:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CFE4000, log, OS_LOG_TYPE_ERROR, "Error allocating memory. Aborting!!!", v1, 2u);
}

@end
