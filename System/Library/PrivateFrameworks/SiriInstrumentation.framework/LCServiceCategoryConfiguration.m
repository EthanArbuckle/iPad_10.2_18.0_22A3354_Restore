@implementation LCServiceCategoryConfiguration

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LCServiceCategoryConfiguration;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCServiceCategoryConfiguration categoryParameters](self, "categoryParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[LCServiceCategoryConfiguration deleteCategoryParameters](self, "deleteCategoryParameters");
  -[LCServiceCategoryConfiguration blacklist](self, "blacklist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[LCServiceCategoryConfiguration deleteBlacklist](self, "deleteBlacklist");

  return v5;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventType = a3;
}

- (BOOL)hasEventType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEventType
{
  -[LCServiceCategoryConfiguration setEventType:](self, "setEventType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasCategoryParameters
{
  return self->_categoryParameters != 0;
}

- (void)deleteCategoryParameters
{
  -[LCServiceCategoryConfiguration setCategoryParameters:](self, "setCategoryParameters:", 0);
}

- (BOOL)hasBlacklist
{
  return self->_blacklist != 0;
}

- (void)deleteBlacklist
{
  -[LCServiceCategoryConfiguration setBlacklist:](self, "setBlacklist:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return LCServiceCategoryConfigurationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[LCServiceCategoryConfiguration categoryParameters](self, "categoryParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LCServiceCategoryConfiguration categoryParameters](self, "categoryParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LCServiceCategoryConfiguration blacklist](self, "blacklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[LCServiceCategoryConfiguration blacklist](self, "blacklist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int eventType;
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
    eventType = self->_eventType;
    if (eventType != objc_msgSend(v4, "eventType"))
      goto LABEL_15;
  }
  -[LCServiceCategoryConfiguration categoryParameters](self, "categoryParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[LCServiceCategoryConfiguration categoryParameters](self, "categoryParameters");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[LCServiceCategoryConfiguration categoryParameters](self, "categoryParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categoryParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[LCServiceCategoryConfiguration blacklist](self, "blacklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blacklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[LCServiceCategoryConfiguration blacklist](self, "blacklist");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[LCServiceCategoryConfiguration blacklist](self, "blacklist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blacklist");
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
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_eventType;
  else
    v3 = 0;
  v4 = -[LCServiceLoggingParameters hash](self->_categoryParameters, "hash") ^ v3;
  return v4 ^ -[LCServiceBlacklistedFields hash](self->_blacklist, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_blacklist)
  {
    -[LCServiceCategoryConfiguration blacklist](self, "blacklist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("blacklist"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("blacklist"));

    }
  }
  if (self->_categoryParameters)
  {
    -[LCServiceCategoryConfiguration categoryParameters](self, "categoryParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("categoryParameters"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("categoryParameters"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[LCServiceCategoryConfiguration eventType](self, "eventType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("eventType"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LCServiceCategoryConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LCServiceCategoryConfiguration)initWithJSON:(id)a3
{
  void *v4;
  LCServiceCategoryConfiguration *v5;
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
    self = -[LCServiceCategoryConfiguration initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LCServiceCategoryConfiguration)initWithDictionary:(id)a3
{
  id v4;
  LCServiceCategoryConfiguration *v5;
  void *v6;
  void *v7;
  LCServiceLoggingParameters *v8;
  void *v9;
  LCServiceBlacklistedFields *v10;
  LCServiceCategoryConfiguration *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LCServiceCategoryConfiguration;
  v5 = -[LCServiceCategoryConfiguration init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LCServiceCategoryConfiguration setEventType:](v5, "setEventType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categoryParameters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[LCServiceLoggingParameters initWithDictionary:]([LCServiceLoggingParameters alloc], "initWithDictionary:", v7);
      -[LCServiceCategoryConfiguration setCategoryParameters:](v5, "setCategoryParameters:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("blacklist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[LCServiceBlacklistedFields initWithDictionary:]([LCServiceBlacklistedFields alloc], "initWithDictionary:", v9);
      -[LCServiceCategoryConfiguration setBlacklist:](v5, "setBlacklist:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (int)eventType
{
  return self->_eventType;
}

- (LCServiceLoggingParameters)categoryParameters
{
  return self->_categoryParameters;
}

- (void)setCategoryParameters:(id)a3
{
  objc_storeStrong((id *)&self->_categoryParameters, a3);
}

- (LCServiceBlacklistedFields)blacklist
{
  return self->_blacklist;
}

- (void)setBlacklist:(id)a3
{
  objc_storeStrong((id *)&self->_blacklist, a3);
}

- (void)setHasCategoryParameters:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasBlacklist:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklist, 0);
  objc_storeStrong((id *)&self->_categoryParameters, 0);
}

@end
