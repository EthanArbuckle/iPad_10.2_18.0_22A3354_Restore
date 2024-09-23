@implementation CDASchemaCDAElectionDecisionMade

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
  void *v14;
  void *v15;
  int v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CDASchemaCDAElectionDecisionMade;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v18, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDASchemaCDAElectionDecisionMade thisDevice](self, "thisDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CDASchemaCDAElectionDecisionMade deleteThisDevice](self, "deleteThisDevice");
  -[CDASchemaCDAElectionDecisionMade winningDevice](self, "winningDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CDASchemaCDAElectionDecisionMade deleteWinningDevice](self, "deleteWinningDevice");
  -[CDASchemaCDAElectionDecisionMade heardParticipants](self, "heardParticipants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDASchemaCDAElectionDecisionMade setHeardParticipants:](self, "setHeardParticipants:", v13);

  -[CDASchemaCDAElectionDecisionMade goodnessScoreBoosts](self, "goodnessScoreBoosts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySensitiveConditionsPolicy:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "suppressMessage");

  if (v16)
    -[CDASchemaCDAElectionDecisionMade deleteGoodnessScoreBoosts](self, "deleteGoodnessScoreBoosts");

  return v5;
}

- (void)setVersion:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteVersion
{
  double v2;

  LODWORD(v2) = 0;
  -[CDASchemaCDAElectionDecisionMade setVersion:](self, "setVersion:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDecision:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_decision = a3;
}

- (BOOL)hasDecision
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDecision:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDecision
{
  -[CDASchemaCDAElectionDecisionMade setDecision:](self, "setDecision:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPreviousDecision:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_previousDecision = a3;
}

- (BOOL)hasPreviousDecision
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPreviousDecision:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePreviousDecision
{
  -[CDASchemaCDAElectionDecisionMade setPreviousDecision:](self, "setPreviousDecision:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasThisDevice
{
  return self->_thisDevice != 0;
}

- (void)deleteThisDevice
{
  -[CDASchemaCDAElectionDecisionMade setThisDevice:](self, "setThisDevice:", 0);
}

- (BOOL)hasWinningDevice
{
  return self->_winningDevice != 0;
}

- (void)deleteWinningDevice
{
  -[CDASchemaCDAElectionDecisionMade setWinningDevice:](self, "setWinningDevice:", 0);
}

- (void)clearHeardParticipants
{
  -[NSArray removeAllObjects](self->_heardParticipants, "removeAllObjects");
}

- (void)addHeardParticipants:(id)a3
{
  id v4;
  NSArray *heardParticipants;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  heardParticipants = self->_heardParticipants;
  v8 = v4;
  if (!heardParticipants)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_heardParticipants;
    self->_heardParticipants = v6;

    v4 = v8;
    heardParticipants = self->_heardParticipants;
  }
  -[NSArray addObject:](heardParticipants, "addObject:", v4);

}

- (unint64_t)heardParticipantsCount
{
  return -[NSArray count](self->_heardParticipants, "count");
}

- (id)heardParticipantsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_heardParticipants, "objectAtIndexedSubscript:", a3);
}

- (void)setTimeSinceLastDecisionInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timeSinceLastDecisionInMs = a3;
}

- (BOOL)hasTimeSinceLastDecisionInMs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasTimeSinceLastDecisionInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteTimeSinceLastDecisionInMs
{
  -[CDASchemaCDAElectionDecisionMade setTimeSinceLastDecisionInMs:](self, "setTimeSinceLastDecisionInMs:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setRawGoodnessScore:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_rawGoodnessScore = a3;
}

- (BOOL)hasRawGoodnessScore
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasRawGoodnessScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteRawGoodnessScore
{
  -[CDASchemaCDAElectionDecisionMade setRawGoodnessScore:](self, "setRawGoodnessScore:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasGoodnessScoreBoosts
{
  return self->_goodnessScoreBoosts != 0;
}

- (void)deleteGoodnessScoreBoosts
{
  -[CDASchemaCDAElectionDecisionMade setGoodnessScoreBoosts:](self, "setGoodnessScoreBoosts:", 0);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return CDASchemaCDAElectionDecisionMadeReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  char v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  -[CDASchemaCDAElectionDecisionMade thisDevice](self, "thisDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CDASchemaCDAElectionDecisionMade thisDevice](self, "thisDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAElectionDecisionMade winningDevice](self, "winningDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CDASchemaCDAElectionDecisionMade winningDevice](self, "winningDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_heardParticipants;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    v15 = (char)self->_has;
  }
  if ((v15 & 0x10) != 0)
    PBDataWriterWriteUint32Field();
  -[CDASchemaCDAElectionDecisionMade goodnessScoreBoosts](self, "goodnessScoreBoosts", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CDASchemaCDAElectionDecisionMade goodnessScoreBoosts](self, "goodnessScoreBoosts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $572E99BF377DA6E946E8D50FD10EE0C7 has;
  unsigned int v6;
  float version;
  float v8;
  int v9;
  int decision;
  int v11;
  int previousDecision;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  $572E99BF377DA6E946E8D50FD10EE0C7 v30;
  int v31;
  unsigned int v32;
  unint64_t timeSinceLastDecisionInMs;
  int v34;
  unsigned int rawGoodnessScore;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  BOOL v41;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  has = self->_has;
  v6 = v4[72];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_40;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    version = self->_version;
    objc_msgSend(v4, "version");
    if (version != v8)
      goto LABEL_40;
    has = self->_has;
    v6 = v4[72];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_40;
  if (v9)
  {
    decision = self->_decision;
    if (decision != objc_msgSend(v4, "decision"))
      goto LABEL_40;
    has = self->_has;
    v6 = v4[72];
  }
  v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1))
    goto LABEL_40;
  if (v11)
  {
    previousDecision = self->_previousDecision;
    if (previousDecision != objc_msgSend(v4, "previousDecision"))
      goto LABEL_40;
  }
  -[CDASchemaCDAElectionDecisionMade thisDevice](self, "thisDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thisDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 == 0) == (v14 != 0))
    goto LABEL_39;
  -[CDASchemaCDAElectionDecisionMade thisDevice](self, "thisDevice");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[CDASchemaCDAElectionDecisionMade thisDevice](self, "thisDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thisDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_40;
  }
  else
  {

  }
  -[CDASchemaCDAElectionDecisionMade winningDevice](self, "winningDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "winningDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 == 0) == (v14 != 0))
    goto LABEL_39;
  -[CDASchemaCDAElectionDecisionMade winningDevice](self, "winningDevice");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[CDASchemaCDAElectionDecisionMade winningDevice](self, "winningDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "winningDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (!v24)
      goto LABEL_40;
  }
  else
  {

  }
  -[CDASchemaCDAElectionDecisionMade heardParticipants](self, "heardParticipants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heardParticipants");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 == 0) == (v14 != 0))
    goto LABEL_39;
  -[CDASchemaCDAElectionDecisionMade heardParticipants](self, "heardParticipants");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[CDASchemaCDAElectionDecisionMade heardParticipants](self, "heardParticipants");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heardParticipants");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_40;
  }
  else
  {

  }
  v30 = self->_has;
  v31 = (*(unsigned int *)&v30 >> 3) & 1;
  v32 = v4[72];
  if (v31 != ((v32 >> 3) & 1))
    goto LABEL_40;
  if (v31)
  {
    timeSinceLastDecisionInMs = self->_timeSinceLastDecisionInMs;
    if (timeSinceLastDecisionInMs != objc_msgSend(v4, "timeSinceLastDecisionInMs"))
      goto LABEL_40;
    v30 = self->_has;
    v32 = v4[72];
  }
  v34 = (*(unsigned int *)&v30 >> 4) & 1;
  if (v34 != ((v32 >> 4) & 1))
    goto LABEL_40;
  if (v34)
  {
    rawGoodnessScore = self->_rawGoodnessScore;
    if (rawGoodnessScore != objc_msgSend(v4, "rawGoodnessScore"))
      goto LABEL_40;
  }
  -[CDASchemaCDAElectionDecisionMade goodnessScoreBoosts](self, "goodnessScoreBoosts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "goodnessScoreBoosts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 == 0) == (v14 != 0))
  {
LABEL_39:

    goto LABEL_40;
  }
  -[CDASchemaCDAElectionDecisionMade goodnessScoreBoosts](self, "goodnessScoreBoosts");
  v36 = objc_claimAutoreleasedReturnValue();
  if (!v36)
  {

LABEL_43:
    v41 = 1;
    goto LABEL_41;
  }
  v37 = (void *)v36;
  -[CDASchemaCDAElectionDecisionMade goodnessScoreBoosts](self, "goodnessScoreBoosts");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "goodnessScoreBoosts");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v38, "isEqual:", v39);

  if ((v40 & 1) != 0)
    goto LABEL_43;
LABEL_40:
  v41 = 0;
LABEL_41:

  return v41;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float version;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    version = self->_version;
    v6 = version;
    if (version < 0.0)
      v6 = -version;
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
    v9 = 2654435761 * self->_decision;
    if ((has & 4) != 0)
      goto LABEL_11;
  }
  else
  {
    v9 = 0;
    if ((has & 4) != 0)
    {
LABEL_11:
      v10 = 2654435761 * self->_previousDecision;
      goto LABEL_14;
    }
  }
  v10 = 0;
LABEL_14:
  v11 = -[CDASchemaCDAParticipant hash](self->_thisDevice, "hash");
  v12 = -[CDASchemaCDAParticipant hash](self->_winningDevice, "hash");
  v13 = -[NSArray hash](self->_heardParticipants, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v14 = 2654435761u * self->_timeSinceLastDecisionInMs;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_16;
LABEL_18:
    v15 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[CDASchemaCDAScoreBoosters hash](self->_goodnessScoreBoosts, "hash");
  }
  v14 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_18;
LABEL_16:
  v15 = 2654435761 * self->_rawGoodnessScore;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[CDASchemaCDAScoreBoosters hash](self->_goodnessScoreBoosts, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char has;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = -[CDASchemaCDAElectionDecisionMade decision](self, "decision");
    if (v4 == 1)
      v5 = CFSTR("CDADECISION_WIN");
    else
      v5 = CFSTR("CDADECISION_UNKNOWN");
    if (v4 == 2)
      v6 = CFSTR("CDADECISION_LOSS");
    else
      v6 = v5;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("decision"));
  }
  if (self->_goodnessScoreBoosts)
  {
    -[CDASchemaCDAElectionDecisionMade goodnessScoreBoosts](self, "goodnessScoreBoosts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("goodnessScoreBoosts"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("goodnessScoreBoosts"));

    }
  }
  if (-[NSArray count](self->_heardParticipants, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = self->_heardParticipants;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v10, "addObject:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("heardParticipants"));
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v19 = -[CDASchemaCDAElectionDecisionMade previousDecision](self, "previousDecision");
    if (v19 == 1)
      v20 = CFSTR("CDADECISION_WIN");
    else
      v20 = CFSTR("CDADECISION_UNKNOWN");
    if (v19 == 2)
      v21 = CFSTR("CDADECISION_LOSS");
    else
      v21 = v20;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("previousDecision"));
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAElectionDecisionMade rawGoodnessScore](self, "rawGoodnessScore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("rawGoodnessScore"));

  }
  if (self->_thisDevice)
  {
    -[CDASchemaCDAElectionDecisionMade thisDevice](self, "thisDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("thisDevice"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("thisDevice"));

    }
  }
  v26 = (char)self->_has;
  if ((v26 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CDASchemaCDAElectionDecisionMade timeSinceLastDecisionInMs](self, "timeSinceLastDecisionInMs"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("timeSinceLastDecisionInMs"));

    v26 = (char)self->_has;
  }
  if ((v26 & 1) != 0)
  {
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[CDASchemaCDAElectionDecisionMade version](self, "version");
    objc_msgSend(v28, "numberWithFloat:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("version"));

  }
  if (self->_winningDevice)
  {
    -[CDASchemaCDAElectionDecisionMade winningDevice](self, "winningDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("winningDevice"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("winningDevice"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CDASchemaCDAElectionDecisionMade dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CDASchemaCDAElectionDecisionMade)initWithJSON:(id)a3
{
  void *v4;
  CDASchemaCDAElectionDecisionMade *v5;
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
    self = -[CDASchemaCDAElectionDecisionMade initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CDASchemaCDAElectionDecisionMade)initWithDictionary:(id)a3
{
  id v4;
  CDASchemaCDAElectionDecisionMade *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CDASchemaCDAParticipant *v10;
  uint64_t v11;
  CDASchemaCDAParticipant *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  CDASchemaCDAParticipant *v20;
  void *v21;
  void *v22;
  void *v23;
  CDASchemaCDAScoreBoosters *v24;
  CDASchemaCDAElectionDecisionMade *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CDASchemaCDAElectionDecisionMade;
  v5 = -[CDASchemaCDAElectionDecisionMade init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[CDASchemaCDAElectionDecisionMade setVersion:](v5, "setVersion:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("decision"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAElectionDecisionMade setDecision:](v5, "setDecision:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousDecision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAElectionDecisionMade setPreviousDecision:](v5, "setPreviousDecision:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thisDevice"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[CDASchemaCDAParticipant initWithDictionary:]([CDASchemaCDAParticipant alloc], "initWithDictionary:", v9);
      -[CDASchemaCDAElectionDecisionMade setThisDevice:](v5, "setThisDevice:", v10);

    }
    v30 = (void *)v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("winningDevice"));
    v11 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[CDASchemaCDAParticipant initWithDictionary:]([CDASchemaCDAParticipant alloc], "initWithDictionary:", v11);
      -[CDASchemaCDAElectionDecisionMade setWinningDevice:](v5, "setWinningDevice:", v12);

    }
    v29 = (void *)v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("heardParticipants"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v8;
      v28 = v6;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = -[CDASchemaCDAParticipant initWithDictionary:]([CDASchemaCDAParticipant alloc], "initWithDictionary:", v19);
              -[CDASchemaCDAElectionDecisionMade addHeardParticipants:](v5, "addHeardParticipants:", v20);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v16);
      }

      v6 = v28;
      v8 = v27;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastDecisionInMs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAElectionDecisionMade setTimeSinceLastDecisionInMs:](v5, "setTimeSinceLastDecisionInMs:", objc_msgSend(v21, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawGoodnessScore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAElectionDecisionMade setRawGoodnessScore:](v5, "setRawGoodnessScore:", objc_msgSend(v22, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("goodnessScoreBoosts"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[CDASchemaCDAScoreBoosters initWithDictionary:]([CDASchemaCDAScoreBoosters alloc], "initWithDictionary:", v23);
      -[CDASchemaCDAElectionDecisionMade setGoodnessScoreBoosts:](v5, "setGoodnessScoreBoosts:", v24);

    }
    v25 = v5;

  }
  return v5;
}

- (float)version
{
  return self->_version;
}

- (int)decision
{
  return self->_decision;
}

- (int)previousDecision
{
  return self->_previousDecision;
}

- (CDASchemaCDAParticipant)thisDevice
{
  return self->_thisDevice;
}

- (void)setThisDevice:(id)a3
{
  objc_storeStrong((id *)&self->_thisDevice, a3);
}

- (CDASchemaCDAParticipant)winningDevice
{
  return self->_winningDevice;
}

- (void)setWinningDevice:(id)a3
{
  objc_storeStrong((id *)&self->_winningDevice, a3);
}

- (NSArray)heardParticipants
{
  return self->_heardParticipants;
}

- (void)setHeardParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)timeSinceLastDecisionInMs
{
  return self->_timeSinceLastDecisionInMs;
}

- (unsigned)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (CDASchemaCDAScoreBoosters)goodnessScoreBoosts
{
  return self->_goodnessScoreBoosts;
}

- (void)setGoodnessScoreBoosts:(id)a3
{
  objc_storeStrong((id *)&self->_goodnessScoreBoosts, a3);
}

- (void)setHasThisDevice:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasWinningDevice:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasGoodnessScoreBoosts:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goodnessScoreBoosts, 0);
  objc_storeStrong((id *)&self->_heardParticipants, 0);
  objc_storeStrong((id *)&self->_winningDevice, 0);
  objc_storeStrong((id *)&self->_thisDevice, 0);
}

@end
