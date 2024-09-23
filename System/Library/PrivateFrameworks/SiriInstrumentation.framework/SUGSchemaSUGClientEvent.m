@implementation SUGSchemaSUGClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[SUGSchemaSUGClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sugId");
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
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SUGSchemaSUGClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v46, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[SUGSchemaSUGClientEvent deleteSugGeneratedTier1](self, "deleteSugGeneratedTier1");
    -[SUGSchemaSUGClientEvent deleteUiActivityTier1](self, "deleteUiActivityTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[SUGSchemaSUGClientEvent deleteSugGeneratedTier1](self, "deleteSugGeneratedTier1");
    -[SUGSchemaSUGClientEvent deleteUiActivityTier1](self, "deleteUiActivityTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[SUGSchemaSUGClientEvent deleteSugGeneratedTier1](self, "deleteSugGeneratedTier1");
    -[SUGSchemaSUGClientEvent deleteUiActivityTier1](self, "deleteUiActivityTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[SUGSchemaSUGClientEvent deleteSugGeneratedTier1](self, "deleteSugGeneratedTier1");
    -[SUGSchemaSUGClientEvent deleteUiActivityTier1](self, "deleteUiActivityTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[SUGSchemaSUGClientEvent deleteSugGeneratedTier1](self, "deleteSugGeneratedTier1");
    -[SUGSchemaSUGClientEvent deleteUiActivityTier1](self, "deleteUiActivityTier1");
  }
  -[SUGSchemaSUGClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SUGSchemaSUGClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[SUGSchemaSUGClientEvent suggestionsGenerated](self, "suggestionsGenerated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SUGSchemaSUGClientEvent deleteSuggestionsGenerated](self, "deleteSuggestionsGenerated");
  -[SUGSchemaSUGClientEvent engagementReported](self, "engagementReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SUGSchemaSUGClientEvent deleteEngagementReported](self, "deleteEngagementReported");
  -[SUGSchemaSUGClientEvent requestContext](self, "requestContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SUGSchemaSUGClientEvent deleteRequestContext](self, "deleteRequestContext");
  -[SUGSchemaSUGClientEvent generationStepContext](self, "generationStepContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[SUGSchemaSUGClientEvent deleteGenerationStepContext](self, "deleteGenerationStepContext");
  -[SUGSchemaSUGClientEvent resolutionStepContext](self, "resolutionStepContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[SUGSchemaSUGClientEvent deleteResolutionStepContext](self, "deleteResolutionStepContext");
  -[SUGSchemaSUGClientEvent filteringStepContext](self, "filteringStepContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[SUGSchemaSUGClientEvent deleteFilteringStepContext](self, "deleteFilteringStepContext");
  -[SUGSchemaSUGClientEvent rankingStepContext](self, "rankingStepContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[SUGSchemaSUGClientEvent deleteRankingStepContext](self, "deleteRankingStepContext");
  -[SUGSchemaSUGClientEvent engagementMetricReported](self, "engagementMetricReported");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[SUGSchemaSUGClientEvent deleteEngagementMetricReported](self, "deleteEngagementMetricReported");
  -[SUGSchemaSUGClientEvent uiActivity](self, "uiActivity");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[SUGSchemaSUGClientEvent deleteUiActivity](self, "deleteUiActivity");
  -[SUGSchemaSUGClientEvent typingWindowEnded](self, "typingWindowEnded");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[SUGSchemaSUGClientEvent deleteTypingWindowEnded](self, "deleteTypingWindowEnded");
  -[SUGSchemaSUGClientEvent sugGeneratedTier1](self, "sugGeneratedTier1");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[SUGSchemaSUGClientEvent deleteSugGeneratedTier1](self, "deleteSugGeneratedTier1");
  -[SUGSchemaSUGClientEvent uiActivityTier1](self, "uiActivityTier1");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[SUGSchemaSUGClientEvent deleteUiActivityTier1](self, "deleteUiActivityTier1");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[SUGSchemaSUGClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 0xB)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AE28[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0xB)
    return 0;
  else
    return off_1E562AE88[a3 - 101];
}

- (int)clockIsolationLevel
{
  if (-[SUGSchemaSUGClientEvent whichEvent_Type](self, "whichEvent_Type") == 102)
    return 2;
  else
    return 1;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[SUGSchemaSUGClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 0xB)
    return CFSTR("com.apple.aiml.siri.sug.SUGClientEvent");
  else
    return off_1E56381F0[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[SUGSchemaSUGClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setSuggestionsGenerated:(id)a3
{
  SUGSchemaSUGSuggestionsGenerated *v4;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;

  v4 = (SUGSchemaSUGSuggestionsGenerated *)a3;
  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 101;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = v4;

}

- (SUGSchemaSUGSuggestionsGenerated)suggestionsGenerated
{
  if (self->_whichEvent_Type == 101)
    return self->_suggestionsGenerated;
  else
    return (SUGSchemaSUGSuggestionsGenerated *)0;
}

- (void)deleteSuggestionsGenerated
{
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    suggestionsGenerated = self->_suggestionsGenerated;
    self->_suggestionsGenerated = 0;

  }
}

- (void)setEngagementReported:(id)a3
{
  SUGSchemaSUGEngagementReported *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGEngagementReported *engagementReported;

  v4 = (SUGSchemaSUGEngagementReported *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 102;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  engagementReported = self->_engagementReported;
  self->_engagementReported = v4;

}

- (SUGSchemaSUGEngagementReported)engagementReported
{
  if (self->_whichEvent_Type == 102)
    return self->_engagementReported;
  else
    return (SUGSchemaSUGEngagementReported *)0;
}

- (void)deleteEngagementReported
{
  SUGSchemaSUGEngagementReported *engagementReported;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    engagementReported = self->_engagementReported;
    self->_engagementReported = 0;

  }
}

- (void)setRequestContext:(id)a3
{
  SUGSchemaSUGRequestContext *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGRequestContext *requestContext;

  v4 = (SUGSchemaSUGRequestContext *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 103;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  requestContext = self->_requestContext;
  self->_requestContext = v4;

}

- (SUGSchemaSUGRequestContext)requestContext
{
  if (self->_whichEvent_Type == 103)
    return self->_requestContext;
  else
    return (SUGSchemaSUGRequestContext *)0;
}

- (void)deleteRequestContext
{
  SUGSchemaSUGRequestContext *requestContext;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    requestContext = self->_requestContext;
    self->_requestContext = 0;

  }
}

- (void)setGenerationStepContext:(id)a3
{
  SUGSchemaSUGGenerationStepContext *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGGenerationStepContext *generationStepContext;

  v4 = (SUGSchemaSUGGenerationStepContext *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 104;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = v4;

}

- (SUGSchemaSUGGenerationStepContext)generationStepContext
{
  if (self->_whichEvent_Type == 104)
    return self->_generationStepContext;
  else
    return (SUGSchemaSUGGenerationStepContext *)0;
}

- (void)deleteGenerationStepContext
{
  SUGSchemaSUGGenerationStepContext *generationStepContext;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    generationStepContext = self->_generationStepContext;
    self->_generationStepContext = 0;

  }
}

- (void)setResolutionStepContext:(id)a3
{
  SUGSchemaSUGResolutionStepContext *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;

  v4 = (SUGSchemaSUGResolutionStepContext *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 105;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = v4;

}

- (SUGSchemaSUGResolutionStepContext)resolutionStepContext
{
  if (self->_whichEvent_Type == 105)
    return self->_resolutionStepContext;
  else
    return (SUGSchemaSUGResolutionStepContext *)0;
}

- (void)deleteResolutionStepContext
{
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    resolutionStepContext = self->_resolutionStepContext;
    self->_resolutionStepContext = 0;

  }
}

- (void)setFilteringStepContext:(id)a3
{
  SUGSchemaSUGFilteringStepContext *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;

  v4 = (SUGSchemaSUGFilteringStepContext *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 106;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = v4;

}

- (SUGSchemaSUGFilteringStepContext)filteringStepContext
{
  if (self->_whichEvent_Type == 106)
    return self->_filteringStepContext;
  else
    return (SUGSchemaSUGFilteringStepContext *)0;
}

- (void)deleteFilteringStepContext
{
  SUGSchemaSUGFilteringStepContext *filteringStepContext;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    filteringStepContext = self->_filteringStepContext;
    self->_filteringStepContext = 0;

  }
}

- (void)setRankingStepContext:(id)a3
{
  SUGSchemaSUGRankingStepContext *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGRankingStepContext *rankingStepContext;

  v4 = (SUGSchemaSUGRankingStepContext *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 107;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = v4;

}

- (SUGSchemaSUGRankingStepContext)rankingStepContext
{
  if (self->_whichEvent_Type == 107)
    return self->_rankingStepContext;
  else
    return (SUGSchemaSUGRankingStepContext *)0;
}

- (void)deleteRankingStepContext
{
  SUGSchemaSUGRankingStepContext *rankingStepContext;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    rankingStepContext = self->_rankingStepContext;
    self->_rankingStepContext = 0;

  }
}

- (void)setEngagementMetricReported:(id)a3
{
  SUGSchemaSUGEngagementMetricReported *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;

  v4 = (SUGSchemaSUGEngagementMetricReported *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 108;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = v4;

}

- (SUGSchemaSUGEngagementMetricReported)engagementMetricReported
{
  if (self->_whichEvent_Type == 108)
    return self->_engagementMetricReported;
  else
    return (SUGSchemaSUGEngagementMetricReported *)0;
}

- (void)deleteEngagementMetricReported
{
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    engagementMetricReported = self->_engagementMetricReported;
    self->_engagementMetricReported = 0;

  }
}

- (void)setUiActivity:(id)a3
{
  SUGSchemaSUGSuggestionsUIActivity *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;

  v4 = (SUGSchemaSUGSuggestionsUIActivity *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 109;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  uiActivity = self->_uiActivity;
  self->_uiActivity = v4;

}

- (SUGSchemaSUGSuggestionsUIActivity)uiActivity
{
  if (self->_whichEvent_Type == 109)
    return self->_uiActivity;
  else
    return (SUGSchemaSUGSuggestionsUIActivity *)0;
}

- (void)deleteUiActivity
{
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    uiActivity = self->_uiActivity;
    self->_uiActivity = 0;

  }
}

- (void)setTypingWindowEnded:(id)a3
{
  SUGSchemaSUGTypingWindowEnded *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;

  v4 = (SUGSchemaSUGTypingWindowEnded *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 110;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = v4;

}

- (SUGSchemaSUGTypingWindowEnded)typingWindowEnded
{
  if (self->_whichEvent_Type == 110)
    return self->_typingWindowEnded;
  else
    return (SUGSchemaSUGTypingWindowEnded *)0;
}

- (void)deleteTypingWindowEnded
{
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    typingWindowEnded = self->_typingWindowEnded;
    self->_typingWindowEnded = 0;

  }
}

- (void)setSugGeneratedTier1:(id)a3
{
  SUGSchemaSUGSuggestionsGeneratedTier1 *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;
  unint64_t v16;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;

  v4 = (SUGSchemaSUGSuggestionsGeneratedTier1 *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  v16 = 111;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = v4;

}

- (SUGSchemaSUGSuggestionsGeneratedTier1)sugGeneratedTier1
{
  if (self->_whichEvent_Type == 111)
    return self->_sugGeneratedTier1;
  else
    return (SUGSchemaSUGSuggestionsGeneratedTier1 *)0;
}

- (void)deleteSugGeneratedTier1
{
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    sugGeneratedTier1 = self->_sugGeneratedTier1;
    self->_sugGeneratedTier1 = 0;

  }
}

- (void)setUiActivityTier1:(id)a3
{
  SUGSchemaSUGSuggestionsUIActivityTier1 *v4;
  SUGSchemaSUGSuggestionsGenerated *suggestionsGenerated;
  SUGSchemaSUGEngagementReported *engagementReported;
  SUGSchemaSUGRequestContext *requestContext;
  SUGSchemaSUGGenerationStepContext *generationStepContext;
  SUGSchemaSUGResolutionStepContext *resolutionStepContext;
  SUGSchemaSUGFilteringStepContext *filteringStepContext;
  SUGSchemaSUGRankingStepContext *rankingStepContext;
  SUGSchemaSUGEngagementMetricReported *engagementMetricReported;
  SUGSchemaSUGSuggestionsUIActivity *uiActivity;
  SUGSchemaSUGTypingWindowEnded *typingWindowEnded;
  SUGSchemaSUGSuggestionsGeneratedTier1 *sugGeneratedTier1;
  unint64_t v16;
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;

  v4 = (SUGSchemaSUGSuggestionsUIActivityTier1 *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  v16 = 112;
  if (!v4)
    v16 = 0;
  self->_whichEvent_Type = v16;
  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = v4;

}

- (SUGSchemaSUGSuggestionsUIActivityTier1)uiActivityTier1
{
  if (self->_whichEvent_Type == 112)
    return self->_uiActivityTier1;
  else
    return (SUGSchemaSUGSuggestionsUIActivityTier1 *)0;
}

- (void)deleteUiActivityTier1
{
  SUGSchemaSUGSuggestionsUIActivityTier1 *uiActivityTier1;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    uiActivityTier1 = self->_uiActivityTier1;
    self->_uiActivityTier1 = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGClientEventReadFrom(self, (uint64_t)a3);
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  -[SUGSchemaSUGClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUGSchemaSUGClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent suggestionsGenerated](self, "suggestionsGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUGSchemaSUGClientEvent suggestionsGenerated](self, "suggestionsGenerated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent engagementReported](self, "engagementReported");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUGSchemaSUGClientEvent engagementReported](self, "engagementReported");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent requestContext](self, "requestContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUGSchemaSUGClientEvent requestContext](self, "requestContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent generationStepContext](self, "generationStepContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUGSchemaSUGClientEvent generationStepContext](self, "generationStepContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent resolutionStepContext](self, "resolutionStepContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SUGSchemaSUGClientEvent resolutionStepContext](self, "resolutionStepContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent filteringStepContext](self, "filteringStepContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SUGSchemaSUGClientEvent filteringStepContext](self, "filteringStepContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent rankingStepContext](self, "rankingStepContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SUGSchemaSUGClientEvent rankingStepContext](self, "rankingStepContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent engagementMetricReported](self, "engagementMetricReported");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[SUGSchemaSUGClientEvent engagementMetricReported](self, "engagementMetricReported");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent uiActivity](self, "uiActivity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[SUGSchemaSUGClientEvent uiActivity](self, "uiActivity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent typingWindowEnded](self, "typingWindowEnded");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SUGSchemaSUGClientEvent typingWindowEnded](self, "typingWindowEnded");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent sugGeneratedTier1](self, "sugGeneratedTier1");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[SUGSchemaSUGClientEvent sugGeneratedTier1](self, "sugGeneratedTier1");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGClientEvent uiActivityTier1](self, "uiActivityTier1");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SUGSchemaSUGClientEvent uiActivityTier1](self, "uiActivityTier1");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  BOOL v73;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_68;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_68;
  -[SUGSchemaSUGClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SUGSchemaSUGClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent suggestionsGenerated](self, "suggestionsGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionsGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent suggestionsGenerated](self, "suggestionsGenerated");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SUGSchemaSUGClientEvent suggestionsGenerated](self, "suggestionsGenerated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionsGenerated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent engagementReported](self, "engagementReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engagementReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent engagementReported](self, "engagementReported");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SUGSchemaSUGClientEvent engagementReported](self, "engagementReported");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "engagementReported");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent requestContext](self, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent requestContext](self, "requestContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[SUGSchemaSUGClientEvent requestContext](self, "requestContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent generationStepContext](self, "generationStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generationStepContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent generationStepContext](self, "generationStepContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[SUGSchemaSUGClientEvent generationStepContext](self, "generationStepContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generationStepContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent resolutionStepContext](self, "resolutionStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolutionStepContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent resolutionStepContext](self, "resolutionStepContext");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[SUGSchemaSUGClientEvent resolutionStepContext](self, "resolutionStepContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolutionStepContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent filteringStepContext](self, "filteringStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteringStepContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent filteringStepContext](self, "filteringStepContext");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[SUGSchemaSUGClientEvent filteringStepContext](self, "filteringStepContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteringStepContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent rankingStepContext](self, "rankingStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingStepContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent rankingStepContext](self, "rankingStepContext");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[SUGSchemaSUGClientEvent rankingStepContext](self, "rankingStepContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rankingStepContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent engagementMetricReported](self, "engagementMetricReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engagementMetricReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent engagementMetricReported](self, "engagementMetricReported");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[SUGSchemaSUGClientEvent engagementMetricReported](self, "engagementMetricReported");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "engagementMetricReported");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent uiActivity](self, "uiActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent uiActivity](self, "uiActivity");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[SUGSchemaSUGClientEvent uiActivity](self, "uiActivity");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiActivity");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent typingWindowEnded](self, "typingWindowEnded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typingWindowEnded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent typingWindowEnded](self, "typingWindowEnded");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[SUGSchemaSUGClientEvent typingWindowEnded](self, "typingWindowEnded");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typingWindowEnded");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent sugGeneratedTier1](self, "sugGeneratedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sugGeneratedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_67;
  -[SUGSchemaSUGClientEvent sugGeneratedTier1](self, "sugGeneratedTier1");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[SUGSchemaSUGClientEvent sugGeneratedTier1](self, "sugGeneratedTier1");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sugGeneratedTier1");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_68;
  }
  else
  {

  }
  -[SUGSchemaSUGClientEvent uiActivityTier1](self, "uiActivityTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiActivityTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SUGSchemaSUGClientEvent uiActivityTier1](self, "uiActivityTier1");
    v68 = objc_claimAutoreleasedReturnValue();
    if (!v68)
    {

LABEL_71:
      v73 = 1;
      goto LABEL_69;
    }
    v69 = (void *)v68;
    -[SUGSchemaSUGClientEvent uiActivityTier1](self, "uiActivityTier1");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiActivityTier1");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if ((v72 & 1) != 0)
      goto LABEL_71;
  }
  else
  {
LABEL_67:

  }
LABEL_68:
  v73 = 0;
LABEL_69:

  return v73;
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
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v3 = -[SUGSchemaSUGClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[SUGSchemaSUGSuggestionsGenerated hash](self->_suggestionsGenerated, "hash") ^ v3;
  v5 = -[SUGSchemaSUGEngagementReported hash](self->_engagementReported, "hash");
  v6 = v4 ^ v5 ^ -[SUGSchemaSUGRequestContext hash](self->_requestContext, "hash");
  v7 = -[SUGSchemaSUGGenerationStepContext hash](self->_generationStepContext, "hash");
  v8 = v7 ^ -[SUGSchemaSUGResolutionStepContext hash](self->_resolutionStepContext, "hash");
  v9 = v6 ^ v8 ^ -[SUGSchemaSUGFilteringStepContext hash](self->_filteringStepContext, "hash");
  v10 = -[SUGSchemaSUGRankingStepContext hash](self->_rankingStepContext, "hash");
  v11 = v10 ^ -[SUGSchemaSUGEngagementMetricReported hash](self->_engagementMetricReported, "hash");
  v12 = v11 ^ -[SUGSchemaSUGSuggestionsUIActivity hash](self->_uiActivity, "hash");
  v13 = v9 ^ v12 ^ -[SUGSchemaSUGTypingWindowEnded hash](self->_typingWindowEnded, "hash");
  v14 = -[SUGSchemaSUGSuggestionsGeneratedTier1 hash](self->_sugGeneratedTier1, "hash");
  return v13 ^ v14 ^ -[SUGSchemaSUGSuggestionsUIActivityTier1 hash](self->_uiActivityTier1, "hash");
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_engagementMetricReported)
  {
    -[SUGSchemaSUGClientEvent engagementMetricReported](self, "engagementMetricReported");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("engagementMetricReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("engagementMetricReported"));

    }
  }
  if (self->_engagementReported)
  {
    -[SUGSchemaSUGClientEvent engagementReported](self, "engagementReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("engagementReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("engagementReported"));

    }
  }
  if (self->_eventMetadata)
  {
    -[SUGSchemaSUGClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_filteringStepContext)
  {
    -[SUGSchemaSUGClientEvent filteringStepContext](self, "filteringStepContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("filteringStepContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("filteringStepContext"));

    }
  }
  if (self->_generationStepContext)
  {
    -[SUGSchemaSUGClientEvent generationStepContext](self, "generationStepContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("generationStepContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("generationStepContext"));

    }
  }
  if (self->_rankingStepContext)
  {
    -[SUGSchemaSUGClientEvent rankingStepContext](self, "rankingStepContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("rankingStepContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("rankingStepContext"));

    }
  }
  if (self->_requestContext)
  {
    -[SUGSchemaSUGClientEvent requestContext](self, "requestContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("requestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("requestContext"));

    }
  }
  if (self->_resolutionStepContext)
  {
    -[SUGSchemaSUGClientEvent resolutionStepContext](self, "resolutionStepContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("resolutionStepContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("resolutionStepContext"));

    }
  }
  if (self->_sugGeneratedTier1)
  {
    -[SUGSchemaSUGClientEvent sugGeneratedTier1](self, "sugGeneratedTier1");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("sugGeneratedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("sugGeneratedTier1"));

    }
  }
  if (self->_suggestionsGenerated)
  {
    -[SUGSchemaSUGClientEvent suggestionsGenerated](self, "suggestionsGenerated");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("suggestionsGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("suggestionsGenerated"));

    }
  }
  if (self->_typingWindowEnded)
  {
    -[SUGSchemaSUGClientEvent typingWindowEnded](self, "typingWindowEnded");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("typingWindowEnded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("typingWindowEnded"));

    }
  }
  if (self->_uiActivity)
  {
    -[SUGSchemaSUGClientEvent uiActivity](self, "uiActivity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("uiActivity"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("uiActivity"));

    }
  }
  if (self->_uiActivityTier1)
  {
    -[SUGSchemaSUGClientEvent uiActivityTier1](self, "uiActivityTier1");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("uiActivityTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("uiActivityTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGClientEvent)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGClientEvent *v5;
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
    self = -[SUGSchemaSUGClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGClientEvent)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGClientEvent *v5;
  uint64_t v6;
  SUGSchemaSUGClientEventMetadata *v7;
  uint64_t v8;
  SUGSchemaSUGSuggestionsGenerated *v9;
  uint64_t v10;
  SUGSchemaSUGEngagementReported *v11;
  uint64_t v12;
  SUGSchemaSUGRequestContext *v13;
  uint64_t v14;
  SUGSchemaSUGGenerationStepContext *v15;
  uint64_t v16;
  SUGSchemaSUGResolutionStepContext *v17;
  uint64_t v18;
  SUGSchemaSUGFilteringStepContext *v19;
  void *v20;
  SUGSchemaSUGRankingStepContext *v21;
  void *v22;
  SUGSchemaSUGEngagementMetricReported *v23;
  void *v24;
  SUGSchemaSUGSuggestionsUIActivity *v25;
  void *v26;
  void *v27;
  SUGSchemaSUGTypingWindowEnded *v28;
  void *v29;
  SUGSchemaSUGSuggestionsGeneratedTier1 *v30;
  void *v31;
  SUGSchemaSUGSuggestionsUIActivityTier1 *v32;
  SUGSchemaSUGClientEvent *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SUGSchemaSUGClientEvent;
  v5 = -[SUGSchemaSUGClientEvent init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SUGSchemaSUGClientEventMetadata initWithDictionary:]([SUGSchemaSUGClientEventMetadata alloc], "initWithDictionary:", v6);
      -[SUGSchemaSUGClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionsGenerated"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SUGSchemaSUGSuggestionsGenerated initWithDictionary:]([SUGSchemaSUGSuggestionsGenerated alloc], "initWithDictionary:", v8);
      -[SUGSchemaSUGClientEvent setSuggestionsGenerated:](v5, "setSuggestionsGenerated:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("engagementReported"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SUGSchemaSUGEngagementReported initWithDictionary:]([SUGSchemaSUGEngagementReported alloc], "initWithDictionary:", v10);
      -[SUGSchemaSUGClientEvent setEngagementReported:](v5, "setEngagementReported:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SUGSchemaSUGRequestContext initWithDictionary:]([SUGSchemaSUGRequestContext alloc], "initWithDictionary:", v12);
      -[SUGSchemaSUGClientEvent setRequestContext:](v5, "setRequestContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("generationStepContext"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SUGSchemaSUGGenerationStepContext initWithDictionary:]([SUGSchemaSUGGenerationStepContext alloc], "initWithDictionary:", v14);
      -[SUGSchemaSUGClientEvent setGenerationStepContext:](v5, "setGenerationStepContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolutionStepContext"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SUGSchemaSUGResolutionStepContext initWithDictionary:]([SUGSchemaSUGResolutionStepContext alloc], "initWithDictionary:", v16);
      -[SUGSchemaSUGClientEvent setResolutionStepContext:](v5, "setResolutionStepContext:", v17);

    }
    v36 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("filteringStepContext"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[SUGSchemaSUGFilteringStepContext initWithDictionary:]([SUGSchemaSUGFilteringStepContext alloc], "initWithDictionary:", v18);
      -[SUGSchemaSUGClientEvent setFilteringStepContext:](v5, "setFilteringStepContext:", v19);

    }
    v40 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rankingStepContext"), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[SUGSchemaSUGRankingStepContext initWithDictionary:]([SUGSchemaSUGRankingStepContext alloc], "initWithDictionary:", v20);
      -[SUGSchemaSUGClientEvent setRankingStepContext:](v5, "setRankingStepContext:", v21);

    }
    v39 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("engagementMetricReported"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[SUGSchemaSUGEngagementMetricReported initWithDictionary:]([SUGSchemaSUGEngagementMetricReported alloc], "initWithDictionary:", v22);
      -[SUGSchemaSUGClientEvent setEngagementMetricReported:](v5, "setEngagementMetricReported:", v23);

    }
    v37 = (void *)v14;
    v38 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uiActivity"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[SUGSchemaSUGSuggestionsUIActivity initWithDictionary:]([SUGSchemaSUGSuggestionsUIActivity alloc], "initWithDictionary:", v24);
      -[SUGSchemaSUGClientEvent setUiActivity:](v5, "setUiActivity:", v25);

    }
    v26 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("typingWindowEnded"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[SUGSchemaSUGTypingWindowEnded initWithDictionary:]([SUGSchemaSUGTypingWindowEnded alloc], "initWithDictionary:", v27);
      -[SUGSchemaSUGClientEvent setTypingWindowEnded:](v5, "setTypingWindowEnded:", v28);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sugGeneratedTier1"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[SUGSchemaSUGSuggestionsGeneratedTier1 initWithDictionary:]([SUGSchemaSUGSuggestionsGeneratedTier1 alloc], "initWithDictionary:", v29);
      -[SUGSchemaSUGClientEvent setSugGeneratedTier1:](v5, "setSugGeneratedTier1:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uiActivityTier1"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[SUGSchemaSUGSuggestionsUIActivityTier1 initWithDictionary:]([SUGSchemaSUGSuggestionsUIActivityTier1 alloc], "initWithDictionary:", v31);
      -[SUGSchemaSUGClientEvent setUiActivityTier1:](v5, "setUiActivityTier1:", v32);

    }
    v33 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SUGSchemaSUGClientEventMetadata)eventMetadata
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

- (BOOL)hasSuggestionsGenerated
{
  return self->_hasSuggestionsGenerated;
}

- (void)setHasSuggestionsGenerated:(BOOL)a3
{
  self->_hasSuggestionsGenerated = a3;
}

- (BOOL)hasEngagementReported
{
  return self->_hasEngagementReported;
}

- (void)setHasEngagementReported:(BOOL)a3
{
  self->_hasEngagementReported = a3;
}

- (BOOL)hasRequestContext
{
  return self->_hasRequestContext;
}

- (void)setHasRequestContext:(BOOL)a3
{
  self->_hasRequestContext = a3;
}

- (BOOL)hasGenerationStepContext
{
  return self->_hasGenerationStepContext;
}

- (void)setHasGenerationStepContext:(BOOL)a3
{
  self->_hasGenerationStepContext = a3;
}

- (BOOL)hasResolutionStepContext
{
  return self->_hasResolutionStepContext;
}

- (void)setHasResolutionStepContext:(BOOL)a3
{
  self->_hasResolutionStepContext = a3;
}

- (BOOL)hasFilteringStepContext
{
  return self->_hasFilteringStepContext;
}

- (void)setHasFilteringStepContext:(BOOL)a3
{
  self->_hasFilteringStepContext = a3;
}

- (BOOL)hasRankingStepContext
{
  return self->_hasRankingStepContext;
}

- (void)setHasRankingStepContext:(BOOL)a3
{
  self->_hasRankingStepContext = a3;
}

- (BOOL)hasEngagementMetricReported
{
  return self->_hasEngagementMetricReported;
}

- (void)setHasEngagementMetricReported:(BOOL)a3
{
  self->_hasEngagementMetricReported = a3;
}

- (BOOL)hasUiActivity
{
  return self->_hasUiActivity;
}

- (void)setHasUiActivity:(BOOL)a3
{
  self->_hasUiActivity = a3;
}

- (BOOL)hasTypingWindowEnded
{
  return self->_hasTypingWindowEnded;
}

- (void)setHasTypingWindowEnded:(BOOL)a3
{
  self->_hasTypingWindowEnded = a3;
}

- (BOOL)hasSugGeneratedTier1
{
  return self->_hasSugGeneratedTier1;
}

- (void)setHasSugGeneratedTier1:(BOOL)a3
{
  self->_hasSugGeneratedTier1 = a3;
}

- (BOOL)hasUiActivityTier1
{
  return self->_hasUiActivityTier1;
}

- (void)setHasUiActivityTier1:(BOOL)a3
{
  self->_hasUiActivityTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiActivityTier1, 0);
  objc_storeStrong((id *)&self->_sugGeneratedTier1, 0);
  objc_storeStrong((id *)&self->_typingWindowEnded, 0);
  objc_storeStrong((id *)&self->_uiActivity, 0);
  objc_storeStrong((id *)&self->_engagementMetricReported, 0);
  objc_storeStrong((id *)&self->_rankingStepContext, 0);
  objc_storeStrong((id *)&self->_filteringStepContext, 0);
  objc_storeStrong((id *)&self->_resolutionStepContext, 0);
  objc_storeStrong((id *)&self->_generationStepContext, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_engagementReported, 0);
  objc_storeStrong((id *)&self->_suggestionsGenerated, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 52;
}

@end
