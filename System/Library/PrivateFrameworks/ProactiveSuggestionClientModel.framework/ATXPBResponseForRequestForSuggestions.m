@implementation ATXPBResponseForRequestForSuggestions

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (void)clearSuggestions
{
  -[NSMutableArray removeAllObjects](self->_suggestions, "removeAllObjects");
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

- (int)responseCode
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_responseCode;
  else
    return 0;
}

- (void)setResponseCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_responseCode = a3;
}

- (void)setHasResponseCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)responseCodeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E57CFC78[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResponseCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FallbackToCache")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Success")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Error")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SuccessAndReplaceCache")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Max")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasInteractionSuggestionRequest
{
  return self->_interactionSuggestionRequest != 0;
}

- (BOOL)hasContextualActionSuggestionRequest
{
  return self->_contextualActionSuggestionRequest != 0;
}

- (BOOL)hasIntentSuggestionRequest
{
  return self->_intentSuggestionRequest != 0;
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
  v8.super_class = (Class)ATXPBResponseForRequestForSuggestions;
  -[ATXPBResponseForRequestForSuggestions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBResponseForRequestForSuggestions dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t responseCode;
  __CFString *v15;
  NSData *errorData;
  ATXPBRequestForInteractionSuggestions *interactionSuggestionRequest;
  void *v18;
  ATXPBRequestForContextualActionSuggestions *contextualActionSuggestionRequest;
  void *v20;
  ATXPBRequestForIntentSuggestions *intentSuggestionRequest;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString)
    objc_msgSend(v3, "setObject:forKey:", uuidString, CFSTR("uuidString"));
  if (-[NSMutableArray count](self->_suggestions, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_suggestions, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = self->_suggestions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("suggestions"));
  }
  feedbackMetadata = self->_feedbackMetadata;
  if (feedbackMetadata)
    objc_msgSend(v4, "setObject:forKey:", feedbackMetadata, CFSTR("feedbackMetadata"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    responseCode = self->_responseCode;
    if (responseCode >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_responseCode);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E57CFC78[responseCode];
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("responseCode"));

  }
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v4, "setObject:forKey:", errorData, CFSTR("errorData"));
  interactionSuggestionRequest = self->_interactionSuggestionRequest;
  if (interactionSuggestionRequest)
  {
    -[ATXPBRequestForInteractionSuggestions dictionaryRepresentation](interactionSuggestionRequest, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("interactionSuggestionRequest"));

  }
  contextualActionSuggestionRequest = self->_contextualActionSuggestionRequest;
  if (contextualActionSuggestionRequest)
  {
    -[ATXPBRequestForContextualActionSuggestions dictionaryRepresentation](contextualActionSuggestionRequest, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("contextualActionSuggestionRequest"));

  }
  intentSuggestionRequest = self->_intentSuggestionRequest;
  if (intentSuggestionRequest)
  {
    -[ATXPBRequestForIntentSuggestions dictionaryRepresentation](intentSuggestionRequest, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("intentSuggestionRequest"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBResponseForRequestForSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_errorData)
    PBDataWriterWriteDataField();
  if (self->_interactionSuggestionRequest)
    PBDataWriterWriteSubmessage();
  if (self->_contextualActionSuggestionRequest)
    PBDataWriterWriteSubmessage();
  if (self->_intentSuggestionRequest)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_uuidString)
    objc_msgSend(v9, "setUuidString:");
  if (-[ATXPBResponseForRequestForSuggestions suggestionsCount](self, "suggestionsCount"))
  {
    objc_msgSend(v9, "clearSuggestions");
    v4 = -[ATXPBResponseForRequestForSuggestions suggestionsCount](self, "suggestionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXPBResponseForRequestForSuggestions suggestionsAtIndex:](self, "suggestionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSuggestions:", v7);

      }
    }
  }
  if (self->_feedbackMetadata)
    objc_msgSend(v9, "setFeedbackMetadata:");
  v8 = v9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v9 + 12) = self->_responseCode;
    *((_BYTE *)v9 + 72) |= 1u;
  }
  if (self->_errorData)
  {
    objc_msgSend(v9, "setErrorData:");
    v8 = v9;
  }
  if (self->_interactionSuggestionRequest)
  {
    objc_msgSend(v9, "setInteractionSuggestionRequest:");
    v8 = v9;
  }
  if (self->_contextualActionSuggestionRequest)
  {
    objc_msgSend(v9, "setContextualActionSuggestionRequest:");
    v8 = v9;
  }
  if (self->_intentSuggestionRequest)
  {
    objc_msgSend(v9, "setIntentSuggestionRequest:");
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
  id v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_suggestions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addSuggestions:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  v14 = -[NSData copyWithZone:](self->_feedbackMetadata, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_responseCode;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v16 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3, (_QWORD)v25);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  v18 = -[ATXPBRequestForInteractionSuggestions copyWithZone:](self->_interactionSuggestionRequest, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  v20 = -[ATXPBRequestForContextualActionSuggestions copyWithZone:](self->_contextualActionSuggestionRequest, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v20;

  v22 = -[ATXPBRequestForIntentSuggestions copyWithZone:](self->_intentSuggestionRequest, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v22;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuidString;
  NSMutableArray *suggestions;
  NSData *feedbackMetadata;
  NSData *errorData;
  ATXPBRequestForInteractionSuggestions *interactionSuggestionRequest;
  ATXPBRequestForContextualActionSuggestions *contextualActionSuggestionRequest;
  ATXPBRequestForIntentSuggestions *intentSuggestionRequest;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:"))
      goto LABEL_21;
  }
  suggestions = self->_suggestions;
  if ((unint64_t)suggestions | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](suggestions, "isEqual:"))
      goto LABEL_21;
  }
  feedbackMetadata = self->_feedbackMetadata;
  if ((unint64_t)feedbackMetadata | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](feedbackMetadata, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_responseCode != *((_DWORD *)v4 + 12))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](errorData, "isEqual:"))
    goto LABEL_21;
  interactionSuggestionRequest = self->_interactionSuggestionRequest;
  if ((unint64_t)interactionSuggestionRequest | *((_QWORD *)v4 + 5))
  {
    if (!-[ATXPBRequestForInteractionSuggestions isEqual:](interactionSuggestionRequest, "isEqual:"))
      goto LABEL_21;
  }
  contextualActionSuggestionRequest = self->_contextualActionSuggestionRequest;
  if ((unint64_t)contextualActionSuggestionRequest | *((_QWORD *)v4 + 1))
  {
    if (!-[ATXPBRequestForContextualActionSuggestions isEqual:](contextualActionSuggestionRequest, "isEqual:"))
      goto LABEL_21;
  }
  intentSuggestionRequest = self->_intentSuggestionRequest;
  if ((unint64_t)intentSuggestionRequest | *((_QWORD *)v4 + 4))
    v12 = -[ATXPBRequestForIntentSuggestions isEqual:](intentSuggestionRequest, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_uuidString, "hash");
  v4 = -[NSMutableArray hash](self->_suggestions, "hash");
  v5 = -[NSData hash](self->_feedbackMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_responseCode;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[NSData hash](self->_errorData, "hash");
  v9 = v8 ^ -[ATXPBRequestForInteractionSuggestions hash](self->_interactionSuggestionRequest, "hash");
  v10 = v7 ^ v9 ^ -[ATXPBRequestForContextualActionSuggestions hash](self->_contextualActionSuggestionRequest, "hash");
  return v10 ^ -[ATXPBRequestForIntentSuggestions hash](self->_intentSuggestionRequest, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  ATXPBRequestForInteractionSuggestions *interactionSuggestionRequest;
  uint64_t v11;
  ATXPBRequestForContextualActionSuggestions *contextualActionSuggestionRequest;
  uint64_t v13;
  ATXPBRequestForIntentSuggestions *intentSuggestionRequest;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 8))
    -[ATXPBResponseForRequestForSuggestions setUuidString:](self, "setUuidString:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *((id *)v4 + 7);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        -[ATXPBResponseForRequestForSuggestions addSuggestions:](self, "addSuggestions:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 3))
    -[ATXPBResponseForRequestForSuggestions setFeedbackMetadata:](self, "setFeedbackMetadata:");
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    self->_responseCode = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[ATXPBResponseForRequestForSuggestions setErrorData:](self, "setErrorData:");
  interactionSuggestionRequest = self->_interactionSuggestionRequest;
  v11 = *((_QWORD *)v4 + 5);
  if (interactionSuggestionRequest)
  {
    if (v11)
      -[ATXPBRequestForInteractionSuggestions mergeFrom:](interactionSuggestionRequest, "mergeFrom:");
  }
  else if (v11)
  {
    -[ATXPBResponseForRequestForSuggestions setInteractionSuggestionRequest:](self, "setInteractionSuggestionRequest:");
  }
  contextualActionSuggestionRequest = self->_contextualActionSuggestionRequest;
  v13 = *((_QWORD *)v4 + 1);
  if (contextualActionSuggestionRequest)
  {
    if (v13)
      -[ATXPBRequestForContextualActionSuggestions mergeFrom:](contextualActionSuggestionRequest, "mergeFrom:");
  }
  else if (v13)
  {
    -[ATXPBResponseForRequestForSuggestions setContextualActionSuggestionRequest:](self, "setContextualActionSuggestionRequest:");
  }
  intentSuggestionRequest = self->_intentSuggestionRequest;
  v15 = *((_QWORD *)v4 + 4);
  if (intentSuggestionRequest)
  {
    if (v15)
      -[ATXPBRequestForIntentSuggestions mergeFrom:](intentSuggestionRequest, "mergeFrom:");
  }
  else if (v15)
  {
    -[ATXPBResponseForRequestForSuggestions setIntentSuggestionRequest:](self, "setIntentSuggestionRequest:");
  }

}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_storeStrong((id *)&self->_uuidString, a3);
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (void)setFeedbackMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackMetadata, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (ATXPBRequestForInteractionSuggestions)interactionSuggestionRequest
{
  return self->_interactionSuggestionRequest;
}

- (void)setInteractionSuggestionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_interactionSuggestionRequest, a3);
}

- (ATXPBRequestForContextualActionSuggestions)contextualActionSuggestionRequest
{
  return self->_contextualActionSuggestionRequest;
}

- (void)setContextualActionSuggestionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_contextualActionSuggestionRequest, a3);
}

- (ATXPBRequestForIntentSuggestions)intentSuggestionRequest
{
  return self->_intentSuggestionRequest;
}

- (void)setIntentSuggestionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_intentSuggestionRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_interactionSuggestionRequest, 0);
  objc_storeStrong((id *)&self->_intentSuggestionRequest, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_contextualActionSuggestionRequest, 0);
}

@end
