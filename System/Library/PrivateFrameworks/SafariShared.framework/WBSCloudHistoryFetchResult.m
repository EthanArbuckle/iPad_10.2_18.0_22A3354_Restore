@implementation WBSCloudHistoryFetchResult

- (WBSCloudHistoryFetchResult)init
{
  WBSCloudHistoryFetchResult *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mutableVisitsPerProfile;
  NSMutableDictionary *v5;
  NSMutableDictionary *mutableTombstonesPerProfile;
  uint64_t v7;
  NSMutableDictionary *mutableClientVersions;
  WBSCloudHistoryFetchResult *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WBSCloudHistoryFetchResult;
  v2 = -[WBSCloudHistoryFetchResult init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableVisitsPerProfile = v2->_mutableVisitsPerProfile;
    v2->_mutableVisitsPerProfile = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableTombstonesPerProfile = v2->_mutableTombstonesPerProfile;
    v2->_mutableTombstonesPerProfile = v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    mutableClientVersions = v2->_mutableClientVersions;
    v2->_mutableClientVersions = (NSMutableDictionary *)v7;

    v9 = v2;
  }

  return v2;
}

- (NSSet)profiles
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NSMutableDictionary allKeys](self->_mutableVisitsPerProfile, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[NSMutableDictionary allKeys](self->_mutableTombstonesPerProfile, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return (NSSet *)v3;
}

- (void)clearRecordsForProfileWithServerIdentifier:(id)a3
{
  NSMutableDictionary *mutableVisitsPerProfile;
  id v5;

  mutableVisitsPerProfile = self->_mutableVisitsPerProfile;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](mutableVisitsPerProfile, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_mutableTombstonesPerProfile, "removeObjectForKey:", v5);

}

- (id)visitsForProfileWithServerIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableVisitsPerProfile, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)_addCloudHistoryVisit:(id)a3 profileServerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = v6;
  v7 = a4;
  if (!v7)
    v7 = (id)*MEMORY[0x1E0D89E20];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableVisitsPerProfile, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "addObject:", v6);
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v11, 1);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableVisitsPerProfile, "setObject:forKeyedSubscript:", v10, v7);

  }
}

- (unint64_t)visitCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_mutableVisitsPerProfile, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSDictionary)clientVersions
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_mutableClientVersions, "copy");
}

- (void)_updateClientVersion:(unint64_t)a3 seenAt:(id)a4
{
  NSMutableDictionary *mutableClientVersions;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a4;
  mutableClientVersions = self->_mutableClientVersions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mutableClientVersions, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || objc_msgSend(v8, "compare:", v11) == -1)
  {
    v9 = self->_mutableClientVersions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, v10);

  }
}

- (id)tombstonesForProfileWithServerIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableTombstonesPerProfile, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)_addTombstone:(id)a3 profileServerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = v6;
  v7 = a4;
  if (!v7)
    v7 = (id)*MEMORY[0x1E0D89E20];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableTombstonesPerProfile, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "addObject:", v6);
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v11, 1);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableTombstonesPerProfile, "setObject:forKeyedSubscript:", v10, v7);

  }
}

- (unint64_t)tombstoneCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_mutableTombstonesPerProfile, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setServerChangeTokenData:(id)a3
{
  NSData *v4;
  NSData *serverChangeTokenData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  serverChangeTokenData = self->_serverChangeTokenData;
  self->_serverChangeTokenData = v4;

}

- (id)_dictionaryForRecordData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v12;
  id v13;

  v3 = a3;
  if (!v3)
    return 0;
  v4 = v3;
  if (objc_msgSend(v3, "safari_dataAppearsToBeCompressed"))
  {
    objc_msgSend(v4, "safari_dataByDecompressingData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;

      v4 = v7;
    }

  }
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WBSCloudHistoryFetchResult _dictionaryForRecordData:].cold.1(v12, v9);
  }

  return v8;
}

- (void)appendRecord:(id)a3 usingConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  WBSHistoryTombstone *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  WBSCloudHistoryVisit *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50;
  _BYTE v51[15];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "modificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v7, "syncWindow");
  objc_msgSend(v9, "dateWithTimeIntervalSinceNow:", -v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "earlierDate:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 != v8)
  {
    objc_msgSend(v6, "recordType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_numberForKey:", CFSTR("Version"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    objc_msgSend(v6, "safari_encryptedDataForKey:", CFSTR("EncryptedData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v6, "safari_dataForKey:", CFSTR("Data"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WBSCloudHistoryFetchResult _dictionaryForRecordData:](self, "_dictionaryForRecordData:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v22 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[WBSCloudHistoryFetchResult appendRecord:usingConfiguration:].cold.1(v22, v23, v24);
      goto LABEL_45;
    }
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("ProfileUUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("Visits")) && v15 >= 1 && v15 <= 2)
    {
      v43 = v13;
      v44 = v11;
      objc_msgSend(v17, "safari_numberForKey:", CFSTR("ClientVersion"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
      v42 = v16;
      v45 = v17;
      if (v20)
      {
        objc_msgSend(v17, "safari_numberForKey:", CFSTR("ClientVersion"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v17, "unsignedIntegerValue");
      }
      else
      {
        v21 = 1;
      }
      objc_msgSend(v6, "modificationDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSCloudHistoryFetchResult _updateClientVersion:seenAt:](self, "_updateClientVersion:seenAt:", v21, v32);

      if (v20)
      objc_msgSend(v45, "safari_arrayForKey:", CFSTR("Visits"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v33 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (!v33)
        goto LABEL_42;
      v34 = v33;
      v39 = v8;
      v40 = v7;
      v41 = v6;
      v35 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v53 != v35)
            objc_enumerationMutation(v25);
          v37 = -[WBSCloudHistoryVisit initWithDictionary:]([WBSCloudHistoryVisit alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          if (v37)
          {
            -[WBSCloudHistoryFetchResult _addCloudHistoryVisit:profileServerIdentifier:](self, "_addCloudHistoryVisit:profileServerIdentifier:", v37, v18);
          }
          else
          {
            v38 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              -[WBSCloudHistoryFetchResult appendRecord:usingConfiguration:].cold.3(&v50, v51, v38);
          }

        }
        v34 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v34);
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("Tombstones")) || v15 < 1 || v15 > 3)
        goto LABEL_44;
      v45 = v17;
      objc_msgSend(v17, "safari_arrayForKey:", CFSTR("Tombstones"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (!v26)
      {
LABEL_43:

        v17 = v45;
LABEL_44:

LABEL_45:
        goto LABEL_46;
      }
      v27 = v26;
      v42 = v16;
      v43 = v13;
      v44 = v11;
      v39 = v8;
      v40 = v7;
      v41 = v6;
      v28 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(v25);
          v30 = -[WBSHistoryTombstone initWithDictionary:]([WBSHistoryTombstone alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
          if (v30)
          {
            -[WBSCloudHistoryFetchResult _addTombstone:profileServerIdentifier:](self, "_addTombstone:profileServerIdentifier:", v30, v18);
          }
          else
          {
            v31 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              -[WBSCloudHistoryFetchResult appendRecord:usingConfiguration:].cold.2(&v50, v51, v31);
          }

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v27);
    }
    v7 = v40;
    v6 = v41;
    v8 = v39;
LABEL_42:
    v13 = v43;
    v11 = v44;
    v16 = v42;
    goto LABEL_43;
  }
LABEL_46:

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; cloudHistoryVisits = %@; historyTombstones = %@"),
    v5,
    self,
    self->_mutableVisitsPerProfile,
    self->_mutableTombstonesPerProfile);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)serverChangeTokenData
{
  return self->_serverChangeTokenData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverChangeTokenData, 0);
  objc_storeStrong((id *)&self->_mutableClientVersions, 0);
  objc_storeStrong((id *)&self->_mutableTombstonesPerProfile, 0);
  objc_storeStrong((id *)&self->_mutableVisitsPerProfile, 0);
}

- (void)_dictionaryForRecordData:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Failed to deserialize dictionary: %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)appendRecord:(uint64_t)a3 usingConfiguration:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1A3D90000, a1, a3, "Failed to deserialize data for Visit record.", v3);
}

- (void)appendRecord:(NSObject *)a3 usingConfiguration:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1A3D90000, a3, (uint64_t)a3, "Failed to deserialize WBSHistoryTombstone.", a1);
}

- (void)appendRecord:(NSObject *)a3 usingConfiguration:.cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1A3D90000, a3, (uint64_t)a3, "Failed to deserialize WBSCloudHistoryVisit.", a1);
}

@end
