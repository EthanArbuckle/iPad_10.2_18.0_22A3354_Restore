@implementation RFSchemaRFClientEvent

- (id)getComponentId
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "turnId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "value");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
        goto LABEL_11;
    }
  }
  -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "value");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v4 = v10;
LABEL_11:
        v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "value");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v4, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
      goto LABEL_11;
    goto LABEL_12;
  }
LABEL_13:

  return v16;
}

- (int)componentName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "turnId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    LODWORD(v9) = 2;
  }
  else
  {
LABEL_5:
    -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_9;
    objc_msgSend(v11, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_9;
    v13 = (void *)v12;
    objc_msgSend(v11, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subRequestId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v4, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v4, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");

          if (v18)
            LODWORD(v9) = 43;
          else
            LODWORD(v9) = 0;
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
}

+ (int)joinability
{
  return 2;
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
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RFSchemaRFClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[RFSchemaRFClientEvent deleteRfGradingDialogReportedTier1](self, "deleteRfGradingDialogReportedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[RFSchemaRFClientEvent deleteRfGradingDialogReportedTier1](self, "deleteRfGradingDialogReportedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[RFSchemaRFClientEvent deleteRfGradingDialogReportedTier1](self, "deleteRfGradingDialogReportedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[RFSchemaRFClientEvent deleteRfGradingDialogReportedTier1](self, "deleteRfGradingDialogReportedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[RFSchemaRFClientEvent deleteRfGradingDialogReportedTier1](self, "deleteRfGradingDialogReportedTier1");
  -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RFSchemaRFClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[RFSchemaRFClientEvent patternExecuted](self, "patternExecuted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RFSchemaRFClientEvent deletePatternExecuted](self, "deletePatternExecuted");
  -[RFSchemaRFClientEvent interactionPerformed](self, "interactionPerformed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[RFSchemaRFClientEvent deleteInteractionPerformed](self, "deleteInteractionPerformed");
  -[RFSchemaRFClientEvent componentShown](self, "componentShown");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[RFSchemaRFClientEvent deleteComponentShown](self, "deleteComponentShown");
  -[RFSchemaRFClientEvent snippetRenderingContext](self, "snippetRenderingContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[RFSchemaRFClientEvent deleteSnippetRenderingContext](self, "deleteSnippetRenderingContext");
  -[RFSchemaRFClientEvent rfGradingDialogReportedTier1](self, "rfGradingDialogReportedTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[RFSchemaRFClientEvent deleteRfGradingDialogReportedTier1](self, "deleteRfGradingDialogReportedTier1");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[RFSchemaRFClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 4)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AB48[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 4)
    return 0;
  else
    return off_1E562AB70[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[RFSchemaRFClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 4)
    return CFSTR("com.apple.aiml.siri.rf.RFClientEvent");
  else
    return off_1E5633138[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[RFSchemaRFClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setPatternExecuted:(id)a3
{
  RFSchemaRFPatternExecuted *v4;
  RFSchemaRFInteractionPerformed *interactionPerformed;
  RFSchemaRFComponentShown *componentShown;
  RFSchemaRFSnippetRenderingContext *snippetRenderingContext;
  RFSchemaRFGradingDialogReportedTier1 *rfGradingDialogReportedTier1;
  unint64_t v9;
  RFSchemaRFPatternExecuted *patternExecuted;

  v4 = (RFSchemaRFPatternExecuted *)a3;
  interactionPerformed = self->_interactionPerformed;
  self->_interactionPerformed = 0;

  componentShown = self->_componentShown;
  self->_componentShown = 0;

  snippetRenderingContext = self->_snippetRenderingContext;
  self->_snippetRenderingContext = 0;

  rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
  self->_rfGradingDialogReportedTier1 = 0;

  v9 = 101;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  patternExecuted = self->_patternExecuted;
  self->_patternExecuted = v4;

}

- (RFSchemaRFPatternExecuted)patternExecuted
{
  if (self->_whichEvent_Type == 101)
    return self->_patternExecuted;
  else
    return (RFSchemaRFPatternExecuted *)0;
}

- (void)deletePatternExecuted
{
  RFSchemaRFPatternExecuted *patternExecuted;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    patternExecuted = self->_patternExecuted;
    self->_patternExecuted = 0;

  }
}

- (void)setInteractionPerformed:(id)a3
{
  RFSchemaRFInteractionPerformed *v4;
  RFSchemaRFPatternExecuted *patternExecuted;
  RFSchemaRFComponentShown *componentShown;
  RFSchemaRFSnippetRenderingContext *snippetRenderingContext;
  RFSchemaRFGradingDialogReportedTier1 *rfGradingDialogReportedTier1;
  unint64_t v9;
  RFSchemaRFInteractionPerformed *interactionPerformed;

  v4 = (RFSchemaRFInteractionPerformed *)a3;
  patternExecuted = self->_patternExecuted;
  self->_patternExecuted = 0;

  componentShown = self->_componentShown;
  self->_componentShown = 0;

  snippetRenderingContext = self->_snippetRenderingContext;
  self->_snippetRenderingContext = 0;

  rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
  self->_rfGradingDialogReportedTier1 = 0;

  v9 = 102;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  interactionPerformed = self->_interactionPerformed;
  self->_interactionPerformed = v4;

}

- (RFSchemaRFInteractionPerformed)interactionPerformed
{
  if (self->_whichEvent_Type == 102)
    return self->_interactionPerformed;
  else
    return (RFSchemaRFInteractionPerformed *)0;
}

- (void)deleteInteractionPerformed
{
  RFSchemaRFInteractionPerformed *interactionPerformed;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    interactionPerformed = self->_interactionPerformed;
    self->_interactionPerformed = 0;

  }
}

- (void)setComponentShown:(id)a3
{
  RFSchemaRFComponentShown *v4;
  RFSchemaRFPatternExecuted *patternExecuted;
  RFSchemaRFInteractionPerformed *interactionPerformed;
  RFSchemaRFSnippetRenderingContext *snippetRenderingContext;
  RFSchemaRFGradingDialogReportedTier1 *rfGradingDialogReportedTier1;
  unint64_t v9;
  RFSchemaRFComponentShown *componentShown;

  v4 = (RFSchemaRFComponentShown *)a3;
  patternExecuted = self->_patternExecuted;
  self->_patternExecuted = 0;

  interactionPerformed = self->_interactionPerformed;
  self->_interactionPerformed = 0;

  snippetRenderingContext = self->_snippetRenderingContext;
  self->_snippetRenderingContext = 0;

  rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
  self->_rfGradingDialogReportedTier1 = 0;

  v9 = 103;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  componentShown = self->_componentShown;
  self->_componentShown = v4;

}

- (RFSchemaRFComponentShown)componentShown
{
  if (self->_whichEvent_Type == 103)
    return self->_componentShown;
  else
    return (RFSchemaRFComponentShown *)0;
}

- (void)deleteComponentShown
{
  RFSchemaRFComponentShown *componentShown;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    componentShown = self->_componentShown;
    self->_componentShown = 0;

  }
}

- (void)setSnippetRenderingContext:(id)a3
{
  RFSchemaRFSnippetRenderingContext *v4;
  RFSchemaRFPatternExecuted *patternExecuted;
  RFSchemaRFInteractionPerformed *interactionPerformed;
  RFSchemaRFComponentShown *componentShown;
  RFSchemaRFGradingDialogReportedTier1 *rfGradingDialogReportedTier1;
  unint64_t v9;
  RFSchemaRFSnippetRenderingContext *snippetRenderingContext;

  v4 = (RFSchemaRFSnippetRenderingContext *)a3;
  patternExecuted = self->_patternExecuted;
  self->_patternExecuted = 0;

  interactionPerformed = self->_interactionPerformed;
  self->_interactionPerformed = 0;

  componentShown = self->_componentShown;
  self->_componentShown = 0;

  rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
  self->_rfGradingDialogReportedTier1 = 0;

  v9 = 104;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  snippetRenderingContext = self->_snippetRenderingContext;
  self->_snippetRenderingContext = v4;

}

- (RFSchemaRFSnippetRenderingContext)snippetRenderingContext
{
  if (self->_whichEvent_Type == 104)
    return self->_snippetRenderingContext;
  else
    return (RFSchemaRFSnippetRenderingContext *)0;
}

- (void)deleteSnippetRenderingContext
{
  RFSchemaRFSnippetRenderingContext *snippetRenderingContext;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    snippetRenderingContext = self->_snippetRenderingContext;
    self->_snippetRenderingContext = 0;

  }
}

- (void)setRfGradingDialogReportedTier1:(id)a3
{
  RFSchemaRFGradingDialogReportedTier1 *v4;
  RFSchemaRFPatternExecuted *patternExecuted;
  RFSchemaRFInteractionPerformed *interactionPerformed;
  RFSchemaRFComponentShown *componentShown;
  RFSchemaRFSnippetRenderingContext *snippetRenderingContext;
  unint64_t v9;
  RFSchemaRFGradingDialogReportedTier1 *rfGradingDialogReportedTier1;

  v4 = (RFSchemaRFGradingDialogReportedTier1 *)a3;
  patternExecuted = self->_patternExecuted;
  self->_patternExecuted = 0;

  interactionPerformed = self->_interactionPerformed;
  self->_interactionPerformed = 0;

  componentShown = self->_componentShown;
  self->_componentShown = 0;

  snippetRenderingContext = self->_snippetRenderingContext;
  self->_snippetRenderingContext = 0;

  v9 = 105;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
  self->_rfGradingDialogReportedTier1 = v4;

}

- (RFSchemaRFGradingDialogReportedTier1)rfGradingDialogReportedTier1
{
  if (self->_whichEvent_Type == 105)
    return self->_rfGradingDialogReportedTier1;
  else
    return (RFSchemaRFGradingDialogReportedTier1 *)0;
}

- (void)deleteRfGradingDialogReportedTier1
{
  RFSchemaRFGradingDialogReportedTier1 *rfGradingDialogReportedTier1;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    rfGradingDialogReportedTier1 = self->_rfGradingDialogReportedTier1;
    self->_rfGradingDialogReportedTier1 = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFClientEventReadFrom(self, (uint64_t)a3);
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
  id v16;

  v16 = a3;
  -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RFSchemaRFClientEvent patternExecuted](self, "patternExecuted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RFSchemaRFClientEvent patternExecuted](self, "patternExecuted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RFSchemaRFClientEvent interactionPerformed](self, "interactionPerformed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RFSchemaRFClientEvent interactionPerformed](self, "interactionPerformed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RFSchemaRFClientEvent componentShown](self, "componentShown");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RFSchemaRFClientEvent componentShown](self, "componentShown");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RFSchemaRFClientEvent snippetRenderingContext](self, "snippetRenderingContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[RFSchemaRFClientEvent snippetRenderingContext](self, "snippetRenderingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RFSchemaRFClientEvent rfGradingDialogReportedTier1](self, "rfGradingDialogReportedTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[RFSchemaRFClientEvent rfGradingDialogReportedTier1](self, "rfGradingDialogReportedTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v37;
  BOOL v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_33;
  -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_33;
  }
  else
  {

  }
  -[RFSchemaRFClientEvent patternExecuted](self, "patternExecuted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "patternExecuted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[RFSchemaRFClientEvent patternExecuted](self, "patternExecuted");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[RFSchemaRFClientEvent patternExecuted](self, "patternExecuted");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "patternExecuted");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_33;
  }
  else
  {

  }
  -[RFSchemaRFClientEvent interactionPerformed](self, "interactionPerformed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionPerformed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[RFSchemaRFClientEvent interactionPerformed](self, "interactionPerformed");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[RFSchemaRFClientEvent interactionPerformed](self, "interactionPerformed");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactionPerformed");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_33;
  }
  else
  {

  }
  -[RFSchemaRFClientEvent componentShown](self, "componentShown");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentShown");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[RFSchemaRFClientEvent componentShown](self, "componentShown");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[RFSchemaRFClientEvent componentShown](self, "componentShown");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentShown");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_33;
  }
  else
  {

  }
  -[RFSchemaRFClientEvent snippetRenderingContext](self, "snippetRenderingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snippetRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[RFSchemaRFClientEvent snippetRenderingContext](self, "snippetRenderingContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[RFSchemaRFClientEvent snippetRenderingContext](self, "snippetRenderingContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snippetRenderingContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_33;
  }
  else
  {

  }
  -[RFSchemaRFClientEvent rfGradingDialogReportedTier1](self, "rfGradingDialogReportedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfGradingDialogReportedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RFSchemaRFClientEvent rfGradingDialogReportedTier1](self, "rfGradingDialogReportedTier1");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_36:
      v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    -[RFSchemaRFClientEvent rfGradingDialogReportedTier1](self, "rfGradingDialogReportedTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfGradingDialogReportedTier1");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) != 0)
      goto LABEL_36;
  }
  else
  {
LABEL_32:

  }
LABEL_33:
  v38 = 0;
LABEL_34:

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[RFSchemaRFClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[RFSchemaRFPatternExecuted hash](self->_patternExecuted, "hash") ^ v3;
  v5 = -[RFSchemaRFInteractionPerformed hash](self->_interactionPerformed, "hash");
  v6 = v4 ^ v5 ^ -[RFSchemaRFComponentShown hash](self->_componentShown, "hash");
  v7 = -[RFSchemaRFSnippetRenderingContext hash](self->_snippetRenderingContext, "hash");
  return v6 ^ v7 ^ -[RFSchemaRFGradingDialogReportedTier1 hash](self->_rfGradingDialogReportedTier1, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_componentShown)
  {
    -[RFSchemaRFClientEvent componentShown](self, "componentShown");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("componentShown"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("componentShown"));

    }
  }
  if (self->_eventMetadata)
  {
    -[RFSchemaRFClientEvent eventMetadata](self, "eventMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eventMetadata"));

    }
  }
  if (self->_interactionPerformed)
  {
    -[RFSchemaRFClientEvent interactionPerformed](self, "interactionPerformed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("interactionPerformed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("interactionPerformed"));

    }
  }
  if (self->_patternExecuted)
  {
    -[RFSchemaRFClientEvent patternExecuted](self, "patternExecuted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("patternExecuted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("patternExecuted"));

    }
  }
  if (self->_rfGradingDialogReportedTier1)
  {
    -[RFSchemaRFClientEvent rfGradingDialogReportedTier1](self, "rfGradingDialogReportedTier1");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rfGradingDialogReportedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("rfGradingDialogReportedTier1"));

    }
  }
  if (self->_snippetRenderingContext)
  {
    -[RFSchemaRFClientEvent snippetRenderingContext](self, "snippetRenderingContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("snippetRenderingContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("snippetRenderingContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RFSchemaRFClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RFSchemaRFClientEvent)initWithJSON:(id)a3
{
  void *v4;
  RFSchemaRFClientEvent *v5;
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
    self = -[RFSchemaRFClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RFSchemaRFClientEvent)initWithDictionary:(id)a3
{
  id v4;
  RFSchemaRFClientEvent *v5;
  void *v6;
  RFSchemaRFClientEventMetadata *v7;
  void *v8;
  RFSchemaRFPatternExecuted *v9;
  void *v10;
  RFSchemaRFInteractionPerformed *v11;
  void *v12;
  RFSchemaRFComponentShown *v13;
  void *v14;
  RFSchemaRFSnippetRenderingContext *v15;
  void *v16;
  RFSchemaRFGradingDialogReportedTier1 *v17;
  RFSchemaRFClientEvent *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFSchemaRFClientEvent;
  v5 = -[RFSchemaRFClientEvent init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[RFSchemaRFClientEventMetadata initWithDictionary:]([RFSchemaRFClientEventMetadata alloc], "initWithDictionary:", v6);
      -[RFSchemaRFClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternExecuted"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[RFSchemaRFPatternExecuted initWithDictionary:]([RFSchemaRFPatternExecuted alloc], "initWithDictionary:", v8);
      -[RFSchemaRFClientEvent setPatternExecuted:](v5, "setPatternExecuted:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactionPerformed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[RFSchemaRFInteractionPerformed initWithDictionary:]([RFSchemaRFInteractionPerformed alloc], "initWithDictionary:", v10);
      -[RFSchemaRFClientEvent setInteractionPerformed:](v5, "setInteractionPerformed:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("componentShown"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[RFSchemaRFComponentShown initWithDictionary:]([RFSchemaRFComponentShown alloc], "initWithDictionary:", v12);
      -[RFSchemaRFClientEvent setComponentShown:](v5, "setComponentShown:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snippetRenderingContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[RFSchemaRFSnippetRenderingContext initWithDictionary:]([RFSchemaRFSnippetRenderingContext alloc], "initWithDictionary:", v14);
      -[RFSchemaRFClientEvent setSnippetRenderingContext:](v5, "setSnippetRenderingContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfGradingDialogReportedTier1"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[RFSchemaRFGradingDialogReportedTier1 initWithDictionary:]([RFSchemaRFGradingDialogReportedTier1 alloc], "initWithDictionary:", v16);
      -[RFSchemaRFClientEvent setRfGradingDialogReportedTier1:](v5, "setRfGradingDialogReportedTier1:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RFSchemaRFClientEventMetadata)eventMetadata
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

- (BOOL)hasPatternExecuted
{
  return self->_hasPatternExecuted;
}

- (void)setHasPatternExecuted:(BOOL)a3
{
  self->_hasPatternExecuted = a3;
}

- (BOOL)hasInteractionPerformed
{
  return self->_hasInteractionPerformed;
}

- (void)setHasInteractionPerformed:(BOOL)a3
{
  self->_hasInteractionPerformed = a3;
}

- (BOOL)hasComponentShown
{
  return self->_hasComponentShown;
}

- (void)setHasComponentShown:(BOOL)a3
{
  self->_hasComponentShown = a3;
}

- (BOOL)hasSnippetRenderingContext
{
  return self->_hasSnippetRenderingContext;
}

- (void)setHasSnippetRenderingContext:(BOOL)a3
{
  self->_hasSnippetRenderingContext = a3;
}

- (BOOL)hasRfGradingDialogReportedTier1
{
  return self->_hasRfGradingDialogReportedTier1;
}

- (void)setHasRfGradingDialogReportedTier1:(BOOL)a3
{
  self->_hasRfGradingDialogReportedTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rfGradingDialogReportedTier1, 0);
  objc_storeStrong((id *)&self->_snippetRenderingContext, 0);
  objc_storeStrong((id *)&self->_componentShown, 0);
  objc_storeStrong((id *)&self->_interactionPerformed, 0);
  objc_storeStrong((id *)&self->_patternExecuted, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 54;
}

@end
