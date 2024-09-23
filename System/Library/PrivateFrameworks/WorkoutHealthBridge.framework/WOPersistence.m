@implementation WOPersistence

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WOPersistence)initWithVersion:(int64_t)a3 type:(unint64_t)a4 uuid:(id)a5 persistedData:(id)a6 objectState:(unint64_t)a7 objectModificationDate:(id)a8 syncIdentity:(id)a9
{
  return -[WOPersistence initWithVersion:type:uuid:persistedData:persistedProtoData:objectState:objectModificationDate:syncIdentity:](self, "initWithVersion:type:uuid:persistedData:persistedProtoData:objectState:objectModificationDate:syncIdentity:", a3, a4, a5, a6, 0, a7, a8, a9);
}

- (WOPersistence)initWithVersion:(int64_t)a3 type:(unint64_t)a4 uuid:(id)a5 persistedData:(id)a6 persistedProtoData:(id)a7 objectState:(unint64_t)a8 objectModificationDate:(id)a9 syncIdentity:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WOPersistence *v21;
  WOPersistence *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = a10;
  v28.receiver = self;
  v28.super_class = (Class)WOPersistence;
  v21 = -[WOPersistence init](&v28, sel_init);
  v22 = v21;
  if (v21)
  {
    -[WOPersistence setVersion:](v21, "setVersion:", a3);
    -[WOPersistence setType:](v22, "setType:", a4);
    -[WOPersistence setUuid:](v22, "setUuid:", v16);
    -[WOPersistence setPersistedData:](v22, "setPersistedData:", v17);
    -[WOPersistence setPersistedProtoData:](v22, "setPersistedProtoData:", v18);
    -[WOPersistence setObjectState:](v22, "setObjectState:", a8);
    -[WOPersistence setObjectModificationDate:](v22, "setObjectModificationDate:", v19);
    -[WOPersistence setSyncIdentity:](v22, "setSyncIdentity:", v20);
    v23 = (void *)objc_opt_new();
    -[WOPersistence setKeyedNumbers:](v22, "setKeyedNumbers:", v23);

    v24 = (void *)objc_opt_new();
    -[WOPersistence setKeyedStrings:](v22, "setKeyedStrings:", v24);

    v25 = (void *)objc_opt_new();
    -[WOPersistence setKeyedDatas:](v22, "setKeyedDatas:", v25);

    v26 = (void *)objc_opt_new();
    -[WOPersistence setKeyedDatas:](v22, "setKeyedDatas:", v26);

  }
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyedNumbers, CFSTR("numbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyedStrings, CFSTR("strings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyedDates, CFSTR("dates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_persistedData, CFSTR("data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyedDatas, CFSTR("keyedDatas"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_persistedProtoData, CFSTR("proto_data"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_objectState, CFSTR("objectState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objectModificationDate, CFSTR("objectModificationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_syncIdentity, CFSTR("syncIdentity"));

}

- (WOPersistence)initWithCoder:(id)a3
{
  id v4;
  WOPersistence *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_super v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WOPersistence;
  v5 = -[WOPersistence init](&v29, sel_init);
  if (v5)
  {
    -[WOPersistence setVersion:](v5, "setVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")));
    -[WOPersistence setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WOPersistence setUuid:](v5, "setUuid:", v6);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("numbers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WOPersistence setKeyedNumbers:](v5, "setKeyedNumbers:", v10);

    v11 = (void *)MEMORY[0x24BDBCF20];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("strings"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WOPersistence setKeyedStrings:](v5, "setKeyedStrings:", v14);

    v15 = (void *)MEMORY[0x24BDBCF20];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("dates"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WOPersistence setKeyedDates:](v5, "setKeyedDates:", v18);

    v19 = (void *)MEMORY[0x24BDBCF20];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("keyedDatas"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WOPersistence setKeyedDatas:](v5, "setKeyedDatas:", v22);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("proto_data")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proto_data"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WOPersistence setPersistedProtoData:](v5, "setPersistedProtoData:", v23);

    }
    else
    {
      -[WOPersistence setPersistedProtoData:](v5, "setPersistedProtoData:", 0);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WOPersistence setPersistedData:](v5, "setPersistedData:", v24);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("objectState")))
      v25 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("objectState"));
    else
      v25 = 0;
    -[WOPersistence setObjectState:](v5, "setObjectState:", v25);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("objectModificationDate")))
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectModificationDate"));
    else
      +[WOPersistence zeroObjectModificationDate](WOPersistence, "zeroObjectModificationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WOPersistence setObjectModificationDate:](v5, "setObjectModificationDate:", v26);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("syncIdentity")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syncIdentity"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WOPersistence setSyncIdentity:](v5, "setSyncIdentity:", v27);

    }
  }

  return v5;
}

- (WOPersistence)initWithData:(id)a3
{
  void *v4;
  id v5;
  WOPersistence *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  v4 = (void *)MEMORY[0x24BDD1620];
  v5 = a3;
  v16 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v16);
  v6 = (WOPersistence *)objc_claimAutoreleasedReturnValue();

  v7 = v16;
  if (!v6)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      -[WOPersistence initWithData:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }

  return v6;
}

+ (id)zeroObjectModificationDate
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", 0.0);
}

- (id)data
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v14;

  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v14;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      -[WOPersistence data].cold.1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v4;

  return v12;
}

- (int64_t)encodedByteCount
{
  void *v2;
  int64_t v3;

  -[WOPersistence data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)protobuf
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  void *v28;
  NSDictionary *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *context;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x219A26528]();
  objc_msgSend(v3, "setVersion:", LODWORD(self->_version));
  objc_msgSend(v3, "setType:", LODWORD(self->_type));
  -[NSUUID hk_dataForUUIDBytes](self->_uuid, "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuid:", v4);

  objc_msgSend(v3, "setPersistedProtoData:", self->_persistedProtoData);
  objc_msgSend(v3, "setPersistedData:", self->_persistedData);
  objc_msgSend(v3, "setObjectState:", LODWORD(self->_objectState));
  -[NSDate timeIntervalSinceReferenceDate](self->_objectModificationDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setObjectModificationTimeSinceReferenceDate:");
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v5 = self->_keyedNumbers;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v58 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_keyedNumbers, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "setKey:", v10);
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(v12, "setNumber:");
        objc_msgSend(v3, "addKeyedNumbers:", v12);

      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v7);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v13 = self->_keyedStrings;
  v14 = -[NSDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v54 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
        -[NSDictionary objectForKeyedSubscript:](self->_keyedStrings, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_opt_new();
        objc_msgSend(v20, "setKey:", v18);
        objc_msgSend(v20, "setString:", v19);
        objc_msgSend(v3, "addKeyedStrings:", v20);

      }
      v15 = -[NSDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v15);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v21 = self->_keyedDates;
  v22 = -[NSDictionary countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v50 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k);
        -[NSDictionary objectForKeyedSubscript:](self->_keyedDates, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_opt_new();
        objc_msgSend(v28, "setKey:", v26);
        objc_msgSend(v27, "timeIntervalSinceReferenceDate");
        objc_msgSend(v28, "setTimeSinceReferenceDate:");
        objc_msgSend(v3, "addKeyedDates:", v28);

      }
      v23 = -[NSDictionary countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v23);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v29 = self->_keyedDatas;
  v30 = -[NSDictionary countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v46;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * m);
        -[NSDictionary objectForKeyedSubscript:](self->_keyedDatas, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_opt_new();
        objc_msgSend(v36, "setKey:", v34);
        objc_msgSend(v36, "setOurData:", v35);
        objc_msgSend(v3, "addKeyedDatas:", v36);

      }
      v31 = -[NSDictionary countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
    }
    while (v31);
  }

  if (self->_syncIdentity)
  {
    v37 = (void *)objc_opt_new();
    -[WOSyncIdentity databaseIdentifier](self->_syncIdentity, "databaseIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "hk_dataForUUIDBytes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setDatabaseIdentifier:", v39);

    -[WOSyncIdentity hardwareIdentifier](self->_syncIdentity, "hardwareIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "hk_dataForUUIDBytes");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setHardwareIdentifier:", v41);

    -[WOSyncIdentity instanceDiscriminator](self->_syncIdentity, "instanceDiscriminator");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setInstanceDiscriminator:", v42);

    objc_msgSend(v3, "setSyncIdentity:", v37);
  }
  objc_autoreleasePoolPop(context);
  return v3;
}

+ (id)persistenceFromProto:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WOSyncIdentity *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  WOSyncIdentity *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  WOPersistence *v66;
  WOPersistence *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v66 = [WOPersistence alloc];
  v4 = (int)objc_msgSend(v3, "version");
  v5 = (int)objc_msgSend(v3, "type");
  v6 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v3, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_UUIDWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistedProtoData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)objc_msgSend(v3, "objectState");
  v12 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v3, "objectModificationTimeSinceReferenceDate");
  objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[WOPersistence initWithVersion:type:uuid:persistedData:persistedProtoData:objectState:objectModificationDate:syncIdentity:](v66, "initWithVersion:type:uuid:persistedData:persistedProtoData:objectState:objectModificationDate:syncIdentity:", v4, v5, v8, v9, v10, v11, v13, 0);

  v65 = v3;
  if (objc_msgSend(v3, "hasSyncIdentity"))
  {
    v14 = [WOSyncIdentity alloc];
    v15 = (void *)MEMORY[0x24BDD1880];
    objc_msgSend(v3, "syncIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hardwareIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hk_UUIDWithData:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD1880];
    objc_msgSend(v3, "syncIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "databaseIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_UUIDWithData:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "syncIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "instanceDiscriminator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[WOSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:](v14, "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v18, v22, v24);

    v3 = v65;
    -[WOPersistence setSyncIdentity:](v67, "setSyncIdentity:", v25);

  }
  v26 = (void *)objc_opt_new();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend(v3, "keyedNumbers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v81 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        v33 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v32, "number");
        objc_msgSend(v33, "numberWithDouble:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "key");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, v35);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    }
    while (v29);
  }

  -[WOPersistence setKeyedNumbers:](v67, "setKeyedNumbers:", v26);
  v36 = (void *)objc_opt_new();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend(v65, "keyedStrings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v77 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        objc_msgSend(v42, "string");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "key");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v43, v44);

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    }
    while (v39);
  }

  -[WOPersistence setKeyedStrings:](v67, "setKeyedStrings:", v36);
  v45 = (void *)objc_opt_new();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v65, "keyedDatas");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v73;
    do
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v73 != v49)
          objc_enumerationMutation(v46);
        v51 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
        objc_msgSend(v51, "ourData");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "key");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v52, v53);

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
    }
    while (v48);
  }

  -[WOPersistence setKeyedDatas:](v67, "setKeyedDatas:", v45);
  v54 = (void *)objc_opt_new();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(v65, "keyedDates");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v69;
    do
    {
      for (m = 0; m != v57; ++m)
      {
        if (*(_QWORD *)v69 != v58)
          objc_enumerationMutation(v55);
        v60 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
        v61 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v60, "timeSinceReferenceDate");
        objc_msgSend(v61, "dateWithTimeIntervalSinceReferenceDate:");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "key");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v62, v63);

      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
    }
    while (v57);
  }

  -[WOPersistence setKeyedDates:](v67, "setKeyedDates:", v54);
  return v67;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)keyedNumbers
{
  return self->_keyedNumbers;
}

- (void)setKeyedNumbers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)keyedStrings
{
  return self->_keyedStrings;
}

- (void)setKeyedStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)keyedDates
{
  return self->_keyedDates;
}

- (void)setKeyedDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)keyedDatas
{
  return self->_keyedDatas;
}

- (void)setKeyedDatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)persistedData
{
  return self->_persistedData;
}

- (void)setPersistedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)persistedProtoData
{
  return self->_persistedProtoData;
}

- (void)setPersistedProtoData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)objectState
{
  return self->_objectState;
}

- (void)setObjectState:(unint64_t)a3
{
  self->_objectState = a3;
}

- (NSDate)objectModificationDate
{
  return self->_objectModificationDate;
}

- (void)setObjectModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (WOSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_objectModificationDate, 0);
  objc_storeStrong((id *)&self->_persistedProtoData, 0);
  objc_storeStrong((id *)&self->_persistedData, 0);
  objc_storeStrong((id *)&self->_keyedDatas, 0);
  objc_storeStrong((id *)&self->_keyedDates, 0);
  objc_storeStrong((id *)&self->_keyedStrings, 0);
  objc_storeStrong((id *)&self->_keyedNumbers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218F39000, a2, a3, "Unable to decode persistence data: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)data
{
  OUTLINED_FUNCTION_0(&dword_218F39000, a2, a3, "Unable to archive WOPersistence object: %{public}@", a5, a6, a7, a8, 2u);
}

@end
