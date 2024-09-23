@implementation SISchemaSelfTriggerSuppressionMetrics

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
  v9.super_class = (Class)SISchemaSelfTriggerSuppressionMetrics;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaSelfTriggerSuppressionMetrics selfTriggerSuppressionSessions](self, "selfTriggerSuppressionSessions", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SISchemaSelfTriggerSuppressionMetrics setSelfTriggerSuppressionSessions:](self, "setSelfTriggerSuppressionSessions:", v7);
  return v5;
}

- (void)setNumSelfTriggersDetected:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numSelfTriggersDetected = a3;
}

- (BOOL)hasNumSelfTriggersDetected
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumSelfTriggersDetected:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumSelfTriggersDetected
{
  -[SISchemaSelfTriggerSuppressionMetrics setNumSelfTriggersDetected:](self, "setNumSelfTriggersDetected:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDurationSelfTriggerSuppressionWasActiveInSeconds:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_durationSelfTriggerSuppressionWasActiveInSeconds = a3;
}

- (BOOL)hasDurationSelfTriggerSuppressionWasActiveInSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDurationSelfTriggerSuppressionWasActiveInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDurationSelfTriggerSuppressionWasActiveInSeconds
{
  -[SISchemaSelfTriggerSuppressionMetrics setDurationSelfTriggerSuppressionWasActiveInSeconds:](self, "setDurationSelfTriggerSuppressionWasActiveInSeconds:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearSelfTriggerSuppressionSessions
{
  -[NSArray removeAllObjects](self->_selfTriggerSuppressionSessions, "removeAllObjects");
}

- (void)addSelfTriggerSuppressionSessions:(id)a3
{
  id v4;
  NSArray *selfTriggerSuppressionSessions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  selfTriggerSuppressionSessions = self->_selfTriggerSuppressionSessions;
  v8 = v4;
  if (!selfTriggerSuppressionSessions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_selfTriggerSuppressionSessions;
    self->_selfTriggerSuppressionSessions = v6;

    v4 = v8;
    selfTriggerSuppressionSessions = self->_selfTriggerSuppressionSessions;
  }
  -[NSArray addObject:](selfTriggerSuppressionSessions, "addObject:", v4);

}

- (unint64_t)selfTriggerSuppressionSessionsCount
{
  return -[NSArray count](self->_selfTriggerSuppressionSessions, "count");
}

- (id)selfTriggerSuppressionSessionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_selfTriggerSuppressionSessions, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaSelfTriggerSuppressionMetricsReadFrom(self, (uint64_t)a3);
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_selfTriggerSuppressionSessions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $571A6FCFD627308075324C3C695AF493 has;
  unsigned int v6;
  int numSelfTriggersDetected;
  int v8;
  double durationSelfTriggerSuppressionWasActiveInSeconds;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numSelfTriggersDetected = self->_numSelfTriggersDetected;
    if (numSelfTriggersDetected != objc_msgSend(v4, "numSelfTriggersDetected"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (durationSelfTriggerSuppressionWasActiveInSeconds = self->_durationSelfTriggerSuppressionWasActiveInSeconds,
          objc_msgSend(v4, "durationSelfTriggerSuppressionWasActiveInSeconds"),
          durationSelfTriggerSuppressionWasActiveInSeconds == v10))
    {
      -[SISchemaSelfTriggerSuppressionMetrics selfTriggerSuppressionSessions](self, "selfTriggerSuppressionSessions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "selfTriggerSuppressionSessions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if ((v11 == 0) != (v12 != 0))
      {
        -[SISchemaSelfTriggerSuppressionMetrics selfTriggerSuppressionSessions](self, "selfTriggerSuppressionSessions");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {

LABEL_17:
          v19 = 1;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        -[SISchemaSelfTriggerSuppressionMetrics selfTriggerSuppressionSessions](self, "selfTriggerSuppressionSessions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "selfTriggerSuppressionSessions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if ((v18 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v19 = 0;
LABEL_15:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  double durationSelfTriggerSuppressionWasActiveInSeconds;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_numSelfTriggersDetected;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    return v8 ^ v3 ^ -[NSArray hash](self->_selfTriggerSuppressionSessions, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  durationSelfTriggerSuppressionWasActiveInSeconds = self->_durationSelfTriggerSuppressionWasActiveInSeconds;
  v5 = -durationSelfTriggerSuppressionWasActiveInSeconds;
  if (durationSelfTriggerSuppressionWasActiveInSeconds >= 0.0)
    v5 = self->_durationSelfTriggerSuppressionWasActiveInSeconds;
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
  return v8 ^ v3 ^ -[NSArray hash](self->_selfTriggerSuppressionSessions, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[SISchemaSelfTriggerSuppressionMetrics durationSelfTriggerSuppressionWasActiveInSeconds](self, "durationSelfTriggerSuppressionWasActiveInSeconds");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("durationSelfTriggerSuppressionWasActiveInSeconds"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaSelfTriggerSuppressionMetrics numSelfTriggersDetected](self, "numSelfTriggersDetected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numSelfTriggersDetected"));

  }
  if (-[NSArray count](self->_selfTriggerSuppressionSessions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = self->_selfTriggerSuppressionSessions;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("selfTriggerSuppressionSessions"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v17);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaSelfTriggerSuppressionMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaSelfTriggerSuppressionMetrics)initWithJSON:(id)a3
{
  void *v4;
  SISchemaSelfTriggerSuppressionMetrics *v5;
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
    self = -[SISchemaSelfTriggerSuppressionMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaSelfTriggerSuppressionMetrics)initWithDictionary:(id)a3
{
  id v4;
  SISchemaSelfTriggerSuppressionMetrics *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MHSchemaMHSelfTriggerSuppressionSession *v15;
  SISchemaSelfTriggerSuppressionMetrics *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SISchemaSelfTriggerSuppressionMetrics;
  v5 = -[SISchemaSelfTriggerSuppressionMetrics init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelfTriggersDetected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaSelfTriggerSuppressionMetrics setNumSelfTriggersDetected:](v5, "setNumSelfTriggersDetected:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("durationSelfTriggerSuppressionWasActiveInSeconds"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[SISchemaSelfTriggerSuppressionMetrics setDurationSelfTriggerSuppressionWasActiveInSeconds:](v5, "setDurationSelfTriggerSuppressionWasActiveInSeconds:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selfTriggerSuppressionSessions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v7;
      v19 = v6;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[MHSchemaMHSelfTriggerSuppressionSession initWithDictionary:]([MHSchemaMHSelfTriggerSuppressionSession alloc], "initWithDictionary:", v14);
              -[SISchemaSelfTriggerSuppressionMetrics addSelfTriggerSuppressionSessions:](v5, "addSelfTriggerSuppressionSessions:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v11);
      }

      v7 = v18;
      v6 = v19;
    }
    v16 = v5;

  }
  return v5;
}

- (int)numSelfTriggersDetected
{
  return self->_numSelfTriggersDetected;
}

- (double)durationSelfTriggerSuppressionWasActiveInSeconds
{
  return self->_durationSelfTriggerSuppressionWasActiveInSeconds;
}

- (NSArray)selfTriggerSuppressionSessions
{
  return self->_selfTriggerSuppressionSessions;
}

- (void)setSelfTriggerSuppressionSessions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfTriggerSuppressionSessions, 0);
}

@end
