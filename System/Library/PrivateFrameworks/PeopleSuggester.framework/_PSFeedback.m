@implementation _PSFeedback

+ (id)feedbackForAction:(id)a3 delay:(double)a4 context:(id)a5 suggestions:(id)a6 numberOfVisibleSuggestions:(float)a7 sessionIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  void *v20;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  v18 = objc_alloc((Class)a1);
  *(float *)&v19 = a7;
  v20 = (void *)objc_msgSend(v18, "initWithAction:delay:context:suggestions:numberOfVisibleSuggestions:sessionIdentifier:isAirDropEvent:wasAirDropShown:", v17, v16, v15, v14, 0, 0, a4, v19);

  return v20;
}

+ (id)feedbackForActionWithAirdrop:(id)a3 delay:(double)a4 context:(id)a5 suggestions:(id)a6 numberOfVisibleSuggestions:(float)a7 sessionIdentifier:(id)a8 isAirDropEvent:(BOOL)a9 wasAirDropShown:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  double v23;
  void *v24;

  v10 = a10;
  v11 = a9;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  v22 = objc_alloc((Class)a1);
  *(float *)&v23 = a7;
  v24 = (void *)objc_msgSend(v22, "initWithAction:delay:context:suggestions:numberOfVisibleSuggestions:sessionIdentifier:isAirDropEvent:wasAirDropShown:", v21, v20, v19, v18, v11, v10, a4, v23);

  return v24;
}

- (_PSFeedback)initWithAction:(id)a3 delay:(double)a4 context:(id)a5 suggestions:(id)a6 numberOfVisibleSuggestions:(float)a7 sessionIdentifier:(id)a8 isAirDropEvent:(BOOL)a9 wasAirDropShown:(BOOL)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  _PSFeedback *v22;
  _PSFeedback *v23;
  uint64_t v24;
  NSString *sessionIdentifier;
  objc_super v28;

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v28.receiver = self;
  v28.super_class = (Class)_PSFeedback;
  v22 = -[_PSFeedback init](&v28, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_action, a3);
    v23->_delay = a4;
    objc_storeStrong((id *)&v23->_context, a5);
    objc_storeStrong((id *)&v23->_suggestions, a6);
    v23->_numberOfVisibleSuggestions = a7;
    v24 = objc_msgSend(v21, "copy");
    sessionIdentifier = v23->_sessionIdentifier;
    v23->_sessionIdentifier = (NSString *)v24;

    v23->_isAirDropEvent = a9;
    v23->_wasAirDropShown = a10;
  }

  return v23;
}

- (id)getTrialID
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;

  -[_PSFeedback suggestions](self, "suggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[_PSFeedback suggestions](self, "suggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trialID");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSFeedback getTrialID].cold.1(v8);

    v7 = CFSTR("default");
  }
  return v7;
}

- (unint64_t)indexOfEngagedSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[_PSFeedback action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_PSFeedback suggestions](self, "suggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", v4);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (id)feedbackPayloadShowFamily:(id)a3
{
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  __CFString *v37;

  v35 = a3;
  -[_PSFeedback context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "timedOut");
  v6 = CFSTR("Model");
  if (v5)
    v6 = CFSTR("Cached Suggestions");
  v7 = v6;

  -[_PSFeedback action](self, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestion");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_PSFeedback action](self, "action");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reasonType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsString:", CFSTR("Heuristics"));

    if (!v14)
    {
      v37 = v7;
      goto LABEL_8;
    }
    -[_PSFeedback action](self, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "suggestion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reason");
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v16;
  }
  v37 = v7;

LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_PSFeedback indexOfEngagedSuggestion](self, "indexOfEngagedSuggestion"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFeedback context](self, "context");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "reasonType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFeedback context](self, "context");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bundleID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFeedback action](self, "action");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "transportBundleID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[_PSFeedback suggestions](self, "suggestions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFeedback sessionIdentifier](self, "sessionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[_PSFeedback delay](self, "delay");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_PSFeedback dryRun](self, "dryRun"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFeedback action](self, "action");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "type");
  -[_PSFeedback getTrialID](self, "getTrialID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSFeedbackUtils feedbackPayloadWithIndex:reasonType:reason:sourceBundleId:transportBundleId:numberOfVisibleSuggestions:sessionId:delay:testEvent:iCloudFamilyInvocation:engagementType:trialID:](_PSFeedbackUtils, "feedbackPayloadWithIndex:reasonType:reason:sourceBundleId:transportBundleId:numberOfVisibleSuggestions:sessionId:delay:testEvent:iCloudFamilyInvocation:engagementType:trialID:", v36, v30, v37, v29, v28, v26, v18, v20, v21, v35, v23, v24);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)donateToBiome
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Error serializing share sheet attachments: %@", a5, a6, a7, a8, 2u);
}

- (_PSFeedbackAction)action
{
  return self->_action;
}

- (double)delay
{
  return self->_delay;
}

- (_PSPredictionContext)context
{
  return self->_context;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (float)numberOfVisibleSuggestions
{
  return self->_numberOfVisibleSuggestions;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)isAirDropEvent
{
  return self->_isAirDropEvent;
}

- (BOOL)wasAirDropShown
{
  return self->_wasAirDropShown;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)getTrialID
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A07F4000, log, OS_LOG_TYPE_ERROR, "We are not making any suggestions, so we can not find valid trial id, use default instead", v1, 2u);
}

@end
