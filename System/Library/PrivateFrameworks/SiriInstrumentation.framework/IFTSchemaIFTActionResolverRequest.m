@implementation IFTSchemaIFTActionResolverRequest

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
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IFTSchemaIFTActionResolverRequest;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[IFTSchemaIFTActionResolverRequest deleteToolId](self, "deleteToolId");
  -[IFTSchemaIFTActionResolverRequest statementId](self, "statementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTActionResolverRequest deleteStatementId](self, "deleteStatementId");
  -[IFTSchemaIFTActionResolverRequest resolvedParameters](self, "resolvedParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTActionResolverRequest deleteResolvedParameters](self, "deleteResolvedParameters");
  -[IFTSchemaIFTActionResolverRequest unresolvedParameterSets](self, "unresolvedParameterSets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTActionResolverRequest setUnresolvedParameterSets:](self, "setUnresolvedParameterSets:", v13);

  return v5;
}

- (void)setExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  -[IFTSchemaIFTActionResolverRequest setExists:](self, "setExists:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasStatementId
{
  return self->_statementId != 0;
}

- (void)deleteStatementId
{
  -[IFTSchemaIFTActionResolverRequest setStatementId:](self, "setStatementId:", 0);
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

- (void)deleteToolId
{
  -[IFTSchemaIFTActionResolverRequest setToolId:](self, "setToolId:", 0);
}

- (void)setIsClientAction:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isClientAction = a3;
}

- (BOOL)hasIsClientAction
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsClientAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsClientAction
{
  -[IFTSchemaIFTActionResolverRequest setIsClientAction:](self, "setIsClientAction:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsConfirmed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isConfirmed = a3;
}

- (BOOL)hasIsConfirmed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsConfirmed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsConfirmed
{
  -[IFTSchemaIFTActionResolverRequest setIsConfirmed:](self, "setIsConfirmed:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isAuthenticated = a3;
}

- (BOOL)hasIsAuthenticated
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsAuthenticated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsAuthenticated
{
  -[IFTSchemaIFTActionResolverRequest setIsAuthenticated:](self, "setIsAuthenticated:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasResolvedParameters
{
  return self->_resolvedParameters != 0;
}

- (void)deleteResolvedParameters
{
  -[IFTSchemaIFTActionResolverRequest setResolvedParameters:](self, "setResolvedParameters:", 0);
}

- (void)clearUnresolvedParameterSets
{
  -[NSArray removeAllObjects](self->_unresolvedParameterSets, "removeAllObjects");
}

- (void)addUnresolvedParameterSets:(id)a3
{
  id v4;
  NSArray *unresolvedParameterSets;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  unresolvedParameterSets = self->_unresolvedParameterSets;
  v8 = v4;
  if (!unresolvedParameterSets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_unresolvedParameterSets;
    self->_unresolvedParameterSets = v6;

    v4 = v8;
    unresolvedParameterSets = self->_unresolvedParameterSets;
  }
  -[NSArray addObject:](unresolvedParameterSets, "addObject:", v4);

}

- (unint64_t)unresolvedParameterSetsCount
{
  return -[NSArray count](self->_unresolvedParameterSets, "count");
}

- (id)unresolvedParameterSetsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_unresolvedParameterSets, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionResolverRequestReadFrom(self, (uint64_t)a3);
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[IFTSchemaIFTActionResolverRequest statementId](self, "statementId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IFTSchemaIFTActionResolverRequest statementId](self, "statementId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTActionResolverRequest toolId](self, "toolId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:
  -[IFTSchemaIFTActionResolverRequest resolvedParameters](self, "resolvedParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[IFTSchemaIFTActionResolverRequest resolvedParameters](self, "resolvedParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_unresolvedParameterSets;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int exists;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  $8EDFC85E17A9C144CFCD513E35FF968D has;
  int v19;
  unsigned int v20;
  int isClientAction;
  int v22;
  int isConfirmed;
  int v24;
  int isAuthenticated;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  BOOL v36;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_36;
  }
  -[IFTSchemaIFTActionResolverRequest statementId](self, "statementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statementId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_35;
  -[IFTSchemaIFTActionResolverRequest statementId](self, "statementId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTActionResolverRequest statementId](self, "statementId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statementId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_36;
  }
  else
  {

  }
  -[IFTSchemaIFTActionResolverRequest toolId](self, "toolId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_35;
  -[IFTSchemaIFTActionResolverRequest toolId](self, "toolId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IFTSchemaIFTActionResolverRequest toolId](self, "toolId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_36;
  }
  else
  {

  }
  has = self->_has;
  v19 = (*(unsigned int *)&has >> 1) & 1;
  v20 = v4[56];
  if (v19 != ((v20 >> 1) & 1))
    goto LABEL_36;
  if (v19)
  {
    isClientAction = self->_isClientAction;
    if (isClientAction != objc_msgSend(v4, "isClientAction"))
      goto LABEL_36;
    has = self->_has;
    v20 = v4[56];
  }
  v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v20 >> 2) & 1))
    goto LABEL_36;
  if (v22)
  {
    isConfirmed = self->_isConfirmed;
    if (isConfirmed != objc_msgSend(v4, "isConfirmed"))
      goto LABEL_36;
    has = self->_has;
    v20 = v4[56];
  }
  v24 = (*(unsigned int *)&has >> 3) & 1;
  if (v24 != ((v20 >> 3) & 1))
    goto LABEL_36;
  if (v24)
  {
    isAuthenticated = self->_isAuthenticated;
    if (isAuthenticated != objc_msgSend(v4, "isAuthenticated"))
      goto LABEL_36;
  }
  -[IFTSchemaIFTActionResolverRequest resolvedParameters](self, "resolvedParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_35;
  -[IFTSchemaIFTActionResolverRequest resolvedParameters](self, "resolvedParameters");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[IFTSchemaIFTActionResolverRequest resolvedParameters](self, "resolvedParameters");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolvedParameters");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_36;
  }
  else
  {

  }
  -[IFTSchemaIFTActionResolverRequest unresolvedParameterSets](self, "unresolvedParameterSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unresolvedParameterSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_35:

    goto LABEL_36;
  }
  -[IFTSchemaIFTActionResolverRequest unresolvedParameterSets](self, "unresolvedParameterSets");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
  {

LABEL_39:
    v36 = 1;
    goto LABEL_37;
  }
  v32 = (void *)v31;
  -[IFTSchemaIFTActionResolverRequest unresolvedParameterSets](self, "unresolvedParameterSets");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unresolvedParameterSets");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "isEqual:", v34);

  if ((v35 & 1) != 0)
    goto LABEL_39;
LABEL_36:
  v36 = 0;
LABEL_37:

  return v36;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_exists;
  else
    v3 = 0;
  v4 = -[IFTSchemaIFTStatementId hash](self->_statementId, "hash");
  v5 = -[NSString hash](self->_toolId, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  v6 = 2654435761 * self->_isClientAction;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v7 = 2654435761 * self->_isConfirmed;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_7:
  v8 = 2654435761 * self->_isAuthenticated;
LABEL_11:
  v9 = v4 ^ v3 ^ v5 ^ v6;
  v10 = v7 ^ v8 ^ -[IFTSchemaIFTParameterSet hash](self->_resolvedParameters, "hash");
  return v9 ^ v10 ^ -[NSArray hash](self->_unresolvedParameterSets, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
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
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionResolverRequest exists](self, "exists"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("exists"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionResolverRequest isAuthenticated](self, "isAuthenticated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isAuthenticated"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionResolverRequest isClientAction](self, "isClientAction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isClientAction"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionResolverRequest isConfirmed](self, "isConfirmed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isConfirmed"));

  }
LABEL_6:
  if (self->_resolvedParameters)
  {
    -[IFTSchemaIFTActionResolverRequest resolvedParameters](self, "resolvedParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("resolvedParameters"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("resolvedParameters"));

    }
  }
  if (self->_statementId)
  {
    -[IFTSchemaIFTActionResolverRequest statementId](self, "statementId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("statementId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("statementId"));

    }
  }
  if (self->_toolId)
  {
    -[IFTSchemaIFTActionResolverRequest toolId](self, "toolId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("toolId"));

  }
  if (-[NSArray count](self->_unresolvedParameterSets, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = self->_unresolvedParameterSets;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v26);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v17, "addObject:", v23);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);

          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("unresolvedParameterSets"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v26);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTActionResolverRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTActionResolverRequest)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTActionResolverRequest *v5;
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
    self = -[IFTSchemaIFTActionResolverRequest initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTActionResolverRequest)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTActionResolverRequest *v5;
  void *v6;
  void *v7;
  IFTSchemaIFTStatementId *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  IFTSchemaIFTParameterSet *v15;
  void *v16;
  void *v17;
  IFTSchemaIFTParameterSet *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  IFTSchemaIFTParameterSet *v26;
  IFTSchemaIFTActionResolverRequest *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)IFTSchemaIFTActionResolverRequest;
  v5 = -[IFTSchemaIFTActionResolverRequest init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionResolverRequest setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statementId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[IFTSchemaIFTStatementId initWithDictionary:]([IFTSchemaIFTStatementId alloc], "initWithDictionary:", v7);
      -[IFTSchemaIFTActionResolverRequest setStatementId:](v5, "setStatementId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[IFTSchemaIFTActionResolverRequest setToolId:](v5, "setToolId:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isClientAction"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionResolverRequest setIsClientAction:](v5, "setIsClientAction:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isConfirmed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionResolverRequest setIsConfirmed:](v5, "setIsConfirmed:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAuthenticated"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionResolverRequest setIsAuthenticated:](v5, "setIsAuthenticated:", objc_msgSend(v13, "BOOLValue"));
    v34 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolvedParameters"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[IFTSchemaIFTParameterSet initWithDictionary:]([IFTSchemaIFTParameterSet alloc], "initWithDictionary:", v14);
      v16 = v14;
      v17 = v12;
      v18 = v15;
      -[IFTSchemaIFTActionResolverRequest setResolvedParameters:](v5, "setResolvedParameters:", v15);

      v12 = v17;
      v14 = v16;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unresolvedParameterSets"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v14;
      v30 = v12;
      v31 = v11;
      v32 = v7;
      v33 = v6;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v26 = -[IFTSchemaIFTParameterSet initWithDictionary:]([IFTSchemaIFTParameterSet alloc], "initWithDictionary:", v25);
              -[IFTSchemaIFTActionResolverRequest addUnresolvedParameterSets:](v5, "addUnresolvedParameterSets:", v26);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v22);
      }

      v7 = v32;
      v6 = v33;
      v11 = v31;
      v14 = v29;
      v12 = v30;
    }
    v27 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTStatementId)statementId
{
  return self->_statementId;
}

- (void)setStatementId:(id)a3
{
  objc_storeStrong((id *)&self->_statementId, a3);
}

- (NSString)toolId
{
  return self->_toolId;
}

- (void)setToolId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isClientAction
{
  return self->_isClientAction;
}

- (BOOL)isConfirmed
{
  return self->_isConfirmed;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (IFTSchemaIFTParameterSet)resolvedParameters
{
  return self->_resolvedParameters;
}

- (void)setResolvedParameters:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedParameters, a3);
}

- (NSArray)unresolvedParameterSets
{
  return self->_unresolvedParameterSets;
}

- (void)setUnresolvedParameterSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHasStatementId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasResolvedParameters:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unresolvedParameterSets, 0);
  objc_storeStrong((id *)&self->_resolvedParameters, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
}

@end
