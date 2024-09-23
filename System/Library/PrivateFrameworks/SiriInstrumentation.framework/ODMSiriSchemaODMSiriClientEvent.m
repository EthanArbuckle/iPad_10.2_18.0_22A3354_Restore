@implementation ODMSiriSchemaODMSiriClientEvent

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
  int v17;
  void *v18;
  void *v19;
  int v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ODMSiriSchemaODMSiriClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMSiriClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODMSiriSchemaODMSiriClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[ODMSiriSchemaODMSiriClientEvent taskCountsReported](self, "taskCountsReported");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODMSiriSchemaODMSiriClientEvent deleteTaskCountsReported](self, "deleteTaskCountsReported");
  -[ODMSiriSchemaODMSiriClientEvent countsReported](self, "countsReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ODMSiriSchemaODMSiriClientEvent deleteCountsReported](self, "deleteCountsReported");
  -[ODMSiriSchemaODMSiriClientEvent countsReportedAll](self, "countsReportedAll");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ODMSiriSchemaODMSiriClientEvent deleteCountsReportedAll](self, "deleteCountsReportedAll");
  -[ODMSiriSchemaODMSiriClientEvent turnRestatementScoresReported](self, "turnRestatementScoresReported");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[ODMSiriSchemaODMSiriClientEvent deleteTurnRestatementScoresReported](self, "deleteTurnRestatementScoresReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[ODMSiriSchemaODMSiriClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 2 > 3)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562A3E8[v3 - 2]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 3)
    return 0;
  else
    return off_1E562A408[a3 - 2];
}

- (int)clockIsolationLevel
{
  if ((-[ODMSiriSchemaODMSiriClientEvent whichEvent_Type](self, "whichEvent_Type") & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 2;
  else
    return 1;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[ODMSiriSchemaODMSiriClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 2 > 3)
    return CFSTR("com.apple.aiml.odm.siri.ODMSiriClientEvent");
  else
    return off_1E5639E98[v2 - 2];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[ODMSiriSchemaODMSiriClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setTaskCountsReported:(id)a3
{
  ODMSiriSchemaODMSiriTaskCountsReported *v4;
  ODMSiriSchemaODMSiriCountsReported *countsReported;
  ODMSiriSchemaODMSiriCountsReportedAll *countsReportedAll;
  ODMSiriSchemaODMSiriTurnRestatementScoresReported *turnRestatementScoresReported;
  ODMSiriSchemaODMSiriTaskCountsReported *taskCountsReported;

  v4 = (ODMSiriSchemaODMSiriTaskCountsReported *)a3;
  countsReported = self->_countsReported;
  self->_countsReported = 0;

  countsReportedAll = self->_countsReportedAll;
  self->_countsReportedAll = 0;

  turnRestatementScoresReported = self->_turnRestatementScoresReported;
  self->_turnRestatementScoresReported = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  taskCountsReported = self->_taskCountsReported;
  self->_taskCountsReported = v4;

}

- (ODMSiriSchemaODMSiriTaskCountsReported)taskCountsReported
{
  if (self->_whichEvent_Type == 2)
    return self->_taskCountsReported;
  else
    return (ODMSiriSchemaODMSiriTaskCountsReported *)0;
}

- (void)deleteTaskCountsReported
{
  ODMSiriSchemaODMSiriTaskCountsReported *taskCountsReported;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    taskCountsReported = self->_taskCountsReported;
    self->_taskCountsReported = 0;

  }
}

- (void)setCountsReported:(id)a3
{
  ODMSiriSchemaODMSiriCountsReported *v4;
  ODMSiriSchemaODMSiriTaskCountsReported *taskCountsReported;
  ODMSiriSchemaODMSiriCountsReportedAll *countsReportedAll;
  ODMSiriSchemaODMSiriTurnRestatementScoresReported *turnRestatementScoresReported;
  unint64_t v8;
  ODMSiriSchemaODMSiriCountsReported *countsReported;

  v4 = (ODMSiriSchemaODMSiriCountsReported *)a3;
  taskCountsReported = self->_taskCountsReported;
  self->_taskCountsReported = 0;

  countsReportedAll = self->_countsReportedAll;
  self->_countsReportedAll = 0;

  turnRestatementScoresReported = self->_turnRestatementScoresReported;
  self->_turnRestatementScoresReported = 0;

  v8 = 3;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  countsReported = self->_countsReported;
  self->_countsReported = v4;

}

- (ODMSiriSchemaODMSiriCountsReported)countsReported
{
  if (self->_whichEvent_Type == 3)
    return self->_countsReported;
  else
    return (ODMSiriSchemaODMSiriCountsReported *)0;
}

- (void)deleteCountsReported
{
  ODMSiriSchemaODMSiriCountsReported *countsReported;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    countsReported = self->_countsReported;
    self->_countsReported = 0;

  }
}

- (void)setCountsReportedAll:(id)a3
{
  ODMSiriSchemaODMSiriCountsReportedAll *v4;
  ODMSiriSchemaODMSiriTaskCountsReported *taskCountsReported;
  ODMSiriSchemaODMSiriCountsReported *countsReported;
  ODMSiriSchemaODMSiriTurnRestatementScoresReported *turnRestatementScoresReported;
  ODMSiriSchemaODMSiriCountsReportedAll *countsReportedAll;

  v4 = (ODMSiriSchemaODMSiriCountsReportedAll *)a3;
  taskCountsReported = self->_taskCountsReported;
  self->_taskCountsReported = 0;

  countsReported = self->_countsReported;
  self->_countsReported = 0;

  turnRestatementScoresReported = self->_turnRestatementScoresReported;
  self->_turnRestatementScoresReported = 0;

  self->_whichEvent_Type = 4 * (v4 != 0);
  countsReportedAll = self->_countsReportedAll;
  self->_countsReportedAll = v4;

}

- (ODMSiriSchemaODMSiriCountsReportedAll)countsReportedAll
{
  if (self->_whichEvent_Type == 4)
    return self->_countsReportedAll;
  else
    return (ODMSiriSchemaODMSiriCountsReportedAll *)0;
}

- (void)deleteCountsReportedAll
{
  ODMSiriSchemaODMSiriCountsReportedAll *countsReportedAll;

  if (self->_whichEvent_Type == 4)
  {
    self->_whichEvent_Type = 0;
    countsReportedAll = self->_countsReportedAll;
    self->_countsReportedAll = 0;

  }
}

- (void)setTurnRestatementScoresReported:(id)a3
{
  ODMSiriSchemaODMSiriTurnRestatementScoresReported *v4;
  ODMSiriSchemaODMSiriTaskCountsReported *taskCountsReported;
  ODMSiriSchemaODMSiriCountsReported *countsReported;
  ODMSiriSchemaODMSiriCountsReportedAll *countsReportedAll;
  unint64_t v8;
  ODMSiriSchemaODMSiriTurnRestatementScoresReported *turnRestatementScoresReported;

  v4 = (ODMSiriSchemaODMSiriTurnRestatementScoresReported *)a3;
  taskCountsReported = self->_taskCountsReported;
  self->_taskCountsReported = 0;

  countsReported = self->_countsReported;
  self->_countsReported = 0;

  countsReportedAll = self->_countsReportedAll;
  self->_countsReportedAll = 0;

  v8 = 5;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  turnRestatementScoresReported = self->_turnRestatementScoresReported;
  self->_turnRestatementScoresReported = v4;

}

- (ODMSiriSchemaODMSiriTurnRestatementScoresReported)turnRestatementScoresReported
{
  if (self->_whichEvent_Type == 5)
    return self->_turnRestatementScoresReported;
  else
    return (ODMSiriSchemaODMSiriTurnRestatementScoresReported *)0;
}

- (void)deleteTurnRestatementScoresReported
{
  ODMSiriSchemaODMSiriTurnRestatementScoresReported *turnRestatementScoresReported;

  if (self->_whichEvent_Type == 5)
  {
    self->_whichEvent_Type = 0;
    turnRestatementScoresReported = self->_turnRestatementScoresReported;
    self->_turnRestatementScoresReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriClientEventReadFrom(self, (uint64_t)a3);
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
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[ODMSiriSchemaODMSiriClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODMSiriSchemaODMSiriClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODMSiriSchemaODMSiriClientEvent taskCountsReported](self, "taskCountsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODMSiriSchemaODMSiriClientEvent taskCountsReported](self, "taskCountsReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODMSiriSchemaODMSiriClientEvent countsReported](self, "countsReported");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ODMSiriSchemaODMSiriClientEvent countsReported](self, "countsReported");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODMSiriSchemaODMSiriClientEvent countsReportedAll](self, "countsReportedAll");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ODMSiriSchemaODMSiriClientEvent countsReportedAll](self, "countsReportedAll");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODMSiriSchemaODMSiriClientEvent turnRestatementScoresReported](self, "turnRestatementScoresReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ODMSiriSchemaODMSiriClientEvent turnRestatementScoresReported](self, "turnRestatementScoresReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_28;
  -[ODMSiriSchemaODMSiriClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ODMSiriSchemaODMSiriClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODMSiriSchemaODMSiriClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[ODMSiriSchemaODMSiriClientEvent taskCountsReported](self, "taskCountsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskCountsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ODMSiriSchemaODMSiriClientEvent taskCountsReported](self, "taskCountsReported");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ODMSiriSchemaODMSiriClientEvent taskCountsReported](self, "taskCountsReported");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskCountsReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[ODMSiriSchemaODMSiriClientEvent countsReported](self, "countsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ODMSiriSchemaODMSiriClientEvent countsReported](self, "countsReported");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ODMSiriSchemaODMSiriClientEvent countsReported](self, "countsReported");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countsReported");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[ODMSiriSchemaODMSiriClientEvent countsReportedAll](self, "countsReportedAll");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countsReportedAll");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ODMSiriSchemaODMSiriClientEvent countsReportedAll](self, "countsReportedAll");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ODMSiriSchemaODMSiriClientEvent countsReportedAll](self, "countsReportedAll");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countsReportedAll");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[ODMSiriSchemaODMSiriClientEvent turnRestatementScoresReported](self, "turnRestatementScoresReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnRestatementScoresReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ODMSiriSchemaODMSiriClientEvent turnRestatementScoresReported](self, "turnRestatementScoresReported");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[ODMSiriSchemaODMSiriClientEvent turnRestatementScoresReported](self, "turnRestatementScoresReported");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnRestatementScoresReported");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
LABEL_27:

  }
LABEL_28:
  v33 = 0;
LABEL_29:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[ODMSiriSchemaODMSiriEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[ODMSiriSchemaODMSiriTaskCountsReported hash](self->_taskCountsReported, "hash") ^ v3;
  v5 = -[ODMSiriSchemaODMSiriCountsReported hash](self->_countsReported, "hash");
  v6 = v4 ^ v5 ^ -[ODMSiriSchemaODMSiriCountsReportedAll hash](self->_countsReportedAll, "hash");
  return v6 ^ -[ODMSiriSchemaODMSiriTurnRestatementScoresReported hash](self->_turnRestatementScoresReported, "hash");
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
  if (self->_countsReported)
  {
    -[ODMSiriSchemaODMSiriClientEvent countsReported](self, "countsReported");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("countsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("countsReported"));

    }
  }
  if (self->_countsReportedAll)
  {
    -[ODMSiriSchemaODMSiriClientEvent countsReportedAll](self, "countsReportedAll");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("countsReportedAll"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("countsReportedAll"));

    }
  }
  if (self->_eventMetadata)
  {
    -[ODMSiriSchemaODMSiriClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("eventMetadata"));

    }
  }
  if (self->_taskCountsReported)
  {
    -[ODMSiriSchemaODMSiriClientEvent taskCountsReported](self, "taskCountsReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("taskCountsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("taskCountsReported"));

    }
  }
  if (self->_turnRestatementScoresReported)
  {
    -[ODMSiriSchemaODMSiriClientEvent turnRestatementScoresReported](self, "turnRestatementScoresReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("turnRestatementScoresReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("turnRestatementScoresReported"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMSiriClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMSiriClientEvent)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMSiriClientEvent *v5;
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
    self = -[ODMSiriSchemaODMSiriClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMSiriClientEvent)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMSiriClientEvent *v5;
  void *v6;
  ODMSiriSchemaODMSiriEventMetadata *v7;
  void *v8;
  ODMSiriSchemaODMSiriTaskCountsReported *v9;
  void *v10;
  ODMSiriSchemaODMSiriCountsReported *v11;
  void *v12;
  ODMSiriSchemaODMSiriCountsReportedAll *v13;
  void *v14;
  ODMSiriSchemaODMSiriTurnRestatementScoresReported *v15;
  ODMSiriSchemaODMSiriClientEvent *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ODMSiriSchemaODMSiriClientEvent;
  v5 = -[ODMSiriSchemaODMSiriClientEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODMSiriSchemaODMSiriEventMetadata initWithDictionary:]([ODMSiriSchemaODMSiriEventMetadata alloc], "initWithDictionary:", v6);
      -[ODMSiriSchemaODMSiriClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskCountsReported"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODMSiriSchemaODMSiriTaskCountsReported initWithDictionary:]([ODMSiriSchemaODMSiriTaskCountsReported alloc], "initWithDictionary:", v8);
      -[ODMSiriSchemaODMSiriClientEvent setTaskCountsReported:](v5, "setTaskCountsReported:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countsReported"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ODMSiriSchemaODMSiriCountsReported initWithDictionary:]([ODMSiriSchemaODMSiriCountsReported alloc], "initWithDictionary:", v10);
      -[ODMSiriSchemaODMSiriClientEvent setCountsReported:](v5, "setCountsReported:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countsReportedAll"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ODMSiriSchemaODMSiriCountsReportedAll initWithDictionary:]([ODMSiriSchemaODMSiriCountsReportedAll alloc], "initWithDictionary:", v12);
      -[ODMSiriSchemaODMSiriClientEvent setCountsReportedAll:](v5, "setCountsReportedAll:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnRestatementScoresReported"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[ODMSiriSchemaODMSiriTurnRestatementScoresReported initWithDictionary:]([ODMSiriSchemaODMSiriTurnRestatementScoresReported alloc], "initWithDictionary:", v14);
      -[ODMSiriSchemaODMSiriClientEvent setTurnRestatementScoresReported:](v5, "setTurnRestatementScoresReported:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ODMSiriSchemaODMSiriEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasTaskCountsReported
{
  return self->_hasTaskCountsReported;
}

- (void)setHasTaskCountsReported:(BOOL)a3
{
  self->_hasTaskCountsReported = a3;
}

- (BOOL)hasCountsReported
{
  return self->_hasCountsReported;
}

- (void)setHasCountsReported:(BOOL)a3
{
  self->_hasCountsReported = a3;
}

- (BOOL)hasCountsReportedAll
{
  return self->_hasCountsReportedAll;
}

- (void)setHasCountsReportedAll:(BOOL)a3
{
  self->_hasCountsReportedAll = a3;
}

- (BOOL)hasTurnRestatementScoresReported
{
  return self->_hasTurnRestatementScoresReported;
}

- (void)setHasTurnRestatementScoresReported:(BOOL)a3
{
  self->_hasTurnRestatementScoresReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnRestatementScoresReported, 0);
  objc_storeStrong((id *)&self->_countsReportedAll, 0);
  objc_storeStrong((id *)&self->_countsReported, 0);
  objc_storeStrong((id *)&self->_taskCountsReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 72;
}

@end
