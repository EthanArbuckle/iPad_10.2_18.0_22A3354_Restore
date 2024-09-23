@implementation FLOWLINKSchemaFLOWLINKAction

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
  v12.super_class = (Class)FLOWLINKSchemaFLOWLINKAction;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWLINKSchemaFLOWLINKAction linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWLINKSchemaFLOWLINKAction deleteLinkId](self, "deleteLinkId");
  -[FLOWLINKSchemaFLOWLINKAction parameters](self, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWLINKSchemaFLOWLINKAction setParameters:](self, "setParameters:", v10);

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[FLOWLINKSchemaFLOWLINKAction setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasActionIdentifierName
{
  return self->_actionIdentifierName != 0;
}

- (void)deleteActionIdentifierName
{
  -[FLOWLINKSchemaFLOWLINKAction setActionIdentifierName:](self, "setActionIdentifierName:", 0);
}

- (void)setSystemProtocol:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_systemProtocol = a3;
}

- (BOOL)hasSystemProtocol
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSystemProtocol:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSystemProtocol
{
  -[FLOWLINKSchemaFLOWLINKAction setSystemProtocol:](self, "setSystemProtocol:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPresentationStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_presentationStyle = a3;
}

- (BOOL)hasPresentationStyle
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPresentationStyle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePresentationStyle
{
  -[FLOWLINKSchemaFLOWLINKAction setPresentationStyle:](self, "setPresentationStyle:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearParameters
{
  -[NSArray removeAllObjects](self->_parameters, "removeAllObjects");
}

- (void)addParameters:(id)a3
{
  id v4;
  NSArray *parameters;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  parameters = self->_parameters;
  v8 = v4;
  if (!parameters)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_parameters;
    self->_parameters = v6;

    v4 = v8;
    parameters = self->_parameters;
  }
  -[NSArray addObject:](parameters, "addObject:", v4);

}

- (unint64_t)parametersCount
{
  return -[NSArray count](self->_parameters, "count");
}

- (id)parametersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_parameters, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWLINKSchemaFLOWLINKActionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FLOWLINKSchemaFLOWLINKAction linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FLOWLINKSchemaFLOWLINKAction linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKAction actionIdentifierName](self, "actionIdentifierName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_parameters;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
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
  $1946B6BD4AE34C1C3EF29A46664DCAD9 has;
  unsigned int v18;
  int systemProtocol;
  int v20;
  int presentationStyle;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[FLOWLINKSchemaFLOWLINKAction linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[FLOWLINKSchemaFLOWLINKAction linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWLINKSchemaFLOWLINKAction linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_24;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKAction actionIdentifierName](self, "actionIdentifierName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionIdentifierName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_23;
  -[FLOWLINKSchemaFLOWLINKAction actionIdentifierName](self, "actionIdentifierName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWLINKSchemaFLOWLINKAction actionIdentifierName](self, "actionIdentifierName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionIdentifierName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_24;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    systemProtocol = self->_systemProtocol;
    if (systemProtocol != objc_msgSend(v4, "systemProtocol"))
      goto LABEL_24;
    has = self->_has;
    v18 = v4[40];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_24;
  if (v20)
  {
    presentationStyle = self->_presentationStyle;
    if (presentationStyle != objc_msgSend(v4, "presentationStyle"))
      goto LABEL_24;
  }
  -[FLOWLINKSchemaFLOWLINKAction parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  -[FLOWLINKSchemaFLOWLINKAction parameters](self, "parameters");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {

LABEL_27:
    v27 = 1;
    goto LABEL_25;
  }
  v23 = (void *)v22;
  -[FLOWLINKSchemaFLOWLINKAction parameters](self, "parameters");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "isEqual:", v25);

  if ((v26 & 1) != 0)
    goto LABEL_27;
LABEL_24:
  v27 = 0;
LABEL_25:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSString hash](self->_actionIdentifierName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_systemProtocol;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSArray hash](self->_parameters, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_presentationStyle;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSArray hash](self->_parameters, "hash");
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
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char has;
  unsigned int v18;
  const __CFString *v19;
  unsigned int v20;
  const __CFString *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionIdentifierName)
  {
    -[FLOWLINKSchemaFLOWLINKAction actionIdentifierName](self, "actionIdentifierName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionIdentifierName"));

  }
  if (self->_linkId)
  {
    -[FLOWLINKSchemaFLOWLINKAction linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("linkId"));

    }
  }
  if (-[NSArray count](self->_parameters, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = self->_parameters;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v9, "addObject:", v15);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("parameters"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v18 = -[FLOWLINKSchemaFLOWLINKAction presentationStyle](self, "presentationStyle") - 1;
    if (v18 > 2)
      v19 = CFSTR("FLOWLINKACTIONPRESENTATIONSTYLE_UNKNOWN");
    else
      v19 = off_1E562D550[v18];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("presentationStyle"), (_QWORD)v23);
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v20 = -[FLOWLINKSchemaFLOWLINKAction systemProtocol](self, "systemProtocol") - 1;
    if (v20 > 0x19)
      v21 = CFSTR("LINKSYSTEMACTIONPROTOCOL_UNKNOWN");
    else
      v21 = off_1E562D568[v20];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("systemProtocol"), (_QWORD)v23);
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v23);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWLINKSchemaFLOWLINKAction dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWLINKSchemaFLOWLINKAction)initWithJSON:(id)a3
{
  void *v4;
  FLOWLINKSchemaFLOWLINKAction *v5;
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
    self = -[FLOWLINKSchemaFLOWLINKAction initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWLINKSchemaFLOWLINKAction)initWithDictionary:(id)a3
{
  id v4;
  FLOWLINKSchemaFLOWLINKAction *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  FLOWLINKSchemaFLOWLINKActionParameter *v19;
  FLOWLINKSchemaFLOWLINKAction *v20;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FLOWLINKSchemaFLOWLINKAction;
  v5 = -[FLOWLINKSchemaFLOWLINKAction init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[FLOWLINKSchemaFLOWLINKAction setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionIdentifierName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[FLOWLINKSchemaFLOWLINKAction setActionIdentifierName:](v5, "setActionIdentifierName:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemProtocol"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWLINKSchemaFLOWLINKAction setSystemProtocol:](v5, "setSystemProtocol:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("presentationStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWLINKSchemaFLOWLINKAction setPresentationStyle:](v5, "setPresentationStyle:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameters"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v11;
      v23 = v8;
      v24 = v6;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[FLOWLINKSchemaFLOWLINKActionParameter initWithDictionary:]([FLOWLINKSchemaFLOWLINKActionParameter alloc], "initWithDictionary:", v18);
              -[FLOWLINKSchemaFLOWLINKAction addParameters:](v5, "addParameters:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v15);
      }

      v8 = v23;
      v6 = v24;
      v11 = v22;
    }
    v20 = v5;

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

- (NSString)actionIdentifierName
{
  return self->_actionIdentifierName;
}

- (void)setActionIdentifierName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)systemProtocol
{
  return self->_systemProtocol;
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasActionIdentifierName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifierName, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
