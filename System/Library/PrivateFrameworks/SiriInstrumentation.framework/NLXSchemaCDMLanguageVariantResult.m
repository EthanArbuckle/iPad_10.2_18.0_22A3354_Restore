@implementation NLXSchemaCDMLanguageVariantResult

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NLXSchemaCDMLanguageVariantResult;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMLanguageVariantResult multilingualVariants](self, "multilingualVariants", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMLanguageVariantResult setMultilingualVariants:](self, "setMultilingualVariants:", v7);

  -[NLXSchemaCDMLanguageVariantResult cdmParser](self, "cdmParser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v9, "suppressMessage");
  if ((_DWORD)v4)
    -[NLXSchemaCDMLanguageVariantResult deleteCdmParser](self, "deleteCdmParser");
  return v5;
}

- (void)clearMultilingualVariants
{
  -[NSArray removeAllObjects](self->_multilingualVariants, "removeAllObjects");
}

- (void)addMultilingualVariants:(id)a3
{
  id v4;
  NSArray *multilingualVariants;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  multilingualVariants = self->_multilingualVariants;
  v8 = v4;
  if (!multilingualVariants)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_multilingualVariants;
    self->_multilingualVariants = v6;

    v4 = v8;
    multilingualVariants = self->_multilingualVariants;
  }
  -[NSArray addObject:](multilingualVariants, "addObject:", v4);

}

- (unint64_t)multilingualVariantsCount
{
  return -[NSArray count](self->_multilingualVariants, "count");
}

- (id)multilingualVariantsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_multilingualVariants, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasCdmParser
{
  return self->_cdmParser != 0;
}

- (void)deleteCdmParser
{
  -[NLXSchemaCDMLanguageVariantResult setCdmParser:](self, "setCdmParser:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMLanguageVariantResultReadFrom(self, (uint64_t)a3);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_multilingualVariants;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[NLXSchemaCDMLanguageVariantResult cdmParser](self, "cdmParser", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NLXSchemaCDMLanguageVariantResult cdmParser](self, "cdmParser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  -[NLXSchemaCDMLanguageVariantResult multilingualVariants](self, "multilingualVariants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multilingualVariants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[NLXSchemaCDMLanguageVariantResult multilingualVariants](self, "multilingualVariants");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaCDMLanguageVariantResult multilingualVariants](self, "multilingualVariants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multilingualVariants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[NLXSchemaCDMLanguageVariantResult cdmParser](self, "cdmParser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmParser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLXSchemaCDMLanguageVariantResult cdmParser](self, "cdmParser");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[NLXSchemaCDMLanguageVariantResult cdmParser](self, "cdmParser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmParser");
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
  uint64_t v3;

  v3 = -[NSArray hash](self->_multilingualVariants, "hash");
  return -[NLXSchemaCDMParser hash](self->_cdmParser, "hash") ^ v3;
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cdmParser)
  {
    -[NLXSchemaCDMLanguageVariantResult cdmParser](self, "cdmParser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cdmParser"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cdmParser"));

    }
  }
  if (-[NSArray count](self->_multilingualVariants, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_multilingualVariants;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
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
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("multilingualVariants"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v16);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMLanguageVariantResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMLanguageVariantResult)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMLanguageVariantResult *v5;
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
    self = -[NLXSchemaCDMLanguageVariantResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMLanguageVariantResult)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMLanguageVariantResult *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NLXSchemaCDMMultilingualVariant *v13;
  NLXSchemaCDMMultilingualVariant *v14;
  void *v15;
  NLXSchemaCDMParser *v16;
  NLXSchemaCDMLanguageVariantResult *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NLXSchemaCDMLanguageVariantResult;
  v5 = -[NLXSchemaCDMLanguageVariantResult init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multilingualVariants"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [NLXSchemaCDMMultilingualVariant alloc];
              v14 = -[NLXSchemaCDMMultilingualVariant initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v19);
              -[NLXSchemaCDMLanguageVariantResult addMultilingualVariants:](v5, "addMultilingualVariants:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmParser"), (_QWORD)v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[NLXSchemaCDMParser initWithDictionary:]([NLXSchemaCDMParser alloc], "initWithDictionary:", v15);
      -[NLXSchemaCDMLanguageVariantResult setCdmParser:](v5, "setCdmParser:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (NSArray)multilingualVariants
{
  return self->_multilingualVariants;
}

- (void)setMultilingualVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NLXSchemaCDMParser)cdmParser
{
  return self->_cdmParser;
}

- (void)setCdmParser:(id)a3
{
  objc_storeStrong((id *)&self->_cdmParser, a3);
}

- (void)setHasCdmParser:(BOOL)a3
{
  self->_hasCdmParser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdmParser, 0);
  objc_storeStrong((id *)&self->_multilingualVariants, 0);
}

@end
