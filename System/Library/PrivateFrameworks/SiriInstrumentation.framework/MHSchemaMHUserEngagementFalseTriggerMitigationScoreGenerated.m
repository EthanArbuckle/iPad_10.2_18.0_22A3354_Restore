@implementation MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setUemScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_uemScore = a3;
}

- (BOOL)hasUemScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUemScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteUemScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated setUemScore:](self, "setUemScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUemThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_uemThreshold = a3;
}

- (BOOL)hasUemThreshold
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUemThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUemThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated setUemThreshold:](self, "setUemThreshold:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHUserEngagementFalseTriggerMitigationScoreGeneratedReadFrom(self, (uint64_t)a3, v3);
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
    PBDataWriterWriteFloatField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $8D4290F366A7FB276CD1CFBCF88D8088 has;
  unsigned int v6;
  float uemScore;
  float v8;
  int v9;
  float uemThreshold;
  float v11;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_9;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    uemScore = self->_uemScore;
    objc_msgSend(v4, "uemScore");
    if (uemScore != v8)
      goto LABEL_9;
    has = self->_has;
    v6 = v4[16];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (!v9 || (uemThreshold = self->_uemThreshold, objc_msgSend(v4, "uemThreshold"), uemThreshold == v11))
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
  float uemScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float uemThreshold;
  double v11;
  long double v12;
  double v13;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    uemScore = self->_uemScore;
    v6 = uemScore;
    if (uemScore < 0.0)
      v6 = -uemScore;
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
    uemThreshold = self->_uemThreshold;
    v11 = uemThreshold;
    if (uemThreshold < 0.0)
      v11 = -uemThreshold;
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
    -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated uemScore](self, "uemScore");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("uemScore"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated uemThreshold](self, "uemThreshold");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("uemThreshold"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated *v5;
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
    self = -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated *v5;
  void *v6;
  void *v7;
  MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated;
  v5 = -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uemScore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated setUemScore:](v5, "setUemScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uemThreshold"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated setUemThreshold:](v5, "setUemThreshold:");
    }
    v8 = v5;

  }
  return v5;
}

- (float)uemScore
{
  return self->_uemScore;
}

- (float)uemThreshold
{
  return self->_uemThreshold;
}

@end
