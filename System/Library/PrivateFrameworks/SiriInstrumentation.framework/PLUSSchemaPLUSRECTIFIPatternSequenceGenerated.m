@implementation PLUSSchemaPLUSRECTIFIPatternSequenceGenerated

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
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLUSSchemaPLUSRECTIFIPatternSequenceGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v17, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated patternId](self, "patternId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated deletePatternId](self, "deletePatternId");
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated sequences](self, "sequences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setSequences:](self, "setSequences:", v10);

  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated constraints](self, "constraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setConstraints:](self, "setConstraints:", v12);

  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated originalRequestId](self, "originalRequestId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applySensitiveConditionsPolicy:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "suppressMessage");

  if (v15)
    -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated deleteOriginalRequestId](self, "deleteOriginalRequestId");

  return v5;
}

- (BOOL)hasPatternId
{
  return self->_patternId != 0;
}

- (void)deletePatternId
{
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setPatternId:](self, "setPatternId:", 0);
}

- (void)clearSequence
{
  -[NSArray removeAllObjects](self->_sequences, "removeAllObjects");
}

- (void)addSequence:(id)a3
{
  id v4;
  NSArray *sequences;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  sequences = self->_sequences;
  v8 = v4;
  if (!sequences)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sequences;
    self->_sequences = v6;

    v4 = v8;
    sequences = self->_sequences;
  }
  -[NSArray addObject:](sequences, "addObject:", v4);

}

- (unint64_t)sequenceCount
{
  return -[NSArray count](self->_sequences, "count");
}

- (id)sequenceAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_sequences, "objectAtIndexedSubscript:", a3);
}

- (void)clearConstraints
{
  -[NSArray removeAllObjects](self->_constraints, "removeAllObjects");
}

- (void)addConstraints:(id)a3
{
  id v4;
  NSArray *constraints;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  constraints = self->_constraints;
  v8 = v4;
  if (!constraints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_constraints;
    self->_constraints = v6;

    v4 = v8;
    constraints = self->_constraints;
  }
  -[NSArray addObject:](constraints, "addObject:", v4);

}

- (unint64_t)constraintsCount
{
  return -[NSArray count](self->_constraints, "count");
}

- (id)constraintsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_constraints, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteOriginalRequestId
{
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setOriginalRequestId:](self, "setOriginalRequestId:", 0);
}

- (void)setNumberOfRequestsReviewed:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfRequestsReviewed = a3;
}

- (BOOL)hasNumberOfRequestsReviewed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumberOfRequestsReviewed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumberOfRequestsReviewed
{
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setNumberOfRequestsReviewed:](self, "setNumberOfRequestsReviewed:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumberOfUniqueRequestsReviewed:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfUniqueRequestsReviewed = a3;
}

- (BOOL)hasNumberOfUniqueRequestsReviewed
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumberOfUniqueRequestsReviewed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumberOfUniqueRequestsReviewed
{
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setNumberOfUniqueRequestsReviewed:](self, "setNumberOfUniqueRequestsReviewed:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSRECTIFIPatternSequenceGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char has;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated patternId](self, "patternId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated patternId](self, "patternId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_sequences;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->_constraints;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated originalRequestId](self, "originalRequestId", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated originalRequestId](self, "originalRequestId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  $A2B8C9D4A50C0138AC10A791CD9DA46A has;
  unsigned int v30;
  unsigned int numberOfRequestsReviewed;
  int v32;
  unsigned int numberOfUniqueRequestsReviewed;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated patternId](self, "patternId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "patternId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated patternId](self, "patternId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated patternId](self, "patternId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "patternId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated sequences](self, "sequences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sequences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated sequences](self, "sequences");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated sequences](self, "sequences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sequences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated constraints](self, "constraints");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated constraints](self, "constraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated originalRequestId](self, "originalRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated originalRequestId](self, "originalRequestId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated originalRequestId](self, "originalRequestId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalRequestId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_22;
  }
  else
  {

  }
  has = self->_has;
  v30 = v4[48];
  if ((*(_BYTE *)&has & 1) == (v30 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      numberOfRequestsReviewed = self->_numberOfRequestsReviewed;
      if (numberOfRequestsReviewed != objc_msgSend(v4, "numberOfRequestsReviewed"))
        goto LABEL_22;
      has = self->_has;
      v30 = v4[48];
    }
    v32 = (*(unsigned int *)&has >> 1) & 1;
    if (v32 == ((v30 >> 1) & 1))
    {
      if (!v32
        || (numberOfUniqueRequestsReviewed = self->_numberOfUniqueRequestsReviewed,
            numberOfUniqueRequestsReviewed == objc_msgSend(v4, "numberOfUniqueRequestsReviewed")))
      {
        v27 = 1;
        goto LABEL_23;
      }
    }
  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[SISchemaUUID hash](self->_patternId, "hash");
  v4 = -[NSArray hash](self->_sequences, "hash");
  v5 = -[NSArray hash](self->_constraints, "hash");
  v6 = -[SISchemaUUID hash](self->_originalRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_numberOfRequestsReviewed;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761 * self->_numberOfUniqueRequestsReviewed;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char has;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_constraints, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v5 = self->_constraints;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("constraints"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated numberOfRequestsReviewed](self, "numberOfRequestsReviewed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numberOfRequestsReviewed"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated numberOfUniqueRequestsReviewed](self, "numberOfUniqueRequestsReviewed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numberOfUniqueRequestsReviewed"));

  }
  if (self->_originalRequestId)
  {
    -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated originalRequestId](self, "originalRequestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("originalRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("originalRequestId"));

    }
  }
  if (self->_patternId)
  {
    -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated patternId](self, "patternId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("patternId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("patternId"));

    }
  }
  if (-[NSArray count](self->_sequences, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = self->_sequences;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v30);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v21, "addObject:", v27);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v28);

          }
        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("sequence"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v30);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *v5;
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
    self = -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  PLUSSchemaPLUSRECTIFIPatternItem *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  PLUSSchemaPLUSRECTIFIPatternConstraint *v23;
  void *v24;
  SISchemaUUID *v25;
  void *v26;
  void *v27;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PLUSSchemaPLUSRECTIFIPatternSequenceGenerated;
  v5 = -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setPatternId:](v5, "setPatternId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sequence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v30 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v37 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[PLUSSchemaPLUSRECTIFIPatternItem initWithDictionary:]([PLUSSchemaPLUSRECTIFIPatternItem alloc], "initWithDictionary:", v14);
              -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated addSequence:](v5, "addSequence:", v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v11);
      }

      v8 = v30;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("constraints"), v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = -[PLUSSchemaPLUSRECTIFIPatternConstraint initWithDictionary:]([PLUSSchemaPLUSRECTIFIPatternConstraint alloc], "initWithDictionary:", v22);
              -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated addConstraints:](v5, "addConstraints:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v19);
      }

      v8 = v31;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalRequestId"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v24);
      -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setOriginalRequestId:](v5, "setOriginalRequestId:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfRequestsReviewed"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setNumberOfRequestsReviewed:](v5, "setNumberOfRequestsReviewed:", objc_msgSend(v26, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfUniqueRequestsReviewed"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated setNumberOfUniqueRequestsReviewed:](v5, "setNumberOfUniqueRequestsReviewed:", objc_msgSend(v27, "unsignedIntValue"));
    v28 = v5;

  }
  return v5;
}

- (SISchemaUUID)patternId
{
  return self->_patternId;
}

- (void)setPatternId:(id)a3
{
  objc_storeStrong((id *)&self->_patternId, a3);
}

- (NSArray)sequences
{
  return self->_sequences;
}

- (void)setSequences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (void)setOriginalRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequestId, a3);
}

- (unsigned)numberOfRequestsReviewed
{
  return self->_numberOfRequestsReviewed;
}

- (unsigned)numberOfUniqueRequestsReviewed
{
  return self->_numberOfUniqueRequestsReviewed;
}

- (void)setHasPatternId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_sequences, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
}

@end
