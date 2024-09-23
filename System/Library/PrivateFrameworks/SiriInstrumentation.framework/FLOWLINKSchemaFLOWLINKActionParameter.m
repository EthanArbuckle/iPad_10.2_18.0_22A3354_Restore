@implementation FLOWLINKSchemaFLOWLINKActionParameter

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)deleteName
{
  -[FLOWLINKSchemaFLOWLINKActionParameter setName:](self, "setName:", 0);
}

- (void)setIsArray:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isArray = a3;
}

- (BOOL)hasIsArray
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsArray:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsArray
{
  -[FLOWLINKSchemaFLOWLINKActionParameter setIsArray:](self, "setIsArray:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteType
{
  -[FLOWLINKSchemaFLOWLINKActionParameter setType:](self, "setType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWLINKSchemaFLOWLINKActionParameterReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  id v7;

  v7 = a3;
  -[FLOWLINKSchemaFLOWLINKActionParameter name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $4539F306875B45855F1CA37ECBC062B6 has;
  unsigned int v14;
  int isArray;
  int v16;
  int type;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[FLOWLINKSchemaFLOWLINKActionParameter name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[FLOWLINKSchemaFLOWLINKActionParameter name](self, "name");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLOWLINKSchemaFLOWLINKActionParameter name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isArray = self->_isArray;
    if (isArray == objc_msgSend(v4, "isArray"))
    {
      has = self->_has;
      v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v16)
  {
    type = self->_type;
    if (type != objc_msgSend(v4, "type"))
      goto LABEL_16;
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_isArray;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWLINKSchemaFLOWLINKActionParameter isArray](self, "isArray"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isArray"));

  }
  if (self->_name)
  {
    -[FLOWLINKSchemaFLOWLINKActionParameter name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = -[FLOWLINKSchemaFLOWLINKActionParameter type](self, "type") - 1;
    if (v7 > 0x16)
      v8 = CFSTR("LINKPARAMETERTYPE_UNKNOWN");
    else
      v8 = off_1E562D638[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("type"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWLINKSchemaFLOWLINKActionParameter dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWLINKSchemaFLOWLINKActionParameter)initWithJSON:(id)a3
{
  void *v4;
  FLOWLINKSchemaFLOWLINKActionParameter *v5;
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
    self = -[FLOWLINKSchemaFLOWLINKActionParameter initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWLINKSchemaFLOWLINKActionParameter)initWithDictionary:(id)a3
{
  id v4;
  FLOWLINKSchemaFLOWLINKActionParameter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FLOWLINKSchemaFLOWLINKActionParameter *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWLINKSchemaFLOWLINKActionParameter;
  v5 = -[FLOWLINKSchemaFLOWLINKActionParameter init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[FLOWLINKSchemaFLOWLINKActionParameter setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isArray"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWLINKSchemaFLOWLINKActionParameter setIsArray:](v5, "setIsArray:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWLINKSchemaFLOWLINKActionParameter setType:](v5, "setType:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isArray
{
  return self->_isArray;
}

- (int)type
{
  return self->_type;
}

- (void)setHasName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
