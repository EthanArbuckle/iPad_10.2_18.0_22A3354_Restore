@implementation ODDSiriSchemaODDOptInProperties

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDOptInProperties;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDOptInProperties gradingOptInStateChanges](self, "gradingOptInStateChanges", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ODDSiriSchemaODDOptInProperties setGradingOptInStateChanges:](self, "setGradingOptInStateChanges:", v7);
  return v5;
}

- (void)setIsMteUploadEnabled:(BOOL)a3
{
  *(&self->_isServerUserDataSyncEnabled + 1) |= 1u;
  self->_isMteUploadEnabled = a3;
}

- (BOOL)hasIsMteUploadEnabled
{
  return *(&self->_isServerUserDataSyncEnabled + 1);
}

- (void)setHasIsMteUploadEnabled:(BOOL)a3
{
  *(&self->_isServerUserDataSyncEnabled + 1) = *(&self->_isServerUserDataSyncEnabled + 1) & 0xFE | a3;
}

- (void)deleteIsMteUploadEnabled
{
  -[ODDSiriSchemaODDOptInProperties setIsMteUploadEnabled:](self, "setIsMteUploadEnabled:", 0);
  *(&self->_isServerUserDataSyncEnabled + 1) &= ~1u;
}

- (void)setDataSharingOptInStatus:(int)a3
{
  *(&self->_isServerUserDataSyncEnabled + 1) |= 2u;
  self->_dataSharingOptInStatus = a3;
}

- (BOOL)hasDataSharingOptInStatus
{
  return (*((unsigned __int8 *)&self->_isServerUserDataSyncEnabled + 1) >> 1) & 1;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isServerUserDataSyncEnabled + 1) = *(&self->_isServerUserDataSyncEnabled + 1) & 0xFD | v3;
}

- (void)deleteDataSharingOptInStatus
{
  -[ODDSiriSchemaODDOptInProperties setDataSharingOptInStatus:](self, "setDataSharingOptInStatus:", 0);
  *(&self->_isServerUserDataSyncEnabled + 1) &= ~2u;
}

- (void)clearGradingOptInStateChanges
{
  -[NSArray removeAllObjects](self->_gradingOptInStateChanges, "removeAllObjects");
}

- (void)addGradingOptInStateChanges:(id)a3
{
  id v4;
  NSArray *gradingOptInStateChanges;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  gradingOptInStateChanges = self->_gradingOptInStateChanges;
  v8 = v4;
  if (!gradingOptInStateChanges)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_gradingOptInStateChanges;
    self->_gradingOptInStateChanges = v6;

    v4 = v8;
    gradingOptInStateChanges = self->_gradingOptInStateChanges;
  }
  -[NSArray addObject:](gradingOptInStateChanges, "addObject:", v4);

}

- (unint64_t)gradingOptInStateChangesCount
{
  return -[NSArray count](self->_gradingOptInStateChanges, "count");
}

- (id)gradingOptInStateChangesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_gradingOptInStateChanges, "objectAtIndexedSubscript:", a3);
}

- (void)setIsServerUserDataSyncEnabled:(BOOL)a3
{
  *(&self->_isServerUserDataSyncEnabled + 1) |= 4u;
  self->_isServerUserDataSyncEnabled = a3;
}

- (BOOL)hasIsServerUserDataSyncEnabled
{
  return (*((unsigned __int8 *)&self->_isServerUserDataSyncEnabled + 1) >> 2) & 1;
}

- (void)setHasIsServerUserDataSyncEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isServerUserDataSyncEnabled + 1) = *(&self->_isServerUserDataSyncEnabled + 1) & 0xFB | v3;
}

- (void)deleteIsServerUserDataSyncEnabled
{
  -[ODDSiriSchemaODDOptInProperties setIsServerUserDataSyncEnabled:](self, "setIsServerUserDataSyncEnabled:", 0);
  *(&self->_isServerUserDataSyncEnabled + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDOptInPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(&self->_isServerUserDataSyncEnabled + 1);
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = *(&self->_isServerUserDataSyncEnabled + 1);
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_gradingOptInStateChanges;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(&self->_isServerUserDataSyncEnabled + 1) & 4) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int isMteUploadEnabled;
  int v8;
  int dataSharingOptInStatus;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int isServerUserDataSyncEnabled;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  v5 = *((unsigned __int8 *)&self->_isServerUserDataSyncEnabled + 1);
  v6 = v4[25];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_19;
  if ((v5 & 1) != 0)
  {
    isMteUploadEnabled = self->_isMteUploadEnabled;
    if (isMteUploadEnabled != objc_msgSend(v4, "isMteUploadEnabled"))
    {
LABEL_19:
      v20 = 0;
      goto LABEL_20;
    }
    v5 = *((unsigned __int8 *)&self->_isServerUserDataSyncEnabled + 1);
    v6 = v4[25];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_19;
  if (v8)
  {
    dataSharingOptInStatus = self->_dataSharingOptInStatus;
    if (dataSharingOptInStatus != objc_msgSend(v4, "dataSharingOptInStatus"))
      goto LABEL_19;
  }
  -[ODDSiriSchemaODDOptInProperties gradingOptInStateChanges](self, "gradingOptInStateChanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradingOptInStateChanges");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_19;
  }
  -[ODDSiriSchemaODDOptInProperties gradingOptInStateChanges](self, "gradingOptInStateChanges");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ODDSiriSchemaODDOptInProperties gradingOptInStateChanges](self, "gradingOptInStateChanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gradingOptInStateChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_19;
  }
  else
  {

  }
  v18 = (*((unsigned __int8 *)&self->_isServerUserDataSyncEnabled + 1) >> 2) & 1;
  if (v18 != ((v4[25] >> 2) & 1))
    goto LABEL_19;
  if (v18)
  {
    isServerUserDataSyncEnabled = self->_isServerUserDataSyncEnabled;
    if (isServerUserDataSyncEnabled != objc_msgSend(v4, "isServerUserDataSyncEnabled"))
      goto LABEL_19;
  }
  v20 = 1;
LABEL_20:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(&self->_isServerUserDataSyncEnabled + 1))
  {
    v3 = 2654435761 * self->_isMteUploadEnabled;
    if ((*(&self->_isServerUserDataSyncEnabled + 1) & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(&self->_isServerUserDataSyncEnabled + 1) & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_dataSharingOptInStatus;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSArray hash](self->_gradingOptInStateChanges, "hash");
  if ((*(&self->_isServerUserDataSyncEnabled + 1) & 4) != 0)
    v6 = 2654435761 * self->_isServerUserDataSyncEnabled;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(&self->_isServerUserDataSyncEnabled + 1) & 2) != 0)
  {
    v4 = -[ODDSiriSchemaODDOptInProperties dataSharingOptInStatus](self, "dataSharingOptInStatus") - 1;
    if (v4 > 2)
      v5 = CFSTR("UNKNOWN");
    else
      v5 = off_1E563BEF8[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dataSharingOptInStatus"));
  }
  if (-[NSArray count](self->_gradingOptInStateChanges, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_gradingOptInStateChanges;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("gradingOptInStateChanges"));
  }
  v14 = *(&self->_isServerUserDataSyncEnabled + 1);
  if ((v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDOptInProperties isMteUploadEnabled](self, "isMteUploadEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isMteUploadEnabled"));

    v14 = *(&self->_isServerUserDataSyncEnabled + 1);
  }
  if ((v14 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDOptInProperties isServerUserDataSyncEnabled](self, "isServerUserDataSyncEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isServerUserDataSyncEnabled"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDOptInProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDOptInProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDOptInProperties *v5;
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
    self = -[ODDSiriSchemaODDOptInProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDOptInProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDOptInProperties *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  SISchemaGradingOptInStateChange *v15;
  void *v16;
  ODDSiriSchemaODDOptInProperties *v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ODDSiriSchemaODDOptInProperties;
  v5 = -[ODDSiriSchemaODDOptInProperties init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMteUploadEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDOptInProperties setIsMteUploadEnabled:](v5, "setIsMteUploadEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataSharingOptInStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDOptInProperties setDataSharingOptInStatus:](v5, "setDataSharingOptInStatus:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gradingOptInStateChanges"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v7;
      v20 = v6;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[SISchemaGradingOptInStateChange initWithDictionary:]([SISchemaGradingOptInStateChange alloc], "initWithDictionary:", v14);
              -[ODDSiriSchemaODDOptInProperties addGradingOptInStateChanges:](v5, "addGradingOptInStateChanges:", v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v11);
      }

      v7 = v19;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isServerUserDataSyncEnabled"), v19, v20, (_QWORD)v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDOptInProperties setIsServerUserDataSyncEnabled:](v5, "setIsServerUserDataSyncEnabled:", objc_msgSend(v16, "BOOLValue"));
    v17 = v5;

  }
  return v5;
}

- (BOOL)isMteUploadEnabled
{
  return self->_isMteUploadEnabled;
}

- (int)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (NSArray)gradingOptInStateChanges
{
  return self->_gradingOptInStateChanges;
}

- (void)setGradingOptInStateChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isServerUserDataSyncEnabled
{
  return self->_isServerUserDataSyncEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradingOptInStateChanges, 0);
}

@end
