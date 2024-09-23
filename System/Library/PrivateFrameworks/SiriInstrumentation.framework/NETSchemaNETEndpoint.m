@implementation NETSchemaNETEndpoint

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
  -[NETSchemaNETEndpoint setType:](self, "setType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPort:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_port = a3;
}

- (BOOL)hasPort
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPort:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePort
{
  -[NETSchemaNETEndpoint setPort:](self, "setPort:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETEndpointReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $5FEE3883993E78DC7B4520D512A656A2 has;
  unsigned int v6;
  int type;
  int v8;
  unsigned int port;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    type = self->_type;
    if (type != objc_msgSend(v4, "type"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    port = self->_port;
    if (port != objc_msgSend(v4, "port"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_port;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETEndpoint port](self, "port"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("port"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = -[NETSchemaNETEndpoint type](self, "type") - 1;
    if (v6 > 4)
      v7 = CFSTR("NETENDPOINTTYPE_UNKNOWN");
    else
      v7 = off_1E5631708[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("type"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETEndpoint dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETEndpoint)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETEndpoint *v5;
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
    self = -[NETSchemaNETEndpoint initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETEndpoint)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETEndpoint *v5;
  void *v6;
  void *v7;
  NETSchemaNETEndpoint *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NETSchemaNETEndpoint;
  v5 = -[NETSchemaNETEndpoint init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETEndpoint setType:](v5, "setType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("port"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETEndpoint setPort:](v5, "setPort:", objc_msgSend(v7, "unsignedIntValue"));
    v8 = v5;

  }
  return v5;
}

- (int)type
{
  return self->_type;
}

- (unsigned)port
{
  return self->_port;
}

@end
