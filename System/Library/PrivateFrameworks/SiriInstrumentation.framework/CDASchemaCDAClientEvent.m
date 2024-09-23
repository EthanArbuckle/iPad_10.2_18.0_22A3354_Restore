@implementation CDASchemaCDAClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[CDASchemaCDAClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cdaId");
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

  -[CDASchemaCDAClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cdaId");
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
        LODWORD(v4) = 23;
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
  void *v30;
  void *v31;
  int v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CDASchemaCDAClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v34, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDASchemaCDAClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CDASchemaCDAClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[CDASchemaCDAClientEvent electionDecisionMade](self, "electionDecisionMade");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CDASchemaCDAClientEvent deleteElectionDecisionMade](self, "deleteElectionDecisionMade");
  -[CDASchemaCDAClientEvent debugElectionDecisionMade](self, "debugElectionDecisionMade");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CDASchemaCDAClientEvent deleteDebugElectionDecisionMade](self, "deleteDebugElectionDecisionMade");
  -[CDASchemaCDAClientEvent deviceElectionStateContext](self, "deviceElectionStateContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CDASchemaCDAClientEvent deleteDeviceElectionStateContext](self, "deleteDeviceElectionStateContext");
  -[CDASchemaCDAClientEvent cdaAdvertisingStartChanged](self, "cdaAdvertisingStartChanged");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[CDASchemaCDAClientEvent deleteCdaAdvertisingStartChanged](self, "deleteCdaAdvertisingStartChanged");
  -[CDASchemaCDAClientEvent cdaAdvertisingEndChanged](self, "cdaAdvertisingEndChanged");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[CDASchemaCDAClientEvent deleteCdaAdvertisingEndChanged](self, "deleteCdaAdvertisingEndChanged");
  -[CDASchemaCDAClientEvent electionTimerEnded](self, "electionTimerEnded");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[CDASchemaCDAClientEvent deleteElectionTimerEnded](self, "deleteElectionTimerEnded");
  -[CDASchemaCDAClientEvent userFeedbackCompleted](self, "userFeedbackCompleted");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[CDASchemaCDAClientEvent deleteUserFeedbackCompleted](self, "deleteUserFeedbackCompleted");
  -[CDASchemaCDAClientEvent userFeedbackParticipantCollectionReported](self, "userFeedbackParticipantCollectionReported");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[CDASchemaCDAClientEvent deleteUserFeedbackParticipantCollectionReported](self, "deleteUserFeedbackParticipantCollectionReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[CDASchemaCDAClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 7)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5628FA0[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 7)
    return 0;
  else
    return off_1E5628FE0[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[CDASchemaCDAClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 7)
    return CFSTR("com.apple.aiml.siri.cda.CDAClientEvent");
  else
    return off_1E562BA10[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[CDASchemaCDAClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setElectionDecisionMade:(id)a3
{
  CDASchemaCDAElectionDecisionMade *v4;
  CDASchemaCDADebugElectionDecisionMade *debugElectionDecisionMade;
  CDASchemaCDADeviceStateContext *deviceElectionStateContext;
  CDASchemaCDADeviceAdvertisingStartContext *cdaAdvertisingStartChanged;
  CDASchemaCDADeviceAdvertisingEndContext *cdaAdvertisingEndChanged;
  CDASchemaCDAElectionTimerEnded *electionTimerEnded;
  CDASchemaCDAUserFeedbackCompleted *userFeedbackCompleted;
  CDASchemaCDAUserFeedbackParticipantCollectionReported *userFeedbackParticipantCollectionReported;
  unint64_t v12;
  CDASchemaCDAElectionDecisionMade *electionDecisionMade;

  v4 = (CDASchemaCDAElectionDecisionMade *)a3;
  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  v12 = 101;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = v4;

}

- (CDASchemaCDAElectionDecisionMade)electionDecisionMade
{
  if (self->_whichEvent_Type == 101)
    return self->_electionDecisionMade;
  else
    return (CDASchemaCDAElectionDecisionMade *)0;
}

- (void)deleteElectionDecisionMade
{
  CDASchemaCDAElectionDecisionMade *electionDecisionMade;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    electionDecisionMade = self->_electionDecisionMade;
    self->_electionDecisionMade = 0;

  }
}

- (void)setDebugElectionDecisionMade:(id)a3
{
  CDASchemaCDADebugElectionDecisionMade *v4;
  CDASchemaCDAElectionDecisionMade *electionDecisionMade;
  CDASchemaCDADeviceStateContext *deviceElectionStateContext;
  CDASchemaCDADeviceAdvertisingStartContext *cdaAdvertisingStartChanged;
  CDASchemaCDADeviceAdvertisingEndContext *cdaAdvertisingEndChanged;
  CDASchemaCDAElectionTimerEnded *electionTimerEnded;
  CDASchemaCDAUserFeedbackCompleted *userFeedbackCompleted;
  CDASchemaCDAUserFeedbackParticipantCollectionReported *userFeedbackParticipantCollectionReported;
  unint64_t v12;
  CDASchemaCDADebugElectionDecisionMade *debugElectionDecisionMade;

  v4 = (CDASchemaCDADebugElectionDecisionMade *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  v12 = 102;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = v4;

}

- (CDASchemaCDADebugElectionDecisionMade)debugElectionDecisionMade
{
  if (self->_whichEvent_Type == 102)
    return self->_debugElectionDecisionMade;
  else
    return (CDASchemaCDADebugElectionDecisionMade *)0;
}

- (void)deleteDebugElectionDecisionMade
{
  CDASchemaCDADebugElectionDecisionMade *debugElectionDecisionMade;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    debugElectionDecisionMade = self->_debugElectionDecisionMade;
    self->_debugElectionDecisionMade = 0;

  }
}

- (void)setDeviceElectionStateContext:(id)a3
{
  CDASchemaCDADeviceStateContext *v4;
  CDASchemaCDAElectionDecisionMade *electionDecisionMade;
  CDASchemaCDADebugElectionDecisionMade *debugElectionDecisionMade;
  CDASchemaCDADeviceAdvertisingStartContext *cdaAdvertisingStartChanged;
  CDASchemaCDADeviceAdvertisingEndContext *cdaAdvertisingEndChanged;
  CDASchemaCDAElectionTimerEnded *electionTimerEnded;
  CDASchemaCDAUserFeedbackCompleted *userFeedbackCompleted;
  CDASchemaCDAUserFeedbackParticipantCollectionReported *userFeedbackParticipantCollectionReported;
  unint64_t v12;
  CDASchemaCDADeviceStateContext *deviceElectionStateContext;

  v4 = (CDASchemaCDADeviceStateContext *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  v12 = 103;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = v4;

}

- (CDASchemaCDADeviceStateContext)deviceElectionStateContext
{
  if (self->_whichEvent_Type == 103)
    return self->_deviceElectionStateContext;
  else
    return (CDASchemaCDADeviceStateContext *)0;
}

- (void)deleteDeviceElectionStateContext
{
  CDASchemaCDADeviceStateContext *deviceElectionStateContext;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    deviceElectionStateContext = self->_deviceElectionStateContext;
    self->_deviceElectionStateContext = 0;

  }
}

- (void)setCdaAdvertisingStartChanged:(id)a3
{
  CDASchemaCDADeviceAdvertisingStartContext *v4;
  CDASchemaCDAElectionDecisionMade *electionDecisionMade;
  CDASchemaCDADebugElectionDecisionMade *debugElectionDecisionMade;
  CDASchemaCDADeviceStateContext *deviceElectionStateContext;
  CDASchemaCDADeviceAdvertisingEndContext *cdaAdvertisingEndChanged;
  CDASchemaCDAElectionTimerEnded *electionTimerEnded;
  CDASchemaCDAUserFeedbackCompleted *userFeedbackCompleted;
  CDASchemaCDAUserFeedbackParticipantCollectionReported *userFeedbackParticipantCollectionReported;
  unint64_t v12;
  CDASchemaCDADeviceAdvertisingStartContext *cdaAdvertisingStartChanged;

  v4 = (CDASchemaCDADeviceAdvertisingStartContext *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  v12 = 104;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = v4;

}

- (CDASchemaCDADeviceAdvertisingStartContext)cdaAdvertisingStartChanged
{
  if (self->_whichEvent_Type == 104)
    return self->_cdaAdvertisingStartChanged;
  else
    return (CDASchemaCDADeviceAdvertisingStartContext *)0;
}

- (void)deleteCdaAdvertisingStartChanged
{
  CDASchemaCDADeviceAdvertisingStartContext *cdaAdvertisingStartChanged;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
    self->_cdaAdvertisingStartChanged = 0;

  }
}

- (void)setCdaAdvertisingEndChanged:(id)a3
{
  CDASchemaCDADeviceAdvertisingEndContext *v4;
  CDASchemaCDAElectionDecisionMade *electionDecisionMade;
  CDASchemaCDADebugElectionDecisionMade *debugElectionDecisionMade;
  CDASchemaCDADeviceStateContext *deviceElectionStateContext;
  CDASchemaCDADeviceAdvertisingStartContext *cdaAdvertisingStartChanged;
  CDASchemaCDAElectionTimerEnded *electionTimerEnded;
  CDASchemaCDAUserFeedbackCompleted *userFeedbackCompleted;
  CDASchemaCDAUserFeedbackParticipantCollectionReported *userFeedbackParticipantCollectionReported;
  unint64_t v12;
  CDASchemaCDADeviceAdvertisingEndContext *cdaAdvertisingEndChanged;

  v4 = (CDASchemaCDADeviceAdvertisingEndContext *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  v12 = 105;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = v4;

}

- (CDASchemaCDADeviceAdvertisingEndContext)cdaAdvertisingEndChanged
{
  if (self->_whichEvent_Type == 105)
    return self->_cdaAdvertisingEndChanged;
  else
    return (CDASchemaCDADeviceAdvertisingEndContext *)0;
}

- (void)deleteCdaAdvertisingEndChanged
{
  CDASchemaCDADeviceAdvertisingEndContext *cdaAdvertisingEndChanged;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
    self->_cdaAdvertisingEndChanged = 0;

  }
}

- (void)setElectionTimerEnded:(id)a3
{
  CDASchemaCDAElectionTimerEnded *v4;
  CDASchemaCDAElectionDecisionMade *electionDecisionMade;
  CDASchemaCDADebugElectionDecisionMade *debugElectionDecisionMade;
  CDASchemaCDADeviceStateContext *deviceElectionStateContext;
  CDASchemaCDADeviceAdvertisingStartContext *cdaAdvertisingStartChanged;
  CDASchemaCDADeviceAdvertisingEndContext *cdaAdvertisingEndChanged;
  CDASchemaCDAUserFeedbackCompleted *userFeedbackCompleted;
  CDASchemaCDAUserFeedbackParticipantCollectionReported *userFeedbackParticipantCollectionReported;
  unint64_t v12;
  CDASchemaCDAElectionTimerEnded *electionTimerEnded;

  v4 = (CDASchemaCDAElectionTimerEnded *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  v12 = 106;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = v4;

}

- (CDASchemaCDAElectionTimerEnded)electionTimerEnded
{
  if (self->_whichEvent_Type == 106)
    return self->_electionTimerEnded;
  else
    return (CDASchemaCDAElectionTimerEnded *)0;
}

- (void)deleteElectionTimerEnded
{
  CDASchemaCDAElectionTimerEnded *electionTimerEnded;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    electionTimerEnded = self->_electionTimerEnded;
    self->_electionTimerEnded = 0;

  }
}

- (void)setUserFeedbackCompleted:(id)a3
{
  CDASchemaCDAUserFeedbackCompleted *v4;
  CDASchemaCDAElectionDecisionMade *electionDecisionMade;
  CDASchemaCDADebugElectionDecisionMade *debugElectionDecisionMade;
  CDASchemaCDADeviceStateContext *deviceElectionStateContext;
  CDASchemaCDADeviceAdvertisingStartContext *cdaAdvertisingStartChanged;
  CDASchemaCDADeviceAdvertisingEndContext *cdaAdvertisingEndChanged;
  CDASchemaCDAElectionTimerEnded *electionTimerEnded;
  CDASchemaCDAUserFeedbackParticipantCollectionReported *userFeedbackParticipantCollectionReported;
  unint64_t v12;
  CDASchemaCDAUserFeedbackCompleted *userFeedbackCompleted;

  v4 = (CDASchemaCDAUserFeedbackCompleted *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = 0;

  v12 = 107;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = v4;

}

- (CDASchemaCDAUserFeedbackCompleted)userFeedbackCompleted
{
  if (self->_whichEvent_Type == 107)
    return self->_userFeedbackCompleted;
  else
    return (CDASchemaCDAUserFeedbackCompleted *)0;
}

- (void)deleteUserFeedbackCompleted
{
  CDASchemaCDAUserFeedbackCompleted *userFeedbackCompleted;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    userFeedbackCompleted = self->_userFeedbackCompleted;
    self->_userFeedbackCompleted = 0;

  }
}

- (void)setUserFeedbackParticipantCollectionReported:(id)a3
{
  CDASchemaCDAUserFeedbackParticipantCollectionReported *v4;
  CDASchemaCDAElectionDecisionMade *electionDecisionMade;
  CDASchemaCDADebugElectionDecisionMade *debugElectionDecisionMade;
  CDASchemaCDADeviceStateContext *deviceElectionStateContext;
  CDASchemaCDADeviceAdvertisingStartContext *cdaAdvertisingStartChanged;
  CDASchemaCDADeviceAdvertisingEndContext *cdaAdvertisingEndChanged;
  CDASchemaCDAElectionTimerEnded *electionTimerEnded;
  CDASchemaCDAUserFeedbackCompleted *userFeedbackCompleted;
  unint64_t v12;
  CDASchemaCDAUserFeedbackParticipantCollectionReported *userFeedbackParticipantCollectionReported;

  v4 = (CDASchemaCDAUserFeedbackParticipantCollectionReported *)a3;
  electionDecisionMade = self->_electionDecisionMade;
  self->_electionDecisionMade = 0;

  debugElectionDecisionMade = self->_debugElectionDecisionMade;
  self->_debugElectionDecisionMade = 0;

  deviceElectionStateContext = self->_deviceElectionStateContext;
  self->_deviceElectionStateContext = 0;

  cdaAdvertisingStartChanged = self->_cdaAdvertisingStartChanged;
  self->_cdaAdvertisingStartChanged = 0;

  cdaAdvertisingEndChanged = self->_cdaAdvertisingEndChanged;
  self->_cdaAdvertisingEndChanged = 0;

  electionTimerEnded = self->_electionTimerEnded;
  self->_electionTimerEnded = 0;

  userFeedbackCompleted = self->_userFeedbackCompleted;
  self->_userFeedbackCompleted = 0;

  v12 = 108;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
  self->_userFeedbackParticipantCollectionReported = v4;

}

- (CDASchemaCDAUserFeedbackParticipantCollectionReported)userFeedbackParticipantCollectionReported
{
  if (self->_whichEvent_Type == 108)
    return self->_userFeedbackParticipantCollectionReported;
  else
    return (CDASchemaCDAUserFeedbackParticipantCollectionReported *)0;
}

- (void)deleteUserFeedbackParticipantCollectionReported
{
  CDASchemaCDAUserFeedbackParticipantCollectionReported *userFeedbackParticipantCollectionReported;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    userFeedbackParticipantCollectionReported = self->_userFeedbackParticipantCollectionReported;
    self->_userFeedbackParticipantCollectionReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAClientEventReadFrom(self, (uint64_t)a3);
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
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[CDASchemaCDAClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CDASchemaCDAClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAClientEvent electionDecisionMade](self, "electionDecisionMade");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CDASchemaCDAClientEvent electionDecisionMade](self, "electionDecisionMade");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAClientEvent debugElectionDecisionMade](self, "debugElectionDecisionMade");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CDASchemaCDAClientEvent debugElectionDecisionMade](self, "debugElectionDecisionMade");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAClientEvent deviceElectionStateContext](self, "deviceElectionStateContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CDASchemaCDAClientEvent deviceElectionStateContext](self, "deviceElectionStateContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAClientEvent cdaAdvertisingStartChanged](self, "cdaAdvertisingStartChanged");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CDASchemaCDAClientEvent cdaAdvertisingStartChanged](self, "cdaAdvertisingStartChanged");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAClientEvent cdaAdvertisingEndChanged](self, "cdaAdvertisingEndChanged");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CDASchemaCDAClientEvent cdaAdvertisingEndChanged](self, "cdaAdvertisingEndChanged");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAClientEvent electionTimerEnded](self, "electionTimerEnded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CDASchemaCDAClientEvent electionTimerEnded](self, "electionTimerEnded");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAClientEvent userFeedbackCompleted](self, "userFeedbackCompleted");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CDASchemaCDAClientEvent userFeedbackCompleted](self, "userFeedbackCompleted");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAClientEvent userFeedbackParticipantCollectionReported](self, "userFeedbackParticipantCollectionReported");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CDASchemaCDAClientEvent userFeedbackParticipantCollectionReported](self, "userFeedbackParticipantCollectionReported");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  BOOL v53;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_48;
  -[CDASchemaCDAClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[CDASchemaCDAClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CDASchemaCDAClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_48;
  }
  else
  {

  }
  -[CDASchemaCDAClientEvent electionDecisionMade](self, "electionDecisionMade");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "electionDecisionMade");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[CDASchemaCDAClientEvent electionDecisionMade](self, "electionDecisionMade");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CDASchemaCDAClientEvent electionDecisionMade](self, "electionDecisionMade");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "electionDecisionMade");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_48;
  }
  else
  {

  }
  -[CDASchemaCDAClientEvent debugElectionDecisionMade](self, "debugElectionDecisionMade");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugElectionDecisionMade");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[CDASchemaCDAClientEvent debugElectionDecisionMade](self, "debugElectionDecisionMade");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[CDASchemaCDAClientEvent debugElectionDecisionMade](self, "debugElectionDecisionMade");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugElectionDecisionMade");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_48;
  }
  else
  {

  }
  -[CDASchemaCDAClientEvent deviceElectionStateContext](self, "deviceElectionStateContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceElectionStateContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[CDASchemaCDAClientEvent deviceElectionStateContext](self, "deviceElectionStateContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[CDASchemaCDAClientEvent deviceElectionStateContext](self, "deviceElectionStateContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceElectionStateContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_48;
  }
  else
  {

  }
  -[CDASchemaCDAClientEvent cdaAdvertisingStartChanged](self, "cdaAdvertisingStartChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdaAdvertisingStartChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[CDASchemaCDAClientEvent cdaAdvertisingStartChanged](self, "cdaAdvertisingStartChanged");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[CDASchemaCDAClientEvent cdaAdvertisingStartChanged](self, "cdaAdvertisingStartChanged");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdaAdvertisingStartChanged");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_48;
  }
  else
  {

  }
  -[CDASchemaCDAClientEvent cdaAdvertisingEndChanged](self, "cdaAdvertisingEndChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdaAdvertisingEndChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[CDASchemaCDAClientEvent cdaAdvertisingEndChanged](self, "cdaAdvertisingEndChanged");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[CDASchemaCDAClientEvent cdaAdvertisingEndChanged](self, "cdaAdvertisingEndChanged");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdaAdvertisingEndChanged");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_48;
  }
  else
  {

  }
  -[CDASchemaCDAClientEvent electionTimerEnded](self, "electionTimerEnded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "electionTimerEnded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[CDASchemaCDAClientEvent electionTimerEnded](self, "electionTimerEnded");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[CDASchemaCDAClientEvent electionTimerEnded](self, "electionTimerEnded");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "electionTimerEnded");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_48;
  }
  else
  {

  }
  -[CDASchemaCDAClientEvent userFeedbackCompleted](self, "userFeedbackCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userFeedbackCompleted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[CDASchemaCDAClientEvent userFeedbackCompleted](self, "userFeedbackCompleted");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[CDASchemaCDAClientEvent userFeedbackCompleted](self, "userFeedbackCompleted");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userFeedbackCompleted");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_48;
  }
  else
  {

  }
  -[CDASchemaCDAClientEvent userFeedbackParticipantCollectionReported](self, "userFeedbackParticipantCollectionReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userFeedbackParticipantCollectionReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CDASchemaCDAClientEvent userFeedbackParticipantCollectionReported](self, "userFeedbackParticipantCollectionReported");
    v48 = objc_claimAutoreleasedReturnValue();
    if (!v48)
    {

LABEL_51:
      v53 = 1;
      goto LABEL_49;
    }
    v49 = (void *)v48;
    -[CDASchemaCDAClientEvent userFeedbackParticipantCollectionReported](self, "userFeedbackParticipantCollectionReported");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userFeedbackParticipantCollectionReported");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if ((v52 & 1) != 0)
      goto LABEL_51;
  }
  else
  {
LABEL_47:

  }
LABEL_48:
  v53 = 0;
LABEL_49:

  return v53;
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
  unint64_t v10;

  v3 = -[CDASchemaCDAClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[CDASchemaCDAElectionDecisionMade hash](self->_electionDecisionMade, "hash") ^ v3;
  v5 = -[CDASchemaCDADebugElectionDecisionMade hash](self->_debugElectionDecisionMade, "hash");
  v6 = v4 ^ v5 ^ -[CDASchemaCDADeviceStateContext hash](self->_deviceElectionStateContext, "hash");
  v7 = -[CDASchemaCDADeviceAdvertisingStartContext hash](self->_cdaAdvertisingStartChanged, "hash");
  v8 = v7 ^ -[CDASchemaCDADeviceAdvertisingEndContext hash](self->_cdaAdvertisingEndChanged, "hash");
  v9 = v6 ^ v8 ^ -[CDASchemaCDAElectionTimerEnded hash](self->_electionTimerEnded, "hash");
  v10 = -[CDASchemaCDAUserFeedbackCompleted hash](self->_userFeedbackCompleted, "hash");
  return v9 ^ v10 ^ -[CDASchemaCDAUserFeedbackParticipantCollectionReported hash](self->_userFeedbackParticipantCollectionReported, "hash");
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
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cdaAdvertisingEndChanged)
  {
    -[CDASchemaCDAClientEvent cdaAdvertisingEndChanged](self, "cdaAdvertisingEndChanged");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cdaAdvertisingEndChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cdaAdvertisingEndChanged"));

    }
  }
  if (self->_cdaAdvertisingStartChanged)
  {
    -[CDASchemaCDAClientEvent cdaAdvertisingStartChanged](self, "cdaAdvertisingStartChanged");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cdaAdvertisingStartChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cdaAdvertisingStartChanged"));

    }
  }
  if (self->_debugElectionDecisionMade)
  {
    -[CDASchemaCDAClientEvent debugElectionDecisionMade](self, "debugElectionDecisionMade");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("debugElectionDecisionMade"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("debugElectionDecisionMade"));

    }
  }
  if (self->_deviceElectionStateContext)
  {
    -[CDASchemaCDAClientEvent deviceElectionStateContext](self, "deviceElectionStateContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("deviceElectionStateContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("deviceElectionStateContext"));

    }
  }
  if (self->_electionDecisionMade)
  {
    -[CDASchemaCDAClientEvent electionDecisionMade](self, "electionDecisionMade");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("electionDecisionMade"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("electionDecisionMade"));

    }
  }
  if (self->_electionTimerEnded)
  {
    -[CDASchemaCDAClientEvent electionTimerEnded](self, "electionTimerEnded");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("electionTimerEnded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("electionTimerEnded"));

    }
  }
  if (self->_eventMetadata)
  {
    -[CDASchemaCDAClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_userFeedbackCompleted)
  {
    -[CDASchemaCDAClientEvent userFeedbackCompleted](self, "userFeedbackCompleted");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("userFeedbackCompleted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("userFeedbackCompleted"));

    }
  }
  if (self->_userFeedbackParticipantCollectionReported)
  {
    -[CDASchemaCDAClientEvent userFeedbackParticipantCollectionReported](self, "userFeedbackParticipantCollectionReported");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("userFeedbackParticipantCollectionReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("userFeedbackParticipantCollectionReported"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CDASchemaCDAClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CDASchemaCDAClientEvent)initWithJSON:(id)a3
{
  void *v4;
  CDASchemaCDAClientEvent *v5;
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
    self = -[CDASchemaCDAClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CDASchemaCDAClientEvent)initWithDictionary:(id)a3
{
  id v4;
  CDASchemaCDAClientEvent *v5;
  uint64_t v6;
  CDASchemaCDAClientEventMetadata *v7;
  uint64_t v8;
  CDASchemaCDAElectionDecisionMade *v9;
  void *v10;
  CDASchemaCDADebugElectionDecisionMade *v11;
  void *v12;
  CDASchemaCDADeviceStateContext *v13;
  void *v14;
  CDASchemaCDADeviceAdvertisingStartContext *v15;
  void *v16;
  CDASchemaCDADeviceAdvertisingEndContext *v17;
  void *v18;
  CDASchemaCDAElectionTimerEnded *v19;
  void *v20;
  CDASchemaCDAUserFeedbackCompleted *v21;
  void *v22;
  CDASchemaCDAUserFeedbackParticipantCollectionReported *v23;
  CDASchemaCDAClientEvent *v24;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CDASchemaCDAClientEvent;
  v5 = -[CDASchemaCDAClientEvent init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[CDASchemaCDAClientEventMetadata initWithDictionary:]([CDASchemaCDAClientEventMetadata alloc], "initWithDictionary:", v6);
      -[CDASchemaCDAClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    v27 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("electionDecisionMade"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CDASchemaCDAElectionDecisionMade initWithDictionary:]([CDASchemaCDAElectionDecisionMade alloc], "initWithDictionary:", v8);
      -[CDASchemaCDAClientEvent setElectionDecisionMade:](v5, "setElectionDecisionMade:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("debugElectionDecisionMade"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[CDASchemaCDADebugElectionDecisionMade initWithDictionary:]([CDASchemaCDADebugElectionDecisionMade alloc], "initWithDictionary:", v10);
      -[CDASchemaCDAClientEvent setDebugElectionDecisionMade:](v5, "setDebugElectionDecisionMade:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceElectionStateContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[CDASchemaCDADeviceStateContext initWithDictionary:]([CDASchemaCDADeviceStateContext alloc], "initWithDictionary:", v12);
      -[CDASchemaCDAClientEvent setDeviceElectionStateContext:](v5, "setDeviceElectionStateContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdaAdvertisingStartChanged"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[CDASchemaCDADeviceAdvertisingStartContext initWithDictionary:]([CDASchemaCDADeviceAdvertisingStartContext alloc], "initWithDictionary:", v14);
      -[CDASchemaCDAClientEvent setCdaAdvertisingStartChanged:](v5, "setCdaAdvertisingStartChanged:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdaAdvertisingEndChanged"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[CDASchemaCDADeviceAdvertisingEndContext initWithDictionary:]([CDASchemaCDADeviceAdvertisingEndContext alloc], "initWithDictionary:", v16);
      -[CDASchemaCDAClientEvent setCdaAdvertisingEndChanged:](v5, "setCdaAdvertisingEndChanged:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("electionTimerEnded"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[CDASchemaCDAElectionTimerEnded initWithDictionary:]([CDASchemaCDAElectionTimerEnded alloc], "initWithDictionary:", v18);
      -[CDASchemaCDAClientEvent setElectionTimerEnded:](v5, "setElectionTimerEnded:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userFeedbackCompleted"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[CDASchemaCDAUserFeedbackCompleted initWithDictionary:]([CDASchemaCDAUserFeedbackCompleted alloc], "initWithDictionary:", v20);
      -[CDASchemaCDAClientEvent setUserFeedbackCompleted:](v5, "setUserFeedbackCompleted:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userFeedbackParticipantCollectionReported"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[CDASchemaCDAUserFeedbackParticipantCollectionReported initWithDictionary:]([CDASchemaCDAUserFeedbackParticipantCollectionReported alloc], "initWithDictionary:", v22);
      -[CDASchemaCDAClientEvent setUserFeedbackParticipantCollectionReported:](v5, "setUserFeedbackParticipantCollectionReported:", v23);

    }
    v24 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CDASchemaCDAClientEventMetadata)eventMetadata
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

- (BOOL)hasElectionDecisionMade
{
  return self->_hasElectionDecisionMade;
}

- (void)setHasElectionDecisionMade:(BOOL)a3
{
  self->_hasElectionDecisionMade = a3;
}

- (BOOL)hasDebugElectionDecisionMade
{
  return self->_hasDebugElectionDecisionMade;
}

- (void)setHasDebugElectionDecisionMade:(BOOL)a3
{
  self->_hasDebugElectionDecisionMade = a3;
}

- (BOOL)hasDeviceElectionStateContext
{
  return self->_hasDeviceElectionStateContext;
}

- (void)setHasDeviceElectionStateContext:(BOOL)a3
{
  self->_hasDeviceElectionStateContext = a3;
}

- (BOOL)hasCdaAdvertisingStartChanged
{
  return self->_hasCdaAdvertisingStartChanged;
}

- (void)setHasCdaAdvertisingStartChanged:(BOOL)a3
{
  self->_hasCdaAdvertisingStartChanged = a3;
}

- (BOOL)hasCdaAdvertisingEndChanged
{
  return self->_hasCdaAdvertisingEndChanged;
}

- (void)setHasCdaAdvertisingEndChanged:(BOOL)a3
{
  self->_hasCdaAdvertisingEndChanged = a3;
}

- (BOOL)hasElectionTimerEnded
{
  return self->_hasElectionTimerEnded;
}

- (void)setHasElectionTimerEnded:(BOOL)a3
{
  self->_hasElectionTimerEnded = a3;
}

- (BOOL)hasUserFeedbackCompleted
{
  return self->_hasUserFeedbackCompleted;
}

- (void)setHasUserFeedbackCompleted:(BOOL)a3
{
  self->_hasUserFeedbackCompleted = a3;
}

- (BOOL)hasUserFeedbackParticipantCollectionReported
{
  return self->_hasUserFeedbackParticipantCollectionReported;
}

- (void)setHasUserFeedbackParticipantCollectionReported:(BOOL)a3
{
  self->_hasUserFeedbackParticipantCollectionReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFeedbackParticipantCollectionReported, 0);
  objc_storeStrong((id *)&self->_userFeedbackCompleted, 0);
  objc_storeStrong((id *)&self->_electionTimerEnded, 0);
  objc_storeStrong((id *)&self->_cdaAdvertisingEndChanged, 0);
  objc_storeStrong((id *)&self->_cdaAdvertisingStartChanged, 0);
  objc_storeStrong((id *)&self->_deviceElectionStateContext, 0);
  objc_storeStrong((id *)&self->_debugElectionDecisionMade, 0);
  objc_storeStrong((id *)&self->_electionDecisionMade, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 44;
}

@end
