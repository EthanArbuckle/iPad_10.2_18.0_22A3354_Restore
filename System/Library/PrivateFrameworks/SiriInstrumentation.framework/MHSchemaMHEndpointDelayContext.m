@implementation MHSchemaMHEndpointDelayContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSpeakingStartInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_speakingStartInNs = a3;
}

- (BOOL)hasSpeakingStartInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSpeakingStartInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSpeakingStartInNs
{
  -[MHSchemaMHEndpointDelayContext setSpeakingStartInNs:](self, "setSpeakingStartInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSpeakingEndInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_speakingEndInNs = a3;
}

- (BOOL)hasSpeakingEndInNs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSpeakingEndInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSpeakingEndInNs
{
  -[MHSchemaMHEndpointDelayContext setSpeakingEndInNs:](self, "setSpeakingEndInNs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setEndpointDelayInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endpointDelayInNs = a3;
}

- (BOOL)hasEndpointDelayInNs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEndpointDelayInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteEndpointDelayInNs
{
  -[MHSchemaMHEndpointDelayContext setEndpointDelayInNs:](self, "setEndpointDelayInNs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setEndpointModelDelayInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_endpointModelDelayInNs = a3;
}

- (BOOL)hasEndpointModelDelayInNs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasEndpointModelDelayInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteEndpointModelDelayInNs
{
  -[MHSchemaMHEndpointDelayContext setEndpointModelDelayInNs:](self, "setEndpointModelDelayInNs:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setEndpointDelayInNsV2:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_endpointDelayInNsV2 = a3;
}

- (BOOL)hasEndpointDelayInNsV2
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasEndpointDelayInNsV2:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteEndpointDelayInNsV2
{
  -[MHSchemaMHEndpointDelayContext setEndpointDelayInNsV2:](self, "setEndpointDelayInNsV2:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHEndpointDelayContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteUint64Field();
LABEL_7:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $DD0EB3E906129A967B32EE5C102E6DFE has;
  unsigned int v6;
  unint64_t speakingStartInNs;
  int v8;
  unint64_t speakingEndInNs;
  int v10;
  unint64_t endpointDelayInNs;
  int v12;
  unint64_t endpointModelDelayInNs;
  int v14;
  unint64_t endpointDelayInNsV2;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    speakingStartInNs = self->_speakingStartInNs;
    if (speakingStartInNs != objc_msgSend(v4, "speakingStartInNs"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[48];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_22;
  if (v8)
  {
    speakingEndInNs = self->_speakingEndInNs;
    if (speakingEndInNs != objc_msgSend(v4, "speakingEndInNs"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[48];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_22;
  if (v10)
  {
    endpointDelayInNs = self->_endpointDelayInNs;
    if (endpointDelayInNs != objc_msgSend(v4, "endpointDelayInNs"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[48];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_22;
  if (v12)
  {
    endpointModelDelayInNs = self->_endpointModelDelayInNs;
    if (endpointModelDelayInNs == objc_msgSend(v4, "endpointModelDelayInNs"))
    {
      has = self->_has;
      v6 = v4[48];
      goto LABEL_18;
    }
LABEL_22:
    v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_22;
  if (v14)
  {
    endpointDelayInNsV2 = self->_endpointDelayInNsV2;
    if (endpointDelayInNsV2 != objc_msgSend(v4, "endpointDelayInNsV2"))
      goto LABEL_22;
  }
  v16 = 1;
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_speakingStartInNs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_speakingEndInNs;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
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
    v4 = 2654435761u * self->_endpointDelayInNs;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761u * self->_endpointModelDelayInNs;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761u * self->_endpointDelayInNsV2;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDelayContext endpointDelayInNs](self, "endpointDelayInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("endpointDelayInNs"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDelayContext endpointDelayInNsV2](self, "endpointDelayInNsV2"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("endpointDelayInNsV2"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDelayContext speakingEndInNs](self, "speakingEndInNs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("speakingEndInNs"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDelayContext endpointModelDelayInNs](self, "endpointModelDelayInNs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("endpointModelDelayInNs"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointDelayContext speakingStartInNs](self, "speakingStartInNs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("speakingStartInNs"));

  }
LABEL_7:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHEndpointDelayContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHEndpointDelayContext)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHEndpointDelayContext *v5;
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
    self = -[MHSchemaMHEndpointDelayContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHEndpointDelayContext)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHEndpointDelayContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MHSchemaMHEndpointDelayContext *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHEndpointDelayContext;
  v5 = -[MHSchemaMHEndpointDelayContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speakingStartInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDelayContext setSpeakingStartInNs:](v5, "setSpeakingStartInNs:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speakingEndInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDelayContext setSpeakingEndInNs:](v5, "setSpeakingEndInNs:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointDelayInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDelayContext setEndpointDelayInNs:](v5, "setEndpointDelayInNs:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointModelDelayInNs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDelayContext setEndpointModelDelayInNs:](v5, "setEndpointModelDelayInNs:", objc_msgSend(v9, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointDelayInNsV2"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointDelayContext setEndpointDelayInNsV2:](v5, "setEndpointDelayInNsV2:", objc_msgSend(v10, "unsignedLongLongValue"));
    v11 = v5;

  }
  return v5;
}

- (unint64_t)speakingStartInNs
{
  return self->_speakingStartInNs;
}

- (unint64_t)speakingEndInNs
{
  return self->_speakingEndInNs;
}

- (unint64_t)endpointDelayInNs
{
  return self->_endpointDelayInNs;
}

- (unint64_t)endpointModelDelayInNs
{
  return self->_endpointModelDelayInNs;
}

- (unint64_t)endpointDelayInNsV2
{
  return self->_endpointDelayInNsV2;
}

@end
