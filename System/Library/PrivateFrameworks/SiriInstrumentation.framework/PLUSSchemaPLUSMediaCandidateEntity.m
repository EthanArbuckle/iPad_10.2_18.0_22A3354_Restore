@implementation PLUSSchemaPLUSMediaCandidateEntity

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

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSMediaCandidateEntity;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[PLUSSchemaPLUSMediaCandidateEntity deleteEntityAdamId](self, "deleteEntityAdamId");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[PLUSSchemaPLUSMediaCandidateEntity deleteEntityAdamId](self, "deleteEntityAdamId");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[PLUSSchemaPLUSMediaCandidateEntity deleteEntityAdamId](self, "deleteEntityAdamId");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[PLUSSchemaPLUSMediaCandidateEntity deleteEntityAdamId](self, "deleteEntityAdamId");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[PLUSSchemaPLUSMediaCandidateEntity deleteEntityAdamId](self, "deleteEntityAdamId");
  -[PLUSSchemaPLUSMediaCandidateEntity entityFeedbackHistorys](self, "entityFeedbackHistorys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSMediaCandidateEntity setEntityFeedbackHistorys:](self, "setEntityFeedbackHistorys:", v7);

  return v5;
}

- (BOOL)hasEntityAdamId
{
  return self->_entityAdamId != 0;
}

- (void)deleteEntityAdamId
{
  -[PLUSSchemaPLUSMediaCandidateEntity setEntityAdamId:](self, "setEntityAdamId:", 0);
}

- (void)setNominated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_nominated = a3;
}

- (BOOL)hasNominated
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNominated:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNominated
{
  -[PLUSSchemaPLUSMediaCandidateEntity setNominated:](self, "setNominated:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setConfidence:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_confidence = a3;
}

- (BOOL)hasConfidence
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteConfidence
{
  -[PLUSSchemaPLUSMediaCandidateEntity setConfidence:](self, "setConfidence:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearEntityFeedbackHistory
{
  -[NSArray removeAllObjects](self->_entityFeedbackHistorys, "removeAllObjects");
}

- (void)addEntityFeedbackHistory:(id)a3
{
  id v4;
  NSArray *entityFeedbackHistorys;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  entityFeedbackHistorys = self->_entityFeedbackHistorys;
  v8 = v4;
  if (!entityFeedbackHistorys)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_entityFeedbackHistorys;
    self->_entityFeedbackHistorys = v6;

    v4 = v8;
    entityFeedbackHistorys = self->_entityFeedbackHistorys;
  }
  -[NSArray addObject:](entityFeedbackHistorys, "addObject:", v4);

}

- (unint64_t)entityFeedbackHistoryCount
{
  return -[NSArray count](self->_entityFeedbackHistorys, "count");
}

- (id)entityFeedbackHistoryAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_entityFeedbackHistorys, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaCandidateEntityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLUSSchemaPLUSMediaCandidateEntity entityAdamId](self, "entityAdamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_entityFeedbackHistorys;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $0C281733219A92D78213A4AECD4B2E07 has;
  unsigned int v13;
  int nominated;
  int v15;
  double confidence;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[PLUSSchemaPLUSMediaCandidateEntity entityAdamId](self, "entityAdamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityAdamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_18;
  -[PLUSSchemaPLUSMediaCandidateEntity entityAdamId](self, "entityAdamId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSMediaCandidateEntity entityAdamId](self, "entityAdamId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityAdamId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    nominated = self->_nominated;
    if (nominated != objc_msgSend(v4, "nominated"))
      goto LABEL_19;
    has = self->_has;
    v13 = v4[40];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_19;
  if (v15)
  {
    confidence = self->_confidence;
    objc_msgSend(v4, "confidence");
    if (confidence != v17)
      goto LABEL_19;
  }
  -[PLUSSchemaPLUSMediaCandidateEntity entityFeedbackHistorys](self, "entityFeedbackHistorys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityFeedbackHistorys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[PLUSSchemaPLUSMediaCandidateEntity entityFeedbackHistorys](self, "entityFeedbackHistorys");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

LABEL_22:
    v23 = 1;
    goto LABEL_20;
  }
  v19 = (void *)v18;
  -[PLUSSchemaPLUSMediaCandidateEntity entityFeedbackHistorys](self, "entityFeedbackHistorys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityFeedbackHistorys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if ((v22 & 1) != 0)
    goto LABEL_22;
LABEL_19:
  v23 = 0;
LABEL_20:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  double confidence;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_entityAdamId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_nominated;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v9 ^ -[NSArray hash](self->_entityFeedbackHistorys, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  confidence = self->_confidence;
  v6 = -confidence;
  if (confidence >= 0.0)
    v6 = self->_confidence;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9 ^ -[NSArray hash](self->_entityFeedbackHistorys, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
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
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[PLUSSchemaPLUSMediaCandidateEntity confidence](self, "confidence");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("confidence"));

  }
  if (self->_entityAdamId)
  {
    -[PLUSSchemaPLUSMediaCandidateEntity entityAdamId](self, "entityAdamId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entityAdamId"));

  }
  if (-[NSArray count](self->_entityFeedbackHistorys, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_entityFeedbackHistorys;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation");
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
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("entityFeedbackHistory"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSMediaCandidateEntity nominated](self, "nominated"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("nominated"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSMediaCandidateEntity dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSMediaCandidateEntity)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSMediaCandidateEntity *v5;
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
    self = -[PLUSSchemaPLUSMediaCandidateEntity initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSMediaCandidateEntity)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSMediaCandidateEntity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  PLUSSchemaPLUSMediaContributingGroundTruth *v17;
  PLUSSchemaPLUSMediaCandidateEntity *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PLUSSchemaPLUSMediaCandidateEntity;
  v5 = -[PLUSSchemaPLUSMediaCandidateEntity init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityAdamId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PLUSSchemaPLUSMediaCandidateEntity setEntityAdamId:](v5, "setEntityAdamId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nominated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSMediaCandidateEntity setNominated:](v5, "setNominated:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[PLUSSchemaPLUSMediaCandidateEntity setConfidence:](v5, "setConfidence:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityFeedbackHistory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v9;
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[PLUSSchemaPLUSMediaContributingGroundTruth initWithDictionary:]([PLUSSchemaPLUSMediaContributingGroundTruth alloc], "initWithDictionary:", v16);
              -[PLUSSchemaPLUSMediaCandidateEntity addEntityFeedbackHistory:](v5, "addEntityFeedbackHistory:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      v6 = v21;
      v9 = v20;
    }
    v18 = v5;

  }
  return v5;
}

- (NSString)entityAdamId
{
  return self->_entityAdamId;
}

- (void)setEntityAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)nominated
{
  return self->_nominated;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSArray)entityFeedbackHistorys
{
  return self->_entityFeedbackHistorys;
}

- (void)setEntityFeedbackHistorys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasEntityAdamId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityFeedbackHistorys, 0);
  objc_storeStrong((id *)&self->_entityAdamId, 0);
}

@end
