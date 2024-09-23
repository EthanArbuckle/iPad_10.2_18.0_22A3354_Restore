@implementation POMMESSchemaPOMMESPegasusRequestArguments

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
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)POMMESSchemaPOMMESPegasusRequestArguments;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v18, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESPegasusRequestArguments queries](self, "queries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESPegasusRequestArguments setQueries:](self, "setQueries:", v7);

  -[POMMESSchemaPOMMESPegasusRequestArguments queryMetadata](self, "queryMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suppressMessage");

  if (v10)
    -[POMMESSchemaPOMMESPegasusRequestArguments deleteQueryMetadata](self, "deleteQueryMetadata");
  -[POMMESSchemaPOMMESPegasusRequestArguments siriPegasusMetadata](self, "siriPegasusMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[POMMESSchemaPOMMESPegasusRequestArguments deleteSiriPegasusMetadata](self, "deleteSiriPegasusMetadata");
  -[POMMESSchemaPOMMESPegasusRequestArguments clientConversationMetadata](self, "clientConversationMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySensitiveConditionsPolicy:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "suppressMessage");

  if (v16)
    -[POMMESSchemaPOMMESPegasusRequestArguments deleteClientConversationMetadata](self, "deleteClientConversationMetadata");

  return v5;
}

- (void)clearQueries
{
  -[NSArray removeAllObjects](self->_queries, "removeAllObjects");
}

- (void)addQueries:(id)a3
{
  id v4;
  NSArray *queries;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  queries = self->_queries;
  v8 = v4;
  if (!queries)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_queries;
    self->_queries = v6;

    v4 = v8;
    queries = self->_queries;
  }
  -[NSArray addObject:](queries, "addObject:", v4);

}

- (unint64_t)queriesCount
{
  return -[NSArray count](self->_queries, "count");
}

- (id)queriesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_queries, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasQueryMetadata
{
  return self->_queryMetadata != 0;
}

- (void)deleteQueryMetadata
{
  -[POMMESSchemaPOMMESPegasusRequestArguments setQueryMetadata:](self, "setQueryMetadata:", 0);
}

- (BOOL)hasFeatureFlag
{
  return self->_featureFlag != 0;
}

- (void)deleteFeatureFlag
{
  -[POMMESSchemaPOMMESPegasusRequestArguments setFeatureFlag:](self, "setFeatureFlag:", 0);
}

- (BOOL)hasSiriPegasusMetadata
{
  return self->_siriPegasusMetadata != 0;
}

- (void)deleteSiriPegasusMetadata
{
  -[POMMESSchemaPOMMESPegasusRequestArguments setSiriPegasusMetadata:](self, "setSiriPegasusMetadata:", 0);
}

- (void)setIsDataOnlyRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isDataOnlyRequest = a3;
}

- (BOOL)hasIsDataOnlyRequest
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsDataOnlyRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsDataOnlyRequest
{
  -[POMMESSchemaPOMMESPegasusRequestArguments setIsDataOnlyRequest:](self, "setIsDataOnlyRequest:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasClientConversationMetadata
{
  return self->_clientConversationMetadata != 0;
}

- (void)deleteClientConversationMetadata
{
  -[POMMESSchemaPOMMESPegasusRequestArguments setClientConversationMetadata:](self, "setClientConversationMetadata:", 0);
}

- (void)setConversationContextBytesLength:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_conversationContextBytesLength = a3;
}

- (BOOL)hasConversationContextBytesLength
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasConversationContextBytesLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteConversationContextBytesLength
{
  -[POMMESSchemaPOMMESPegasusRequestArguments setConversationContextBytesLength:](self, "setConversationContextBytesLength:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasPersonalDomainFallback
{
  return self->_personalDomainFallback != 0;
}

- (void)deletePersonalDomainFallback
{
  -[POMMESSchemaPOMMESPegasusRequestArguments setPersonalDomainFallback:](self, "setPersonalDomainFallback:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusRequestArgumentsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_queries;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  -[POMMESSchemaPOMMESPegasusRequestArguments queryMetadata](self, "queryMetadata", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[POMMESSchemaPOMMESPegasusRequestArguments queryMetadata](self, "queryMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESPegasusRequestArguments featureFlag](self, "featureFlag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[POMMESSchemaPOMMESPegasusRequestArguments siriPegasusMetadata](self, "siriPegasusMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[POMMESSchemaPOMMESPegasusRequestArguments siriPegasusMetadata](self, "siriPegasusMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[POMMESSchemaPOMMESPegasusRequestArguments clientConversationMetadata](self, "clientConversationMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[POMMESSchemaPOMMESPegasusRequestArguments clientConversationMetadata](self, "clientConversationMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[POMMESSchemaPOMMESPegasusRequestArguments personalDomainFallback](self, "personalDomainFallback");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();

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
  int isDataOnlyRequest;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  unsigned int conversationContextBytesLength;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  BOOL v40;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  -[POMMESSchemaPOMMESPegasusRequestArguments queries](self, "queries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[POMMESSchemaPOMMESPegasusRequestArguments queries](self, "queries");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[POMMESSchemaPOMMESPegasusRequestArguments queries](self, "queries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_38;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESPegasusRequestArguments queryMetadata](self, "queryMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[POMMESSchemaPOMMESPegasusRequestArguments queryMetadata](self, "queryMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[POMMESSchemaPOMMESPegasusRequestArguments queryMetadata](self, "queryMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_38;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESPegasusRequestArguments featureFlag](self, "featureFlag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[POMMESSchemaPOMMESPegasusRequestArguments featureFlag](self, "featureFlag");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[POMMESSchemaPOMMESPegasusRequestArguments featureFlag](self, "featureFlag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureFlag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_38;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESPegasusRequestArguments siriPegasusMetadata](self, "siriPegasusMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriPegasusMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[POMMESSchemaPOMMESPegasusRequestArguments siriPegasusMetadata](self, "siriPegasusMetadata");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[POMMESSchemaPOMMESPegasusRequestArguments siriPegasusMetadata](self, "siriPegasusMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriPegasusMetadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_38;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[72] & 1))
    goto LABEL_38;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isDataOnlyRequest = self->_isDataOnlyRequest;
    if (isDataOnlyRequest != objc_msgSend(v4, "isDataOnlyRequest"))
      goto LABEL_38;
  }
  -[POMMESSchemaPOMMESPegasusRequestArguments clientConversationMetadata](self, "clientConversationMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientConversationMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[POMMESSchemaPOMMESPegasusRequestArguments clientConversationMetadata](self, "clientConversationMetadata");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[POMMESSchemaPOMMESPegasusRequestArguments clientConversationMetadata](self, "clientConversationMetadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientConversationMetadata");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_38;
  }
  else
  {

  }
  v33 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v33 != ((v4[72] >> 1) & 1))
    goto LABEL_38;
  if (v33)
  {
    conversationContextBytesLength = self->_conversationContextBytesLength;
    if (conversationContextBytesLength != objc_msgSend(v4, "conversationContextBytesLength"))
      goto LABEL_38;
  }
  -[POMMESSchemaPOMMESPegasusRequestArguments personalDomainFallback](self, "personalDomainFallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalDomainFallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[POMMESSchemaPOMMESPegasusRequestArguments personalDomainFallback](self, "personalDomainFallback");
    v35 = objc_claimAutoreleasedReturnValue();
    if (!v35)
    {

LABEL_41:
      v40 = 1;
      goto LABEL_39;
    }
    v36 = (void *)v35;
    -[POMMESSchemaPOMMESPegasusRequestArguments personalDomainFallback](self, "personalDomainFallback");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personalDomainFallback");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqual:", v38);

    if ((v39 & 1) != 0)
      goto LABEL_41;
  }
  else
  {
LABEL_37:

  }
LABEL_38:
  v40 = 0;
LABEL_39:

  return v40;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[NSArray hash](self->_queries, "hash");
  v4 = -[POMMESSchemaPOMMESPegasusQueryMetadata hash](self->_queryMetadata, "hash");
  v5 = -[NSString hash](self->_featureFlag, "hash");
  v6 = -[POMMESSchemaPOMMESSiriPegasusMetadata hash](self->_siriPegasusMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_isDataOnlyRequest;
  else
    v7 = 0;
  v8 = -[POMMESSchemaPOMMESClientConversationMetadata hash](self->_clientConversationMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_conversationContextBytesLength;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_personalDomainFallback, "hash");
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
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clientConversationMetadata)
  {
    -[POMMESSchemaPOMMESPegasusRequestArguments clientConversationMetadata](self, "clientConversationMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clientConversationMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientConversationMetadata"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusRequestArguments conversationContextBytesLength](self, "conversationContextBytesLength"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("conversationContextBytesLength"));

  }
  if (self->_featureFlag)
  {
    -[POMMESSchemaPOMMESPegasusRequestArguments featureFlag](self, "featureFlag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("featureFlag"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusRequestArguments isDataOnlyRequest](self, "isDataOnlyRequest"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isDataOnlyRequest"));

  }
  if (self->_personalDomainFallback)
  {
    -[POMMESSchemaPOMMESPegasusRequestArguments personalDomainFallback](self, "personalDomainFallback");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("personalDomainFallback"));

  }
  if (-[NSArray count](self->_queries, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = self->_queries;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v13, "addObject:", v19);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v20);

          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("queries"));
  }
  if (self->_queryMetadata)
  {
    -[POMMESSchemaPOMMESPegasusRequestArguments queryMetadata](self, "queryMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("queryMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("queryMetadata"));

    }
  }
  if (self->_siriPegasusMetadata)
  {
    -[POMMESSchemaPOMMESPegasusRequestArguments siriPegasusMetadata](self, "siriPegasusMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("siriPegasusMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("siriPegasusMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v28);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESPegasusRequestArguments dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESPegasusRequestArguments)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESPegasusRequestArguments *v5;
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
    self = -[POMMESSchemaPOMMESPegasusRequestArguments initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESPegasusRequestArguments)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESPegasusRequestArguments *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  POMMESSchemaPOMMESPegasusSearchQuery *v13;
  void *v14;
  POMMESSchemaPOMMESPegasusQueryMetadata *v15;
  void *v16;
  void *v17;
  void *v18;
  POMMESSchemaPOMMESSiriPegasusMetadata *v19;
  void *v20;
  void *v21;
  POMMESSchemaPOMMESClientConversationMetadata *v22;
  void *v23;
  void *v24;
  void *v25;
  POMMESSchemaPOMMESPegasusRequestArguments *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)POMMESSchemaPOMMESPegasusRequestArguments;
  v5 = -[POMMESSchemaPOMMESPegasusRequestArguments init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queries"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v30;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v30 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[POMMESSchemaPOMMESPegasusSearchQuery initWithDictionary:]([POMMESSchemaPOMMESPegasusSearchQuery alloc], "initWithDictionary:", v12);
              -[POMMESSchemaPOMMESPegasusRequestArguments addQueries:](v5, "addQueries:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryMetadata"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[POMMESSchemaPOMMESPegasusQueryMetadata initWithDictionary:]([POMMESSchemaPOMMESPegasusQueryMetadata alloc], "initWithDictionary:", v14);
      -[POMMESSchemaPOMMESPegasusRequestArguments setQueryMetadata:](v5, "setQueryMetadata:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("featureFlag"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[POMMESSchemaPOMMESPegasusRequestArguments setFeatureFlag:](v5, "setFeatureFlag:", v17);

    }
    v28 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriPegasusMetadata"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[POMMESSchemaPOMMESSiriPegasusMetadata initWithDictionary:]([POMMESSchemaPOMMESSiriPegasusMetadata alloc], "initWithDictionary:", v18);
      -[POMMESSchemaPOMMESPegasusRequestArguments setSiriPegasusMetadata:](v5, "setSiriPegasusMetadata:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDataOnlyRequest"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusRequestArguments setIsDataOnlyRequest:](v5, "setIsDataOnlyRequest:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientConversationMetadata"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[POMMESSchemaPOMMESClientConversationMetadata initWithDictionary:]([POMMESSchemaPOMMESClientConversationMetadata alloc], "initWithDictionary:", v21);
      -[POMMESSchemaPOMMESPegasusRequestArguments setClientConversationMetadata:](v5, "setClientConversationMetadata:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conversationContextBytesLength"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusRequestArguments setConversationContextBytesLength:](v5, "setConversationContextBytesLength:", objc_msgSend(v23, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalDomainFallback"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[POMMESSchemaPOMMESPegasusRequestArguments setPersonalDomainFallback:](v5, "setPersonalDomainFallback:", v25);

    }
    v26 = v5;

  }
  return v5;
}

- (NSArray)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (POMMESSchemaPOMMESPegasusQueryMetadata)queryMetadata
{
  return self->_queryMetadata;
}

- (void)setQueryMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_queryMetadata, a3);
}

- (NSString)featureFlag
{
  return self->_featureFlag;
}

- (void)setFeatureFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (POMMESSchemaPOMMESSiriPegasusMetadata)siriPegasusMetadata
{
  return self->_siriPegasusMetadata;
}

- (void)setSiriPegasusMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_siriPegasusMetadata, a3);
}

- (BOOL)isDataOnlyRequest
{
  return self->_isDataOnlyRequest;
}

- (POMMESSchemaPOMMESClientConversationMetadata)clientConversationMetadata
{
  return self->_clientConversationMetadata;
}

- (void)setClientConversationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_clientConversationMetadata, a3);
}

- (unsigned)conversationContextBytesLength
{
  return self->_conversationContextBytesLength;
}

- (NSString)personalDomainFallback
{
  return self->_personalDomainFallback;
}

- (void)setPersonalDomainFallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setHasQueryMetadata:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasFeatureFlag:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasSiriPegasusMetadata:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasClientConversationMetadata:(BOOL)a3
{
  self->_hasQueryMetadata = a3;
}

- (void)setHasPersonalDomainFallback:(BOOL)a3
{
  self->_hasFeatureFlag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalDomainFallback, 0);
  objc_storeStrong((id *)&self->_clientConversationMetadata, 0);
  objc_storeStrong((id *)&self->_siriPegasusMetadata, 0);
  objc_storeStrong((id *)&self->_featureFlag, 0);
  objc_storeStrong((id *)&self->_queryMetadata, 0);
  objc_storeStrong((id *)&self->_queries, 0);
}

@end
