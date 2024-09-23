@implementation _PSSharingContactFeatureExtraction

- (_PSSharingContactFeatureExtraction)initWithMetadata:(id)a3 interactionStore:(id)a4
{
  id v7;
  id v8;
  _PSSharingContactFeatureExtraction *v9;
  void *v10;
  objc_class *v11;
  BMBehaviorRetriever *v12;
  BMBehaviorRetriever *behaviorRetriever;
  NSMutableDictionary *constantFeatures;
  objc_super v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_PSSharingContactFeatureExtraction;
  v9 = -[_PSSharingContactFeatureExtraction init](&v16, sel_init);
  if (v9)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v10 = (void *)getBMBehaviorRetrieverClass_softClass;
    v21 = getBMBehaviorRetrieverClass_softClass;
    if (!getBMBehaviorRetrieverClass_softClass)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __getBMBehaviorRetrieverClass_block_invoke;
      v17[3] = &unk_1E43FEA00;
      v17[4] = &v18;
      __getBMBehaviorRetrieverClass_block_invoke((uint64_t)v17);
      v10 = (void *)v19[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v18, 8);
    v12 = (BMBehaviorRetriever *)objc_alloc_init(v11);
    behaviorRetriever = v9->_behaviorRetriever;
    v9->_behaviorRetriever = v12;

    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v9->_interactionStore, a4);
    v9->_constantFeaturesReady = 0;
    constantFeatures = v9->_constantFeatures;
    v9->_constantFeatures = 0;

  }
  return v9;
}

- (void)extractConstantFeaturesInto:(id)a3
{
  id v4;
  _PSContactFillerNormalizationConstants *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  CAPContactFillerUserEvent *v13;
  void *v14;
  void *v15;
  NSObject *v16;
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

  v4 = a3;
  v5 = objc_alloc_init(_PSContactFillerNormalizationConstants);
  -[_PSSharingContactFeatureExtraction setNormConstants:](self, "setNormConstants:", v5);

  -[_PSSharingContactFeatureExtraction interactionStore](self, "interactionStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSharingContactFeatureExtraction normConstants](self, "normConstants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:](_PSContactFillerDataCollectionUtilities, "calculateNormContantsGivenInteractionStore:normConstants:", v6, v7);

  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:].cold.6(self);

  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:].cold.5(self);

  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:].cold.4(self);

  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:].cold.3(self);

  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:].cold.2(self);

  v13 = objc_alloc_init(CAPContactFillerUserEvent);
  -[_PSSharingContactFeatureExtraction normConstants](self, "normConstants");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSharingContactFeatureExtraction behaviorRetriever](self, "behaviorRetriever");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSContactFillerDataCollectionUtilities extractUserFeaturesIntoPETMessage:normConstants:behaviorRetriever:](_PSContactFillerDataCollectionUtilities, "extractUserFeaturesIntoPETMessage:normConstants:behaviorRetriever:", v13, v14, v15);

  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:].cold.1();

  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("highConfidenceRuleCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerUserEvent highConfidenceRuleCount](v13, "highConfidenceRuleCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("highConfidenceRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("lowConfidenceRuleCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerUserEvent lowConfidenceRuleCount](v13, "lowConfidenceRuleCount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("lowConfidenceRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("mediumConfidenceRuleCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerUserEvent mediumConfidenceRuleCount](v13, "mediumConfidenceRuleCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("mediumConfidenceRuleCount"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("shareInteractionsSent"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerUserEvent shareInteractionsSent](v13, "shareInteractionsSent"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("shareInteractionsSent"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("textInteractionsReceived"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerUserEvent textInteractionsReceived](v13, "textInteractionsReceived"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("textInteractionsReceived"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("textInteractionsSent"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerUserEvent textInteractionsSent](v13, "textInteractionsSent"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("textInteractionsSent"));

  }
  -[_PSSharingContactFeatureExtraction setConstantFeaturesReady:](self, "setConstantFeaturesReady:", 1);

}

- (void)transferConstantFeatures:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)extractFeaturesInto:(id)a3 withPredictionContext:(id)a4 forContactId:(id)a5 forInteraction:(id)a6 behaviorRulesConsideringInTheContext:(id)a7 ruleRankingMLModelScores:(id)a8 interactionModelScores:(id)a9
{
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  CAPContactFillerContactEvent *v19;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;

  v132 = a3;
  v130 = a4;
  v131 = a5;
  v129 = a6;
  v126 = a7;
  v127 = a8;
  v128 = a9;
  if (!-[_PSSharingContactFeatureExtraction constantFeaturesReady](self, "constantFeaturesReady"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSSharingContactFeatureExtraction setConstantFeatures:](self, "setConstantFeatures:", v15);

    -[_PSSharingContactFeatureExtraction constantFeatures](self, "constantFeatures");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:](self, "extractConstantFeaturesInto:", v16);

  }
  -[_PSSharingContactFeatureExtraction constantFeatures](self, "constantFeatures");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSharingContactFeatureExtraction transferConstantFeatures:to:](self, "transferConstantFeatures:to:", v17, v132);

  v18 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays");
  v19 = objc_alloc_init(CAPContactFillerContactEvent);
  v20 = (void *)objc_opt_new();
  objc_msgSend(v130, "suggestionDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSharingContactFeatureExtraction interactionStore](self, "interactionStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSContactFillerDataCollectionUtilities initContactPropertyCache:timeOfShareInteraction:interactionStore:](_PSContactFillerDataCollectionUtilities, "initContactPropertyCache:timeOfShareInteraction:interactionStore:", v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSSharingContactFeatureExtraction normConstants](self, "normConstants");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSharingContactFeatureExtraction interactionStore](self, "interactionStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "suggestionDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSContactFillerDataCollectionUtilities extractFrequencyRecencyFeaturesIntoPETMessage:recipientID:interaction:normConstants:numberOfDaysToLookBack:interactionStore:timeOfShareInteraction:contactPropertyCache:interactionCache:](_PSContactFillerDataCollectionUtilities, "extractFrequencyRecencyFeaturesIntoPETMessage:recipientID:interaction:normConstants:numberOfDaysToLookBack:interactionStore:timeOfShareInteraction:contactPropertyCache:interactionCache:", v19, v131, v129, v24, v18, v25, v26, v20, v23);

  +[_PSContactFillerDataCollectionUtilities filterRulesBasedOnInteractionGivenRuleList:interaction:](_PSContactFillerDataCollectionUtilities, "filterRulesBasedOnInteractionGivenRuleList:interaction:", v126, v129);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAPContactFillerContactEvent setNumberOfBehavioralRulesAdvocating:](v19, "setNumberOfBehavioralRulesAdvocating:", +[_PSContactFillerDataCollectionUtilities contactFillerBucketedValue:](_PSContactFillerDataCollectionUtilities, "contactFillerBucketedValue:", objc_msgSend(v27, "count")));
  if (objc_msgSend(v126, "count"))
    +[_PSContactFillerDataCollectionUtilities extractFeaturesFromBehaviorRulesIntoPETMessage:behaviorRules:MLModelScores:](_PSContactFillerDataCollectionUtilities, "extractFeaturesFromBehaviorRulesIntoPETMessage:behaviorRules:MLModelScores:", v19, v27, v127);
  if (v128)
  {
    objc_msgSend(v128, "objectForKeyedSubscript:", v131);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    -[CAPContactFillerContactEvent setInteractionModelScore:](v19, "setInteractionModelScore:");

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("averageBehavioralRuleConfidence"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent averageBehavioralRuleConfidence](v19, "averageBehavioralRuleConfidence");
    objc_msgSend(v30, "numberWithDouble:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v31, CFSTR("averageBehavioralRuleConfidence"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("averageBehavioralRuleConviction"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent averageBehavioralRuleConviction](v19, "averageBehavioralRuleConviction");
    objc_msgSend(v33, "numberWithDouble:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v34, CFSTR("averageBehavioralRuleConviction"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("averageBehavioralRuleLift"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent averageBehavioralRuleLift](v19, "averageBehavioralRuleLift");
    objc_msgSend(v36, "numberWithDouble:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v37, CFSTR("averageBehavioralRuleLift"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("averageBehavioralRuleMLScore"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent averageBehavioralRuleMLScore](v19, "averageBehavioralRuleMLScore");
    objc_msgSend(v39, "numberWithDouble:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v40, CFSTR("averageBehavioralRuleMLScore"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("averageBehavioralRulePowerFactor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v42 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent averageBehavioralRulePowerFactor](v19, "averageBehavioralRulePowerFactor");
    objc_msgSend(v42, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v43, CFSTR("averageBehavioralRulePowerFactor"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("averageBehavioralRuleSupport"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v45 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent averageBehavioralRuleSupport](v19, "averageBehavioralRuleSupport");
    objc_msgSend(v45, "numberWithDouble:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v46, CFSTR("averageBehavioralRuleSupport"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("maximumBehavioralRuleConfidence"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v48 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent maximumBehavioralRuleConfidence](v19, "maximumBehavioralRuleConfidence");
    objc_msgSend(v48, "numberWithDouble:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v49, CFSTR("maximumBehavioralRuleConfidence"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("maximumBehavioralRuleConviction"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    v51 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent maximumBehavioralRuleConviction](v19, "maximumBehavioralRuleConviction");
    objc_msgSend(v51, "numberWithDouble:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v52, CFSTR("maximumBehavioralRuleConviction"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("maximumBehavioralRuleLift"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v54 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent maximumBehavioralRuleLift](v19, "maximumBehavioralRuleLift");
    objc_msgSend(v54, "numberWithDouble:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v55, CFSTR("maximumBehavioralRuleLift"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("maximumBehavioralRuleMLScore"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    v57 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent maximumBehavioralRuleMLScore](v19, "maximumBehavioralRuleMLScore");
    objc_msgSend(v57, "numberWithDouble:");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v58, CFSTR("maximumBehavioralRuleMLScore"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("maximumBehavioralRulePowerFactor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v60 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent maximumBehavioralRulePowerFactor](v19, "maximumBehavioralRulePowerFactor");
    objc_msgSend(v60, "numberWithDouble:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v61, CFSTR("maximumBehavioralRulePowerFactor"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("maximumBehavioralRuleSupport"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v63 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent maximumBehavioralRuleSupport](v19, "maximumBehavioralRuleSupport");
    objc_msgSend(v63, "numberWithDouble:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v64, CFSTR("maximumBehavioralRuleSupport"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("minimumBehavioralRuleConfidence"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    v66 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent minimumBehavioralRuleConfidence](v19, "minimumBehavioralRuleConfidence");
    objc_msgSend(v66, "numberWithDouble:");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v67, CFSTR("minimumBehavioralRuleConfidence"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("minimumBehavioralRuleConviction"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    v69 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent minimumBehavioralRuleConviction](v19, "minimumBehavioralRuleConviction");
    objc_msgSend(v69, "numberWithDouble:");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v70, CFSTR("minimumBehavioralRuleConviction"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("minimumBehavioralRuleLift"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    v72 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent minimumBehavioralRuleLift](v19, "minimumBehavioralRuleLift");
    objc_msgSend(v72, "numberWithDouble:");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v73, CFSTR("minimumBehavioralRuleLift"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("minimumBehavioralRuleMLScore"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    v75 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent minimumBehavioralRuleMLScore](v19, "minimumBehavioralRuleMLScore");
    objc_msgSend(v75, "numberWithDouble:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v76, CFSTR("minimumBehavioralRuleMLScore"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("minimumBehavioralRulePowerFactor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
  {
    v78 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent minimumBehavioralRulePowerFactor](v19, "minimumBehavioralRulePowerFactor");
    objc_msgSend(v78, "numberWithDouble:");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v79, CFSTR("minimumBehavioralRulePowerFactor"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("minimumBehavioralRuleSupport"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    v81 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent minimumBehavioralRuleSupport](v19, "minimumBehavioralRuleSupport");
    objc_msgSend(v81, "numberWithDouble:");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v82, CFSTR("minimumBehavioralRuleSupport"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("stdevBehavioralRuleConfidence"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    v84 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent stdevBehavioralRuleConfidence](v19, "stdevBehavioralRuleConfidence");
    objc_msgSend(v84, "numberWithDouble:");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v85, CFSTR("stdevBehavioralRuleConfidence"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("stdevBehavioralRuleConviction"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    v87 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent stdevBehavioralRuleConviction](v19, "stdevBehavioralRuleConviction");
    objc_msgSend(v87, "numberWithDouble:");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v88, CFSTR("stdevBehavioralRuleConviction"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("stdevBehavioralRuleLift"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    v90 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent stdevBehavioralRuleLift](v19, "stdevBehavioralRuleLift");
    objc_msgSend(v90, "numberWithDouble:");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v91, CFSTR("stdevBehavioralRuleLift"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("stdevBehavioralRuleMLScore"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    v93 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent stdevBehavioralRuleMLScore](v19, "stdevBehavioralRuleMLScore");
    objc_msgSend(v93, "numberWithDouble:");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v94, CFSTR("stdevBehavioralRuleMLScore"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("stdevBehavioralRulePowerFactor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (v95)
  {
    v96 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent stdevBehavioralRulePowerFactor](v19, "stdevBehavioralRulePowerFactor");
    objc_msgSend(v96, "numberWithDouble:");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v97, CFSTR("stdevBehavioralRulePowerFactor"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("stdevBehavioralRuleSupport"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v98)
  {
    v99 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent stdevBehavioralRuleSupport](v19, "stdevBehavioralRuleSupport");
    objc_msgSend(v99, "numberWithDouble:");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v100, CFSTR("stdevBehavioralRuleSupport"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("interactionModelScore"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (v101)
  {
    v102 = (void *)MEMORY[0x1E0CB37E8];
    -[CAPContactFillerContactEvent interactionModelScore](v19, "interactionModelScore");
    objc_msgSend(v102, "numberWithDouble:");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v103, CFSTR("interactionModelScore"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("normalizedIncomingCallFrequency"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent normalizedIncomingCallFrequency](v19, "normalizedIncomingCallFrequency"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v105, CFSTR("normalizedIncomingCallFrequency"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("normalizedIncomingTextFrequency"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent normalizedIncomingTextFrequency](v19, "normalizedIncomingTextFrequency"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v107, CFSTR("normalizedIncomingTextFrequency"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("normalizedOutgoingCallFrequency"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent normalizedOutgoingCallFrequency](v19, "normalizedOutgoingCallFrequency"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v109, CFSTR("normalizedOutgoingCallFrequency"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("normalizedOutgoingTextFrequency"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (v110)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent normalizedOutgoingTextFrequency](v19, "normalizedOutgoingTextFrequency"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v111, CFSTR("normalizedOutgoingTextFrequency"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("normalizedShareFrequency"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent normalizedShareFrequency](v19, "normalizedShareFrequency"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v113, CFSTR("normalizedShareFrequency"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("numberOfBehavioralRulesAdvocating"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent numberOfBehavioralRulesAdvocating](v19, "numberOfBehavioralRulesAdvocating"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v115, CFSTR("numberOfBehavioralRulesAdvocating"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("timeSinceLastContactViaIncomingCall"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  if (v116)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent timeSinceLastContactViaIncomingCall](v19, "timeSinceLastContactViaIncomingCall"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v117, CFSTR("timeSinceLastContactViaIncomingCall"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("timeSinceLastContactViaIncomingText"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  if (v118)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent timeSinceLastContactViaIncomingText](v19, "timeSinceLastContactViaIncomingText"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v119, CFSTR("timeSinceLastContactViaIncomingText"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("timeSinceLastContactViaOutgoingCall"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  if (v120)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent timeSinceLastContactViaOutgoingCall](v19, "timeSinceLastContactViaOutgoingCall"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v121, CFSTR("timeSinceLastContactViaOutgoingCall"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("timeSinceLastContactViaOutgoingText"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  if (v122)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent timeSinceLastContactViaOutgoingText](v19, "timeSinceLastContactViaOutgoingText"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v123, CFSTR("timeSinceLastContactViaOutgoingText"));

  }
  -[NSDictionary valueForKey:](self->_metadata, "valueForKey:", CFSTR("timeSinceLastContactViaShare"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  if (v124)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAPContactFillerContactEvent timeSinceLastContactViaShare](v19, "timeSinceLastContactViaShare"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKeyedSubscript:", v125, CFSTR("timeSinceLastContactViaShare"));

  }
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (CAPContactFillerUserEvent)userEvent
{
  return self->_userEvent;
}

- (void)setUserEvent:(id)a3
{
  objc_storeStrong((id *)&self->_userEvent, a3);
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (BOOL)constantFeaturesReady
{
  return self->_constantFeaturesReady;
}

- (void)setConstantFeaturesReady:(BOOL)a3
{
  self->_constantFeaturesReady = a3;
}

- (_PSContactFillerNormalizationConstants)normConstants
{
  return self->_normConstants;
}

- (void)setNormConstants:(id)a3
{
  objc_storeStrong((id *)&self->_normConstants, a3);
}

- (NSMutableDictionary)constantFeatures
{
  return self->_constantFeatures;
}

- (void)setConstantFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_constantFeatures, a3);
}

- (BMBehaviorRetriever)behaviorRetriever
{
  return self->_behaviorRetriever;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorRetriever, 0);
  objc_storeStrong((id *)&self->_constantFeatures, 0);
  objc_storeStrong((id *)&self->_normConstants, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_userEvent, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)extractConstantFeaturesInto:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1A07F4000, v0, OS_LOG_TYPE_DEBUG, "userEvent: %@", v1, 0xCu);
}

- (void)extractConstantFeaturesInto:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "normConstants");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shareTotal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1A07F4000, v3, v4, "userEvent-normConstants: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)extractConstantFeaturesInto:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "normConstants");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "outgoingTextTotal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1A07F4000, v3, v4, "userEvent-normConstants: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)extractConstantFeaturesInto:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "normConstants");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "outgoingCallTotal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1A07F4000, v3, v4, "userEvent-normConstants: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)extractConstantFeaturesInto:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "normConstants");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "incomingTextTotal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1A07F4000, v3, v4, "userEvent-normConstants: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)extractConstantFeaturesInto:(void *)a1 .cold.6(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "normConstants");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "incomingCallTotal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1A07F4000, v3, v4, "userEvent-normConstants: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
