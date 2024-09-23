@implementation BCReadingStatisticsProtoBook

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)clearTocEntrys
{
  -[NSMutableArray removeAllObjects](self->_tocEntrys, "removeAllObjects");
}

- (void)addTocEntry:(id)a3
{
  id v4;
  NSMutableArray *tocEntrys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tocEntrys = self->_tocEntrys;
  v8 = v4;
  if (!tocEntrys)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_tocEntrys;
    self->_tocEntrys = v6;

    v4 = v8;
    tocEntrys = self->_tocEntrys;
  }
  -[NSMutableArray addObject:](tocEntrys, "addObject:", v4);

}

- (unint64_t)tocEntrysCount
{
  return (unint64_t)-[NSMutableArray count](self->_tocEntrys, "count");
}

- (id)tocEntryAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_tocEntrys, "objectAtIndex:", a3);
}

+ (Class)tocEntryType
{
  return (Class)objc_opt_class(BCReadingStatisticsProtoTOCEntry, a2);
}

- (void)clearReadCFIs
{
  -[NSMutableArray removeAllObjects](self->_readCFIs, "removeAllObjects");
}

- (void)addReadCFI:(id)a3
{
  id v4;
  NSMutableArray *readCFIs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  readCFIs = self->_readCFIs;
  v8 = v4;
  if (!readCFIs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_readCFIs;
    self->_readCFIs = v6;

    v4 = v8;
    readCFIs = self->_readCFIs;
  }
  -[NSMutableArray addObject:](readCFIs, "addObject:", v4);

}

- (unint64_t)readCFIsCount
{
  return (unint64_t)-[NSMutableArray count](self->_readCFIs, "count");
}

- (id)readCFIAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_readCFIs, "objectAtIndex:", a3);
}

+ (Class)readCFIType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCReadingStatisticsProtoBook;
  v3 = -[BCReadingStatisticsProtoBook description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsProtoBook dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *assetID;
  NSString *appVersion;
  NSString *assetVersion;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSMutableArray *readCFIs;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  assetID = self->_assetID;
  if (assetID)
    objc_msgSend(v3, "setObject:forKey:", assetID, CFSTR("assetID"));
  appVersion = self->_appVersion;
  if (appVersion)
    objc_msgSend(v4, "setObject:forKey:", appVersion, CFSTR("appVersion"));
  assetVersion = self->_assetVersion;
  if (assetVersion)
    objc_msgSend(v4, "setObject:forKey:", assetVersion, CFSTR("assetVersion"));
  if (-[NSMutableArray count](self->_tocEntrys, "count"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_tocEntrys, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = self->_tocEntrys;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v17));
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("tocEntry"));
  }
  readCFIs = self->_readCFIs;
  if (readCFIs)
    objc_msgSend(v4, "setObject:forKey:", readCFIs, CFSTR("readCFI"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCReadingStatisticsProtoBookReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *assetVersion;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v4 = a3;
  ((void (*)(void))PBDataWriterWriteStringField)();
  PBDataWriterWriteStringField(v4, self->_appVersion, 2);
  assetVersion = self->_assetVersion;
  if (assetVersion)
    PBDataWriterWriteStringField(v4, assetVersion, 3);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_tocEntrys;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage(v4, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), 4);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_readCFIs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField(v4, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j), 5);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "setAssetID:", self->_assetID);
  objc_msgSend(v12, "setAppVersion:", self->_appVersion);
  if (self->_assetVersion)
    objc_msgSend(v12, "setAssetVersion:");
  if (-[BCReadingStatisticsProtoBook tocEntrysCount](self, "tocEntrysCount"))
  {
    objc_msgSend(v12, "clearTocEntrys");
    v4 = -[BCReadingStatisticsProtoBook tocEntrysCount](self, "tocEntrysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsProtoBook tocEntryAtIndex:](self, "tocEntryAtIndex:", i));
        objc_msgSend(v12, "addTocEntry:", v7);

      }
    }
  }
  if (-[BCReadingStatisticsProtoBook readCFIsCount](self, "readCFIsCount"))
  {
    objc_msgSend(v12, "clearReadCFIs");
    v8 = -[BCReadingStatisticsProtoBook readCFIsCount](self, "readCFIsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsProtoBook readCFIAtIndex:](self, "readCFIAtIndex:", j));
        objc_msgSend(v12, "addReadCFI:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_assetID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_appVersion, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_assetVersion, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = self->_tocEntrys;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addTocEntry:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v14);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_readCFIs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v22), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addReadCFI:", v23);

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *assetID;
  NSString *appVersion;
  NSString *assetVersion;
  NSMutableArray *tocEntrys;
  NSMutableArray *readCFIs;
  unsigned __int8 v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((assetID = self->_assetID, !((unint64_t)assetID | v4[2]))
     || -[NSString isEqual:](assetID, "isEqual:"))
    && ((appVersion = self->_appVersion, !((unint64_t)appVersion | v4[1]))
     || -[NSString isEqual:](appVersion, "isEqual:"))
    && ((assetVersion = self->_assetVersion, !((unint64_t)assetVersion | v4[3]))
     || -[NSString isEqual:](assetVersion, "isEqual:"))
    && ((tocEntrys = self->_tocEntrys, !((unint64_t)tocEntrys | v4[5]))
     || -[NSMutableArray isEqual:](tocEntrys, "isEqual:")))
  {
    readCFIs = self->_readCFIs;
    if ((unint64_t)readCFIs | v4[4])
      v10 = -[NSMutableArray isEqual:](readCFIs, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_assetID, "hash");
  v4 = -[NSString hash](self->_appVersion, "hash") ^ v3;
  v5 = -[NSString hash](self->_assetVersion, "hash");
  v6 = v4 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_tocEntrys, "hash");
  return v6 ^ (unint64_t)-[NSMutableArray hash](self->_readCFIs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[BCReadingStatisticsProtoBook setAssetID:](self, "setAssetID:");
  if (*((_QWORD *)v4 + 1))
    -[BCReadingStatisticsProtoBook setAppVersion:](self, "setAppVersion:");
  if (*((_QWORD *)v4 + 3))
    -[BCReadingStatisticsProtoBook setAssetVersion:](self, "setAssetVersion:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[BCReadingStatisticsProtoBook addTocEntry:](self, "addTocEntry:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[BCReadingStatisticsProtoBook addReadCFI:](self, "addReadCFI:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetID, a3);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_appVersion, a3);
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (NSMutableArray)tocEntrys
{
  return self->_tocEntrys;
}

- (void)setTocEntrys:(id)a3
{
  objc_storeStrong((id *)&self->_tocEntrys, a3);
}

- (NSMutableArray)readCFIs
{
  return self->_readCFIs;
}

- (void)setReadCFIs:(id)a3
{
  objc_storeStrong((id *)&self->_readCFIs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tocEntrys, 0);
  objc_storeStrong((id *)&self->_readCFIs, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
}

@end
