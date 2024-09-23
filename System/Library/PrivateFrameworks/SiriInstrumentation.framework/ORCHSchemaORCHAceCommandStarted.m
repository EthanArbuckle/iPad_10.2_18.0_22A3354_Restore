@implementation ORCHSchemaORCHAceCommandStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasAceCommandName
{
  return self->_aceCommandName != 0;
}

- (void)deleteAceCommandName
{
  -[ORCHSchemaORCHAceCommandStarted setAceCommandName:](self, "setAceCommandName:", 0);
}

- (void)setAceCommandType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_aceCommandType = a3;
}

- (BOOL)hasAceCommandType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAceCommandType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAceCommandType
{
  -[ORCHSchemaORCHAceCommandStarted setAceCommandType:](self, "setAceCommandType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHAceCommandStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ORCHSchemaORCHAceCommandStarted aceCommandName](self, "aceCommandName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int aceCommandType;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[ORCHSchemaORCHAceCommandStarted aceCommandName](self, "aceCommandName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceCommandName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[ORCHSchemaORCHAceCommandStarted aceCommandName](self, "aceCommandName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ORCHSchemaORCHAceCommandStarted aceCommandName](self, "aceCommandName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceCommandName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[20] & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    aceCommandType = self->_aceCommandType;
    if (aceCommandType != objc_msgSend(v4, "aceCommandType"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_aceCommandName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_aceCommandType;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aceCommandName)
  {
    -[ORCHSchemaORCHAceCommandStarted aceCommandName](self, "aceCommandName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aceCommandName"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = -[ORCHSchemaORCHAceCommandStarted aceCommandType](self, "aceCommandType") - 1;
    if (v6 > 4)
      v7 = CFSTR("ORCHACECOMMANDTYPE_UNKNOWN");
    else
      v7 = off_1E5639918[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("aceCommandType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHAceCommandStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHAceCommandStarted)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHAceCommandStarted *v5;
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
    self = -[ORCHSchemaORCHAceCommandStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHAceCommandStarted)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHAceCommandStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  ORCHSchemaORCHAceCommandStarted *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHAceCommandStarted;
  v5 = -[ORCHSchemaORCHAceCommandStarted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceCommandName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[ORCHSchemaORCHAceCommandStarted setAceCommandName:](v5, "setAceCommandName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceCommandType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHAceCommandStarted setAceCommandType:](v5, "setAceCommandType:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)aceCommandName
{
  return self->_aceCommandName;
}

- (void)setAceCommandName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)aceCommandType
{
  return self->_aceCommandType;
}

- (void)setHasAceCommandName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceCommandName, 0);
}

@end
