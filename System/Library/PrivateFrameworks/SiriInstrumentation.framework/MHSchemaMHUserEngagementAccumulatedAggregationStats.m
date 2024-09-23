@implementation MHSchemaMHUserEngagementAccumulatedAggregationStats

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
  v9.super_class = (Class)MHSchemaMHUserEngagementAccumulatedAggregationStats;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHUserEngagementAccumulatedAggregationStats aggregationStats](self, "aggregationStats", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MHSchemaMHUserEngagementAccumulatedAggregationStats setAggregationStats:](self, "setAggregationStats:", v7);
  return v5;
}

- (void)setAggregationStartTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_aggregationStartTimestamp = a3;
}

- (BOOL)hasAggregationStartTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAggregationStartTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAggregationStartTimestamp
{
  -[MHSchemaMHUserEngagementAccumulatedAggregationStats setAggregationStartTimestamp:](self, "setAggregationStartTimestamp:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumberOfDaysAggregation:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfDaysAggregation = a3;
}

- (BOOL)hasNumberOfDaysAggregation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumberOfDaysAggregation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumberOfDaysAggregation
{
  -[MHSchemaMHUserEngagementAccumulatedAggregationStats setNumberOfDaysAggregation:](self, "setNumberOfDaysAggregation:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearAggregationStats
{
  -[NSArray removeAllObjects](self->_aggregationStats, "removeAllObjects");
}

- (void)addAggregationStats:(id)a3
{
  id v4;
  NSArray *aggregationStats;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  aggregationStats = self->_aggregationStats;
  v8 = v4;
  if (!aggregationStats)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_aggregationStats;
    self->_aggregationStats = v6;

    v4 = v8;
    aggregationStats = self->_aggregationStats;
  }
  -[NSArray addObject:](aggregationStats, "addObject:", v4);

}

- (unint64_t)aggregationStatsCount
{
  return -[NSArray count](self->_aggregationStats, "count");
}

- (id)aggregationStatsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_aggregationStats, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasCohortType
{
  return self->_cohortType != 0;
}

- (void)deleteCohortType
{
  -[MHSchemaMHUserEngagementAccumulatedAggregationStats setCohortType:](self, "setCohortType:", 0);
}

- (void)setIntendedRequestRatio:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_intendedRequestRatio = a3;
}

- (BOOL)hasIntendedRequestRatio
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIntendedRequestRatio:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIntendedRequestRatio
{
  -[MHSchemaMHUserEngagementAccumulatedAggregationStats setIntendedRequestRatio:](self, "setIntendedRequestRatio:", 0.0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHUserEngagementAccumulatedAggregationStatsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_aggregationStats;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[MHSchemaMHUserEngagementAccumulatedAggregationStats cohortType](self, "cohortType", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteDoubleField();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $408C77E1ED155D510B53145B19C2D3BE has;
  unsigned int v6;
  double aggregationStartTimestamp;
  double v8;
  int v9;
  int numberOfDaysAggregation;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  int v25;
  double intendedRequestRatio;
  double v27;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = self->_has;
  v6 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    aggregationStartTimestamp = self->_aggregationStartTimestamp;
    objc_msgSend(v4, "aggregationStartTimestamp");
    if (aggregationStartTimestamp != v8)
      goto LABEL_19;
    has = self->_has;
    v6 = v4[48];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_19;
  if (v9)
  {
    numberOfDaysAggregation = self->_numberOfDaysAggregation;
    if (numberOfDaysAggregation != objc_msgSend(v4, "numberOfDaysAggregation"))
      goto LABEL_19;
  }
  -[MHSchemaMHUserEngagementAccumulatedAggregationStats aggregationStats](self, "aggregationStats");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggregationStats");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_18;
  -[MHSchemaMHUserEngagementAccumulatedAggregationStats aggregationStats](self, "aggregationStats");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[MHSchemaMHUserEngagementAccumulatedAggregationStats aggregationStats](self, "aggregationStats");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aggregationStats");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_19;
  }
  else
  {

  }
  -[MHSchemaMHUserEngagementAccumulatedAggregationStats cohortType](self, "cohortType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cohortType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[MHSchemaMHUserEngagementAccumulatedAggregationStats cohortType](self, "cohortType");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[MHSchemaMHUserEngagementAccumulatedAggregationStats cohortType](self, "cohortType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cohortType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_19;
  }
  else
  {

  }
  v25 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v25 == ((v4[48] >> 2) & 1))
  {
    if (!v25
      || (intendedRequestRatio = self->_intendedRequestRatio,
          objc_msgSend(v4, "intendedRequestRatio"),
          intendedRequestRatio == v27))
    {
      v23 = 1;
      goto LABEL_20;
    }
  }
LABEL_19:
  v23 = 0;
LABEL_20:

  return v23;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double aggregationStartTimestamp;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  double intendedRequestRatio;
  double v14;
  long double v15;
  double v16;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    aggregationStartTimestamp = self->_aggregationStartTimestamp;
    v6 = -aggregationStartTimestamp;
    if (aggregationStartTimestamp >= 0.0)
      v6 = self->_aggregationStartTimestamp;
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
    v9 = 2654435761 * self->_numberOfDaysAggregation;
  else
    v9 = 0;
  v10 = -[NSArray hash](self->_aggregationStats, "hash");
  v11 = -[NSString hash](self->_cohortType, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    intendedRequestRatio = self->_intendedRequestRatio;
    v14 = -intendedRequestRatio;
    if (intendedRequestRatio >= 0.0)
      v14 = self->_intendedRequestRatio;
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
  return v9 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char has;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHUserEngagementAccumulatedAggregationStats aggregationStartTimestamp](self, "aggregationStartTimestamp");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aggregationStartTimestamp"));

  }
  if (-[NSArray count](self->_aggregationStats, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = self->_aggregationStats;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("aggregationStats"));
  }
  if (self->_cohortType)
  {
    -[MHSchemaMHUserEngagementAccumulatedAggregationStats cohortType](self, "cohortType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cohortType"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHUserEngagementAccumulatedAggregationStats intendedRequestRatio](self, "intendedRequestRatio");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("intendedRequestRatio"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MHSchemaMHUserEngagementAccumulatedAggregationStats numberOfDaysAggregation](self, "numberOfDaysAggregation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("numberOfDaysAggregation"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHUserEngagementAccumulatedAggregationStats dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHUserEngagementAccumulatedAggregationStats)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHUserEngagementAccumulatedAggregationStats *v5;
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
    self = -[MHSchemaMHUserEngagementAccumulatedAggregationStats initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHUserEngagementAccumulatedAggregationStats)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHUserEngagementAccumulatedAggregationStats *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  MHSchemaMHUserEngagementAggregatedStats *v15;
  void *v16;
  void *v17;
  void *v18;
  MHSchemaMHUserEngagementAccumulatedAggregationStats *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MHSchemaMHUserEngagementAccumulatedAggregationStats;
  v5 = -[MHSchemaMHUserEngagementAccumulatedAggregationStats init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregationStartTimestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[MHSchemaMHUserEngagementAccumulatedAggregationStats setAggregationStartTimestamp:](v5, "setAggregationStartTimestamp:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfDaysAggregation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHUserEngagementAccumulatedAggregationStats setNumberOfDaysAggregation:](v5, "setNumberOfDaysAggregation:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregationStats"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v7;
      v22 = v6;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[MHSchemaMHUserEngagementAggregatedStats initWithDictionary:]([MHSchemaMHUserEngagementAggregatedStats alloc], "initWithDictionary:", v14);
              -[MHSchemaMHUserEngagementAccumulatedAggregationStats addAggregationStats:](v5, "addAggregationStats:", v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v11);
      }

      v7 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cohortType"), v21, v22, (_QWORD)v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[MHSchemaMHUserEngagementAccumulatedAggregationStats setCohortType:](v5, "setCohortType:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intendedRequestRatio"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "doubleValue");
      -[MHSchemaMHUserEngagementAccumulatedAggregationStats setIntendedRequestRatio:](v5, "setIntendedRequestRatio:");
    }
    v19 = v5;

  }
  return v5;
}

- (double)aggregationStartTimestamp
{
  return self->_aggregationStartTimestamp;
}

- (int)numberOfDaysAggregation
{
  return self->_numberOfDaysAggregation;
}

- (NSArray)aggregationStats
{
  return self->_aggregationStats;
}

- (void)setAggregationStats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)cohortType
{
  return self->_cohortType;
}

- (void)setCohortType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)intendedRequestRatio
{
  return self->_intendedRequestRatio;
}

- (void)setHasCohortType:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortType, 0);
  objc_storeStrong((id *)&self->_aggregationStats, 0);
}

@end
