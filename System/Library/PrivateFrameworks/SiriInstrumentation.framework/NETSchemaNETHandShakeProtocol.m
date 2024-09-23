@implementation NETSchemaNETHandShakeProtocol

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setProtocol:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_protocol = a3;
}

- (BOOL)hasProtocol
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasProtocol:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteProtocol
{
  -[NETSchemaNETHandShakeProtocol setProtocol:](self, "setProtocol:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setHandShakeRTT:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_handShakeRTT = a3;
}

- (BOOL)hasHandShakeRTT
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHandShakeRTT:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteHandShakeRTT
{
  -[NETSchemaNETHandShakeProtocol setHandShakeRTT:](self, "setHandShakeRTT:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setHandShakeDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_handShakeDuration = a3;
}

- (BOOL)hasHandShakeDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHandShakeDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteHandShakeDuration
{
  -[NETSchemaNETHandShakeProtocol setHandShakeDuration:](self, "setHandShakeDuration:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETHandShakeProtocolReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $78787799258D2756E54B70DAF3B41936 has;
  unsigned int v6;
  int protocol;
  int v8;
  unsigned int handShakeRTT;
  int v10;
  unint64_t handShakeDuration;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    protocol = self->_protocol;
    if (protocol != objc_msgSend(v4, "protocol"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    handShakeRTT = self->_handShakeRTT;
    if (handShakeRTT == objc_msgSend(v4, "handShakeRTT"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    handShakeDuration = self->_handShakeDuration;
    if (handShakeDuration != objc_msgSend(v4, "handShakeDuration"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_protocol;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_handShakeRTT;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761u * self->_handShakeDuration;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETHandShakeProtocol handShakeRTT](self, "handShakeRTT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("handShakeRTT"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_11;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETHandShakeProtocol handShakeDuration](self, "handShakeDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("handShakeDuration"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_6;
LABEL_3:
  if ((has & 1) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = -[NETSchemaNETHandShakeProtocol protocol](self, "protocol") - 1;
  if (v7 > 2)
    v8 = CFSTR("NETPROTOCOL_UNKNOWN");
  else
    v8 = off_1E5631730[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("protocol"));
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETHandShakeProtocol dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETHandShakeProtocol)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETHandShakeProtocol *v5;
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
    self = -[NETSchemaNETHandShakeProtocol initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETHandShakeProtocol)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETHandShakeProtocol *v5;
  void *v6;
  void *v7;
  void *v8;
  NETSchemaNETHandShakeProtocol *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NETSchemaNETHandShakeProtocol;
  v5 = -[NETSchemaNETHandShakeProtocol init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protocol"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETHandShakeProtocol setProtocol:](v5, "setProtocol:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handShakeRTT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETHandShakeProtocol setHandShakeRTT:](v5, "setHandShakeRTT:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handShakeDuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETHandShakeProtocol setHandShakeDuration:](v5, "setHandShakeDuration:", objc_msgSend(v8, "unsignedLongLongValue"));
    v9 = v5;

  }
  return v5;
}

- (int)protocol
{
  return self->_protocol;
}

- (unsigned)handShakeRTT
{
  return self->_handShakeRTT;
}

- (unint64_t)handShakeDuration
{
  return self->_handShakeDuration;
}

@end
