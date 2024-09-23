@implementation ACTVSchemaACTVButtonInteractionDetected

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setButtonInteractionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_buttonInteractionType = a3;
}

- (BOOL)hasButtonInteractionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasButtonInteractionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteButtonInteractionType
{
  -[ACTVSchemaACTVButtonInteractionDetected setButtonInteractionType:](self, "setButtonInteractionType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasButtonName
{
  return self->_buttonName != 0;
}

- (void)deleteButtonName
{
  -[ACTVSchemaACTVButtonInteractionDetected setButtonName:](self, "setButtonName:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ACTVSchemaACTVButtonInteractionDetectedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[ACTVSchemaACTVButtonInteractionDetected buttonName](self, "buttonName");
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
  int buttonInteractionType;
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
        || (buttonInteractionType = self->_buttonInteractionType,
            buttonInteractionType == objc_msgSend(v4, "buttonInteractionType")))
      {
        -[ACTVSchemaACTVButtonInteractionDetected buttonName](self, "buttonName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "buttonName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[ACTVSchemaACTVButtonInteractionDetected buttonName](self, "buttonName");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[ACTVSchemaACTVButtonInteractionDetected buttonName](self, "buttonName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "buttonName");
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
    v2 = 2654435761 * self->_buttonInteractionType;
  else
    v2 = 0;
  return -[NSString hash](self->_buttonName, "hash") ^ v2;
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
    v4 = -[ACTVSchemaACTVButtonInteractionDetected buttonInteractionType](self, "buttonInteractionType") - 1;
    if (v4 > 2)
      v5 = CFSTR("BUTTONINTERACTIONTYPE_UNKNOWN");
    else
      v5 = off_1E5639940[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("buttonInteractionType"));
  }
  if (self->_buttonName)
  {
    -[ACTVSchemaACTVButtonInteractionDetected buttonName](self, "buttonName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("buttonName"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ACTVSchemaACTVButtonInteractionDetected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ACTVSchemaACTVButtonInteractionDetected)initWithJSON:(id)a3
{
  void *v4;
  ACTVSchemaACTVButtonInteractionDetected *v5;
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
    self = -[ACTVSchemaACTVButtonInteractionDetected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ACTVSchemaACTVButtonInteractionDetected)initWithDictionary:(id)a3
{
  id v4;
  ACTVSchemaACTVButtonInteractionDetected *v5;
  void *v6;
  void *v7;
  void *v8;
  ACTVSchemaACTVButtonInteractionDetected *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACTVSchemaACTVButtonInteractionDetected;
  v5 = -[ACTVSchemaACTVButtonInteractionDetected init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonInteractionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ACTVSchemaACTVButtonInteractionDetected setButtonInteractionType:](v5, "setButtonInteractionType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[ACTVSchemaACTVButtonInteractionDetected setButtonName:](v5, "setButtonName:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (int)buttonInteractionType
{
  return self->_buttonInteractionType;
}

- (NSString)buttonName
{
  return self->_buttonName;
}

- (void)setButtonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasButtonName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonName, 0);
}

@end
