@implementation PEGASUSSchemaPEGASUSUtteranceUnderstandingReported

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
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PEGASUSSchemaPEGASUSUtteranceUnderstandingReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v14, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported deleteLinkId](self, "deleteLinkId");
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported topU2IntentsMetadatas](self, "topU2IntentsMetadatas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported setTopU2IntentsMetadatas:](self, "setTopU2IntentsMetadatas:", v10);

  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported topKGSAIntentsMetadatas](self, "topKGSAIntentsMetadatas");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported setTopKGSAIntentsMetadatas:](self, "setTopKGSAIntentsMetadatas:", v12);

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported setLinkId:](self, "setLinkId:", 0);
}

- (void)clearTopU2IntentsMetadata
{
  -[NSArray removeAllObjects](self->_topU2IntentsMetadatas, "removeAllObjects");
}

- (void)addTopU2IntentsMetadata:(id)a3
{
  id v4;
  NSArray *topU2IntentsMetadatas;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  topU2IntentsMetadatas = self->_topU2IntentsMetadatas;
  v8 = v4;
  if (!topU2IntentsMetadatas)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_topU2IntentsMetadatas;
    self->_topU2IntentsMetadatas = v6;

    v4 = v8;
    topU2IntentsMetadatas = self->_topU2IntentsMetadatas;
  }
  -[NSArray addObject:](topU2IntentsMetadatas, "addObject:", v4);

}

- (unint64_t)topU2IntentsMetadataCount
{
  return -[NSArray count](self->_topU2IntentsMetadatas, "count");
}

- (id)topU2IntentsMetadataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_topU2IntentsMetadatas, "objectAtIndexedSubscript:", a3);
}

- (void)clearTopKGSAIntentsMetadata
{
  -[NSArray removeAllObjects](self->_topKGSAIntentsMetadatas, "removeAllObjects");
}

- (void)addTopKGSAIntentsMetadata:(id)a3
{
  id v4;
  NSArray *topKGSAIntentsMetadatas;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  topKGSAIntentsMetadatas = self->_topKGSAIntentsMetadatas;
  v8 = v4;
  if (!topKGSAIntentsMetadatas)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_topKGSAIntentsMetadatas;
    self->_topKGSAIntentsMetadatas = v6;

    v4 = v8;
    topKGSAIntentsMetadatas = self->_topKGSAIntentsMetadatas;
  }
  -[NSArray addObject:](topKGSAIntentsMetadatas, "addObject:", v4);

}

- (unint64_t)topKGSAIntentsMetadataCount
{
  return -[NSArray count](self->_topKGSAIntentsMetadatas, "count");
}

- (id)topKGSAIntentsMetadataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_topKGSAIntentsMetadatas, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_topU2IntentsMetadatas;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_topKGSAIntentsMetadatas;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported topU2IntentsMetadatas](self, "topU2IntentsMetadatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topU2IntentsMetadatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported topU2IntentsMetadatas](self, "topU2IntentsMetadatas");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported topU2IntentsMetadatas](self, "topU2IntentsMetadatas");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topU2IntentsMetadatas");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported topKGSAIntentsMetadatas](self, "topKGSAIntentsMetadatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topKGSAIntentsMetadatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported topKGSAIntentsMetadatas](self, "topKGSAIntentsMetadatas");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported topKGSAIntentsMetadatas](self, "topKGSAIntentsMetadatas");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topKGSAIntentsMetadatas");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSArray hash](self->_topU2IntentsMetadatas, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_topKGSAIntentsMetadatas, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_linkId)
  {
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported linkId](self, "linkId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("linkId"));

    }
  }
  if (-[NSArray count](self->_topKGSAIntentsMetadatas, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = self->_topKGSAIntentsMetadatas;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("topKGSAIntentsMetadata"));
  }
  if (-[NSArray count](self->_topU2IntentsMetadatas, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = self->_topU2IntentsMetadatas;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v15, "addObject:", v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("topU2IntentsMetadata"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v24);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReported)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *v5;
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
    self = -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReported)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PEGASUSSchemaPEGASUSIntent *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  PEGASUSSchemaPEGASUSIntent *v24;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PEGASUSSchemaPEGASUSUtteranceUnderstandingReported;
  v5 = -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topU2IntentsMetadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v9 = v8;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v34;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v34 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[PEGASUSSchemaPEGASUSIntent initWithDictionary:]([PEGASUSSchemaPEGASUSIntent alloc], "initWithDictionary:", v15);
              -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported addTopU2IntentsMetadata:](v5, "addTopU2IntentsMetadata:", v16);

            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v12);
      }

      v6 = v28;
      v8 = v9;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topKGSAIntentsMetadata"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v8;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v22);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = -[PEGASUSSchemaPEGASUSIntent initWithDictionary:]([PEGASUSSchemaPEGASUSIntent alloc], "initWithDictionary:", v23);
              -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported addTopKGSAIntentsMetadata:](v5, "addTopKGSAIntentsMetadata:", v24);

            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        }
        while (v20);
      }

      v8 = v27;
      v6 = v28;
    }
    v25 = v5;

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

- (NSArray)topU2IntentsMetadatas
{
  return self->_topU2IntentsMetadatas;
}

- (void)setTopU2IntentsMetadatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)topKGSAIntentsMetadatas
{
  return self->_topKGSAIntentsMetadatas;
}

- (void)setTopKGSAIntentsMetadatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topKGSAIntentsMetadatas, 0);
  objc_storeStrong((id *)&self->_topU2IntentsMetadatas, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
