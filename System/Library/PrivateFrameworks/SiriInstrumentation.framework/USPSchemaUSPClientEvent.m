@implementation USPSchemaUSPClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[USPSchemaUSPClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uspId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v4 = v3;
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 1;
}

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
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)USPSchemaUSPClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v28, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[USPSchemaUSPClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[USPSchemaUSPClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[USPSchemaUSPClientEvent loggingInitialized](self, "loggingInitialized");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[USPSchemaUSPClientEvent deleteLoggingInitialized](self, "deleteLoggingInitialized");
  -[USPSchemaUSPClientEvent loggingReported](self, "loggingReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[USPSchemaUSPClientEvent deleteLoggingReported](self, "deleteLoggingReported");
  -[USPSchemaUSPClientEvent measureStarted](self, "measureStarted");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[USPSchemaUSPClientEvent deleteMeasureStarted](self, "deleteMeasureStarted");
  -[USPSchemaUSPClientEvent measureEnded](self, "measureEnded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[USPSchemaUSPClientEvent deleteMeasureEnded](self, "deleteMeasureEnded");
  -[USPSchemaUSPClientEvent iterationStarted](self, "iterationStarted");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[USPSchemaUSPClientEvent deleteIterationStarted](self, "deleteIterationStarted");
  -[USPSchemaUSPClientEvent iterationEnded](self, "iterationEnded");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[USPSchemaUSPClientEvent deleteIterationEnded](self, "deleteIterationEnded");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[USPSchemaUSPClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 2 > 5)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562B008[v3 - 2]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 5)
    return 0;
  else
    return off_1E562B038[a3 - 2];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[USPSchemaUSPClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 2 > 5)
    return CFSTR("com.apple.aiml.siri.usp.USPClientEvent");
  else
    return off_1E56388E8[v2 - 2];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[USPSchemaUSPClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setLoggingInitialized:(id)a3
{
  USPSchemaUSPLoggingInitalized *v4;
  USPSchemaUSPLoggingReported *loggingReported;
  USPSchemaUSPMeasureStarted *measureStarted;
  USPSchemaUSPMeasureEnded *measureEnded;
  USPSchemaUSPIterationStarted *iterationStarted;
  USPSchemaUSPIterationEnded *iterationEnded;
  USPSchemaUSPLoggingInitalized *loggingInitialized;

  v4 = (USPSchemaUSPLoggingInitalized *)a3;
  loggingReported = self->_loggingReported;
  self->_loggingReported = 0;

  measureStarted = self->_measureStarted;
  self->_measureStarted = 0;

  measureEnded = self->_measureEnded;
  self->_measureEnded = 0;

  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = 0;

  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = v4;

}

- (USPSchemaUSPLoggingInitalized)loggingInitialized
{
  if (self->_whichEvent_Type == 2)
    return self->_loggingInitialized;
  else
    return (USPSchemaUSPLoggingInitalized *)0;
}

- (void)deleteLoggingInitialized
{
  USPSchemaUSPLoggingInitalized *loggingInitialized;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    loggingInitialized = self->_loggingInitialized;
    self->_loggingInitialized = 0;

  }
}

- (void)setLoggingReported:(id)a3
{
  USPSchemaUSPLoggingReported *v4;
  USPSchemaUSPLoggingInitalized *loggingInitialized;
  USPSchemaUSPMeasureStarted *measureStarted;
  USPSchemaUSPMeasureEnded *measureEnded;
  USPSchemaUSPIterationStarted *iterationStarted;
  USPSchemaUSPIterationEnded *iterationEnded;
  unint64_t v10;
  USPSchemaUSPLoggingReported *loggingReported;

  v4 = (USPSchemaUSPLoggingReported *)a3;
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = 0;

  measureStarted = self->_measureStarted;
  self->_measureStarted = 0;

  measureEnded = self->_measureEnded;
  self->_measureEnded = 0;

  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = 0;

  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = 0;

  v10 = 3;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  loggingReported = self->_loggingReported;
  self->_loggingReported = v4;

}

- (USPSchemaUSPLoggingReported)loggingReported
{
  if (self->_whichEvent_Type == 3)
    return self->_loggingReported;
  else
    return (USPSchemaUSPLoggingReported *)0;
}

- (void)deleteLoggingReported
{
  USPSchemaUSPLoggingReported *loggingReported;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    loggingReported = self->_loggingReported;
    self->_loggingReported = 0;

  }
}

- (void)setMeasureStarted:(id)a3
{
  USPSchemaUSPMeasureStarted *v4;
  USPSchemaUSPLoggingInitalized *loggingInitialized;
  USPSchemaUSPLoggingReported *loggingReported;
  USPSchemaUSPMeasureEnded *measureEnded;
  USPSchemaUSPIterationStarted *iterationStarted;
  USPSchemaUSPIterationEnded *iterationEnded;
  USPSchemaUSPMeasureStarted *measureStarted;

  v4 = (USPSchemaUSPMeasureStarted *)a3;
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = 0;

  loggingReported = self->_loggingReported;
  self->_loggingReported = 0;

  measureEnded = self->_measureEnded;
  self->_measureEnded = 0;

  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = 0;

  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = 0;

  self->_whichEvent_Type = 4 * (v4 != 0);
  measureStarted = self->_measureStarted;
  self->_measureStarted = v4;

}

- (USPSchemaUSPMeasureStarted)measureStarted
{
  if (self->_whichEvent_Type == 4)
    return self->_measureStarted;
  else
    return (USPSchemaUSPMeasureStarted *)0;
}

- (void)deleteMeasureStarted
{
  USPSchemaUSPMeasureStarted *measureStarted;

  if (self->_whichEvent_Type == 4)
  {
    self->_whichEvent_Type = 0;
    measureStarted = self->_measureStarted;
    self->_measureStarted = 0;

  }
}

- (void)setMeasureEnded:(id)a3
{
  USPSchemaUSPMeasureEnded *v4;
  USPSchemaUSPLoggingInitalized *loggingInitialized;
  USPSchemaUSPLoggingReported *loggingReported;
  USPSchemaUSPMeasureStarted *measureStarted;
  USPSchemaUSPIterationStarted *iterationStarted;
  USPSchemaUSPIterationEnded *iterationEnded;
  unint64_t v10;
  USPSchemaUSPMeasureEnded *measureEnded;

  v4 = (USPSchemaUSPMeasureEnded *)a3;
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = 0;

  loggingReported = self->_loggingReported;
  self->_loggingReported = 0;

  measureStarted = self->_measureStarted;
  self->_measureStarted = 0;

  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = 0;

  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = 0;

  v10 = 5;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  measureEnded = self->_measureEnded;
  self->_measureEnded = v4;

}

- (USPSchemaUSPMeasureEnded)measureEnded
{
  if (self->_whichEvent_Type == 5)
    return self->_measureEnded;
  else
    return (USPSchemaUSPMeasureEnded *)0;
}

- (void)deleteMeasureEnded
{
  USPSchemaUSPMeasureEnded *measureEnded;

  if (self->_whichEvent_Type == 5)
  {
    self->_whichEvent_Type = 0;
    measureEnded = self->_measureEnded;
    self->_measureEnded = 0;

  }
}

- (void)setIterationStarted:(id)a3
{
  USPSchemaUSPIterationStarted *v4;
  USPSchemaUSPLoggingInitalized *loggingInitialized;
  USPSchemaUSPLoggingReported *loggingReported;
  USPSchemaUSPMeasureStarted *measureStarted;
  USPSchemaUSPMeasureEnded *measureEnded;
  USPSchemaUSPIterationEnded *iterationEnded;
  unint64_t v10;
  USPSchemaUSPIterationStarted *iterationStarted;

  v4 = (USPSchemaUSPIterationStarted *)a3;
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = 0;

  loggingReported = self->_loggingReported;
  self->_loggingReported = 0;

  measureStarted = self->_measureStarted;
  self->_measureStarted = 0;

  measureEnded = self->_measureEnded;
  self->_measureEnded = 0;

  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = 0;

  v10 = 6;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = v4;

}

- (USPSchemaUSPIterationStarted)iterationStarted
{
  if (self->_whichEvent_Type == 6)
    return self->_iterationStarted;
  else
    return (USPSchemaUSPIterationStarted *)0;
}

- (void)deleteIterationStarted
{
  USPSchemaUSPIterationStarted *iterationStarted;

  if (self->_whichEvent_Type == 6)
  {
    self->_whichEvent_Type = 0;
    iterationStarted = self->_iterationStarted;
    self->_iterationStarted = 0;

  }
}

- (void)setIterationEnded:(id)a3
{
  USPSchemaUSPIterationEnded *v4;
  USPSchemaUSPLoggingInitalized *loggingInitialized;
  USPSchemaUSPLoggingReported *loggingReported;
  USPSchemaUSPMeasureStarted *measureStarted;
  USPSchemaUSPMeasureEnded *measureEnded;
  USPSchemaUSPIterationStarted *iterationStarted;
  unint64_t v10;
  USPSchemaUSPIterationEnded *iterationEnded;

  v4 = (USPSchemaUSPIterationEnded *)a3;
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = 0;

  loggingReported = self->_loggingReported;
  self->_loggingReported = 0;

  measureStarted = self->_measureStarted;
  self->_measureStarted = 0;

  measureEnded = self->_measureEnded;
  self->_measureEnded = 0;

  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = 0;

  v10 = 7;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = v4;

}

- (USPSchemaUSPIterationEnded)iterationEnded
{
  if (self->_whichEvent_Type == 7)
    return self->_iterationEnded;
  else
    return (USPSchemaUSPIterationEnded *)0;
}

- (void)deleteIterationEnded
{
  USPSchemaUSPIterationEnded *iterationEnded;

  if (self->_whichEvent_Type == 7)
  {
    self->_whichEvent_Type = 0;
    iterationEnded = self->_iterationEnded;
    self->_iterationEnded = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return USPSchemaUSPClientEventReadFrom(self, (uint64_t)a3);
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[USPSchemaUSPClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[USPSchemaUSPClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[USPSchemaUSPClientEvent loggingInitialized](self, "loggingInitialized");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[USPSchemaUSPClientEvent loggingInitialized](self, "loggingInitialized");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[USPSchemaUSPClientEvent loggingReported](self, "loggingReported");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[USPSchemaUSPClientEvent loggingReported](self, "loggingReported");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[USPSchemaUSPClientEvent measureStarted](self, "measureStarted");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[USPSchemaUSPClientEvent measureStarted](self, "measureStarted");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[USPSchemaUSPClientEvent measureEnded](self, "measureEnded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[USPSchemaUSPClientEvent measureEnded](self, "measureEnded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[USPSchemaUSPClientEvent iterationStarted](self, "iterationStarted");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[USPSchemaUSPClientEvent iterationStarted](self, "iterationStarted");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[USPSchemaUSPClientEvent iterationEnded](self, "iterationEnded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[USPSchemaUSPClientEvent iterationEnded](self, "iterationEnded");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  BOOL v43;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_38;
  -[USPSchemaUSPClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[USPSchemaUSPClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[USPSchemaUSPClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_38;
  }
  else
  {

  }
  -[USPSchemaUSPClientEvent loggingInitialized](self, "loggingInitialized");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggingInitialized");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[USPSchemaUSPClientEvent loggingInitialized](self, "loggingInitialized");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[USPSchemaUSPClientEvent loggingInitialized](self, "loggingInitialized");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingInitialized");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_38;
  }
  else
  {

  }
  -[USPSchemaUSPClientEvent loggingReported](self, "loggingReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggingReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[USPSchemaUSPClientEvent loggingReported](self, "loggingReported");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[USPSchemaUSPClientEvent loggingReported](self, "loggingReported");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingReported");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_38;
  }
  else
  {

  }
  -[USPSchemaUSPClientEvent measureStarted](self, "measureStarted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "measureStarted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[USPSchemaUSPClientEvent measureStarted](self, "measureStarted");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[USPSchemaUSPClientEvent measureStarted](self, "measureStarted");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "measureStarted");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_38;
  }
  else
  {

  }
  -[USPSchemaUSPClientEvent measureEnded](self, "measureEnded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "measureEnded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[USPSchemaUSPClientEvent measureEnded](self, "measureEnded");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[USPSchemaUSPClientEvent measureEnded](self, "measureEnded");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "measureEnded");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_38;
  }
  else
  {

  }
  -[USPSchemaUSPClientEvent iterationStarted](self, "iterationStarted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iterationStarted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[USPSchemaUSPClientEvent iterationStarted](self, "iterationStarted");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[USPSchemaUSPClientEvent iterationStarted](self, "iterationStarted");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iterationStarted");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_38;
  }
  else
  {

  }
  -[USPSchemaUSPClientEvent iterationEnded](self, "iterationEnded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iterationEnded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[USPSchemaUSPClientEvent iterationEnded](self, "iterationEnded");
    v38 = objc_claimAutoreleasedReturnValue();
    if (!v38)
    {

LABEL_41:
      v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    -[USPSchemaUSPClientEvent iterationEnded](self, "iterationEnded");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iterationEnded");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if ((v42 & 1) != 0)
      goto LABEL_41;
  }
  else
  {
LABEL_37:

  }
LABEL_38:
  v43 = 0;
LABEL_39:

  return v43;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[USPSchemaUSPClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[USPSchemaUSPLoggingInitalized hash](self->_loggingInitialized, "hash") ^ v3;
  v5 = -[USPSchemaUSPLoggingReported hash](self->_loggingReported, "hash");
  v6 = v4 ^ v5 ^ -[USPSchemaUSPMeasureStarted hash](self->_measureStarted, "hash");
  v7 = -[USPSchemaUSPMeasureEnded hash](self->_measureEnded, "hash");
  v8 = v7 ^ -[USPSchemaUSPIterationStarted hash](self->_iterationStarted, "hash");
  return v6 ^ v8 ^ -[USPSchemaUSPIterationEnded hash](self->_iterationEnded, "hash");
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[USPSchemaUSPClientEvent eventMetadata](self, "eventMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventMetadata"));

    }
  }
  if (self->_iterationEnded)
  {
    -[USPSchemaUSPClientEvent iterationEnded](self, "iterationEnded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("iterationEnded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("iterationEnded"));

    }
  }
  if (self->_iterationStarted)
  {
    -[USPSchemaUSPClientEvent iterationStarted](self, "iterationStarted");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("iterationStarted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("iterationStarted"));

    }
  }
  if (self->_loggingInitialized)
  {
    -[USPSchemaUSPClientEvent loggingInitialized](self, "loggingInitialized");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("loggingInitialized"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("loggingInitialized"));

    }
  }
  if (self->_loggingReported)
  {
    -[USPSchemaUSPClientEvent loggingReported](self, "loggingReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("loggingReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("loggingReported"));

    }
  }
  if (self->_measureEnded)
  {
    -[USPSchemaUSPClientEvent measureEnded](self, "measureEnded");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("measureEnded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("measureEnded"));

    }
  }
  if (self->_measureStarted)
  {
    -[USPSchemaUSPClientEvent measureStarted](self, "measureStarted");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("measureStarted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("measureStarted"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USPSchemaUSPClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USPSchemaUSPClientEvent)initWithJSON:(id)a3
{
  void *v4;
  USPSchemaUSPClientEvent *v5;
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
    self = -[USPSchemaUSPClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USPSchemaUSPClientEvent)initWithDictionary:(id)a3
{
  id v4;
  USPSchemaUSPClientEvent *v5;
  void *v6;
  USPSchemaUSPClientEventMetadata *v7;
  void *v8;
  USPSchemaUSPLoggingInitalized *v9;
  void *v10;
  USPSchemaUSPLoggingReported *v11;
  void *v12;
  USPSchemaUSPMeasureStarted *v13;
  void *v14;
  USPSchemaUSPMeasureEnded *v15;
  void *v16;
  USPSchemaUSPIterationStarted *v17;
  void *v18;
  USPSchemaUSPIterationEnded *v19;
  USPSchemaUSPClientEvent *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)USPSchemaUSPClientEvent;
  v5 = -[USPSchemaUSPClientEvent init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[USPSchemaUSPClientEventMetadata initWithDictionary:]([USPSchemaUSPClientEventMetadata alloc], "initWithDictionary:", v6);
      -[USPSchemaUSPClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loggingInitialized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[USPSchemaUSPLoggingInitalized initWithDictionary:]([USPSchemaUSPLoggingInitalized alloc], "initWithDictionary:", v8);
      -[USPSchemaUSPClientEvent setLoggingInitialized:](v5, "setLoggingInitialized:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loggingReported"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[USPSchemaUSPLoggingReported initWithDictionary:]([USPSchemaUSPLoggingReported alloc], "initWithDictionary:", v10);
      -[USPSchemaUSPClientEvent setLoggingReported:](v5, "setLoggingReported:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("measureStarted"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[USPSchemaUSPMeasureStarted initWithDictionary:]([USPSchemaUSPMeasureStarted alloc], "initWithDictionary:", v12);
      -[USPSchemaUSPClientEvent setMeasureStarted:](v5, "setMeasureStarted:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("measureEnded"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[USPSchemaUSPMeasureEnded initWithDictionary:]([USPSchemaUSPMeasureEnded alloc], "initWithDictionary:", v14);
      -[USPSchemaUSPClientEvent setMeasureEnded:](v5, "setMeasureEnded:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterationStarted"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[USPSchemaUSPIterationStarted initWithDictionary:]([USPSchemaUSPIterationStarted alloc], "initWithDictionary:", v16);
      -[USPSchemaUSPClientEvent setIterationStarted:](v5, "setIterationStarted:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iterationEnded"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[USPSchemaUSPIterationEnded initWithDictionary:]([USPSchemaUSPIterationEnded alloc], "initWithDictionary:", v18);
      -[USPSchemaUSPClientEvent setIterationEnded:](v5, "setIterationEnded:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (USPSchemaUSPClientEventMetadata)eventMetadata
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

- (BOOL)hasLoggingInitialized
{
  return self->_hasLoggingInitialized;
}

- (void)setHasLoggingInitialized:(BOOL)a3
{
  self->_hasLoggingInitialized = a3;
}

- (BOOL)hasLoggingReported
{
  return self->_hasLoggingReported;
}

- (void)setHasLoggingReported:(BOOL)a3
{
  self->_hasLoggingReported = a3;
}

- (BOOL)hasMeasureStarted
{
  return self->_hasMeasureStarted;
}

- (void)setHasMeasureStarted:(BOOL)a3
{
  self->_hasMeasureStarted = a3;
}

- (BOOL)hasMeasureEnded
{
  return self->_hasMeasureEnded;
}

- (void)setHasMeasureEnded:(BOOL)a3
{
  self->_hasMeasureEnded = a3;
}

- (BOOL)hasIterationStarted
{
  return self->_hasIterationStarted;
}

- (void)setHasIterationStarted:(BOOL)a3
{
  self->_hasIterationStarted = a3;
}

- (BOOL)hasIterationEnded
{
  return self->_hasIterationEnded;
}

- (void)setHasIterationEnded:(BOOL)a3
{
  self->_hasIterationEnded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationEnded, 0);
  objc_storeStrong((id *)&self->_iterationStarted, 0);
  objc_storeStrong((id *)&self->_measureEnded, 0);
  objc_storeStrong((id *)&self->_measureStarted, 0);
  objc_storeStrong((id *)&self->_loggingReported, 0);
  objc_storeStrong((id *)&self->_loggingInitialized, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 15;
}

@end
