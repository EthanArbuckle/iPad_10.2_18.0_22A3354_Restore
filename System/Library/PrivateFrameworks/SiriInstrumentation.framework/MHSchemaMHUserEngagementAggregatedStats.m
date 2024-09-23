@implementation MHSchemaMHUserEngagementAggregatedStats

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMitigationType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mitigationType = a3;
}

- (BOOL)hasMitigationType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMitigationType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMitigationType
{
  -[MHSchemaMHUserEngagementAggregatedStats setMitigationType:](self, "setMitigationType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRequestCount:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestCount = a3;
}

- (BOOL)hasRequestCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRequestCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRequestCount
{
  -[MHSchemaMHUserEngagementAggregatedStats setRequestCount:](self, "setRequestCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIntendedRequestCount:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_intendedRequestCount = a3;
}

- (BOOL)hasIntendedRequestCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIntendedRequestCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIntendedRequestCount
{
  -[MHSchemaMHUserEngagementAggregatedStats setIntendedRequestCount:](self, "setIntendedRequestCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setUnintendedRequestCount:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_unintendedRequestCount = a3;
}

- (BOOL)hasUnintendedRequestCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasUnintendedRequestCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteUnintendedRequestCount
{
  -[MHSchemaMHUserEngagementAggregatedStats setUnintendedRequestCount:](self, "setUnintendedRequestCount:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setIntendedRequestRatio:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_intendedRequestRatio = a3;
}

- (BOOL)hasIntendedRequestRatio
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIntendedRequestRatio:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteIntendedRequestRatio
{
  -[MHSchemaMHUserEngagementAggregatedStats setIntendedRequestRatio:](self, "setIntendedRequestRatio:", 0.0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setTriggeredMechanismRequestRatio:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_triggeredMechanismRequestRatio = a3;
}

- (BOOL)hasTriggeredMechanismRequestRatio
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasTriggeredMechanismRequestRatio:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteTriggeredMechanismRequestRatio
{
  -[MHSchemaMHUserEngagementAggregatedStats setTriggeredMechanismRequestRatio:](self, "setTriggeredMechanismRequestRatio:", 0.0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteModelVersion
{
  -[MHSchemaMHUserEngagementAggregatedStats setModelVersion:](self, "setModelVersion:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHUserEngagementAggregatedStatsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
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
      goto LABEL_13;
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
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteDoubleField();
LABEL_8:
  -[MHSchemaMHUserEngagementAggregatedStats modelVersion](self, "modelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $0333B86DA4EDEC2D89C45A58BA01F1FA has;
  unsigned int v6;
  int mitigationType;
  int v8;
  int requestCount;
  int v10;
  int intendedRequestCount;
  int v12;
  int unintendedRequestCount;
  int v14;
  double intendedRequestRatio;
  double v16;
  int v17;
  double triggeredMechanismRequestRatio;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  has = self->_has;
  v6 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    mitigationType = self->_mitigationType;
    if (mitigationType != objc_msgSend(v4, "mitigationType"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[48];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      requestCount = self->_requestCount;
      if (requestCount != objc_msgSend(v4, "requestCount"))
        goto LABEL_30;
      has = self->_has;
      v6 = v4[48];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        intendedRequestCount = self->_intendedRequestCount;
        if (intendedRequestCount != objc_msgSend(v4, "intendedRequestCount"))
          goto LABEL_30;
        has = self->_has;
        v6 = v4[48];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          unintendedRequestCount = self->_unintendedRequestCount;
          if (unintendedRequestCount != objc_msgSend(v4, "unintendedRequestCount"))
            goto LABEL_30;
          has = self->_has;
          v6 = v4[48];
        }
        v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            intendedRequestRatio = self->_intendedRequestRatio;
            objc_msgSend(v4, "intendedRequestRatio");
            if (intendedRequestRatio != v16)
              goto LABEL_30;
            has = self->_has;
            v6 = v4[48];
          }
          v17 = (*(unsigned int *)&has >> 5) & 1;
          if (v17 == ((v6 >> 5) & 1))
          {
            if (!v17
              || (triggeredMechanismRequestRatio = self->_triggeredMechanismRequestRatio,
                  objc_msgSend(v4, "triggeredMechanismRequestRatio"),
                  triggeredMechanismRequestRatio == v19))
            {
              -[MHSchemaMHUserEngagementAggregatedStats modelVersion](self, "modelVersion");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "modelVersion");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if ((v20 == 0) != (v21 != 0))
              {
                -[MHSchemaMHUserEngagementAggregatedStats modelVersion](self, "modelVersion");
                v23 = objc_claimAutoreleasedReturnValue();
                if (!v23)
                {

LABEL_33:
                  v28 = 1;
                  goto LABEL_31;
                }
                v24 = (void *)v23;
                -[MHSchemaMHUserEngagementAggregatedStats modelVersion](self, "modelVersion");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "modelVersion");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v25, "isEqual:", v26);

                if ((v27 & 1) != 0)
                  goto LABEL_33;
              }
              else
              {

              }
            }
          }
        }
      }
    }
  }
LABEL_30:
  v28 = 0;
LABEL_31:

  return v28;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double intendedRequestRatio;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  double triggeredMechanismRequestRatio;
  double v15;
  long double v16;
  double v17;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_mitigationType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_requestCount;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_12;
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
    v6 = 2654435761 * self->_intendedRequestCount;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_13:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_14:
    v12 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_5:
  v7 = 2654435761 * self->_unintendedRequestCount;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_6:
  intendedRequestRatio = self->_intendedRequestRatio;
  v9 = -intendedRequestRatio;
  if (intendedRequestRatio >= 0.0)
    v9 = self->_intendedRequestRatio;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_17:
  if ((has & 0x20) != 0)
  {
    triggeredMechanismRequestRatio = self->_triggeredMechanismRequestRatio;
    v15 = -triggeredMechanismRequestRatio;
    if (triggeredMechanismRequestRatio >= 0.0)
      v15 = self->_triggeredMechanismRequestRatio;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v12 ^ v13 ^ -[NSString hash](self->_modelVersion, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_3;
LABEL_6:
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHUserEngagementAggregatedStats intendedRequestRatio](self, "intendedRequestRatio");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intendedRequestRatio"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_11;
LABEL_7:
    v8 = -[MHSchemaMHUserEngagementAggregatedStats mitigationType](self, "mitigationType") - 1;
    if (v8 > 2)
      v9 = CFSTR("MHUSERENGAGEMENTMODELTRIGGERMECHANISM_UNKNOWN");
    else
      v9 = off_1E563A100[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mitigationType"));
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MHSchemaMHUserEngagementAggregatedStats intendedRequestCount](self, "intendedRequestCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intendedRequestCount"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_6;
LABEL_3:
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_11:
  if (self->_modelVersion)
  {
    -[MHSchemaMHUserEngagementAggregatedStats modelVersion](self, "modelVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("modelVersion"));

  }
  v12 = (char)self->_has;
  if ((v12 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_15;
LABEL_19:
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHUserEngagementAggregatedStats triggeredMechanismRequestRatio](self, "triggeredMechanismRequestRatio");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("triggeredMechanismRequestRatio"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MHSchemaMHUserEngagementAggregatedStats requestCount](self, "requestCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("requestCount"));

  v12 = (char)self->_has;
  if ((v12 & 0x20) != 0)
    goto LABEL_19;
LABEL_15:
  if ((v12 & 8) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MHSchemaMHUserEngagementAggregatedStats unintendedRequestCount](self, "unintendedRequestCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("unintendedRequestCount"));

  }
LABEL_17:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHUserEngagementAggregatedStats dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHUserEngagementAggregatedStats)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHUserEngagementAggregatedStats *v5;
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
    self = -[MHSchemaMHUserEngagementAggregatedStats initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHUserEngagementAggregatedStats)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHUserEngagementAggregatedStats *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MHSchemaMHUserEngagementAggregatedStats *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MHSchemaMHUserEngagementAggregatedStats;
  v5 = -[MHSchemaMHUserEngagementAggregatedStats init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mitigationType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHUserEngagementAggregatedStats setMitigationType:](v5, "setMitigationType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHUserEngagementAggregatedStats setRequestCount:](v5, "setRequestCount:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intendedRequestCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHUserEngagementAggregatedStats setIntendedRequestCount:](v5, "setIntendedRequestCount:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unintendedRequestCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHUserEngagementAggregatedStats setUnintendedRequestCount:](v5, "setUnintendedRequestCount:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intendedRequestRatio"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      -[MHSchemaMHUserEngagementAggregatedStats setIntendedRequestRatio:](v5, "setIntendedRequestRatio:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggeredMechanismRequestRatio"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "doubleValue");
      -[MHSchemaMHUserEngagementAggregatedStats setTriggeredMechanismRequestRatio:](v5, "setTriggeredMechanismRequestRatio:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[MHSchemaMHUserEngagementAggregatedStats setModelVersion:](v5, "setModelVersion:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (int)mitigationType
{
  return self->_mitigationType;
}

- (int)requestCount
{
  return self->_requestCount;
}

- (int)intendedRequestCount
{
  return self->_intendedRequestCount;
}

- (int)unintendedRequestCount
{
  return self->_unintendedRequestCount;
}

- (double)intendedRequestRatio
{
  return self->_intendedRequestRatio;
}

- (double)triggeredMechanismRequestRatio
{
  return self->_triggeredMechanismRequestRatio;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

@end
