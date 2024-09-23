@implementation PSPETMessageBuilder

void __127___PSPETMessageBuilder_initWithInteractionsStatistics_andConfig_andContext_andDeviceIdentifier_andTrialIdentifier_andDefaults___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  id v36;

  v36 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "privatizedConversationId:", v36);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrivatizedIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 32), "bundleIdForConversationId:", v36);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && !v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%du"), arc4random());
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v5);
  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "valueOrDefaultValueForFeature:forConversationId:", CFSTR("feedback"), v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFeedbackType:", objc_msgSend(v9, "integerValue"));

  objc_msgSend(v3, "privatizedIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrivatizedCandidateIdentifier:", v10);

  objc_msgSend(v8, "setPrivatizedTransportBundleId:", v7);
  v11 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "feedbackType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v8);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("timeSinceLastOutgoingInteraction"), v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeSinceLastOutgoingInteraction:", v14);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("timeSinceOutgoingInteractionNumber10"), v36);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeSinceOutgoingInteractionNumber10:", v15);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("timeSinceLastIncomingInteraction"), v36);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeSinceLastIncomingInteraction:", v16);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfSharesWithConversation"), v36);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfSharesWithConversation:", v17);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfSharesFromCurrentAppWithConversation"), v36);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfSharesFromCurrentAppWithConversation:", v18);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfSharesOfTopDomainURLWithConversation"), v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfSharesOfTopDomainURLWithConversation:", v19);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfSharesOfDetectedPeopleWithConversation"), v36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfSharesOfDetectedPeopleWithConversation:", v20);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfSharesOfPeopleInPhotoWithConversation"), v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfSharesOfPeopleInPhotoWithConversation:", v21);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfOutgoingInteractionsWithConversation"), v36);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfOutgoingInteractionsWithConversation:", v22);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfIncomingInteractionsWithConversation"), v36);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfIncomingInteractionsWithConversation:", v23);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfInteractionsDuringTimePeriodWithConversation"), v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfInteractionsDuringTimePeriodWithConversation:", v24);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfEngagedSuggestionsWithConversation"), v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfEngagedSuggestionsWithConversation:", v25);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfEngagedSuggestionsFromCurrentAppWithConversation"), v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:", v26);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfEngagedSuggestionsOfTopDomainURLWithConversation"), v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:", v27);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfEngagedSuggestionsOfDetectedPeopleWithConversation"), v36);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:", v28);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation"), v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:", v29);

  objc_msgSend(*(id *)(a1 + 56), "privacyMitigatedFeatureValueFromName:forConversationId:", CFSTR("hasEverSharePlayedWithConversation"), v36);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHasEverSharePlayedWithConversation:", v30);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "valueForFeature:forConversationId:", CFSTR("suggestedRank"), v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
    objc_msgSend(v3, "setSuggestedRank:", objc_msgSend(v31, "intValue"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "valueForFeature:forConversationId:", CFSTR("coreMLModelScore"), v36);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  objc_msgSend(v3, "setCoreMLModelScore:");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "valueForFeature:forConversationId:", CFSTR("foundInInteractionStoreChunk"), v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFoundInChunk:", objc_msgSend(v34, "intValue"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "valueForFeature:forConversationId:", CFSTR("updatedInInteractionStoreChunk"), v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUpdatedInChunk:", objc_msgSend(v35, "intValue"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "addCandidates:", v3);
}

@end
