@implementation PEGASUSSchemaPEGASUSMultistepSubSearchExecution

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setLoopbackDepth:(int)a3
{
  *(&self->_hasAugmentedQuery + 1) |= 1u;
  self->_loopbackDepth = a3;
}

- (BOOL)hasLoopbackDepth
{
  return *(&self->_hasAugmentedQuery + 1);
}

- (void)setHasLoopbackDepth:(BOOL)a3
{
  *(&self->_hasAugmentedQuery + 1) = *(&self->_hasAugmentedQuery + 1) & 0xFE | a3;
}

- (void)deleteLoopbackDepth
{
  -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setLoopbackDepth:](self, "setLoopbackDepth:", 0);
  *(&self->_hasAugmentedQuery + 1) &= ~1u;
}

- (void)setParentDomain:(int)a3
{
  *(&self->_hasAugmentedQuery + 1) |= 2u;
  self->_parentDomain = a3;
}

- (BOOL)hasParentDomain
{
  return (*((unsigned __int8 *)&self->_hasAugmentedQuery + 1) >> 1) & 1;
}

- (void)setHasParentDomain:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_hasAugmentedQuery + 1) = *(&self->_hasAugmentedQuery + 1) & 0xFD | v3;
}

- (void)deleteParentDomain
{
  -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setParentDomain:](self, "setParentDomain:", 0);
  *(&self->_hasAugmentedQuery + 1) &= ~2u;
}

- (void)setHasNextSteps:(BOOL)a3
{
  *(&self->_hasAugmentedQuery + 1) |= 4u;
  self->_hasNextSteps = a3;
}

- (BOOL)hasHasNextSteps
{
  return (*((unsigned __int8 *)&self->_hasAugmentedQuery + 1) >> 2) & 1;
}

- (void)setHasHasNextSteps:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_hasAugmentedQuery + 1) = *(&self->_hasAugmentedQuery + 1) & 0xFB | v3;
}

- (void)deleteHasNextSteps
{
  -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setHasNextSteps:](self, "setHasNextSteps:", 0);
  *(&self->_hasAugmentedQuery + 1) &= ~4u;
}

- (void)setSearchType:(int)a3
{
  *(&self->_hasAugmentedQuery + 1) |= 8u;
  self->_searchType = a3;
}

- (BOOL)hasSearchType
{
  return (*((unsigned __int8 *)&self->_hasAugmentedQuery + 1) >> 3) & 1;
}

- (void)setHasSearchType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_hasAugmentedQuery + 1) = *(&self->_hasAugmentedQuery + 1) & 0xF7 | v3;
}

- (void)deleteSearchType
{
  -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setSearchType:](self, "setSearchType:", 0);
  *(&self->_hasAugmentedQuery + 1) &= ~8u;
}

- (void)clearSubSearchDomains
{
  -[NSArray removeAllObjects](self->_subSearchDomains, "removeAllObjects");
}

- (void)addSubSearchDomains:(int)a3
{
  uint64_t v3;
  NSArray *subSearchDomains;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  subSearchDomains = self->_subSearchDomains;
  if (!subSearchDomains)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_subSearchDomains;
    self->_subSearchDomains = v6;

    subSearchDomains = self->_subSearchDomains;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](subSearchDomains, "addObject:", v8);

}

- (unint64_t)subSearchDomainsCount
{
  return -[NSArray count](self->_subSearchDomains, "count");
}

- (int)subSearchDomainsAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_subSearchDomains, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setHasAugmentedQuery:(BOOL)a3
{
  *(&self->_hasAugmentedQuery + 1) |= 0x10u;
  self->_hasAugmentedQuery = a3;
}

- (BOOL)hasHasAugmentedQuery
{
  return (*((unsigned __int8 *)&self->_hasAugmentedQuery + 1) >> 4) & 1;
}

- (void)setHasHasAugmentedQuery:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_hasAugmentedQuery + 1) = *(&self->_hasAugmentedQuery + 1) & 0xEF | v3;
}

- (void)deleteHasAugmentedQuery
{
  -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setHasAugmentedQuery:](self, "setHasAugmentedQuery:", 0);
  *(&self->_hasAugmentedQuery + 1) &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSMultistepSubSearchExecutionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  NSArray *v6;
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
  v5 = *(&self->_hasAugmentedQuery + 1);
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = *(&self->_hasAugmentedQuery + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(&self->_hasAugmentedQuery + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v5 = *(&self->_hasAugmentedQuery + 1);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_hasAugmentedQuery + 1) & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_subSearchDomains;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue", (_QWORD)v11);
        PBDataWriterWriteInt32Field();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(&self->_hasAugmentedQuery + 1) & 0x10) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int loopbackDepth;
  int v8;
  int parentDomain;
  int v10;
  int hasNextSteps;
  int v12;
  int searchType;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int hasAugmentedQuery;
  BOOL v24;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  v5 = *((unsigned __int8 *)&self->_hasAugmentedQuery + 1);
  v6 = v4[33];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_27;
  if ((v5 & 1) != 0)
  {
    loopbackDepth = self->_loopbackDepth;
    if (loopbackDepth != objc_msgSend(v4, "loopbackDepth"))
      goto LABEL_27;
    v5 = *((unsigned __int8 *)&self->_hasAugmentedQuery + 1);
    v6 = v4[33];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_27;
  if (v8)
  {
    parentDomain = self->_parentDomain;
    if (parentDomain != objc_msgSend(v4, "parentDomain"))
      goto LABEL_27;
    v5 = *((unsigned __int8 *)&self->_hasAugmentedQuery + 1);
    v6 = v4[33];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_27;
  if (v10)
  {
    hasNextSteps = self->_hasNextSteps;
    if (hasNextSteps == objc_msgSend(v4, "hasNextSteps"))
    {
      v5 = *((unsigned __int8 *)&self->_hasAugmentedQuery + 1);
      v6 = v4[33];
      goto LABEL_14;
    }
LABEL_27:
    v24 = 0;
    goto LABEL_28;
  }
LABEL_14:
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_27;
  if (v12)
  {
    searchType = self->_searchType;
    if (searchType != objc_msgSend(v4, "searchType"))
      goto LABEL_27;
  }
  -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution subSearchDomains](self, "subSearchDomains");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subSearchDomains");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 == 0) == (v15 != 0))
  {

    goto LABEL_27;
  }
  -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution subSearchDomains](self, "subSearchDomains");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution subSearchDomains](self, "subSearchDomains");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subSearchDomains");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  v22 = (*((unsigned __int8 *)&self->_hasAugmentedQuery + 1) >> 4) & 1;
  if (v22 != ((v4[33] >> 4) & 1))
    goto LABEL_27;
  if (v22)
  {
    hasAugmentedQuery = self->_hasAugmentedQuery;
    if (hasAugmentedQuery != objc_msgSend(v4, "hasAugmentedQuery"))
      goto LABEL_27;
  }
  v24 = 1;
LABEL_28:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (*(&self->_hasAugmentedQuery + 1))
  {
    v3 = 2654435761 * self->_loopbackDepth;
    if ((*(&self->_hasAugmentedQuery + 1) & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_parentDomain;
      if ((*(&self->_hasAugmentedQuery + 1) & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(&self->_hasAugmentedQuery + 1) & 8) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(&self->_hasAugmentedQuery + 1) & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(&self->_hasAugmentedQuery + 1) & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_hasNextSteps;
  if ((*(&self->_hasAugmentedQuery + 1) & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_searchType;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[NSArray hash](self->_subSearchDomains, "hash");
  if ((*(&self->_hasAugmentedQuery + 1) & 0x10) != 0)
    v8 = 2654435761 * self->_hasAugmentedQuery;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_hasAugmentedQuery + 1);
  if ((v4 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution hasAugmentedQuery](self, "hasAugmentedQuery"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasAugmentedQuery"));

    v4 = *(&self->_hasAugmentedQuery + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(&self->_hasAugmentedQuery + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution hasNextSteps](self, "hasNextSteps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hasNextSteps"));

  v4 = *(&self->_hasAugmentedQuery + 1);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
LABEL_10:
    v8 = -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution parentDomain](self, "parentDomain") - 1;
    if (v8 > 0x1B)
      v9 = CFSTR("PEGASUSDOMAIN_UNKNOWN");
    else
      v9 = off_1E563D960[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("parentDomain"));
    if ((*(&self->_hasAugmentedQuery + 1) & 8) == 0)
      goto LABEL_18;
    goto LABEL_14;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution loopbackDepth](self, "loopbackDepth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("loopbackDepth"));

  v4 = *(&self->_hasAugmentedQuery + 1);
  if ((v4 & 2) != 0)
    goto LABEL_10;
LABEL_5:
  if ((v4 & 8) != 0)
  {
LABEL_14:
    v10 = -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution searchType](self, "searchType") - 1;
    if (v10 > 6)
      v11 = CFSTR("PEGASUSMULTISTEPSEARCHTYPE_UNKNOWN");
    else
      v11 = off_1E563DA40[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("searchType"));
  }
LABEL_18:
  if (-[NSArray count](self->_subSearchDomains, "count"))
  {
    -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution subSearchDomains](self, "subSearchDomains");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("subSearchDomains"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSMultistepSubSearchExecution)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSMultistepSubSearchExecution *v5;
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
    self = -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSMultistepSubSearchExecution)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSMultistepSubSearchExecution *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PEGASUSSchemaPEGASUSMultistepSubSearchExecution *v18;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PEGASUSSchemaPEGASUSMultistepSubSearchExecution;
  v5 = -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loopbackDepth"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setLoopbackDepth:](v5, "setLoopbackDepth:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentDomain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setParentDomain:](v5, "setParentDomain:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasNextSteps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setHasNextSteps:](v5, "setHasNextSteps:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setSearchType:](v5, "setSearchType:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subSearchDomains"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v8;
      v21 = v7;
      v22 = v6;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution addSubSearchDomains:](v5, "addSubSearchDomains:", objc_msgSend(v16, "intValue"));
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v13);
      }

      v7 = v21;
      v6 = v22;
      v8 = v20;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasAugmentedQuery"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution setHasAugmentedQuery:](v5, "setHasAugmentedQuery:", objc_msgSend(v17, "BOOLValue"));
    v18 = v5;

  }
  return v5;
}

- (int)loopbackDepth
{
  return self->_loopbackDepth;
}

- (int)parentDomain
{
  return self->_parentDomain;
}

- (BOOL)hasNextSteps
{
  return self->_hasNextSteps;
}

- (int)searchType
{
  return self->_searchType;
}

- (NSArray)subSearchDomains
{
  return self->_subSearchDomains;
}

- (void)setSubSearchDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)hasAugmentedQuery
{
  return self->_hasAugmentedQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subSearchDomains, 0);
}

@end
