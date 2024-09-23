@implementation AWDCoreRoutineMagicMomentsSuggestionInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineMagicMomentsSuggestionInstance setSuggestionId:](self, "setSuggestionId:", 0);
  -[AWDCoreRoutineMagicMomentsSuggestionInstance setSuggestions:](self, "setSuggestions:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicMomentsSuggestionInstance;
  -[AWDCoreRoutineMagicMomentsSuggestionInstance dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_confidence = a3;
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

- (BOOL)hasConfidence
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearSuggestions
{
  -[NSMutableArray removeAllObjects](self->_suggestions, "removeAllObjects");
}

- (void)addSuggestions:(id)a3
{
  NSMutableArray *suggestions;

  suggestions = self->_suggestions;
  if (!suggestions)
  {
    suggestions = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_suggestions = suggestions;
  }
  -[NSMutableArray addObject:](suggestions, "addObject:", a3);
}

- (unint64_t)suggestionsCount
{
  return -[NSMutableArray count](self->_suggestions, "count");
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_suggestions, "objectAtIndex:", a3);
}

+ (Class)suggestionsType
{
  return (Class)objc_opt_class();
}

- (void)setReposponceTime:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_reposponceTime = a3;
}

- (void)setHasReposponceTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReposponceTime
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDurationSinceLastSuggestion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_durationSinceLastSuggestion = a3;
}

- (void)setHasDurationSinceLastSuggestion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDurationSinceLastSuggestion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicMomentsSuggestionInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineMagicMomentsSuggestionInstance description](&v3, sel_description), -[AWDCoreRoutineMagicMomentsSuggestionInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *suggestionId;
  void *v5;
  NSMutableArray *suggestions;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char has;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  suggestionId = self->_suggestionId;
  if (suggestionId)
    objc_msgSend(v3, "setObject:forKey:", suggestionId, CFSTR("suggestionId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_confidence), CFSTR("confidence"));
  if (-[NSMutableArray count](self->_suggestions, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_suggestions, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    suggestions = self->_suggestions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(suggestions);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("suggestions"));

  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_reposponceTime), CFSTR("reposponceTime"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_durationSinceLastSuggestion), CFSTR("durationSinceLastSuggestion"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicMomentsSuggestionInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *suggestions;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char has;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_suggestionId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  suggestions = self->_suggestions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(suggestions);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 1u;
  }
  if (self->_suggestionId)
    objc_msgSend(a3, "setSuggestionId:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_confidence;
    *((_BYTE *)a3 + 48) |= 2u;
  }
  if (-[AWDCoreRoutineMagicMomentsSuggestionInstance suggestionsCount](self, "suggestionsCount"))
  {
    objc_msgSend(a3, "clearSuggestions");
    v5 = -[AWDCoreRoutineMagicMomentsSuggestionInstance suggestionsCount](self, "suggestionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addSuggestions:", -[AWDCoreRoutineMagicMomentsSuggestionInstance suggestionsAtIndex:](self, "suggestionsAtIndex:", i));
    }
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_reposponceTime;
    *((_BYTE *)a3 + 48) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_durationSinceLastSuggestion;
    *((_BYTE *)a3 + 48) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *suggestions;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char has;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_suggestionId, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_confidence;
    *(_BYTE *)(v6 + 48) |= 2u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  suggestions = self->_suggestions;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(suggestions);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSuggestions:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_reposponceTime;
    *(_BYTE *)(v6 + 48) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_durationSinceLastSuggestion;
    *(_BYTE *)(v6 + 48) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *suggestionId;
  NSMutableArray *suggestions;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_27:
      LOBYTE(v5) = 0;
      return v5;
    }
    suggestionId = self->_suggestionId;
    if ((unint64_t)suggestionId | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSString isEqual:](suggestionId, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_confidence != *((_DWORD *)a3 + 4))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
      goto LABEL_27;
    }
    suggestions = self->_suggestions;
    if ((unint64_t)suggestions | *((_QWORD *)a3 + 5))
    {
      v5 = -[NSMutableArray isEqual:](suggestions, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_reposponceTime != *((_DWORD *)a3 + 6))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 48) & 8) != 0)
    {
      goto LABEL_27;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 48) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_durationSinceLastSuggestion != *((_DWORD *)a3 + 5))
        goto LABEL_27;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_suggestionId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_confidence;
  else
    v5 = 0;
  v6 = -[NSMutableArray hash](self->_suggestions, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v7 = 2654435761 * self->_reposponceTime;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_11:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_9:
  v8 = 2654435761 * self->_durationSinceLastSuggestion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDCoreRoutineMagicMomentsSuggestionInstance setSuggestionId:](self, "setSuggestionId:");
  if ((*((_BYTE *)a3 + 48) & 2) != 0)
  {
    self->_confidence = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[AWDCoreRoutineMagicMomentsSuggestionInstance addSuggestions:](self, "addSuggestions:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10 = *((_BYTE *)a3 + 48);
  if ((v10 & 8) != 0)
  {
    self->_reposponceTime = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 8u;
    v10 = *((_BYTE *)a3 + 48);
  }
  if ((v10 & 4) != 0)
  {
    self->_durationSinceLastSuggestion = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int)confidence
{
  return self->_confidence;
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)reposponceTime
{
  return self->_reposponceTime;
}

- (int)durationSinceLastSuggestion
{
  return self->_durationSinceLastSuggestion;
}

@end
