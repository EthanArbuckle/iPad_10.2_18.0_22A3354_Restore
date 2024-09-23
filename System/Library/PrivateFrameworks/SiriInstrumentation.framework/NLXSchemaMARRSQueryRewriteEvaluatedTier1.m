@implementation NLXSchemaMARRSQueryRewriteEvaluatedTier1

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaMARRSQueryRewriteEvaluatedTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 deleteRewrittenUserUtterances](self, "deleteRewrittenUserUtterances");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 deleteRewrittenUserUtterances](self, "deleteRewrittenUserUtterances");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 deleteRewrittenUserUtterances](self, "deleteRewrittenUserUtterances");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 deleteRewrittenUserUtterances](self, "deleteRewrittenUserUtterances");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 deleteRewrittenUserUtterances](self, "deleteRewrittenUserUtterances");
  -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 deleteLinkId](self, "deleteLinkId");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 setLinkId:](self, "setLinkId:", 0);
}

- (void)clearRewrittenUserUtterances
{
  -[NSArray removeAllObjects](self->_rewrittenUserUtterances, "removeAllObjects");
}

- (void)addRewrittenUserUtterances:(id)a3
{
  id v4;
  NSArray *rewrittenUserUtterances;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  rewrittenUserUtterances = self->_rewrittenUserUtterances;
  v8 = v4;
  if (!rewrittenUserUtterances)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_rewrittenUserUtterances;
    self->_rewrittenUserUtterances = v6;

    v4 = v8;
    rewrittenUserUtterances = self->_rewrittenUserUtterances;
  }
  -[NSArray addObject:](rewrittenUserUtterances, "addObject:", v4);

}

- (unint64_t)rewrittenUserUtterancesCount
{
  return -[NSArray count](self->_rewrittenUserUtterances, "count");
}

- (id)rewrittenUserUtterancesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_rewrittenUserUtterances, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMARRSQueryRewriteEvaluatedTier1ReadFrom(self, (uint64_t)a3);
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
  -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_rewrittenUserUtterances;
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
        PBDataWriterWriteStringField();
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 rewrittenUserUtterances](self, "rewrittenUserUtterances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rewrittenUserUtterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 rewrittenUserUtterances](self, "rewrittenUserUtterances");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 rewrittenUserUtterances](self, "rewrittenUserUtterances");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rewrittenUserUtterances");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  return -[NSArray hash](self->_rewrittenUserUtterances, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_linkId)
  {
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 linkId](self, "linkId");
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
  if (self->_rewrittenUserUtterances)
  {
    -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 rewrittenUserUtterances](self, "rewrittenUserUtterances");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("rewrittenUserUtterances"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaMARRSQueryRewriteEvaluatedTier1)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *v5;
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
    self = -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaMARRSQueryRewriteEvaluatedTier1)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NLXSchemaMARRSQueryRewriteEvaluatedTier1;
  v5 = -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rewrittenUserUtterances"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
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
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = (void *)objc_msgSend(v14, "copy", (_QWORD)v18);
              -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 addRewrittenUserUtterances:](v5, "addRewrittenUserUtterances:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v11);
      }

    }
    v16 = v5;

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

- (NSArray)rewrittenUserUtterances
{
  return self->_rewrittenUserUtterances;
}

- (void)setRewrittenUserUtterances:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenUserUtterances, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
