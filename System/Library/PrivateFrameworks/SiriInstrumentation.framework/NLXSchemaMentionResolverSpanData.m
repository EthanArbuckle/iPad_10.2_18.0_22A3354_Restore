@implementation NLXSchemaMentionResolverSpanData

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setJointScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_jointScore = a3;
}

- (BOOL)hasJointScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasJointScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteJointScore
{
  -[NLXSchemaMentionResolverSpanData setJointScore:](self, "setJointScore:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setModelScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_modelScore = a3;
}

- (BOOL)hasModelScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasModelScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteModelScore
{
  -[NLXSchemaMentionResolverSpanData setModelScore:](self, "setModelScore:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMentionResolverSpanDataReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $4250D57894D845E96145F3AD30AC539D has;
  unsigned int v6;
  double jointScore;
  double v8;
  int v9;
  double modelScore;
  double v11;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_9;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    jointScore = self->_jointScore;
    objc_msgSend(v4, "jointScore");
    if (jointScore != v8)
      goto LABEL_9;
    has = self->_has;
    v6 = v4[24];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (!v9 || (modelScore = self->_modelScore, objc_msgSend(v4, "modelScore"), modelScore == v11))
    {
      v12 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  v12 = 0;
LABEL_10:

  return v12;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double jointScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double modelScore;
  double v11;
  long double v12;
  double v13;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    jointScore = self->_jointScore;
    v6 = -jointScore;
    if (jointScore >= 0.0)
      v6 = self->_jointScore;
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
  {
    modelScore = self->_modelScore;
    v11 = -modelScore;
    if (modelScore >= 0.0)
      v11 = self->_modelScore;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  return v9 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[NLXSchemaMentionResolverSpanData jointScore](self, "jointScore");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("jointScore"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[NLXSchemaMentionResolverSpanData modelScore](self, "modelScore");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("modelScore"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaMentionResolverSpanData dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaMentionResolverSpanData)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaMentionResolverSpanData *v5;
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
    self = -[NLXSchemaMentionResolverSpanData initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaMentionResolverSpanData)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaMentionResolverSpanData *v5;
  void *v6;
  void *v7;
  NLXSchemaMentionResolverSpanData *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaMentionResolverSpanData;
  v5 = -[NLXSchemaMentionResolverSpanData init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jointScore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[NLXSchemaMentionResolverSpanData setJointScore:](v5, "setJointScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[NLXSchemaMentionResolverSpanData setModelScore:](v5, "setModelScore:");
    }
    v8 = v5;

  }
  return v5;
}

- (double)jointScore
{
  return self->_jointScore;
}

- (double)modelScore
{
  return self->_modelScore;
}

@end
