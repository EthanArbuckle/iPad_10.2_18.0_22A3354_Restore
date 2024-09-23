@implementation FLOWSchemaFLOWHomeAutomationCommand

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
  v12.super_class = (Class)FLOWSchemaFLOWHomeAutomationCommand;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWHomeAutomationCommand commandId](self, "commandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWHomeAutomationCommand deleteCommandId](self, "deleteCommandId");
  -[FLOWSchemaFLOWHomeAutomationCommand homeAutomationRequests](self, "homeAutomationRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWHomeAutomationCommand setHomeAutomationRequests:](self, "setHomeAutomationRequests:", v10);

  return v5;
}

- (BOOL)hasCommandId
{
  return self->_commandId != 0;
}

- (void)deleteCommandId
{
  -[FLOWSchemaFLOWHomeAutomationCommand setCommandId:](self, "setCommandId:", 0);
}

- (void)setCommandType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_commandType = a3;
}

- (BOOL)hasCommandType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCommandType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCommandType
{
  -[FLOWSchemaFLOWHomeAutomationCommand setCommandType:](self, "setCommandType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCommandOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_commandOutcome = a3;
}

- (BOOL)hasCommandOutcome
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCommandOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCommandOutcome
{
  -[FLOWSchemaFLOWHomeAutomationCommand setCommandOutcome:](self, "setCommandOutcome:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setCommandErrorReason:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_commandErrorReason = a3;
}

- (BOOL)hasCommandErrorReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasCommandErrorReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteCommandErrorReason
{
  -[FLOWSchemaFLOWHomeAutomationCommand setCommandErrorReason:](self, "setCommandErrorReason:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setCommandDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_commandDuration = a3;
}

- (BOOL)hasCommandDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasCommandDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteCommandDuration
{
  -[FLOWSchemaFLOWHomeAutomationCommand setCommandDuration:](self, "setCommandDuration:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)clearHomeAutomationRequests
{
  -[NSArray removeAllObjects](self->_homeAutomationRequests, "removeAllObjects");
}

- (void)addHomeAutomationRequests:(id)a3
{
  id v4;
  NSArray *homeAutomationRequests;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  homeAutomationRequests = self->_homeAutomationRequests;
  v8 = v4;
  if (!homeAutomationRequests)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_homeAutomationRequests;
    self->_homeAutomationRequests = v6;

    v4 = v8;
    homeAutomationRequests = self->_homeAutomationRequests;
  }
  -[NSArray addObject:](homeAutomationRequests, "addObject:", v4);

}

- (unint64_t)homeAutomationRequestsCount
{
  return -[NSArray count](self->_homeAutomationRequests, "count");
}

- (id)homeAutomationRequestsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_homeAutomationRequests, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeAutomationCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char has;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FLOWSchemaFLOWHomeAutomationCommand commandId](self, "commandId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FLOWSchemaFLOWHomeAutomationCommand commandId](self, "commandId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_homeAutomationRequests;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
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
  $A809843C742EF03E8E450DB41C62EA87 has;
  unsigned int v13;
  int commandType;
  int v15;
  int commandOutcome;
  int v17;
  int commandErrorReason;
  int v19;
  unsigned int commandDuration;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[FLOWSchemaFLOWHomeAutomationCommand commandId](self, "commandId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[FLOWSchemaFLOWHomeAutomationCommand commandId](self, "commandId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWHomeAutomationCommand commandId](self, "commandId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_27;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    commandType = self->_commandType;
    if (commandType != objc_msgSend(v4, "commandType"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[40];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_27;
  if (v15)
  {
    commandOutcome = self->_commandOutcome;
    if (commandOutcome != objc_msgSend(v4, "commandOutcome"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[40];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_27;
  if (v17)
  {
    commandErrorReason = self->_commandErrorReason;
    if (commandErrorReason != objc_msgSend(v4, "commandErrorReason"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[40];
  }
  v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1))
    goto LABEL_27;
  if (v19)
  {
    commandDuration = self->_commandDuration;
    if (commandDuration != objc_msgSend(v4, "commandDuration"))
      goto LABEL_27;
  }
  -[FLOWSchemaFLOWHomeAutomationCommand homeAutomationRequests](self, "homeAutomationRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAutomationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  -[FLOWSchemaFLOWHomeAutomationCommand homeAutomationRequests](self, "homeAutomationRequests");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {

LABEL_30:
    v26 = 1;
    goto LABEL_28;
  }
  v22 = (void *)v21;
  -[FLOWSchemaFLOWHomeAutomationCommand homeAutomationRequests](self, "homeAutomationRequests");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAutomationRequests");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqual:", v24);

  if ((v25 & 1) != 0)
    goto LABEL_30;
LABEL_27:
  v26 = 0;
LABEL_28:

  return v26;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_commandId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_commandType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_commandOutcome;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSArray hash](self->_homeAutomationRequests, "hash");
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_commandErrorReason;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_commandDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSArray hash](self->_homeAutomationRequests, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unsigned int v12;
  const __CFString *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeAutomationCommand commandDuration](self, "commandDuration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commandDuration"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = -[FLOWSchemaFLOWHomeAutomationCommand commandErrorReason](self, "commandErrorReason") - 1;
    if (v6 > 9)
      v7 = CFSTR("FLOWHOMEAUTOMATIONCOMMANDERRORREASON_UNKOWN");
    else
      v7 = off_1E562D9F0[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("commandErrorReason"));
  }
  if (self->_commandId)
  {
    -[FLOWSchemaFLOWHomeAutomationCommand commandId](self, "commandId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("commandId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("commandId"));

    }
  }
  v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    v12 = -[FLOWSchemaFLOWHomeAutomationCommand commandOutcome](self, "commandOutcome") - 1;
    if (v12 > 2)
      v13 = CFSTR("FLOWHOMEAUTOMATIONOUTCOME_UNKOWN");
    else
      v13 = off_1E562DA40[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("commandOutcome"));
    v11 = (char)self->_has;
  }
  if ((v11 & 1) != 0)
  {
    v14 = -[FLOWSchemaFLOWHomeAutomationCommand commandType](self, "commandType") - 1;
    if (v14 > 3)
      v15 = CFSTR("FLOWHOMEAUTOMATIONCOMMANDTYPE_UNKNOWN");
    else
      v15 = off_1E562DA58[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("commandType"));
  }
  if (-[NSArray count](self->_homeAutomationRequests, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = self->_homeAutomationRequests;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v25);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v16, "addObject:", v22);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v23);

          }
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("homeAutomationRequests"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v25);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWHomeAutomationCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWHomeAutomationCommand)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWHomeAutomationCommand *v5;
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
    self = -[FLOWSchemaFLOWHomeAutomationCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWHomeAutomationCommand)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWHomeAutomationCommand *v5;
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
  FLOWSchemaFLOWHomeAutomationRequest *v19;
  FLOWSchemaFLOWHomeAutomationCommand *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FLOWSchemaFLOWHomeAutomationCommand;
  v5 = -[FLOWSchemaFLOWHomeAutomationCommand init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWHomeAutomationCommand setCommandId:](v5, "setCommandId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationCommand setCommandType:](v5, "setCommandType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandOutcome"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationCommand setCommandOutcome:](v5, "setCommandOutcome:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandErrorReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationCommand setCommandErrorReason:](v5, "setCommandErrorReason:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandDuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeAutomationCommand setCommandDuration:](v5, "setCommandDuration:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeAutomationRequests"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v11;
      v23 = v10;
      v24 = v9;
      v25 = v6;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[FLOWSchemaFLOWHomeAutomationRequest initWithDictionary:]([FLOWSchemaFLOWHomeAutomationRequest alloc], "initWithDictionary:", v18);
              -[FLOWSchemaFLOWHomeAutomationCommand addHomeAutomationRequests:](v5, "addHomeAutomationRequests:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v15);
      }

      v6 = v25;
      v10 = v23;
      v9 = v24;
      v11 = v22;
    }
    v20 = v5;

  }
  return v5;
}

- (SISchemaUUID)commandId
{
  return self->_commandId;
}

- (void)setCommandId:(id)a3
{
  objc_storeStrong((id *)&self->_commandId, a3);
}

- (int)commandType
{
  return self->_commandType;
}

- (int)commandOutcome
{
  return self->_commandOutcome;
}

- (int)commandErrorReason
{
  return self->_commandErrorReason;
}

- (unsigned)commandDuration
{
  return self->_commandDuration;
}

- (NSArray)homeAutomationRequests
{
  return self->_homeAutomationRequests;
}

- (void)setHomeAutomationRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasCommandId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAutomationRequests, 0);
  objc_storeStrong((id *)&self->_commandId, 0);
}

@end
