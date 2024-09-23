@implementation POMMESSchemaPOMMESPegasusKitNetworkTimingData

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setRequestStartOffsetInMS:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestStartOffsetInMS = a3;
}

- (BOOL)hasRequestStartOffsetInMS
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRequestStartOffsetInMS:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRequestStartOffsetInMS
{
  -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setRequestStartOffsetInMS:](self, "setRequestStartOffsetInMS:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRequestEndOffsetInMS:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestEndOffsetInMS = a3;
}

- (BOOL)hasRequestEndOffsetInMS
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRequestEndOffsetInMS:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRequestEndOffsetInMS
{
  -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setRequestEndOffsetInMS:](self, "setRequestEndOffsetInMS:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setResponseStartOffsetInMS:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_responseStartOffsetInMS = a3;
}

- (BOOL)hasResponseStartOffsetInMS
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasResponseStartOffsetInMS:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteResponseStartOffsetInMS
{
  -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setResponseStartOffsetInMS:](self, "setResponseStartOffsetInMS:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setResponseEndOffsetInMS:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_responseEndOffsetInMS = a3;
}

- (BOOL)hasResponseEndOffsetInMS
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasResponseEndOffsetInMS:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteResponseEndOffsetInMS
{
  -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setResponseEndOffsetInMS:](self, "setResponseEndOffsetInMS:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusKitNetworkTimingDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $9ED1BCA1EB36767268E4C472EAAF6F41 has;
  unsigned int v6;
  unsigned int requestStartOffsetInMS;
  int v8;
  unsigned int requestEndOffsetInMS;
  int v10;
  unsigned int responseStartOffsetInMS;
  int v12;
  unsigned int responseEndOffsetInMS;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    requestStartOffsetInMS = self->_requestStartOffsetInMS;
    if (requestStartOffsetInMS != objc_msgSend(v4, "requestStartOffsetInMS"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    requestEndOffsetInMS = self->_requestEndOffsetInMS;
    if (requestEndOffsetInMS != objc_msgSend(v4, "requestEndOffsetInMS"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    responseStartOffsetInMS = self->_responseStartOffsetInMS;
    if (responseStartOffsetInMS == objc_msgSend(v4, "responseStartOffsetInMS"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    responseEndOffsetInMS = self->_responseEndOffsetInMS;
    if (responseEndOffsetInMS != objc_msgSend(v4, "responseEndOffsetInMS"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_requestStartOffsetInMS;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_requestEndOffsetInMS;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_responseStartOffsetInMS;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_responseEndOffsetInMS;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitNetworkTimingData requestEndOffsetInMS](self, "requestEndOffsetInMS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("requestEndOffsetInMS"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitNetworkTimingData responseEndOffsetInMS](self, "responseEndOffsetInMS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("responseEndOffsetInMS"));

      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitNetworkTimingData requestStartOffsetInMS](self, "requestStartOffsetInMS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requestStartOffsetInMS"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitNetworkTimingData responseStartOffsetInMS](self, "responseStartOffsetInMS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("responseStartOffsetInMS"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESPegasusKitNetworkTimingData dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESPegasusKitNetworkTimingData)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESPegasusKitNetworkTimingData *v5;
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
    self = -[POMMESSchemaPOMMESPegasusKitNetworkTimingData initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESPegasusKitNetworkTimingData)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESPegasusKitNetworkTimingData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  POMMESSchemaPOMMESPegasusKitNetworkTimingData *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESPegasusKitNetworkTimingData;
  v5 = -[POMMESSchemaPOMMESPegasusKitNetworkTimingData init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStartOffsetInMS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setRequestStartOffsetInMS:](v5, "setRequestStartOffsetInMS:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestEndOffsetInMS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setRequestEndOffsetInMS:](v5, "setRequestEndOffsetInMS:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseStartOffsetInMS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setResponseStartOffsetInMS:](v5, "setResponseStartOffsetInMS:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseEndOffsetInMS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusKitNetworkTimingData setResponseEndOffsetInMS:](v5, "setResponseEndOffsetInMS:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (unsigned)requestStartOffsetInMS
{
  return self->_requestStartOffsetInMS;
}

- (unsigned)requestEndOffsetInMS
{
  return self->_requestEndOffsetInMS;
}

- (unsigned)responseStartOffsetInMS
{
  return self->_responseStartOffsetInMS;
}

- (unsigned)responseEndOffsetInMS
{
  return self->_responseEndOffsetInMS;
}

@end
