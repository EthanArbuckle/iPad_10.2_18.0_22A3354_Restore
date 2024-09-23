@implementation USOSchemaUSOEntityIdentifierTier1

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)USOSchemaUSOEntityIdentifierTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[USOSchemaUSOEntityIdentifierTier1 deleteValue](self, "deleteValue");
    -[USOSchemaUSOEntityIdentifierTier1 deleteBackingAppBundleId](self, "deleteBackingAppBundleId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[USOSchemaUSOEntityIdentifierTier1 deleteValue](self, "deleteValue");
    -[USOSchemaUSOEntityIdentifierTier1 deleteBackingAppBundleId](self, "deleteBackingAppBundleId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[USOSchemaUSOEntityIdentifierTier1 deleteValue](self, "deleteValue");
    -[USOSchemaUSOEntityIdentifierTier1 deleteBackingAppBundleId](self, "deleteBackingAppBundleId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[USOSchemaUSOEntityIdentifierTier1 deleteValue](self, "deleteValue");
    -[USOSchemaUSOEntityIdentifierTier1 deleteBackingAppBundleId](self, "deleteBackingAppBundleId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[USOSchemaUSOEntityIdentifierTier1 deleteValue](self, "deleteValue");
    -[USOSchemaUSOEntityIdentifierTier1 deleteBackingAppBundleId](self, "deleteBackingAppBundleId");
  }

  return v5;
}

- (void)setIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_index = a3;
}

- (BOOL)hasIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIndex
{
  -[USOSchemaUSOEntityIdentifierTier1 setIndex:](self, "setIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deleteValue
{
  -[USOSchemaUSOEntityIdentifierTier1 setValue:](self, "setValue:", 0);
}

- (BOOL)hasBackingAppBundleId
{
  return self->_backingAppBundleId != 0;
}

- (void)deleteBackingAppBundleId
{
  -[USOSchemaUSOEntityIdentifierTier1 setBackingAppBundleId:](self, "setBackingAppBundleId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEntityIdentifierTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[USOSchemaUSOEntityIdentifierTier1 value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[USOSchemaUSOEntityIdentifierTier1 backingAppBundleId](self, "backingAppBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int index;
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
    index = self->_index;
    if (index != objc_msgSend(v4, "index"))
      goto LABEL_15;
  }
  -[USOSchemaUSOEntityIdentifierTier1 value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[USOSchemaUSOEntityIdentifierTier1 value](self, "value");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[USOSchemaUSOEntityIdentifierTier1 value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[USOSchemaUSOEntityIdentifierTier1 backingAppBundleId](self, "backingAppBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingAppBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[USOSchemaUSOEntityIdentifierTier1 backingAppBundleId](self, "backingAppBundleId");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[USOSchemaUSOEntityIdentifierTier1 backingAppBundleId](self, "backingAppBundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backingAppBundleId");
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
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_index;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_value, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_backingAppBundleId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backingAppBundleId)
  {
    -[USOSchemaUSOEntityIdentifierTier1 backingAppBundleId](self, "backingAppBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("backingAppBundleId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOEntityIdentifierTier1 index](self, "index"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("index"));

  }
  if (self->_value)
  {
    -[USOSchemaUSOEntityIdentifierTier1 value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("value"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOEntityIdentifierTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOEntityIdentifierTier1)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOEntityIdentifierTier1 *v5;
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
    self = -[USOSchemaUSOEntityIdentifierTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOEntityIdentifierTier1)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOEntityIdentifierTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  USOSchemaUSOEntityIdentifierTier1 *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)USOSchemaUSOEntityIdentifierTier1;
  v5 = -[USOSchemaUSOEntityIdentifierTier1 init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntityIdentifierTier1 setIndex:](v5, "setIndex:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[USOSchemaUSOEntityIdentifierTier1 setValue:](v5, "setValue:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backingAppBundleId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[USOSchemaUSOEntityIdentifierTier1 setBackingAppBundleId:](v5, "setBackingAppBundleId:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (unsigned)index
{
  return self->_index;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)backingAppBundleId
{
  return self->_backingAppBundleId;
}

- (void)setBackingAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasValue:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasBackingAppBundleId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAppBundleId, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
