@implementation CLPInstSchemaCLPClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[CLPInstSchemaCLPClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clpId");
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
  _BOOL4 v6;

  -[CLPInstSchemaCLPClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clpId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length") != 0;

      LODWORD(v4) = 16 * v6;
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
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLPInstSchemaCLPClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v28, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPInstSchemaCLPClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CLPInstSchemaCLPClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[CLPInstSchemaCLPClientEvent nlv4SampleEvaluationContext](self, "nlv4SampleEvaluationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CLPInstSchemaCLPClientEvent deleteNlv4SampleEvaluationContext](self, "deleteNlv4SampleEvaluationContext");
  -[CLPInstSchemaCLPClientEvent nlv4TaskEvaluationContext](self, "nlv4TaskEvaluationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CLPInstSchemaCLPClientEvent deleteNlv4TaskEvaluationContext](self, "deleteNlv4TaskEvaluationContext");
  -[CLPInstSchemaCLPClientEvent curareAppIntentSampleClassificationContext](self, "curareAppIntentSampleClassificationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CLPInstSchemaCLPClientEvent deleteCurareAppIntentSampleClassificationContext](self, "deleteCurareAppIntentSampleClassificationContext");
  -[CLPInstSchemaCLPClientEvent curareAppIntentTaskClassificationContext](self, "curareAppIntentTaskClassificationContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[CLPInstSchemaCLPClientEvent deleteCurareAppIntentTaskClassificationContext](self, "deleteCurareAppIntentTaskClassificationContext");
  -[CLPInstSchemaCLPClientEvent cdmReplaySampleContext](self, "cdmReplaySampleContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[CLPInstSchemaCLPClientEvent deleteCdmReplaySampleContext](self, "deleteCdmReplaySampleContext");
  -[CLPInstSchemaCLPClientEvent cdmReplayTaskContext](self, "cdmReplayTaskContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[CLPInstSchemaCLPClientEvent deleteCdmReplayTaskContext](self, "deleteCdmReplayTaskContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[CLPInstSchemaCLPClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 5)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629020[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 5)
    return 0;
  else
    return off_1E5629050[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[CLPInstSchemaCLPClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 5)
    return CFSTR("com.apple.aiml.siri.clp.CLPClientEvent");
  else
    return off_1E562BF78[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[CLPInstSchemaCLPClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setNlv4SampleEvaluationContext:(id)a3
{
  CLPInstSchemaCLPNLv4SampleEvaluationContext *v4;
  CLPInstSchemaCLPNLv4TaskEvaluationContext *nlv4TaskEvaluationContext;
  CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *curareAppIntentSampleClassificationContext;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *curareAppIntentTaskClassificationContext;
  CLPInstSchemaCLPCDMReplaySampleContext *cdmReplaySampleContext;
  CLPInstSchemaCLPCDMReplayTaskContext *cdmReplayTaskContext;
  unint64_t v10;
  CLPInstSchemaCLPNLv4SampleEvaluationContext *nlv4SampleEvaluationContext;

  v4 = (CLPInstSchemaCLPNLv4SampleEvaluationContext *)a3;
  nlv4TaskEvaluationContext = self->_nlv4TaskEvaluationContext;
  self->_nlv4TaskEvaluationContext = 0;

  curareAppIntentSampleClassificationContext = self->_curareAppIntentSampleClassificationContext;
  self->_curareAppIntentSampleClassificationContext = 0;

  curareAppIntentTaskClassificationContext = self->_curareAppIntentTaskClassificationContext;
  self->_curareAppIntentTaskClassificationContext = 0;

  cdmReplaySampleContext = self->_cdmReplaySampleContext;
  self->_cdmReplaySampleContext = 0;

  cdmReplayTaskContext = self->_cdmReplayTaskContext;
  self->_cdmReplayTaskContext = 0;

  v10 = 101;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  nlv4SampleEvaluationContext = self->_nlv4SampleEvaluationContext;
  self->_nlv4SampleEvaluationContext = v4;

}

- (CLPInstSchemaCLPNLv4SampleEvaluationContext)nlv4SampleEvaluationContext
{
  if (self->_whichEvent_Type == 101)
    return self->_nlv4SampleEvaluationContext;
  else
    return (CLPInstSchemaCLPNLv4SampleEvaluationContext *)0;
}

- (void)deleteNlv4SampleEvaluationContext
{
  CLPInstSchemaCLPNLv4SampleEvaluationContext *nlv4SampleEvaluationContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    nlv4SampleEvaluationContext = self->_nlv4SampleEvaluationContext;
    self->_nlv4SampleEvaluationContext = 0;

  }
}

- (void)setNlv4TaskEvaluationContext:(id)a3
{
  CLPInstSchemaCLPNLv4TaskEvaluationContext *v4;
  CLPInstSchemaCLPNLv4SampleEvaluationContext *nlv4SampleEvaluationContext;
  CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *curareAppIntentSampleClassificationContext;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *curareAppIntentTaskClassificationContext;
  CLPInstSchemaCLPCDMReplaySampleContext *cdmReplaySampleContext;
  CLPInstSchemaCLPCDMReplayTaskContext *cdmReplayTaskContext;
  unint64_t v10;
  CLPInstSchemaCLPNLv4TaskEvaluationContext *nlv4TaskEvaluationContext;

  v4 = (CLPInstSchemaCLPNLv4TaskEvaluationContext *)a3;
  nlv4SampleEvaluationContext = self->_nlv4SampleEvaluationContext;
  self->_nlv4SampleEvaluationContext = 0;

  curareAppIntentSampleClassificationContext = self->_curareAppIntentSampleClassificationContext;
  self->_curareAppIntentSampleClassificationContext = 0;

  curareAppIntentTaskClassificationContext = self->_curareAppIntentTaskClassificationContext;
  self->_curareAppIntentTaskClassificationContext = 0;

  cdmReplaySampleContext = self->_cdmReplaySampleContext;
  self->_cdmReplaySampleContext = 0;

  cdmReplayTaskContext = self->_cdmReplayTaskContext;
  self->_cdmReplayTaskContext = 0;

  v10 = 102;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  nlv4TaskEvaluationContext = self->_nlv4TaskEvaluationContext;
  self->_nlv4TaskEvaluationContext = v4;

}

- (CLPInstSchemaCLPNLv4TaskEvaluationContext)nlv4TaskEvaluationContext
{
  if (self->_whichEvent_Type == 102)
    return self->_nlv4TaskEvaluationContext;
  else
    return (CLPInstSchemaCLPNLv4TaskEvaluationContext *)0;
}

- (void)deleteNlv4TaskEvaluationContext
{
  CLPInstSchemaCLPNLv4TaskEvaluationContext *nlv4TaskEvaluationContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    nlv4TaskEvaluationContext = self->_nlv4TaskEvaluationContext;
    self->_nlv4TaskEvaluationContext = 0;

  }
}

- (void)setCurareAppIntentSampleClassificationContext:(id)a3
{
  CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *v4;
  CLPInstSchemaCLPNLv4SampleEvaluationContext *nlv4SampleEvaluationContext;
  CLPInstSchemaCLPNLv4TaskEvaluationContext *nlv4TaskEvaluationContext;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *curareAppIntentTaskClassificationContext;
  CLPInstSchemaCLPCDMReplaySampleContext *cdmReplaySampleContext;
  CLPInstSchemaCLPCDMReplayTaskContext *cdmReplayTaskContext;
  unint64_t v10;
  CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *curareAppIntentSampleClassificationContext;

  v4 = (CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *)a3;
  nlv4SampleEvaluationContext = self->_nlv4SampleEvaluationContext;
  self->_nlv4SampleEvaluationContext = 0;

  nlv4TaskEvaluationContext = self->_nlv4TaskEvaluationContext;
  self->_nlv4TaskEvaluationContext = 0;

  curareAppIntentTaskClassificationContext = self->_curareAppIntentTaskClassificationContext;
  self->_curareAppIntentTaskClassificationContext = 0;

  cdmReplaySampleContext = self->_cdmReplaySampleContext;
  self->_cdmReplaySampleContext = 0;

  cdmReplayTaskContext = self->_cdmReplayTaskContext;
  self->_cdmReplayTaskContext = 0;

  v10 = 103;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  curareAppIntentSampleClassificationContext = self->_curareAppIntentSampleClassificationContext;
  self->_curareAppIntentSampleClassificationContext = v4;

}

- (CLPInstSchemaCLPCurareAppIntentSampleClassificationContext)curareAppIntentSampleClassificationContext
{
  if (self->_whichEvent_Type == 103)
    return self->_curareAppIntentSampleClassificationContext;
  else
    return (CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *)0;
}

- (void)deleteCurareAppIntentSampleClassificationContext
{
  CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *curareAppIntentSampleClassificationContext;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    curareAppIntentSampleClassificationContext = self->_curareAppIntentSampleClassificationContext;
    self->_curareAppIntentSampleClassificationContext = 0;

  }
}

- (void)setCurareAppIntentTaskClassificationContext:(id)a3
{
  CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *v4;
  CLPInstSchemaCLPNLv4SampleEvaluationContext *nlv4SampleEvaluationContext;
  CLPInstSchemaCLPNLv4TaskEvaluationContext *nlv4TaskEvaluationContext;
  CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *curareAppIntentSampleClassificationContext;
  CLPInstSchemaCLPCDMReplaySampleContext *cdmReplaySampleContext;
  CLPInstSchemaCLPCDMReplayTaskContext *cdmReplayTaskContext;
  unint64_t v10;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *curareAppIntentTaskClassificationContext;

  v4 = (CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *)a3;
  nlv4SampleEvaluationContext = self->_nlv4SampleEvaluationContext;
  self->_nlv4SampleEvaluationContext = 0;

  nlv4TaskEvaluationContext = self->_nlv4TaskEvaluationContext;
  self->_nlv4TaskEvaluationContext = 0;

  curareAppIntentSampleClassificationContext = self->_curareAppIntentSampleClassificationContext;
  self->_curareAppIntentSampleClassificationContext = 0;

  cdmReplaySampleContext = self->_cdmReplaySampleContext;
  self->_cdmReplaySampleContext = 0;

  cdmReplayTaskContext = self->_cdmReplayTaskContext;
  self->_cdmReplayTaskContext = 0;

  v10 = 104;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  curareAppIntentTaskClassificationContext = self->_curareAppIntentTaskClassificationContext;
  self->_curareAppIntentTaskClassificationContext = v4;

}

- (CLPInstSchemaCLPCurareAppIntentTaskClassificationContext)curareAppIntentTaskClassificationContext
{
  if (self->_whichEvent_Type == 104)
    return self->_curareAppIntentTaskClassificationContext;
  else
    return (CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *)0;
}

- (void)deleteCurareAppIntentTaskClassificationContext
{
  CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *curareAppIntentTaskClassificationContext;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    curareAppIntentTaskClassificationContext = self->_curareAppIntentTaskClassificationContext;
    self->_curareAppIntentTaskClassificationContext = 0;

  }
}

- (void)setCdmReplaySampleContext:(id)a3
{
  CLPInstSchemaCLPCDMReplaySampleContext *v4;
  CLPInstSchemaCLPNLv4SampleEvaluationContext *nlv4SampleEvaluationContext;
  CLPInstSchemaCLPNLv4TaskEvaluationContext *nlv4TaskEvaluationContext;
  CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *curareAppIntentSampleClassificationContext;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *curareAppIntentTaskClassificationContext;
  CLPInstSchemaCLPCDMReplayTaskContext *cdmReplayTaskContext;
  unint64_t v10;
  CLPInstSchemaCLPCDMReplaySampleContext *cdmReplaySampleContext;

  v4 = (CLPInstSchemaCLPCDMReplaySampleContext *)a3;
  nlv4SampleEvaluationContext = self->_nlv4SampleEvaluationContext;
  self->_nlv4SampleEvaluationContext = 0;

  nlv4TaskEvaluationContext = self->_nlv4TaskEvaluationContext;
  self->_nlv4TaskEvaluationContext = 0;

  curareAppIntentSampleClassificationContext = self->_curareAppIntentSampleClassificationContext;
  self->_curareAppIntentSampleClassificationContext = 0;

  curareAppIntentTaskClassificationContext = self->_curareAppIntentTaskClassificationContext;
  self->_curareAppIntentTaskClassificationContext = 0;

  cdmReplayTaskContext = self->_cdmReplayTaskContext;
  self->_cdmReplayTaskContext = 0;

  v10 = 105;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  cdmReplaySampleContext = self->_cdmReplaySampleContext;
  self->_cdmReplaySampleContext = v4;

}

- (CLPInstSchemaCLPCDMReplaySampleContext)cdmReplaySampleContext
{
  if (self->_whichEvent_Type == 105)
    return self->_cdmReplaySampleContext;
  else
    return (CLPInstSchemaCLPCDMReplaySampleContext *)0;
}

- (void)deleteCdmReplaySampleContext
{
  CLPInstSchemaCLPCDMReplaySampleContext *cdmReplaySampleContext;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    cdmReplaySampleContext = self->_cdmReplaySampleContext;
    self->_cdmReplaySampleContext = 0;

  }
}

- (void)setCdmReplayTaskContext:(id)a3
{
  CLPInstSchemaCLPCDMReplayTaskContext *v4;
  CLPInstSchemaCLPNLv4SampleEvaluationContext *nlv4SampleEvaluationContext;
  CLPInstSchemaCLPNLv4TaskEvaluationContext *nlv4TaskEvaluationContext;
  CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *curareAppIntentSampleClassificationContext;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *curareAppIntentTaskClassificationContext;
  CLPInstSchemaCLPCDMReplaySampleContext *cdmReplaySampleContext;
  unint64_t v10;
  CLPInstSchemaCLPCDMReplayTaskContext *cdmReplayTaskContext;

  v4 = (CLPInstSchemaCLPCDMReplayTaskContext *)a3;
  nlv4SampleEvaluationContext = self->_nlv4SampleEvaluationContext;
  self->_nlv4SampleEvaluationContext = 0;

  nlv4TaskEvaluationContext = self->_nlv4TaskEvaluationContext;
  self->_nlv4TaskEvaluationContext = 0;

  curareAppIntentSampleClassificationContext = self->_curareAppIntentSampleClassificationContext;
  self->_curareAppIntentSampleClassificationContext = 0;

  curareAppIntentTaskClassificationContext = self->_curareAppIntentTaskClassificationContext;
  self->_curareAppIntentTaskClassificationContext = 0;

  cdmReplaySampleContext = self->_cdmReplaySampleContext;
  self->_cdmReplaySampleContext = 0;

  v10 = 106;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  cdmReplayTaskContext = self->_cdmReplayTaskContext;
  self->_cdmReplayTaskContext = v4;

}

- (CLPInstSchemaCLPCDMReplayTaskContext)cdmReplayTaskContext
{
  if (self->_whichEvent_Type == 106)
    return self->_cdmReplayTaskContext;
  else
    return (CLPInstSchemaCLPCDMReplayTaskContext *)0;
}

- (void)deleteCdmReplayTaskContext
{
  CLPInstSchemaCLPCDMReplayTaskContext *cdmReplayTaskContext;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    cdmReplayTaskContext = self->_cdmReplayTaskContext;
    self->_cdmReplayTaskContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPClientEventReadFrom(self, (uint64_t)a3);
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
  -[CLPInstSchemaCLPClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CLPInstSchemaCLPClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPClientEvent nlv4SampleEvaluationContext](self, "nlv4SampleEvaluationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CLPInstSchemaCLPClientEvent nlv4SampleEvaluationContext](self, "nlv4SampleEvaluationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPClientEvent nlv4TaskEvaluationContext](self, "nlv4TaskEvaluationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CLPInstSchemaCLPClientEvent nlv4TaskEvaluationContext](self, "nlv4TaskEvaluationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPClientEvent curareAppIntentSampleClassificationContext](self, "curareAppIntentSampleClassificationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CLPInstSchemaCLPClientEvent curareAppIntentSampleClassificationContext](self, "curareAppIntentSampleClassificationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPClientEvent curareAppIntentTaskClassificationContext](self, "curareAppIntentTaskClassificationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CLPInstSchemaCLPClientEvent curareAppIntentTaskClassificationContext](self, "curareAppIntentTaskClassificationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPClientEvent cdmReplaySampleContext](self, "cdmReplaySampleContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CLPInstSchemaCLPClientEvent cdmReplaySampleContext](self, "cdmReplaySampleContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPClientEvent cdmReplayTaskContext](self, "cdmReplayTaskContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CLPInstSchemaCLPClientEvent cdmReplayTaskContext](self, "cdmReplayTaskContext");
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
  -[CLPInstSchemaCLPClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[CLPInstSchemaCLPClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CLPInstSchemaCLPClientEvent eventMetadata](self, "eventMetadata");
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
  -[CLPInstSchemaCLPClientEvent nlv4SampleEvaluationContext](self, "nlv4SampleEvaluationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlv4SampleEvaluationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[CLPInstSchemaCLPClientEvent nlv4SampleEvaluationContext](self, "nlv4SampleEvaluationContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CLPInstSchemaCLPClientEvent nlv4SampleEvaluationContext](self, "nlv4SampleEvaluationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlv4SampleEvaluationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_38;
  }
  else
  {

  }
  -[CLPInstSchemaCLPClientEvent nlv4TaskEvaluationContext](self, "nlv4TaskEvaluationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlv4TaskEvaluationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[CLPInstSchemaCLPClientEvent nlv4TaskEvaluationContext](self, "nlv4TaskEvaluationContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[CLPInstSchemaCLPClientEvent nlv4TaskEvaluationContext](self, "nlv4TaskEvaluationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlv4TaskEvaluationContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_38;
  }
  else
  {

  }
  -[CLPInstSchemaCLPClientEvent curareAppIntentSampleClassificationContext](self, "curareAppIntentSampleClassificationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "curareAppIntentSampleClassificationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[CLPInstSchemaCLPClientEvent curareAppIntentSampleClassificationContext](self, "curareAppIntentSampleClassificationContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[CLPInstSchemaCLPClientEvent curareAppIntentSampleClassificationContext](self, "curareAppIntentSampleClassificationContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "curareAppIntentSampleClassificationContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_38;
  }
  else
  {

  }
  -[CLPInstSchemaCLPClientEvent curareAppIntentTaskClassificationContext](self, "curareAppIntentTaskClassificationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "curareAppIntentTaskClassificationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[CLPInstSchemaCLPClientEvent curareAppIntentTaskClassificationContext](self, "curareAppIntentTaskClassificationContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[CLPInstSchemaCLPClientEvent curareAppIntentTaskClassificationContext](self, "curareAppIntentTaskClassificationContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "curareAppIntentTaskClassificationContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_38;
  }
  else
  {

  }
  -[CLPInstSchemaCLPClientEvent cdmReplaySampleContext](self, "cdmReplaySampleContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmReplaySampleContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[CLPInstSchemaCLPClientEvent cdmReplaySampleContext](self, "cdmReplaySampleContext");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[CLPInstSchemaCLPClientEvent cdmReplaySampleContext](self, "cdmReplaySampleContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmReplaySampleContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_38;
  }
  else
  {

  }
  -[CLPInstSchemaCLPClientEvent cdmReplayTaskContext](self, "cdmReplayTaskContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmReplayTaskContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CLPInstSchemaCLPClientEvent cdmReplayTaskContext](self, "cdmReplayTaskContext");
    v38 = objc_claimAutoreleasedReturnValue();
    if (!v38)
    {

LABEL_41:
      v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    -[CLPInstSchemaCLPClientEvent cdmReplayTaskContext](self, "cdmReplayTaskContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmReplayTaskContext");
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

  v3 = -[CLPInstSchemaCLPClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[CLPInstSchemaCLPNLv4SampleEvaluationContext hash](self->_nlv4SampleEvaluationContext, "hash") ^ v3;
  v5 = -[CLPInstSchemaCLPNLv4TaskEvaluationContext hash](self->_nlv4TaskEvaluationContext, "hash");
  v6 = v4 ^ v5 ^ -[CLPInstSchemaCLPCurareAppIntentSampleClassificationContext hash](self->_curareAppIntentSampleClassificationContext, "hash");
  v7 = -[CLPInstSchemaCLPCurareAppIntentTaskClassificationContext hash](self->_curareAppIntentTaskClassificationContext, "hash");
  v8 = v7 ^ -[CLPInstSchemaCLPCDMReplaySampleContext hash](self->_cdmReplaySampleContext, "hash");
  return v6 ^ v8 ^ -[CLPInstSchemaCLPCDMReplayTaskContext hash](self->_cdmReplayTaskContext, "hash");
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
  if (self->_cdmReplaySampleContext)
  {
    -[CLPInstSchemaCLPClientEvent cdmReplaySampleContext](self, "cdmReplaySampleContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cdmReplaySampleContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cdmReplaySampleContext"));

    }
  }
  if (self->_cdmReplayTaskContext)
  {
    -[CLPInstSchemaCLPClientEvent cdmReplayTaskContext](self, "cdmReplayTaskContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cdmReplayTaskContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cdmReplayTaskContext"));

    }
  }
  if (self->_curareAppIntentSampleClassificationContext)
  {
    -[CLPInstSchemaCLPClientEvent curareAppIntentSampleClassificationContext](self, "curareAppIntentSampleClassificationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("curareAppIntentSampleClassificationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("curareAppIntentSampleClassificationContext"));

    }
  }
  if (self->_curareAppIntentTaskClassificationContext)
  {
    -[CLPInstSchemaCLPClientEvent curareAppIntentTaskClassificationContext](self, "curareAppIntentTaskClassificationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("curareAppIntentTaskClassificationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("curareAppIntentTaskClassificationContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[CLPInstSchemaCLPClientEvent eventMetadata](self, "eventMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("eventMetadata"));

    }
  }
  if (self->_nlv4SampleEvaluationContext)
  {
    -[CLPInstSchemaCLPClientEvent nlv4SampleEvaluationContext](self, "nlv4SampleEvaluationContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("nlv4SampleEvaluationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("nlv4SampleEvaluationContext"));

    }
  }
  if (self->_nlv4TaskEvaluationContext)
  {
    -[CLPInstSchemaCLPClientEvent nlv4TaskEvaluationContext](self, "nlv4TaskEvaluationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("nlv4TaskEvaluationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("nlv4TaskEvaluationContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPClientEvent)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPClientEvent *v5;
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
    self = -[CLPInstSchemaCLPClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPClientEvent)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPClientEvent *v5;
  void *v6;
  CLPInstSchemaCLPClientEventMetadata *v7;
  void *v8;
  CLPInstSchemaCLPNLv4SampleEvaluationContext *v9;
  void *v10;
  CLPInstSchemaCLPNLv4TaskEvaluationContext *v11;
  void *v12;
  CLPInstSchemaCLPCurareAppIntentSampleClassificationContext *v13;
  void *v14;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationContext *v15;
  void *v16;
  CLPInstSchemaCLPCDMReplaySampleContext *v17;
  void *v18;
  CLPInstSchemaCLPCDMReplayTaskContext *v19;
  CLPInstSchemaCLPClientEvent *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLPInstSchemaCLPClientEvent;
  v5 = -[CLPInstSchemaCLPClientEvent init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[CLPInstSchemaCLPClientEventMetadata initWithDictionary:]([CLPInstSchemaCLPClientEventMetadata alloc], "initWithDictionary:", v6);
      -[CLPInstSchemaCLPClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlv4SampleEvaluationContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CLPInstSchemaCLPNLv4SampleEvaluationContext initWithDictionary:]([CLPInstSchemaCLPNLv4SampleEvaluationContext alloc], "initWithDictionary:", v8);
      -[CLPInstSchemaCLPClientEvent setNlv4SampleEvaluationContext:](v5, "setNlv4SampleEvaluationContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlv4TaskEvaluationContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[CLPInstSchemaCLPNLv4TaskEvaluationContext initWithDictionary:]([CLPInstSchemaCLPNLv4TaskEvaluationContext alloc], "initWithDictionary:", v10);
      -[CLPInstSchemaCLPClientEvent setNlv4TaskEvaluationContext:](v5, "setNlv4TaskEvaluationContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("curareAppIntentSampleClassificationContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[CLPInstSchemaCLPCurareAppIntentSampleClassificationContext initWithDictionary:]([CLPInstSchemaCLPCurareAppIntentSampleClassificationContext alloc], "initWithDictionary:", v12);
      -[CLPInstSchemaCLPClientEvent setCurareAppIntentSampleClassificationContext:](v5, "setCurareAppIntentSampleClassificationContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("curareAppIntentTaskClassificationContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[CLPInstSchemaCLPCurareAppIntentTaskClassificationContext initWithDictionary:]([CLPInstSchemaCLPCurareAppIntentTaskClassificationContext alloc], "initWithDictionary:", v14);
      -[CLPInstSchemaCLPClientEvent setCurareAppIntentTaskClassificationContext:](v5, "setCurareAppIntentTaskClassificationContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmReplaySampleContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[CLPInstSchemaCLPCDMReplaySampleContext initWithDictionary:]([CLPInstSchemaCLPCDMReplaySampleContext alloc], "initWithDictionary:", v16);
      -[CLPInstSchemaCLPClientEvent setCdmReplaySampleContext:](v5, "setCdmReplaySampleContext:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmReplayTaskContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[CLPInstSchemaCLPCDMReplayTaskContext initWithDictionary:]([CLPInstSchemaCLPCDMReplayTaskContext alloc], "initWithDictionary:", v18);
      -[CLPInstSchemaCLPClientEvent setCdmReplayTaskContext:](v5, "setCdmReplayTaskContext:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CLPInstSchemaCLPClientEventMetadata)eventMetadata
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

- (BOOL)hasNlv4SampleEvaluationContext
{
  return self->_hasNlv4SampleEvaluationContext;
}

- (void)setHasNlv4SampleEvaluationContext:(BOOL)a3
{
  self->_hasNlv4SampleEvaluationContext = a3;
}

- (BOOL)hasNlv4TaskEvaluationContext
{
  return self->_hasNlv4TaskEvaluationContext;
}

- (void)setHasNlv4TaskEvaluationContext:(BOOL)a3
{
  self->_hasNlv4TaskEvaluationContext = a3;
}

- (BOOL)hasCurareAppIntentSampleClassificationContext
{
  return self->_hasCurareAppIntentSampleClassificationContext;
}

- (void)setHasCurareAppIntentSampleClassificationContext:(BOOL)a3
{
  self->_hasCurareAppIntentSampleClassificationContext = a3;
}

- (BOOL)hasCurareAppIntentTaskClassificationContext
{
  return self->_hasCurareAppIntentTaskClassificationContext;
}

- (void)setHasCurareAppIntentTaskClassificationContext:(BOOL)a3
{
  self->_hasCurareAppIntentTaskClassificationContext = a3;
}

- (BOOL)hasCdmReplaySampleContext
{
  return self->_hasCdmReplaySampleContext;
}

- (void)setHasCdmReplaySampleContext:(BOOL)a3
{
  self->_hasCdmReplaySampleContext = a3;
}

- (BOOL)hasCdmReplayTaskContext
{
  return self->_hasCdmReplayTaskContext;
}

- (void)setHasCdmReplayTaskContext:(BOOL)a3
{
  self->_hasCdmReplayTaskContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdmReplayTaskContext, 0);
  objc_storeStrong((id *)&self->_cdmReplaySampleContext, 0);
  objc_storeStrong((id *)&self->_curareAppIntentTaskClassificationContext, 0);
  objc_storeStrong((id *)&self->_curareAppIntentSampleClassificationContext, 0);
  objc_storeStrong((id *)&self->_nlv4TaskEvaluationContext, 0);
  objc_storeStrong((id *)&self->_nlv4SampleEvaluationContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 25;
}

@end
