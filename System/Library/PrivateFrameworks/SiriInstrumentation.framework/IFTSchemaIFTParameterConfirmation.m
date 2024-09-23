@implementation IFTSchemaIFTParameterConfirmation

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
  v9.super_class = (Class)IFTSchemaIFTParameterConfirmation;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTParameterConfirmation item](self, "item", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IFTSchemaIFTParameterConfirmation deleteItem](self, "deleteItem");
  return v5;
}

- (void)setExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  -[IFTSchemaIFTParameterConfirmation setExists:](self, "setExists:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasParameterId
{
  return self->_parameterId != 0;
}

- (void)deleteParameterId
{
  -[IFTSchemaIFTParameterConfirmation setParameterId:](self, "setParameterId:", 0);
}

- (void)setParameterIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_parameterIndex = a3;
}

- (BOOL)hasParameterIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasParameterIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteParameterIndex
{
  -[IFTSchemaIFTParameterConfirmation setParameterIndex:](self, "setParameterIndex:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasItem
{
  return self->_item != 0;
}

- (void)deleteItem
{
  -[IFTSchemaIFTParameterConfirmation setItem:](self, "setItem:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTParameterConfirmationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[IFTSchemaIFTParameterConfirmation parameterId](self, "parameterId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();
  -[IFTSchemaIFTParameterConfirmation item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[IFTSchemaIFTParameterConfirmation item](self, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int exists;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int64_t parameterIndex;
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
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_18;
  }
  -[IFTSchemaIFTParameterConfirmation parameterId](self, "parameterId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[IFTSchemaIFTParameterConfirmation parameterId](self, "parameterId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTParameterConfirmation parameterId](self, "parameterId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterId");
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
    parameterIndex = self->_parameterIndex;
    if (parameterIndex != objc_msgSend(v4, "parameterIndex"))
      goto LABEL_18;
  }
  -[IFTSchemaIFTParameterConfirmation item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTParameterConfirmation item](self, "item");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

LABEL_21:
      v20 = 1;
      goto LABEL_19;
    }
    v16 = (void *)v15;
    -[IFTSchemaIFTParameterConfirmation item](self, "item");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "item");
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
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_exists;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_parameterId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_parameterIndex;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[IFTSchemaIFTTypedValue hash](self->_item, "hash");
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTParameterConfirmation exists](self, "exists"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("exists"));

  }
  if (self->_item)
  {
    -[IFTSchemaIFTParameterConfirmation item](self, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("item"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("item"));

    }
  }
  if (self->_parameterId)
  {
    -[IFTSchemaIFTParameterConfirmation parameterId](self, "parameterId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("parameterId"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IFTSchemaIFTParameterConfirmation parameterIndex](self, "parameterIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("parameterIndex"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTParameterConfirmation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTParameterConfirmation)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTParameterConfirmation *v5;
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
    self = -[IFTSchemaIFTParameterConfirmation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTParameterConfirmation)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTParameterConfirmation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IFTSchemaIFTTypedValue *v11;
  IFTSchemaIFTParameterConfirmation *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IFTSchemaIFTParameterConfirmation;
  v5 = -[IFTSchemaIFTParameterConfirmation init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTParameterConfirmation setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameterId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[IFTSchemaIFTParameterConfirmation setParameterId:](v5, "setParameterId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameterIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTParameterConfirmation setParameterIndex:](v5, "setParameterIndex:", objc_msgSend(v9, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[IFTSchemaIFTTypedValue initWithDictionary:]([IFTSchemaIFTTypedValue alloc], "initWithDictionary:", v10);
      -[IFTSchemaIFTParameterConfirmation setItem:](v5, "setItem:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (NSString)parameterId
{
  return self->_parameterId;
}

- (void)setParameterId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)parameterIndex
{
  return self->_parameterIndex;
}

- (IFTSchemaIFTTypedValue)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void)setHasParameterId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasItem:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_parameterId, 0);
}

@end
