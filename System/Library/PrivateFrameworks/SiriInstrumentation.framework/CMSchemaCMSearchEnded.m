@implementation CMSchemaCMSearchEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSearchStrategy:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_searchStrategy = a3;
}

- (BOOL)hasSearchStrategy
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSearchStrategy:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSearchStrategy
{
  -[CMSchemaCMSearchEnded setSearchStrategy:](self, "setSearchStrategy:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setResultCount:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_resultCount = a3;
}

- (BOOL)hasResultCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasResultCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteResultCount
{
  -[CMSchemaCMSearchEnded setResultCount:](self, "setResultCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setHighestMatchScore:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_highestMatchScore = a3;
}

- (BOOL)hasHighestMatchScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHighestMatchScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteHighestMatchScore
{
  -[CMSchemaCMSearchEnded setHighestMatchScore:](self, "setHighestMatchScore:", 0.0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setLowestMatchScore:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_lowestMatchScore = a3;
}

- (BOOL)hasLowestMatchScore
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasLowestMatchScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteLowestMatchScore
{
  -[CMSchemaCMSearchEnded setLowestMatchScore:](self, "setLowestMatchScore:", 0.0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return CMSchemaCMSearchEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $9543DA9229227681A40D6BC9FA0493CF has;
  unsigned int v6;
  int searchStrategy;
  int v8;
  int resultCount;
  int v10;
  double highestMatchScore;
  double v12;
  int v13;
  double lowestMatchScore;
  double v15;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_17;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    searchStrategy = self->_searchStrategy;
    if (searchStrategy != objc_msgSend(v4, "searchStrategy"))
      goto LABEL_17;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      resultCount = self->_resultCount;
      if (resultCount != objc_msgSend(v4, "resultCount"))
        goto LABEL_17;
      has = self->_has;
      v6 = v4[32];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        highestMatchScore = self->_highestMatchScore;
        objc_msgSend(v4, "highestMatchScore");
        if (highestMatchScore != v12)
          goto LABEL_17;
        has = self->_has;
        v6 = v4[32];
      }
      v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (!v13
          || (lowestMatchScore = self->_lowestMatchScore, objc_msgSend(v4, "lowestMatchScore"), lowestMatchScore == v15))
        {
          v16 = 1;
          goto LABEL_18;
        }
      }
    }
  }
LABEL_17:
  v16 = 0;
LABEL_18:

  return v16;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  double highestMatchScore;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double lowestMatchScore;
  double v13;
  long double v14;
  double v15;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761 * self->_searchStrategy;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_resultCount;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  highestMatchScore = self->_highestMatchScore;
  v7 = -highestMatchScore;
  if (highestMatchScore >= 0.0)
    v7 = self->_highestMatchScore;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 8) != 0)
  {
    lowestMatchScore = self->_lowestMatchScore;
    v13 = -lowestMatchScore;
    if (lowestMatchScore >= 0.0)
      v13 = self->_lowestMatchScore;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  return v5 ^ v4 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[CMSchemaCMSearchEnded highestMatchScore](self, "highestMatchScore");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("highestMatchScore"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[CMSchemaCMSearchEnded lowestMatchScore](self, "lowestMatchScore");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lowestMatchScore"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_5;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CMSchemaCMSearchEnded resultCount](self, "resultCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("resultCount"));

  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_5:
  v5 = -[CMSchemaCMSearchEnded searchStrategy](self, "searchStrategy");
  v6 = CFSTR("CMSEARCHSTRATEGY_UNKNOWN");
  if (v5 == 1)
    v6 = CFSTR("CMSEARCHSTRATEGY_EXACT_MATCH");
  if (v5 == 2)
    v7 = CFSTR("CMSEARCHSTRATEGY_APPROXIMATE_MATCH");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("searchStrategy"));
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CMSchemaCMSearchEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CMSchemaCMSearchEnded)initWithJSON:(id)a3
{
  void *v4;
  CMSchemaCMSearchEnded *v5;
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
    self = -[CMSchemaCMSearchEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CMSchemaCMSearchEnded)initWithDictionary:(id)a3
{
  id v4;
  CMSchemaCMSearchEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CMSchemaCMSearchEnded *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMSchemaCMSearchEnded;
  v5 = -[CMSchemaCMSearchEnded init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchStrategy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CMSchemaCMSearchEnded setSearchStrategy:](v5, "setSearchStrategy:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CMSchemaCMSearchEnded setResultCount:](v5, "setResultCount:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("highestMatchScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[CMSchemaCMSearchEnded setHighestMatchScore:](v5, "setHighestMatchScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lowestMatchScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[CMSchemaCMSearchEnded setLowestMatchScore:](v5, "setLowestMatchScore:");
    }
    v10 = v5;

  }
  return v5;
}

- (int)searchStrategy
{
  return self->_searchStrategy;
}

- (int)resultCount
{
  return self->_resultCount;
}

- (double)highestMatchScore
{
  return self->_highestMatchScore;
}

- (double)lowestMatchScore
{
  return self->_lowestMatchScore;
}

@end
