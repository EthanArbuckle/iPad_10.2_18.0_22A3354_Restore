@implementation ATXPBClientModelCacheUpdate

- (void)setUuidString:(id)a3
{
  objc_storeStrong((id *)&self->_uuidString, a3);
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (void)setResponseForRequestForSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_responseForRequestForSuggestions, a3);
}

- (void)setFeedbackMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackMetadata, a3);
}

- (void)setClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelId, a3);
}

- (void)setCacheCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cacheCreationDate = a3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBClientModelCacheUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)addSuggestions:(id)a3
{
  id v4;
  NSMutableArray *suggestions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  suggestions = self->_suggestions;
  v8 = v4;
  if (!suggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_suggestions;
    self->_suggestions = v6;

    v4 = v8;
    suggestions = self->_suggestions;
  }
  -[NSMutableArray addObject:](suggestions, "addObject:", v4);

}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (BOOL)hasResponseForRequestForSuggestions
{
  return self->_responseForRequestForSuggestions != 0;
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (double)cacheCreationDate
{
  return self->_cacheCreationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_responseForRequestForSuggestions, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uuidString)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_suggestions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_feedbackMetadata)
    PBDataWriterWriteDataField();
  if (self->_clientModelId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_responseForRequestForSuggestions)
    PBDataWriterWriteSubmessage();

}

- (void)clearSuggestions
{
  -[NSMutableArray removeAllObjects](self->_suggestions, "removeAllObjects");
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

- (BOOL)hasFeedbackMetadata
{
  return self->_feedbackMetadata != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setHasCacheCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCacheCreationDate
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
  v8.super_class = (Class)ATXPBClientModelCacheUpdate;
  -[ATXPBClientModelCacheUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBClientModelCacheUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuidString;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSData *feedbackMetadata;
  NSString *clientModelId;
  void *v15;
  ATXPBResponseForRequestForSuggestions *responseForRequestForSuggestions;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString)
    objc_msgSend(v3, "setObject:forKey:", uuidString, CFSTR("uuidString"));
  if (-[NSMutableArray count](self->_suggestions, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_suggestions, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_suggestions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("suggestions"));
  }
  feedbackMetadata = self->_feedbackMetadata;
  if (feedbackMetadata)
    objc_msgSend(v4, "setObject:forKey:", feedbackMetadata, CFSTR("feedbackMetadata"));
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v4, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cacheCreationDate);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("cacheCreationDate"));

  }
  responseForRequestForSuggestions = self->_responseForRequestForSuggestions;
  if (responseForRequestForSuggestions)
  {
    -[ATXPBResponseForRequestForSuggestions dictionaryRepresentation](responseForRequestForSuggestions, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("responseForRequestForSuggestions"));

  }
  return v4;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD *v8;
  id v9;

  v9 = a3;
  if (self->_uuidString)
    objc_msgSend(v9, "setUuidString:");
  if (-[ATXPBClientModelCacheUpdate suggestionsCount](self, "suggestionsCount"))
  {
    objc_msgSend(v9, "clearSuggestions");
    v4 = -[ATXPBClientModelCacheUpdate suggestionsCount](self, "suggestionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXPBClientModelCacheUpdate suggestionsAtIndex:](self, "suggestionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSuggestions:", v7);

      }
    }
  }
  if (self->_feedbackMetadata)
    objc_msgSend(v9, "setFeedbackMetadata:");
  v8 = v9;
  if (self->_clientModelId)
  {
    objc_msgSend(v9, "setClientModelId:");
    v8 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[1] = *(_QWORD *)&self->_cacheCreationDate;
    *((_BYTE *)v8 + 56) |= 1u;
  }
  if (self->_responseForRequestForSuggestions)
  {
    objc_msgSend(v9, "setResponseForRequestForSuggestions:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_suggestions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addSuggestions:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v14 = -[NSData copyWithZone:](self->_feedbackMetadata, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v16 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_cacheCreationDate;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v18 = -[ATXPBResponseForRequestForSuggestions copyWithZone:](self->_responseForRequestForSuggestions, "copyWithZone:", a3, (_QWORD)v21);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuidString;
  NSMutableArray *suggestions;
  NSData *feedbackMetadata;
  NSString *clientModelId;
  ATXPBResponseForRequestForSuggestions *responseForRequestForSuggestions;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:"))
      goto LABEL_17;
  }
  suggestions = self->_suggestions;
  if ((unint64_t)suggestions | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](suggestions, "isEqual:"))
      goto LABEL_17;
  }
  feedbackMetadata = self->_feedbackMetadata;
  if ((unint64_t)feedbackMetadata | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](feedbackMetadata, "isEqual:"))
      goto LABEL_17;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_cacheCreationDate != *((double *)v4 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  responseForRequestForSuggestions = self->_responseForRequestForSuggestions;
  if ((unint64_t)responseForRequestForSuggestions | *((_QWORD *)v4 + 4))
    v10 = -[ATXPBResponseForRequestForSuggestions isEqual:](responseForRequestForSuggestions, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  double cacheCreationDate;
  double v9;
  long double v10;
  double v11;

  v3 = -[NSString hash](self->_uuidString, "hash");
  v4 = -[NSMutableArray hash](self->_suggestions, "hash");
  v5 = -[NSData hash](self->_feedbackMetadata, "hash");
  v6 = -[NSString hash](self->_clientModelId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    cacheCreationDate = self->_cacheCreationDate;
    v9 = -cacheCreationDate;
    if (cacheCreationDate >= 0.0)
      v9 = self->_cacheCreationDate;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[ATXPBResponseForRequestForSuggestions hash](self->_responseForRequestForSuggestions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  ATXPBResponseForRequestForSuggestions *responseForRequestForSuggestions;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 6))
    -[ATXPBClientModelCacheUpdate setUuidString:](self, "setUuidString:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[ATXPBClientModelCacheUpdate addSuggestions:](self, "addSuggestions:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 3))
    -[ATXPBClientModelCacheUpdate setFeedbackMetadata:](self, "setFeedbackMetadata:");
  if (*((_QWORD *)v4 + 2))
    -[ATXPBClientModelCacheUpdate setClientModelId:](self, "setClientModelId:");
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_cacheCreationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  responseForRequestForSuggestions = self->_responseForRequestForSuggestions;
  v11 = *((_QWORD *)v4 + 4);
  if (responseForRequestForSuggestions)
  {
    if (v11)
      -[ATXPBResponseForRequestForSuggestions mergeFrom:](responseForRequestForSuggestions, "mergeFrom:");
  }
  else if (v11)
  {
    -[ATXPBClientModelCacheUpdate setResponseForRequestForSuggestions:](self, "setResponseForRequestForSuggestions:");
  }

}

- (ATXPBResponseForRequestForSuggestions)responseForRequestForSuggestions
{
  return self->_responseForRequestForSuggestions;
}

@end
