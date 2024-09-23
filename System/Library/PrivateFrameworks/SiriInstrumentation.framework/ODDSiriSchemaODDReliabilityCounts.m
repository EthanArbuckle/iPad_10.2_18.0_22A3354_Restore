@implementation ODDSiriSchemaODDReliabilityCounts

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setReliabilityRequestCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reliabilityRequestCount = a3;
}

- (BOOL)hasReliabilityRequestCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReliabilityRequestCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteReliabilityRequestCount
{
  -[ODDSiriSchemaODDReliabilityCounts setReliabilityRequestCount:](self, "setReliabilityRequestCount:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setReliabilityTurnCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reliabilityTurnCount = a3;
}

- (BOOL)hasReliabilityTurnCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasReliabilityTurnCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteReliabilityTurnCount
{
  -[ODDSiriSchemaODDReliabilityCounts setReliabilityTurnCount:](self, "setReliabilityTurnCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setClientErrorCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_clientErrorCount = a3;
}

- (BOOL)hasClientErrorCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasClientErrorCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteClientErrorCount
{
  -[ODDSiriSchemaODDReliabilityCounts setClientErrorCount:](self, "setClientErrorCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setUndesiredResponseCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_undesiredResponseCount = a3;
}

- (BOOL)hasUndesiredResponseCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasUndesiredResponseCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteUndesiredResponseCount
{
  -[ODDSiriSchemaODDReliabilityCounts setUndesiredResponseCount:](self, "setUndesiredResponseCount:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setFatalResponseCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_fatalResponseCount = a3;
}

- (BOOL)hasFatalResponseCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasFatalResponseCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteFatalResponseCount
{
  -[ODDSiriSchemaODDReliabilityCounts setFatalResponseCount:](self, "setFatalResponseCount:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setFailureResponseCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_failureResponseCount = a3;
}

- (BOOL)hasFailureResponseCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasFailureResponseCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteFailureResponseCount
{
  -[ODDSiriSchemaODDReliabilityCounts setFailureResponseCount:](self, "setFailureResponseCount:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setSiriUnavailableResponseCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_siriUnavailableResponseCount = a3;
}

- (BOOL)hasSiriUnavailableResponseCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasSiriUnavailableResponseCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteSiriUnavailableResponseCount
{
  -[ODDSiriSchemaODDReliabilityCounts setSiriUnavailableResponseCount:](self, "setSiriUnavailableResponseCount:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDReliabilityCountsReadFrom(self, (uint64_t)a3);
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
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field();
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $EAE7B07C6F5D12679B0F4499A534C794 has;
  unsigned int v6;
  unsigned int reliabilityRequestCount;
  int v8;
  unsigned int reliabilityTurnCount;
  int v10;
  unsigned int clientErrorCount;
  int v12;
  unsigned int undesiredResponseCount;
  int v14;
  unsigned int fatalResponseCount;
  int v16;
  unsigned int failureResponseCount;
  int v18;
  unsigned int siriUnavailableResponseCount;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  has = self->_has;
  v6 = v4[36];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    reliabilityRequestCount = self->_reliabilityRequestCount;
    if (reliabilityRequestCount != objc_msgSend(v4, "reliabilityRequestCount"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[36];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_30;
  if (v8)
  {
    reliabilityTurnCount = self->_reliabilityTurnCount;
    if (reliabilityTurnCount != objc_msgSend(v4, "reliabilityTurnCount"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[36];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_30;
  if (v10)
  {
    clientErrorCount = self->_clientErrorCount;
    if (clientErrorCount != objc_msgSend(v4, "clientErrorCount"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[36];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_30;
  if (v12)
  {
    undesiredResponseCount = self->_undesiredResponseCount;
    if (undesiredResponseCount != objc_msgSend(v4, "undesiredResponseCount"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[36];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_30;
  if (v14)
  {
    fatalResponseCount = self->_fatalResponseCount;
    if (fatalResponseCount != objc_msgSend(v4, "fatalResponseCount"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[36];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_30;
  if (v16)
  {
    failureResponseCount = self->_failureResponseCount;
    if (failureResponseCount == objc_msgSend(v4, "failureResponseCount"))
    {
      has = self->_has;
      v6 = v4[36];
      goto LABEL_26;
    }
LABEL_30:
    v20 = 0;
    goto LABEL_31;
  }
LABEL_26:
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_30;
  if (v18)
  {
    siriUnavailableResponseCount = self->_siriUnavailableResponseCount;
    if (siriUnavailableResponseCount != objc_msgSend(v4, "siriUnavailableResponseCount"))
      goto LABEL_30;
  }
  v20 = 1;
LABEL_31:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_reliabilityRequestCount;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_reliabilityTurnCount;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_clientErrorCount;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_undesiredResponseCount;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_fatalResponseCount;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_failureResponseCount;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_siriUnavailableResponseCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts clientErrorCount](self, "clientErrorCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("clientErrorCount"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts failureResponseCount](self, "failureResponseCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("failureResponseCount"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts fatalResponseCount](self, "fatalResponseCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("fatalResponseCount"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts reliabilityRequestCount](self, "reliabilityRequestCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("reliabilityRequestCount"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts siriUnavailableResponseCount](self, "siriUnavailableResponseCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("siriUnavailableResponseCount"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts reliabilityTurnCount](self, "reliabilityTurnCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("reliabilityTurnCount"));

  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts undesiredResponseCount](self, "undesiredResponseCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("undesiredResponseCount"));

  }
LABEL_9:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDReliabilityCounts dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDReliabilityCounts)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDReliabilityCounts *v5;
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
    self = -[ODDSiriSchemaODDReliabilityCounts initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDReliabilityCounts)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDReliabilityCounts *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ODDSiriSchemaODDReliabilityCounts *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODDSiriSchemaODDReliabilityCounts;
  v5 = -[ODDSiriSchemaODDReliabilityCounts init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reliabilityRequestCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDReliabilityCounts setReliabilityRequestCount:](v5, "setReliabilityRequestCount:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reliabilityTurnCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDReliabilityCounts setReliabilityTurnCount:](v5, "setReliabilityTurnCount:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientErrorCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDReliabilityCounts setClientErrorCount:](v5, "setClientErrorCount:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("undesiredResponseCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDReliabilityCounts setUndesiredResponseCount:](v5, "setUndesiredResponseCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fatalResponseCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDReliabilityCounts setFatalResponseCount:](v5, "setFatalResponseCount:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureResponseCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDReliabilityCounts setFailureResponseCount:](v5, "setFailureResponseCount:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriUnavailableResponseCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDReliabilityCounts setSiriUnavailableResponseCount:](v5, "setSiriUnavailableResponseCount:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = v5;

  }
  return v5;
}

- (unsigned)reliabilityRequestCount
{
  return self->_reliabilityRequestCount;
}

- (unsigned)reliabilityTurnCount
{
  return self->_reliabilityTurnCount;
}

- (unsigned)clientErrorCount
{
  return self->_clientErrorCount;
}

- (unsigned)undesiredResponseCount
{
  return self->_undesiredResponseCount;
}

- (unsigned)fatalResponseCount
{
  return self->_fatalResponseCount;
}

- (unsigned)failureResponseCount
{
  return self->_failureResponseCount;
}

- (unsigned)siriUnavailableResponseCount
{
  return self->_siriUnavailableResponseCount;
}

@end
