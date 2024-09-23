@implementation INFERENCESchemaINFERENCEContactCandidatesInfoGenerated

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
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INFERENCESchemaINFERENCEContactCandidatesInfoGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v18, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated deleteOriginalResolutionContextId](self, "deleteOriginalResolutionContextId");
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated queryId](self, "queryId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated deleteQueryId](self, "deleteQueryId");
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated contactQueryMetadata](self, "contactQueryMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated deleteContactQueryMetadata](self, "deleteContactQueryMetadata");
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated candidates](self, "candidates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v15, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setCandidates:](self, "setCandidates:", v16);

  return v5;
}

- (BOOL)hasOriginalResolutionContextId
{
  return self->_originalResolutionContextId != 0;
}

- (void)deleteOriginalResolutionContextId
{
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setOriginalResolutionContextId:](self, "setOriginalResolutionContextId:", 0);
}

- (BOOL)hasQueryId
{
  return self->_queryId != 0;
}

- (void)deleteQueryId
{
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setQueryId:](self, "setQueryId:", 0);
}

- (BOOL)hasContactQueryMetadata
{
  return self->_contactQueryMetadata != 0;
}

- (void)deleteContactQueryMetadata
{
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setContactQueryMetadata:](self, "setContactQueryMetadata:", 0);
}

- (void)setOntologySource:(int)a3
{
  *(&self->_isEntityCandidateRetrievalEnabled + 1) |= 1u;
  self->_ontologySource = a3;
}

- (BOOL)hasOntologySource
{
  return *(&self->_isEntityCandidateRetrievalEnabled + 1);
}

- (void)setHasOntologySource:(BOOL)a3
{
  *(&self->_isEntityCandidateRetrievalEnabled + 1) = *(&self->_isEntityCandidateRetrievalEnabled + 1) & 0xFE | a3;
}

- (void)deleteOntologySource
{
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setOntologySource:](self, "setOntologySource:", 0);
  *(&self->_isEntityCandidateRetrievalEnabled + 1) &= ~1u;
}

- (void)clearCandidates
{
  -[NSArray removeAllObjects](self->_candidates, "removeAllObjects");
}

- (void)addCandidates:(id)a3
{
  id v4;
  NSArray *candidates;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  candidates = self->_candidates;
  v8 = v4;
  if (!candidates)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_candidates;
    self->_candidates = v6;

    v4 = v8;
    candidates = self->_candidates;
  }
  -[NSArray addObject:](candidates, "addObject:", v4);

}

- (unint64_t)candidatesCount
{
  return -[NSArray count](self->_candidates, "count");
}

- (id)candidatesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_candidates, "objectAtIndexedSubscript:", a3);
}

- (void)setIsEntityCandidateRetrievalEnabled:(BOOL)a3
{
  *(&self->_isEntityCandidateRetrievalEnabled + 1) |= 2u;
  self->_isEntityCandidateRetrievalEnabled = a3;
}

- (BOOL)hasIsEntityCandidateRetrievalEnabled
{
  return (*((unsigned __int8 *)&self->_isEntityCandidateRetrievalEnabled + 1) >> 1) & 1;
}

- (void)setHasIsEntityCandidateRetrievalEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isEntityCandidateRetrievalEnabled + 1) = *(&self->_isEntityCandidateRetrievalEnabled + 1) & 0xFD | v3;
}

- (void)deleteIsEntityCandidateRetrievalEnabled
{
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setIsEntityCandidateRetrievalEnabled:](self, "setIsEntityCandidateRetrievalEnabled:", 0);
  *(&self->_isEntityCandidateRetrievalEnabled + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactCandidatesInfoGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated queryId](self, "queryId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated queryId](self, "queryId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated contactQueryMetadata](self, "contactQueryMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated contactQueryMetadata](self, "contactQueryMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (*(&self->_isEntityCandidateRetrievalEnabled + 1))
    PBDataWriterWriteInt32Field();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_candidates;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  if ((*(&self->_isEntityCandidateRetrievalEnabled + 1) & 2) != 0)
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
  int ontologySource;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  BOOL v28;
  int v30;
  int isEntityCandidateRetrievalEnabled;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalResolutionContextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalResolutionContextId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_25;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated queryId](self, "queryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated queryId](self, "queryId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated queryId](self, "queryId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_25;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated contactQueryMetadata](self, "contactQueryMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactQueryMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated contactQueryMetadata](self, "contactQueryMetadata");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated contactQueryMetadata](self, "contactQueryMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactQueryMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_25;
  }
  else
  {

  }
  if (*(&self->_isEntityCandidateRetrievalEnabled + 1) != (v4[49] & 1))
    goto LABEL_25;
  if (*(&self->_isEntityCandidateRetrievalEnabled + 1))
  {
    ontologySource = self->_ontologySource;
    if (ontologySource != objc_msgSend(v4, "ontologySource"))
      goto LABEL_25;
  }
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_24:

    goto LABEL_25;
  }
  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated candidates](self, "candidates");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated candidates](self, "candidates");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidates");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_25;
  }
  else
  {

  }
  v30 = (*((unsigned __int8 *)&self->_isEntityCandidateRetrievalEnabled + 1) >> 1) & 1;
  if (v30 == ((v4[49] >> 1) & 1))
  {
    if (!v30
      || (isEntityCandidateRetrievalEnabled = self->_isEntityCandidateRetrievalEnabled,
          isEntityCandidateRetrievalEnabled == objc_msgSend(v4, "isEntityCandidateRetrievalEnabled")))
    {
      v28 = 1;
      goto LABEL_26;
    }
  }
LABEL_25:
  v28 = 0;
LABEL_26:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[SISchemaUUID hash](self->_originalResolutionContextId, "hash");
  v4 = -[SISchemaUUID hash](self->_queryId, "hash");
  v5 = -[INFERENCESchemaINFERENCEContactQueryMetadata hash](self->_contactQueryMetadata, "hash");
  if (*(&self->_isEntityCandidateRetrievalEnabled + 1))
    v6 = 2654435761 * self->_ontologySource;
  else
    v6 = 0;
  v7 = -[NSArray hash](self->_candidates, "hash");
  if ((*(&self->_isEntityCandidateRetrievalEnabled + 1) & 2) != 0)
    v8 = 2654435761 * self->_isEntityCandidateRetrievalEnabled;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unsigned int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_candidates, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = self->_candidates;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v26);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("candidates"));
  }
  if (self->_contactQueryMetadata)
  {
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated contactQueryMetadata](self, "contactQueryMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("contactQueryMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("contactQueryMetadata"));

    }
  }
  v15 = *(&self->_isEntityCandidateRetrievalEnabled + 1);
  if ((v15 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated isEntityCandidateRetrievalEnabled](self, "isEntityCandidateRetrievalEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isEntityCandidateRetrievalEnabled"));

    v15 = *(&self->_isEntityCandidateRetrievalEnabled + 1);
  }
  if ((v15 & 1) != 0)
  {
    v17 = -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated ontologySource](self, "ontologySource") - 1;
    if (v17 > 3)
      v18 = CFSTR("INFERENCEONTOLOGYSOURCE_UNKNOWN");
    else
      v18 = off_1E562FBA8[v17];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("ontologySource"), (_QWORD)v26);
  }
  if (self->_originalResolutionContextId)
  {
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("originalResolutionContextId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("originalResolutionContextId"));

    }
  }
  if (self->_queryId)
  {
    -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated queryId](self, "queryId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("queryId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("queryId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v26);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *v5;
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
    self = -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  INFERENCESchemaINFERENCEContactQueryMetadata *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  INFERENCESchemaINFERENCECandidateInfo *v20;
  void *v21;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)INFERENCESchemaINFERENCEContactCandidatesInfoGenerated;
  v5 = -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalResolutionContextId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setOriginalResolutionContextId:](v5, "setOriginalResolutionContextId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setQueryId:](v5, "setQueryId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactQueryMetadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[INFERENCESchemaINFERENCEContactQueryMetadata initWithDictionary:]([INFERENCESchemaINFERENCEContactQueryMetadata alloc], "initWithDictionary:", v10);
      -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setContactQueryMetadata:](v5, "setContactQueryMetadata:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ontologySource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setOntologySource:](v5, "setOntologySource:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidates"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v12;
      v25 = v10;
      v26 = v8;
      v27 = v6;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
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
            v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = -[INFERENCESchemaINFERENCECandidateInfo initWithDictionary:]([INFERENCESchemaINFERENCECandidateInfo alloc], "initWithDictionary:", v19);
              -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated addCandidates:](v5, "addCandidates:", v20);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v16);
      }

      v8 = v26;
      v6 = v27;
      v12 = v24;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEntityCandidateRetrievalEnabled"), v24, v25, v26, v27, (_QWORD)v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated setIsEntityCandidateRetrievalEnabled:](v5, "setIsEntityCandidateRetrievalEnabled:", objc_msgSend(v21, "BOOLValue"));
    v22 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalResolutionContextId
{
  return self->_originalResolutionContextId;
}

- (void)setOriginalResolutionContextId:(id)a3
{
  objc_storeStrong((id *)&self->_originalResolutionContextId, a3);
}

- (SISchemaUUID)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(id)a3
{
  objc_storeStrong((id *)&self->_queryId, a3);
}

- (INFERENCESchemaINFERENCEContactQueryMetadata)contactQueryMetadata
{
  return self->_contactQueryMetadata;
}

- (void)setContactQueryMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_contactQueryMetadata, a3);
}

- (int)ontologySource
{
  return self->_ontologySource;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isEntityCandidateRetrievalEnabled
{
  return self->_isEntityCandidateRetrievalEnabled;
}

- (void)setHasOriginalResolutionContextId:(BOOL)a3
{
  *(&self->_isEntityCandidateRetrievalEnabled + 2) = a3;
}

- (void)setHasQueryId:(BOOL)a3
{
  *(&self->_isEntityCandidateRetrievalEnabled + 3) = a3;
}

- (void)setHasContactQueryMetadata:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_contactQueryMetadata, 0);
  objc_storeStrong((id *)&self->_queryId, 0);
  objc_storeStrong((id *)&self->_originalResolutionContextId, 0);
}

@end
