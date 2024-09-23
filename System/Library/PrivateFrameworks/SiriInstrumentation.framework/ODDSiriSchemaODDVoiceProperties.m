@implementation ODDSiriSchemaODDVoiceProperties

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
  v9.super_class = (Class)ODDSiriSchemaODDVoiceProperties;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDVoiceProperties accent](self, "accent", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODDSiriSchemaODDVoiceProperties deleteAccent](self, "deleteAccent");
  return v5;
}

- (void)setGender:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_gender = a3;
}

- (BOOL)hasGender
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasGender:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteGender
{
  -[ODDSiriSchemaODDVoiceProperties setGender:](self, "setGender:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAccent
{
  return self->_accent != 0;
}

- (void)deleteAccent
{
  -[ODDSiriSchemaODDVoiceProperties setAccent:](self, "setAccent:", 0);
}

- (void)setName:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_name = a3;
}

- (BOOL)hasName
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteName
{
  -[ODDSiriSchemaODDVoiceProperties setName:](self, "setName:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearInstalledVoices
{
  -[NSArray removeAllObjects](self->_installedVoices, "removeAllObjects");
}

- (void)addInstalledVoices:(int)a3
{
  uint64_t v3;
  NSArray *installedVoices;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  installedVoices = self->_installedVoices;
  if (!installedVoices)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_installedVoices;
    self->_installedVoices = v6;

    installedVoices = self->_installedVoices;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](installedVoices, "addObject:", v8);

}

- (unint64_t)installedVoicesCount
{
  return -[NSArray count](self->_installedVoices, "count");
}

- (int)installedVoicesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_installedVoices, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDVoicePropertiesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[ODDSiriSchemaODDVoiceProperties accent](self, "accent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ODDSiriSchemaODDVoiceProperties accent](self, "accent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_installedVoices;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "intValue", (_QWORD)v12);
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int gender;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int name;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    gender = self->_gender;
    if (gender != objc_msgSend(v4, "gender"))
      goto LABEL_18;
  }
  -[ODDSiriSchemaODDVoiceProperties accent](self, "accent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[ODDSiriSchemaODDVoiceProperties accent](self, "accent");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODDSiriSchemaODDVoiceProperties accent](self, "accent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  v13 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v13 != ((v4[40] >> 1) & 1))
    goto LABEL_18;
  if (v13)
  {
    name = self->_name;
    if (name != objc_msgSend(v4, "name"))
      goto LABEL_18;
  }
  -[ODDSiriSchemaODDVoiceProperties installedVoices](self, "installedVoices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installedVoices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ODDSiriSchemaODDVoiceProperties installedVoices](self, "installedVoices");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

LABEL_21:
      v20 = 1;
      goto LABEL_19;
    }
    v16 = (void *)v15;
    -[ODDSiriSchemaODDVoiceProperties installedVoices](self, "installedVoices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "installedVoices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if ((v19 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v20 = 0;
LABEL_19:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_gender;
  else
    v3 = 0;
  v4 = -[SISchemaISOLocale hash](self->_accent, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_name;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_installedVoices, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accent)
  {
    -[ODDSiriSchemaODDVoiceProperties accent](self, "accent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accent"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[ODDSiriSchemaODDVoiceProperties gender](self, "gender") - 1;
    if (v7 > 2)
      v8 = CFSTR("VOICEGENDER_UNKNOWN_VOICE_GENDER");
    else
      v8 = off_1E563BF40[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("gender"));
  }
  if (-[NSArray count](self->_installedVoices, "count"))
  {
    -[ODDSiriSchemaODDVoiceProperties installedVoices](self, "installedVoices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("installedVoices"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11 = -[ODDSiriSchemaODDVoiceProperties name](self, "name") - 1;
    if (v11 > 0x5C)
      v12 = CFSTR("VOICENAME_UNKNOWN");
    else
      v12 = off_1E563BF58[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("name"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDVoiceProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDVoiceProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDVoiceProperties *v5;
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
    self = -[ODDSiriSchemaODDVoiceProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDVoiceProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDVoiceProperties *v5;
  void *v6;
  void *v7;
  SISchemaISOLocale *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  ODDSiriSchemaODDVoiceProperties *v17;
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
  v25.super_class = (Class)ODDSiriSchemaODDVoiceProperties;
  v5 = -[ODDSiriSchemaODDVoiceProperties init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gender"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDVoiceProperties setGender:](v5, "setGender:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v7);
      -[ODDSiriSchemaODDVoiceProperties setAccent:](v5, "setAccent:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDVoiceProperties setName:](v5, "setName:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("installedVoices"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v7;
      v20 = v6;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ODDSiriSchemaODDVoiceProperties addInstalledVoices:](v5, "addInstalledVoices:", objc_msgSend(v16, "intValue"));
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v13);
      }

      v7 = v19;
      v6 = v20;
    }
    v17 = v5;

  }
  return v5;
}

- (int)gender
{
  return self->_gender;
}

- (SISchemaISOLocale)accent
{
  return self->_accent;
}

- (void)setAccent:(id)a3
{
  objc_storeStrong((id *)&self->_accent, a3);
}

- (int)name
{
  return self->_name;
}

- (NSArray)installedVoices
{
  return self->_installedVoices;
}

- (void)setInstalledVoices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasAccent:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedVoices, 0);
  objc_storeStrong((id *)&self->_accent, 0);
}

@end
