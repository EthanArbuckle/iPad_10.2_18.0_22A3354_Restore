@implementation MHSchemaMHUserEngagementFalseTriggerMitigationStarted

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
  v9.super_class = (Class)MHSchemaMHUserEngagementFalseTriggerMitigationStarted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted accumulatedAggregationStats](self, "accumulatedAggregationStats", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted deleteAccumulatedAggregationStats](self, "deleteAccumulatedAggregationStats");
  return v5;
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteModelVersion
{
  -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted setModelVersion:](self, "setModelVersion:", 0);
}

- (void)setUiWaitTimeInSeconds:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_uiWaitTimeInSeconds = a3;
}

- (BOOL)hasUiWaitTimeInSeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUiWaitTimeInSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteUiWaitTimeInSeconds
{
  -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted setUiWaitTimeInSeconds:](self, "setUiWaitTimeInSeconds:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAccumulatedAggregationStats
{
  return self->_accumulatedAggregationStats != 0;
}

- (void)deleteAccumulatedAggregationStats
{
  -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted setAccumulatedAggregationStats:](self, "setAccumulatedAggregationStats:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHUserEngagementFalseTriggerMitigationStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted modelVersion](self, "modelVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted accumulatedAggregationStats](self, "accumulatedAggregationStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted accumulatedAggregationStats](self, "accumulatedAggregationStats");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double uiWaitTimeInSeconds;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted modelVersion](self, "modelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted modelVersion](self, "modelVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted modelVersion](self, "modelVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uiWaitTimeInSeconds = self->_uiWaitTimeInSeconds;
    objc_msgSend(v4, "uiWaitTimeInSeconds");
    if (uiWaitTimeInSeconds != v13)
      goto LABEL_15;
  }
  -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted accumulatedAggregationStats](self, "accumulatedAggregationStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accumulatedAggregationStats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted accumulatedAggregationStats](self, "accumulatedAggregationStats");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_18:
      v19 = 1;
      goto LABEL_16;
    }
    v15 = (void *)v14;
    -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted accumulatedAggregationStats](self, "accumulatedAggregationStats");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accumulatedAggregationStats");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v19 = 0;
LABEL_16:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double uiWaitTimeInSeconds;
  double v6;
  long double v7;
  double v8;

  v3 = -[NSString hash](self->_modelVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uiWaitTimeInSeconds = self->_uiWaitTimeInSeconds;
    v6 = -uiWaitTimeInSeconds;
    if (uiWaitTimeInSeconds >= 0.0)
      v6 = self->_uiWaitTimeInSeconds;
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
  return v4 ^ v3 ^ -[MHSchemaMHUserEngagementAccumulatedAggregationStats hash](self->_accumulatedAggregationStats, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accumulatedAggregationStats)
  {
    -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted accumulatedAggregationStats](self, "accumulatedAggregationStats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accumulatedAggregationStats"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accumulatedAggregationStats"));

    }
  }
  if (self->_modelVersion)
  {
    -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted modelVersion](self, "modelVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("modelVersion"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted uiWaitTimeInSeconds](self, "uiWaitTimeInSeconds");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("uiWaitTimeInSeconds"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHUserEngagementFalseTriggerMitigationStarted)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHUserEngagementFalseTriggerMitigationStarted *v5;
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
    self = -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHUserEngagementFalseTriggerMitigationStarted)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHUserEngagementFalseTriggerMitigationStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MHSchemaMHUserEngagementAccumulatedAggregationStats *v10;
  MHSchemaMHUserEngagementFalseTriggerMitigationStarted *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHUserEngagementFalseTriggerMitigationStarted;
  v5 = -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted setModelVersion:](v5, "setModelVersion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uiWaitTimeInSeconds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted setUiWaitTimeInSeconds:](v5, "setUiWaitTimeInSeconds:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accumulatedAggregationStats"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[MHSchemaMHUserEngagementAccumulatedAggregationStats initWithDictionary:]([MHSchemaMHUserEngagementAccumulatedAggregationStats alloc], "initWithDictionary:", v9);
      -[MHSchemaMHUserEngagementFalseTriggerMitigationStarted setAccumulatedAggregationStats:](v5, "setAccumulatedAggregationStats:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)uiWaitTimeInSeconds
{
  return self->_uiWaitTimeInSeconds;
}

- (MHSchemaMHUserEngagementAccumulatedAggregationStats)accumulatedAggregationStats
{
  return self->_accumulatedAggregationStats;
}

- (void)setAccumulatedAggregationStats:(id)a3
{
  objc_storeStrong((id *)&self->_accumulatedAggregationStats, a3);
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAccumulatedAggregationStats:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedAggregationStats, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

@end
