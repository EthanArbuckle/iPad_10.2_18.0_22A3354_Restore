@implementation EXPSiriSchemaEXPServerCounterfactualTriggeredTier1

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
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EXPSiriSchemaEXPServerCounterfactualTriggeredTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v23, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 allocations](self, "allocations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setAllocations:](self, "setAllocations:", v7);

  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 codepathId](self, "codepathId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suppressMessage");

  if (v10)
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 deleteCodepathId](self, "deleteCodepathId");
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 pegasusId](self, "pegasusId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 deletePegasusId](self, "deletePegasusId");
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualAllocations](self, "counterfactualAllocations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v14, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setCounterfactualAllocations:](self, "setCounterfactualAllocations:", v15);

  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 treatmentSummary](self, "treatmentSummary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "applySensitiveConditionsPolicy:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "suppressMessage");

  if (v18)
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 deleteTreatmentSummary](self, "deleteTreatmentSummary");
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualSummary](self, "counterfactualSummary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "applySensitiveConditionsPolicy:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "suppressMessage");

  if (v21)
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 deleteCounterfactualSummary](self, "deleteCounterfactualSummary");

  return v5;
}

- (void)clearAllocation
{
  -[NSArray removeAllObjects](self->_allocations, "removeAllObjects");
}

- (void)addAllocation:(id)a3
{
  id v4;
  NSArray *allocations;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  allocations = self->_allocations;
  v8 = v4;
  if (!allocations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_allocations;
    self->_allocations = v6;

    v4 = v8;
    allocations = self->_allocations;
  }
  -[NSArray addObject:](allocations, "addObject:", v4);

}

- (unint64_t)allocationCount
{
  return -[NSArray count](self->_allocations, "count");
}

- (id)allocationAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_allocations, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasCodepathId
{
  return self->_codepathId != 0;
}

- (void)deleteCodepathId
{
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setCodepathId:](self, "setCodepathId:", 0);
}

- (BOOL)hasPegasusId
{
  return self->_pegasusId != 0;
}

- (void)deletePegasusId
{
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setPegasusId:](self, "setPegasusId:", 0);
}

- (void)clearCounterfactualAllocation
{
  -[NSArray removeAllObjects](self->_counterfactualAllocations, "removeAllObjects");
}

- (void)addCounterfactualAllocation:(id)a3
{
  id v4;
  NSArray *counterfactualAllocations;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  counterfactualAllocations = self->_counterfactualAllocations;
  v8 = v4;
  if (!counterfactualAllocations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_counterfactualAllocations;
    self->_counterfactualAllocations = v6;

    v4 = v8;
    counterfactualAllocations = self->_counterfactualAllocations;
  }
  -[NSArray addObject:](counterfactualAllocations, "addObject:", v4);

}

- (unint64_t)counterfactualAllocationCount
{
  return -[NSArray count](self->_counterfactualAllocations, "count");
}

- (id)counterfactualAllocationAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_counterfactualAllocations, "objectAtIndexedSubscript:", a3);
}

- (void)setIsCounterfactualDifferent:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isCounterfactualDifferent = a3;
}

- (BOOL)hasIsCounterfactualDifferent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsCounterfactualDifferent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsCounterfactualDifferent
{
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setIsCounterfactualDifferent:](self, "setIsCounterfactualDifferent:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCompareRankingAtK:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_compareRankingAtK = a3;
}

- (BOOL)hasCompareRankingAtK
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCompareRankingAtK:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCompareRankingAtK
{
  double v2;

  LODWORD(v2) = 0;
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setCompareRankingAtK:](self, "setCompareRankingAtK:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setKValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_kValue = a3;
}

- (BOOL)hasKValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasKValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteKValue
{
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setKValue:](self, "setKValue:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setDiffOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_diffOutcome = a3;
}

- (BOOL)hasDiffOutcome
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasDiffOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteDiffOutcome
{
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setDiffOutcome:](self, "setDiffOutcome:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasTreatmentSummary
{
  return self->_treatmentSummary != 0;
}

- (void)deleteTreatmentSummary
{
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setTreatmentSummary:](self, "setTreatmentSummary:", 0);
}

- (BOOL)hasCounterfactualSummary
{
  return self->_counterfactualSummary != 0;
}

- (void)deleteCounterfactualSummary
{
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setCounterfactualSummary:](self, "setCounterfactualSummary:", 0);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return EXPSiriSchemaEXPServerCounterfactualTriggeredTier1ReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  char has;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_allocations;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 codepathId](self, "codepathId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 codepathId](self, "codepathId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 pegasusId](self, "pegasusId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 pegasusId](self, "pegasusId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_counterfactualAllocations;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_21:
      if ((has & 4) == 0)
        goto LABEL_22;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_22:
    if ((has & 8) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_31:
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_23:
    PBDataWriterWriteInt32Field();
LABEL_24:
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 treatmentSummary](self, "treatmentSummary", v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 treatmentSummary](self, "treatmentSummary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualSummary](self, "counterfactualSummary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualSummary](self, "counterfactualSummary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  $CC07B3F0AB7B5DADFB069DF7BB7D08AC has;
  unsigned int v28;
  int isCounterfactualDifferent;
  int v30;
  float compareRankingAtK;
  float v32;
  int v33;
  int64_t kValue;
  int v35;
  int diffOutcome;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  BOOL v47;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 allocations](self, "allocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allocations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 allocations](self, "allocations");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 allocations](self, "allocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_47;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 codepathId](self, "codepathId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codepathId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 codepathId](self, "codepathId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 codepathId](self, "codepathId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "codepathId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_47;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 pegasusId](self, "pegasusId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 pegasusId](self, "pegasusId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 pegasusId](self, "pegasusId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_47;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualAllocations](self, "counterfactualAllocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "counterfactualAllocations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualAllocations](self, "counterfactualAllocations");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualAllocations](self, "counterfactualAllocations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "counterfactualAllocations");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_47;
  }
  else
  {

  }
  has = self->_has;
  v28 = v4[80];
  if ((*(_BYTE *)&has & 1) != (v28 & 1))
    goto LABEL_47;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isCounterfactualDifferent = self->_isCounterfactualDifferent;
    if (isCounterfactualDifferent != objc_msgSend(v4, "isCounterfactualDifferent"))
      goto LABEL_47;
    has = self->_has;
    v28 = v4[80];
  }
  v30 = (*(unsigned int *)&has >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1))
    goto LABEL_47;
  if (v30)
  {
    compareRankingAtK = self->_compareRankingAtK;
    objc_msgSend(v4, "compareRankingAtK");
    if (compareRankingAtK != v32)
      goto LABEL_47;
    has = self->_has;
    v28 = v4[80];
  }
  v33 = (*(unsigned int *)&has >> 2) & 1;
  if (v33 != ((v28 >> 2) & 1))
    goto LABEL_47;
  if (v33)
  {
    kValue = self->_kValue;
    if (kValue != objc_msgSend(v4, "kValue"))
      goto LABEL_47;
    has = self->_has;
    v28 = v4[80];
  }
  v35 = (*(unsigned int *)&has >> 3) & 1;
  if (v35 != ((v28 >> 3) & 1))
    goto LABEL_47;
  if (v35)
  {
    diffOutcome = self->_diffOutcome;
    if (diffOutcome != objc_msgSend(v4, "diffOutcome"))
      goto LABEL_47;
  }
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 treatmentSummary](self, "treatmentSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "treatmentSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 treatmentSummary](self, "treatmentSummary");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 treatmentSummary](self, "treatmentSummary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "treatmentSummary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_47;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualSummary](self, "counterfactualSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "counterfactualSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_46:

    goto LABEL_47;
  }
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualSummary](self, "counterfactualSummary");
  v42 = objc_claimAutoreleasedReturnValue();
  if (!v42)
  {

LABEL_50:
    v47 = 1;
    goto LABEL_48;
  }
  v43 = (void *)v42;
  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualSummary](self, "counterfactualSummary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "counterfactualSummary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v44, "isEqual:", v45);

  if ((v46 & 1) != 0)
    goto LABEL_50;
LABEL_47:
  v47 = 0;
LABEL_48:

  return v47;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  float compareRankingAtK;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v3 = -[NSArray hash](self->_allocations, "hash");
  v4 = -[SISchemaUUID hash](self->_codepathId, "hash");
  v5 = -[SISchemaUUID hash](self->_pegasusId, "hash");
  v6 = -[NSArray hash](self->_counterfactualAllocations, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v8 = 2654435761 * self->_isCounterfactualDifferent;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v13 = 0;
    goto LABEL_11;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  compareRankingAtK = self->_compareRankingAtK;
  v10 = compareRankingAtK;
  if (compareRankingAtK < 0.0)
    v10 = -compareRankingAtK;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    v14 = 2654435761 * self->_kValue;
    if ((has & 8) != 0)
      goto LABEL_13;
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  v14 = 0;
  if ((has & 8) == 0)
    goto LABEL_15;
LABEL_13:
  v15 = 2654435761 * self->_diffOutcome;
LABEL_16:
  v16 = v4 ^ v3 ^ v5 ^ v6;
  v17 = v8 ^ v13 ^ v14 ^ v15 ^ -[EXPSiriSchemaEXPSiriPegasusResponseSummary hash](self->_treatmentSummary, "hash");
  return v16 ^ v17 ^ -[EXPSiriSchemaEXPSiriPegasusResponseSummary hash](self->_counterfactualSummary, "hash");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char has;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_allocations, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v5 = self->_allocations;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("allocation"));
  }
  if (self->_codepathId)
  {
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 codepathId](self, "codepathId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("codepathId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("codepathId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 compareRankingAtK](self, "compareRankingAtK");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("compareRankingAtK"));

  }
  if (-[NSArray count](self->_counterfactualAllocations, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v18 = self->_counterfactualAllocations;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v17, "addObject:", v23);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);

          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("counterfactualAllocation"));
  }
  if (self->_counterfactualSummary)
  {
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 counterfactualSummary](self, "counterfactualSummary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("counterfactualSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("counterfactualSummary"));

    }
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v32 = -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 diffOutcome](self, "diffOutcome") - 1;
    if (v32 > 0x10)
      v33 = CFSTR("EXPSIRIDIFFOUTCOME_UNKNOWN");
    else
      v33 = off_1E562D458[v32];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("diffOutcome"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_39:
      if ((has & 4) == 0)
        goto LABEL_41;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 isCounterfactualDifferent](self, "isCounterfactualDifferent"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isCounterfactualDifferent"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 kValue](self, "kValue"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("kValue"));

  }
LABEL_41:
  if (self->_pegasusId)
  {
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 pegasusId](self, "pegasusId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("pegasusId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("pegasusId"));

    }
  }
  if (self->_treatmentSummary)
  {
    -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 treatmentSummary](self, "treatmentSummary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("treatmentSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("treatmentSummary"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1)initWithJSON:(id)a3
{
  void *v4;
  EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *v5;
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
    self = -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (EXPSiriSchemaEXPServerCounterfactualTriggeredTier1)initWithDictionary:(id)a3
{
  id v4;
  EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  EXPSchemaEXPTrialExperiment *v13;
  uint64_t v14;
  SISchemaUUID *v15;
  uint64_t v16;
  SISchemaUUID *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  EXPSchemaEXPTrialExperiment *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  EXPSiriSchemaEXPSiriPegasusResponseSummary *v31;
  void *v32;
  EXPSiriSchemaEXPSiriPegasusResponseSummary *v33;
  EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)EXPSiriSchemaEXPServerCounterfactualTriggeredTier1;
  v5 = -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allocation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v45 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[EXPSchemaEXPTrialExperiment initWithDictionary:]([EXPSchemaEXPTrialExperiment alloc], "initWithDictionary:", v12);
              -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 addAllocation:](v5, "addAllocation:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("codepathId"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v14);
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setCodepathId:](v5, "setCodepathId:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusId"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v16);
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setPegasusId:](v5, "setPegasusId:", v17);

    }
    v37 = (void *)v16;
    v38 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("counterfactualAllocation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v41 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = -[EXPSchemaEXPTrialExperiment initWithDictionary:]([EXPSchemaEXPTrialExperiment alloc], "initWithDictionary:", v24);
              -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 addCounterfactualAllocation:](v5, "addCounterfactualAllocation:", v25);

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        }
        while (v21);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCounterfactualDifferent"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setIsCounterfactualDifferent:](v5, "setIsCounterfactualDifferent:", objc_msgSend(v26, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compareRankingAtK"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v27, "floatValue");
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setCompareRankingAtK:](v5, "setCompareRankingAtK:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kValue"), v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setKValue:](v5, "setKValue:", objc_msgSend(v28, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("diffOutcome"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setDiffOutcome:](v5, "setDiffOutcome:", objc_msgSend(v29, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("treatmentSummary"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[EXPSiriSchemaEXPSiriPegasusResponseSummary initWithDictionary:]([EXPSiriSchemaEXPSiriPegasusResponseSummary alloc], "initWithDictionary:", v30);
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setTreatmentSummary:](v5, "setTreatmentSummary:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("counterfactualSummary"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[EXPSiriSchemaEXPSiriPegasusResponseSummary initWithDictionary:]([EXPSiriSchemaEXPSiriPegasusResponseSummary alloc], "initWithDictionary:", v32);
      -[EXPSiriSchemaEXPServerCounterfactualTriggeredTier1 setCounterfactualSummary:](v5, "setCounterfactualSummary:", v33);

    }
    v34 = v5;

  }
  return v5;
}

- (NSArray)allocations
{
  return self->_allocations;
}

- (void)setAllocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaUUID)codepathId
{
  return self->_codepathId;
}

- (void)setCodepathId:(id)a3
{
  objc_storeStrong((id *)&self->_codepathId, a3);
}

- (SISchemaUUID)pegasusId
{
  return self->_pegasusId;
}

- (void)setPegasusId:(id)a3
{
  objc_storeStrong((id *)&self->_pegasusId, a3);
}

- (NSArray)counterfactualAllocations
{
  return self->_counterfactualAllocations;
}

- (void)setCounterfactualAllocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isCounterfactualDifferent
{
  return self->_isCounterfactualDifferent;
}

- (float)compareRankingAtK
{
  return self->_compareRankingAtK;
}

- (int64_t)kValue
{
  return self->_kValue;
}

- (int)diffOutcome
{
  return self->_diffOutcome;
}

- (EXPSiriSchemaEXPSiriPegasusResponseSummary)treatmentSummary
{
  return self->_treatmentSummary;
}

- (void)setTreatmentSummary:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentSummary, a3);
}

- (EXPSiriSchemaEXPSiriPegasusResponseSummary)counterfactualSummary
{
  return self->_counterfactualSummary;
}

- (void)setCounterfactualSummary:(id)a3
{
  objc_storeStrong((id *)&self->_counterfactualSummary, a3);
}

- (void)setHasCodepathId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPegasusId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTreatmentSummary:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasCounterfactualSummary:(BOOL)a3
{
  self->_hasCodepathId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterfactualSummary, 0);
  objc_storeStrong((id *)&self->_treatmentSummary, 0);
  objc_storeStrong((id *)&self->_counterfactualAllocations, 0);
  objc_storeStrong((id *)&self->_pegasusId, 0);
  objc_storeStrong((id *)&self->_codepathId, 0);
  objc_storeStrong((id *)&self->_allocations, 0);
}

@end
