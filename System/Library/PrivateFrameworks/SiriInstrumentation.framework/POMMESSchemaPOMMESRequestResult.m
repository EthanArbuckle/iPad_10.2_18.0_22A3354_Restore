@implementation POMMESSchemaPOMMESRequestResult

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setPommesConfidenceScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pommesConfidenceScore = a3;
}

- (BOOL)hasPommesConfidenceScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPommesConfidenceScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePommesConfidenceScore
{
  -[POMMESSchemaPOMMESRequestResult setPommesConfidenceScore:](self, "setPommesConfidenceScore:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasPegasusDomain
{
  return self->_pegasusDomain != 0;
}

- (void)deletePegasusDomain
{
  -[POMMESSchemaPOMMESRequestResult setPegasusDomain:](self, "setPegasusDomain:", 0);
}

- (void)setIsFromResponseCache:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isFromResponseCache = a3;
}

- (BOOL)hasIsFromResponseCache
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsFromResponseCache:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsFromResponseCache
{
  -[POMMESSchemaPOMMESRequestResult setIsFromResponseCache:](self, "setIsFromResponseCache:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPegasusPromptType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_pegasusPromptType = a3;
}

- (BOOL)hasPegasusPromptType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPegasusPromptType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePegasusPromptType
{
  -[POMMESSchemaPOMMESRequestResult setPegasusPromptType:](self, "setPegasusPromptType:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESRequestResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  -[POMMESSchemaPOMMESRequestResult pegasusDomain](self, "pegasusDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  double pommesConfidenceScore;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  $F2B6F6E2BBD17427E8464E42FB80F983 has;
  int v16;
  unsigned int v17;
  int isFromResponseCache;
  int v19;
  int pegasusPromptType;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    pommesConfidenceScore = self->_pommesConfidenceScore;
    objc_msgSend(v4, "pommesConfidenceScore");
    if (pommesConfidenceScore != v6)
      goto LABEL_19;
  }
  -[POMMESSchemaPOMMESRequestResult pegasusDomain](self, "pegasusDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 == 0) == (v8 != 0))
  {

    goto LABEL_19;
  }
  -[POMMESSchemaPOMMESRequestResult pegasusDomain](self, "pegasusDomain");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[POMMESSchemaPOMMESRequestResult pegasusDomain](self, "pegasusDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v16 = (*(unsigned int *)&has >> 1) & 1;
  v17 = v4[32];
  if (v16 != ((v17 >> 1) & 1))
  {
LABEL_19:
    v21 = 0;
    goto LABEL_20;
  }
  if (v16)
  {
    isFromResponseCache = self->_isFromResponseCache;
    if (isFromResponseCache == objc_msgSend(v4, "isFromResponseCache"))
    {
      has = self->_has;
      v17 = v4[32];
      goto LABEL_15;
    }
    goto LABEL_19;
  }
LABEL_15:
  v19 = (*(unsigned int *)&has >> 2) & 1;
  if (v19 != ((v17 >> 2) & 1))
    goto LABEL_19;
  if (v19)
  {
    pegasusPromptType = self->_pegasusPromptType;
    if (pegasusPromptType != objc_msgSend(v4, "pegasusPromptType"))
      goto LABEL_19;
  }
  v21 = 1;
LABEL_20:

  return v21;
}

- (unint64_t)hash
{
  unint64_t v3;
  double pommesConfidenceScore;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    pommesConfidenceScore = self->_pommesConfidenceScore;
    v5 = -pommesConfidenceScore;
    if (pommesConfidenceScore >= 0.0)
      v5 = self->_pommesConfidenceScore;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_pegasusDomain, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9 = 2654435761 * self->_isFromResponseCache;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_11;
LABEL_13:
    v10 = 0;
    return v8 ^ v3 ^ v9 ^ v10;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_13;
LABEL_11:
  v10 = 2654435761 * self->_pegasusPromptType;
  return v8 ^ v3 ^ v9 ^ v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESRequestResult isFromResponseCache](self, "isFromResponseCache"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isFromResponseCache"));

  }
  if (self->_pegasusDomain)
  {
    -[POMMESSchemaPOMMESRequestResult pegasusDomain](self, "pegasusDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("pegasusDomain"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v8 = -[POMMESSchemaPOMMESRequestResult pegasusPromptType](self, "pegasusPromptType");
    v9 = CFSTR("POMMESPEGASUSPROMPTTYPE_UNKNOWN");
    if (v8 == 1)
      v9 = CFSTR("POMMESPEGASUSPROMPTTYPE_SHARE_DEVICE_LOCATION");
    if (v8 == 2)
      v10 = CFSTR("POMMESPEGASUSPROMPTTYPE_SHARE_PRECISE_DEVICE_LOCATION");
    else
      v10 = v9;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("pegasusPromptType"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[POMMESSchemaPOMMESRequestResult pommesConfidenceScore](self, "pommesConfidenceScore");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("pommesConfidenceScore"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESRequestResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESRequestResult)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESRequestResult *v5;
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
    self = -[POMMESSchemaPOMMESRequestResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESRequestResult)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESRequestResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  POMMESSchemaPOMMESRequestResult *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)POMMESSchemaPOMMESRequestResult;
  v5 = -[POMMESSchemaPOMMESRequestResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommesConfidenceScore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[POMMESSchemaPOMMESRequestResult setPommesConfidenceScore:](v5, "setPommesConfidenceScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusDomain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[POMMESSchemaPOMMESRequestResult setPegasusDomain:](v5, "setPegasusDomain:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFromResponseCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESRequestResult setIsFromResponseCache:](v5, "setIsFromResponseCache:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusPromptType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESRequestResult setPegasusPromptType:](v5, "setPegasusPromptType:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (double)pommesConfidenceScore
{
  return self->_pommesConfidenceScore;
}

- (NSString)pegasusDomain
{
  return self->_pegasusDomain;
}

- (void)setPegasusDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isFromResponseCache
{
  return self->_isFromResponseCache;
}

- (int)pegasusPromptType
{
  return self->_pegasusPromptType;
}

- (void)setHasPegasusDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusDomain, 0);
}

@end
