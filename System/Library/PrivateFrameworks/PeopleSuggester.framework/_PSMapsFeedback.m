@implementation _PSMapsFeedback

- (_PSMapsFeedback)initWithFeedbackAction:(id)a3 predictionContext:(id)a4 suggestions:(id)a5
{
  id v9;
  id v10;
  id v11;
  _PSMapsFeedback *v12;
  _PSMapsFeedback *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PSMapsFeedback;
  v12 = -[_PSMapsFeedback init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_action, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v13->_suggestions, a5);
  }

  return v13;
}

- (unint64_t)indexOfEngagedSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  unint64_t v15;
  void *v16;
  _PSMapsFeedback *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[_PSMapsFeedback action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_PSMapsFeedback suggestions](self, "suggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v18 = self;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "recipients");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if ((v14 & 1) != 0)
        {
          -[_PSMapsFeedback suggestions](v18, "suggestions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v16, "indexOfObject:", v10);

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
  v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v15;
}

- (id)getTrialID
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;

  -[_PSMapsFeedback suggestions](self, "suggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[_PSMapsFeedback suggestions](self, "suggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trialID");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("default");
  }
  return v7;
}

- (id)feedbackPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_PSMapsFeedback indexOfEngagedSuggestion](self, "indexOfEngagedSuggestion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMapsFeedback action](self, "action");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "suggestion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reasonType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMapsFeedback action](self, "action");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMapsFeedback context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_PSMapsFeedback dryRun](self, "dryRun"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMapsFeedback action](self, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");
  -[_PSMapsFeedback getTrialID](self, "getTrialID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSFeedbackUtils feedbackPayloadWithIndex:reasonType:reason:sourceBundleId:transportBundleId:numberOfVisibleSuggestions:sessionId:delay:testEvent:iCloudFamilyInvocation:engagementType:trialID:](_PSFeedbackUtils, "feedbackPayloadWithIndex:reasonType:reason:sourceBundleId:transportBundleId:numberOfVisibleSuggestions:sessionId:delay:testEvent:iCloudFamilyInvocation:engagementType:trialID:", v3, v14, v5, v7, 0, 0, 0, 0, v8, &unk_1E442AEF8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)donateToBiome
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
  objc_class *v13;
  id v14;
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
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  -[_PSMapsFeedback action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "recipients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_PSMapsFeedback action](self, "action");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contactId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PSMapsFeedback action](self, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v12 = (void *)getBMMapsShareETAFeedbackClass_softClass;
  v31 = getBMMapsShareETAFeedbackClass_softClass;
  if (!getBMMapsShareETAFeedbackClass_softClass)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __getBMMapsShareETAFeedbackClass_block_invoke;
    v27[3] = &unk_1E43FEA00;
    v27[4] = &v28;
    __getBMMapsShareETAFeedbackClass_block_invoke((uint64_t)v27);
    v12 = (void *)v29[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v28, 8);
  v14 = [v13 alloc];
  -[_PSMapsFeedback context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMapsFeedback context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "navigationStartLocationId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMapsFeedback context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "navigationEndLocationId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v14, "initWithIdentifier:bundleId:handle:startLocationId:endLocationId:contactId:groupId:", CFSTR("MapsShareETAFeedback"), v16, v10, v18, v20, v26, 0);

  BiomeLibrary();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "MapsShare");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ETAFeedback");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "source");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendEvent:", v21);

}

- (_PSMapsFeedbackAction)action
{
  return self->_action;
}

- (_PSMapsPredictionContext)context
{
  return self->_context;
}

- (NSArray)suggestions
{
  return self->_suggestions;
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
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
