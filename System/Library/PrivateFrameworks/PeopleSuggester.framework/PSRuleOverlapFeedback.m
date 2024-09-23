@implementation PSRuleOverlapFeedback

void __50___PSRuleOverlapFeedback_writeRecordObjcWithData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  const char *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      v9 = "Error in dodML record creation: %@";
LABEL_6:
      _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);

    }
  }
  else if (v7)
  {
    objc_msgSend(v4, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v8;
    v9 = "DodML record writing UUID: %@";
    goto LABEL_6;
  }

}

id __71___PSRuleOverlapFeedback_modelAccuracyLogging_WithMatchingInteraction___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __57___PSRuleOverlapFeedback_wasInteractionAmongSuggestLess___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57___PSRuleOverlapFeedback_wasInteractionAmongSuggestLess___block_invoke_cold_1(v2, v3);

  }
}

void __57___PSRuleOverlapFeedback_wasInteractionAmongSuggestLess___block_invoke_238(uint64_t a1, void *a2)
{
  _PSShareSheetSuggestLessFeedback *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _PSShareSheetSuggestLessFeedback *v9;
  id v10;

  objc_msgSend(a2, "eventBody");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = [_PSShareSheetSuggestLessFeedback alloc];
    objc_msgSend(v10, "bundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conversationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "derivedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_PSShareSheetSuggestLessFeedback initWithBundleId:conversationId:derivedIntentId:handle:contactId:](v3, "initWithBundleId:conversationId:derivedIntentId:handle:contactId:", v4, v5, v6, v7, v8);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v9);
  }

}

BOOL __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionRecipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

id __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __103___PSEnsembleModel_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId___block_invoke_2_cold_1();

  }
}

uint64_t __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

BOOL __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionExtractedTopicFromAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionExtractedTopicFromAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

uint64_t __101___PSRuleOverlapFeedback_feedbackPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

BOOL __101___PSRuleOverlapFeedback_feedbackPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __101___PSRuleOverlapFeedback_feedbackPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __101___PSRuleOverlapFeedback_feedbackPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __69___PSRuleOverlapFeedback_targetAppPredictedCorrectlyByRule_bundleId___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __59___PSRuleOverlapFeedback_constantFeaturesFromContextItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __59___PSRuleOverlapFeedback_constantFeaturesFromContextItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __62___PSRuleOverlapFeedback_constantPETFeaturesFromContextItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __62___PSRuleOverlapFeedback_constantPETFeaturesFromContextItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

BOOL __62___PSRuleOverlapFeedback_constantPETFeaturesFromContextItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionExtractedTopicFromAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

void __60___PSRuleOverlapFeedback_sharesheetFeedbackEventsSinceDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57___PSRuleOverlapFeedback_wasInteractionAmongSuggestLess___block_invoke_cold_1(v2, v3);

  }
}

void __60___PSRuleOverlapFeedback_sharesheetFeedbackEventsSinceDate___block_invoke_387(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v14, "timestamp");
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "compare:", *(_QWORD *)(a1 + 32)) == 1)
    {
      +[_PSInteractionStoreUtils metadataFromFeedbackEvent:](_PSInteractionStoreUtils, "metadataFromFeedbackEvent:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0D15AF0]);
      objc_msgSend(v4, "sourceBundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", CFSTR("sharesheet"), v9, 0, 0, 0, 0);

      v11 = (void *)MEMORY[0x1E0D159F8];
      objc_msgSend(MEMORY[0x1E0D15A18], "eventStreamWithName:", CFSTR("/dummyStream/tempStream"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v12, v10, v6, v6, 0, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
    }

  }
}

void __57___PSRuleOverlapFeedback_wasInteractionAmongSuggestLess___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, v4, "Finalizing local events failed: %@", v5);

  OUTLINED_FUNCTION_9_0();
}

@end
