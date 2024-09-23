@implementation ODDSiriSchemaODDUserPersonalization

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
  v9.super_class = (Class)ODDSiriSchemaODDUserPersonalization;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDUserPersonalization voiceSettings](self, "voiceSettings", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODDSiriSchemaODDUserPersonalization deleteVoiceSettings](self, "deleteVoiceSettings");
  return v5;
}

- (void)setIsPersonalDomainRequestsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isPersonalDomainRequestsEnabled = a3;
}

- (BOOL)hasIsPersonalDomainRequestsEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsPersonalDomainRequestsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsPersonalDomainRequestsEnabled
{
  -[ODDSiriSchemaODDUserPersonalization setIsPersonalDomainRequestsEnabled:](self, "setIsPersonalDomainRequestsEnabled:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearActiveSubscriptions
{
  -[NSArray removeAllObjects](self->_activeSubscriptions, "removeAllObjects");
}

- (void)addActiveSubscriptions:(int)a3
{
  uint64_t v3;
  NSArray *activeSubscriptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  activeSubscriptions = self->_activeSubscriptions;
  if (!activeSubscriptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeSubscriptions;
    self->_activeSubscriptions = v6;

    activeSubscriptions = self->_activeSubscriptions;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](activeSubscriptions, "addObject:", v8);

}

- (unint64_t)activeSubscriptionsCount
{
  return -[NSArray count](self->_activeSubscriptions, "count");
}

- (int)activeSubscriptionsAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_activeSubscriptions, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)hasVoiceSettings
{
  return self->_voiceSettings != 0;
}

- (void)deleteVoiceSettings
{
  -[ODDSiriSchemaODDUserPersonalization setVoiceSettings:](self, "setVoiceSettings:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDUserPersonalizationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_activeSubscriptions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "intValue", (_QWORD)v12);
        PBDataWriterWriteInt32Field();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[ODDSiriSchemaODDUserPersonalization voiceSettings](self, "voiceSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ODDSiriSchemaODDUserPersonalization voiceSettings](self, "voiceSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int isPersonalDomainRequestsEnabled;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isPersonalDomainRequestsEnabled = self->_isPersonalDomainRequestsEnabled;
    if (isPersonalDomainRequestsEnabled != objc_msgSend(v4, "isPersonalDomainRequestsEnabled"))
      goto LABEL_15;
  }
  -[ODDSiriSchemaODDUserPersonalization activeSubscriptions](self, "activeSubscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSubscriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[ODDSiriSchemaODDUserPersonalization activeSubscriptions](self, "activeSubscriptions");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODDSiriSchemaODDUserPersonalization activeSubscriptions](self, "activeSubscriptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeSubscriptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[ODDSiriSchemaODDUserPersonalization voiceSettings](self, "voiceSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ODDSiriSchemaODDUserPersonalization voiceSettings](self, "voiceSettings");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[ODDSiriSchemaODDUserPersonalization voiceSettings](self, "voiceSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_isPersonalDomainRequestsEnabled;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_activeSubscriptions, "hash") ^ v3;
  return v4 ^ -[SISchemaVoiceSettings hash](self->_voiceSettings, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_activeSubscriptions, "count"))
  {
    -[ODDSiriSchemaODDUserPersonalization activeSubscriptions](self, "activeSubscriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("activeSubscriptions"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDUserPersonalization isPersonalDomainRequestsEnabled](self, "isPersonalDomainRequestsEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isPersonalDomainRequestsEnabled"));

  }
  if (self->_voiceSettings)
  {
    -[ODDSiriSchemaODDUserPersonalization voiceSettings](self, "voiceSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("voiceSettings"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("voiceSettings"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDUserPersonalization dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDUserPersonalization)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDUserPersonalization *v5;
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
    self = -[ODDSiriSchemaODDUserPersonalization initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDUserPersonalization)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDUserPersonalization *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SISchemaVoiceSettings *v15;
  ODDSiriSchemaODDUserPersonalization *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ODDSiriSchemaODDUserPersonalization;
  v5 = -[ODDSiriSchemaODDUserPersonalization init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPersonalDomainRequestsEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDUserPersonalization setIsPersonalDomainRequestsEnabled:](v5, "setIsPersonalDomainRequestsEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeSubscriptions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ODDSiriSchemaODDUserPersonalization addActiveSubscriptions:](v5, "addActiveSubscriptions:", objc_msgSend(v13, "intValue", (_QWORD)v18));
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v10);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceSettings"), (_QWORD)v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaVoiceSettings initWithDictionary:]([SISchemaVoiceSettings alloc], "initWithDictionary:", v14);
      -[ODDSiriSchemaODDUserPersonalization setVoiceSettings:](v5, "setVoiceSettings:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (BOOL)isPersonalDomainRequestsEnabled
{
  return self->_isPersonalDomainRequestsEnabled;
}

- (NSArray)activeSubscriptions
{
  return self->_activeSubscriptions;
}

- (void)setActiveSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SISchemaVoiceSettings)voiceSettings
{
  return self->_voiceSettings;
}

- (void)setVoiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_voiceSettings, a3);
}

- (void)setHasVoiceSettings:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSettings, 0);
  objc_storeStrong((id *)&self->_activeSubscriptions, 0);
}

@end
