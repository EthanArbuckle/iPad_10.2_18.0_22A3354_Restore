@implementation ATXPBContextualActionsGroupedUIFeedbackResult

- (BOOL)hasGroupedUIFeedbackResults
{
  return self->_groupedUIFeedbackResults != 0;
}

- (void)setNumShortcutsAtStart:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numShortcutsAtStart = a3;
}

- (void)setHasNumShortcutsAtStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumShortcutsAtStart
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumShortcutsAtEnd:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numShortcutsAtEnd = a3;
}

- (void)setHasNumShortcutsAtEnd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumShortcutsAtEnd
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumManuallyAddedSteps:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numManuallyAddedSteps = a3;
}

- (void)setHasNumManuallyAddedSteps:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumManuallyAddedSteps
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBContextualActionsGroupedUIFeedbackResult;
  -[ATXPBContextualActionsGroupedUIFeedbackResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBContextualActionsGroupedUIFeedbackResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ATXPBProactiveSuggestionGroupedUIFeedbackResult *groupedUIFeedbackResults;
  void *v5;
  char has;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  groupedUIFeedbackResults = self->_groupedUIFeedbackResults;
  if (groupedUIFeedbackResults)
  {
    -[ATXPBProactiveSuggestionGroupedUIFeedbackResult dictionaryRepresentation](groupedUIFeedbackResults, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("groupedUIFeedbackResults"));

  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numShortcutsAtEnd);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("numShortcutsAtEnd"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numShortcutsAtStart);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("numShortcutsAtStart"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numManuallyAddedSteps);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("numManuallyAddedSteps"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBContextualActionsGroupedUIFeedbackResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_groupedUIFeedbackResults)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteUint64Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_groupedUIFeedbackResults)
  {
    v6 = v4;
    objc_msgSend(v4, "setGroupedUIFeedbackResults:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *((_QWORD *)v4 + 2) = self->_numShortcutsAtEnd;
    *((_BYTE *)v4 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_QWORD *)v4 + 3) = self->_numShortcutsAtStart;
  *((_BYTE *)v4 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 1) = self->_numManuallyAddedSteps;
    *((_BYTE *)v4 + 40) |= 1u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ATXPBProactiveSuggestionGroupedUIFeedbackResult copyWithZone:](self->_groupedUIFeedbackResults, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 16) = self->_numShortcutsAtEnd;
    *(_BYTE *)(v5 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 24) = self->_numShortcutsAtStart;
  *(_BYTE *)(v5 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 8) = self->_numManuallyAddedSteps;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXPBProactiveSuggestionGroupedUIFeedbackResult *groupedUIFeedbackResults;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  groupedUIFeedbackResults = self->_groupedUIFeedbackResults;
  if ((unint64_t)groupedUIFeedbackResults | *((_QWORD *)v4 + 4))
  {
    if (!-[ATXPBProactiveSuggestionGroupedUIFeedbackResult isEqual:](groupedUIFeedbackResults, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_numShortcutsAtStart != *((_QWORD *)v4 + 3))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_numShortcutsAtEnd != *((_QWORD *)v4 + 2))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_numManuallyAddedSteps != *((_QWORD *)v4 + 1))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[ATXPBProactiveSuggestionGroupedUIFeedbackResult hash](self->_groupedUIFeedbackResults, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761u * self->_numShortcutsAtStart;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761u * self->_numShortcutsAtEnd;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761u * self->_numManuallyAddedSteps;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  ATXPBProactiveSuggestionGroupedUIFeedbackResult *groupedUIFeedbackResults;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = a3;
  groupedUIFeedbackResults = self->_groupedUIFeedbackResults;
  v6 = v4[4];
  if (groupedUIFeedbackResults)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[ATXPBProactiveSuggestionGroupedUIFeedbackResult mergeFrom:](groupedUIFeedbackResults, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[ATXPBContextualActionsGroupedUIFeedbackResult setGroupedUIFeedbackResults:](self, "setGroupedUIFeedbackResults:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 4) == 0)
  {
    if ((v4[5] & 2) == 0)
      goto LABEL_9;
LABEL_13:
    self->_numShortcutsAtEnd = v4[2];
    *(_BYTE *)&self->_has |= 2u;
    if ((v4[5] & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_numShortcutsAtStart = v4[3];
  *(_BYTE *)&self->_has |= 4u;
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 2) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v7 & 1) != 0)
  {
LABEL_10:
    self->_numManuallyAddedSteps = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_11:

}

- (ATXPBProactiveSuggestionGroupedUIFeedbackResult)groupedUIFeedbackResults
{
  return self->_groupedUIFeedbackResults;
}

- (void)setGroupedUIFeedbackResults:(id)a3
{
  objc_storeStrong((id *)&self->_groupedUIFeedbackResults, a3);
}

- (unint64_t)numShortcutsAtStart
{
  return self->_numShortcutsAtStart;
}

- (unint64_t)numShortcutsAtEnd
{
  return self->_numShortcutsAtEnd;
}

- (unint64_t)numManuallyAddedSteps
{
  return self->_numManuallyAddedSteps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedUIFeedbackResults, 0);
}

@end
