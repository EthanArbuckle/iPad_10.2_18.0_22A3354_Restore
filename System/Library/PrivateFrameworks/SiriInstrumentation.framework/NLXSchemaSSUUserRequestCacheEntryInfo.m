@implementation NLXSchemaSSUUserRequestCacheEntryInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaSSUUserRequestCacheEntryInfo;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaSSUUserRequestCacheEntryInfo matchInfo](self, "matchInfo", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[NLXSchemaSSUUserRequestCacheEntryInfo deleteMatchInfo](self, "deleteMatchInfo");
  return v5;
}

- (void)setTriggerReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_triggerReason = a3;
}

- (BOOL)hasTriggerReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTriggerReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTriggerReason
{
  -[NLXSchemaSSUUserRequestCacheEntryInfo setTriggerReason:](self, "setTriggerReason:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCategoryType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_categoryType = a3;
}

- (BOOL)hasCategoryType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCategoryType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCategoryType
{
  -[NLXSchemaSSUUserRequestCacheEntryInfo setCategoryType:](self, "setCategoryType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumEncodingSimilarityScoreComparisons:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numEncodingSimilarityScoreComparisons = a3;
}

- (BOOL)hasNumEncodingSimilarityScoreComparisons
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumEncodingSimilarityScoreComparisons:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumEncodingSimilarityScoreComparisons
{
  -[NLXSchemaSSUUserRequestCacheEntryInfo setNumEncodingSimilarityScoreComparisons:](self, "setNumEncodingSimilarityScoreComparisons:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setClosestNegativeExampleScore:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_closestNegativeExampleScore = a3;
}

- (BOOL)hasClosestNegativeExampleScore
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasClosestNegativeExampleScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteClosestNegativeExampleScore
{
  -[NLXSchemaSSUUserRequestCacheEntryInfo setClosestNegativeExampleScore:](self, "setClosestNegativeExampleScore:", 0.0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setClosestPositiveExampleScore:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_closestPositiveExampleScore = a3;
}

- (BOOL)hasClosestPositiveExampleScore
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasClosestPositiveExampleScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteClosestPositiveExampleScore
{
  -[NLXSchemaSSUUserRequestCacheEntryInfo setClosestPositiveExampleScore:](self, "setClosestPositiveExampleScore:", 0.0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasMatchInfo
{
  return self->_matchInfo != 0;
}

- (void)deleteMatchInfo
{
  -[NLXSchemaSSUUserRequestCacheEntryInfo setMatchInfo:](self, "setMatchInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaSSUUserRequestCacheEntryInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
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
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
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
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteDoubleField();
LABEL_7:
  -[NLXSchemaSSUUserRequestCacheEntryInfo matchInfo](self, "matchInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[NLXSchemaSSUUserRequestCacheEntryInfo matchInfo](self, "matchInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $3723A4767FD23792DE64A834EA9AEBB1 has;
  unsigned int v6;
  int triggerReason;
  int v8;
  int categoryType;
  int v10;
  unsigned int numEncodingSimilarityScoreComparisons;
  int v12;
  double closestNegativeExampleScore;
  double v14;
  int v15;
  double closestPositiveExampleScore;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = self->_has;
  v6 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_26;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    triggerReason = self->_triggerReason;
    if (triggerReason != objc_msgSend(v4, "triggerReason"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[48];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      categoryType = self->_categoryType;
      if (categoryType != objc_msgSend(v4, "categoryType"))
        goto LABEL_26;
      has = self->_has;
      v6 = v4[48];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        numEncodingSimilarityScoreComparisons = self->_numEncodingSimilarityScoreComparisons;
        if (numEncodingSimilarityScoreComparisons != objc_msgSend(v4, "numEncodingSimilarityScoreComparisons"))goto LABEL_26;
        has = self->_has;
        v6 = v4[48];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          closestNegativeExampleScore = self->_closestNegativeExampleScore;
          objc_msgSend(v4, "closestNegativeExampleScore");
          if (closestNegativeExampleScore != v14)
            goto LABEL_26;
          has = self->_has;
          v6 = v4[48];
        }
        v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 == ((v6 >> 4) & 1))
        {
          if (!v15
            || (closestPositiveExampleScore = self->_closestPositiveExampleScore,
                objc_msgSend(v4, "closestPositiveExampleScore"),
                closestPositiveExampleScore == v17))
          {
            -[NLXSchemaSSUUserRequestCacheEntryInfo matchInfo](self, "matchInfo");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "matchInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if ((v18 == 0) != (v19 != 0))
            {
              -[NLXSchemaSSUUserRequestCacheEntryInfo matchInfo](self, "matchInfo");
              v21 = objc_claimAutoreleasedReturnValue();
              if (!v21)
              {

LABEL_29:
                v26 = 1;
                goto LABEL_27;
              }
              v22 = (void *)v21;
              -[NLXSchemaSSUUserRequestCacheEntryInfo matchInfo](self, "matchInfo");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "matchInfo");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v23, "isEqual:", v24);

              if ((v25 & 1) != 0)
                goto LABEL_29;
            }
            else
            {

            }
          }
        }
      }
    }
  }
LABEL_26:
  v26 = 0;
LABEL_27:

  return v26;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double closestNegativeExampleScore;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double closestPositiveExampleScore;
  double v14;
  long double v15;
  double v16;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_triggerReason;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_categoryType;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761 * self->_numEncodingSimilarityScoreComparisons;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_5:
  closestNegativeExampleScore = self->_closestNegativeExampleScore;
  v8 = -closestNegativeExampleScore;
  if (closestNegativeExampleScore >= 0.0)
    v8 = self->_closestNegativeExampleScore;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((has & 0x10) != 0)
  {
    closestPositiveExampleScore = self->_closestPositiveExampleScore;
    v14 = -closestPositiveExampleScore;
    if (closestPositiveExampleScore >= 0.0)
      v14 = self->_closestPositiveExampleScore;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ -[NLXSchemaSSUUserRequestMatchInfo hash](self->_matchInfo, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[NLXSchemaSSUUserRequestCacheEntryInfo categoryType](self, "categoryType") - 1;
    if (v5 > 3)
      v6 = CFSTR("SSUCATEGORYTYPE_UNKNOWN");
    else
      v6 = off_1E563A938[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("categoryType"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[NLXSchemaSSUUserRequestCacheEntryInfo closestNegativeExampleScore](self, "closestNegativeExampleScore");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("closestNegativeExampleScore"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[NLXSchemaSSUUserRequestCacheEntryInfo closestPositiveExampleScore](self, "closestPositiveExampleScore");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("closestPositiveExampleScore"));

  }
  if (self->_matchInfo)
  {
    -[NLXSchemaSSUUserRequestCacheEntryInfo matchInfo](self, "matchInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("matchInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("matchInfo"));

    }
  }
  v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaSSUUserRequestCacheEntryInfo numEncodingSimilarityScoreComparisons](self, "numEncodingSimilarityScoreComparisons"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("numEncodingSimilarityScoreComparisons"));

    v14 = (char)self->_has;
  }
  if ((v14 & 1) != 0)
  {
    v16 = -[NLXSchemaSSUUserRequestCacheEntryInfo triggerReason](self, "triggerReason") - 1;
    if (v16 > 2)
      v17 = CFSTR("SSUCACHETRIGGERREASON_UNKNOWN");
    else
      v17 = off_1E563A958[v16];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("triggerReason"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaSSUUserRequestCacheEntryInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaSSUUserRequestCacheEntryInfo)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaSSUUserRequestCacheEntryInfo *v5;
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
    self = -[NLXSchemaSSUUserRequestCacheEntryInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaSSUUserRequestCacheEntryInfo)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaSSUUserRequestCacheEntryInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NLXSchemaSSUUserRequestMatchInfo *v12;
  NLXSchemaSSUUserRequestCacheEntryInfo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NLXSchemaSSUUserRequestCacheEntryInfo;
  v5 = -[NLXSchemaSSUUserRequestCacheEntryInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerReason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaSSUUserRequestCacheEntryInfo setTriggerReason:](v5, "setTriggerReason:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categoryType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaSSUUserRequestCacheEntryInfo setCategoryType:](v5, "setCategoryType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numEncodingSimilarityScoreComparisons"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaSSUUserRequestCacheEntryInfo setNumEncodingSimilarityScoreComparisons:](v5, "setNumEncodingSimilarityScoreComparisons:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("closestNegativeExampleScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[NLXSchemaSSUUserRequestCacheEntryInfo setClosestNegativeExampleScore:](v5, "setClosestNegativeExampleScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("closestPositiveExampleScore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      -[NLXSchemaSSUUserRequestCacheEntryInfo setClosestPositiveExampleScore:](v5, "setClosestPositiveExampleScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[NLXSchemaSSUUserRequestMatchInfo initWithDictionary:]([NLXSchemaSSUUserRequestMatchInfo alloc], "initWithDictionary:", v11);
      -[NLXSchemaSSUUserRequestCacheEntryInfo setMatchInfo:](v5, "setMatchInfo:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (int)triggerReason
{
  return self->_triggerReason;
}

- (int)categoryType
{
  return self->_categoryType;
}

- (unsigned)numEncodingSimilarityScoreComparisons
{
  return self->_numEncodingSimilarityScoreComparisons;
}

- (double)closestNegativeExampleScore
{
  return self->_closestNegativeExampleScore;
}

- (double)closestPositiveExampleScore
{
  return self->_closestPositiveExampleScore;
}

- (NLXSchemaSSUUserRequestMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void)setMatchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_matchInfo, a3);
}

- (void)setHasMatchInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchInfo, 0);
}

@end
