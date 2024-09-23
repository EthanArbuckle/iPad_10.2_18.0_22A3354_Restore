@implementation _MultiplatformDonationRecencyStore

- (_MultiplatformDonationRecencyStore)init
{
  _MultiplatformDonationRecencyStore *v2;
  uint64_t v3;
  NSMutableArray *appDateInfo;
  uint64_t v5;
  NSMutableDictionary *infoByLocalID;
  uint64_t v7;
  NSMutableDictionary *infoByRemoteID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MultiplatformDonationRecencyStore;
  v2 = -[_MultiplatformDonationRecencyStore init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    appDateInfo = v2->_appDateInfo;
    v2->_appDateInfo = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    infoByLocalID = v2->_infoByLocalID;
    v2->_infoByLocalID = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    infoByRemoteID = v2->_infoByRemoteID;
    v2->_infoByRemoteID = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (void)updateDataWithRemoteBundleIdentifier:(id)a3 remoteDate:(id)a4 localBundleIdentifier:(id)a5 localDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  _MultiplatformDonationRecencyInfo *v25;
  id v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  id v37;

  v37 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v37)
  {
    v13 = 0;
    if (v11)
      goto LABEL_3;
LABEL_8:
    v21 = 0;
    v23 = 0;
    v22 = v13 != 0;
    if (!v13)
      goto LABEL_13;
    goto LABEL_11;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_infoByRemoteID, "objectForKeyedSubscript:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_8;
LABEL_3:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_infoByLocalID, "objectForKeyedSubscript:", v11);
  v14 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v14;
  v22 = v13 != 0;
  v23 = v14 != 0;
  if (v13 && v14 && v13 != (void *)v14)
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Remote and local bundles ids should map to the same information."), v15, v16, v17, v18, v19, v20, v36);
    v22 = 1;
    v23 = 1;
  }
  else
  {
    v24 = (void *)v14;
    if (!v13)
      goto LABEL_12;
  }
LABEL_11:
  v24 = v13;
LABEL_12:
  v25 = v24;
  if (!v25)
  {
LABEL_13:
    v25 = objc_alloc_init(_MultiplatformDonationRecencyInfo);
    -[NSMutableArray addObject:](self->_appDateInfo, "addObject:", v25);
  }
  if (v11 && !v23)
  {
    -[_MultiplatformDonationRecencyInfo setLocalBundleIdentifier:](v25, "setLocalBundleIdentifier:", v11);
    -[NSMutableDictionary setObject:forKey:](self->_infoByLocalID, "setObject:forKey:", v25, v11);
  }
  v26 = v37;
  if (v37)
    v27 = v22;
  else
    v27 = 1;
  if ((v27 & 1) == 0)
  {
    -[_MultiplatformDonationRecencyInfo setRemoteBundleIdentifier:](v25, "setRemoteBundleIdentifier:", v37);
    -[NSMutableDictionary setObject:forKey:](self->_infoByRemoteID, "setObject:forKey:", v25, v37);
    v26 = v37;
  }
  if (v11 && v12)
  {
    -[_MultiplatformDonationRecencyInfo localDonationCreationDate](v25, "localDonationCreationDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (!v28
      || (objc_msgSend(v28, "laterDate:", v12),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = objc_msgSend(v30, "isEqual:", v12),
          v30,
          v31))
    {
      -[_MultiplatformDonationRecencyInfo setLocalDonationCreationDate:](v25, "setLocalDonationCreationDate:", v12);
    }

    v26 = v37;
  }
  if (v26 && v10)
  {
    -[_MultiplatformDonationRecencyInfo remoteDonationCreationDate](v25, "remoteDonationCreationDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (!v32
      || (objc_msgSend(v32, "laterDate:", v10),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = objc_msgSend(v34, "isEqual:", v10),
          v34,
          v35))
    {
      -[_MultiplatformDonationRecencyInfo setRemoteDonationCreationDate:](v25, "setRemoteDonationCreationDate:", v10);
    }

  }
}

- (id)bundlesFromMostRecentlyProvidingPlatforms
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
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_appDateInfo, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_appDateInfo;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "identifierForMostRecentData", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoByRemoteID, 0);
  objc_storeStrong((id *)&self->_infoByLocalID, 0);
  objc_storeStrong((id *)&self->_appDateInfo, 0);
}

@end
