@implementation PEGASUSSchemaPEGASUSCrossIntentRankerResponse

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
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PEGASUSSchemaPEGASUSCrossIntentRankerResponse;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse domainCards](self, "domainCards");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse deleteDomainCards](self, "deleteDomainCards");
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse sortedScore](self, "sortedScore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse deleteSortedScore](self, "deleteSortedScore");
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirAlerts](self, "cirAlerts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse deleteCirAlerts](self, "deleteCirAlerts");

  return v5;
}

- (void)clearCrossDomainRankerScoreKeeper
{
  -[NSArray removeAllObjects](self->_crossDomainRankerScoreKeepers, "removeAllObjects");
}

- (void)addCrossDomainRankerScoreKeeper:(id)a3
{
  id v4;
  NSArray *crossDomainRankerScoreKeepers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  crossDomainRankerScoreKeepers = self->_crossDomainRankerScoreKeepers;
  v8 = v4;
  if (!crossDomainRankerScoreKeepers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_crossDomainRankerScoreKeepers;
    self->_crossDomainRankerScoreKeepers = v6;

    v4 = v8;
    crossDomainRankerScoreKeepers = self->_crossDomainRankerScoreKeepers;
  }
  -[NSArray addObject:](crossDomainRankerScoreKeepers, "addObject:", v4);

}

- (unint64_t)crossDomainRankerScoreKeeperCount
{
  return -[NSArray count](self->_crossDomainRankerScoreKeepers, "count");
}

- (id)crossDomainRankerScoreKeeperAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_crossDomainRankerScoreKeepers, "objectAtIndexedSubscript:", a3);
}

- (void)clearCrossIntentRankerScoreKeeper
{
  -[NSArray removeAllObjects](self->_crossIntentRankerScoreKeepers, "removeAllObjects");
}

- (void)addCrossIntentRankerScoreKeeper:(id)a3
{
  id v4;
  NSArray *crossIntentRankerScoreKeepers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  crossIntentRankerScoreKeepers = self->_crossIntentRankerScoreKeepers;
  v8 = v4;
  if (!crossIntentRankerScoreKeepers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_crossIntentRankerScoreKeepers;
    self->_crossIntentRankerScoreKeepers = v6;

    v4 = v8;
    crossIntentRankerScoreKeepers = self->_crossIntentRankerScoreKeepers;
  }
  -[NSArray addObject:](crossIntentRankerScoreKeepers, "addObject:", v4);

}

- (unint64_t)crossIntentRankerScoreKeeperCount
{
  return -[NSArray count](self->_crossIntentRankerScoreKeepers, "count");
}

- (id)crossIntentRankerScoreKeeperAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_crossIntentRankerScoreKeepers, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasDomainCards
{
  return self->_domainCards != 0;
}

- (void)deleteDomainCards
{
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setDomainCards:](self, "setDomainCards:", 0);
}

- (BOOL)hasCirPireneConfidenceDebug
{
  return self->_cirPireneConfidenceDebug != 0;
}

- (void)deleteCirPireneConfidenceDebug
{
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setCirPireneConfidenceDebug:](self, "setCirPireneConfidenceDebug:", 0);
}

- (BOOL)hasSortedScore
{
  return self->_sortedScore != 0;
}

- (void)deleteSortedScore
{
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setSortedScore:](self, "setSortedScore:", 0);
}

- (BOOL)hasCirAlerts
{
  return self->_cirAlerts != 0;
}

- (void)deleteCirAlerts
{
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setCirAlerts:](self, "setCirAlerts:", 0);
}

- (void)setCirFallbackTriggered:(BOOL)a3
{
  *(&self->_cirFallbackTriggered + 1) |= 1u;
  self->_cirFallbackTriggered = a3;
}

- (BOOL)hasCirFallbackTriggered
{
  return *(&self->_cirFallbackTriggered + 1);
}

- (void)setHasCirFallbackTriggered:(BOOL)a3
{
  *(&self->_cirFallbackTriggered + 1) = *(&self->_cirFallbackTriggered + 1) & 0xFE | a3;
}

- (void)deleteCirFallbackTriggered
{
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setCirFallbackTriggered:](self, "setCirFallbackTriggered:", 0);
  *(&self->_cirFallbackTriggered + 1) &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSCrossIntentRankerResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_crossDomainRankerScoreKeepers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = self->_crossIntentRankerScoreKeepers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v12);
  }

  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse domainCards](self, "domainCards", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse domainCards](self, "domainCards");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirPireneConfidenceDebug](self, "cirPireneConfidenceDebug");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse sortedScore](self, "sortedScore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse sortedScore](self, "sortedScore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirAlerts](self, "cirAlerts");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirAlerts](self, "cirAlerts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (*(&self->_cirFallbackTriggered + 1))
    PBDataWriterWriteBOOLField();

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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  BOOL v37;
  int cirFallbackTriggered;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse crossDomainRankerScoreKeepers](self, "crossDomainRankerScoreKeepers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crossDomainRankerScoreKeepers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse crossDomainRankerScoreKeepers](self, "crossDomainRankerScoreKeepers");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse crossDomainRankerScoreKeepers](self, "crossDomainRankerScoreKeepers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crossDomainRankerScoreKeepers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse crossIntentRankerScoreKeepers](self, "crossIntentRankerScoreKeepers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crossIntentRankerScoreKeepers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse crossIntentRankerScoreKeepers](self, "crossIntentRankerScoreKeepers");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse crossIntentRankerScoreKeepers](self, "crossIntentRankerScoreKeepers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crossIntentRankerScoreKeepers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse domainCards](self, "domainCards");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainCards");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse domainCards](self, "domainCards");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse domainCards](self, "domainCards");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domainCards");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirPireneConfidenceDebug](self, "cirPireneConfidenceDebug");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirPireneConfidenceDebug");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirPireneConfidenceDebug](self, "cirPireneConfidenceDebug");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirPireneConfidenceDebug](self, "cirPireneConfidenceDebug");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirPireneConfidenceDebug");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse sortedScore](self, "sortedScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse sortedScore](self, "sortedScore");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse sortedScore](self, "sortedScore");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedScore");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirAlerts](self, "cirAlerts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlerts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirAlerts](self, "cirAlerts");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirAlerts](self, "cirAlerts");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlerts");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_32;
  }
  else
  {

  }
  if (*(&self->_cirFallbackTriggered + 1) == (v4[57] & 1))
  {
    if (!*(&self->_cirFallbackTriggered + 1)
      || (cirFallbackTriggered = self->_cirFallbackTriggered,
          cirFallbackTriggered == objc_msgSend(v4, "cirFallbackTriggered")))
    {
      v37 = 1;
      goto LABEL_33;
    }
  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[NSArray hash](self->_crossDomainRankerScoreKeepers, "hash");
  v4 = -[NSArray hash](self->_crossIntentRankerScoreKeepers, "hash");
  v5 = -[PEGASUSSchemaPEGASUSDomainCards hash](self->_domainCards, "hash");
  v6 = -[NSString hash](self->_cirPireneConfidenceDebug, "hash");
  v7 = -[PEGASUSSchemaPEGASUSSortedScore hash](self->_sortedScore, "hash");
  v8 = -[PEGASUSSchemaPEGASUSCirAlerts hash](self->_cirAlerts, "hash");
  if (*(&self->_cirFallbackTriggered + 1))
    v9 = 2654435761 * self->_cirFallbackTriggered;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cirAlerts)
  {
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirAlerts](self, "cirAlerts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cirAlerts"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cirAlerts"));

    }
  }
  if (*(&self->_cirFallbackTriggered + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirFallbackTriggered](self, "cirFallbackTriggered"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("cirFallbackTriggered"));

  }
  if (self->_cirPireneConfidenceDebug)
  {
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse cirPireneConfidenceDebug](self, "cirPireneConfidenceDebug");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cirPireneConfidenceDebug"));

  }
  if (self->_crossDomainRankerScoreKeepers)
  {
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse crossDomainRankerScoreKeepers](self, "crossDomainRankerScoreKeepers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("crossDomainRankerScoreKeeper"));

  }
  if (self->_crossIntentRankerScoreKeepers)
  {
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse crossIntentRankerScoreKeepers](self, "crossIntentRankerScoreKeepers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("crossIntentRankerScoreKeeper"));

  }
  if (self->_domainCards)
  {
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse domainCards](self, "domainCards");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("domainCards"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("domainCards"));

    }
  }
  if (self->_sortedScore)
  {
    -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse sortedScore](self, "sortedScore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("sortedScore"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("sortedScore"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSCrossIntentRankerResponse)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSCrossIntentRankerResponse *v5;
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
    self = -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSCrossIntentRankerResponse)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSCrossIntentRankerResponse *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  PEGASUSSchemaPEGASUSDomainCards *v23;
  void *v24;
  void *v25;
  void *v26;
  PEGASUSSchemaPEGASUSSortedScore *v27;
  void *v28;
  PEGASUSSchemaPEGASUSCirAlerts *v29;
  void *v30;
  PEGASUSSchemaPEGASUSCrossIntentRankerResponse *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PEGASUSSchemaPEGASUSCrossIntentRankerResponse;
  v5 = -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crossDomainRankerScoreKeeper"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v38;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v38 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy");
              -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse addCrossDomainRankerScoreKeeper:](v5, "addCrossDomainRankerScoreKeeper:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crossIntentRankerScoreKeeper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v34 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = (void *)objc_msgSend(v20, "copy", (_QWORD)v33);
              -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse addCrossIntentRankerScoreKeeper:](v5, "addCrossIntentRankerScoreKeeper:", v21);

            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v17);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainCards"), (_QWORD)v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[PEGASUSSchemaPEGASUSDomainCards initWithDictionary:]([PEGASUSSchemaPEGASUSDomainCards alloc], "initWithDictionary:", v22);
      -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setDomainCards:](v5, "setDomainCards:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirPireneConfidenceDebug"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setCirPireneConfidenceDebug:](v5, "setCirPireneConfidenceDebug:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sortedScore"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[PEGASUSSchemaPEGASUSSortedScore initWithDictionary:]([PEGASUSSchemaPEGASUSSortedScore alloc], "initWithDictionary:", v26);
      -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setSortedScore:](v5, "setSortedScore:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlerts"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[PEGASUSSchemaPEGASUSCirAlerts initWithDictionary:]([PEGASUSSchemaPEGASUSCirAlerts alloc], "initWithDictionary:", v28);
      -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setCirAlerts:](v5, "setCirAlerts:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirFallbackTriggered"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSCrossIntentRankerResponse setCirFallbackTriggered:](v5, "setCirFallbackTriggered:", objc_msgSend(v30, "BOOLValue"));
    v31 = v5;

  }
  return v5;
}

- (NSArray)crossDomainRankerScoreKeepers
{
  return self->_crossDomainRankerScoreKeepers;
}

- (void)setCrossDomainRankerScoreKeepers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)crossIntentRankerScoreKeepers
{
  return self->_crossIntentRankerScoreKeepers;
}

- (void)setCrossIntentRankerScoreKeepers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PEGASUSSchemaPEGASUSDomainCards)domainCards
{
  return self->_domainCards;
}

- (void)setDomainCards:(id)a3
{
  objc_storeStrong((id *)&self->_domainCards, a3);
}

- (NSString)cirPireneConfidenceDebug
{
  return self->_cirPireneConfidenceDebug;
}

- (void)setCirPireneConfidenceDebug:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PEGASUSSchemaPEGASUSSortedScore)sortedScore
{
  return self->_sortedScore;
}

- (void)setSortedScore:(id)a3
{
  objc_storeStrong((id *)&self->_sortedScore, a3);
}

- (PEGASUSSchemaPEGASUSCirAlerts)cirAlerts
{
  return self->_cirAlerts;
}

- (void)setCirAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_cirAlerts, a3);
}

- (BOOL)cirFallbackTriggered
{
  return self->_cirFallbackTriggered;
}

- (void)setHasDomainCards:(BOOL)a3
{
  *(&self->_cirFallbackTriggered + 2) = a3;
}

- (void)setHasCirPireneConfidenceDebug:(BOOL)a3
{
  *(&self->_cirFallbackTriggered + 3) = a3;
}

- (void)setHasSortedScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void)setHasCirAlerts:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cirAlerts, 0);
  objc_storeStrong((id *)&self->_sortedScore, 0);
  objc_storeStrong((id *)&self->_cirPireneConfidenceDebug, 0);
  objc_storeStrong((id *)&self->_domainCards, 0);
  objc_storeStrong((id *)&self->_crossIntentRankerScoreKeepers, 0);
  objc_storeStrong((id *)&self->_crossDomainRankerScoreKeepers, 0);
}

@end
