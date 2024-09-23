@implementation ATXPBShortcutsEditorEvent

- (void)setDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setEventType:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasBlendingCacheId
{
  return self->_blendingCacheId != 0;
}

- (void)clearSuggestionUUIDs
{
  -[NSMutableArray removeAllObjects](self->_suggestionUUIDs, "removeAllObjects");
}

- (void)addSuggestionUUIDs:(id)a3
{
  id v4;
  NSMutableArray *suggestionUUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  suggestionUUIDs = self->_suggestionUUIDs;
  v8 = v4;
  if (!suggestionUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_suggestionUUIDs;
    self->_suggestionUUIDs = v6;

    v4 = v8;
    suggestionUUIDs = self->_suggestionUUIDs;
  }
  -[NSMutableArray addObject:](suggestionUUIDs, "addObject:", v4);

}

- (unint64_t)suggestionUUIDsCount
{
  return -[NSMutableArray count](self->_suggestionUUIDs, "count");
}

- (id)suggestionUUIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_suggestionUUIDs, "objectAtIndex:", a3);
}

+ (Class)suggestionUUIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
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
  v8.super_class = (Class)ATXPBShortcutsEditorEvent;
  -[ATXPBShortcutsEditorEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBShortcutsEditorEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *blendingCacheId;
  NSMutableArray *suggestionUUIDs;
  ATXPBShortcutsEditorEventMetadata *metadata;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("date"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_eventType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("eventType"));

  }
  blendingCacheId = self->_blendingCacheId;
  if (blendingCacheId)
    objc_msgSend(v3, "setObject:forKey:", blendingCacheId, CFSTR("blendingCacheId"));
  suggestionUUIDs = self->_suggestionUUIDs;
  if (suggestionUUIDs)
    objc_msgSend(v3, "setObject:forKey:", suggestionUUIDs, CFSTR("suggestionUUIDs"));
  metadata = self->_metadata;
  if (metadata)
  {
    -[ATXPBShortcutsEditorEventMetadata dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("metadata"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBShortcutsEditorEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_blendingCacheId)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_suggestionUUIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_metadata)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_date;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_eventType;
    *((_BYTE *)v4 + 48) |= 2u;
  }
  v10 = v4;
  if (self->_blendingCacheId)
    objc_msgSend(v4, "setBlendingCacheId:");
  if (-[ATXPBShortcutsEditorEvent suggestionUUIDsCount](self, "suggestionUUIDsCount"))
  {
    objc_msgSend(v10, "clearSuggestionUUIDs");
    v6 = -[ATXPBShortcutsEditorEvent suggestionUUIDsCount](self, "suggestionUUIDsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[ATXPBShortcutsEditorEvent suggestionUUIDsAtIndex:](self, "suggestionUUIDsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSuggestionUUIDs:", v9);

      }
    }
  }
  if (self->_metadata)
    objc_msgSend(v10, "setMetadata:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_eventType;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_blendingCacheId, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_suggestionUUIDs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v6, "addSuggestionUUIDs:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = -[ATXPBShortcutsEditorEventMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v17 = (void *)v6[4];
  v6[4] = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *blendingCacheId;
  NSMutableArray *suggestionUUIDs;
  ATXPBShortcutsEditorEventMetadata *metadata;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_eventType != *((_QWORD *)v4 + 2))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_18;
  }
  blendingCacheId = self->_blendingCacheId;
  if ((unint64_t)blendingCacheId | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](blendingCacheId, "isEqual:"))
  {
    goto LABEL_18;
  }
  suggestionUUIDs = self->_suggestionUUIDs;
  if ((unint64_t)suggestionUUIDs | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](suggestionUUIDs, "isEqual:"))
      goto LABEL_18;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 4))
    v8 = -[ATXPBShortcutsEditorEventMetadata isEqual:](metadata, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double date;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    date = self->_date;
    v6 = -date;
    if (date >= 0.0)
      v6 = self->_date;
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
    v9 = 2654435761u * self->_eventType;
  else
    v9 = 0;
  v10 = v9 ^ v4 ^ -[NSString hash](self->_blendingCacheId, "hash");
  v11 = -[NSMutableArray hash](self->_suggestionUUIDs, "hash");
  return v10 ^ v11 ^ -[ATXPBShortcutsEditorEventMetadata hash](self->_metadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  ATXPBShortcutsEditorEventMetadata *metadata;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 1) != 0)
  {
    self->_date = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 48);
  }
  if ((v6 & 2) != 0)
  {
    self->_eventType = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
    -[ATXPBShortcutsEditorEvent setBlendingCacheId:](self, "setBlendingCacheId:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[ATXPBShortcutsEditorEvent addSuggestionUUIDs:](self, "addSuggestionUUIDs:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  metadata = self->_metadata;
  v13 = v5[4];
  if (metadata)
  {
    if (v13)
      -[ATXPBShortcutsEditorEventMetadata mergeFrom:](metadata, "mergeFrom:");
  }
  else if (v13)
  {
    -[ATXPBShortcutsEditorEvent setMetadata:](self, "setMetadata:");
  }

}

- (double)date
{
  return self->_date;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSString)blendingCacheId
{
  return self->_blendingCacheId;
}

- (void)setBlendingCacheId:(id)a3
{
  objc_storeStrong((id *)&self->_blendingCacheId, a3);
}

- (NSMutableArray)suggestionUUIDs
{
  return self->_suggestionUUIDs;
}

- (void)setSuggestionUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionUUIDs, a3);
}

- (ATXPBShortcutsEditorEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUUIDs, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_blendingCacheId, 0);
}

@end
