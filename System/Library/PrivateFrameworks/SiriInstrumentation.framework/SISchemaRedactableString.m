@implementation SISchemaRedactableString

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setRedactionState:(int)a3
{
  NSString *value;

  value = self->_value;
  self->_value = 0;

  self->_which_String = 1;
  self->_redactionState = a3;
}

- (int)redactionState
{
  if (self->_which_String == 1)
    return self->_redactionState;
  else
    return 0;
}

- (void)deleteRedactionState
{
  if (self->_which_String == 1)
  {
    self->_which_String = 0;
    self->_redactionState = 0;
  }
}

- (void)setValue:(id)a3
{
  NSString *v4;
  NSString *value;
  id v6;

  self->_redactionState = 0;
  self->_which_String = 2 * (a3 != 0);
  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  value = self->_value;
  self->_value = v4;

}

- (NSString)value
{
  if (self->_which_String == 2)
    return self->_value;
  else
    return (NSString *)0;
}

- (void)deleteValue
{
  NSString *value;

  if (self->_which_String == 2)
  {
    self->_which_String = 0;
    value = self->_value;
    self->_value = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaRedactableStringReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self->_which_String == 1)
    PBDataWriterWriteInt32Field();
  -[SISchemaRedactableString value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t which_String;
  int redactionState;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    which_String = self->_which_String;
    if (which_String == objc_msgSend(v4, "which_String"))
    {
      redactionState = self->_redactionState;
      if (redactionState == objc_msgSend(v4, "redactionState"))
      {
        -[SISchemaRedactableString value](self, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[SISchemaRedactableString value](self, "value");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_12:
            v15 = 1;
            goto LABEL_10;
          }
          v11 = (void *)v10;
          -[SISchemaRedactableString value](self, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_12;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v2;

  if (self->_which_String == 1)
    v2 = 2654435761 * self->_redactionState;
  else
    v2 = 0;
  return -[NSString hash](self->_value, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_which_String == 1)
  {
    -[SISchemaRedactableString redactionState](self, "redactionState");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("REDACTED"), CFSTR("redactionState"));
  }
  if (self->_value)
  {
    -[SISchemaRedactableString value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("value"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaRedactableString dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaRedactableString)initWithJSON:(id)a3
{
  void *v4;
  SISchemaRedactableString *v5;
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
    self = -[SISchemaRedactableString initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaRedactableString)initWithDictionary:(id)a3
{
  id v4;
  SISchemaRedactableString *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaRedactableString *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaRedactableString;
  v5 = -[SISchemaRedactableString init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redactionState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaRedactableString setRedactionState:](v5, "setRedactionState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[SISchemaRedactableString setValue:](v5, "setValue:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (unint64_t)which_String
{
  return self->_which_String;
}

- (BOOL)hasRedactionState
{
  return self->_hasRedactionState;
}

- (void)setHasRedactionState:(BOOL)a3
{
  self->_hasRedactionState = a3;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
