@implementation RTSSchemaRTSClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[RTSSchemaRTSClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rtsSessionId");
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

  -[RTSSchemaRTSClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rtsSessionId");
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
        LODWORD(v4) = 41;
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
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RTSSchemaRTSClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSSchemaRTSClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RTSSchemaRTSClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[RTSSchemaRTSClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RTSSchemaRTSClientEvent deleteRtsFalseRejectDetected](self, "deleteRtsFalseRejectDetected");
  -[RTSSchemaRTSClientEvent rtsTriggered](self, "rtsTriggered");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[RTSSchemaRTSClientEvent deleteRtsTriggered](self, "deleteRtsTriggered");
  -[RTSSchemaRTSClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[RTSSchemaRTSClientEvent deleteRtsFirstPassPolicyTriggered](self, "deleteRtsFirstPassPolicyTriggered");
  -[RTSSchemaRTSClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[RTSSchemaRTSClientEvent deleteRtsSecondPassPolicyDecisionMade](self, "deleteRtsSecondPassPolicyDecisionMade");
  -[RTSSchemaRTSClientEvent rtsMotionData](self, "rtsMotionData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[RTSSchemaRTSClientEvent deleteRtsMotionData](self, "deleteRtsMotionData");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[RTSSchemaRTSClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 4)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562ACE8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 4)
    return 0;
  else
    return off_1E562AD10[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[RTSSchemaRTSClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 4)
    return CFSTR("com.apple.aiml.siri.rts.RTSClientEvent");
  else
    return off_1E563B860[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[RTSSchemaRTSClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setRtsFalseRejectDetected:(id)a3
{
  RTSSchemaRTSFalseRejectDetected *v4;
  RTSSchemaRTSTriggered *rtsTriggered;
  RTSSchemaRTSFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  RTSSchemaRTSSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  RTSSchemaRTSMotionData *rtsMotionData;
  unint64_t v9;
  RTSSchemaRTSFalseRejectDetected *rtsFalseRejectDetected;

  v4 = (RTSSchemaRTSFalseRejectDetected *)a3;
  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  rtsMotionData = self->_rtsMotionData;
  self->_rtsMotionData = 0;

  v9 = 101;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = v4;

}

- (RTSSchemaRTSFalseRejectDetected)rtsFalseRejectDetected
{
  if (self->_whichEvent_Type == 101)
    return self->_rtsFalseRejectDetected;
  else
    return (RTSSchemaRTSFalseRejectDetected *)0;
}

- (void)deleteRtsFalseRejectDetected
{
  RTSSchemaRTSFalseRejectDetected *rtsFalseRejectDetected;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
    self->_rtsFalseRejectDetected = 0;

  }
}

- (void)setRtsTriggered:(id)a3
{
  RTSSchemaRTSTriggered *v4;
  RTSSchemaRTSFalseRejectDetected *rtsFalseRejectDetected;
  RTSSchemaRTSFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  RTSSchemaRTSSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  RTSSchemaRTSMotionData *rtsMotionData;
  unint64_t v9;
  RTSSchemaRTSTriggered *rtsTriggered;

  v4 = (RTSSchemaRTSTriggered *)a3;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  rtsMotionData = self->_rtsMotionData;
  self->_rtsMotionData = 0;

  v9 = 102;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = v4;

}

- (RTSSchemaRTSTriggered)rtsTriggered
{
  if (self->_whichEvent_Type == 102)
    return self->_rtsTriggered;
  else
    return (RTSSchemaRTSTriggered *)0;
}

- (void)deleteRtsTriggered
{
  RTSSchemaRTSTriggered *rtsTriggered;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    rtsTriggered = self->_rtsTriggered;
    self->_rtsTriggered = 0;

  }
}

- (void)setRtsFirstPassPolicyTriggered:(id)a3
{
  RTSSchemaRTSFirstPassPolicyTriggered *v4;
  RTSSchemaRTSFalseRejectDetected *rtsFalseRejectDetected;
  RTSSchemaRTSTriggered *rtsTriggered;
  RTSSchemaRTSSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  RTSSchemaRTSMotionData *rtsMotionData;
  unint64_t v9;
  RTSSchemaRTSFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;

  v4 = (RTSSchemaRTSFirstPassPolicyTriggered *)a3;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  rtsMotionData = self->_rtsMotionData;
  self->_rtsMotionData = 0;

  v9 = 103;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = v4;

}

- (RTSSchemaRTSFirstPassPolicyTriggered)rtsFirstPassPolicyTriggered
{
  if (self->_whichEvent_Type == 103)
    return self->_rtsFirstPassPolicyTriggered;
  else
    return (RTSSchemaRTSFirstPassPolicyTriggered *)0;
}

- (void)deleteRtsFirstPassPolicyTriggered
{
  RTSSchemaRTSFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
    self->_rtsFirstPassPolicyTriggered = 0;

  }
}

- (void)setRtsSecondPassPolicyDecisionMade:(id)a3
{
  RTSSchemaRTSSecondPassPolicyDecisionMade *v4;
  RTSSchemaRTSFalseRejectDetected *rtsFalseRejectDetected;
  RTSSchemaRTSTriggered *rtsTriggered;
  RTSSchemaRTSFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  RTSSchemaRTSMotionData *rtsMotionData;
  unint64_t v9;
  RTSSchemaRTSSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;

  v4 = (RTSSchemaRTSSecondPassPolicyDecisionMade *)a3;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsMotionData = self->_rtsMotionData;
  self->_rtsMotionData = 0;

  v9 = 104;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = v4;

}

- (RTSSchemaRTSSecondPassPolicyDecisionMade)rtsSecondPassPolicyDecisionMade
{
  if (self->_whichEvent_Type == 104)
    return self->_rtsSecondPassPolicyDecisionMade;
  else
    return (RTSSchemaRTSSecondPassPolicyDecisionMade *)0;
}

- (void)deleteRtsSecondPassPolicyDecisionMade
{
  RTSSchemaRTSSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
    self->_rtsSecondPassPolicyDecisionMade = 0;

  }
}

- (void)setRtsMotionData:(id)a3
{
  RTSSchemaRTSMotionData *v4;
  RTSSchemaRTSFalseRejectDetected *rtsFalseRejectDetected;
  RTSSchemaRTSTriggered *rtsTriggered;
  RTSSchemaRTSFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  RTSSchemaRTSSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  unint64_t v9;
  RTSSchemaRTSMotionData *rtsMotionData;

  v4 = (RTSSchemaRTSMotionData *)a3;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  v9 = 105;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  rtsMotionData = self->_rtsMotionData;
  self->_rtsMotionData = v4;

}

- (RTSSchemaRTSMotionData)rtsMotionData
{
  if (self->_whichEvent_Type == 105)
    return self->_rtsMotionData;
  else
    return (RTSSchemaRTSMotionData *)0;
}

- (void)deleteRtsMotionData
{
  RTSSchemaRTSMotionData *rtsMotionData;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    rtsMotionData = self->_rtsMotionData;
    self->_rtsMotionData = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return RTSSchemaRTSClientEventReadFrom(self, (uint64_t)a3);
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
  -[RTSSchemaRTSClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTSSchemaRTSClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RTSSchemaRTSClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTSSchemaRTSClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RTSSchemaRTSClientEvent rtsTriggered](self, "rtsTriggered");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RTSSchemaRTSClientEvent rtsTriggered](self, "rtsTriggered");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RTSSchemaRTSClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RTSSchemaRTSClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RTSSchemaRTSClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[RTSSchemaRTSClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RTSSchemaRTSClientEvent rtsMotionData](self, "rtsMotionData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[RTSSchemaRTSClientEvent rtsMotionData](self, "rtsMotionData");
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
  -[RTSSchemaRTSClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[RTSSchemaRTSClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RTSSchemaRTSClientEvent eventMetadata](self, "eventMetadata");
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
  -[RTSSchemaRTSClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtsFalseRejectDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[RTSSchemaRTSClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[RTSSchemaRTSClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtsFalseRejectDetected");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_33;
  }
  else
  {

  }
  -[RTSSchemaRTSClientEvent rtsTriggered](self, "rtsTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtsTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[RTSSchemaRTSClientEvent rtsTriggered](self, "rtsTriggered");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[RTSSchemaRTSClientEvent rtsTriggered](self, "rtsTriggered");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtsTriggered");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_33;
  }
  else
  {

  }
  -[RTSSchemaRTSClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtsFirstPassPolicyTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[RTSSchemaRTSClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[RTSSchemaRTSClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtsFirstPassPolicyTriggered");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_33;
  }
  else
  {

  }
  -[RTSSchemaRTSClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtsSecondPassPolicyDecisionMade");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[RTSSchemaRTSClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[RTSSchemaRTSClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtsSecondPassPolicyDecisionMade");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_33;
  }
  else
  {

  }
  -[RTSSchemaRTSClientEvent rtsMotionData](self, "rtsMotionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtsMotionData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RTSSchemaRTSClientEvent rtsMotionData](self, "rtsMotionData");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_36:
      v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    -[RTSSchemaRTSClientEvent rtsMotionData](self, "rtsMotionData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtsMotionData");
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

  v3 = -[RTSSchemaRTSClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[RTSSchemaRTSFalseRejectDetected hash](self->_rtsFalseRejectDetected, "hash") ^ v3;
  v5 = -[RTSSchemaRTSTriggered hash](self->_rtsTriggered, "hash");
  v6 = v4 ^ v5 ^ -[RTSSchemaRTSFirstPassPolicyTriggered hash](self->_rtsFirstPassPolicyTriggered, "hash");
  v7 = -[RTSSchemaRTSSecondPassPolicyDecisionMade hash](self->_rtsSecondPassPolicyDecisionMade, "hash");
  return v6 ^ v7 ^ -[RTSSchemaRTSMotionData hash](self->_rtsMotionData, "hash");
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
  if (self->_eventMetadata)
  {
    -[RTSSchemaRTSClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_rtsFalseRejectDetected)
  {
    -[RTSSchemaRTSClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("rtsFalseRejectDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("rtsFalseRejectDetected"));

    }
  }
  if (self->_rtsFirstPassPolicyTriggered)
  {
    -[RTSSchemaRTSClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("rtsFirstPassPolicyTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("rtsFirstPassPolicyTriggered"));

    }
  }
  if (self->_rtsMotionData)
  {
    -[RTSSchemaRTSClientEvent rtsMotionData](self, "rtsMotionData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("rtsMotionData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("rtsMotionData"));

    }
  }
  if (self->_rtsSecondPassPolicyDecisionMade)
  {
    -[RTSSchemaRTSClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rtsSecondPassPolicyDecisionMade"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("rtsSecondPassPolicyDecisionMade"));

    }
  }
  if (self->_rtsTriggered)
  {
    -[RTSSchemaRTSClientEvent rtsTriggered](self, "rtsTriggered");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("rtsTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("rtsTriggered"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RTSSchemaRTSClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RTSSchemaRTSClientEvent)initWithJSON:(id)a3
{
  void *v4;
  RTSSchemaRTSClientEvent *v5;
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
    self = -[RTSSchemaRTSClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RTSSchemaRTSClientEvent)initWithDictionary:(id)a3
{
  id v4;
  RTSSchemaRTSClientEvent *v5;
  void *v6;
  RTSSchemaRTSClientEventMetadata *v7;
  void *v8;
  RTSSchemaRTSFalseRejectDetected *v9;
  void *v10;
  RTSSchemaRTSTriggered *v11;
  void *v12;
  RTSSchemaRTSFirstPassPolicyTriggered *v13;
  void *v14;
  RTSSchemaRTSSecondPassPolicyDecisionMade *v15;
  void *v16;
  RTSSchemaRTSMotionData *v17;
  RTSSchemaRTSClientEvent *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RTSSchemaRTSClientEvent;
  v5 = -[RTSSchemaRTSClientEvent init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[RTSSchemaRTSClientEventMetadata initWithDictionary:]([RTSSchemaRTSClientEventMetadata alloc], "initWithDictionary:", v6);
      -[RTSSchemaRTSClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rtsFalseRejectDetected"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[RTSSchemaRTSFalseRejectDetected initWithDictionary:]([RTSSchemaRTSFalseRejectDetected alloc], "initWithDictionary:", v8);
      -[RTSSchemaRTSClientEvent setRtsFalseRejectDetected:](v5, "setRtsFalseRejectDetected:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rtsTriggered"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[RTSSchemaRTSTriggered initWithDictionary:]([RTSSchemaRTSTriggered alloc], "initWithDictionary:", v10);
      -[RTSSchemaRTSClientEvent setRtsTriggered:](v5, "setRtsTriggered:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rtsFirstPassPolicyTriggered"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[RTSSchemaRTSFirstPassPolicyTriggered initWithDictionary:]([RTSSchemaRTSFirstPassPolicyTriggered alloc], "initWithDictionary:", v12);
      -[RTSSchemaRTSClientEvent setRtsFirstPassPolicyTriggered:](v5, "setRtsFirstPassPolicyTriggered:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rtsSecondPassPolicyDecisionMade"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[RTSSchemaRTSSecondPassPolicyDecisionMade initWithDictionary:]([RTSSchemaRTSSecondPassPolicyDecisionMade alloc], "initWithDictionary:", v14);
      -[RTSSchemaRTSClientEvent setRtsSecondPassPolicyDecisionMade:](v5, "setRtsSecondPassPolicyDecisionMade:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rtsMotionData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[RTSSchemaRTSMotionData initWithDictionary:]([RTSSchemaRTSMotionData alloc], "initWithDictionary:", v16);
      -[RTSSchemaRTSClientEvent setRtsMotionData:](v5, "setRtsMotionData:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RTSSchemaRTSClientEventMetadata)eventMetadata
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

- (BOOL)hasRtsFalseRejectDetected
{
  return self->_hasRtsFalseRejectDetected;
}

- (void)setHasRtsFalseRejectDetected:(BOOL)a3
{
  self->_hasRtsFalseRejectDetected = a3;
}

- (BOOL)hasRtsTriggered
{
  return self->_hasRtsTriggered;
}

- (void)setHasRtsTriggered:(BOOL)a3
{
  self->_hasRtsTriggered = a3;
}

- (BOOL)hasRtsFirstPassPolicyTriggered
{
  return self->_hasRtsFirstPassPolicyTriggered;
}

- (void)setHasRtsFirstPassPolicyTriggered:(BOOL)a3
{
  self->_hasRtsFirstPassPolicyTriggered = a3;
}

- (BOOL)hasRtsSecondPassPolicyDecisionMade
{
  return self->_hasRtsSecondPassPolicyDecisionMade;
}

- (void)setHasRtsSecondPassPolicyDecisionMade:(BOOL)a3
{
  self->_hasRtsSecondPassPolicyDecisionMade = a3;
}

- (BOOL)hasRtsMotionData
{
  return self->_hasRtsMotionData;
}

- (void)setHasRtsMotionData:(BOOL)a3
{
  self->_hasRtsMotionData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtsMotionData, 0);
  objc_storeStrong((id *)&self->_rtsSecondPassPolicyDecisionMade, 0);
  objc_storeStrong((id *)&self->_rtsFirstPassPolicyTriggered, 0);
  objc_storeStrong((id *)&self->_rtsTriggered, 0);
  objc_storeStrong((id *)&self->_rtsFalseRejectDetected, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 80;
}

@end
