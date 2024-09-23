@implementation NLXSchemaCDMMatchingSpan

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
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NLXSchemaCDMMatchingSpan;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMMatchingSpan linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaCDMMatchingSpan deleteLinkId](self, "deleteLinkId");
  -[NLXSchemaCDMMatchingSpan usoGraph](self, "usoGraph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLXSchemaCDMMatchingSpan deleteUsoGraph](self, "deleteUsoGraph");
  -[NLXSchemaCDMMatchingSpan internalSpanData](self, "internalSpanData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLXSchemaCDMMatchingSpan deleteInternalSpanData](self, "deleteInternalSpanData");

  return v5;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)deleteLabel
{
  -[NLXSchemaCDMMatchingSpan setLabel:](self, "setLabel:", 0);
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[NLXSchemaCDMMatchingSpan setLinkId:](self, "setLinkId:", 0);
}

- (void)setStartTokenIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTokenIndex = a3;
}

- (BOOL)hasStartTokenIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStartTokenIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStartTokenIndex
{
  -[NLXSchemaCDMMatchingSpan setStartTokenIndex:](self, "setStartTokenIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEndTokenIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endTokenIndex = a3;
}

- (BOOL)hasEndTokenIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEndTokenIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEndTokenIndex
{
  -[NLXSchemaCDMMatchingSpan setEndTokenIndex:](self, "setEndTokenIndex:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasUsoGraph
{
  return self->_usoGraph != 0;
}

- (void)deleteUsoGraph
{
  -[NLXSchemaCDMMatchingSpan setUsoGraph:](self, "setUsoGraph:", 0);
}

- (void)clearMatcherNames
{
  -[NSArray removeAllObjects](self->_matcherNames, "removeAllObjects");
}

- (void)addMatcherNames:(int)a3
{
  uint64_t v3;
  NSArray *matcherNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  matcherNames = self->_matcherNames;
  if (!matcherNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matcherNames;
    self->_matcherNames = v6;

    matcherNames = self->_matcherNames;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](matcherNames, "addObject:", v8);

}

- (unint64_t)matcherNamesCount
{
  return -[NSArray count](self->_matcherNames, "count");
}

- (int)matcherNamesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_matcherNames, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)hasInternalSpanData
{
  return self->_internalSpanData != 0;
}

- (void)deleteInternalSpanData
{
  -[NLXSchemaCDMMatchingSpan setInternalSpanData:](self, "setInternalSpanData:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMMatchingSpanReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
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
  -[NLXSchemaCDMMatchingSpan label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[NLXSchemaCDMMatchingSpan linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLXSchemaCDMMatchingSpan linkId](self, "linkId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[NLXSchemaCDMMatchingSpan usoGraph](self, "usoGraph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NLXSchemaCDMMatchingSpan usoGraph](self, "usoGraph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_matcherNames;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "intValue", (_QWORD)v18);
        PBDataWriterWriteInt32Field();
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  -[NLXSchemaCDMMatchingSpan internalSpanData](self, "internalSpanData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NLXSchemaCDMMatchingSpan internalSpanData](self, "internalSpanData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
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
  $EBF85422EC8ADA4CFDA9F01C7E4AEBDA has;
  unsigned int v18;
  unsigned int startTokenIndex;
  int v20;
  unsigned int endTokenIndex;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[NLXSchemaCDMMatchingSpan label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[NLXSchemaCDMMatchingSpan label](self, "label");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaCDMMatchingSpan label](self, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_34;
  }
  else
  {

  }
  -[NLXSchemaCDMMatchingSpan linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[NLXSchemaCDMMatchingSpan linkId](self, "linkId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NLXSchemaCDMMatchingSpan linkId](self, "linkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_34;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_34;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    startTokenIndex = self->_startTokenIndex;
    if (startTokenIndex != objc_msgSend(v4, "startTokenIndex"))
      goto LABEL_34;
    has = self->_has;
    v18 = v4[56];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_34;
  if (v20)
  {
    endTokenIndex = self->_endTokenIndex;
    if (endTokenIndex != objc_msgSend(v4, "endTokenIndex"))
      goto LABEL_34;
  }
  -[NLXSchemaCDMMatchingSpan usoGraph](self, "usoGraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usoGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[NLXSchemaCDMMatchingSpan usoGraph](self, "usoGraph");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[NLXSchemaCDMMatchingSpan usoGraph](self, "usoGraph");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usoGraph");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_34;
  }
  else
  {

  }
  -[NLXSchemaCDMMatchingSpan matcherNames](self, "matcherNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matcherNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[NLXSchemaCDMMatchingSpan matcherNames](self, "matcherNames");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[NLXSchemaCDMMatchingSpan matcherNames](self, "matcherNames");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matcherNames");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_34;
  }
  else
  {

  }
  -[NLXSchemaCDMMatchingSpan internalSpanData](self, "internalSpanData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalSpanData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  -[NLXSchemaCDMMatchingSpan internalSpanData](self, "internalSpanData");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {

LABEL_37:
    v37 = 1;
    goto LABEL_35;
  }
  v33 = (void *)v32;
  -[NLXSchemaCDMMatchingSpan internalSpanData](self, "internalSpanData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalSpanData");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqual:", v35);

  if ((v36 & 1) != 0)
    goto LABEL_37;
LABEL_34:
  v37 = 0;
LABEL_35:

  return v37;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_label, "hash");
  v4 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_startTokenIndex;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_endTokenIndex;
LABEL_6:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[USOSchemaUSOGraph hash](self->_usoGraph, "hash");
  v8 = -[NSArray hash](self->_matcherNames, "hash");
  return v7 ^ v8 ^ -[NLXSchemaCDMInternalSpanData hash](self->_internalSpanData, "hash");
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMMatchingSpan endTokenIndex](self, "endTokenIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("endTokenIndex"));

  }
  if (self->_internalSpanData)
  {
    -[NLXSchemaCDMMatchingSpan internalSpanData](self, "internalSpanData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("internalSpanData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("internalSpanData"));

    }
  }
  if (self->_label)
  {
    -[NLXSchemaCDMMatchingSpan label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("label"));

  }
  if (self->_linkId)
  {
    -[NLXSchemaCDMMatchingSpan linkId](self, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("linkId"));

    }
  }
  if (-[NSArray count](self->_matcherNames, "count"))
  {
    -[NLXSchemaCDMMatchingSpan matcherNames](self, "matcherNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("matcherNames"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMMatchingSpan startTokenIndex](self, "startTokenIndex"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("startTokenIndex"));

  }
  if (self->_usoGraph)
  {
    -[NLXSchemaCDMMatchingSpan usoGraph](self, "usoGraph");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("usoGraph"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("usoGraph"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMMatchingSpan dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMMatchingSpan)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMMatchingSpan *v5;
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
    self = -[NLXSchemaCDMMatchingSpan initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMMatchingSpan)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMMatchingSpan *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  USOSchemaUSOGraph *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NLXSchemaCDMInternalSpanData *v22;
  NLXSchemaCDMMatchingSpan *v23;
  void *v25;
  void *v26;
  void *v27;
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
  v33.super_class = (Class)NLXSchemaCDMMatchingSpan;
  v5 = -[NLXSchemaCDMMatchingSpan init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[NLXSchemaCDMMatchingSpan setLabel:](v5, "setLabel:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[NLXSchemaCDMMatchingSpan setLinkId:](v5, "setLinkId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTokenIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMMatchingSpan setStartTokenIndex:](v5, "setStartTokenIndex:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endTokenIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMMatchingSpan setEndTokenIndex:](v5, "setEndTokenIndex:", objc_msgSend(v11, "unsignedIntValue"));
    v28 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usoGraph"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[USOSchemaUSOGraph initWithDictionary:]([USOSchemaUSOGraph alloc], "initWithDictionary:", v12);
      -[NLXSchemaCDMMatchingSpan setUsoGraph:](v5, "setUsoGraph:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matcherNames"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v10;
      v26 = v8;
      v27 = v6;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v30;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[NLXSchemaCDMMatchingSpan addMatcherNames:](v5, "addMatcherNames:", objc_msgSend(v20, "intValue"));
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v17);
      }

      v8 = v26;
      v6 = v27;
      v10 = v25;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("internalSpanData"), v25, v26, v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[NLXSchemaCDMInternalSpanData initWithDictionary:]([NLXSchemaCDMInternalSpanData alloc], "initWithDictionary:", v21);
      -[NLXSchemaCDMMatchingSpan setInternalSpanData:](v5, "setInternalSpanData:", v22);

    }
    v23 = v5;

  }
  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (unsigned)startTokenIndex
{
  return self->_startTokenIndex;
}

- (unsigned)endTokenIndex
{
  return self->_endTokenIndex;
}

- (USOSchemaUSOGraph)usoGraph
{
  return self->_usoGraph;
}

- (void)setUsoGraph:(id)a3
{
  objc_storeStrong((id *)&self->_usoGraph, a3);
}

- (NSArray)matcherNames
{
  return self->_matcherNames;
}

- (void)setMatcherNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NLXSchemaCDMInternalSpanData)internalSpanData
{
  return self->_internalSpanData;
}

- (void)setInternalSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_internalSpanData, a3);
}

- (void)setHasLabel:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasUsoGraph:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasInternalSpanData:(BOOL)a3
{
  self->_hasLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSpanData, 0);
  objc_storeStrong((id *)&self->_matcherNames, 0);
  objc_storeStrong((id *)&self->_usoGraph, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
