@implementation RFSchemaRFComponentShown

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setComponent:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_component = a3;
}

- (BOOL)hasComponent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasComponent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteComponent
{
  -[RFSchemaRFComponentShown setComponent:](self, "setComponent:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasComponentName
{
  return self->_componentName != 0;
}

- (void)deleteComponentName
{
  -[RFSchemaRFComponentShown setComponentName:](self, "setComponentName:", 0);
}

- (BOOL)hasComponentIndex
{
  return self->_componentIndex != 0;
}

- (void)deleteComponentIndex
{
  -[RFSchemaRFComponentShown setComponentIndex:](self, "setComponentIndex:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFComponentShownReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[RFSchemaRFComponentShown componentName](self, "componentName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[RFSchemaRFComponentShown componentIndex](self, "componentIndex");
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
  int component;
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
    component = self->_component;
    if (component != objc_msgSend(v4, "component"))
      goto LABEL_15;
  }
  -[RFSchemaRFComponentShown componentName](self, "componentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[RFSchemaRFComponentShown componentName](self, "componentName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RFSchemaRFComponentShown componentName](self, "componentName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[RFSchemaRFComponentShown componentIndex](self, "componentIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RFSchemaRFComponentShown componentIndex](self, "componentIndex");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[RFSchemaRFComponentShown componentIndex](self, "componentIndex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentIndex");
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
    v3 = 2654435761 * self->_component;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_componentName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_componentIndex, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[RFSchemaRFComponentShown component](self, "component") - 1;
    if (v4 > 0x43)
      v5 = CFSTR("RFCOMPONENT_UNKNOWN");
    else
      v5 = off_1E5633160[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("component"));
  }
  if (self->_componentIndex)
  {
    -[RFSchemaRFComponentShown componentIndex](self, "componentIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("componentIndex"));

  }
  if (self->_componentName)
  {
    -[RFSchemaRFComponentShown componentName](self, "componentName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("componentName"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RFSchemaRFComponentShown dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RFSchemaRFComponentShown)initWithJSON:(id)a3
{
  void *v4;
  RFSchemaRFComponentShown *v5;
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
    self = -[RFSchemaRFComponentShown initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RFSchemaRFComponentShown)initWithDictionary:(id)a3
{
  id v4;
  RFSchemaRFComponentShown *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RFSchemaRFComponentShown *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RFSchemaRFComponentShown;
  v5 = -[RFSchemaRFComponentShown init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("component"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RFSchemaRFComponentShown setComponent:](v5, "setComponent:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("componentName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[RFSchemaRFComponentShown setComponentName:](v5, "setComponentName:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("componentIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[RFSchemaRFComponentShown setComponentIndex:](v5, "setComponentIndex:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (int)component
{
  return self->_component;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)componentIndex
{
  return self->_componentIndex;
}

- (void)setComponentIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasComponentName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasComponentIndex:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentIndex, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
}

@end
