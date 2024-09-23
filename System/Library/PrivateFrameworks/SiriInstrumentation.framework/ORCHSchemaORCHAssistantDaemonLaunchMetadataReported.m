@implementation ORCHSchemaORCHAssistantDaemonLaunchMetadataReported

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAssistantDaemonSpawnTimestampInNs:(int64_t)a3
{
  *(&self->_isFirstRequest + 1) |= 1u;
  self->_assistantDaemonSpawnTimestampInNs = a3;
}

- (BOOL)hasAssistantDaemonSpawnTimestampInNs
{
  return *(&self->_isFirstRequest + 1);
}

- (void)setHasAssistantDaemonSpawnTimestampInNs:(BOOL)a3
{
  *(&self->_isFirstRequest + 1) = *(&self->_isFirstRequest + 1) & 0xFE | a3;
}

- (void)deleteAssistantDaemonSpawnTimestampInNs
{
  -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported setAssistantDaemonSpawnTimestampInNs:](self, "setAssistantDaemonSpawnTimestampInNs:", 0);
  *(&self->_isFirstRequest + 1) &= ~1u;
}

- (void)setAssistantDaemonLoadedTimestampInNs:(int64_t)a3
{
  *(&self->_isFirstRequest + 1) |= 2u;
  self->_assistantDaemonLoadedTimestampInNs = a3;
}

- (BOOL)hasAssistantDaemonLoadedTimestampInNs
{
  return (*((unsigned __int8 *)&self->_isFirstRequest + 1) >> 1) & 1;
}

- (void)setHasAssistantDaemonLoadedTimestampInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isFirstRequest + 1) = *(&self->_isFirstRequest + 1) & 0xFD | v3;
}

- (void)deleteAssistantDaemonLoadedTimestampInNs
{
  -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported setAssistantDaemonLoadedTimestampInNs:](self, "setAssistantDaemonLoadedTimestampInNs:", 0);
  *(&self->_isFirstRequest + 1) &= ~2u;
}

- (void)setIsFirstRequest:(BOOL)a3
{
  *(&self->_isFirstRequest + 1) |= 4u;
  self->_isFirstRequest = a3;
}

- (BOOL)hasIsFirstRequest
{
  return (*((unsigned __int8 *)&self->_isFirstRequest + 1) >> 2) & 1;
}

- (void)setHasIsFirstRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isFirstRequest + 1) = *(&self->_isFirstRequest + 1) & 0xFB | v3;
}

- (void)deleteIsFirstRequest
{
  -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported setIsFirstRequest:](self, "setIsFirstRequest:", 0);
  *(&self->_isFirstRequest + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHAssistantDaemonLaunchMetadataReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_isFirstRequest + 1);
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    if ((*(&self->_isFirstRequest + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt64Field();
    v4 = v6;
    if ((*(&self->_isFirstRequest + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  v5 = *(&self->_isFirstRequest + 1);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int64_t assistantDaemonSpawnTimestampInNs;
  int v8;
  int64_t assistantDaemonLoadedTimestampInNs;
  int v10;
  int isFirstRequest;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = *((unsigned __int8 *)&self->_isFirstRequest + 1);
  v6 = v4[25];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_14;
  if ((v5 & 1) != 0)
  {
    assistantDaemonSpawnTimestampInNs = self->_assistantDaemonSpawnTimestampInNs;
    if (assistantDaemonSpawnTimestampInNs != objc_msgSend(v4, "assistantDaemonSpawnTimestampInNs"))
      goto LABEL_14;
    v5 = *((unsigned __int8 *)&self->_isFirstRequest + 1);
    v6 = v4[25];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    assistantDaemonLoadedTimestampInNs = self->_assistantDaemonLoadedTimestampInNs;
    if (assistantDaemonLoadedTimestampInNs == objc_msgSend(v4, "assistantDaemonLoadedTimestampInNs"))
    {
      v5 = *((unsigned __int8 *)&self->_isFirstRequest + 1);
      v6 = v4[25];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    isFirstRequest = self->_isFirstRequest;
    if (isFirstRequest != objc_msgSend(v4, "isFirstRequest"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!*(&self->_isFirstRequest + 1))
  {
    v2 = 0;
    if ((*(&self->_isFirstRequest + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(&self->_isFirstRequest + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_assistantDaemonSpawnTimestampInNs;
  if ((*(&self->_isFirstRequest + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_assistantDaemonLoadedTimestampInNs;
  if ((*(&self->_isFirstRequest + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_isFirstRequest;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isFirstRequest + 1);
  if ((v4 & 2) == 0)
  {
    if (!*(&self->_isFirstRequest + 1))
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported assistantDaemonSpawnTimestampInNs](self, "assistantDaemonSpawnTimestampInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("assistantDaemonSpawnTimestampInNs"));

    if ((*(&self->_isFirstRequest + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported assistantDaemonLoadedTimestampInNs](self, "assistantDaemonLoadedTimestampInNs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("assistantDaemonLoadedTimestampInNs"));

  v4 = *(&self->_isFirstRequest + 1);
  if ((v4 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported isFirstRequest](self, "isFirstRequest"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isFirstRequest"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *v5;
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
    self = -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *v5;
  void *v6;
  void *v7;
  void *v8;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHAssistantDaemonLaunchMetadataReported;
  v5 = -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonSpawnTimestampInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported setAssistantDaemonSpawnTimestampInNs:](v5, "setAssistantDaemonSpawnTimestampInNs:", objc_msgSend(v6, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonLoadedTimestampInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported setAssistantDaemonLoadedTimestampInNs:](v5, "setAssistantDaemonLoadedTimestampInNs:", objc_msgSend(v7, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFirstRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported setIsFirstRequest:](v5, "setIsFirstRequest:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (int64_t)assistantDaemonSpawnTimestampInNs
{
  return self->_assistantDaemonSpawnTimestampInNs;
}

- (int64_t)assistantDaemonLoadedTimestampInNs
{
  return self->_assistantDaemonLoadedTimestampInNs;
}

- (BOOL)isFirstRequest
{
  return self->_isFirstRequest;
}

@end
