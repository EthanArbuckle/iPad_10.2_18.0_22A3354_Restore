@implementation IFTSchemaIFTSystemPromptResolution

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
  v16.super_class = (Class)IFTSchemaIFTSystemPromptResolution;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTSystemPromptResolution statementId](self, "statementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTSystemPromptResolution deleteStatementId](self, "deleteStatementId");
  -[IFTSchemaIFTSystemPromptResolution userAction](self, "userAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTSystemPromptResolution deleteUserAction](self, "deleteUserAction");
  -[IFTSchemaIFTSystemPromptResolution actionEventId](self, "actionEventId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTSystemPromptResolution deleteActionEventId](self, "deleteActionEventId");

  return v5;
}

- (BOOL)hasStatementId
{
  return self->_statementId != 0;
}

- (void)deleteStatementId
{
  -[IFTSchemaIFTSystemPromptResolution setStatementId:](self, "setStatementId:", 0);
}

- (BOOL)hasUserAction
{
  return self->_userAction != 0;
}

- (void)deleteUserAction
{
  -[IFTSchemaIFTSystemPromptResolution setUserAction:](self, "setUserAction:", 0);
}

- (void)setInputModality:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_inputModality = a3;
}

- (BOOL)hasInputModality
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasInputModality:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteInputModality
{
  -[IFTSchemaIFTSystemPromptResolution setInputModality:](self, "setInputModality:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasActionEventId
{
  return self->_actionEventId != 0;
}

- (void)deleteActionEventId
{
  -[IFTSchemaIFTSystemPromptResolution setActionEventId:](self, "setActionEventId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTSystemPromptResolutionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[IFTSchemaIFTSystemPromptResolution statementId](self, "statementId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTSystemPromptResolution statementId](self, "statementId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTSystemPromptResolution userAction](self, "userAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTSystemPromptResolution userAction](self, "userAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[IFTSchemaIFTSystemPromptResolution actionEventId](self, "actionEventId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[IFTSchemaIFTSystemPromptResolution actionEventId](self, "actionEventId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int inputModality;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[IFTSchemaIFTSystemPromptResolution statementId](self, "statementId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[IFTSchemaIFTSystemPromptResolution statementId](self, "statementId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IFTSchemaIFTSystemPromptResolution statementId](self, "statementId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statementId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  -[IFTSchemaIFTSystemPromptResolution userAction](self, "userAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[IFTSchemaIFTSystemPromptResolution userAction](self, "userAction");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[IFTSchemaIFTSystemPromptResolution userAction](self, "userAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    inputModality = self->_inputModality;
    if (inputModality != objc_msgSend(v4, "inputModality"))
      goto LABEL_20;
  }
  -[IFTSchemaIFTSystemPromptResolution actionEventId](self, "actionEventId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionEventId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[IFTSchemaIFTSystemPromptResolution actionEventId](self, "actionEventId");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[IFTSchemaIFTSystemPromptResolution actionEventId](self, "actionEventId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionEventId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[IFTSchemaIFTStatementId hash](self->_statementId, "hash");
  v4 = -[IFTSchemaIFTSystemPromptResolutionUserAction hash](self->_userAction, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_inputModality;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[SISchemaUUID hash](self->_actionEventId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionEventId)
  {
    -[IFTSchemaIFTSystemPromptResolution actionEventId](self, "actionEventId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionEventId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionEventId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[IFTSchemaIFTSystemPromptResolution inputModality](self, "inputModality");
    v8 = CFSTR("IFTSYSTEMPROMPTRESOLUTIONINPUTMODALITY_UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("IFTSYSTEMPROMPTRESOLUTIONINPUTMODALITY_TOUCH");
    if (v7 == 2)
      v9 = CFSTR("IFTSYSTEMPROMPTRESOLUTIONINPUTMODALITY_HAND_GESTURE");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("inputModality"));
  }
  if (self->_statementId)
  {
    -[IFTSchemaIFTSystemPromptResolution statementId](self, "statementId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("statementId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("statementId"));

    }
  }
  if (self->_userAction)
  {
    -[IFTSchemaIFTSystemPromptResolution userAction](self, "userAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("userAction"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("userAction"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTSystemPromptResolution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTSystemPromptResolution)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTSystemPromptResolution *v5;
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
    self = -[IFTSchemaIFTSystemPromptResolution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTSystemPromptResolution)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTSystemPromptResolution *v5;
  void *v6;
  IFTSchemaIFTStatementId *v7;
  void *v8;
  IFTSchemaIFTSystemPromptResolutionUserAction *v9;
  void *v10;
  void *v11;
  SISchemaUUID *v12;
  IFTSchemaIFTSystemPromptResolution *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IFTSchemaIFTSystemPromptResolution;
  v5 = -[IFTSchemaIFTSystemPromptResolution init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statementId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTStatementId initWithDictionary:]([IFTSchemaIFTStatementId alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTSystemPromptResolution setStatementId:](v5, "setStatementId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTSystemPromptResolutionUserAction initWithDictionary:]([IFTSchemaIFTSystemPromptResolutionUserAction alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTSystemPromptResolution setUserAction:](v5, "setUserAction:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputModality"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTSystemPromptResolution setInputModality:](v5, "setInputModality:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionEventId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[IFTSchemaIFTSystemPromptResolution setActionEventId:](v5, "setActionEventId:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (IFTSchemaIFTStatementId)statementId
{
  return self->_statementId;
}

- (void)setStatementId:(id)a3
{
  objc_storeStrong((id *)&self->_statementId, a3);
}

- (IFTSchemaIFTSystemPromptResolutionUserAction)userAction
{
  return self->_userAction;
}

- (void)setUserAction:(id)a3
{
  objc_storeStrong((id *)&self->_userAction, a3);
}

- (int)inputModality
{
  return self->_inputModality;
}

- (SISchemaUUID)actionEventId
{
  return self->_actionEventId;
}

- (void)setActionEventId:(id)a3
{
  objc_storeStrong((id *)&self->_actionEventId, a3);
}

- (void)setHasStatementId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasActionEventId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionEventId, 0);
  objc_storeStrong((id *)&self->_userAction, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
}

@end
