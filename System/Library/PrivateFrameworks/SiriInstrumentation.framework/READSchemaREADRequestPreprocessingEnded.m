@implementation READSchemaREADRequestPreprocessingEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setArticleTextLength:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_articleTextLength = a3;
}

- (BOOL)hasArticleTextLength
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasArticleTextLength:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteArticleTextLength
{
  -[READSchemaREADRequestPreprocessingEnded setArticleTextLength:](self, "setArticleTextLength:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUtteranceCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_utteranceCount = a3;
}

- (BOOL)hasUtteranceCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUtteranceCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUtteranceCount
{
  -[READSchemaREADRequestPreprocessingEnded setUtteranceCount:](self, "setUtteranceCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setEstimatedDuration:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_estimatedDuration = a3;
}

- (BOOL)hasEstimatedDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEstimatedDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteEstimatedDuration
{
  double v2;

  LODWORD(v2) = 0;
  -[READSchemaREADRequestPreprocessingEnded setEstimatedDuration:](self, "setEstimatedDuration:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return READSchemaREADRequestPreprocessingEndedReadFrom(self, (uint64_t)a3, v3);
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
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $DC4C8EB819992658C1F1D1E577E5C16A has;
  unsigned int v6;
  unsigned int articleTextLength;
  int v8;
  unsigned int utteranceCount;
  int v10;
  float estimatedDuration;
  float v12;
  BOOL v13;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_13;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    articleTextLength = self->_articleTextLength;
    if (articleTextLength != objc_msgSend(v4, "articleTextLength"))
      goto LABEL_13;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      utteranceCount = self->_utteranceCount;
      if (utteranceCount != objc_msgSend(v4, "utteranceCount"))
        goto LABEL_13;
      has = self->_has;
      v6 = v4[20];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10
        || (estimatedDuration = self->_estimatedDuration, objc_msgSend(v4, "estimatedDuration"),
                                                          estimatedDuration == v12))
      {
        v13 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  v13 = 0;
LABEL_14:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  float estimatedDuration;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    return v3 ^ v2 ^ v8;
  }
  v2 = 2654435761 * self->_articleTextLength;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v3 = 2654435761 * self->_utteranceCount;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  estimatedDuration = self->_estimatedDuration;
  v5 = estimatedDuration;
  if (estimatedDuration < 0.0)
    v5 = -estimatedDuration;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v3 ^ v2 ^ v8;
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[READSchemaREADRequestPreprocessingEnded estimatedDuration](self, "estimatedDuration");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("estimatedDuration"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[READSchemaREADRequestPreprocessingEnded articleTextLength](self, "articleTextLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("articleTextLength"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[READSchemaREADRequestPreprocessingEnded utteranceCount](self, "utteranceCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("utteranceCount"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[READSchemaREADRequestPreprocessingEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (READSchemaREADRequestPreprocessingEnded)initWithJSON:(id)a3
{
  void *v4;
  READSchemaREADRequestPreprocessingEnded *v5;
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
    self = -[READSchemaREADRequestPreprocessingEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (READSchemaREADRequestPreprocessingEnded)initWithDictionary:(id)a3
{
  id v4;
  READSchemaREADRequestPreprocessingEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  READSchemaREADRequestPreprocessingEnded *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)READSchemaREADRequestPreprocessingEnded;
  v5 = -[READSchemaREADRequestPreprocessingEnded init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("articleTextLength"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[READSchemaREADRequestPreprocessingEnded setArticleTextLength:](v5, "setArticleTextLength:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[READSchemaREADRequestPreprocessingEnded setUtteranceCount:](v5, "setUtteranceCount:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("estimatedDuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[READSchemaREADRequestPreprocessingEnded setEstimatedDuration:](v5, "setEstimatedDuration:");
    }
    v9 = v5;

  }
  return v5;
}

- (unsigned)articleTextLength
{
  return self->_articleTextLength;
}

- (unsigned)utteranceCount
{
  return self->_utteranceCount;
}

- (float)estimatedDuration
{
  return self->_estimatedDuration;
}

@end
