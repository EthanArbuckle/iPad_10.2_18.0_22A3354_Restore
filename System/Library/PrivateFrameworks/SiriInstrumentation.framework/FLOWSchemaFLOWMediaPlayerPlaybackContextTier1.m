@implementation FLOWSchemaFLOWMediaPlayerPlaybackContextTier1

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
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FLOWSchemaFLOWMediaPlayerPlaybackContextTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v18, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteContentTitle](self, "deleteContentTitle");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteAdamId](self, "deleteAdamId");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteAdamIdString](self, "deleteAdamIdString");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteSearchResults](self, "deleteSearchResults");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraph](self, "deleteU2UsoGraph");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraphTier1](self, "deleteU2UsoGraphTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteContentTitle](self, "deleteContentTitle");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteAdamId](self, "deleteAdamId");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteAdamIdString](self, "deleteAdamIdString");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteSearchResults](self, "deleteSearchResults");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraph](self, "deleteU2UsoGraph");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraphTier1](self, "deleteU2UsoGraphTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteContentTitle](self, "deleteContentTitle");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteAdamId](self, "deleteAdamId");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteAdamIdString](self, "deleteAdamIdString");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteSearchResults](self, "deleteSearchResults");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraph](self, "deleteU2UsoGraph");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraphTier1](self, "deleteU2UsoGraphTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteContentTitle](self, "deleteContentTitle");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteAdamId](self, "deleteAdamId");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteAdamIdString](self, "deleteAdamIdString");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteSearchResults](self, "deleteSearchResults");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraph](self, "deleteU2UsoGraph");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraphTier1](self, "deleteU2UsoGraphTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteContentTitle](self, "deleteContentTitle");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteAdamId](self, "deleteAdamId");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteAdamIdString](self, "deleteAdamIdString");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteSearchResults](self, "deleteSearchResults");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraph](self, "deleteU2UsoGraph");
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraphTier1](self, "deleteU2UsoGraphTier1");
  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteLinkId](self, "deleteLinkId");
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 searchResults](self, "searchResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setSearchResults:](self, "setSearchResults:", v10);

  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraph](self, "u2UsoGraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraph](self, "deleteU2UsoGraph");
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraphTier1](self, "u2UsoGraphTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySensitiveConditionsPolicy:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "suppressMessage");

  if (v16)
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 deleteU2UsoGraphTier1](self, "deleteU2UsoGraphTier1");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasContentTitle
{
  return self->_contentTitle != 0;
}

- (void)deleteContentTitle
{
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setContentTitle:](self, "setContentTitle:", 0);
}

- (void)setAdamId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (BOOL)hasAdamId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAdamId
{
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setAdamId:](self, "setAdamId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAdamIdString
{
  return self->_adamIdString != 0;
}

- (void)deleteAdamIdString
{
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setAdamIdString:](self, "setAdamIdString:", 0);
}

- (void)clearSearchResults
{
  -[NSArray removeAllObjects](self->_searchResults, "removeAllObjects");
}

- (void)addSearchResults:(id)a3
{
  id v4;
  NSArray *searchResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  searchResults = self->_searchResults;
  v8 = v4;
  if (!searchResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_searchResults;
    self->_searchResults = v6;

    v4 = v8;
    searchResults = self->_searchResults;
  }
  -[NSArray addObject:](searchResults, "addObject:", v4);

}

- (unint64_t)searchResultsCount
{
  return -[NSArray count](self->_searchResults, "count");
}

- (id)searchResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_searchResults, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasU2UsoGraph
{
  return self->_u2UsoGraph != 0;
}

- (void)deleteU2UsoGraph
{
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setU2UsoGraph:](self, "setU2UsoGraph:", 0);
}

- (BOOL)hasU2UsoGraphTier1
{
  return self->_u2UsoGraphTier1 != 0;
}

- (void)deleteU2UsoGraphTier1
{
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setU2UsoGraphTier1:](self, "setU2UsoGraphTier1:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMediaPlayerPlaybackContextTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
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
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 contentTitle](self, "contentTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 adamIdString](self, "adamIdString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_searchResults;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraph](self, "u2UsoGraph", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraph](self, "u2UsoGraph");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraphTier1](self, "u2UsoGraphTier1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraphTier1](self, "u2UsoGraphTier1");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
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
  unsigned int adamId;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  BOOL v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_35;
  }
  else
  {

  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 contentTitle](self, "contentTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 contentTitle](self, "contentTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 contentTitle](self, "contentTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_35;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[64] & 1))
    goto LABEL_35;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    adamId = self->_adamId;
    if (adamId != objc_msgSend(v4, "adamId"))
      goto LABEL_35;
  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 adamIdString](self, "adamIdString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adamIdString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 adamIdString](self, "adamIdString");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 adamIdString](self, "adamIdString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adamIdString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_35;
  }
  else
  {

  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 searchResults](self, "searchResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 searchResults](self, "searchResults");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 searchResults](self, "searchResults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchResults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_35;
  }
  else
  {

  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraph](self, "u2UsoGraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "u2UsoGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraph](self, "u2UsoGraph");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraph](self, "u2UsoGraph");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "u2UsoGraph");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_35;
  }
  else
  {

  }
  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraphTier1](self, "u2UsoGraphTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "u2UsoGraphTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraphTier1](self, "u2UsoGraphTier1");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_38:
      v38 = 1;
      goto LABEL_36;
    }
    v34 = (void *)v33;
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraphTier1](self, "u2UsoGraphTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "u2UsoGraphTier1");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) != 0)
      goto LABEL_38;
  }
  else
  {
LABEL_34:

  }
LABEL_35:
  v38 = 0;
LABEL_36:

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSString hash](self->_contentTitle, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_adamId;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_adamIdString, "hash");
  v7 = -[NSArray hash](self->_searchResults, "hash");
  v8 = v7 ^ -[USOSchemaUSOGraph hash](self->_u2UsoGraph, "hash");
  return v6 ^ v8 ^ -[USOSchemaUSOGraphTier1 hash](self->_u2UsoGraphTier1, "hash");
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
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 adamId](self, "adamId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("adamId"));

  }
  if (self->_adamIdString)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 adamIdString](self, "adamIdString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("adamIdString"));

  }
  if (self->_contentTitle)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 contentTitle](self, "contentTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contentTitle"));

  }
  if (self->_linkId)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("linkId"));

    }
  }
  if (-[NSArray count](self->_searchResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = self->_searchResults;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v27);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("searchResults"));
  }
  if (self->_u2UsoGraph)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraph](self, "u2UsoGraph");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("u2UsoGraph"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("u2UsoGraph"));

    }
  }
  if (self->_u2UsoGraphTier1)
  {
    -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 u2UsoGraphTier1](self, "u2UsoGraphTier1");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("u2UsoGraphTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("u2UsoGraphTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v27);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *v5;
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
    self = -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  FLOWSchemaFLOWMediaPlayerMediaItem *v21;
  void *v22;
  USOSchemaUSOGraph *v23;
  void *v24;
  USOSchemaUSOGraphTier1 *v25;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)FLOWSchemaFLOWMediaPlayerPlaybackContextTier1;
  v5 = -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v10 = (void *)objc_msgSend(v8, "copy");
      -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setContentTitle:](v5, "setContentTitle:", v10);

      v8 = v9;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adamId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setAdamId:](v5, "setAdamId:", objc_msgSend(v11, "unsignedIntValue"));
    v31 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adamIdString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setAdamIdString:](v5, "setAdamIdString:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchResults"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v12;
      v29 = v8;
      v30 = v6;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = -[FLOWSchemaFLOWMediaPlayerMediaItem initWithDictionary:]([FLOWSchemaFLOWMediaPlayerMediaItem alloc], "initWithDictionary:", v20);
              -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 addSearchResults:](v5, "addSearchResults:", v21);

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v17);
      }

      v6 = v30;
      v12 = v28;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("u2UsoGraph"), v28, v29, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[USOSchemaUSOGraph initWithDictionary:]([USOSchemaUSOGraph alloc], "initWithDictionary:", v22);
      -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setU2UsoGraph:](v5, "setU2UsoGraph:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("u2UsoGraphTier1"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[USOSchemaUSOGraphTier1 initWithDictionary:]([USOSchemaUSOGraphTier1 alloc], "initWithDictionary:", v24);
      -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 setU2UsoGraphTier1:](v5, "setU2UsoGraphTier1:", v25);

    }
    v26 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (NSString)contentTitle
{
  return self->_contentTitle;
}

- (void)setContentTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)adamId
{
  return self->_adamId;
}

- (NSString)adamIdString
{
  return self->_adamIdString;
}

- (void)setAdamIdString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (USOSchemaUSOGraph)u2UsoGraph
{
  return self->_u2UsoGraph;
}

- (void)setU2UsoGraph:(id)a3
{
  objc_storeStrong((id *)&self->_u2UsoGraph, a3);
}

- (USOSchemaUSOGraphTier1)u2UsoGraphTier1
{
  return self->_u2UsoGraphTier1;
}

- (void)setU2UsoGraphTier1:(id)a3
{
  objc_storeStrong((id *)&self->_u2UsoGraphTier1, a3);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasContentTitle:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAdamIdString:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasU2UsoGraph:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasU2UsoGraphTier1:(BOOL)a3
{
  self->_hasContentTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_u2UsoGraphTier1, 0);
  objc_storeStrong((id *)&self->_u2UsoGraph, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_adamIdString, 0);
  objc_storeStrong((id *)&self->_contentTitle, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
