@implementation UAFSchemaUAFAssetSet

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UAFSchemaUAFAssetSet;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSchemaUAFAssetSet assets](self, "assets", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSchemaUAFAssetSet setAssets:](self, "setAssets:", v7);

  -[UAFSchemaUAFAssetSet mobileAssetDownloadErrorCodeFrequencys](self, "mobileAssetDownloadErrorCodeFrequencys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UAFSchemaUAFAssetSet setMobileAssetDownloadErrorCodeFrequencys:](self, "setMobileAssetDownloadErrorCodeFrequencys:", v9);
  return v5;
}

- (BOOL)hasAssetSetName
{
  return self->_assetSetName != 0;
}

- (void)deleteAssetSetName
{
  -[UAFSchemaUAFAssetSet setAssetSetName:](self, "setAssetSetName:", 0);
}

- (void)clearAssets
{
  -[NSArray removeAllObjects](self->_assets, "removeAllObjects");
}

- (void)addAssets:(id)a3
{
  id v4;
  NSArray *assets;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  assets = self->_assets;
  v8 = v4;
  if (!assets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_assets;
    self->_assets = v6;

    v4 = v8;
    assets = self->_assets;
  }
  -[NSArray addObject:](assets, "addObject:", v4);

}

- (unint64_t)assetsCount
{
  return -[NSArray count](self->_assets, "count");
}

- (id)assetsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasAssetType
{
  return self->_assetType != 0;
}

- (void)deleteAssetType
{
  -[UAFSchemaUAFAssetSet setAssetType:](self, "setAssetType:", 0);
}

- (BOOL)hasAssetSetId
{
  return self->_assetSetId != 0;
}

- (void)deleteAssetSetId
{
  -[UAFSchemaUAFAssetSet setAssetSetId:](self, "setAssetSetId:", 0);
}

- (BOOL)hasAudienceId
{
  return self->_audienceId != 0;
}

- (void)deleteAudienceId
{
  -[UAFSchemaUAFAssetSet setAudienceId:](self, "setAudienceId:", 0);
}

- (void)clearMobileAssetDownloadErrorCodeFrequency
{
  -[NSArray removeAllObjects](self->_mobileAssetDownloadErrorCodeFrequencys, "removeAllObjects");
}

- (void)addMobileAssetDownloadErrorCodeFrequency:(id)a3
{
  id v4;
  NSArray *mobileAssetDownloadErrorCodeFrequencys;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  mobileAssetDownloadErrorCodeFrequencys = self->_mobileAssetDownloadErrorCodeFrequencys;
  v8 = v4;
  if (!mobileAssetDownloadErrorCodeFrequencys)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mobileAssetDownloadErrorCodeFrequencys;
    self->_mobileAssetDownloadErrorCodeFrequencys = v6;

    v4 = v8;
    mobileAssetDownloadErrorCodeFrequencys = self->_mobileAssetDownloadErrorCodeFrequencys;
  }
  -[NSArray addObject:](mobileAssetDownloadErrorCodeFrequencys, "addObject:", v4);

}

- (unint64_t)mobileAssetDownloadErrorCodeFrequencyCount
{
  return -[NSArray count](self->_mobileAssetDownloadErrorCodeFrequencys, "count");
}

- (id)mobileAssetDownloadErrorCodeFrequencyAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_mobileAssetDownloadErrorCodeFrequencys, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetSetReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UAFSchemaUAFAssetSet assetSetName](self, "assetSetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self->_assets;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  -[UAFSchemaUAFAssetSet assetType](self, "assetType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[UAFSchemaUAFAssetSet assetSetId](self, "assetSetId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[UAFSchemaUAFAssetSet audienceId](self, "audienceId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = self->_mobileAssetDownloadErrorCodeFrequencys;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[UAFSchemaUAFAssetSet assetSetName](self, "assetSetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[UAFSchemaUAFAssetSet assetSetName](self, "assetSetName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[UAFSchemaUAFAssetSet assetSetName](self, "assetSetName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSet assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[UAFSchemaUAFAssetSet assets](self, "assets");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[UAFSchemaUAFAssetSet assets](self, "assets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assets");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSet assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[UAFSchemaUAFAssetSet assetType](self, "assetType");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[UAFSchemaUAFAssetSet assetType](self, "assetType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSet assetSetId](self, "assetSetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[UAFSchemaUAFAssetSet assetSetId](self, "assetSetId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[UAFSchemaUAFAssetSet assetSetId](self, "assetSetId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSet audienceId](self, "audienceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audienceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[UAFSchemaUAFAssetSet audienceId](self, "audienceId");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[UAFSchemaUAFAssetSet audienceId](self, "audienceId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audienceId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSet mobileAssetDownloadErrorCodeFrequencys](self, "mobileAssetDownloadErrorCodeFrequencys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileAssetDownloadErrorCodeFrequencys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[UAFSchemaUAFAssetSet mobileAssetDownloadErrorCodeFrequencys](self, "mobileAssetDownloadErrorCodeFrequencys");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[UAFSchemaUAFAssetSet mobileAssetDownloadErrorCodeFrequencys](self, "mobileAssetDownloadErrorCodeFrequencys");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mobileAssetDownloadErrorCodeFrequencys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_assetSetName, "hash");
  v4 = -[NSArray hash](self->_assets, "hash") ^ v3;
  v5 = -[NSString hash](self->_assetType, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_assetSetId, "hash");
  v7 = -[NSString hash](self->_audienceId, "hash");
  return v6 ^ v7 ^ -[NSArray hash](self->_mobileAssetDownloadErrorCodeFrequencys, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_assetSetId)
  {
    -[UAFSchemaUAFAssetSet assetSetId](self, "assetSetId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetSetId"));

  }
  if (self->_assetSetName)
  {
    -[UAFSchemaUAFAssetSet assetSetName](self, "assetSetName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("assetSetName"));

  }
  if (self->_assetType)
  {
    -[UAFSchemaUAFAssetSet assetType](self, "assetType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assetType"));

  }
  if (-[NSArray count](self->_assets, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = self->_assets;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v10, "addObject:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("assets"));
  }
  if (self->_audienceId)
  {
    -[UAFSchemaUAFAssetSet audienceId](self, "audienceId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("audienceId"));

  }
  if (-[NSArray count](self->_mobileAssetDownloadErrorCodeFrequencys, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = self->_mobileAssetDownloadErrorCodeFrequencys;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v29);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v20, "addObject:", v26);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v27);

          }
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("mobileAssetDownloadErrorCodeFrequency"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v29);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[UAFSchemaUAFAssetSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (UAFSchemaUAFAssetSet)initWithJSON:(id)a3
{
  void *v4;
  UAFSchemaUAFAssetSet *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[UAFSchemaUAFAssetSet initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (UAFSchemaUAFAssetSet)initWithDictionary:(id)a3
{
  id v4;
  UAFSchemaUAFAssetSet *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  UAFSchemaUAFAsset *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency *v30;
  UAFSchemaUAFAssetSet *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)UAFSchemaUAFAssetSet;
  v5 = -[UAFSchemaUAFAssetSet init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[UAFSchemaUAFAssetSet setAssetSetName:](v5, "setAssetSetName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = v8;
    v36 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v42 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[UAFSchemaUAFAsset initWithDictionary:]([UAFSchemaUAFAsset alloc], "initWithDictionary:", v14);
              -[UAFSchemaUAFAssetSet addAssets:](v5, "addAssets:", v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v11);
      }

      v8 = v35;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[UAFSchemaUAFAssetSet setAssetType:](v5, "setAssetType:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[UAFSchemaUAFAssetSet setAssetSetId:](v5, "setAssetSetId:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audienceId"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v20;
      v22 = (void *)objc_msgSend(v20, "copy");
      -[UAFSchemaUAFAssetSet setAudienceId:](v5, "setAudienceId:", v22);

      v20 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mobileAssetDownloadErrorCodeFrequency"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = v20;
      v34 = v18;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v38 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = -[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency initWithDictionary:]([UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency alloc], "initWithDictionary:", v29);
              -[UAFSchemaUAFAssetSet addMobileAssetDownloadErrorCodeFrequency:](v5, "addMobileAssetDownloadErrorCodeFrequency:", v30);

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        }
        while (v26);
      }

      v8 = v35;
      v6 = v36;
      v18 = v34;
      v20 = v33;
    }
    v31 = v5;

  }
  return v5;
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void)setAssetSetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)assetSetId
{
  return self->_assetSetId;
}

- (void)setAssetSetId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)audienceId
{
  return self->_audienceId;
}

- (void)setAudienceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)mobileAssetDownloadErrorCodeFrequencys
{
  return self->_mobileAssetDownloadErrorCodeFrequencys;
}

- (void)setMobileAssetDownloadErrorCodeFrequencys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHasAssetSetName:(BOOL)a3
{
  self->_hasAssetSetName = a3;
}

- (void)setHasAssetType:(BOOL)a3
{
  self->_hasAssetType = a3;
}

- (void)setHasAssetSetId:(BOOL)a3
{
  self->_hasAssetSetId = a3;
}

- (void)setHasAudienceId:(BOOL)a3
{
  self->_hasAudienceId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetDownloadErrorCodeFrequencys, 0);
  objc_storeStrong((id *)&self->_audienceId, 0);
  objc_storeStrong((id *)&self->_assetSetId, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
}

@end
