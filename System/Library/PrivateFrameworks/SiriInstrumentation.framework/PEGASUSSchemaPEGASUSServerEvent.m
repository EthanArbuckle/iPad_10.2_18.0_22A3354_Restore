@implementation PEGASUSSchemaPEGASUSServerEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[PEGASUSSchemaPEGASUSServerEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pegasusId");
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

- (int)componentName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[PEGASUSSchemaPEGASUSServerEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pegasusId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
        LODWORD(v4) = 24;
      else
        LODWORD(v4) = 0;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
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
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PEGASUSSchemaPEGASUSServerEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v31, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRewrittenUtterancesReportedTier1](self, "deletePegasusRewrittenUtterancesReportedTier1");
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusUtteranceUnderstandingReportedTier1](self, "deletePegasusUtteranceUnderstandingReportedTier1");
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRequestEndedTier1](self, "deletePegasusRequestEndedTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRewrittenUtterancesReportedTier1](self, "deletePegasusRewrittenUtterancesReportedTier1");
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusUtteranceUnderstandingReportedTier1](self, "deletePegasusUtteranceUnderstandingReportedTier1");
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRequestEndedTier1](self, "deletePegasusRequestEndedTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRewrittenUtterancesReportedTier1](self, "deletePegasusRewrittenUtterancesReportedTier1");
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusUtteranceUnderstandingReportedTier1](self, "deletePegasusUtteranceUnderstandingReportedTier1");
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRequestEndedTier1](self, "deletePegasusRequestEndedTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRewrittenUtterancesReportedTier1](self, "deletePegasusRewrittenUtterancesReportedTier1");
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusUtteranceUnderstandingReportedTier1](self, "deletePegasusUtteranceUnderstandingReportedTier1");
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRequestEndedTier1](self, "deletePegasusRequestEndedTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRewrittenUtterancesReportedTier1](self, "deletePegasusRewrittenUtterancesReportedTier1");
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusUtteranceUnderstandingReportedTier1](self, "deletePegasusUtteranceUnderstandingReportedTier1");
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRequestEndedTier1](self, "deletePegasusRequestEndedTier1");
  }
  -[PEGASUSSchemaPEGASUSServerEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSServerEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestContext](self, "pegasusRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRequestContext](self, "deletePegasusRequestContext");
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReported](self, "pegasusRewrittenUtterancesReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRewrittenUtterancesReported](self, "deletePegasusRewrittenUtterancesReported");
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReportedTier1](self, "pegasusRewrittenUtterancesReportedTier1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRewrittenUtterancesReportedTier1](self, "deletePegasusRewrittenUtterancesReportedTier1");
  -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReported](self, "pegasusUtteranceUnderstandingReported");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusUtteranceUnderstandingReported](self, "deletePegasusUtteranceUnderstandingReported");
  -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReportedTier1](self, "pegasusUtteranceUnderstandingReportedTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusUtteranceUnderstandingReportedTier1](self, "deletePegasusUtteranceUnderstandingReportedTier1");
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestEndedTier1](self, "pegasusRequestEndedTier1");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusRequestEndedTier1](self, "deletePegasusRequestEndedTier1");
  -[PEGASUSSchemaPEGASUSServerEvent pegasusInfoDomainMultistepAndMultiturnExecutionReported](self, "pegasusInfoDomainMultistepAndMultiturnExecutionReported");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PEGASUSSchemaPEGASUSServerEvent deletePegasusInfoDomainMultistepAndMultiturnExecutionReported](self, "deletePegasusInfoDomainMultistepAndMultiturnExecutionReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[PEGASUSSchemaPEGASUSServerEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 6)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562A658[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 6)
    return 0;
  else
    return off_1E562A690[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[PEGASUSSchemaPEGASUSServerEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 6)
    return CFSTR("com.apple.aiml.siri.pegasus.PEGASUSServerEvent");
  else
    return off_1E5632A68[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[PEGASUSSchemaPEGASUSServerEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setPegasusRequestContext:(id)a3
{
  PEGASUSSchemaPEGASUSRequestContext *v4;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *pegasusRewrittenUtterancesReported;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *pegasusRewrittenUtterancesReportedTier1;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *pegasusUtteranceUnderstandingReported;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *pegasusUtteranceUnderstandingReportedTier1;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *pegasusRequestEndedTier1;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  unint64_t v11;
  PEGASUSSchemaPEGASUSRequestContext *pegasusRequestContext;

  v4 = (PEGASUSSchemaPEGASUSRequestContext *)a3;
  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  v11 = 101;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = v4;

}

- (PEGASUSSchemaPEGASUSRequestContext)pegasusRequestContext
{
  if (self->_whichEvent_Type == 101)
    return self->_pegasusRequestContext;
  else
    return (PEGASUSSchemaPEGASUSRequestContext *)0;
}

- (void)deletePegasusRequestContext
{
  PEGASUSSchemaPEGASUSRequestContext *pegasusRequestContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    pegasusRequestContext = self->_pegasusRequestContext;
    self->_pegasusRequestContext = 0;

  }
}

- (void)setPegasusRewrittenUtterancesReported:(id)a3
{
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *v4;
  PEGASUSSchemaPEGASUSRequestContext *pegasusRequestContext;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *pegasusRewrittenUtterancesReportedTier1;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *pegasusUtteranceUnderstandingReported;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *pegasusUtteranceUnderstandingReportedTier1;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *pegasusRequestEndedTier1;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  unint64_t v11;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *pegasusRewrittenUtterancesReported;

  v4 = (PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  v11 = 102;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = v4;

}

- (PEGASUSSchemaPEGASUSRewrittenUtterancesReported)pegasusRewrittenUtterancesReported
{
  if (self->_whichEvent_Type == 102)
    return self->_pegasusRewrittenUtterancesReported;
  else
    return (PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)0;
}

- (void)deletePegasusRewrittenUtterancesReported
{
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *pegasusRewrittenUtterancesReported;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
    self->_pegasusRewrittenUtterancesReported = 0;

  }
}

- (void)setPegasusRewrittenUtterancesReportedTier1:(id)a3
{
  PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *v4;
  PEGASUSSchemaPEGASUSRequestContext *pegasusRequestContext;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *pegasusRewrittenUtterancesReported;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *pegasusUtteranceUnderstandingReported;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *pegasusUtteranceUnderstandingReportedTier1;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *pegasusRequestEndedTier1;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  unint64_t v11;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *pegasusRewrittenUtterancesReportedTier1;

  v4 = (PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  v11 = 103;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = v4;

}

- (PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1)pegasusRewrittenUtterancesReportedTier1
{
  if (self->_whichEvent_Type == 103)
    return self->_pegasusRewrittenUtterancesReportedTier1;
  else
    return (PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *)0;
}

- (void)deletePegasusRewrittenUtterancesReportedTier1
{
  PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *pegasusRewrittenUtterancesReportedTier1;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
    self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  }
}

- (void)setPegasusUtteranceUnderstandingReported:(id)a3
{
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *v4;
  PEGASUSSchemaPEGASUSRequestContext *pegasusRequestContext;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *pegasusRewrittenUtterancesReported;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *pegasusRewrittenUtterancesReportedTier1;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *pegasusUtteranceUnderstandingReportedTier1;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *pegasusRequestEndedTier1;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  unint64_t v11;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *pegasusUtteranceUnderstandingReported;

  v4 = (PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  v11 = 104;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = v4;

}

- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReported)pegasusUtteranceUnderstandingReported
{
  if (self->_whichEvent_Type == 104)
    return self->_pegasusUtteranceUnderstandingReported;
  else
    return (PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *)0;
}

- (void)deletePegasusUtteranceUnderstandingReported
{
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *pegasusUtteranceUnderstandingReported;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
    self->_pegasusUtteranceUnderstandingReported = 0;

  }
}

- (void)setPegasusUtteranceUnderstandingReportedTier1:(id)a3
{
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *v4;
  PEGASUSSchemaPEGASUSRequestContext *pegasusRequestContext;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *pegasusRewrittenUtterancesReported;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *pegasusRewrittenUtterancesReportedTier1;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *pegasusUtteranceUnderstandingReported;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *pegasusRequestEndedTier1;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  unint64_t v11;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *pegasusUtteranceUnderstandingReportedTier1;

  v4 = (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  v11 = 105;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = v4;

}

- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1)pegasusUtteranceUnderstandingReportedTier1
{
  if (self->_whichEvent_Type == 105)
    return self->_pegasusUtteranceUnderstandingReportedTier1;
  else
    return (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)0;
}

- (void)deletePegasusUtteranceUnderstandingReportedTier1
{
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *pegasusUtteranceUnderstandingReportedTier1;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
    self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  }
}

- (void)setPegasusRequestEndedTier1:(id)a3
{
  PEGASUSSchemaPEGASUSRequestEndedTier1 *v4;
  PEGASUSSchemaPEGASUSRequestContext *pegasusRequestContext;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *pegasusRewrittenUtterancesReported;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *pegasusRewrittenUtterancesReportedTier1;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *pegasusUtteranceUnderstandingReported;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *pegasusUtteranceUnderstandingReportedTier1;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  unint64_t v11;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *pegasusRequestEndedTier1;

  v4 = (PEGASUSSchemaPEGASUSRequestEndedTier1 *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  v11 = 106;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = v4;

}

- (PEGASUSSchemaPEGASUSRequestEndedTier1)pegasusRequestEndedTier1
{
  if (self->_whichEvent_Type == 106)
    return self->_pegasusRequestEndedTier1;
  else
    return (PEGASUSSchemaPEGASUSRequestEndedTier1 *)0;
}

- (void)deletePegasusRequestEndedTier1
{
  PEGASUSSchemaPEGASUSRequestEndedTier1 *pegasusRequestEndedTier1;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
    self->_pegasusRequestEndedTier1 = 0;

  }
}

- (void)setPegasusInfoDomainMultistepAndMultiturnExecutionReported:(id)a3
{
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *v4;
  PEGASUSSchemaPEGASUSRequestContext *pegasusRequestContext;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *pegasusRewrittenUtterancesReported;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *pegasusRewrittenUtterancesReportedTier1;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *pegasusUtteranceUnderstandingReported;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *pegasusUtteranceUnderstandingReportedTier1;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *pegasusRequestEndedTier1;
  unint64_t v11;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *pegasusInfoDomainMultistepAndMultiturnExecutionReported;

  v4 = (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  v11 = 107;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = v4;

}

- (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported)pegasusInfoDomainMultistepAndMultiturnExecutionReported
{
  if (self->_whichEvent_Type == 107)
    return self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  else
    return (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)0;
}

- (void)deletePegasusInfoDomainMultistepAndMultiturnExecutionReported
{
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *pegasusInfoDomainMultistepAndMultiturnExecutionReported;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
    self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSServerEventReadFrom(self, (uint64_t)a3);
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
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[PEGASUSSchemaPEGASUSServerEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PEGASUSSchemaPEGASUSServerEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestContext](self, "pegasusRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestContext](self, "pegasusRequestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReported](self, "pegasusRewrittenUtterancesReported");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReported](self, "pegasusRewrittenUtterancesReported");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReportedTier1](self, "pegasusRewrittenUtterancesReportedTier1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReportedTier1](self, "pegasusRewrittenUtterancesReportedTier1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReported](self, "pegasusUtteranceUnderstandingReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReported](self, "pegasusUtteranceUnderstandingReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReportedTier1](self, "pegasusUtteranceUnderstandingReportedTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReportedTier1](self, "pegasusUtteranceUnderstandingReportedTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestEndedTier1](self, "pegasusRequestEndedTier1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestEndedTier1](self, "pegasusRequestEndedTier1");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusInfoDomainMultistepAndMultiturnExecutionReported](self, "pegasusInfoDomainMultistepAndMultiturnExecutionReported");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusInfoDomainMultistepAndMultiturnExecutionReported](self, "pegasusInfoDomainMultistepAndMultiturnExecutionReported");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  BOOL v48;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_43;
  -[PEGASUSSchemaPEGASUSServerEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[PEGASUSSchemaPEGASUSServerEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PEGASUSSchemaPEGASUSServerEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_43;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestContext](self, "pegasusRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestContext](self, "pegasusRequestContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestContext](self, "pegasusRequestContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusRequestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_43;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReported](self, "pegasusRewrittenUtterancesReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusRewrittenUtterancesReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReported](self, "pegasusRewrittenUtterancesReported");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReported](self, "pegasusRewrittenUtterancesReported");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusRewrittenUtterancesReported");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_43;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReportedTier1](self, "pegasusRewrittenUtterancesReportedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusRewrittenUtterancesReportedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReportedTier1](self, "pegasusRewrittenUtterancesReportedTier1");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReportedTier1](self, "pegasusRewrittenUtterancesReportedTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusRewrittenUtterancesReportedTier1");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_43;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReported](self, "pegasusUtteranceUnderstandingReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusUtteranceUnderstandingReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReported](self, "pegasusUtteranceUnderstandingReported");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReported](self, "pegasusUtteranceUnderstandingReported");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusUtteranceUnderstandingReported");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_43;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReportedTier1](self, "pegasusUtteranceUnderstandingReportedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusUtteranceUnderstandingReportedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReportedTier1](self, "pegasusUtteranceUnderstandingReportedTier1");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReportedTier1](self, "pegasusUtteranceUnderstandingReportedTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusUtteranceUnderstandingReportedTier1");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_43;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestEndedTier1](self, "pegasusRequestEndedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusRequestEndedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestEndedTier1](self, "pegasusRequestEndedTier1");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestEndedTier1](self, "pegasusRequestEndedTier1");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusRequestEndedTier1");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_43;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSServerEvent pegasusInfoDomainMultistepAndMultiturnExecutionReported](self, "pegasusInfoDomainMultistepAndMultiturnExecutionReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusInfoDomainMultistepAndMultiturnExecutionReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusInfoDomainMultistepAndMultiturnExecutionReported](self, "pegasusInfoDomainMultistepAndMultiturnExecutionReported");
    v43 = objc_claimAutoreleasedReturnValue();
    if (!v43)
    {

LABEL_46:
      v48 = 1;
      goto LABEL_44;
    }
    v44 = (void *)v43;
    -[PEGASUSSchemaPEGASUSServerEvent pegasusInfoDomainMultistepAndMultiturnExecutionReported](self, "pegasusInfoDomainMultistepAndMultiturnExecutionReported");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusInfoDomainMultistepAndMultiturnExecutionReported");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if ((v47 & 1) != 0)
      goto LABEL_46;
  }
  else
  {
LABEL_42:

  }
LABEL_43:
  v48 = 0;
LABEL_44:

  return v48;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[PEGASUSSchemaPEGASUSServerEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[PEGASUSSchemaPEGASUSRequestContext hash](self->_pegasusRequestContext, "hash") ^ v3;
  v5 = -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported hash](self->_pegasusRewrittenUtterancesReported, "hash");
  v6 = v4 ^ v5 ^ -[PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 hash](self->_pegasusRewrittenUtterancesReportedTier1, "hash");
  v7 = -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported hash](self->_pegasusUtteranceUnderstandingReported, "hash");
  v8 = v7 ^ -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 hash](self->_pegasusUtteranceUnderstandingReportedTier1, "hash");
  v9 = v6 ^ v8 ^ -[PEGASUSSchemaPEGASUSRequestEndedTier1 hash](self->_pegasusRequestEndedTier1, "hash");
  return v9 ^ -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported hash](self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported, "hash");
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
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[PEGASUSSchemaPEGASUSServerEvent eventMetadata](self, "eventMetadata");
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
  if (self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusInfoDomainMultistepAndMultiturnExecutionReported](self, "pegasusInfoDomainMultistepAndMultiturnExecutionReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pegasusInfoDomainMultistepAndMultiturnExecutionReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pegasusInfoDomainMultistepAndMultiturnExecutionReported"));

    }
  }
  if (self->_pegasusRequestContext)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestContext](self, "pegasusRequestContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("pegasusRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("pegasusRequestContext"));

    }
  }
  if (self->_pegasusRequestEndedTier1)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRequestEndedTier1](self, "pegasusRequestEndedTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("pegasusRequestEndedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pegasusRequestEndedTier1"));

    }
  }
  if (self->_pegasusRewrittenUtterancesReported)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReported](self, "pegasusRewrittenUtterancesReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("pegasusRewrittenUtterancesReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("pegasusRewrittenUtterancesReported"));

    }
  }
  if (self->_pegasusRewrittenUtterancesReportedTier1)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusRewrittenUtterancesReportedTier1](self, "pegasusRewrittenUtterancesReportedTier1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("pegasusRewrittenUtterancesReportedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("pegasusRewrittenUtterancesReportedTier1"));

    }
  }
  if (self->_pegasusUtteranceUnderstandingReported)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReported](self, "pegasusUtteranceUnderstandingReported");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("pegasusUtteranceUnderstandingReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("pegasusUtteranceUnderstandingReported"));

    }
  }
  if (self->_pegasusUtteranceUnderstandingReportedTier1)
  {
    -[PEGASUSSchemaPEGASUSServerEvent pegasusUtteranceUnderstandingReportedTier1](self, "pegasusUtteranceUnderstandingReportedTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("pegasusUtteranceUnderstandingReportedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("pegasusUtteranceUnderstandingReportedTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSServerEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSServerEvent)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSServerEvent *v5;
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
    self = -[PEGASUSSchemaPEGASUSServerEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSServerEvent)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSServerEvent *v5;
  uint64_t v6;
  PEGASUSSchemaPEGASUSServerEventMetadata *v7;
  void *v8;
  PEGASUSSchemaPEGASUSRequestContext *v9;
  void *v10;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReported *v11;
  void *v12;
  PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *v13;
  void *v14;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *v15;
  void *v16;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *v17;
  void *v18;
  PEGASUSSchemaPEGASUSRequestEndedTier1 *v19;
  void *v20;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *v21;
  PEGASUSSchemaPEGASUSServerEvent *v22;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PEGASUSSchemaPEGASUSServerEvent;
  v5 = -[PEGASUSSchemaPEGASUSServerEvent init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PEGASUSSchemaPEGASUSServerEventMetadata initWithDictionary:]([PEGASUSSchemaPEGASUSServerEventMetadata alloc], "initWithDictionary:", v6);
      -[PEGASUSSchemaPEGASUSServerEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    v24 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusRequestContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PEGASUSSchemaPEGASUSRequestContext initWithDictionary:]([PEGASUSSchemaPEGASUSRequestContext alloc], "initWithDictionary:", v8);
      -[PEGASUSSchemaPEGASUSServerEvent setPegasusRequestContext:](v5, "setPegasusRequestContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusRewrittenUtterancesReported"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported initWithDictionary:]([PEGASUSSchemaPEGASUSRewrittenUtterancesReported alloc], "initWithDictionary:", v10);
      -[PEGASUSSchemaPEGASUSServerEvent setPegasusRewrittenUtterancesReported:](v5, "setPegasusRewrittenUtterancesReported:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusRewrittenUtterancesReportedTier1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 alloc], "initWithDictionary:", v12);
      -[PEGASUSSchemaPEGASUSServerEvent setPegasusRewrittenUtterancesReportedTier1:](v5, "setPegasusRewrittenUtterancesReportedTier1:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusUtteranceUnderstandingReported"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported initWithDictionary:]([PEGASUSSchemaPEGASUSUtteranceUnderstandingReported alloc], "initWithDictionary:", v14);
      -[PEGASUSSchemaPEGASUSServerEvent setPegasusUtteranceUnderstandingReported:](v5, "setPegasusUtteranceUnderstandingReported:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusUtteranceUnderstandingReportedTier1"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 alloc], "initWithDictionary:", v16);
      -[PEGASUSSchemaPEGASUSServerEvent setPegasusUtteranceUnderstandingReportedTier1:](v5, "setPegasusUtteranceUnderstandingReportedTier1:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusRequestEndedTier1"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PEGASUSSchemaPEGASUSRequestEndedTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSRequestEndedTier1 alloc], "initWithDictionary:", v18);
      -[PEGASUSSchemaPEGASUSServerEvent setPegasusRequestEndedTier1:](v5, "setPegasusRequestEndedTier1:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusInfoDomainMultistepAndMultiturnExecutionReported"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported initWithDictionary:]([PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported alloc], "initWithDictionary:", v20);
      -[PEGASUSSchemaPEGASUSServerEvent setPegasusInfoDomainMultistepAndMultiturnExecutionReported:](v5, "setPegasusInfoDomainMultistepAndMultiturnExecutionReported:", v21);

    }
    v22 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PEGASUSSchemaPEGASUSServerEventMetadata)eventMetadata
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

- (BOOL)hasPegasusRequestContext
{
  return self->_hasPegasusRequestContext;
}

- (void)setHasPegasusRequestContext:(BOOL)a3
{
  self->_hasPegasusRequestContext = a3;
}

- (BOOL)hasPegasusRewrittenUtterancesReported
{
  return self->_hasPegasusRewrittenUtterancesReported;
}

- (void)setHasPegasusRewrittenUtterancesReported:(BOOL)a3
{
  self->_hasPegasusRewrittenUtterancesReported = a3;
}

- (BOOL)hasPegasusRewrittenUtterancesReportedTier1
{
  return self->_hasPegasusRewrittenUtterancesReportedTier1;
}

- (void)setHasPegasusRewrittenUtterancesReportedTier1:(BOOL)a3
{
  self->_hasPegasusRewrittenUtterancesReportedTier1 = a3;
}

- (BOOL)hasPegasusUtteranceUnderstandingReported
{
  return self->_hasPegasusUtteranceUnderstandingReported;
}

- (void)setHasPegasusUtteranceUnderstandingReported:(BOOL)a3
{
  self->_hasPegasusUtteranceUnderstandingReported = a3;
}

- (BOOL)hasPegasusUtteranceUnderstandingReportedTier1
{
  return self->_hasPegasusUtteranceUnderstandingReportedTier1;
}

- (void)setHasPegasusUtteranceUnderstandingReportedTier1:(BOOL)a3
{
  self->_hasPegasusUtteranceUnderstandingReportedTier1 = a3;
}

- (BOOL)hasPegasusRequestEndedTier1
{
  return self->_hasPegasusRequestEndedTier1;
}

- (void)setHasPegasusRequestEndedTier1:(BOOL)a3
{
  self->_hasPegasusRequestEndedTier1 = a3;
}

- (BOOL)hasPegasusInfoDomainMultistepAndMultiturnExecutionReported
{
  return self->_hasPegasusInfoDomainMultistepAndMultiturnExecutionReported;
}

- (void)setHasPegasusInfoDomainMultistepAndMultiturnExecutionReported:(BOOL)a3
{
  self->_hasPegasusInfoDomainMultistepAndMultiturnExecutionReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported, 0);
  objc_storeStrong((id *)&self->_pegasusRequestEndedTier1, 0);
  objc_storeStrong((id *)&self->_pegasusUtteranceUnderstandingReportedTier1, 0);
  objc_storeStrong((id *)&self->_pegasusUtteranceUnderstandingReported, 0);
  objc_storeStrong((id *)&self->_pegasusRewrittenUtterancesReportedTier1, 0);
  objc_storeStrong((id *)&self->_pegasusRewrittenUtterancesReported, 0);
  objc_storeStrong((id *)&self->_pegasusRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 49;
}

@end
