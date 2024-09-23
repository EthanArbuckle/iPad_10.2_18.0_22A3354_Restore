@implementation IFTSchemaIFTActionSuccess

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
  v9.super_class = (Class)IFTSchemaIFTActionSuccess;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTActionSuccess returnValue](self, "returnValue", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IFTSchemaIFTActionSuccess deleteReturnValue](self, "deleteReturnValue");
  return v5;
}

- (void)setExists:(BOOL)a3
{
  *(&self->_appLaunched + 1) |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(&self->_appLaunched + 1);
}

- (void)setHasExists:(BOOL)a3
{
  *(&self->_appLaunched + 1) = *(&self->_appLaunched + 1) & 0xFE | a3;
}

- (void)deleteExists
{
  -[IFTSchemaIFTActionSuccess setExists:](self, "setExists:", 0);
  *(&self->_appLaunched + 1) &= ~1u;
}

- (BOOL)hasReturnValue
{
  return self->_returnValue != 0;
}

- (void)deleteReturnValue
{
  -[IFTSchemaIFTActionSuccess setReturnValue:](self, "setReturnValue:", 0);
}

- (void)setAppLaunched:(BOOL)a3
{
  *(&self->_appLaunched + 1) |= 2u;
  self->_appLaunched = a3;
}

- (BOOL)hasAppLaunched
{
  return (*((unsigned __int8 *)&self->_appLaunched + 1) >> 1) & 1;
}

- (void)setHasAppLaunched:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_appLaunched + 1) = *(&self->_appLaunched + 1) & 0xFD | v3;
}

- (void)deleteAppLaunched
{
  -[IFTSchemaIFTActionSuccess setAppLaunched:](self, "setAppLaunched:", 0);
  *(&self->_appLaunched + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionSuccessReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (*(&self->_appLaunched + 1))
    PBDataWriterWriteBOOLField();
  -[IFTSchemaIFTActionSuccess returnValue](self, "returnValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTActionSuccess returnValue](self, "returnValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(&self->_appLaunched + 1) & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int exists;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int appLaunched;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if (*(&self->_appLaunched + 1) != (v4[25] & 1))
    goto LABEL_15;
  if (*(&self->_appLaunched + 1))
  {
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_15;
  }
  -[IFTSchemaIFTActionSuccess returnValue](self, "returnValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[IFTSchemaIFTActionSuccess returnValue](self, "returnValue");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[IFTSchemaIFTActionSuccess returnValue](self, "returnValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "returnValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  else
  {

  }
  v14 = (*((unsigned __int8 *)&self->_appLaunched + 1) >> 1) & 1;
  if (v14 != ((v4[25] >> 1) & 1))
    goto LABEL_15;
  if (v14)
  {
    appLaunched = self->_appLaunched;
    if (appLaunched != objc_msgSend(v4, "appLaunched"))
      goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (*(&self->_appLaunched + 1))
    v3 = 2654435761 * self->_exists;
  else
    v3 = 0;
  v4 = -[IFTSchemaIFTTypedValue hash](self->_returnValue, "hash");
  if ((*(&self->_appLaunched + 1) & 2) != 0)
    v5 = 2654435761 * self->_appLaunched;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_appLaunched + 1);
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionSuccess appLaunched](self, "appLaunched"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appLaunched"));

    v4 = *(&self->_appLaunched + 1);
  }
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionSuccess exists](self, "exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("exists"));

  }
  if (self->_returnValue)
  {
    -[IFTSchemaIFTActionSuccess returnValue](self, "returnValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("returnValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("returnValue"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTActionSuccess dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTActionSuccess)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTActionSuccess *v5;
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
    self = -[IFTSchemaIFTActionSuccess initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTActionSuccess)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTActionSuccess *v5;
  void *v6;
  void *v7;
  IFTSchemaIFTTypedValue *v8;
  void *v9;
  IFTSchemaIFTActionSuccess *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTActionSuccess;
  v5 = -[IFTSchemaIFTActionSuccess init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionSuccess setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("returnValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[IFTSchemaIFTTypedValue initWithDictionary:]([IFTSchemaIFTTypedValue alloc], "initWithDictionary:", v7);
      -[IFTSchemaIFTActionSuccess setReturnValue:](v5, "setReturnValue:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLaunched"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionSuccess setAppLaunched:](v5, "setAppLaunched:", objc_msgSend(v9, "BOOLValue"));
    v10 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTTypedValue)returnValue
{
  return self->_returnValue;
}

- (void)setReturnValue:(id)a3
{
  objc_storeStrong((id *)&self->_returnValue, a3);
}

- (BOOL)appLaunched
{
  return self->_appLaunched;
}

- (void)setHasReturnValue:(BOOL)a3
{
  *(&self->_appLaunched + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnValue, 0);
}

@end
