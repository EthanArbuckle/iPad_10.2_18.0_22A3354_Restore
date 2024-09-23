@implementation IDENTITYSchemaIDENTITYClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[IDENTITYSchemaIDENTITYClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityId");
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

  -[IDENTITYSchemaIDENTITYClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityId");
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
        LODWORD(v4) = 38;
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
  v34.super_class = (Class)IDENTITYSchemaIDENTITYClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v34, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDENTITYSchemaIDENTITYClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IDENTITYSchemaIDENTITYClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[IDENTITYSchemaIDENTITYClientEvent scoreCardsGenerated](self, "scoreCardsGenerated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IDENTITYSchemaIDENTITYClientEvent deleteScoreCardsGenerated](self, "deleteScoreCardsGenerated");
  -[IDENTITYSchemaIDENTITYClientEvent entityKitRequestContext](self, "entityKitRequestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IDENTITYSchemaIDENTITYClientEvent deleteEntityKitRequestContext](self, "deleteEntityKitRequestContext");
  -[IDENTITYSchemaIDENTITYClientEvent firstVoiceIdSubmitted](self, "firstVoiceIdSubmitted");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[IDENTITYSchemaIDENTITYClientEvent deleteFirstVoiceIdSubmitted](self, "deleteFirstVoiceIdSubmitted");
  -[IDENTITYSchemaIDENTITYClientEvent firstIdentityReceived](self, "firstIdentityReceived");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[IDENTITYSchemaIDENTITYClientEvent deleteFirstIdentityReceived](self, "deleteFirstIdentityReceived");
  -[IDENTITYSchemaIDENTITYClientEvent resultCandidateReceived](self, "resultCandidateReceived");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[IDENTITYSchemaIDENTITYClientEvent deleteResultCandidateReceived](self, "deleteResultCandidateReceived");
  -[IDENTITYSchemaIDENTITYClientEvent userPresenceSourceCaptured](self, "userPresenceSourceCaptured");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[IDENTITYSchemaIDENTITYClientEvent deleteUserPresenceSourceCaptured](self, "deleteUserPresenceSourceCaptured");
  -[IDENTITYSchemaIDENTITYClientEvent userDisambiguationDecisionReported](self, "userDisambiguationDecisionReported");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[IDENTITYSchemaIDENTITYClientEvent deleteUserDisambiguationDecisionReported](self, "deleteUserDisambiguationDecisionReported");
  -[IDENTITYSchemaIDENTITYClientEvent usersPresencesCaptured](self, "usersPresencesCaptured");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[IDENTITYSchemaIDENTITYClientEvent deleteUsersPresencesCaptured](self, "deleteUsersPresencesCaptured");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[IDENTITYSchemaIDENTITYClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 2 > 7)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E56296E8[v3 - 2]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 7)
    return 0;
  else
    return off_1E5629728[a3 - 2];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[IDENTITYSchemaIDENTITYClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 2 > 7)
    return CFSTR("com.apple.aiml.siri.identity.IDENTITYClientEvent");
  else
    return off_1E563A080[v2 - 2];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[IDENTITYSchemaIDENTITYClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setScoreCardsGenerated:(id)a3
{
  IDENTITYSchemaIDENTITYScoreCardsGenerated *v4;
  IDENTITYSchemaIDENTITYIdentityRequestContext *entityKitRequestContext;
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *firstVoiceIdSubmitted;
  IDENTITYSchemaIDENTITYFirstIdentityReceived *firstIdentityReceived;
  IDENTITYSchemaIDENTITYResultCandidateReceived *resultCandidateReceived;
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *userPresenceSourceCaptured;
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *userDisambiguationDecisionReported;
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *usersPresencesCaptured;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *scoreCardsGenerated;

  v4 = (IDENTITYSchemaIDENTITYScoreCardsGenerated *)a3;
  entityKitRequestContext = self->_entityKitRequestContext;
  self->_entityKitRequestContext = 0;

  firstVoiceIdSubmitted = self->_firstVoiceIdSubmitted;
  self->_firstVoiceIdSubmitted = 0;

  firstIdentityReceived = self->_firstIdentityReceived;
  self->_firstIdentityReceived = 0;

  resultCandidateReceived = self->_resultCandidateReceived;
  self->_resultCandidateReceived = 0;

  userPresenceSourceCaptured = self->_userPresenceSourceCaptured;
  self->_userPresenceSourceCaptured = 0;

  userDisambiguationDecisionReported = self->_userDisambiguationDecisionReported;
  self->_userDisambiguationDecisionReported = 0;

  usersPresencesCaptured = self->_usersPresencesCaptured;
  self->_usersPresencesCaptured = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  scoreCardsGenerated = self->_scoreCardsGenerated;
  self->_scoreCardsGenerated = v4;

}

- (IDENTITYSchemaIDENTITYScoreCardsGenerated)scoreCardsGenerated
{
  if (self->_whichEvent_Type == 2)
    return self->_scoreCardsGenerated;
  else
    return (IDENTITYSchemaIDENTITYScoreCardsGenerated *)0;
}

- (void)deleteScoreCardsGenerated
{
  IDENTITYSchemaIDENTITYScoreCardsGenerated *scoreCardsGenerated;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    scoreCardsGenerated = self->_scoreCardsGenerated;
    self->_scoreCardsGenerated = 0;

  }
}

- (void)setEntityKitRequestContext:(id)a3
{
  IDENTITYSchemaIDENTITYIdentityRequestContext *v4;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *scoreCardsGenerated;
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *firstVoiceIdSubmitted;
  IDENTITYSchemaIDENTITYFirstIdentityReceived *firstIdentityReceived;
  IDENTITYSchemaIDENTITYResultCandidateReceived *resultCandidateReceived;
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *userPresenceSourceCaptured;
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *userDisambiguationDecisionReported;
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *usersPresencesCaptured;
  unint64_t v12;
  IDENTITYSchemaIDENTITYIdentityRequestContext *entityKitRequestContext;

  v4 = (IDENTITYSchemaIDENTITYIdentityRequestContext *)a3;
  scoreCardsGenerated = self->_scoreCardsGenerated;
  self->_scoreCardsGenerated = 0;

  firstVoiceIdSubmitted = self->_firstVoiceIdSubmitted;
  self->_firstVoiceIdSubmitted = 0;

  firstIdentityReceived = self->_firstIdentityReceived;
  self->_firstIdentityReceived = 0;

  resultCandidateReceived = self->_resultCandidateReceived;
  self->_resultCandidateReceived = 0;

  userPresenceSourceCaptured = self->_userPresenceSourceCaptured;
  self->_userPresenceSourceCaptured = 0;

  userDisambiguationDecisionReported = self->_userDisambiguationDecisionReported;
  self->_userDisambiguationDecisionReported = 0;

  usersPresencesCaptured = self->_usersPresencesCaptured;
  self->_usersPresencesCaptured = 0;

  v12 = 3;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  entityKitRequestContext = self->_entityKitRequestContext;
  self->_entityKitRequestContext = v4;

}

- (IDENTITYSchemaIDENTITYIdentityRequestContext)entityKitRequestContext
{
  if (self->_whichEvent_Type == 3)
    return self->_entityKitRequestContext;
  else
    return (IDENTITYSchemaIDENTITYIdentityRequestContext *)0;
}

- (void)deleteEntityKitRequestContext
{
  IDENTITYSchemaIDENTITYIdentityRequestContext *entityKitRequestContext;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    entityKitRequestContext = self->_entityKitRequestContext;
    self->_entityKitRequestContext = 0;

  }
}

- (void)setFirstVoiceIdSubmitted:(id)a3
{
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *v4;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *scoreCardsGenerated;
  IDENTITYSchemaIDENTITYIdentityRequestContext *entityKitRequestContext;
  IDENTITYSchemaIDENTITYFirstIdentityReceived *firstIdentityReceived;
  IDENTITYSchemaIDENTITYResultCandidateReceived *resultCandidateReceived;
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *userPresenceSourceCaptured;
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *userDisambiguationDecisionReported;
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *usersPresencesCaptured;
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *firstVoiceIdSubmitted;

  v4 = (IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *)a3;
  scoreCardsGenerated = self->_scoreCardsGenerated;
  self->_scoreCardsGenerated = 0;

  entityKitRequestContext = self->_entityKitRequestContext;
  self->_entityKitRequestContext = 0;

  firstIdentityReceived = self->_firstIdentityReceived;
  self->_firstIdentityReceived = 0;

  resultCandidateReceived = self->_resultCandidateReceived;
  self->_resultCandidateReceived = 0;

  userPresenceSourceCaptured = self->_userPresenceSourceCaptured;
  self->_userPresenceSourceCaptured = 0;

  userDisambiguationDecisionReported = self->_userDisambiguationDecisionReported;
  self->_userDisambiguationDecisionReported = 0;

  usersPresencesCaptured = self->_usersPresencesCaptured;
  self->_usersPresencesCaptured = 0;

  self->_whichEvent_Type = 4 * (v4 != 0);
  firstVoiceIdSubmitted = self->_firstVoiceIdSubmitted;
  self->_firstVoiceIdSubmitted = v4;

}

- (IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted)firstVoiceIdSubmitted
{
  if (self->_whichEvent_Type == 4)
    return self->_firstVoiceIdSubmitted;
  else
    return (IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *)0;
}

- (void)deleteFirstVoiceIdSubmitted
{
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *firstVoiceIdSubmitted;

  if (self->_whichEvent_Type == 4)
  {
    self->_whichEvent_Type = 0;
    firstVoiceIdSubmitted = self->_firstVoiceIdSubmitted;
    self->_firstVoiceIdSubmitted = 0;

  }
}

- (void)setFirstIdentityReceived:(id)a3
{
  IDENTITYSchemaIDENTITYFirstIdentityReceived *v4;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *scoreCardsGenerated;
  IDENTITYSchemaIDENTITYIdentityRequestContext *entityKitRequestContext;
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *firstVoiceIdSubmitted;
  IDENTITYSchemaIDENTITYResultCandidateReceived *resultCandidateReceived;
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *userPresenceSourceCaptured;
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *userDisambiguationDecisionReported;
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *usersPresencesCaptured;
  unint64_t v12;
  IDENTITYSchemaIDENTITYFirstIdentityReceived *firstIdentityReceived;

  v4 = (IDENTITYSchemaIDENTITYFirstIdentityReceived *)a3;
  scoreCardsGenerated = self->_scoreCardsGenerated;
  self->_scoreCardsGenerated = 0;

  entityKitRequestContext = self->_entityKitRequestContext;
  self->_entityKitRequestContext = 0;

  firstVoiceIdSubmitted = self->_firstVoiceIdSubmitted;
  self->_firstVoiceIdSubmitted = 0;

  resultCandidateReceived = self->_resultCandidateReceived;
  self->_resultCandidateReceived = 0;

  userPresenceSourceCaptured = self->_userPresenceSourceCaptured;
  self->_userPresenceSourceCaptured = 0;

  userDisambiguationDecisionReported = self->_userDisambiguationDecisionReported;
  self->_userDisambiguationDecisionReported = 0;

  usersPresencesCaptured = self->_usersPresencesCaptured;
  self->_usersPresencesCaptured = 0;

  v12 = 5;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  firstIdentityReceived = self->_firstIdentityReceived;
  self->_firstIdentityReceived = v4;

}

- (IDENTITYSchemaIDENTITYFirstIdentityReceived)firstIdentityReceived
{
  if (self->_whichEvent_Type == 5)
    return self->_firstIdentityReceived;
  else
    return (IDENTITYSchemaIDENTITYFirstIdentityReceived *)0;
}

- (void)deleteFirstIdentityReceived
{
  IDENTITYSchemaIDENTITYFirstIdentityReceived *firstIdentityReceived;

  if (self->_whichEvent_Type == 5)
  {
    self->_whichEvent_Type = 0;
    firstIdentityReceived = self->_firstIdentityReceived;
    self->_firstIdentityReceived = 0;

  }
}

- (void)setResultCandidateReceived:(id)a3
{
  IDENTITYSchemaIDENTITYResultCandidateReceived *v4;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *scoreCardsGenerated;
  IDENTITYSchemaIDENTITYIdentityRequestContext *entityKitRequestContext;
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *firstVoiceIdSubmitted;
  IDENTITYSchemaIDENTITYFirstIdentityReceived *firstIdentityReceived;
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *userPresenceSourceCaptured;
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *userDisambiguationDecisionReported;
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *usersPresencesCaptured;
  unint64_t v12;
  IDENTITYSchemaIDENTITYResultCandidateReceived *resultCandidateReceived;

  v4 = (IDENTITYSchemaIDENTITYResultCandidateReceived *)a3;
  scoreCardsGenerated = self->_scoreCardsGenerated;
  self->_scoreCardsGenerated = 0;

  entityKitRequestContext = self->_entityKitRequestContext;
  self->_entityKitRequestContext = 0;

  firstVoiceIdSubmitted = self->_firstVoiceIdSubmitted;
  self->_firstVoiceIdSubmitted = 0;

  firstIdentityReceived = self->_firstIdentityReceived;
  self->_firstIdentityReceived = 0;

  userPresenceSourceCaptured = self->_userPresenceSourceCaptured;
  self->_userPresenceSourceCaptured = 0;

  userDisambiguationDecisionReported = self->_userDisambiguationDecisionReported;
  self->_userDisambiguationDecisionReported = 0;

  usersPresencesCaptured = self->_usersPresencesCaptured;
  self->_usersPresencesCaptured = 0;

  v12 = 6;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  resultCandidateReceived = self->_resultCandidateReceived;
  self->_resultCandidateReceived = v4;

}

- (IDENTITYSchemaIDENTITYResultCandidateReceived)resultCandidateReceived
{
  if (self->_whichEvent_Type == 6)
    return self->_resultCandidateReceived;
  else
    return (IDENTITYSchemaIDENTITYResultCandidateReceived *)0;
}

- (void)deleteResultCandidateReceived
{
  IDENTITYSchemaIDENTITYResultCandidateReceived *resultCandidateReceived;

  if (self->_whichEvent_Type == 6)
  {
    self->_whichEvent_Type = 0;
    resultCandidateReceived = self->_resultCandidateReceived;
    self->_resultCandidateReceived = 0;

  }
}

- (void)setUserPresenceSourceCaptured:(id)a3
{
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *v4;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *scoreCardsGenerated;
  IDENTITYSchemaIDENTITYIdentityRequestContext *entityKitRequestContext;
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *firstVoiceIdSubmitted;
  IDENTITYSchemaIDENTITYFirstIdentityReceived *firstIdentityReceived;
  IDENTITYSchemaIDENTITYResultCandidateReceived *resultCandidateReceived;
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *userDisambiguationDecisionReported;
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *usersPresencesCaptured;
  unint64_t v12;
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *userPresenceSourceCaptured;

  v4 = (IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *)a3;
  scoreCardsGenerated = self->_scoreCardsGenerated;
  self->_scoreCardsGenerated = 0;

  entityKitRequestContext = self->_entityKitRequestContext;
  self->_entityKitRequestContext = 0;

  firstVoiceIdSubmitted = self->_firstVoiceIdSubmitted;
  self->_firstVoiceIdSubmitted = 0;

  firstIdentityReceived = self->_firstIdentityReceived;
  self->_firstIdentityReceived = 0;

  resultCandidateReceived = self->_resultCandidateReceived;
  self->_resultCandidateReceived = 0;

  userDisambiguationDecisionReported = self->_userDisambiguationDecisionReported;
  self->_userDisambiguationDecisionReported = 0;

  usersPresencesCaptured = self->_usersPresencesCaptured;
  self->_usersPresencesCaptured = 0;

  v12 = 7;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  userPresenceSourceCaptured = self->_userPresenceSourceCaptured;
  self->_userPresenceSourceCaptured = v4;

}

- (IDENTITYSchemaIDENTITYUserPresenceSourceCaptured)userPresenceSourceCaptured
{
  if (self->_whichEvent_Type == 7)
    return self->_userPresenceSourceCaptured;
  else
    return (IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *)0;
}

- (void)deleteUserPresenceSourceCaptured
{
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *userPresenceSourceCaptured;

  if (self->_whichEvent_Type == 7)
  {
    self->_whichEvent_Type = 0;
    userPresenceSourceCaptured = self->_userPresenceSourceCaptured;
    self->_userPresenceSourceCaptured = 0;

  }
}

- (void)setUserDisambiguationDecisionReported:(id)a3
{
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *v4;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *scoreCardsGenerated;
  IDENTITYSchemaIDENTITYIdentityRequestContext *entityKitRequestContext;
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *firstVoiceIdSubmitted;
  IDENTITYSchemaIDENTITYFirstIdentityReceived *firstIdentityReceived;
  IDENTITYSchemaIDENTITYResultCandidateReceived *resultCandidateReceived;
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *userPresenceSourceCaptured;
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *usersPresencesCaptured;
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *userDisambiguationDecisionReported;

  v4 = (IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *)a3;
  scoreCardsGenerated = self->_scoreCardsGenerated;
  self->_scoreCardsGenerated = 0;

  entityKitRequestContext = self->_entityKitRequestContext;
  self->_entityKitRequestContext = 0;

  firstVoiceIdSubmitted = self->_firstVoiceIdSubmitted;
  self->_firstVoiceIdSubmitted = 0;

  firstIdentityReceived = self->_firstIdentityReceived;
  self->_firstIdentityReceived = 0;

  resultCandidateReceived = self->_resultCandidateReceived;
  self->_resultCandidateReceived = 0;

  userPresenceSourceCaptured = self->_userPresenceSourceCaptured;
  self->_userPresenceSourceCaptured = 0;

  usersPresencesCaptured = self->_usersPresencesCaptured;
  self->_usersPresencesCaptured = 0;

  self->_whichEvent_Type = 8 * (v4 != 0);
  userDisambiguationDecisionReported = self->_userDisambiguationDecisionReported;
  self->_userDisambiguationDecisionReported = v4;

}

- (IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported)userDisambiguationDecisionReported
{
  if (self->_whichEvent_Type == 8)
    return self->_userDisambiguationDecisionReported;
  else
    return (IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *)0;
}

- (void)deleteUserDisambiguationDecisionReported
{
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *userDisambiguationDecisionReported;

  if (self->_whichEvent_Type == 8)
  {
    self->_whichEvent_Type = 0;
    userDisambiguationDecisionReported = self->_userDisambiguationDecisionReported;
    self->_userDisambiguationDecisionReported = 0;

  }
}

- (void)setUsersPresencesCaptured:(id)a3
{
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *v4;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *scoreCardsGenerated;
  IDENTITYSchemaIDENTITYIdentityRequestContext *entityKitRequestContext;
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *firstVoiceIdSubmitted;
  IDENTITYSchemaIDENTITYFirstIdentityReceived *firstIdentityReceived;
  IDENTITYSchemaIDENTITYResultCandidateReceived *resultCandidateReceived;
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *userPresenceSourceCaptured;
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *userDisambiguationDecisionReported;
  unint64_t v12;
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *usersPresencesCaptured;

  v4 = (IDENTITYSchemaIDENTITYUsersPresencesCaptured *)a3;
  scoreCardsGenerated = self->_scoreCardsGenerated;
  self->_scoreCardsGenerated = 0;

  entityKitRequestContext = self->_entityKitRequestContext;
  self->_entityKitRequestContext = 0;

  firstVoiceIdSubmitted = self->_firstVoiceIdSubmitted;
  self->_firstVoiceIdSubmitted = 0;

  firstIdentityReceived = self->_firstIdentityReceived;
  self->_firstIdentityReceived = 0;

  resultCandidateReceived = self->_resultCandidateReceived;
  self->_resultCandidateReceived = 0;

  userPresenceSourceCaptured = self->_userPresenceSourceCaptured;
  self->_userPresenceSourceCaptured = 0;

  userDisambiguationDecisionReported = self->_userDisambiguationDecisionReported;
  self->_userDisambiguationDecisionReported = 0;

  v12 = 9;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  usersPresencesCaptured = self->_usersPresencesCaptured;
  self->_usersPresencesCaptured = v4;

}

- (IDENTITYSchemaIDENTITYUsersPresencesCaptured)usersPresencesCaptured
{
  if (self->_whichEvent_Type == 9)
    return self->_usersPresencesCaptured;
  else
    return (IDENTITYSchemaIDENTITYUsersPresencesCaptured *)0;
}

- (void)deleteUsersPresencesCaptured
{
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *usersPresencesCaptured;

  if (self->_whichEvent_Type == 9)
  {
    self->_whichEvent_Type = 0;
    usersPresencesCaptured = self->_usersPresencesCaptured;
    self->_usersPresencesCaptured = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYClientEventReadFrom(self, (uint64_t)a3);
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
  -[IDENTITYSchemaIDENTITYClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IDENTITYSchemaIDENTITYClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IDENTITYSchemaIDENTITYClientEvent scoreCardsGenerated](self, "scoreCardsGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IDENTITYSchemaIDENTITYClientEvent scoreCardsGenerated](self, "scoreCardsGenerated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IDENTITYSchemaIDENTITYClientEvent entityKitRequestContext](self, "entityKitRequestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IDENTITYSchemaIDENTITYClientEvent entityKitRequestContext](self, "entityKitRequestContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IDENTITYSchemaIDENTITYClientEvent firstVoiceIdSubmitted](self, "firstVoiceIdSubmitted");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IDENTITYSchemaIDENTITYClientEvent firstVoiceIdSubmitted](self, "firstVoiceIdSubmitted");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IDENTITYSchemaIDENTITYClientEvent firstIdentityReceived](self, "firstIdentityReceived");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[IDENTITYSchemaIDENTITYClientEvent firstIdentityReceived](self, "firstIdentityReceived");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IDENTITYSchemaIDENTITYClientEvent resultCandidateReceived](self, "resultCandidateReceived");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IDENTITYSchemaIDENTITYClientEvent resultCandidateReceived](self, "resultCandidateReceived");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IDENTITYSchemaIDENTITYClientEvent userPresenceSourceCaptured](self, "userPresenceSourceCaptured");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[IDENTITYSchemaIDENTITYClientEvent userPresenceSourceCaptured](self, "userPresenceSourceCaptured");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IDENTITYSchemaIDENTITYClientEvent userDisambiguationDecisionReported](self, "userDisambiguationDecisionReported");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[IDENTITYSchemaIDENTITYClientEvent userDisambiguationDecisionReported](self, "userDisambiguationDecisionReported");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IDENTITYSchemaIDENTITYClientEvent usersPresencesCaptured](self, "usersPresencesCaptured");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[IDENTITYSchemaIDENTITYClientEvent usersPresencesCaptured](self, "usersPresencesCaptured");
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
  -[IDENTITYSchemaIDENTITYClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[IDENTITYSchemaIDENTITYClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IDENTITYSchemaIDENTITYClientEvent eventMetadata](self, "eventMetadata");
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
  -[IDENTITYSchemaIDENTITYClientEvent scoreCardsGenerated](self, "scoreCardsGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scoreCardsGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[IDENTITYSchemaIDENTITYClientEvent scoreCardsGenerated](self, "scoreCardsGenerated");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IDENTITYSchemaIDENTITYClientEvent scoreCardsGenerated](self, "scoreCardsGenerated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scoreCardsGenerated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_48;
  }
  else
  {

  }
  -[IDENTITYSchemaIDENTITYClientEvent entityKitRequestContext](self, "entityKitRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityKitRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[IDENTITYSchemaIDENTITYClientEvent entityKitRequestContext](self, "entityKitRequestContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[IDENTITYSchemaIDENTITYClientEvent entityKitRequestContext](self, "entityKitRequestContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityKitRequestContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_48;
  }
  else
  {

  }
  -[IDENTITYSchemaIDENTITYClientEvent firstVoiceIdSubmitted](self, "firstVoiceIdSubmitted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstVoiceIdSubmitted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[IDENTITYSchemaIDENTITYClientEvent firstVoiceIdSubmitted](self, "firstVoiceIdSubmitted");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[IDENTITYSchemaIDENTITYClientEvent firstVoiceIdSubmitted](self, "firstVoiceIdSubmitted");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstVoiceIdSubmitted");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_48;
  }
  else
  {

  }
  -[IDENTITYSchemaIDENTITYClientEvent firstIdentityReceived](self, "firstIdentityReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstIdentityReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[IDENTITYSchemaIDENTITYClientEvent firstIdentityReceived](self, "firstIdentityReceived");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[IDENTITYSchemaIDENTITYClientEvent firstIdentityReceived](self, "firstIdentityReceived");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstIdentityReceived");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_48;
  }
  else
  {

  }
  -[IDENTITYSchemaIDENTITYClientEvent resultCandidateReceived](self, "resultCandidateReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultCandidateReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[IDENTITYSchemaIDENTITYClientEvent resultCandidateReceived](self, "resultCandidateReceived");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[IDENTITYSchemaIDENTITYClientEvent resultCandidateReceived](self, "resultCandidateReceived");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultCandidateReceived");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_48;
  }
  else
  {

  }
  -[IDENTITYSchemaIDENTITYClientEvent userPresenceSourceCaptured](self, "userPresenceSourceCaptured");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userPresenceSourceCaptured");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[IDENTITYSchemaIDENTITYClientEvent userPresenceSourceCaptured](self, "userPresenceSourceCaptured");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[IDENTITYSchemaIDENTITYClientEvent userPresenceSourceCaptured](self, "userPresenceSourceCaptured");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userPresenceSourceCaptured");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_48;
  }
  else
  {

  }
  -[IDENTITYSchemaIDENTITYClientEvent userDisambiguationDecisionReported](self, "userDisambiguationDecisionReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDisambiguationDecisionReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[IDENTITYSchemaIDENTITYClientEvent userDisambiguationDecisionReported](self, "userDisambiguationDecisionReported");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[IDENTITYSchemaIDENTITYClientEvent userDisambiguationDecisionReported](self, "userDisambiguationDecisionReported");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userDisambiguationDecisionReported");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_48;
  }
  else
  {

  }
  -[IDENTITYSchemaIDENTITYClientEvent usersPresencesCaptured](self, "usersPresencesCaptured");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usersPresencesCaptured");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IDENTITYSchemaIDENTITYClientEvent usersPresencesCaptured](self, "usersPresencesCaptured");
    v48 = objc_claimAutoreleasedReturnValue();
    if (!v48)
    {

LABEL_51:
      v53 = 1;
      goto LABEL_49;
    }
    v49 = (void *)v48;
    -[IDENTITYSchemaIDENTITYClientEvent usersPresencesCaptured](self, "usersPresencesCaptured");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usersPresencesCaptured");
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

  v3 = -[IDENTITYSchemaIDENTITYClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[IDENTITYSchemaIDENTITYScoreCardsGenerated hash](self->_scoreCardsGenerated, "hash") ^ v3;
  v5 = -[IDENTITYSchemaIDENTITYIdentityRequestContext hash](self->_entityKitRequestContext, "hash");
  v6 = v4 ^ v5 ^ -[IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted hash](self->_firstVoiceIdSubmitted, "hash");
  v7 = -[IDENTITYSchemaIDENTITYFirstIdentityReceived hash](self->_firstIdentityReceived, "hash");
  v8 = v7 ^ -[IDENTITYSchemaIDENTITYResultCandidateReceived hash](self->_resultCandidateReceived, "hash");
  v9 = v6 ^ v8 ^ -[IDENTITYSchemaIDENTITYUserPresenceSourceCaptured hash](self->_userPresenceSourceCaptured, "hash");
  v10 = -[IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported hash](self->_userDisambiguationDecisionReported, "hash");
  return v9 ^ v10 ^ -[IDENTITYSchemaIDENTITYUsersPresencesCaptured hash](self->_usersPresencesCaptured, "hash");
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
  if (self->_entityKitRequestContext)
  {
    -[IDENTITYSchemaIDENTITYClientEvent entityKitRequestContext](self, "entityKitRequestContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityKitRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("entityKitRequestContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[IDENTITYSchemaIDENTITYClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_firstIdentityReceived)
  {
    -[IDENTITYSchemaIDENTITYClientEvent firstIdentityReceived](self, "firstIdentityReceived");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("firstIdentityReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("firstIdentityReceived"));

    }
  }
  if (self->_firstVoiceIdSubmitted)
  {
    -[IDENTITYSchemaIDENTITYClientEvent firstVoiceIdSubmitted](self, "firstVoiceIdSubmitted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("firstVoiceIdSubmitted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("firstVoiceIdSubmitted"));

    }
  }
  if (self->_resultCandidateReceived)
  {
    -[IDENTITYSchemaIDENTITYClientEvent resultCandidateReceived](self, "resultCandidateReceived");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("resultCandidateReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("resultCandidateReceived"));

    }
  }
  if (self->_scoreCardsGenerated)
  {
    -[IDENTITYSchemaIDENTITYClientEvent scoreCardsGenerated](self, "scoreCardsGenerated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("scoreCardsGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("scoreCardsGenerated"));

    }
  }
  if (self->_userDisambiguationDecisionReported)
  {
    -[IDENTITYSchemaIDENTITYClientEvent userDisambiguationDecisionReported](self, "userDisambiguationDecisionReported");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("userDisambiguationDecisionReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("userDisambiguationDecisionReported"));

    }
  }
  if (self->_userPresenceSourceCaptured)
  {
    -[IDENTITYSchemaIDENTITYClientEvent userPresenceSourceCaptured](self, "userPresenceSourceCaptured");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("userPresenceSourceCaptured"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("userPresenceSourceCaptured"));

    }
  }
  if (self->_usersPresencesCaptured)
  {
    -[IDENTITYSchemaIDENTITYClientEvent usersPresencesCaptured](self, "usersPresencesCaptured");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("usersPresencesCaptured"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("usersPresencesCaptured"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IDENTITYSchemaIDENTITYClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IDENTITYSchemaIDENTITYClientEvent)initWithJSON:(id)a3
{
  void *v4;
  IDENTITYSchemaIDENTITYClientEvent *v5;
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
    self = -[IDENTITYSchemaIDENTITYClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IDENTITYSchemaIDENTITYClientEvent)initWithDictionary:(id)a3
{
  id v4;
  IDENTITYSchemaIDENTITYClientEvent *v5;
  uint64_t v6;
  IDENTITYSchemaIDENTITYClientEventMetadata *v7;
  uint64_t v8;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *v9;
  void *v10;
  IDENTITYSchemaIDENTITYIdentityRequestContext *v11;
  void *v12;
  IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted *v13;
  void *v14;
  IDENTITYSchemaIDENTITYFirstIdentityReceived *v15;
  void *v16;
  IDENTITYSchemaIDENTITYResultCandidateReceived *v17;
  void *v18;
  IDENTITYSchemaIDENTITYUserPresenceSourceCaptured *v19;
  void *v20;
  IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported *v21;
  void *v22;
  IDENTITYSchemaIDENTITYUsersPresencesCaptured *v23;
  IDENTITYSchemaIDENTITYClientEvent *v24;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IDENTITYSchemaIDENTITYClientEvent;
  v5 = -[IDENTITYSchemaIDENTITYClientEvent init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IDENTITYSchemaIDENTITYClientEventMetadata initWithDictionary:]([IDENTITYSchemaIDENTITYClientEventMetadata alloc], "initWithDictionary:", v6);
      -[IDENTITYSchemaIDENTITYClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    v27 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scoreCardsGenerated"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IDENTITYSchemaIDENTITYScoreCardsGenerated initWithDictionary:]([IDENTITYSchemaIDENTITYScoreCardsGenerated alloc], "initWithDictionary:", v8);
      -[IDENTITYSchemaIDENTITYClientEvent setScoreCardsGenerated:](v5, "setScoreCardsGenerated:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityKitRequestContext"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[IDENTITYSchemaIDENTITYIdentityRequestContext initWithDictionary:]([IDENTITYSchemaIDENTITYIdentityRequestContext alloc], "initWithDictionary:", v10);
      -[IDENTITYSchemaIDENTITYClientEvent setEntityKitRequestContext:](v5, "setEntityKitRequestContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstVoiceIdSubmitted"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted initWithDictionary:]([IDENTITYSchemaIDENTITYFirstVoiceObservationSubmitted alloc], "initWithDictionary:", v12);
      -[IDENTITYSchemaIDENTITYClientEvent setFirstVoiceIdSubmitted:](v5, "setFirstVoiceIdSubmitted:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstIdentityReceived"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[IDENTITYSchemaIDENTITYFirstIdentityReceived initWithDictionary:]([IDENTITYSchemaIDENTITYFirstIdentityReceived alloc], "initWithDictionary:", v14);
      -[IDENTITYSchemaIDENTITYClientEvent setFirstIdentityReceived:](v5, "setFirstIdentityReceived:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultCandidateReceived"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[IDENTITYSchemaIDENTITYResultCandidateReceived initWithDictionary:]([IDENTITYSchemaIDENTITYResultCandidateReceived alloc], "initWithDictionary:", v16);
      -[IDENTITYSchemaIDENTITYClientEvent setResultCandidateReceived:](v5, "setResultCandidateReceived:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPresenceSourceCaptured"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[IDENTITYSchemaIDENTITYUserPresenceSourceCaptured initWithDictionary:]([IDENTITYSchemaIDENTITYUserPresenceSourceCaptured alloc], "initWithDictionary:", v18);
      -[IDENTITYSchemaIDENTITYClientEvent setUserPresenceSourceCaptured:](v5, "setUserPresenceSourceCaptured:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userDisambiguationDecisionReported"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported initWithDictionary:]([IDENTITYSchemaIDENTITYAskUserForDisambiguationDecisionReported alloc], "initWithDictionary:", v20);
      -[IDENTITYSchemaIDENTITYClientEvent setUserDisambiguationDecisionReported:](v5, "setUserDisambiguationDecisionReported:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usersPresencesCaptured"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[IDENTITYSchemaIDENTITYUsersPresencesCaptured initWithDictionary:]([IDENTITYSchemaIDENTITYUsersPresencesCaptured alloc], "initWithDictionary:", v22);
      -[IDENTITYSchemaIDENTITYClientEvent setUsersPresencesCaptured:](v5, "setUsersPresencesCaptured:", v23);

    }
    v24 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (IDENTITYSchemaIDENTITYClientEventMetadata)eventMetadata
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

- (BOOL)hasScoreCardsGenerated
{
  return self->_hasScoreCardsGenerated;
}

- (void)setHasScoreCardsGenerated:(BOOL)a3
{
  self->_hasScoreCardsGenerated = a3;
}

- (BOOL)hasEntityKitRequestContext
{
  return self->_hasEntityKitRequestContext;
}

- (void)setHasEntityKitRequestContext:(BOOL)a3
{
  self->_hasEntityKitRequestContext = a3;
}

- (BOOL)hasFirstVoiceIdSubmitted
{
  return self->_hasFirstVoiceIdSubmitted;
}

- (void)setHasFirstVoiceIdSubmitted:(BOOL)a3
{
  self->_hasFirstVoiceIdSubmitted = a3;
}

- (BOOL)hasFirstIdentityReceived
{
  return self->_hasFirstIdentityReceived;
}

- (void)setHasFirstIdentityReceived:(BOOL)a3
{
  self->_hasFirstIdentityReceived = a3;
}

- (BOOL)hasResultCandidateReceived
{
  return self->_hasResultCandidateReceived;
}

- (void)setHasResultCandidateReceived:(BOOL)a3
{
  self->_hasResultCandidateReceived = a3;
}

- (BOOL)hasUserPresenceSourceCaptured
{
  return self->_hasUserPresenceSourceCaptured;
}

- (void)setHasUserPresenceSourceCaptured:(BOOL)a3
{
  self->_hasUserPresenceSourceCaptured = a3;
}

- (BOOL)hasUserDisambiguationDecisionReported
{
  return self->_hasUserDisambiguationDecisionReported;
}

- (void)setHasUserDisambiguationDecisionReported:(BOOL)a3
{
  self->_hasUserDisambiguationDecisionReported = a3;
}

- (BOOL)hasUsersPresencesCaptured
{
  return self->_hasUsersPresencesCaptured;
}

- (void)setHasUsersPresencesCaptured:(BOOL)a3
{
  self->_hasUsersPresencesCaptured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usersPresencesCaptured, 0);
  objc_storeStrong((id *)&self->_userDisambiguationDecisionReported, 0);
  objc_storeStrong((id *)&self->_userPresenceSourceCaptured, 0);
  objc_storeStrong((id *)&self->_resultCandidateReceived, 0);
  objc_storeStrong((id *)&self->_firstIdentityReceived, 0);
  objc_storeStrong((id *)&self->_firstVoiceIdSubmitted, 0);
  objc_storeStrong((id *)&self->_entityKitRequestContext, 0);
  objc_storeStrong((id *)&self->_scoreCardsGenerated, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 73;
}

@end
