@implementation PEGASUSSchemaPEGASUSRewrittenUtterancesReported

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
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PEGASUSSchemaPEGASUSRewrittenUtterancesReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported deleteLinkId](self, "deleteLinkId");
  -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported rewrittenUtterancesMetadatas](self, "rewrittenUtterancesMetadatas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported setRewrittenUtterancesMetadatas:](self, "setRewrittenUtterancesMetadatas:", v10);

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported setLinkId:](self, "setLinkId:", 0);
}

- (void)setWasRewrittenUtteranceUsed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_wasRewrittenUtteranceUsed = a3;
}

- (BOOL)hasWasRewrittenUtteranceUsed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasWasRewrittenUtteranceUsed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteWasRewrittenUtteranceUsed
{
  -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported setWasRewrittenUtteranceUsed:](self, "setWasRewrittenUtteranceUsed:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearRewrittenUtterancesMetadata
{
  -[NSArray removeAllObjects](self->_rewrittenUtterancesMetadatas, "removeAllObjects");
}

- (void)addRewrittenUtterancesMetadata:(id)a3
{
  id v4;
  NSArray *rewrittenUtterancesMetadatas;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  rewrittenUtterancesMetadatas = self->_rewrittenUtterancesMetadatas;
  v8 = v4;
  if (!rewrittenUtterancesMetadatas)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_rewrittenUtterancesMetadatas;
    self->_rewrittenUtterancesMetadatas = v6;

    v4 = v8;
    rewrittenUtterancesMetadatas = self->_rewrittenUtterancesMetadatas;
  }
  -[NSArray addObject:](rewrittenUtterancesMetadatas, "addObject:", v4);

}

- (unint64_t)rewrittenUtterancesMetadataCount
{
  return -[NSArray count](self->_rewrittenUtterancesMetadatas, "count");
}

- (id)rewrittenUtterancesMetadataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_rewrittenUtterancesMetadatas, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSRewrittenUtterancesReportedReadFrom(self, (uint64_t)a3);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_rewrittenUtterancesMetadatas;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
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
  int wasRewrittenUtteranceUsed;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    wasRewrittenUtteranceUsed = self->_wasRewrittenUtteranceUsed;
    if (wasRewrittenUtteranceUsed != objc_msgSend(v4, "wasRewrittenUtteranceUsed"))
      goto LABEL_15;
  }
  -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported rewrittenUtterancesMetadatas](self, "rewrittenUtterancesMetadatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rewrittenUtterancesMetadatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported rewrittenUtterancesMetadatas](self, "rewrittenUtterancesMetadatas");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported rewrittenUtterancesMetadatas](self, "rewrittenUtterancesMetadatas");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rewrittenUtterancesMetadatas");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_wasRewrittenUtteranceUsed;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSArray hash](self->_rewrittenUtterancesMetadatas, "hash");
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
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_linkId)
  {
    -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported linkId](self, "linkId");
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
  if (-[NSArray count](self->_rewrittenUtterancesMetadatas, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_rewrittenUtterancesMetadatas;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
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
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("rewrittenUtterancesMetadata"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported wasRewrittenUtteranceUsed](self, "wasRewrittenUtteranceUsed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("wasRewrittenUtteranceUsed"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v17);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSRewrittenUtterancesReported)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *v5;
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
    self = -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSRewrittenUtterancesReported)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  PEGASUSSchemaPEGASUSRewrittenUtterance *v16;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PEGASUSSchemaPEGASUSRewrittenUtterancesReported;
  v5 = -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasRewrittenUtteranceUsed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported setWasRewrittenUtteranceUsed:](v5, "setWasRewrittenUtteranceUsed:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rewrittenUtterancesMetadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v8;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[PEGASUSSchemaPEGASUSRewrittenUtterance initWithDictionary:]([PEGASUSSchemaPEGASUSRewrittenUtterance alloc], "initWithDictionary:", v15);
              -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported addRewrittenUtterancesMetadata:](v5, "addRewrittenUtterancesMetadata:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v12);
      }

      v8 = v19;
    }
    v17 = v5;

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

- (BOOL)wasRewrittenUtteranceUsed
{
  return self->_wasRewrittenUtteranceUsed;
}

- (NSArray)rewrittenUtterancesMetadatas
{
  return self->_rewrittenUtterancesMetadatas;
}

- (void)setRewrittenUtterancesMetadatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenUtterancesMetadatas, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
