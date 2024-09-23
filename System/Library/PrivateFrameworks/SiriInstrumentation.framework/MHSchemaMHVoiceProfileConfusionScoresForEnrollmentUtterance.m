@implementation MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance

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
  v9.super_class = (Class)MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance voiceProfileConfusionScores](self, "voiceProfileConfusionScores", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance setVoiceProfileConfusionScores:](self, "setVoiceProfileConfusionScores:", v7);
  return v5;
}

- (void)setEnrollmentUtteranceNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enrollmentUtteranceNumber = a3;
}

- (BOOL)hasEnrollmentUtteranceNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEnrollmentUtteranceNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEnrollmentUtteranceNumber
{
  -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance setEnrollmentUtteranceNumber:](self, "setEnrollmentUtteranceNumber:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearVoiceProfileConfusionScores
{
  -[NSArray removeAllObjects](self->_voiceProfileConfusionScores, "removeAllObjects");
}

- (void)addVoiceProfileConfusionScores:(id)a3
{
  id v4;
  NSArray *voiceProfileConfusionScores;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  voiceProfileConfusionScores = self->_voiceProfileConfusionScores;
  v8 = v4;
  if (!voiceProfileConfusionScores)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_voiceProfileConfusionScores;
    self->_voiceProfileConfusionScores = v6;

    v4 = v8;
    voiceProfileConfusionScores = self->_voiceProfileConfusionScores;
  }
  -[NSArray addObject:](voiceProfileConfusionScores, "addObject:", v4);

}

- (unint64_t)voiceProfileConfusionScoresCount
{
  return -[NSArray count](self->_voiceProfileConfusionScores, "count");
}

- (id)voiceProfileConfusionScoresAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_voiceProfileConfusionScores, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtteranceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_voiceProfileConfusionScores;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int enrollmentUtteranceNumber;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (enrollmentUtteranceNumber = self->_enrollmentUtteranceNumber,
            enrollmentUtteranceNumber == objc_msgSend(v4, "enrollmentUtteranceNumber")))
      {
        -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance voiceProfileConfusionScores](self, "voiceProfileConfusionScores");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "voiceProfileConfusionScores");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance voiceProfileConfusionScores](self, "voiceProfileConfusionScores");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance voiceProfileConfusionScores](self, "voiceProfileConfusionScores");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "voiceProfileConfusionScores");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_enrollmentUtteranceNumber;
  else
    v2 = 0;
  return -[NSArray hash](self->_voiceProfileConfusionScores, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance enrollmentUtteranceNumber](self, "enrollmentUtteranceNumber"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("enrollmentUtteranceNumber"));

  }
  if (-[NSArray count](self->_voiceProfileConfusionScores, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_voiceProfileConfusionScores;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v5, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("voiceProfileConfusionScores"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v14);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *v5;
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
    self = -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MHSchemaMHVoiceProfileConfusionScore *v14;
  MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance;
  v5 = -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentUtteranceNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance setEnrollmentUtteranceNumber:](v5, "setEnrollmentUtteranceNumber:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceProfileConfusionScores"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v6;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[MHSchemaMHVoiceProfileConfusionScore initWithDictionary:]([MHSchemaMHVoiceProfileConfusionScore alloc], "initWithDictionary:", v13);
              -[MHSchemaMHVoiceProfileConfusionScoresForEnrollmentUtterance addVoiceProfileConfusionScores:](v5, "addVoiceProfileConfusionScores:", v14);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v10);
      }

      v6 = v17;
    }
    v15 = v5;

  }
  return v5;
}

- (unsigned)enrollmentUtteranceNumber
{
  return self->_enrollmentUtteranceNumber;
}

- (NSArray)voiceProfileConfusionScores
{
  return self->_voiceProfileConfusionScores;
}

- (void)setVoiceProfileConfusionScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfileConfusionScores, 0);
}

@end
