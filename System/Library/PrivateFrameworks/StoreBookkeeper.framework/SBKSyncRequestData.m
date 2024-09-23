@implementation SBKSyncRequestData

- (id)serializableRequestBodyPropertyList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *context;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[3];
  _QWORD v41[3];
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x2207AF670](self, a2);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[SBKSyncRequestData syncTransaction](self, "syncTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keysToUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[SBKSyncRequestData _serializableUpdateItemPayloadDictionaryForKey:](self, "_serializableUpdateItemPayloadDictionaryForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v3, "addObject:", v12);
        }
        else
        {
          v13 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v11;
            _os_log_impl(&dword_21E4FD000, v13, OS_LOG_TYPE_DEFAULT, "WARNING: no data was provided for updated key %@, skipping just that item", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v8);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[SBKSyncRequestData syncTransaction](self, "syncTransaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keysToDelete");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        -[SBKSyncRequestData _serializableDeleteItemPayloadDictionaryForKey:](self, "_serializableDeleteItemPayloadDictionaryForKey:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v17);
  }

  -[SBKSyncRequestData _serializableConflictDetectionValue](self, "_serializableConflictDetectionValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("domain");
  -[SBKSyncRequestData syncTransaction](self, "syncTransaction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "domain");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v24;
  v40[1] = CFSTR("version");
  -[SBKSyncRequestData syncTransaction](self, "syncTransaction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "syncAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = CFSTR("ops");
  v41[1] = v26;
  v41[2] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  if (objc_msgSend(v21, "length"))
    objc_msgSend(v28, "setObject:forKey:", v21, CFSTR("conflict-detection"));
  v29 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v28;
    _os_log_impl(&dword_21E4FD000, v29, OS_LOG_TYPE_DEFAULT, "Sync request payload (plist): %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
  return v28;
}

- (id)_serializableConflictDetectionValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  if (!-[SBKSyncRequestData _needsConflictDetection](self, "_needsConflictDetection"))
    return 0;
  v11[0] = &unk_24E2AFEE8;
  v11[1] = &unk_24E2AFF00;
  v12[0] = CFSTR("none");
  v12[1] = CFSTR("ordinal");
  v11[2] = &unk_24E2AFF18;
  v12[2] = CFSTR("version");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SBKSyncRequestData syncTransaction](self, "syncTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "conflictDetectionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    if (v7)
      v10 = v7;
    else
      v10 = CFSTR("none");
    v8 = v10;
  }

  return v8;
}

- (id)_serializableConflictDetectionOrdinalForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!-[SBKSyncRequestData _needsConflictDetection](self, "_needsConflictDetection"))
  {
    v6 = 0;
    goto LABEL_5;
  }
  -[SBKSyncRequestData syncTransaction](self, "syncTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conflictDetectionOrdinalForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v6, "longLongValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

- (BOOL)_needsConflictDetection
{
  void *v2;
  BOOL v3;

  -[SBKSyncRequestData syncTransaction](self, "syncTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conflictDetectionType") != 0;

  return v3;
}

- (id)_serializableUpdateItemPayloadDictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBKSyncRequestData syncTransaction](self, "syncTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyValuePairForUpdatedKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kvsPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "SBKDataByDeflatingWithNoZipHeader");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v7;
    v11 = v10;

    v16[0] = CFSTR("op");
    v16[1] = CFSTR("key");
    v17[0] = CFSTR("put");
    v17[1] = v4;
    v16[2] = CFSTR("value");
    v17[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    -[SBKSyncRequestData _serializableConflictDetectionOrdinalForKey:](self, "_serializableConflictDetectionOrdinalForKey:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("ordinal"));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_serializableDeleteItemPayloadDictionaryForKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("op");
  v10[1] = CFSTR("key");
  v11[0] = CFSTR("delete");
  v11[1] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[SBKSyncRequestData _serializableConflictDetectionOrdinalForKey:](self, "_serializableConflictDetectionOrdinalForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("ordinal"));

  return v7;
}

@end
