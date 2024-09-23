@implementation SIRISETUPSchemaSIRISETUPClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[SIRISETUPSchemaSIRISETUPClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriSetupId");
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

  -[SIRISETUPSchemaSIRISETUPClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriSetupId");
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
        LODWORD(v4) = 33;
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
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SIRISETUPSchemaSIRISETUPClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v28, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRISETUPSchemaSIRISETUPClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SIRISETUPSchemaSIRISETUPClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentZeroDetectionCompleted](self, "enrollmentZeroDetectionCompleted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SIRISETUPSchemaSIRISETUPClientEvent deleteEnrollmentZeroDetectionCompleted](self, "deleteEnrollmentZeroDetectionCompleted");
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceCompleted](self, "enrollmentUtteranceCompleted");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SIRISETUPSchemaSIRISETUPClientEvent deleteEnrollmentUtteranceCompleted](self, "deleteEnrollmentUtteranceCompleted");
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceDetected](self, "enrollmentUtteranceDetected");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SIRISETUPSchemaSIRISETUPClientEvent deleteEnrollmentUtteranceDetected](self, "deleteEnrollmentUtteranceDetected");
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIStarted](self, "enrollmentUIStarted");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[SIRISETUPSchemaSIRISETUPClientEvent deleteEnrollmentUIStarted](self, "deleteEnrollmentUIStarted");
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIUtteranceTrainingAttempted](self, "enrollmentUIUtteranceTrainingAttempted");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[SIRISETUPSchemaSIRISETUPClientEvent deleteEnrollmentUIUtteranceTrainingAttempted](self, "deleteEnrollmentUIUtteranceTrainingAttempted");
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUICompleted](self, "enrollmentUICompleted");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[SIRISETUPSchemaSIRISETUPClientEvent deleteEnrollmentUICompleted](self, "deleteEnrollmentUICompleted");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[SIRISETUPSchemaSIRISETUPClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 5)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AD98[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 5)
    return 0;
  else
    return off_1E562ADC8[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[SIRISETUPSchemaSIRISETUPClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 5)
    return CFSTR("com.apple.aiml.siri.setup.SIRISETUPClientEvent");
  else
    return off_1E5638B58[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[SIRISETUPSchemaSIRISETUPClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setEnrollmentZeroDetectionCompleted:(id)a3
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *enrollmentUtteranceCompleted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *enrollmentUtteranceDetected;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *enrollmentUIStarted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *enrollmentUIUtteranceTrainingAttempted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *enrollmentUICompleted;
  unint64_t v10;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *enrollmentZeroDetectionCompleted;

  v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)a3;
  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = 0;

  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = 0;

  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = 0;

  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = 0;

  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = 0;

  v10 = 101;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = v4;

}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted)enrollmentZeroDetectionCompleted
{
  if (self->_whichEvent_Type == 101)
    return self->_enrollmentZeroDetectionCompleted;
  else
    return (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)0;
}

- (void)deleteEnrollmentZeroDetectionCompleted
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *enrollmentZeroDetectionCompleted;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
    self->_enrollmentZeroDetectionCompleted = 0;

  }
}

- (void)setEnrollmentUtteranceCompleted:(id)a3
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *enrollmentZeroDetectionCompleted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *enrollmentUtteranceDetected;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *enrollmentUIStarted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *enrollmentUIUtteranceTrainingAttempted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *enrollmentUICompleted;
  unint64_t v10;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *enrollmentUtteranceCompleted;

  v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)a3;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = 0;

  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = 0;

  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = 0;

  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = 0;

  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = 0;

  v10 = 102;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = v4;

}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted)enrollmentUtteranceCompleted
{
  if (self->_whichEvent_Type == 102)
    return self->_enrollmentUtteranceCompleted;
  else
    return (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)0;
}

- (void)deleteEnrollmentUtteranceCompleted
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *enrollmentUtteranceCompleted;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
    self->_enrollmentUtteranceCompleted = 0;

  }
}

- (void)setEnrollmentUtteranceDetected:(id)a3
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *enrollmentZeroDetectionCompleted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *enrollmentUtteranceCompleted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *enrollmentUIStarted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *enrollmentUIUtteranceTrainingAttempted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *enrollmentUICompleted;
  unint64_t v10;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *enrollmentUtteranceDetected;

  v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)a3;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = 0;

  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = 0;

  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = 0;

  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = 0;

  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = 0;

  v10 = 103;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = v4;

}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected)enrollmentUtteranceDetected
{
  if (self->_whichEvent_Type == 103)
    return self->_enrollmentUtteranceDetected;
  else
    return (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)0;
}

- (void)deleteEnrollmentUtteranceDetected
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *enrollmentUtteranceDetected;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
    self->_enrollmentUtteranceDetected = 0;

  }
}

- (void)setEnrollmentUIStarted:(id)a3
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *enrollmentZeroDetectionCompleted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *enrollmentUtteranceCompleted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *enrollmentUtteranceDetected;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *enrollmentUIUtteranceTrainingAttempted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *enrollmentUICompleted;
  unint64_t v10;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *enrollmentUIStarted;

  v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)a3;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = 0;

  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = 0;

  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = 0;

  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = 0;

  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = 0;

  v10 = 104;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = v4;

}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted)enrollmentUIStarted
{
  if (self->_whichEvent_Type == 104)
    return self->_enrollmentUIStarted;
  else
    return (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)0;
}

- (void)deleteEnrollmentUIStarted
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *enrollmentUIStarted;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    enrollmentUIStarted = self->_enrollmentUIStarted;
    self->_enrollmentUIStarted = 0;

  }
}

- (void)setEnrollmentUIUtteranceTrainingAttempted:(id)a3
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *enrollmentZeroDetectionCompleted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *enrollmentUtteranceCompleted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *enrollmentUtteranceDetected;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *enrollmentUIStarted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *enrollmentUICompleted;
  unint64_t v10;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *enrollmentUIUtteranceTrainingAttempted;

  v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)a3;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = 0;

  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = 0;

  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = 0;

  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = 0;

  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = 0;

  v10 = 105;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = v4;

}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted)enrollmentUIUtteranceTrainingAttempted
{
  if (self->_whichEvent_Type == 105)
    return self->_enrollmentUIUtteranceTrainingAttempted;
  else
    return (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)0;
}

- (void)deleteEnrollmentUIUtteranceTrainingAttempted
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *enrollmentUIUtteranceTrainingAttempted;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
    self->_enrollmentUIUtteranceTrainingAttempted = 0;

  }
}

- (void)setEnrollmentUICompleted:(id)a3
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *enrollmentZeroDetectionCompleted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *enrollmentUtteranceCompleted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *enrollmentUtteranceDetected;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *enrollmentUIStarted;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *enrollmentUIUtteranceTrainingAttempted;
  unint64_t v10;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *enrollmentUICompleted;

  v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)a3;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = 0;

  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = 0;

  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = 0;

  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = 0;

  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = 0;

  v10 = 106;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = v4;

}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted)enrollmentUICompleted
{
  if (self->_whichEvent_Type == 106)
    return self->_enrollmentUICompleted;
  else
    return (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)0;
}

- (void)deleteEnrollmentUICompleted
{
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *enrollmentUICompleted;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    enrollmentUICompleted = self->_enrollmentUICompleted;
    self->_enrollmentUICompleted = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPClientEventReadFrom(self, (uint64_t)a3);
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
  -[SIRISETUPSchemaSIRISETUPClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentZeroDetectionCompleted](self, "enrollmentZeroDetectionCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentZeroDetectionCompleted](self, "enrollmentZeroDetectionCompleted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceCompleted](self, "enrollmentUtteranceCompleted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceCompleted](self, "enrollmentUtteranceCompleted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceDetected](self, "enrollmentUtteranceDetected");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceDetected](self, "enrollmentUtteranceDetected");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIStarted](self, "enrollmentUIStarted");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIStarted](self, "enrollmentUIStarted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIUtteranceTrainingAttempted](self, "enrollmentUIUtteranceTrainingAttempted");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIUtteranceTrainingAttempted](self, "enrollmentUIUtteranceTrainingAttempted");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUICompleted](self, "enrollmentUICompleted");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUICompleted](self, "enrollmentUICompleted");
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
  -[SIRISETUPSchemaSIRISETUPClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SIRISETUPSchemaSIRISETUPClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SIRISETUPSchemaSIRISETUPClientEvent eventMetadata](self, "eventMetadata");
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
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentZeroDetectionCompleted](self, "enrollmentZeroDetectionCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollmentZeroDetectionCompleted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentZeroDetectionCompleted](self, "enrollmentZeroDetectionCompleted");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentZeroDetectionCompleted](self, "enrollmentZeroDetectionCompleted");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enrollmentZeroDetectionCompleted");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_38;
  }
  else
  {

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceCompleted](self, "enrollmentUtteranceCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollmentUtteranceCompleted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceCompleted](self, "enrollmentUtteranceCompleted");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceCompleted](self, "enrollmentUtteranceCompleted");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enrollmentUtteranceCompleted");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_38;
  }
  else
  {

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceDetected](self, "enrollmentUtteranceDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollmentUtteranceDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceDetected](self, "enrollmentUtteranceDetected");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceDetected](self, "enrollmentUtteranceDetected");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enrollmentUtteranceDetected");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_38;
  }
  else
  {

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIStarted](self, "enrollmentUIStarted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollmentUIStarted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIStarted](self, "enrollmentUIStarted");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIStarted](self, "enrollmentUIStarted");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enrollmentUIStarted");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_38;
  }
  else
  {

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIUtteranceTrainingAttempted](self, "enrollmentUIUtteranceTrainingAttempted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollmentUIUtteranceTrainingAttempted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIUtteranceTrainingAttempted](self, "enrollmentUIUtteranceTrainingAttempted");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIUtteranceTrainingAttempted](self, "enrollmentUIUtteranceTrainingAttempted");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enrollmentUIUtteranceTrainingAttempted");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_38;
  }
  else
  {

  }
  -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUICompleted](self, "enrollmentUICompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollmentUICompleted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUICompleted](self, "enrollmentUICompleted");
    v38 = objc_claimAutoreleasedReturnValue();
    if (!v38)
    {

LABEL_41:
      v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUICompleted](self, "enrollmentUICompleted");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enrollmentUICompleted");
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

  v3 = -[SIRISETUPSchemaSIRISETUPClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted hash](self->_enrollmentZeroDetectionCompleted, "hash") ^ v3;
  v5 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted hash](self->_enrollmentUtteranceCompleted, "hash");
  v6 = v4 ^ v5 ^ -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected hash](self->_enrollmentUtteranceDetected, "hash");
  v7 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted hash](self->_enrollmentUIStarted, "hash");
  v8 = v7 ^ -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted hash](self->_enrollmentUIUtteranceTrainingAttempted, "hash");
  return v6 ^ v8 ^ -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted hash](self->_enrollmentUICompleted, "hash");
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
  if (self->_enrollmentUICompleted)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUICompleted](self, "enrollmentUICompleted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("enrollmentUICompleted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("enrollmentUICompleted"));

    }
  }
  if (self->_enrollmentUIStarted)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIStarted](self, "enrollmentUIStarted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("enrollmentUIStarted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("enrollmentUIStarted"));

    }
  }
  if (self->_enrollmentUIUtteranceTrainingAttempted)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUIUtteranceTrainingAttempted](self, "enrollmentUIUtteranceTrainingAttempted");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("enrollmentUIUtteranceTrainingAttempted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("enrollmentUIUtteranceTrainingAttempted"));

    }
  }
  if (self->_enrollmentUtteranceCompleted)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceCompleted](self, "enrollmentUtteranceCompleted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("enrollmentUtteranceCompleted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("enrollmentUtteranceCompleted"));

    }
  }
  if (self->_enrollmentUtteranceDetected)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentUtteranceDetected](self, "enrollmentUtteranceDetected");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("enrollmentUtteranceDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("enrollmentUtteranceDetected"));

    }
  }
  if (self->_enrollmentZeroDetectionCompleted)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent enrollmentZeroDetectionCompleted](self, "enrollmentZeroDetectionCompleted");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("enrollmentZeroDetectionCompleted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("enrollmentZeroDetectionCompleted"));

    }
  }
  if (self->_eventMetadata)
  {
    -[SIRISETUPSchemaSIRISETUPClientEvent eventMetadata](self, "eventMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("eventMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIRISETUPSchemaSIRISETUPClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIRISETUPSchemaSIRISETUPClientEvent)initWithJSON:(id)a3
{
  void *v4;
  SIRISETUPSchemaSIRISETUPClientEvent *v5;
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
    self = -[SIRISETUPSchemaSIRISETUPClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIRISETUPSchemaSIRISETUPClientEvent)initWithDictionary:(id)a3
{
  id v4;
  SIRISETUPSchemaSIRISETUPClientEvent *v5;
  void *v6;
  SIRISETUPSchemaSIRISETUPClientEventMetadata *v7;
  void *v8;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *v9;
  void *v10;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *v11;
  void *v12;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *v13;
  void *v14;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *v15;
  void *v16;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *v17;
  void *v18;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *v19;
  SIRISETUPSchemaSIRISETUPClientEvent *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SIRISETUPSchemaSIRISETUPClientEvent;
  v5 = -[SIRISETUPSchemaSIRISETUPClientEvent init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SIRISETUPSchemaSIRISETUPClientEventMetadata initWithDictionary:]([SIRISETUPSchemaSIRISETUPClientEventMetadata alloc], "initWithDictionary:", v6);
      -[SIRISETUPSchemaSIRISETUPClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentZeroDetectionCompleted"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted initWithDictionary:]([SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted alloc], "initWithDictionary:", v8);
      -[SIRISETUPSchemaSIRISETUPClientEvent setEnrollmentZeroDetectionCompleted:](v5, "setEnrollmentZeroDetectionCompleted:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentUtteranceCompleted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted initWithDictionary:]([SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted alloc], "initWithDictionary:", v10);
      -[SIRISETUPSchemaSIRISETUPClientEvent setEnrollmentUtteranceCompleted:](v5, "setEnrollmentUtteranceCompleted:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentUtteranceDetected"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected initWithDictionary:]([SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected alloc], "initWithDictionary:", v12);
      -[SIRISETUPSchemaSIRISETUPClientEvent setEnrollmentUtteranceDetected:](v5, "setEnrollmentUtteranceDetected:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentUIStarted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted initWithDictionary:]([SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted alloc], "initWithDictionary:", v14);
      -[SIRISETUPSchemaSIRISETUPClientEvent setEnrollmentUIStarted:](v5, "setEnrollmentUIStarted:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentUIUtteranceTrainingAttempted"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted initWithDictionary:]([SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted alloc], "initWithDictionary:", v16);
      -[SIRISETUPSchemaSIRISETUPClientEvent setEnrollmentUIUtteranceTrainingAttempted:](v5, "setEnrollmentUIUtteranceTrainingAttempted:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentUICompleted"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted initWithDictionary:]([SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted alloc], "initWithDictionary:", v18);
      -[SIRISETUPSchemaSIRISETUPClientEvent setEnrollmentUICompleted:](v5, "setEnrollmentUICompleted:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SIRISETUPSchemaSIRISETUPClientEventMetadata)eventMetadata
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

- (BOOL)hasEnrollmentZeroDetectionCompleted
{
  return self->_hasEnrollmentZeroDetectionCompleted;
}

- (void)setHasEnrollmentZeroDetectionCompleted:(BOOL)a3
{
  self->_hasEnrollmentZeroDetectionCompleted = a3;
}

- (BOOL)hasEnrollmentUtteranceCompleted
{
  return self->_hasEnrollmentUtteranceCompleted;
}

- (void)setHasEnrollmentUtteranceCompleted:(BOOL)a3
{
  self->_hasEnrollmentUtteranceCompleted = a3;
}

- (BOOL)hasEnrollmentUtteranceDetected
{
  return self->_hasEnrollmentUtteranceDetected;
}

- (void)setHasEnrollmentUtteranceDetected:(BOOL)a3
{
  self->_hasEnrollmentUtteranceDetected = a3;
}

- (BOOL)hasEnrollmentUIStarted
{
  return self->_hasEnrollmentUIStarted;
}

- (void)setHasEnrollmentUIStarted:(BOOL)a3
{
  self->_hasEnrollmentUIStarted = a3;
}

- (BOOL)hasEnrollmentUIUtteranceTrainingAttempted
{
  return self->_hasEnrollmentUIUtteranceTrainingAttempted;
}

- (void)setHasEnrollmentUIUtteranceTrainingAttempted:(BOOL)a3
{
  self->_hasEnrollmentUIUtteranceTrainingAttempted = a3;
}

- (BOOL)hasEnrollmentUICompleted
{
  return self->_hasEnrollmentUICompleted;
}

- (void)setHasEnrollmentUICompleted:(BOOL)a3
{
  self->_hasEnrollmentUICompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentUICompleted, 0);
  objc_storeStrong((id *)&self->_enrollmentUIUtteranceTrainingAttempted, 0);
  objc_storeStrong((id *)&self->_enrollmentUIStarted, 0);
  objc_storeStrong((id *)&self->_enrollmentUtteranceDetected, 0);
  objc_storeStrong((id *)&self->_enrollmentUtteranceCompleted, 0);
  objc_storeStrong((id *)&self->_enrollmentZeroDetectionCompleted, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 62;
}

@end
