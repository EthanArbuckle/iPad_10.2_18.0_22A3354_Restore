@implementation NETSchemaNETPathInterface

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteType
{
  -[NETSchemaNETPathInterface setType:](self, "setType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)deleteName
{
  -[NETSchemaNETPathInterface setName:](self, "setName:", 0);
}

- (void)setIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_index = a3;
}

- (BOOL)hasIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIndex
{
  -[NETSchemaNETPathInterface setIndex:](self, "setIndex:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETPathInterfaceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[NETSchemaNETPathInterface name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int type;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  unsigned int index;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[28] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type != objc_msgSend(v4, "type"))
      goto LABEL_15;
  }
  -[NETSchemaNETPathInterface name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[NETSchemaNETPathInterface name](self, "name");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[NETSchemaNETPathInterface name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  else
  {

  }
  v14 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1))
    goto LABEL_15;
  if (v14)
  {
    index = self->_index;
    if (index != objc_msgSend(v4, "index"))
      goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_index;
  else
    v5 = 0;
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETPathInterface index](self, "index"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("index"));

  }
  if (self->_name)
  {
    -[NETSchemaNETPathInterface name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[NETSchemaNETPathInterface type](self, "type") - 1;
    if (v7 > 3)
      v8 = CFSTR("NETPATHTYPE_UNKNOWN");
    else
      v8 = off_1E5631800[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("type"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETPathInterface dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETPathInterface)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETPathInterface *v5;
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
    self = -[NETSchemaNETPathInterface initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETPathInterface)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETPathInterface *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NETSchemaNETPathInterface *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NETSchemaNETPathInterface;
  v5 = -[NETSchemaNETPathInterface init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETPathInterface setType:](v5, "setType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[NETSchemaNETPathInterface setName:](v5, "setName:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETPathInterface setIndex:](v5, "setIndex:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (int)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)index
{
  return self->_index;
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
