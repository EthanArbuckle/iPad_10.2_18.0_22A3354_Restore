@implementation _PSPredictionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSPredictionContext)init
{
  _PSPredictionContext *v2;
  _PSPredictionContext *v3;
  NSString *sessionID;
  NSDate *suggestionDate;
  NSUUID *locationUUID;
  NSArray *locationUUIDs;
  NSString *bundleID;
  NSString *accountIdentifier;
  NSArray *seedRecipients;
  NSArray *attachments;
  NSArray *photoSuggestedPeople;
  NSString *searchPrefix;
  NSArray *suggestionsFilteredByBundleIds;
  NSArray *seedContactIdentifiers;
  NSArray *linkMetadataFromClient;
  NSArray *peopleInPhotoIdentifiers;
  NSArray *scenesInPhotoIdentifiers;
  NSDate *suggestionCompletionDate;
  NSString *suggestionPath;
  NSArray *supportedBundleIds;
  NSString *currentSpanId;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_PSPredictionContext;
  v2 = -[_PSPredictionContext init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    sessionID = v2->_sessionID;
    v2->_sessionID = 0;

    suggestionDate = v3->_suggestionDate;
    v3->_suggestionDate = 0;

    locationUUID = v3->_locationUUID;
    v3->_locationUUID = 0;

    locationUUIDs = v3->_locationUUIDs;
    v3->_locationUUIDs = 0;

    bundleID = v3->_bundleID;
    v3->_bundleID = 0;

    accountIdentifier = v3->_accountIdentifier;
    v3->_accountIdentifier = 0;

    seedRecipients = v3->_seedRecipients;
    v3->_seedRecipients = 0;

    attachments = v3->_attachments;
    v3->_attachments = 0;

    photoSuggestedPeople = v3->_photoSuggestedPeople;
    v3->_photoSuggestedPeople = 0;

    *(_WORD *)&v3->_showPotentialFamilyMembers = 0;
    searchPrefix = v3->_searchPrefix;
    v3->_searchPrefix = 0;

    suggestionsFilteredByBundleIds = v3->_suggestionsFilteredByBundleIds;
    v3->_suggestionPurpose = 0;
    v3->_suggestionsFilteredByBundleIds = 0;

    seedContactIdentifiers = v3->_seedContactIdentifiers;
    v3->_seedContactIdentifiers = 0;

    v3->_isCollaborationAvailable = 0;
    linkMetadataFromClient = v3->_linkMetadataFromClient;
    v3->_linkMetadataFromClient = 0;

    peopleInPhotoIdentifiers = v3->_peopleInPhotoIdentifiers;
    v3->_peopleInPhotoIdentifiers = 0;

    scenesInPhotoIdentifiers = v3->_scenesInPhotoIdentifiers;
    v3->_scenesInPhotoIdentifiers = 0;

    v3->_isCoreMLValidationFetch = 0;
    *(_WORD *)&v3->_timedOut = 0;
    suggestionCompletionDate = v3->_suggestionCompletionDate;
    v3->_suggestionCompletionDate = 0;

    suggestionPath = v3->_suggestionPath;
    v3->_suggestionPath = 0;

    v3->_isPSRActive = 0;
    supportedBundleIds = v3->_supportedBundleIds;
    v3->_supportedBundleIds = 0;

    currentSpanId = v3->_currentSpanId;
    v3->_currentSpanId = 0;

    v3->_feedBack = -1;
  }
  return v3;
}

- (NSDate)suggestionDate
{
  NSDate *suggestionDate;
  NSDate *v4;
  NSDate *v5;

  suggestionDate = self->_suggestionDate;
  if (!suggestionDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_suggestionDate;
    self->_suggestionDate = v4;

    suggestionDate = self->_suggestionDate;
  }
  return suggestionDate;
}

- (_PSPredictionContext)initWithCoder:(id)a3
{
  id v4;
  _PSPredictionContext *v5;
  void *v6;
  uint64_t v7;
  NSString *sessionID;
  uint64_t v9;
  NSDate *suggestionDate;
  uint64_t v11;
  NSUUID *locationUUID;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *locationUUIDs;
  uint64_t v18;
  NSString *bundleID;
  uint64_t v20;
  NSString *accountIdentifier;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *seedRecipients;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *attachments;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSDictionary *appBundleIdsToShareExtensionBundleIdsMapping;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSArray *photoSuggestedPeople;
  uint64_t v45;
  NSString *searchPrefix;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSArray *suggestionsFilteredByBundleIds;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSArray *seedContactIdentifiers;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  NSArray *linkMetadataFromClient;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSArray *peopleInPhotoIdentifiers;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSArray *scenesInPhotoIdentifiers;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  NSDictionary *scoredCoreMLCandidates;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  MLMultiArray *coreMLInputFeatureTensor;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  NSArray *coreMLModelFeatureOrder;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  NSDictionary *coreMLTensorIndexToCandidate;
  uint64_t v98;
  NSNumber *coreMLNumberOfCandidates;
  uint64_t v100;
  NSString *trialExperimentId;
  uint64_t v102;
  NSString *trialTreatmentId;
  uint64_t v104;
  NSString *trialDeploymentId;
  uint64_t v106;
  NSString *currentSpanId;
  uint64_t v108;
  NSString *reasonType;
  uint64_t v110;
  NSDate *suggestionCompletionDate;
  uint64_t v112;
  NSString *suggestionPath;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  NSArray *supportedBundleIds;
  void *v119;
  void *v120;
  uint64_t v121;
  NSDate *queryStartDate;
  _PSPredictionContext *v123;
  objc_super v125;
  uint64_t v126;
  uint64_t v127;
  Class (*v128)(uint64_t);
  void *v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t v134;

  v4 = a3;
  v125.receiver = self;
  v125.super_class = (Class)_PSPredictionContext;
  v5 = -[_PSPredictionContext init](&v125, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sessionID"));
    v7 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    suggestionDate = v5->_suggestionDate;
    v5->_suggestionDate = (NSDate *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationUUID"));
    v11 = objc_claimAutoreleasedReturnValue();
    locationUUID = v5->_locationUUID;
    v5->_locationUUID = (NSUUID *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("locationUUIDs"));
    v16 = objc_claimAutoreleasedReturnValue();
    locationUUIDs = v5->_locationUUIDs;
    v5->_locationUUIDs = (NSArray *)v16;

    v5->_locationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v18 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("seedRecipients"));
    v25 = objc_claimAutoreleasedReturnValue();
    seedRecipients = v5->_seedRecipients;
    v5->_seedRecipients = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("attachments"));
    v30 = objc_claimAutoreleasedReturnValue();
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("appBundleIdsToShareExtensionBundleIdsMapping"));
    v36 = objc_claimAutoreleasedReturnValue();
    appBundleIdsToShareExtensionBundleIdsMapping = v5->_appBundleIdsToShareExtensionBundleIdsMapping;
    v5->_appBundleIdsToShareExtensionBundleIdsMapping = (NSDictionary *)v36;

    v38 = (void *)MEMORY[0x1E0C99E60];
    v39 = objc_opt_class();
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, v40, v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("photoSuggestedPeople"));
    v43 = objc_claimAutoreleasedReturnValue();
    photoSuggestedPeople = v5->_photoSuggestedPeople;
    v5->_photoSuggestedPeople = (NSArray *)v43;

    v5->_showPotentialFamilyMembers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showPotentialFamilyMembers"));
    v5->_isSharePlayAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSharePlayAvailable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchPrefix"));
    v45 = objc_claimAutoreleasedReturnValue();
    searchPrefix = v5->_searchPrefix;
    v5->_searchPrefix = (NSString *)v45;

    v5->_suggestionPurpose = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("suggestionPurpose"));
    v47 = (void *)MEMORY[0x1E0C99E60];
    v48 = objc_opt_class();
    objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("suggestionsFilteredByBundleIds"));
    v50 = objc_claimAutoreleasedReturnValue();
    suggestionsFilteredByBundleIds = v5->_suggestionsFilteredByBundleIds;
    v5->_suggestionsFilteredByBundleIds = (NSArray *)v50;

    v52 = (void *)MEMORY[0x1E0C99E60];
    v53 = objc_opt_class();
    objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("seedContactIdentifiers"));
    v55 = objc_claimAutoreleasedReturnValue();
    seedContactIdentifiers = v5->_seedContactIdentifiers;
    v5->_seedContactIdentifiers = (NSArray *)v55;

    v5->_isCollaborationAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCollaborationAvailable"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("linkMetadataFromClient")))
    {
      v57 = (void *)MEMORY[0x1E0C99E60];
      v58 = objc_opt_class();
      v131 = 0;
      v132 = &v131;
      v133 = 0x2050000000;
      v59 = (void *)getLPLinkMetadataClass_softClass;
      v134 = getLPLinkMetadataClass_softClass;
      if (!getLPLinkMetadataClass_softClass)
      {
        v126 = MEMORY[0x1E0C809B0];
        v127 = 3221225472;
        v128 = __getLPLinkMetadataClass_block_invoke;
        v129 = &unk_1E43FEA00;
        v130 = &v131;
        __getLPLinkMetadataClass_block_invoke((uint64_t)&v126);
        v59 = (void *)v132[3];
      }
      v60 = objc_retainAutorelease(v59);
      _Block_object_dispose(&v131, 8);
      objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v61, CFSTR("linkMetadataFromClient"));
      v62 = objc_claimAutoreleasedReturnValue();
      linkMetadataFromClient = v5->_linkMetadataFromClient;
      v5->_linkMetadataFromClient = (NSArray *)v62;

    }
    v64 = (void *)MEMORY[0x1E0C99E60];
    v65 = objc_opt_class();
    objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v66, CFSTR("peopleInPhotoIdentifiers"));
    v67 = objc_claimAutoreleasedReturnValue();
    peopleInPhotoIdentifiers = v5->_peopleInPhotoIdentifiers;
    v5->_peopleInPhotoIdentifiers = (NSArray *)v67;

    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, CFSTR("scenesInPhotoIdentifiers"));
    v72 = objc_claimAutoreleasedReturnValue();
    scenesInPhotoIdentifiers = v5->_scenesInPhotoIdentifiers;
    v5->_scenesInPhotoIdentifiers = (NSArray *)v72;

    v5->_isFallbackFetch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFallbackFetch"));
    v5->_isCoreMLValidationFetch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCoreMLValidationFetch"));
    v74 = (void *)MEMORY[0x1E0C99E60];
    v75 = objc_opt_class();
    v76 = objc_opt_class();
    v77 = objc_opt_class();
    objc_msgSend(v74, "setWithObjects:", v75, v76, v77, objc_opt_class(), 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v78, CFSTR("scoredCoreMLCandidates"));
    v79 = objc_claimAutoreleasedReturnValue();
    scoredCoreMLCandidates = v5->_scoredCoreMLCandidates;
    v5->_scoredCoreMLCandidates = (NSDictionary *)v79;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("coreMLInputFeatureTensor")))
    {
      v81 = (void *)MEMORY[0x1E0C99E60];
      v131 = 0;
      v132 = &v131;
      v133 = 0x2050000000;
      v82 = (void *)getMLMultiArrayClass_softClass_3;
      v134 = getMLMultiArrayClass_softClass_3;
      if (!getMLMultiArrayClass_softClass_3)
      {
        v126 = MEMORY[0x1E0C809B0];
        v127 = 3221225472;
        v128 = __getMLMultiArrayClass_block_invoke_3;
        v129 = &unk_1E43FEA00;
        v130 = &v131;
        __getMLMultiArrayClass_block_invoke_3((uint64_t)&v126);
        v82 = (void *)v132[3];
      }
      v83 = objc_retainAutorelease(v82);
      _Block_object_dispose(&v131, 8);
      objc_msgSend(v81, "setWithObjects:", objc_opt_class(), 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v84, CFSTR("coreMLInputFeatureTensor"));
      v85 = objc_claimAutoreleasedReturnValue();
      coreMLInputFeatureTensor = v5->_coreMLInputFeatureTensor;
      v5->_coreMLInputFeatureTensor = (MLMultiArray *)v85;

    }
    v87 = (void *)MEMORY[0x1E0C99E60];
    v88 = objc_opt_class();
    objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v89, CFSTR("coreMLModelFeatureOrder"));
    v90 = objc_claimAutoreleasedReturnValue();
    coreMLModelFeatureOrder = v5->_coreMLModelFeatureOrder;
    v5->_coreMLModelFeatureOrder = (NSArray *)v90;

    v92 = (void *)MEMORY[0x1E0C99E60];
    v93 = objc_opt_class();
    v94 = objc_opt_class();
    objc_msgSend(v92, "setWithObjects:", v93, v94, objc_opt_class(), 0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v95, CFSTR("coreMLTensorIndexToCandidate"));
    v96 = objc_claimAutoreleasedReturnValue();
    coreMLTensorIndexToCandidate = v5->_coreMLTensorIndexToCandidate;
    v5->_coreMLTensorIndexToCandidate = (NSDictionary *)v96;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coreMLNumberOfCandidates"));
    v98 = objc_claimAutoreleasedReturnValue();
    coreMLNumberOfCandidates = v5->_coreMLNumberOfCandidates;
    v5->_coreMLNumberOfCandidates = (NSNumber *)v98;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trialExperimentId"));
    v100 = objc_claimAutoreleasedReturnValue();
    trialExperimentId = v5->_trialExperimentId;
    v5->_trialExperimentId = (NSString *)v100;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trialTreatmentId"));
    v102 = objc_claimAutoreleasedReturnValue();
    trialTreatmentId = v5->_trialTreatmentId;
    v5->_trialTreatmentId = (NSString *)v102;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trialDeploymentId"));
    v104 = objc_claimAutoreleasedReturnValue();
    trialDeploymentId = v5->_trialDeploymentId;
    v5->_trialDeploymentId = (NSString *)v104;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentSpanId"));
    v106 = objc_claimAutoreleasedReturnValue();
    currentSpanId = v5->_currentSpanId;
    v5->_currentSpanId = (NSString *)v106;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reasonType"));
    v108 = objc_claimAutoreleasedReturnValue();
    reasonType = v5->_reasonType;
    v5->_reasonType = (NSString *)v108;

    v5->_timedOut = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("timedOut"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionCompletionDate"));
    v110 = objc_claimAutoreleasedReturnValue();
    suggestionCompletionDate = v5->_suggestionCompletionDate;
    v5->_suggestionCompletionDate = (NSDate *)v110;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionPath"));
    v112 = objc_claimAutoreleasedReturnValue();
    suggestionPath = v5->_suggestionPath;
    v5->_suggestionPath = (NSString *)v112;

    v5->_isPSRActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPSRActive"));
    v114 = (void *)MEMORY[0x1E0C99E60];
    v115 = objc_opt_class();
    objc_msgSend(v114, "setWithObjects:", v115, objc_opt_class(), 0);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v116, CFSTR("supportedBundleIds"));
    v117 = objc_claimAutoreleasedReturnValue();
    supportedBundleIds = v5->_supportedBundleIds;
    v5->_supportedBundleIds = (NSArray *)v117;

    v119 = (void *)MEMORY[0x1A1AFCA24]();
    v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_autoreleasePoolPop(v119);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v120, CFSTR("queryStartDate"));
    v121 = objc_claimAutoreleasedReturnValue();
    queryStartDate = v5->_queryStartDate;
    v5->_queryStartDate = (NSDate *)v121;

    v5->_feedBack = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feedBack"));
    v123 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sessionID;
  id v5;

  sessionID = self->_sessionID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionID, CFSTR("sessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestionDate, CFSTR("suggestionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locationUUID, CFSTR("locationUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locationUUIDs, CFSTR("locationUUIDs"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_locationType, CFSTR("locationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seedRecipients, CFSTR("seedRecipients"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachments, CFSTR("attachments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appBundleIdsToShareExtensionBundleIdsMapping, CFSTR("appBundleIdsToShareExtensionBundleIdsMapping"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoSuggestedPeople, CFSTR("photoSuggestedPeople"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showPotentialFamilyMembers, CFSTR("showPotentialFamilyMembers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSharePlayAvailable, CFSTR("isSharePlayAvailable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_searchPrefix, CFSTR("searchPrefix"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_suggestionPurpose, CFSTR("suggestionPurpose"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestionsFilteredByBundleIds, CFSTR("suggestionsFilteredByBundleIds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seedContactIdentifiers, CFSTR("seedContactIdentifiers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCollaborationAvailable, CFSTR("isCollaborationAvailable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_linkMetadataFromClient, CFSTR("linkMetadataFromClient"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peopleInPhotoIdentifiers, CFSTR("peopleInPhotoIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scenesInPhotoIdentifiers, CFSTR("scenesInPhotoIdentifiers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFallbackFetch, CFSTR("isFallbackFetch"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCoreMLValidationFetch, CFSTR("isCoreMLValidationFetch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scoredCoreMLCandidates, CFSTR("scoredCoreMLCandidates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_coreMLInputFeatureTensor, CFSTR("coreMLInputFeatureTensor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_coreMLModelFeatureOrder, CFSTR("coreMLModelFeatureOrder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_coreMLTensorIndexToCandidate, CFSTR("coreMLTensorIndexToCandidate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_coreMLNumberOfCandidates, CFSTR("coreMLNumberOfCandidates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trialExperimentId, CFSTR("trialExperimentId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trialTreatmentId, CFSTR("trialTreatmentId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trialDeploymentId, CFSTR("trialDeploymentId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentSpanId, CFSTR("currentSpanId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reasonType, CFSTR("reasonType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_timedOut, CFSTR("timedOut"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestionCompletionDate, CFSTR("suggestionCompletionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestionPath, CFSTR("suggestionPath"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPSRActive, CFSTR("isPSRActive"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedBundleIds, CFSTR("supportedBundleIds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_queryStartDate, CFSTR("queryStartDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_feedBack, CFSTR("feedBack"));

}

- (unint64_t)totalHashOfElementsFromArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3
    && (v13 = 0u,
        v14 = 0u,
        v11 = 0u,
        v12 = 0u,
        (v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16)) != 0))
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 ^= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hash");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  NSUInteger v26;
  uint64_t v27;
  NSUInteger v28;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[_PSPredictionContext seedRecipients](self, "seedRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[_PSPredictionContext totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v3);

  -[_PSPredictionContext locationUUIDs](self, "locationUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[_PSPredictionContext totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v4);

  -[_PSPredictionContext attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[_PSPredictionContext totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v5);

  -[_PSPredictionContext suggestionsFilteredByBundleIds](self, "suggestionsFilteredByBundleIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[_PSPredictionContext totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v6);

  -[_PSPredictionContext seedContactIdentifiers](self, "seedContactIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[_PSPredictionContext totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v7);

  -[_PSPredictionContext linkMetadataFromClient](self, "linkMetadataFromClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[_PSPredictionContext totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v8);

  -[_PSPredictionContext peopleInPhotoIdentifiers](self, "peopleInPhotoIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_PSPredictionContext totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v9);

  -[_PSPredictionContext scenesInPhotoIdentifiers](self, "scenesInPhotoIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_PSPredictionContext totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v11);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = self->_photoSuggestedPeople;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("contactIdentifier"), v30);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v16 ^= objc_msgSend(v19, "hash");

      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = self->_appBundleIdsToShareExtensionBundleIdsMapping;
  v21 = -[NSDictionary countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(v20);
        v23 ^= objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "hash", v30);
      }
      v22 = -[NSDictionary countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v22);
  }
  else
  {
    v23 = 0;
  }

  v26 = -[NSString hash](self->_sessionID, "hash");
  v27 = -[NSDate hash](self->_suggestionDate, "hash");
  v28 = -[NSString hash](self->_bundleID, "hash");
  return v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v10 ^ v26 ^ v27 ^ v28 ^ -[NSString hash](self->_accountIdentifier, "hash") ^ self->_showPotentialFamilyMembers ^ self->_isSharePlayAvailable ^ v12 ^ v16 ^ v23 ^ self->_suggestionPurpose ^ self->_locationType ^ self->_isCollaborationAvailable ^ self->_isFallbackFetch;
}

- (BOOL)isEqual:(id)a3
{
  _PSPredictionContext *v4;
  _PSPredictionContext *v5;
  _PSPredictionContext *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  int v28;
  int64_t v30;
  int64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  uint64_t v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  uint64_t v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  uint64_t v100;
  id v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  uint64_t v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v4 = (_PSPredictionContext *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v28) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[_PSPredictionContext sessionID](self, "sessionID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[_PSPredictionContext sessionID](v6, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[_PSPredictionContext sessionID](self, "sessionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSPredictionContext sessionID](v6, "sessionID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (!v12)
          goto LABEL_16;
      }
    }
    -[_PSPredictionContext bundleID](self, "bundleID");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[_PSPredictionContext bundleID](v6, "bundleID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[_PSPredictionContext bundleID](self, "bundleID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSPredictionContext bundleID](v6, "bundleID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if (!v18)
          goto LABEL_16;
      }
    }
    -[_PSPredictionContext accountIdentifier](self, "accountIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[_PSPredictionContext accountIdentifier](v6, "accountIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[_PSPredictionContext accountIdentifier](self, "accountIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSPredictionContext accountIdentifier](v6, "accountIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToString:", v23);

        if (!v24)
          goto LABEL_16;
      }
    }
    if ((v25 = -[_PSPredictionContext showPotentialFamilyMembers](self, "showPotentialFamilyMembers"),
          v25 != -[_PSPredictionContext showPotentialFamilyMembers](v6, "showPotentialFamilyMembers"))
      || (v26 = -[_PSPredictionContext isSharePlayAvailable](self, "isSharePlayAvailable"),
          v26 != -[_PSPredictionContext isSharePlayAvailable](v6, "isSharePlayAvailable"))
      || (v27 = -[_PSPredictionContext isCollaborationAvailable](self, "isCollaborationAvailable"),
          v27 != -[_PSPredictionContext isCollaborationAvailable](v6, "isCollaborationAvailable"))
      || -[_PSPredictionContext suggestionPurpose](self, "suggestionPurpose")
      && -[_PSPredictionContext suggestionPurpose](v6, "suggestionPurpose")
      && (v30 = -[_PSPredictionContext suggestionPurpose](self, "suggestionPurpose"),
          v30 != -[_PSPredictionContext suggestionPurpose](v6, "suggestionPurpose"))
      || -[_PSPredictionContext locationType](self, "locationType")
      && -[_PSPredictionContext locationType](v6, "locationType")
      && (v31 = -[_PSPredictionContext locationType](self, "locationType"),
          v31 != -[_PSPredictionContext locationType](v6, "locationType")))
    {
LABEL_16:
      LOBYTE(v28) = 0;
    }
    else
    {
      v32 = objc_alloc(MEMORY[0x1E0C99E20]);
      -[_PSPredictionContext seedRecipients](self, "seedRecipients");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v32, "initWithArray:", v33);

      v35 = objc_alloc(MEMORY[0x1E0C99E20]);
      -[_PSPredictionContext seedRecipients](v6, "seedRecipients");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v35, "initWithArray:", v36);

      v38 = objc_msgSend(v34, "count");
      if (v38 == objc_msgSend(v37, "count") && objc_msgSend(v34, "isEqualToSet:", v37))
      {
        objc_msgSend(v34, "count");
        v39 = objc_alloc(MEMORY[0x1E0C99E20]);
        -[_PSPredictionContext locationUUIDs](self, "locationUUIDs");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v39, "initWithArray:", v40);

        v42 = objc_alloc(MEMORY[0x1E0C99E20]);
        -[_PSPredictionContext locationUUIDs](v6, "locationUUIDs");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(v42, "initWithArray:", v43);

        v45 = objc_msgSend(v41, "count");
        if (v45 == objc_msgSend(v44, "count") && objc_msgSend(v41, "isEqualToSet:", v44))
        {
          objc_msgSend(v41, "count");
          v46 = objc_alloc(MEMORY[0x1E0C99E20]);
          -[_PSPredictionContext attachments](self, "attachments");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(v46, "initWithArray:", v47);

          v49 = objc_alloc(MEMORY[0x1E0C99E20]);
          -[_PSPredictionContext attachments](v6, "attachments");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v49, "initWithArray:", v50);

          v52 = (void *)v51;
          v53 = objc_msgSend(v48, "count");
          if (v53 == objc_msgSend(v52, "count") && objc_msgSend(v48, "isEqualToSet:", v52))
          {
            v121 = v41;
            v122 = v52;
            v120 = v44;
            v123 = v48;
            objc_msgSend(v48, "count");
            v54 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            -[_PSPredictionContext photoSuggestedPeople](self, "photoSuggestedPeople");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "count");

            if (v56)
            {
              v57 = 0;
              do
              {
                -[_PSPredictionContext photoSuggestedPeople](self, "photoSuggestedPeople");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "objectAtIndexedSubscript:", v57);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
                v60 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v54, "addObject:", v60);
                ++v57;
                -[_PSPredictionContext photoSuggestedPeople](self, "photoSuggestedPeople");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = objc_msgSend(v61, "count");

              }
              while (v62 > v57);
            }
            v124 = v54;
            v63 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            -[_PSPredictionContext photoSuggestedPeople](v6, "photoSuggestedPeople");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "count");

            if (v65)
            {
              v66 = 0;
              do
              {
                -[_PSPredictionContext photoSuggestedPeople](v6, "photoSuggestedPeople");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "objectAtIndexedSubscript:", v66);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
                v69 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v63, "addObject:", v69);
                ++v66;
                -[_PSPredictionContext photoSuggestedPeople](v6, "photoSuggestedPeople");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                v71 = objc_msgSend(v70, "count");

              }
              while (v71 > v66);
            }
            v72 = v124;
            v73 = objc_msgSend(v124, "count");
            v74 = objc_msgSend(v63, "count");
            v75 = v63;
            if (v73 == v74)
            {
              v118 = v63;
              v119 = v37;
              if (objc_msgSend(v124, "isEqualToSet:"))
              {
                objc_msgSend(v124, "count");
                v76 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                v129 = 0u;
                v130 = 0u;
                v131 = 0u;
                v132 = 0u;
                -[_PSPredictionContext appBundleIdsToShareExtensionBundleIdsMapping](self, "appBundleIdsToShareExtensionBundleIdsMapping");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v129, v134, 16);
                if (v78)
                {
                  v79 = v78;
                  v80 = *(_QWORD *)v130;
                  do
                  {
                    for (i = 0; i != v79; ++i)
                    {
                      if (*(_QWORD *)v130 != v80)
                        objc_enumerationMutation(v77);
                      objc_msgSend(v76, "addObject:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * i));
                    }
                    v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v129, v134, 16);
                  }
                  while (v79);
                }

                v82 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                v125 = 0u;
                v126 = 0u;
                v127 = 0u;
                v128 = 0u;
                -[_PSPredictionContext appBundleIdsToShareExtensionBundleIdsMapping](v6, "appBundleIdsToShareExtensionBundleIdsMapping");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v125, v133, 16);
                if (v84)
                {
                  v85 = v84;
                  v86 = *(_QWORD *)v126;
                  do
                  {
                    for (j = 0; j != v85; ++j)
                    {
                      if (*(_QWORD *)v126 != v86)
                        objc_enumerationMutation(v83);
                      objc_msgSend(v82, "addObject:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * j));
                    }
                    v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v125, v133, 16);
                  }
                  while (v85);
                }

                v88 = objc_msgSend(v76, "count");
                if (v88 == objc_msgSend(v82, "count") && objc_msgSend(v76, "isEqualToSet:", v82))
                {
                  objc_msgSend(v76, "count");
                  v89 = objc_alloc(MEMORY[0x1E0C99E60]);
                  -[_PSPredictionContext suggestionsFilteredByBundleIds](self, "suggestionsFilteredByBundleIds");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  v91 = (void *)objc_msgSend(v89, "initWithArray:", v90);

                  v92 = objc_alloc(MEMORY[0x1E0C99E60]);
                  -[_PSPredictionContext suggestionsFilteredByBundleIds](v6, "suggestionsFilteredByBundleIds");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  v94 = objc_msgSend(v92, "initWithArray:", v93);

                  v116 = (void *)v94;
                  v117 = v91;
                  if (objc_msgSend(v91, "isEqualToSet:", v94))
                  {
                    objc_msgSend(v91, "count");
                    v95 = objc_alloc(MEMORY[0x1E0C99E60]);
                    -[_PSPredictionContext seedContactIdentifiers](self, "seedContactIdentifiers");
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    v97 = (void *)objc_msgSend(v95, "initWithArray:", v96);

                    v98 = objc_alloc(MEMORY[0x1E0C99E60]);
                    -[_PSPredictionContext seedContactIdentifiers](v6, "seedContactIdentifiers");
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    v100 = objc_msgSend(v98, "initWithArray:", v99);

                    v114 = (void *)v100;
                    v115 = v97;
                    if (objc_msgSend(v97, "isEqualToSet:", v100))
                    {
                      objc_msgSend(v97, "count");
                      v101 = objc_alloc(MEMORY[0x1E0C99E60]);
                      -[_PSPredictionContext linkMetadataFromClient](self, "linkMetadataFromClient");
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      v103 = (void *)objc_msgSend(v101, "initWithArray:", v102);

                      v104 = objc_alloc(MEMORY[0x1E0C99E60]);
                      -[_PSPredictionContext linkMetadataFromClient](v6, "linkMetadataFromClient");
                      v105 = (void *)objc_claimAutoreleasedReturnValue();
                      v106 = objc_msgSend(v104, "initWithArray:", v105);

                      v113 = (void *)v106;
                      if (objc_msgSend(v103, "isEqualToSet:", v106))
                      {
                        objc_msgSend(v103, "count");
                        v107 = objc_alloc(MEMORY[0x1E0C99E60]);
                        -[_PSPredictionContext peopleInPhotoIdentifiers](self, "peopleInPhotoIdentifiers");
                        v108 = (void *)objc_claimAutoreleasedReturnValue();
                        v109 = (void *)objc_msgSend(v107, "initWithArray:", v108);

                        v110 = objc_alloc(MEMORY[0x1E0C99E60]);
                        -[_PSPredictionContext peopleInPhotoIdentifiers](v6, "peopleInPhotoIdentifiers");
                        v111 = (void *)objc_claimAutoreleasedReturnValue();
                        v112 = (void *)objc_msgSend(v110, "initWithArray:", v111);

                        v28 = objc_msgSend(v109, "isEqualToSet:", v112);
                        if (v28)
                          objc_msgSend(v109, "count");

                      }
                      else
                      {
                        LOBYTE(v28) = 0;
                      }

                    }
                    else
                    {
                      LOBYTE(v28) = 0;
                    }

                  }
                  else
                  {
                    LOBYTE(v28) = 0;
                  }

                }
                else
                {
                  LOBYTE(v28) = 0;
                }

                v37 = v119;
                v44 = v120;
                v41 = v121;
                v72 = v124;
              }
              else
              {
                LOBYTE(v28) = 0;
                v44 = v120;
                v41 = v121;
              }
              v75 = v118;
            }
            else
            {
              LOBYTE(v28) = 0;
              v44 = v120;
              v41 = v121;
            }

            v52 = v122;
            v48 = v123;
          }
          else
          {
            LOBYTE(v28) = 0;
          }

        }
        else
        {
          LOBYTE(v28) = 0;
        }

      }
      else
      {
        LOBYTE(v28) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v28) = 0;
  }

  return v28;
}

- (BOOL)supportsZKWSuggestions
{
  void *v3;
  void *v4;

  if (supportsZKWSuggestions_onceToken != -1)
    dispatch_once(&supportsZKWSuggestions_onceToken, &__block_literal_global_41);
  v3 = (void *)supportsZKWSuggestions_supportedBundleIds;
  -[_PSPredictionContext bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "containsObject:", v4);

  return (char)v3;
}

- (void)sync:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setAttachments:](self, "setAttachments:", v5);

  objc_msgSend(v4, "photoSuggestedPeople");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setPhotoSuggestedPeople:](self, "setPhotoSuggestedPeople:", v6);

  objc_msgSend(v4, "trialExperimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setTrialExperimentId:](self, "setTrialExperimentId:", v7);

  objc_msgSend(v4, "trialTreatmentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setTrialTreatmentId:](self, "setTrialTreatmentId:", v8);

  objc_msgSend(v4, "trialDeploymentId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setTrialDeploymentId:](self, "setTrialDeploymentId:", v9);

  -[_PSPredictionContext setIsPSRActive:](self, "setIsPSRActive:", objc_msgSend(v4, "isPSRActive"));
  objc_msgSend(v4, "reasonType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setReasonType:](self, "setReasonType:", v10);

  objc_msgSend(v4, "supportedBundleIds");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[_PSPredictionContext setSupportedBundleIds:](self, "setSupportedBundleIds:", v11);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSuggestionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)locationUUID
{
  return self->_locationUUID;
}

- (void)setLocationUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)locationUUIDs
{
  return self->_locationUUIDs;
}

- (void)setLocationUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)seedRecipients
{
  return self->_seedRecipients;
}

- (void)setSeedRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)candidateShareExtensionBundleIds
{
  return self->_candidateShareExtensionBundleIds;
}

- (void)setCandidateShareExtensionBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)appBundleIdsToShareExtensionBundleIdsMapping
{
  return self->_appBundleIdsToShareExtensionBundleIdsMapping;
}

- (void)setAppBundleIdsToShareExtensionBundleIdsMapping:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NSArray)photoSuggestedPeople
{
  return self->_photoSuggestedPeople;
}

- (void)setPhotoSuggestedPeople:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)peopleInPhotoIdentifiers
{
  return self->_peopleInPhotoIdentifiers;
}

- (void)setPeopleInPhotoIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)scenesInPhotoIdentifiers
{
  return self->_scenesInPhotoIdentifiers;
}

- (void)setScenesInPhotoIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)linkMetadataFromClient
{
  return self->_linkMetadataFromClient;
}

- (void)setLinkMetadataFromClient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)showPotentialFamilyMembers
{
  return self->_showPotentialFamilyMembers;
}

- (void)setShowPotentialFamilyMembers:(BOOL)a3
{
  self->_showPotentialFamilyMembers = a3;
}

- (BOOL)isSharePlayAvailable
{
  return self->_isSharePlayAvailable;
}

- (void)setIsSharePlayAvailable:(BOOL)a3
{
  self->_isSharePlayAvailable = a3;
}

- (BOOL)isCollaborationAvailable
{
  return self->_isCollaborationAvailable;
}

- (void)setIsCollaborationAvailable:(BOOL)a3
{
  self->_isCollaborationAvailable = a3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (int64_t)suggestionPurpose
{
  return self->_suggestionPurpose;
}

- (void)setSuggestionPurpose:(int64_t)a3
{
  self->_suggestionPurpose = a3;
}

- (NSArray)suggestionsFilteredByBundleIds
{
  return self->_suggestionsFilteredByBundleIds;
}

- (void)setSuggestionsFilteredByBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)seedContactIdentifiers
{
  return self->_seedContactIdentifiers;
}

- (void)setSeedContactIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)searchPrefix
{
  return self->_searchPrefix;
}

- (void)setSearchPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)isFallbackFetch
{
  return self->_isFallbackFetch;
}

- (void)setIsFallbackFetch:(BOOL)a3
{
  self->_isFallbackFetch = a3;
}

- (BOOL)isCoreMLValidationFetch
{
  return self->_isCoreMLValidationFetch;
}

- (void)setIsCoreMLValidationFetch:(BOOL)a3
{
  self->_isCoreMLValidationFetch = a3;
}

- (NSDictionary)scoredCoreMLCandidates
{
  return self->_scoredCoreMLCandidates;
}

- (void)setScoredCoreMLCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_scoredCoreMLCandidates, a3);
}

- (MLMultiArray)coreMLInputFeatureTensor
{
  return self->_coreMLInputFeatureTensor;
}

- (void)setCoreMLInputFeatureTensor:(id)a3
{
  objc_storeStrong((id *)&self->_coreMLInputFeatureTensor, a3);
}

- (NSArray)coreMLModelFeatureOrder
{
  return self->_coreMLModelFeatureOrder;
}

- (void)setCoreMLModelFeatureOrder:(id)a3
{
  objc_storeStrong((id *)&self->_coreMLModelFeatureOrder, a3);
}

- (NSDictionary)coreMLTensorIndexToCandidate
{
  return self->_coreMLTensorIndexToCandidate;
}

- (void)setCoreMLTensorIndexToCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)coreMLNumberOfCandidates
{
  return self->_coreMLNumberOfCandidates;
}

- (void)setCoreMLNumberOfCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_coreMLNumberOfCandidates, a3);
}

- (int64_t)feedBack
{
  return self->_feedBack;
}

- (void)setFeedBack:(int64_t)a3
{
  self->_feedBack = a3;
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialExperimentId, a3);
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialTreatmentId, a3);
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialDeploymentId, a3);
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (void)setReasonType:(id)a3
{
  objc_storeStrong((id *)&self->_reasonType, a3);
}

- (NSString)currentSpanId
{
  return self->_currentSpanId;
}

- (void)setCurrentSpanId:(id)a3
{
  objc_storeStrong((id *)&self->_currentSpanId, a3);
}

- (NSDate)queryStartDate
{
  return self->_queryStartDate;
}

- (void)setQueryStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSDate)suggestionCompletionDate
{
  return self->_suggestionCompletionDate;
}

- (void)setSuggestionCompletionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)suggestionPath
{
  return self->_suggestionPath;
}

- (void)setSuggestionPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)isPSRActive
{
  return self->_isPSRActive;
}

- (void)setIsPSRActive:(BOOL)a3
{
  self->_isPSRActive = a3;
}

- (NSArray)supportedBundleIds
{
  return self->_supportedBundleIds;
}

- (void)setSupportedBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_supportedBundleIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedBundleIds, 0);
  objc_storeStrong((id *)&self->_suggestionPath, 0);
  objc_storeStrong((id *)&self->_suggestionCompletionDate, 0);
  objc_storeStrong((id *)&self->_queryStartDate, 0);
  objc_storeStrong((id *)&self->_currentSpanId, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_coreMLNumberOfCandidates, 0);
  objc_storeStrong((id *)&self->_coreMLTensorIndexToCandidate, 0);
  objc_storeStrong((id *)&self->_coreMLModelFeatureOrder, 0);
  objc_storeStrong((id *)&self->_coreMLInputFeatureTensor, 0);
  objc_storeStrong((id *)&self->_scoredCoreMLCandidates, 0);
  objc_storeStrong((id *)&self->_searchPrefix, 0);
  objc_storeStrong((id *)&self->_seedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestionsFilteredByBundleIds, 0);
  objc_storeStrong((id *)&self->_linkMetadataFromClient, 0);
  objc_storeStrong((id *)&self->_scenesInPhotoIdentifiers, 0);
  objc_storeStrong((id *)&self->_peopleInPhotoIdentifiers, 0);
  objc_storeStrong((id *)&self->_photoSuggestedPeople, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_appBundleIdsToShareExtensionBundleIdsMapping, 0);
  objc_storeStrong((id *)&self->_candidateShareExtensionBundleIds, 0);
  objc_storeStrong((id *)&self->_seedRecipients, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_locationUUIDs, 0);
  objc_storeStrong((id *)&self->_locationUUID, 0);
  objc_storeStrong((id *)&self->_suggestionDate, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
