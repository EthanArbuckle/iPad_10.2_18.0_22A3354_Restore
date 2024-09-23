@implementation FLSchemaFLInteractionDonationEnded

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
  int v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLSchemaFLInteractionDonationEnded;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLSchemaFLInteractionDonationEnded ifSessionId](self, "ifSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLSchemaFLInteractionDonationEnded deleteIfSessionId](self, "deleteIfSessionId");
  -[FLSchemaFLInteractionDonationEnded tuple](self, "tuple");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLSchemaFLInteractionDonationEnded deleteTuple](self, "deleteTuple");
  -[FLSchemaFLInteractionDonationEnded candidates](self, "candidates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLSchemaFLInteractionDonationEnded setCandidates:](self, "setCandidates:", v13);

  return v5;
}

- (void)setAbsoluteTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTime = a3;
}

- (BOOL)hasAbsoluteTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAbsoluteTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAbsoluteTime
{
  -[FLSchemaFLInteractionDonationEnded setAbsoluteTime:](self, "setAbsoluteTime:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDonationTime:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_donationTime = a3;
}

- (BOOL)hasDonationTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDonationTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDonationTime
{
  -[FLSchemaFLInteractionDonationEnded setDonationTime:](self, "setDonationTime:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasIfSessionId
{
  return self->_ifSessionId != 0;
}

- (void)deleteIfSessionId
{
  -[FLSchemaFLInteractionDonationEnded setIfSessionId:](self, "setIfSessionId:", 0);
}

- (void)setActionStatementId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_actionStatementId = a3;
}

- (BOOL)hasActionStatementId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasActionStatementId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteActionStatementId
{
  -[FLSchemaFLInteractionDonationEnded setActionStatementId:](self, "setActionStatementId:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setDonationTrigger:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_donationTrigger = a3;
}

- (BOOL)hasDonationTrigger
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasDonationTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteDonationTrigger
{
  -[FLSchemaFLInteractionDonationEnded setDonationTrigger:](self, "setDonationTrigger:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setWasTupleDonated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_wasTupleDonated = a3;
}

- (BOOL)hasWasTupleDonated
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasWasTupleDonated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteWasTupleDonated
{
  -[FLSchemaFLInteractionDonationEnded setWasTupleDonated:](self, "setWasTupleDonated:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasTuple
{
  return self->_tuple != 0;
}

- (void)deleteTuple
{
  -[FLSchemaFLInteractionDonationEnded setTuple:](self, "setTuple:", 0);
}

- (void)clearCandidates
{
  -[NSArray removeAllObjects](self->_candidates, "removeAllObjects");
}

- (void)addCandidates:(id)a3
{
  id v4;
  NSArray *candidates;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  candidates = self->_candidates;
  v8 = v4;
  if (!candidates)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_candidates;
    self->_candidates = v6;

    v4 = v8;
    candidates = self->_candidates;
  }
  -[NSArray addObject:](candidates, "addObject:", v4);

}

- (unint64_t)candidatesCount
{
  return -[NSArray count](self->_candidates, "count");
}

- (id)candidatesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_candidates, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLInteractionDonationEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();
  -[FLSchemaFLInteractionDonationEnded ifSessionId](self, "ifSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLSchemaFLInteractionDonationEnded ifSessionId](self, "ifSessionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v8 = (char)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v8 = (char)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_9:
      if ((v8 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:
  -[FLSchemaFLInteractionDonationEnded tuple](self, "tuple");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[FLSchemaFLInteractionDonationEnded tuple](self, "tuple");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_candidates;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $58D47CF7ED429C729BAD667AF3A171CD has;
  unsigned int v6;
  double absoluteTime;
  double v8;
  int v9;
  double donationTime;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  $58D47CF7ED429C729BAD667AF3A171CD v19;
  int v20;
  unsigned int v21;
  unsigned int actionStatementId;
  int v23;
  int donationTrigger;
  int v25;
  int wasTupleDonated;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  has = self->_has;
  v6 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_35;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    absoluteTime = self->_absoluteTime;
    objc_msgSend(v4, "absoluteTime");
    if (absoluteTime != v8)
      goto LABEL_35;
    has = self->_has;
    v6 = v4[64];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_35;
  if (v9)
  {
    donationTime = self->_donationTime;
    objc_msgSend(v4, "donationTime");
    if (donationTime != v11)
      goto LABEL_35;
  }
  -[FLSchemaFLInteractionDonationEnded ifSessionId](self, "ifSessionId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ifSessionId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_34;
  -[FLSchemaFLInteractionDonationEnded ifSessionId](self, "ifSessionId");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[FLSchemaFLInteractionDonationEnded ifSessionId](self, "ifSessionId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifSessionId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_35;
  }
  else
  {

  }
  v19 = self->_has;
  v20 = (*(unsigned int *)&v19 >> 2) & 1;
  v21 = v4[64];
  if (v20 != ((v21 >> 2) & 1))
    goto LABEL_35;
  if (v20)
  {
    actionStatementId = self->_actionStatementId;
    if (actionStatementId != objc_msgSend(v4, "actionStatementId"))
      goto LABEL_35;
    v19 = self->_has;
    v21 = v4[64];
  }
  v23 = (*(unsigned int *)&v19 >> 3) & 1;
  if (v23 != ((v21 >> 3) & 1))
    goto LABEL_35;
  if (v23)
  {
    donationTrigger = self->_donationTrigger;
    if (donationTrigger != objc_msgSend(v4, "donationTrigger"))
      goto LABEL_35;
    v19 = self->_has;
    v21 = v4[64];
  }
  v25 = (*(unsigned int *)&v19 >> 4) & 1;
  if (v25 != ((v21 >> 4) & 1))
    goto LABEL_35;
  if (v25)
  {
    wasTupleDonated = self->_wasTupleDonated;
    if (wasTupleDonated != objc_msgSend(v4, "wasTupleDonated"))
      goto LABEL_35;
  }
  -[FLSchemaFLInteractionDonationEnded tuple](self, "tuple");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tuple");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_34;
  -[FLSchemaFLInteractionDonationEnded tuple](self, "tuple");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[FLSchemaFLInteractionDonationEnded tuple](self, "tuple");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tuple");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_35;
  }
  else
  {

  }
  -[FLSchemaFLInteractionDonationEnded candidates](self, "candidates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
  {
LABEL_34:

    goto LABEL_35;
  }
  -[FLSchemaFLInteractionDonationEnded candidates](self, "candidates");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {

LABEL_38:
    v37 = 1;
    goto LABEL_36;
  }
  v33 = (void *)v32;
  -[FLSchemaFLInteractionDonationEnded candidates](self, "candidates");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqual:", v35);

  if ((v36 & 1) != 0)
    goto LABEL_38;
LABEL_35:
  v37 = 0;
LABEL_36:

  return v37;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double absoluteTime;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double donationTime;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    absoluteTime = self->_absoluteTime;
    v6 = -absoluteTime;
    if (absoluteTime >= 0.0)
      v6 = self->_absoluteTime;
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
  {
    donationTime = self->_donationTime;
    v11 = -donationTime;
    if (donationTime >= 0.0)
      v11 = self->_donationTime;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = -[SISchemaUUID hash](self->_ifSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_19;
LABEL_22:
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_20;
LABEL_23:
    v17 = 0;
    goto LABEL_24;
  }
  v15 = 2654435761 * self->_actionStatementId;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_22;
LABEL_19:
  v16 = 2654435761 * self->_donationTrigger;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_23;
LABEL_20:
  v17 = 2654435761 * self->_wasTupleDonated;
LABEL_24:
  v18 = v9 ^ v4 ^ v15 ^ v16 ^ v17 ^ v14;
  v19 = -[FLSchemaFLTupleInteraction hash](self->_tuple, "hash");
  return v18 ^ v19 ^ -[NSArray hash](self->_candidates, "hash");
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
  char v16;
  void *v17;
  void *v18;
  unsigned int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[FLSchemaFLInteractionDonationEnded absoluteTime](self, "absoluteTime");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("absoluteTime"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLSchemaFLInteractionDonationEnded actionStatementId](self, "actionStatementId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("actionStatementId"));

  }
  if (-[NSArray count](self->_candidates, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = self->_candidates;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation");
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
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("candidates"));
  }
  v16 = (char)self->_has;
  if ((v16 & 2) != 0)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[FLSchemaFLInteractionDonationEnded donationTime](self, "donationTime");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("donationTime"));

    v16 = (char)self->_has;
  }
  if ((v16 & 8) != 0)
  {
    v19 = -[FLSchemaFLInteractionDonationEnded donationTrigger](self, "donationTrigger") - 1;
    if (v19 > 2)
      v20 = CFSTR("FLTRIGGER_UNKNOWN");
    else
      v20 = *(&off_1E563EA30 + v19);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("donationTrigger"));
  }
  if (self->_ifSessionId)
  {
    -[FLSchemaFLInteractionDonationEnded ifSessionId](self, "ifSessionId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("ifSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("ifSessionId"));

    }
  }
  if (self->_tuple)
  {
    -[FLSchemaFLInteractionDonationEnded tuple](self, "tuple");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("tuple"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("tuple"));

    }
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLSchemaFLInteractionDonationEnded wasTupleDonated](self, "wasTupleDonated"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("wasTupleDonated"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLSchemaFLInteractionDonationEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLSchemaFLInteractionDonationEnded)initWithJSON:(id)a3
{
  void *v4;
  FLSchemaFLInteractionDonationEnded *v5;
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
    self = -[FLSchemaFLInteractionDonationEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLSchemaFLInteractionDonationEnded)initWithDictionary:(id)a3
{
  id v4;
  FLSchemaFLInteractionDonationEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FLSchemaFLTupleInteraction *v14;
  void *v15;
  void *v16;
  FLSchemaFLTupleInteraction *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  FLSchemaFLCandidateInteraction *v25;
  FLSchemaFLInteractionDonationEnded *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)FLSchemaFLInteractionDonationEnded;
  v5 = -[FLSchemaFLInteractionDonationEnded init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[FLSchemaFLInteractionDonationEnded setAbsoluteTime:](v5, "setAbsoluteTime:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("donationTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[FLSchemaFLInteractionDonationEnded setDonationTime:](v5, "setDonationTime:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifSessionId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[FLSchemaFLInteractionDonationEnded setIfSessionId:](v5, "setIfSessionId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionStatementId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLInteractionDonationEnded setActionStatementId:](v5, "setActionStatementId:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("donationTrigger"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLInteractionDonationEnded setDonationTrigger:](v5, "setDonationTrigger:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasTupleDonated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLInteractionDonationEnded setWasTupleDonated:](v5, "setWasTupleDonated:", objc_msgSend(v12, "BOOLValue"));
    v33 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tuple"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[FLSchemaFLTupleInteraction initWithDictionary:]([FLSchemaFLTupleInteraction alloc], "initWithDictionary:", v13);
      v15 = v13;
      v16 = v11;
      v17 = v14;
      -[FLSchemaFLInteractionDonationEnded setTuple:](v5, "setTuple:", v14);

      v11 = v16;
      v13 = v15;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidates"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v13;
      v29 = v11;
      v30 = v10;
      v31 = v7;
      v32 = v6;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = -[FLSchemaFLCandidateInteraction initWithDictionary:]([FLSchemaFLCandidateInteraction alloc], "initWithDictionary:", v24);
              -[FLSchemaFLInteractionDonationEnded addCandidates:](v5, "addCandidates:", v25);

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v21);
      }

      v7 = v31;
      v6 = v32;
      v10 = v30;
      v13 = v28;
      v11 = v29;
    }
    v26 = v5;

  }
  return v5;
}

- (double)absoluteTime
{
  return self->_absoluteTime;
}

- (double)donationTime
{
  return self->_donationTime;
}

- (SISchemaUUID)ifSessionId
{
  return self->_ifSessionId;
}

- (void)setIfSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_ifSessionId, a3);
}

- (unsigned)actionStatementId
{
  return self->_actionStatementId;
}

- (int)donationTrigger
{
  return self->_donationTrigger;
}

- (BOOL)wasTupleDonated
{
  return self->_wasTupleDonated;
}

- (FLSchemaFLTupleInteraction)tuple
{
  return self->_tuple;
}

- (void)setTuple:(id)a3
{
  objc_storeStrong((id *)&self->_tuple, a3);
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setHasIfSessionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasTuple:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_tuple, 0);
  objc_storeStrong((id *)&self->_ifSessionId, 0);
}

@end
