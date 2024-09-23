@implementation ATXPBBiomeProactiveSuggestionUIFeedbackResult

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasBlendingUICacheUpdateUUID
{
  return self->_blendingUICacheUpdateUUID != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setClientModelCacheCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clientModelCacheCreationDate = a3;
}

- (void)setHasClientModelCacheCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientModelCacheCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (void)setSessionStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sessionStartDate = a3;
}

- (void)setHasSessionStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionStartDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSessionEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sessionEndDate = a3;
}

- (void)setHasSessionEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionEndDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearShownSuggestions
{
  -[NSMutableArray removeAllObjects](self->_shownSuggestions, "removeAllObjects");
}

- (void)addShownSuggestions:(id)a3
{
  id v4;
  NSMutableArray *shownSuggestions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  shownSuggestions = self->_shownSuggestions;
  v8 = v4;
  if (!shownSuggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_shownSuggestions;
    self->_shownSuggestions = v6;

    v4 = v8;
    shownSuggestions = self->_shownSuggestions;
  }
  -[NSMutableArray addObject:](shownSuggestions, "addObject:", v4);

}

- (unint64_t)shownSuggestionsCount
{
  return -[NSMutableArray count](self->_shownSuggestions, "count");
}

- (id)shownSuggestionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_shownSuggestions, "objectAtIndex:", a3);
}

+ (Class)shownSuggestionsType
{
  return (Class)objc_opt_class();
}

- (void)clearEngagedSuggestions
{
  -[NSMutableArray removeAllObjects](self->_engagedSuggestions, "removeAllObjects");
}

- (void)addEngagedSuggestions:(id)a3
{
  id v4;
  NSMutableArray *engagedSuggestions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  engagedSuggestions = self->_engagedSuggestions;
  v8 = v4;
  if (!engagedSuggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_engagedSuggestions;
    self->_engagedSuggestions = v6;

    v4 = v8;
    engagedSuggestions = self->_engagedSuggestions;
  }
  -[NSMutableArray addObject:](engagedSuggestions, "addObject:", v4);

}

- (unint64_t)engagedSuggestionsCount
{
  return -[NSMutableArray count](self->_engagedSuggestions, "count");
}

- (id)engagedSuggestionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_engagedSuggestions, "objectAtIndex:", a3);
}

+ (Class)engagedSuggestionsType
{
  return (Class)objc_opt_class();
}

- (void)clearRejectedSuggestions
{
  -[NSMutableArray removeAllObjects](self->_rejectedSuggestions, "removeAllObjects");
}

- (void)addRejectedSuggestions:(id)a3
{
  id v4;
  NSMutableArray *rejectedSuggestions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rejectedSuggestions = self->_rejectedSuggestions;
  v8 = v4;
  if (!rejectedSuggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_rejectedSuggestions;
    self->_rejectedSuggestions = v6;

    v4 = v8;
    rejectedSuggestions = self->_rejectedSuggestions;
  }
  -[NSMutableArray addObject:](rejectedSuggestions, "addObject:", v4);

}

- (unint64_t)rejectedSuggestionsCount
{
  return -[NSMutableArray count](self->_rejectedSuggestions, "count");
}

- (id)rejectedSuggestionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rejectedSuggestions, "objectAtIndex:", a3);
}

+ (Class)rejectedSuggestionsType
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
  v8.super_class = (Class)ATXPBBiomeProactiveSuggestionUIFeedbackResult;
  -[ATXPBBiomeProactiveSuggestionUIFeedbackResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBBiomeProactiveSuggestionUIFeedbackResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionId;
  NSString *blendingUICacheUpdateUUID;
  NSString *clientModelId;
  void *v8;
  NSString *consumerSubType;
  char has;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
  if (blendingUICacheUpdateUUID)
    objc_msgSend(v4, "setObject:forKey:", blendingUICacheUpdateUUID, CFSTR("blendingUICacheUpdateUUID"));
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v4, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_clientModelCacheCreationDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("clientModelCacheCreationDate"));

  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v4, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sessionStartDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("sessionStartDate"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sessionEndDate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("sessionEndDate"));

  }
  if (-[NSMutableArray count](self->_shownSuggestions, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_shownSuggestions, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v14 = self->_shownSuggestions;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("shownSuggestions"));
  }
  if (-[NSMutableArray count](self->_engagedSuggestions, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_engagedSuggestions, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v21 = self->_engagedSuggestions;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("engagedSuggestions"));
  }
  if (-[NSMutableArray count](self->_rejectedSuggestions, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_rejectedSuggestions, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = self->_rejectedSuggestions;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v36 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v35);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v30);
    }

    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("rejectedSuggestions"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBiomeProactiveSuggestionUIFeedbackResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_sessionId)
    PBDataWriterWriteStringField();
  if (self->_blendingUICacheUpdateUUID)
    PBDataWriterWriteStringField();
  if (self->_clientModelId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_consumerSubType)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_shownSuggestions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_engagedSuggestions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_rejectedSuggestions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  id v18;

  v4 = a3;
  v18 = v4;
  if (self->_sessionId)
  {
    objc_msgSend(v4, "setSessionId:");
    v4 = v18;
  }
  if (self->_blendingUICacheUpdateUUID)
  {
    objc_msgSend(v18, "setBlendingUICacheUpdateUUID:");
    v4 = v18;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v18, "setClientModelId:");
    v4 = v18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_clientModelCacheCreationDate;
    *((_BYTE *)v4 + 88) |= 1u;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v18, "setConsumerSubType:");
    v4 = v18;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_sessionStartDate;
    *((_BYTE *)v4 + 88) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_sessionEndDate;
    *((_BYTE *)v4 + 88) |= 2u;
  }
  if (-[ATXPBBiomeProactiveSuggestionUIFeedbackResult shownSuggestionsCount](self, "shownSuggestionsCount"))
  {
    objc_msgSend(v18, "clearShownSuggestions");
    v6 = -[ATXPBBiomeProactiveSuggestionUIFeedbackResult shownSuggestionsCount](self, "shownSuggestionsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[ATXPBBiomeProactiveSuggestionUIFeedbackResult shownSuggestionsAtIndex:](self, "shownSuggestionsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addShownSuggestions:", v9);

      }
    }
  }
  if (-[ATXPBBiomeProactiveSuggestionUIFeedbackResult engagedSuggestionsCount](self, "engagedSuggestionsCount"))
  {
    objc_msgSend(v18, "clearEngagedSuggestions");
    v10 = -[ATXPBBiomeProactiveSuggestionUIFeedbackResult engagedSuggestionsCount](self, "engagedSuggestionsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[ATXPBBiomeProactiveSuggestionUIFeedbackResult engagedSuggestionsAtIndex:](self, "engagedSuggestionsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addEngagedSuggestions:", v13);

      }
    }
  }
  if (-[ATXPBBiomeProactiveSuggestionUIFeedbackResult rejectedSuggestionsCount](self, "rejectedSuggestionsCount"))
  {
    objc_msgSend(v18, "clearRejectedSuggestions");
    v14 = -[ATXPBBiomeProactiveSuggestionUIFeedbackResult rejectedSuggestionsCount](self, "rejectedSuggestionsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[ATXPBBiomeProactiveSuggestionUIFeedbackResult rejectedSuggestionsAtIndex:](self, "rejectedSuggestionsAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addRejectedSuggestions:", v17);

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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char has;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v6;

  v8 = -[NSString copyWithZone:](self->_blendingUICacheUpdateUUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_clientModelCacheCreationDate;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_sessionStartDate;
    *(_BYTE *)(v5 + 88) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_sessionEndDate;
    *(_BYTE *)(v5 + 88) |= 2u;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v15 = self->_shownSuggestions;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addShownSuggestions:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v17);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = self->_engagedSuggestions;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEngagedSuggestions:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v23);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = self->_rejectedSuggestions;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend((id)v5, "addRejectedSuggestions:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v29);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sessionId;
  NSString *blendingUICacheUpdateUUID;
  NSString *clientModelId;
  char has;
  NSString *consumerSubType;
  NSMutableArray *shownSuggestions;
  NSMutableArray *engagedSuggestions;
  NSMutableArray *rejectedSuggestions;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:"))
      goto LABEL_32;
  }
  blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
  if ((unint64_t)blendingUICacheUpdateUUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](blendingUICacheUpdateUUID, "isEqual:"))
      goto LABEL_32;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:"))
      goto LABEL_32;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_clientModelCacheCreationDate != *((double *)v4 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_32;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:"))
    {
LABEL_32:
      v13 = 0;
      goto LABEL_33;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0 || self->_sessionStartDate != *((double *)v4 + 3))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_sessionEndDate != *((double *)v4 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_32;
  }
  shownSuggestions = self->_shownSuggestions;
  if ((unint64_t)shownSuggestions | *((_QWORD *)v4 + 10)
    && !-[NSMutableArray isEqual:](shownSuggestions, "isEqual:"))
  {
    goto LABEL_32;
  }
  engagedSuggestions = self->_engagedSuggestions;
  if ((unint64_t)engagedSuggestions | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](engagedSuggestions, "isEqual:"))
      goto LABEL_32;
  }
  rejectedSuggestions = self->_rejectedSuggestions;
  if ((unint64_t)rejectedSuggestions | *((_QWORD *)v4 + 8))
    v13 = -[NSMutableArray isEqual:](rejectedSuggestions, "isEqual:");
  else
    v13 = 1;
LABEL_33:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  double clientModelCacheCreationDate;
  double v8;
  long double v9;
  double v10;
  NSUInteger v11;
  char has;
  unint64_t v13;
  double sessionStartDate;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  double sessionEndDate;
  double v20;
  long double v21;
  double v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;

  v3 = -[NSString hash](self->_sessionId, "hash");
  v4 = -[NSString hash](self->_blendingUICacheUpdateUUID, "hash");
  v5 = -[NSString hash](self->_clientModelId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    clientModelCacheCreationDate = self->_clientModelCacheCreationDate;
    v8 = -clientModelCacheCreationDate;
    if (clientModelCacheCreationDate >= 0.0)
      v8 = self->_clientModelCacheCreationDate;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  v11 = -[NSString hash](self->_consumerSubType, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    sessionStartDate = self->_sessionStartDate;
    v15 = -sessionStartDate;
    if (sessionStartDate >= 0.0)
      v15 = self->_sessionStartDate;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((has & 2) != 0)
  {
    sessionEndDate = self->_sessionEndDate;
    v20 = -sessionEndDate;
    if (sessionEndDate >= 0.0)
      v20 = self->_sessionEndDate;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  v23 = v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ v13 ^ v18;
  v24 = -[NSMutableArray hash](self->_shownSuggestions, "hash");
  v25 = v24 ^ -[NSMutableArray hash](self->_engagedSuggestions, "hash");
  return v23 ^ v25 ^ -[NSMutableArray hash](self->_rejectedSuggestions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 9))
    -[ATXPBBiomeProactiveSuggestionUIFeedbackResult setSessionId:](self, "setSessionId:");
  if (*((_QWORD *)v4 + 4))
    -[ATXPBBiomeProactiveSuggestionUIFeedbackResult setBlendingUICacheUpdateUUID:](self, "setBlendingUICacheUpdateUUID:");
  if (*((_QWORD *)v4 + 5))
    -[ATXPBBiomeProactiveSuggestionUIFeedbackResult setClientModelId:](self, "setClientModelId:");
  if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    self->_clientModelCacheCreationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
    -[ATXPBBiomeProactiveSuggestionUIFeedbackResult setConsumerSubType:](self, "setConsumerSubType:");
  v5 = *((_BYTE *)v4 + 88);
  if ((v5 & 4) != 0)
  {
    self->_sessionStartDate = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 88);
  }
  if ((v5 & 2) != 0)
  {
    self->_sessionEndDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = *((id *)v4 + 10);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        -[ATXPBBiomeProactiveSuggestionUIFeedbackResult addShownSuggestions:](self, "addShownSuggestions:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = *((id *)v4 + 7);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        -[ATXPBBiomeProactiveSuggestionUIFeedbackResult addEngagedSuggestions:](self, "addEngagedSuggestions:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v4 + 8);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[ATXPBBiomeProactiveSuggestionUIFeedbackResult addRejectedSuggestions:](self, "addRejectedSuggestions:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (NSString)blendingUICacheUpdateUUID
{
  return self->_blendingUICacheUpdateUUID;
}

- (void)setBlendingUICacheUpdateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_blendingUICacheUpdateUUID, a3);
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelId, a3);
}

- (double)clientModelCacheCreationDate
{
  return self->_clientModelCacheCreationDate;
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (double)sessionStartDate
{
  return self->_sessionStartDate;
}

- (double)sessionEndDate
{
  return self->_sessionEndDate;
}

- (NSMutableArray)shownSuggestions
{
  return self->_shownSuggestions;
}

- (void)setShownSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_shownSuggestions, a3);
}

- (NSMutableArray)engagedSuggestions
{
  return self->_engagedSuggestions;
}

- (void)setEngagedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_engagedSuggestions, a3);
}

- (NSMutableArray)rejectedSuggestions
{
  return self->_rejectedSuggestions;
}

- (void)setRejectedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_rejectedSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shownSuggestions, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_rejectedSuggestions, 0);
  objc_storeStrong((id *)&self->_engagedSuggestions, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_blendingUICacheUpdateUUID, 0);
}

@end
