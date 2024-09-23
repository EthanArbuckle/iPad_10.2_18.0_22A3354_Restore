@implementation WOHealthBridgeProtoPersistence

- (void)clearKeyedNumbers
{
  -[NSMutableArray removeAllObjects](self->_keyedNumbers, "removeAllObjects");
}

- (void)addKeyedNumbers:(id)a3
{
  id v4;
  NSMutableArray *keyedNumbers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keyedNumbers = self->_keyedNumbers;
  v8 = v4;
  if (!keyedNumbers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_keyedNumbers;
    self->_keyedNumbers = v6;

    v4 = v8;
    keyedNumbers = self->_keyedNumbers;
  }
  -[NSMutableArray addObject:](keyedNumbers, "addObject:", v4);

}

- (unint64_t)keyedNumbersCount
{
  return -[NSMutableArray count](self->_keyedNumbers, "count");
}

- (id)keyedNumbersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keyedNumbers, "objectAtIndex:", a3);
}

+ (Class)keyedNumbersType
{
  return (Class)objc_opt_class();
}

- (void)clearKeyedStrings
{
  -[NSMutableArray removeAllObjects](self->_keyedStrings, "removeAllObjects");
}

- (void)addKeyedStrings:(id)a3
{
  id v4;
  NSMutableArray *keyedStrings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keyedStrings = self->_keyedStrings;
  v8 = v4;
  if (!keyedStrings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_keyedStrings;
    self->_keyedStrings = v6;

    v4 = v8;
    keyedStrings = self->_keyedStrings;
  }
  -[NSMutableArray addObject:](keyedStrings, "addObject:", v4);

}

- (unint64_t)keyedStringsCount
{
  return -[NSMutableArray count](self->_keyedStrings, "count");
}

- (id)keyedStringsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keyedStrings, "objectAtIndex:", a3);
}

+ (Class)keyedStringsType
{
  return (Class)objc_opt_class();
}

- (void)clearKeyedDates
{
  -[NSMutableArray removeAllObjects](self->_keyedDates, "removeAllObjects");
}

- (void)addKeyedDates:(id)a3
{
  id v4;
  NSMutableArray *keyedDates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keyedDates = self->_keyedDates;
  v8 = v4;
  if (!keyedDates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_keyedDates;
    self->_keyedDates = v6;

    v4 = v8;
    keyedDates = self->_keyedDates;
  }
  -[NSMutableArray addObject:](keyedDates, "addObject:", v4);

}

- (unint64_t)keyedDatesCount
{
  return -[NSMutableArray count](self->_keyedDates, "count");
}

- (id)keyedDatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keyedDates, "objectAtIndex:", a3);
}

+ (Class)keyedDatesType
{
  return (Class)objc_opt_class();
}

- (void)clearKeyedDatas
{
  -[NSMutableArray removeAllObjects](self->_keyedDatas, "removeAllObjects");
}

- (void)addKeyedDatas:(id)a3
{
  id v4;
  NSMutableArray *keyedDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keyedDatas = self->_keyedDatas;
  v8 = v4;
  if (!keyedDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_keyedDatas;
    self->_keyedDatas = v6;

    v4 = v8;
    keyedDatas = self->_keyedDatas;
  }
  -[NSMutableArray addObject:](keyedDatas, "addObject:", v4);

}

- (unint64_t)keyedDatasCount
{
  return -[NSMutableArray count](self->_keyedDatas, "count");
}

- (id)keyedDatasAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keyedDatas, "objectAtIndex:", a3);
}

+ (Class)keyedDatasType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPersistedProtoData
{
  return self->_persistedProtoData != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WOHealthBridgeProtoPersistence;
  -[WOHealthBridgeProtoPersistence description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WOHealthBridgeProtoPersistence dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSData *uuid;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  NSData *persistedData;
  NSData *persistedProtoData;
  void *v37;
  void *v38;
  WOHealthBridgeSyncIdentity *syncIdentity;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
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
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  if (-[NSMutableArray count](self->_keyedNumbers, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_keyedNumbers, "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v8 = self->_keyedNumbers;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v55 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("keyedNumbers"));
  }
  if (-[NSMutableArray count](self->_keyedStrings, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_keyedStrings, "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v15 = self->_keyedStrings;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("keyedStrings"));
  }
  if (-[NSMutableArray count](self->_keyedDates, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_keyedDates, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v22 = self->_keyedDates;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v47;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v47 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("keyedDates"));
  }
  if (-[NSMutableArray count](self->_keyedDatas, "count"))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_keyedDatas, "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v29 = self->_keyedDatas;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v43;
      do
      {
        for (m = 0; m != v31; ++m)
        {
          if (*(_QWORD *)v43 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v42);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v34);

        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
      }
      while (v31);
    }

    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("keyedDatas"));
  }
  persistedData = self->_persistedData;
  if (persistedData)
    objc_msgSend(v3, "setObject:forKey:", persistedData, CFSTR("persistedData"));
  persistedProtoData = self->_persistedProtoData;
  if (persistedProtoData)
    objc_msgSend(v3, "setObject:forKey:", persistedProtoData, CFSTR("persistedProtoData"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_objectState, (_QWORD)v42);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("objectState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_objectModificationTimeSinceReferenceDate);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("objectModificationTimeSinceReferenceDate"));

  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[WOHealthBridgeSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("syncIdentity"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WOHealthBridgeProtoPersistenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (!self->_uuid)
    -[WOHealthBridgeProtoPersistence writeTo:].cold.1();
  PBDataWriterWriteDataField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_keyedNumbers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_keyedStrings;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_keyedDates;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_keyedDatas;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

  if (!self->_persistedData)
    -[WOHealthBridgeProtoPersistence writeTo:].cold.2();
  PBDataWriterWriteDataField();
  if (self->_persistedProtoData)
    PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  if (self->_syncIdentity)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  v4[24] = self->_version;
  v4[20] = self->_type;
  v22 = v4;
  objc_msgSend(v4, "setUuid:", self->_uuid);
  if (-[WOHealthBridgeProtoPersistence keyedNumbersCount](self, "keyedNumbersCount"))
  {
    objc_msgSend(v22, "clearKeyedNumbers");
    v5 = -[WOHealthBridgeProtoPersistence keyedNumbersCount](self, "keyedNumbersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[WOHealthBridgeProtoPersistence keyedNumbersAtIndex:](self, "keyedNumbersAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addKeyedNumbers:", v8);

      }
    }
  }
  if (-[WOHealthBridgeProtoPersistence keyedStringsCount](self, "keyedStringsCount"))
  {
    objc_msgSend(v22, "clearKeyedStrings");
    v9 = -[WOHealthBridgeProtoPersistence keyedStringsCount](self, "keyedStringsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[WOHealthBridgeProtoPersistence keyedStringsAtIndex:](self, "keyedStringsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addKeyedStrings:", v12);

      }
    }
  }
  if (-[WOHealthBridgeProtoPersistence keyedDatesCount](self, "keyedDatesCount"))
  {
    objc_msgSend(v22, "clearKeyedDates");
    v13 = -[WOHealthBridgeProtoPersistence keyedDatesCount](self, "keyedDatesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[WOHealthBridgeProtoPersistence keyedDatesAtIndex:](self, "keyedDatesAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addKeyedDates:", v16);

      }
    }
  }
  if (-[WOHealthBridgeProtoPersistence keyedDatasCount](self, "keyedDatasCount"))
  {
    objc_msgSend(v22, "clearKeyedDatas");
    v17 = -[WOHealthBridgeProtoPersistence keyedDatasCount](self, "keyedDatasCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[WOHealthBridgeProtoPersistence keyedDatasAtIndex:](self, "keyedDatasAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addKeyedDatas:", v20);

      }
    }
  }
  objc_msgSend(v22, "setPersistedData:", self->_persistedData);
  if (self->_persistedProtoData)
    objc_msgSend(v22, "setPersistedProtoData:");
  v21 = v22;
  *((_DWORD *)v22 + 12) = self->_objectState;
  *((_QWORD *)v22 + 1) = *(_QWORD *)&self->_objectModificationTimeSinceReferenceDate;
  if (self->_syncIdentity)
  {
    objc_msgSend(v22, "setSyncIdentity:");
    v21 = v22;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
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
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 96) = self->_version;
  *(_DWORD *)(v5 + 80) = self->_type;
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v8 = self->_keyedNumbers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v52;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v52 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addKeyedNumbers:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v10);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v14 = self->_keyedStrings;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v48;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v18), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addKeyedStrings:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v16);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = self->_keyedDates;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v24), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addKeyedDates:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v22);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v26 = self->_keyedDatas;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v40;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v30), "copyWithZone:", a3, (_QWORD)v39);
        objc_msgSend((id)v5, "addKeyedDatas:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    }
    while (v28);
  }

  v32 = -[NSData copyWithZone:](self->_persistedData, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v32;

  v34 = -[NSData copyWithZone:](self->_persistedProtoData, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v34;

  *(_DWORD *)(v5 + 48) = self->_objectState;
  *(double *)(v5 + 8) = self->_objectModificationTimeSinceReferenceDate;
  v36 = -[WOHealthBridgeSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v36;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *uuid;
  NSMutableArray *keyedNumbers;
  NSMutableArray *keyedStrings;
  NSMutableArray *keyedDates;
  NSMutableArray *keyedDatas;
  NSData *persistedData;
  NSData *persistedProtoData;
  WOHealthBridgeSyncIdentity *syncIdentity;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_version == *((_DWORD *)v4 + 24)
    && self->_type == *((_DWORD *)v4 + 20)
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[11])) || -[NSData isEqual:](uuid, "isEqual:"))
    && ((keyedNumbers = self->_keyedNumbers, !((unint64_t)keyedNumbers | v4[4]))
     || -[NSMutableArray isEqual:](keyedNumbers, "isEqual:"))
    && ((keyedStrings = self->_keyedStrings, !((unint64_t)keyedStrings | v4[5]))
     || -[NSMutableArray isEqual:](keyedStrings, "isEqual:"))
    && ((keyedDates = self->_keyedDates, !((unint64_t)keyedDates | v4[3]))
     || -[NSMutableArray isEqual:](keyedDates, "isEqual:"))
    && ((keyedDatas = self->_keyedDatas, !((unint64_t)keyedDatas | v4[2]))
     || -[NSMutableArray isEqual:](keyedDatas, "isEqual:"))
    && ((persistedData = self->_persistedData, !((unint64_t)persistedData | v4[7]))
     || -[NSData isEqual:](persistedData, "isEqual:"))
    && ((persistedProtoData = self->_persistedProtoData, !((unint64_t)persistedProtoData | v4[8]))
     || -[NSData isEqual:](persistedProtoData, "isEqual:"))
    && self->_objectState == *((_DWORD *)v4 + 12)
    && self->_objectModificationTimeSinceReferenceDate == *((double *)v4 + 1))
  {
    syncIdentity = self->_syncIdentity;
    if ((unint64_t)syncIdentity | v4[9])
      v13 = -[WOHealthBridgeSyncIdentity isEqual:](syncIdentity, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t objectState;
  double objectModificationTimeSinceReferenceDate;
  double v12;
  long double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t type;
  uint64_t version;

  type = self->_type;
  version = self->_version;
  v3 = -[NSData hash](self->_uuid, "hash");
  v4 = -[NSMutableArray hash](self->_keyedNumbers, "hash");
  v5 = -[NSMutableArray hash](self->_keyedStrings, "hash");
  v6 = -[NSMutableArray hash](self->_keyedDates, "hash");
  v7 = -[NSMutableArray hash](self->_keyedDatas, "hash");
  v8 = -[NSData hash](self->_persistedData, "hash");
  v9 = -[NSData hash](self->_persistedProtoData, "hash");
  objectState = self->_objectState;
  objectModificationTimeSinceReferenceDate = self->_objectModificationTimeSinceReferenceDate;
  v12 = -objectModificationTimeSinceReferenceDate;
  if (objectModificationTimeSinceReferenceDate >= 0.0)
    v12 = self->_objectModificationTimeSinceReferenceDate;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = fmod(v13, 1.84467441e19);
  v16 = 2654435761u * (unint64_t)v15;
  v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0)
    v17 = 2654435761u * (unint64_t)v15;
  v18 = v16 - (unint64_t)fabs(v14);
  if (v14 >= 0.0)
    v18 = v17;
  return (2654435761 * type) ^ (2654435761 * version) ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[WOHealthBridgeSyncIdentity hash](self->_syncIdentity, "hash") ^ v9 ^ (2654435761 * objectState) ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  WOHealthBridgeSyncIdentity *syncIdentity;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_version = *((_DWORD *)v4 + 24);
  self->_type = *((_DWORD *)v4 + 20);
  if (*((_QWORD *)v4 + 11))
    -[WOHealthBridgeProtoPersistence setUuid:](self, "setUuid:");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        -[WOHealthBridgeProtoPersistence addKeyedNumbers:](self, "addKeyedNumbers:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v7);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = *((id *)v4 + 5);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        -[WOHealthBridgeProtoPersistence addKeyedStrings:](self, "addKeyedStrings:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v12);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = *((id *)v4 + 3);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        -[WOHealthBridgeProtoPersistence addKeyedDates:](self, "addKeyedDates:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v17);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = *((id *)v4 + 2);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        -[WOHealthBridgeProtoPersistence addKeyedDatas:](self, "addKeyedDatas:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * m), (_QWORD)v27);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v22);
  }

  if (*((_QWORD *)v4 + 7))
    -[WOHealthBridgeProtoPersistence setPersistedData:](self, "setPersistedData:");
  if (*((_QWORD *)v4 + 8))
    -[WOHealthBridgeProtoPersistence setPersistedProtoData:](self, "setPersistedProtoData:");
  self->_objectState = *((_DWORD *)v4 + 12);
  self->_objectModificationTimeSinceReferenceDate = *((double *)v4 + 1);
  syncIdentity = self->_syncIdentity;
  v26 = *((_QWORD *)v4 + 9);
  if (syncIdentity)
  {
    if (v26)
      -[WOHealthBridgeSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else if (v26)
  {
    -[WOHealthBridgeProtoPersistence setSyncIdentity:](self, "setSyncIdentity:");
  }

}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSMutableArray)keyedNumbers
{
  return self->_keyedNumbers;
}

- (void)setKeyedNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_keyedNumbers, a3);
}

- (NSMutableArray)keyedStrings
{
  return self->_keyedStrings;
}

- (void)setKeyedStrings:(id)a3
{
  objc_storeStrong((id *)&self->_keyedStrings, a3);
}

- (NSMutableArray)keyedDates
{
  return self->_keyedDates;
}

- (void)setKeyedDates:(id)a3
{
  objc_storeStrong((id *)&self->_keyedDates, a3);
}

- (NSMutableArray)keyedDatas
{
  return self->_keyedDatas;
}

- (void)setKeyedDatas:(id)a3
{
  objc_storeStrong((id *)&self->_keyedDatas, a3);
}

- (NSData)persistedData
{
  return self->_persistedData;
}

- (void)setPersistedData:(id)a3
{
  objc_storeStrong((id *)&self->_persistedData, a3);
}

- (NSData)persistedProtoData
{
  return self->_persistedProtoData;
}

- (void)setPersistedProtoData:(id)a3
{
  objc_storeStrong((id *)&self->_persistedProtoData, a3);
}

- (int)objectState
{
  return self->_objectState;
}

- (void)setObjectState:(int)a3
{
  self->_objectState = a3;
}

- (double)objectModificationTimeSinceReferenceDate
{
  return self->_objectModificationTimeSinceReferenceDate;
}

- (void)setObjectModificationTimeSinceReferenceDate:(double)a3
{
  self->_objectModificationTimeSinceReferenceDate = a3;
}

- (WOHealthBridgeSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_persistedProtoData, 0);
  objc_storeStrong((id *)&self->_persistedData, 0);
  objc_storeStrong((id *)&self->_keyedStrings, 0);
  objc_storeStrong((id *)&self->_keyedNumbers, 0);
  objc_storeStrong((id *)&self->_keyedDates, 0);
  objc_storeStrong((id *)&self->_keyedDatas, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[WOHealthBridgeProtoPersistence writeTo:]", "WOHealthBridgeProtoPersistence.m", 375, "nil != self->_uuid");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[WOHealthBridgeProtoPersistence writeTo:]", "WOHealthBridgeProtoPersistence.m", 408, "nil != self->_persistedData");
}

@end
