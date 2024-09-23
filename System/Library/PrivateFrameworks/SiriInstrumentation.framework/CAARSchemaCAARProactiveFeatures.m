@implementation CAARSchemaCAARProactiveFeatures

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsAppInTopOneRelevance:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isAppInTopOneRelevance = a3;
}

- (BOOL)hasIsAppInTopOneRelevance
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsAppInTopOneRelevance:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsAppInTopOneRelevance
{
  -[CAARSchemaCAARProactiveFeatures setIsAppInTopOneRelevance:](self, "setIsAppInTopOneRelevance:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsAppInTopFiveRelevance:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isAppInTopFiveRelevance = a3;
}

- (BOOL)hasIsAppInTopFiveRelevance
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsAppInTopFiveRelevance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsAppInTopFiveRelevance
{
  -[CAARSchemaCAARProactiveFeatures setIsAppInTopFiveRelevance:](self, "setIsAppInTopFiveRelevance:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsAppInTopTenRelevance:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isAppInTopTenRelevance = a3;
}

- (BOOL)hasIsAppInTopTenRelevance
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsAppInTopTenRelevance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsAppInTopTenRelevance
{
  -[CAARSchemaCAARProactiveFeatures setIsAppInTopTenRelevance:](self, "setIsAppInTopTenRelevance:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsIntentInTopOneRelevance:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isIntentInTopOneRelevance = a3;
}

- (BOOL)hasIsIntentInTopOneRelevance
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsIntentInTopOneRelevance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsIntentInTopOneRelevance
{
  -[CAARSchemaCAARProactiveFeatures setIsIntentInTopOneRelevance:](self, "setIsIntentInTopOneRelevance:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setIsIntentInTopFiveRelevance:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isIntentInTopFiveRelevance = a3;
}

- (BOOL)hasIsIntentInTopFiveRelevance
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsIntentInTopFiveRelevance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteIsIntentInTopFiveRelevance
{
  -[CAARSchemaCAARProactiveFeatures setIsIntentInTopFiveRelevance:](self, "setIsIntentInTopFiveRelevance:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setIsIntentInTopTenRelevance:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isIntentInTopTenRelevance = a3;
}

- (BOOL)hasIsIntentInTopTenRelevance
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsIntentInTopTenRelevance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsIntentInTopTenRelevance
{
  -[CAARSchemaCAARProactiveFeatures setIsIntentInTopTenRelevance:](self, "setIsIntentInTopTenRelevance:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setAppRelevanceScore:(double)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_appRelevanceScore = a3;
}

- (BOOL)hasAppRelevanceScore
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasAppRelevanceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteAppRelevanceScore
{
  -[CAARSchemaCAARProactiveFeatures setAppRelevanceScore:](self, "setAppRelevanceScore:", 0.0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (void)setIntentRelevanceScore:(double)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_intentRelevanceScore = a3;
}

- (BOOL)hasIntentRelevanceScore
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasIntentRelevanceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (void)deleteIntentRelevanceScore
{
  -[CAARSchemaCAARProactiveFeatures setIntentRelevanceScore:](self, "setIntentRelevanceScore:", 0.0);
  *(_BYTE *)&self->_has &= ~0x80u;
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARProactiveFeaturesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    PBDataWriterWriteDoubleField();
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $2D00DB0B5873D8628076908720BCA6B5 has;
  unsigned int v6;
  int isAppInTopOneRelevance;
  int v8;
  int isAppInTopFiveRelevance;
  int v10;
  int isAppInTopTenRelevance;
  int v12;
  int isIntentInTopOneRelevance;
  int v14;
  int isIntentInTopFiveRelevance;
  int v16;
  int isIntentInTopTenRelevance;
  int v18;
  double appRelevanceScore;
  double v20;
  double intentRelevanceScore;
  double v22;
  BOOL v23;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_33;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isAppInTopOneRelevance = self->_isAppInTopOneRelevance;
    if (isAppInTopOneRelevance != objc_msgSend(v4, "isAppInTopOneRelevance"))
      goto LABEL_33;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      isAppInTopFiveRelevance = self->_isAppInTopFiveRelevance;
      if (isAppInTopFiveRelevance != objc_msgSend(v4, "isAppInTopFiveRelevance"))
        goto LABEL_33;
      has = self->_has;
      v6 = v4[32];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        isAppInTopTenRelevance = self->_isAppInTopTenRelevance;
        if (isAppInTopTenRelevance != objc_msgSend(v4, "isAppInTopTenRelevance"))
          goto LABEL_33;
        has = self->_has;
        v6 = v4[32];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          isIntentInTopOneRelevance = self->_isIntentInTopOneRelevance;
          if (isIntentInTopOneRelevance != objc_msgSend(v4, "isIntentInTopOneRelevance"))
            goto LABEL_33;
          has = self->_has;
          v6 = v4[32];
        }
        v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            isIntentInTopFiveRelevance = self->_isIntentInTopFiveRelevance;
            if (isIntentInTopFiveRelevance != objc_msgSend(v4, "isIntentInTopFiveRelevance"))
              goto LABEL_33;
            has = self->_has;
            v6 = v4[32];
          }
          v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 == ((v6 >> 5) & 1))
          {
            if (v16)
            {
              isIntentInTopTenRelevance = self->_isIntentInTopTenRelevance;
              if (isIntentInTopTenRelevance != objc_msgSend(v4, "isIntentInTopTenRelevance"))
                goto LABEL_33;
              has = self->_has;
              v6 = v4[32];
            }
            v18 = (*(unsigned int *)&has >> 6) & 1;
            if (v18 == ((v6 >> 6) & 1))
            {
              if (v18)
              {
                appRelevanceScore = self->_appRelevanceScore;
                objc_msgSend(v4, "appRelevanceScore");
                if (appRelevanceScore != v20)
                  goto LABEL_33;
                has = self->_has;
                v6 = v4[32];
              }
              if (((v6 ^ *(_DWORD *)&has) & 0x80) == 0)
              {
                if ((*(_BYTE *)&has & 0x80) == 0
                  || (intentRelevanceScore = self->_intentRelevanceScore,
                      objc_msgSend(v4, "intentRelevanceScore"),
                      intentRelevanceScore == v22))
                {
                  v23 = 1;
                  goto LABEL_34;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_33:
  v23 = 0;
LABEL_34:

  return v23;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double appRelevanceScore;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  double intentRelevanceScore;
  double v17;
  long double v18;
  double v19;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_isAppInTopOneRelevance;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_isAppInTopFiveRelevance;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_isAppInTopTenRelevance;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_isIntentInTopOneRelevance;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_isIntentInTopFiveRelevance;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_17:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_16:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_17;
LABEL_7:
  v9 = 2654435761 * self->_isIntentInTopTenRelevance;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_18;
LABEL_8:
  appRelevanceScore = self->_appRelevanceScore;
  v11 = -appRelevanceScore;
  if (appRelevanceScore >= 0.0)
    v11 = self->_appRelevanceScore;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if (has < 0)
  {
    intentRelevanceScore = self->_intentRelevanceScore;
    v17 = -intentRelevanceScore;
    if (intentRelevanceScore >= 0.0)
      v17 = self->_intentRelevanceScore;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15;
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
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[CAARSchemaCAARProactiveFeatures appRelevanceScore](self, "appRelevanceScore");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appRelevanceScore"));

    has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[CAARSchemaCAARProactiveFeatures intentRelevanceScore](self, "intentRelevanceScore");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("intentRelevanceScore"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isAppInTopFiveRelevance](self, "isAppInTopFiveRelevance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isAppInTopFiveRelevance"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isAppInTopOneRelevance](self, "isAppInTopOneRelevance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isAppInTopOneRelevance"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isAppInTopTenRelevance](self, "isAppInTopTenRelevance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isAppInTopTenRelevance"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isIntentInTopOneRelevance](self, "isIntentInTopOneRelevance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isIntentInTopOneRelevance"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isIntentInTopFiveRelevance](self, "isIntentInTopFiveRelevance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isIntentInTopFiveRelevance"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x20) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARProactiveFeatures isIntentInTopTenRelevance](self, "isIntentInTopTenRelevance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isIntentInTopTenRelevance"));

  }
LABEL_10:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARProactiveFeatures dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARProactiveFeatures)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARProactiveFeatures *v5;
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
    self = -[CAARSchemaCAARProactiveFeatures initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARProactiveFeatures)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARProactiveFeatures *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CAARSchemaCAARProactiveFeatures *v14;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CAARSchemaCAARProactiveFeatures;
  v5 = -[CAARSchemaCAARProactiveFeatures init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppInTopOneRelevance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARProactiveFeatures setIsAppInTopOneRelevance:](v5, "setIsAppInTopOneRelevance:", objc_msgSend(v6, "BOOLValue"));
    v16 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppInTopFiveRelevance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARProactiveFeatures setIsAppInTopFiveRelevance:](v5, "setIsAppInTopFiveRelevance:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppInTopTenRelevance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARProactiveFeatures setIsAppInTopTenRelevance:](v5, "setIsAppInTopTenRelevance:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isIntentInTopOneRelevance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARProactiveFeatures setIsIntentInTopOneRelevance:](v5, "setIsIntentInTopOneRelevance:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isIntentInTopFiveRelevance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARProactiveFeatures setIsIntentInTopFiveRelevance:](v5, "setIsIntentInTopFiveRelevance:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isIntentInTopTenRelevance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARProactiveFeatures setIsIntentInTopTenRelevance:](v5, "setIsIntentInTopTenRelevance:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appRelevanceScore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "doubleValue");
      -[CAARSchemaCAARProactiveFeatures setAppRelevanceScore:](v5, "setAppRelevanceScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentRelevanceScore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "doubleValue");
      -[CAARSchemaCAARProactiveFeatures setIntentRelevanceScore:](v5, "setIntentRelevanceScore:");
    }
    v14 = v5;

  }
  return v5;
}

- (BOOL)isAppInTopOneRelevance
{
  return self->_isAppInTopOneRelevance;
}

- (BOOL)isAppInTopFiveRelevance
{
  return self->_isAppInTopFiveRelevance;
}

- (BOOL)isAppInTopTenRelevance
{
  return self->_isAppInTopTenRelevance;
}

- (BOOL)isIntentInTopOneRelevance
{
  return self->_isIntentInTopOneRelevance;
}

- (BOOL)isIntentInTopFiveRelevance
{
  return self->_isIntentInTopFiveRelevance;
}

- (BOOL)isIntentInTopTenRelevance
{
  return self->_isIntentInTopTenRelevance;
}

- (double)appRelevanceScore
{
  return self->_appRelevanceScore;
}

- (double)intentRelevanceScore
{
  return self->_intentRelevanceScore;
}

@end
