@implementation _PSMessagesZkwFeedback

- (_PSMessagesZkwFeedback)initWithChatGuidEngagaged:(id)a3 suggestions:(id)a4
{
  id v6;
  id v7;
  _PSMessagesZkwFeedback *v8;
  uint64_t v9;
  NSString *chatGuidEngaged;
  uint64_t v11;
  NSArray *suggestions;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PSMessagesZkwFeedback;
  v8 = -[_PSMessagesZkwFeedback init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    chatGuidEngaged = v8->_chatGuidEngaged;
    v8->_chatGuidEngaged = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    suggestions = v8->_suggestions;
    v8->_suggestions = (NSArray *)v11;

  }
  return v8;
}

- (id)getTrialID
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;

  -[_PSMessagesZkwFeedback suggestions](self, "suggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[_PSMessagesZkwFeedback suggestions](self, "suggestions");
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
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;

  v3 = -[_PSMessagesZkwFeedback indexOfEngagedSuggestionForChatGuidEngaged](self, "indexOfEngagedSuggestionForChatGuidEngaged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMessagesZkwFeedback reasonTypeForSuggestionIndex:](self, "reasonTypeForSuggestionIndex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSMessagesZkwFeedback reasonForSuggestionIndex:](self, "reasonForSuggestionIndex:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_PSMessagesZkwFeedback dryRun](self, "dryRun"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_PSMessagesZkwFeedback feedbackActionTypeForSuggestionIndex:](self, "feedbackActionTypeForSuggestionIndex:", v3);
  -[_PSMessagesZkwFeedback getTrialID](self, "getTrialID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSFeedbackUtils feedbackPayloadWithIndex:reasonType:reason:sourceBundleId:transportBundleId:numberOfVisibleSuggestions:sessionId:delay:testEvent:iCloudFamilyInvocation:engagementType:trialID:](_PSFeedbackUtils, "feedbackPayloadWithIndex:reasonType:reason:sourceBundleId:transportBundleId:numberOfVisibleSuggestions:sessionId:delay:testEvent:iCloudFamilyInvocation:engagementType:trialID:", v4, v5, v6, 0, 0, 0, 0, 0, v7, &unk_1E442AF10, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)indexOfEngagedSuggestionForChatGuidEngaged
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_PSMessagesZkwFeedback chatGuidEngaged](self, "chatGuidEngaged");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_PSMessagesZkwFeedback suggestions](self, "suggestions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "conversationIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if ((v11 & 1) != 0)
        {
          -[_PSMessagesZkwFeedback suggestions](self, "suggestions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v13, "indexOfObject:", v9);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (int64_t)feedbackActionTypeForSuggestionIndex:(unint64_t)a3
{
  return a3 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)reasonTypeForSuggestionIndex:(unint64_t)a3
{
  void *v3;
  void *v5;
  void *v6;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    -[_PSMessagesZkwFeedback suggestions](self, "suggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reasonType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)reasonForSuggestionIndex:(unint64_t)a3
{
  void *v3;
  void *v5;
  void *v6;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    -[_PSMessagesZkwFeedback suggestions](self, "suggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reason");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)chatGuidEngaged
{
  return self->_chatGuidEngaged;
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
  objc_storeStrong((id *)&self->_chatGuidEngaged, 0);
}

@end
