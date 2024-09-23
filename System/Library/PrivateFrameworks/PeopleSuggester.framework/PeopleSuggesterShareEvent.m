@implementation PeopleSuggesterShareEvent

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasTrialIdentifier
{
  return self->_trialIdentifier != 0;
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearCandidates
{
  -[NSMutableArray removeAllObjects](self->_candidates, "removeAllObjects");
}

- (void)addCandidates:(id)a3
{
  id v4;
  NSMutableArray *candidates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  candidates = self->_candidates;
  v8 = v4;
  if (!candidates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_candidates;
    self->_candidates = v6;

    v4 = v8;
    candidates = self->_candidates;
  }
  -[NSMutableArray addObject:](candidates, "addObject:", v4);

}

- (unint64_t)candidatesCount
{
  return -[NSMutableArray count](self->_candidates, "count");
}

- (id)candidatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_candidates, "objectAtIndex:", a3);
}

+ (Class)candidatesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTestKey
{
  return self->_testKey != 0;
}

- (int)madResponseStatus
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_madResponseStatus;
  else
    return 1;
}

- (void)setMadResponseStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_madResponseStatus = a3;
}

- (void)setHasMadResponseStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMadResponseStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)madResponseStatusAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E44019E8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMadResponseStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_REQUEST_TO_MAD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUCCESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIMED_OUT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setIsFallbackFetch:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isFallbackFetch = a3;
}

- (void)setHasIsFallbackFetch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsFallbackFetch
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsSharePlayAvailable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isSharePlayAvailable = a3;
}

- (void)setHasIsSharePlayAvailable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsSharePlayAvailable
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)appSharedFrom
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_appSharedFrom;
  else
    return 0;
}

- (void)setAppSharedFrom:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_appSharedFrom = a3;
}

- (void)setHasAppSharedFrom:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppSharedFrom
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)appSharedFromAsString:(int)a3
{
  if (a3 < 5)
    return off_1E4401A08[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAppSharedFrom:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTOS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCREENSHOTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAMERA")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SAFARI")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearFeedbackEvents
{
  -[NSMutableArray removeAllObjects](self->_feedbackEvents, "removeAllObjects");
}

- (void)addFeedbackEvents:(id)a3
{
  id v4;
  NSMutableArray *feedbackEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  feedbackEvents = self->_feedbackEvents;
  v8 = v4;
  if (!feedbackEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_feedbackEvents;
    self->_feedbackEvents = v6;

    v4 = v8;
    feedbackEvents = self->_feedbackEvents;
  }
  -[NSMutableArray addObject:](feedbackEvents, "addObject:", v4);

}

- (unint64_t)feedbackEventsCount
{
  return -[NSMutableArray count](self->_feedbackEvents, "count");
}

- (id)feedbackEventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_feedbackEvents, "objectAtIndex:", a3);
}

+ (Class)feedbackEventsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)PeopleSuggesterShareEvent;
  -[PeopleSuggesterShareEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PeopleSuggesterShareEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *deviceIdentifier;
  NSString *sessionId;
  PeopleSuggesterTrialIdentifier *trialIdentifier;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSString *testKey;
  char has;
  unsigned int v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t appSharedFrom;
  __CFString *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", deviceIdentifier, CFSTR("deviceIdentifier"));
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v4, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  trialIdentifier = self->_trialIdentifier;
  if (trialIdentifier)
  {
    -[PeopleSuggesterTrialIdentifier dictionaryRepresentation](trialIdentifier, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("trialIdentifier"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_version);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("version"));

  }
  if (-[NSMutableArray count](self->_candidates, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_candidates, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v11 = self->_candidates;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("candidates"));
  }
  testKey = self->_testKey;
  if (testKey)
    objc_msgSend(v4, "setObject:forKey:", testKey, CFSTR("testKey"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v19 = self->_madResponseStatus - 1;
    if (v19 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_madResponseStatus);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E44019E8[v19];
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("madResponseStatus"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_22:
      if ((has & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFallbackFetch);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("isFallbackFetch"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_23:
    if ((has & 1) == 0)
      goto LABEL_35;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSharePlayAvailable);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("isSharePlayAvailable"));

  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_35;
LABEL_31:
  appSharedFrom = self->_appSharedFrom;
  if (appSharedFrom >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_appSharedFrom);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = off_1E4401A08[appSharedFrom];
  }
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("appSharedFrom"));

LABEL_35:
  if (-[NSMutableArray count](self->_feedbackEvents, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_feedbackEvents, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v26 = self->_feedbackEvents;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v28);
    }

    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("feedbackEvents"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PeopleSuggesterShareEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_deviceIdentifier)
    PBDataWriterWriteStringField();
  if (self->_sessionId)
    PBDataWriterWriteStringField();
  if (self->_trialIdentifier)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_candidates;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  if (self->_testKey)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_20:
      if ((has & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_21:
    if ((has & 1) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_22:
    PBDataWriterWriteInt32Field();
LABEL_23:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_feedbackEvents;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (self->_deviceIdentifier)
  {
    objc_msgSend(v4, "setDeviceIdentifier:");
    v4 = v14;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v14, "setSessionId:");
    v4 = v14;
  }
  if (self->_trialIdentifier)
  {
    objc_msgSend(v14, "setTrialIdentifier:");
    v4 = v14;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_version;
    *((_BYTE *)v4 + 80) |= 4u;
  }
  if (-[PeopleSuggesterShareEvent candidatesCount](self, "candidatesCount"))
  {
    objc_msgSend(v14, "clearCandidates");
    v5 = -[PeopleSuggesterShareEvent candidatesCount](self, "candidatesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[PeopleSuggesterShareEvent candidatesAtIndex:](self, "candidatesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addCandidates:", v8);

      }
    }
  }
  if (self->_testKey)
    objc_msgSend(v14, "setTestKey:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v14 + 10) = self->_madResponseStatus;
    *((_BYTE *)v14 + 80) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_17:
      if ((has & 0x10) == 0)
        goto LABEL_18;
LABEL_27:
      *((_BYTE *)v14 + 77) = self->_isSharePlayAvailable;
      *((_BYTE *)v14 + 80) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_17;
  }
  *((_BYTE *)v14 + 76) = self->_isFallbackFetch;
  *((_BYTE *)v14 + 80) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_27;
LABEL_18:
  if ((has & 1) != 0)
  {
LABEL_19:
    *((_DWORD *)v14 + 2) = self->_appSharedFrom;
    *((_BYTE *)v14 + 80) |= 1u;
  }
LABEL_20:
  if (-[PeopleSuggesterShareEvent feedbackEventsCount](self, "feedbackEventsCount"))
  {
    objc_msgSend(v14, "clearFeedbackEvents");
    v10 = -[PeopleSuggesterShareEvent feedbackEventsCount](self, "feedbackEventsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[PeopleSuggesterShareEvent feedbackEventsAtIndex:](self, "feedbackEventsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addFeedbackEvents:", v13);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  char has;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_deviceIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[PeopleSuggesterTrialIdentifier copyWithZone:](self->_trialIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_version;
    *(_BYTE *)(v5 + 80) |= 4u;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = self->_candidates;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCandidates:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_testKey, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_madResponseStatus;
    *(_BYTE *)(v5 + 80) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  *(_BYTE *)(v5 + 76) = self->_isFallbackFetch;
  *(_BYTE *)(v5 + 80) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_25:
  *(_BYTE *)(v5 + 77) = self->_isSharePlayAvailable;
  *(_BYTE *)(v5 + 80) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 8) = self->_appSharedFrom;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
LABEL_15:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self->_feedbackEvents;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v5, "addFeedbackEvents:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v23);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceIdentifier;
  NSString *sessionId;
  PeopleSuggesterTrialIdentifier *trialIdentifier;
  NSMutableArray *candidates;
  NSString *testKey;
  NSMutableArray *feedbackEvents;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  deviceIdentifier = self->_deviceIdentifier;
  if ((unint64_t)deviceIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceIdentifier, "isEqual:"))
      goto LABEL_45;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:"))
      goto LABEL_45;
  }
  trialIdentifier = self->_trialIdentifier;
  if ((unint64_t)trialIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[PeopleSuggesterTrialIdentifier isEqual:](trialIdentifier, "isEqual:"))
      goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_version != *((_DWORD *)v4 + 18))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_45;
  }
  candidates = self->_candidates;
  if ((unint64_t)candidates | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](candidates, "isEqual:"))
  {
    goto LABEL_45;
  }
  testKey = self->_testKey;
  if ((unint64_t)testKey | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](testKey, "isEqual:"))
      goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_madResponseStatus != *((_DWORD *)v4 + 10))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0)
      goto LABEL_45;
    if (self->_isFallbackFetch)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 76))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
    {
      if (self->_isSharePlayAvailable)
      {
        if (!*((_BYTE *)v4 + 77))
          goto LABEL_45;
        goto LABEL_38;
      }
      if (!*((_BYTE *)v4 + 77))
        goto LABEL_38;
    }
LABEL_45:
    v11 = 0;
    goto LABEL_46;
  }
  if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
    goto LABEL_45;
LABEL_38:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_appSharedFrom != *((_DWORD *)v4 + 2))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_45;
  }
  feedbackEvents = self->_feedbackEvents;
  if ((unint64_t)feedbackEvents | *((_QWORD *)v4 + 4))
    v11 = -[NSMutableArray isEqual:](feedbackEvents, "isEqual:");
  else
    v11 = 1;
LABEL_46:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[NSString hash](self->_deviceIdentifier, "hash");
  v4 = -[NSString hash](self->_sessionId, "hash");
  v5 = -[PeopleSuggesterTrialIdentifier hash](self->_trialIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_version;
  else
    v6 = 0;
  v7 = -[NSMutableArray hash](self->_candidates, "hash");
  v8 = -[NSString hash](self->_testKey, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9 = 2654435761 * self->_madResponseStatus;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v10 = 2654435761 * self->_isFallbackFetch;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_7;
LABEL_11:
      v11 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_8;
LABEL_12:
      v12 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_feedbackEvents, "hash");
    }
  }
  else
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_7:
  v11 = 2654435761 * self->_isSharePlayAvailable;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_8:
  v12 = 2654435761 * self->_appSharedFrom;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_feedbackEvents, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PeopleSuggesterTrialIdentifier *trialIdentifier;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[PeopleSuggesterShareEvent setDeviceIdentifier:](self, "setDeviceIdentifier:");
  if (*((_QWORD *)v4 + 6))
    -[PeopleSuggesterShareEvent setSessionId:](self, "setSessionId:");
  trialIdentifier = self->_trialIdentifier;
  v6 = *((_QWORD *)v4 + 8);
  if (trialIdentifier)
  {
    if (v6)
      -[PeopleSuggesterTrialIdentifier mergeFrom:](trialIdentifier, "mergeFrom:");
  }
  else if (v6)
  {
    -[PeopleSuggesterShareEvent setTrialIdentifier:](self, "setTrialIdentifier:");
  }
  if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 4u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        -[PeopleSuggesterShareEvent addCandidates:](self, "addCandidates:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 7))
    -[PeopleSuggesterShareEvent setTestKey:](self, "setTestKey:");
  v12 = *((_BYTE *)v4 + 80);
  if ((v12 & 2) != 0)
  {
    self->_madResponseStatus = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
    v12 = *((_BYTE *)v4 + 80);
    if ((v12 & 8) == 0)
    {
LABEL_23:
      if ((v12 & 0x10) == 0)
        goto LABEL_24;
      goto LABEL_36;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 8) == 0)
  {
    goto LABEL_23;
  }
  self->_isFallbackFetch = *((_BYTE *)v4 + 76);
  *(_BYTE *)&self->_has |= 8u;
  v12 = *((_BYTE *)v4 + 80);
  if ((v12 & 0x10) == 0)
  {
LABEL_24:
    if ((v12 & 1) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_36:
  self->_isSharePlayAvailable = *((_BYTE *)v4 + 77);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_25:
    self->_appSharedFrom = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_26:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = *((id *)v4 + 4);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[PeopleSuggesterShareEvent addFeedbackEvents:](self, "addFeedbackEvents:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (PeopleSuggesterTrialIdentifier)trialIdentifier
{
  return self->_trialIdentifier;
}

- (void)setTrialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_trialIdentifier, a3);
}

- (int)version
{
  return self->_version;
}

- (NSMutableArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_candidates, a3);
}

- (NSString)testKey
{
  return self->_testKey;
}

- (void)setTestKey:(id)a3
{
  objc_storeStrong((id *)&self->_testKey, a3);
}

- (BOOL)isFallbackFetch
{
  return self->_isFallbackFetch;
}

- (BOOL)isSharePlayAvailable
{
  return self->_isSharePlayAvailable;
}

- (NSMutableArray)feedbackEvents
{
  return self->_feedbackEvents;
}

- (void)setFeedbackEvents:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialIdentifier, 0);
  objc_storeStrong((id *)&self->_testKey, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_feedbackEvents, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
}

@end
