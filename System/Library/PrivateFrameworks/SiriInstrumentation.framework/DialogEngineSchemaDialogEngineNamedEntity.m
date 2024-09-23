@implementation DialogEngineSchemaDialogEngineNamedEntity

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setCatParameter:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_catParameter = a3;
}

- (BOOL)hasCatParameter
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCatParameter:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCatParameter
{
  -[DialogEngineSchemaDialogEngineNamedEntity setCatParameter:](self, "setCatParameter:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasCatParameterValue
{
  return self->_catParameterValue != 0;
}

- (void)deleteCatParameterValue
{
  -[DialogEngineSchemaDialogEngineNamedEntity setCatParameterValue:](self, "setCatParameterValue:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return DialogEngineSchemaDialogEngineNamedEntityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[DialogEngineSchemaDialogEngineNamedEntity catParameterValue](self, "catParameterValue");
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
  _BYTE *v4;
  int catParameter;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (catParameter = self->_catParameter, catParameter == objc_msgSend(v4, "catParameter")))
      {
        -[DialogEngineSchemaDialogEngineNamedEntity catParameterValue](self, "catParameterValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "catParameterValue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[DialogEngineSchemaDialogEngineNamedEntity catParameterValue](self, "catParameterValue");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[DialogEngineSchemaDialogEngineNamedEntity catParameterValue](self, "catParameterValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "catParameterValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_catParameter;
  else
    v2 = 0;
  return -[NSString hash](self->_catParameterValue, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[DialogEngineSchemaDialogEngineNamedEntity catParameter](self, "catParameter") - 1;
    if (v4 > 0x44)
      v5 = CFSTR("DIALOGENGINENAMEDENTITYPARAMETER__UNKNOWN");
    else
      v5 = *(&off_1E563DFD0 + v4);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("catParameter"));
  }
  if (self->_catParameterValue)
  {
    -[DialogEngineSchemaDialogEngineNamedEntity catParameterValue](self, "catParameterValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("catParameterValue"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DialogEngineSchemaDialogEngineNamedEntity dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DialogEngineSchemaDialogEngineNamedEntity)initWithJSON:(id)a3
{
  void *v4;
  DialogEngineSchemaDialogEngineNamedEntity *v5;
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
    self = -[DialogEngineSchemaDialogEngineNamedEntity initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DialogEngineSchemaDialogEngineNamedEntity)initWithDictionary:(id)a3
{
  id v4;
  DialogEngineSchemaDialogEngineNamedEntity *v5;
  void *v6;
  void *v7;
  void *v8;
  DialogEngineSchemaDialogEngineNamedEntity *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DialogEngineSchemaDialogEngineNamedEntity;
  v5 = -[DialogEngineSchemaDialogEngineNamedEntity init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catParameter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DialogEngineSchemaDialogEngineNamedEntity setCatParameter:](v5, "setCatParameter:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catParameterValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[DialogEngineSchemaDialogEngineNamedEntity setCatParameterValue:](v5, "setCatParameterValue:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (int)catParameter
{
  return self->_catParameter;
}

- (NSString)catParameterValue
{
  return self->_catParameterValue;
}

- (void)setCatParameterValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasCatParameterValue:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catParameterValue, 0);
}

@end
