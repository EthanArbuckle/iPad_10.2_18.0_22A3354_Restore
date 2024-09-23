@implementation NLXSchemaMARRSQueryRewriteHypothesis

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setConfidence:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteConfidence
{
  -[NLXSchemaMARRSQueryRewriteHypothesis setConfidence:](self, "setConfidence:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRewriteType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rewriteType = a3;
}

- (BOOL)hasRewriteType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRewriteType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRewriteType
{
  -[NLXSchemaMARRSQueryRewriteHypothesis setRewriteType:](self, "setRewriteType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMARRSQueryRewriteHypothesisReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $8514A43581E4C1E10D41781FC0FD2A4E has;
  unsigned int v6;
  double confidence;
  double v8;
  int v9;
  int rewriteType;
  BOOL v11;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    confidence = self->_confidence;
    objc_msgSend(v4, "confidence");
    if (confidence != v8)
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[20];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v9)
  {
    rewriteType = self->_rewriteType;
    if (rewriteType != objc_msgSend(v4, "rewriteType"))
      goto LABEL_10;
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double confidence;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    confidence = self->_confidence;
    v6 = -confidence;
    if (confidence >= 0.0)
      v6 = self->_confidence;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
    v9 = 2654435761 * self->_rewriteType;
  else
    v9 = 0;
  return v9 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[NLXSchemaMARRSQueryRewriteHypothesis confidence](self, "confidence");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("confidence"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = -[NLXSchemaMARRSQueryRewriteHypothesis rewriteType](self, "rewriteType");
    v8 = CFSTR("MARRSQUERYREWRITETYPE_UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("MARRSQUERYREWRITETYPE_CORRECTION");
    if (v7 == 2)
      v9 = CFSTR("MARRSQUERYREWRITETYPE_ANAPHORA_ELLIPSIS_RESOLUTION");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("rewriteType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaMARRSQueryRewriteHypothesis dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaMARRSQueryRewriteHypothesis)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaMARRSQueryRewriteHypothesis *v5;
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
    self = -[NLXSchemaMARRSQueryRewriteHypothesis initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaMARRSQueryRewriteHypothesis)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaMARRSQueryRewriteHypothesis *v5;
  void *v6;
  void *v7;
  NLXSchemaMARRSQueryRewriteHypothesis *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaMARRSQueryRewriteHypothesis;
  v5 = -[NLXSchemaMARRSQueryRewriteHypothesis init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[NLXSchemaMARRSQueryRewriteHypothesis setConfidence:](v5, "setConfidence:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rewriteType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaMARRSQueryRewriteHypothesis setRewriteType:](v5, "setRewriteType:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (double)confidence
{
  return self->_confidence;
}

- (int)rewriteType
{
  return self->_rewriteType;
}

@end
