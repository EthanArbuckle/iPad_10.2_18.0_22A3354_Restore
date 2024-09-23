@implementation PGGraphInfoNode

- (PGGraphInfoNode)initWithCreationDate:(id)a3 localeIdentifier:(id)a4 languageIdentifiers:(id)a5 geoServiceProviderID:(id)a6 curationAlgorithmsVersion:(unint64_t)a7 contactsStoreAccess:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  PGGraphInfoNode *v18;
  void *v19;
  objc_super v21;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PGGraphInfoNode;
  v18 = -[PGGraphNode init](&v21, sel_init);
  if (v18)
  {
    objc_msgSend((id)objc_opt_class(), "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v14, v15, v16, v17, a7, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphInfoNode setLocalProperties:](v18, "setLocalProperties:", v19);

  }
  return v18;
}

- (PGGraphInfoNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  PGGraphInfoNode *v7;
  PGGraphInfoNode *v8;

  v6 = a5;
  v7 = -[PGGraphNode init](self, "init");
  v8 = v7;
  if (v7)
    -[PGGraphInfoNode setLocalProperties:](v7, "setLocalProperties:", v6);

  return v8;
}

- (void)setLocalProperties:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  NSString *v8;
  NSString *localeIdentifier;
  NSString *v10;
  NSString *flattenedLanguageIdentifiers;
  NSString *v12;
  NSString *geoServiceProviderID;
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
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  double v68;
  void *v69;
  double v70;
  id v71;

  v71 = a3;
  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("creationDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  self->_creationDateTimeInterval = v5;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("dateOfLastIncrementalUpdateInvocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  self->_dateOfLastIncrementalUpdateInvocationTimeInterval = v7;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("localeIdentifier"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = v8;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("languageIdentifiers"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  flattenedLanguageIdentifiers = self->_flattenedLanguageIdentifiers;
  self->_flattenedLanguageIdentifiers = v10;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("geoServiceProviderID"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  geoServiceProviderID = self->_geoServiceProviderID;
  self->_geoServiceProviderID = v12;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("curationAlgorithmsVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_curationAlgorithmsVersion = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("relatedAlgorithmsVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_relatedAlgorithmsVersion = objc_msgSend(v15, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("memoriesAlgorithmsVersion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_memoriesAlgorithmsVersion = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("meaningAlgorithmsVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_meaningAlgorithmsVersion = objc_msgSend(v17, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("personActivityMeaningAlgorithmsVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_personActivityMeaningAlgorithmsVersion = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("relationshipAlgorithmsVersion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_relationshipAlgorithmsVersion = objc_msgSend(v19, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("businessitemAlgorithmsVersion"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_businessItemAlgorithmsVersion = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("publiceventAlgorithmsVersion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  self->_publicEventAlgorithmsVersion = objc_msgSend(v21, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("holidayAlgorithmsVersion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  self->_holidayAlgorithmsVersion = objc_msgSend(v22, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("frequentlocationAlgorithmsVersion"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  self->_frequentLocationAlgorithmsVersion = objc_msgSend(v23, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("autonamingAlgorithmsVersion"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  self->_autonamingAlgorithmsVersion = objc_msgSend(v24, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("questionsVersion"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  self->_questionsVersion = objc_msgSend(v25, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("tripKeyAssetAlgorithmsVersion"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  self->_tripKeyAssetAlgorithmsVersion = objc_msgSend(v26, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("ageCategoryAlgorithmsVersion"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  self->_ageCategoryAlgorithmsVersion = objc_msgSend(v27, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("memoryQualityAlgorithmsVersion"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  self->_memoryQualityAlgorithmsVersion = objc_msgSend(v28, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("petAlgorithmsVersion"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  self->_petAlgorithmsVersion = objc_msgSend(v29, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("featuredPhotoAlgorithmsVersion"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  self->_featuredPhotoAlgorithmsVersion = objc_msgSend(v30, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("longTailFeaturedPhotoAlgorithmsVersion"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  self->_longTailFeaturedPhotoAlgorithmsVersion = objc_msgSend(v31, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("sharedLibrarySuggestionsAlgorithmsVersion"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sharedLibrarySuggestionsAlgorithmsVersion = objc_msgSend(v32, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("sharedLibraryStartAlgorithmsVersion"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sharedLibraryStartAlgorithmsVersion = objc_msgSend(v33, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("sharedLibraryCameraLibrarySwitchAlgorithmsVersion"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sharedLibraryCameraLibrarySwitchAlgorithmsVersion = objc_msgSend(v34, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("wallpaperAlgorithmsVersion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wallpaperAlgorithmsVersion = objc_msgSend(v35, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("locationRepresentativeAssetAlgorithmsVersion"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  self->_locationRepresentativeAssetAlgorithmsVersion = objc_msgSend(v36, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("eventLabelingV2ModelVersion"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  self->_eventLabelingV2ModelVersion = objc_msgSend(v37, "integerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("personalTraitsEntityNamesVersion"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  self->_personalTraitsEntityNamesVersion = objc_msgSend(v38, "integerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("canUseLocationDomain"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
    v41 = objc_msgSend(v39, "BOOLValue");
  else
    v41 = 1;
  self->_canUseLocationDomain = v41;
  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("routineAvailable"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  self->_routineInfo.routineAvailable = objc_msgSend(v42, "BOOLValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("routineNumberOfLocationsOfInterest"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  self->_routineInfo.numberOfLocationsOfInterest = objc_msgSend(v43, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("routineNumberOfVisits"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  self->_routineInfo.numberOfVisits = objc_msgSend(v44, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("routineNumberOfTimeMatches"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  self->_routineInfo.numberOfTimeMatches = objc_msgSend(v45, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("routineNumberOfClosebyLocationMatches"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  self->_routineInfo.numberOfCloseByLocationMatches = objc_msgSend(v46, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("routineNumberOfRemoteLocationMatches"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  self->_routineInfo.numberOfRemoteLocationMatches = objc_msgSend(v47, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("routineNumberofMatchRequests"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  self->_routineInfo.numberOfMatchRequests = objc_msgSend(v48, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("routinePinningVisitsRatio"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "doubleValue");
  self->_routineInfo.pinningVisitsRatio = v50;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("personalGoodAestheticsThreshold"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "doubleValue");
  self->_personalGoodAestheticsThreshold = v52;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("personalHighAestheticsThreshold"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "doubleValue");
  self->_personalHighAestheticsThreshold = v54;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("numberOfSelfies"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfSelfies = objc_msgSend(v55, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("topTierAestheticScore"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "doubleValue");
  self->_topTierAestheticScore = v57;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("topTierAestheticScoreForTripKeyAsset"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "doubleValue");
  self->_topTierAestheticScoreForTripKeyAsset = v59;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("numberOfUtilityAssets"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfUtilityAssets = objc_msgSend(v60, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("numberOfDefaultAssets"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfDefaultAssets = objc_msgSend(v61, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("numberOfImprovedAssets"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfImprovedAssets = objc_msgSend(v62, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("numberOfBetterAssets"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfBetterAssets = objc_msgSend(v63, "unsignedIntegerValue");

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("canAccessContactsStore"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v64)
    v66 = objc_msgSend(v64, "BOOLValue");
  else
    v66 = 1;
  self->_canAccessContactsStore = v66;
  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("mergeCandidateConfidenceThreshold"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "doubleValue");
  self->_mergeCandidateConfidenceThreshold = v68;

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("IntelligencePlatformVersion"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "doubleValue");
  self->_intelligencePlatformVersion = v70;

}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  BOOL v66;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      if (v8 != self->_creationDateTimeInterval)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateOfLastIncrementalUpdateInvocation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      if (v10 != self->_dateOfLastIncrementalUpdateInvocationTimeInterval)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localeIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v11)
    {
      if (!objc_msgSend(v11, "isEqual:", self->_localeIdentifier))
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("languageIdentifiers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v12)
    {
      if (!objc_msgSend(v12, "isEqual:", self->_flattenedLanguageIdentifiers))
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("geoServiceProviderID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v13)
    {
      if (!objc_msgSend(v13, "isEqual:", self->_geoServiceProviderID))
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("curationAlgorithmsVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "unsignedIntegerValue") != self->_curationAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relatedAlgorithmsVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v15)
    {
      if (objc_msgSend(v15, "unsignedIntegerValue") != self->_relatedAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("memoriesAlgorithmsVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
    if (v16)
    {
      if (objc_msgSend(v16, "unsignedIntegerValue") != self->_memoriesAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("meaningAlgorithmsVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v17)
    {
      if (objc_msgSend(v17, "unsignedIntegerValue") != self->_meaningAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personActivityMeaningAlgorithmsVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "unsignedIntegerValue") != self->_personActivityMeaningAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relationshipAlgorithmsVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    if (v19)
    {
      if (objc_msgSend(v19, "unsignedIntegerValue") != self->_relationshipAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("businessitemAlgorithmsVersion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v20;
    if (v20)
    {
      if (objc_msgSend(v20, "unsignedIntegerValue") != self->_businessItemAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("publiceventAlgorithmsVersion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v21)
    {
      if (objc_msgSend(v21, "unsignedIntegerValue") != self->_publicEventAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("holidayAlgorithmsVersion"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    if (v22)
    {
      if (objc_msgSend(v22, "unsignedIntegerValue") != self->_holidayAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("frequentlocationAlgorithmsVersion"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v23;
    if (v23)
    {
      if (objc_msgSend(v23, "unsignedIntegerValue") != self->_frequentLocationAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("autonamingAlgorithmsVersion"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;
    if (v24)
    {
      if (objc_msgSend(v24, "unsignedIntegerValue") != self->_autonamingAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("questionsVersion"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v25;
    if (v25)
    {
      if (objc_msgSend(v25, "unsignedIntegerValue") != self->_questionsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tripKeyAssetAlgorithmsVersion"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;
    if (v26)
    {
      if (objc_msgSend(v26, "unsignedIntegerValue") != self->_tripKeyAssetAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ageCategoryAlgorithmsVersion"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v27;
    if (v27)
    {
      if (objc_msgSend(v27, "unsignedIntegerValue") != self->_ageCategoryAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("memoryQualityAlgorithmsVersion"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v28;
    if (v28)
    {
      if (objc_msgSend(v28, "unsignedIntegerValue") != self->_memoryQualityAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("petAlgorithmsVersion"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v29;
    if (v29)
    {
      if (objc_msgSend(v29, "unsignedIntegerValue") != self->_petAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("featuredPhotoAlgorithmsVersion"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v30;
    if (v30)
    {
      if (objc_msgSend(v30, "unsignedIntegerValue") != self->_featuredPhotoAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("longTailFeaturedPhotoAlgorithmsVersion"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v31;
    if (v31)
    {
      if (objc_msgSend(v31, "unsignedIntegerValue") != self->_longTailFeaturedPhotoAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sharedLibrarySuggestionsAlgorithmsVersion"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v32;
    if (v32)
    {
      if (objc_msgSend(v32, "unsignedIntegerValue") != self->_sharedLibrarySuggestionsAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sharedLibraryStartAlgorithmsVersion"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v33;
    if (v33)
    {
      if (objc_msgSend(v33, "unsignedIntegerValue") != self->_sharedLibraryStartAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sharedLibraryCameraLibrarySwitchAlgorithmsVersion"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v34;
    if (v34)
    {
      if (objc_msgSend(v34, "unsignedIntegerValue") != self->_sharedLibraryCameraLibrarySwitchAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wallpaperAlgorithmsVersion"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v35;
    if (v35)
    {
      if (objc_msgSend(v35, "unsignedIntegerValue") != self->_wallpaperAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locationRepresentativeAssetAlgorithmsVersion"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v36;
    if (v36)
    {
      if (objc_msgSend(v36, "unsignedIntegerValue") != self->_locationRepresentativeAssetAlgorithmsVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventLabelingV2ModelVersion"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v37;
    if (v37)
    {
      if (objc_msgSend(v37, "integerValue") != self->_eventLabelingV2ModelVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personalTraitsEntityNamesVersion"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v38;
    if (v38)
    {
      if (objc_msgSend(v38, "integerValue") != self->_personalTraitsEntityNamesVersion)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("canUseLocationDomain"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v39;
    if (v39)
    {
      if (self->_canUseLocationDomain != objc_msgSend(v39, "BOOLValue"))
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routineAvailable"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v40;
    if (v40)
    {
      if (self->_routineInfo.routineAvailable != objc_msgSend(v40, "BOOLValue"))
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routineNumberOfLocationsOfInterest"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v41;
    if (v41)
    {
      if (objc_msgSend(v41, "unsignedIntegerValue") != self->_routineInfo.numberOfLocationsOfInterest)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routineNumberOfVisits"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v42;
    if (v42)
    {
      if (objc_msgSend(v42, "unsignedIntegerValue") != self->_routineInfo.numberOfVisits)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routineNumberOfTimeMatches"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v43;
    if (v43)
    {
      if (objc_msgSend(v43, "unsignedIntegerValue") != self->_routineInfo.numberOfTimeMatches)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routineNumberOfClosebyLocationMatches"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v44;
    if (v44)
    {
      if (objc_msgSend(v44, "unsignedIntegerValue") != self->_routineInfo.numberOfCloseByLocationMatches)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routineNumberOfRemoteLocationMatches"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v45;
    if (v45)
    {
      if (objc_msgSend(v45, "unsignedIntegerValue") != self->_routineInfo.numberOfRemoteLocationMatches)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routineNumberofMatchRequests"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v46;
    if (v46)
    {
      if (objc_msgSend(v46, "unsignedIntegerValue") != self->_routineInfo.numberOfMatchRequests)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routinePinningVisitsRatio"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v47;
    if (v47)
    {
      if (self->_routineInfo.pinningVisitsRatio != (double)(unint64_t)objc_msgSend(v47, "unsignedIntegerValue"))
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personalGoodAestheticsThreshold"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v48;
    if (v48)
    {
      objc_msgSend(v48, "doubleValue");
      if (v49 != self->_personalGoodAestheticsThreshold)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personalHighAestheticsThreshold"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v50;
    if (v50)
    {
      objc_msgSend(v50, "doubleValue");
      if (v51 != self->_personalHighAestheticsThreshold)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfSelfies"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v52;
    if (v52)
    {
      if (objc_msgSend(v52, "unsignedIntegerValue") != self->_numberOfSelfies)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("topTierAestheticScore"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v53;
    if (v53)
    {
      objc_msgSend(v53, "doubleValue");
      if (v54 != self->_topTierAestheticScore)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("topTierAestheticScoreForTripKeyAsset"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v55;
    if (v55)
    {
      objc_msgSend(v55, "doubleValue");
      if (v56 != self->_topTierAestheticScoreForTripKeyAsset)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfUtilityAssets"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v57;
    if (v57)
    {
      if (objc_msgSend(v57, "unsignedIntegerValue") != self->_numberOfUtilityAssets)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfDefaultAssets"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v58;
    if (v58)
    {
      if (objc_msgSend(v58, "unsignedIntegerValue") != self->_numberOfDefaultAssets)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfImprovedAssets"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v59;
    if (v59)
    {
      if (objc_msgSend(v59, "unsignedIntegerValue") != self->_numberOfImprovedAssets)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfBetterAssets"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v60;
    if (v60)
    {
      if (objc_msgSend(v60, "unsignedIntegerValue") != self->_numberOfBetterAssets)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("canAccessContactsStore"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v61;
    if (v61)
    {
      if (self->_canAccessContactsStore != objc_msgSend(v61, "BOOLValue"))
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mergeCandidateConfidenceThreshold"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v62;
    if (v62)
    {
      objc_msgSend(v62, "doubleValue");
      if (v63 != self->_mergeCandidateConfidenceThreshold)
        goto LABEL_105;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IntelligencePlatformVersion"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v64;
    if (!v64 || (objc_msgSend(v64, "doubleValue"), v65 == self->_intelligencePlatformVersion))
      v66 = 1;
    else
LABEL_105:
      v66 = 0;

  }
  else
  {
    v66 = 1;
  }

  return v66;
}

- (id)propertyDictionary
{
  uint64_t v3;
  NSString *localeIdentifier;
  NSString *geoServiceProviderID;
  NSString *flattenedLanguageIdentifiers;
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
  _QWORD v57[51];
  _QWORD v58[53];

  v58[51] = *MEMORY[0x1E0C80C00];
  v57[0] = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDateTimeInterval);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v56;
  v57[1] = CFSTR("dateOfLastIncrementalUpdateInvocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateOfLastIncrementalUpdateInvocationTimeInterval);
  v3 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v3;
  localeIdentifier = self->_localeIdentifier;
  geoServiceProviderID = (NSString *)&stru_1E8436F28;
  if (!localeIdentifier)
    localeIdentifier = (NSString *)&stru_1E8436F28;
  v58[1] = v3;
  v58[2] = localeIdentifier;
  v57[2] = CFSTR("localeIdentifier");
  v57[3] = CFSTR("languageIdentifiers");
  flattenedLanguageIdentifiers = self->_flattenedLanguageIdentifiers;
  if (!flattenedLanguageIdentifiers)
    flattenedLanguageIdentifiers = (NSString *)&stru_1E8436F28;
  if (self->_geoServiceProviderID)
    geoServiceProviderID = self->_geoServiceProviderID;
  v58[3] = flattenedLanguageIdentifiers;
  v58[4] = geoServiceProviderID;
  v57[4] = CFSTR("geoServiceProviderID");
  v57[5] = CFSTR("curationAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_curationAlgorithmsVersion);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v58[5] = v54;
  v57[6] = CFSTR("relatedAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_relatedAlgorithmsVersion);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v58[6] = v53;
  v57[7] = CFSTR("memoriesAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_memoriesAlgorithmsVersion);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v58[7] = v52;
  v57[8] = CFSTR("meaningAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_meaningAlgorithmsVersion);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v58[8] = v51;
  v57[9] = CFSTR("eventLabelingV2ModelVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_eventLabelingV2ModelVersion);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v58[9] = v50;
  v57[10] = CFSTR("personalTraitsEntityNamesVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_personalTraitsEntityNamesVersion);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v58[10] = v49;
  v57[11] = CFSTR("personActivityMeaningAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_personActivityMeaningAlgorithmsVersion);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v58[11] = v48;
  v57[12] = CFSTR("relationshipAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_relationshipAlgorithmsVersion);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v58[12] = v47;
  v57[13] = CFSTR("businessitemAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_businessItemAlgorithmsVersion);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v58[13] = v46;
  v57[14] = CFSTR("publiceventAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_publicEventAlgorithmsVersion);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v58[14] = v45;
  v57[15] = CFSTR("holidayAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_holidayAlgorithmsVersion);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v58[15] = v44;
  v57[16] = CFSTR("frequentlocationAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_frequentLocationAlgorithmsVersion);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[16] = v43;
  v57[17] = CFSTR("autonamingAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_autonamingAlgorithmsVersion);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58[17] = v42;
  v57[18] = CFSTR("questionsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_questionsVersion);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v58[18] = v41;
  v57[19] = CFSTR("tripKeyAssetAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_tripKeyAssetAlgorithmsVersion);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v58[19] = v40;
  v57[20] = CFSTR("ageCategoryAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_ageCategoryAlgorithmsVersion);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v58[20] = v39;
  v57[21] = CFSTR("memoryQualityAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_memoryQualityAlgorithmsVersion);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v58[21] = v38;
  v57[22] = CFSTR("petAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_petAlgorithmsVersion);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v58[22] = v37;
  v57[23] = CFSTR("featuredPhotoAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_featuredPhotoAlgorithmsVersion);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v58[23] = v36;
  v57[24] = CFSTR("longTailFeaturedPhotoAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_longTailFeaturedPhotoAlgorithmsVersion);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v58[24] = v35;
  v57[25] = CFSTR("sharedLibrarySuggestionsAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sharedLibrarySuggestionsAlgorithmsVersion);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v58[25] = v34;
  v57[26] = CFSTR("sharedLibraryStartAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sharedLibraryStartAlgorithmsVersion);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v58[26] = v33;
  v57[27] = CFSTR("sharedLibraryCameraLibrarySwitchAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sharedLibraryCameraLibrarySwitchAlgorithmsVersion);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v58[27] = v32;
  v57[28] = CFSTR("wallpaperAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_wallpaperAlgorithmsVersion);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v58[28] = v31;
  v57[29] = CFSTR("locationRepresentativeAssetAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_locationRepresentativeAssetAlgorithmsVersion);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58[29] = v30;
  v57[30] = CFSTR("canUseLocationDomain");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canUseLocationDomain);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v58[30] = v29;
  v57[31] = CFSTR("routineAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_routineInfo.routineAvailable);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v58[31] = v28;
  v57[32] = CFSTR("routineNumberOfLocationsOfInterest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_routineInfo.numberOfLocationsOfInterest);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58[32] = v27;
  v57[33] = CFSTR("routineNumberOfVisits");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_routineInfo.numberOfVisits);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v58[33] = v26;
  v57[34] = CFSTR("routineNumberOfTimeMatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_routineInfo.numberOfTimeMatches);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v58[34] = v25;
  v57[35] = CFSTR("routineNumberOfClosebyLocationMatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_routineInfo.numberOfCloseByLocationMatches);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v58[35] = v24;
  v57[36] = CFSTR("routineNumberOfRemoteLocationMatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_routineInfo.numberOfRemoteLocationMatches);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v58[36] = v23;
  v57[37] = CFSTR("routineNumberofMatchRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_routineInfo.numberOfMatchRequests);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v58[37] = v22;
  v57[38] = CFSTR("routinePinningVisitsRatio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_routineInfo.pinningVisitsRatio);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58[38] = v21;
  v57[39] = CFSTR("personalGoodAestheticsThreshold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_personalGoodAestheticsThreshold);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58[39] = v20;
  v57[40] = CFSTR("personalHighAestheticsThreshold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_personalHighAestheticsThreshold);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58[40] = v19;
  v57[41] = CFSTR("numberOfSelfies");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfSelfies);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58[41] = v18;
  v57[42] = CFSTR("topTierAestheticScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_topTierAestheticScore);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v58[42] = v7;
  v57[43] = CFSTR("topTierAestheticScoreForTripKeyAsset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_topTierAestheticScoreForTripKeyAsset);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58[43] = v8;
  v57[44] = CFSTR("numberOfUtilityAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfUtilityAssets);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58[44] = v9;
  v57[45] = CFSTR("numberOfDefaultAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfDefaultAssets);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58[45] = v10;
  v57[46] = CFSTR("numberOfImprovedAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfImprovedAssets);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58[46] = v11;
  v57[47] = CFSTR("numberOfBetterAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfBetterAssets);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58[47] = v12;
  v57[48] = CFSTR("canAccessContactsStore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canAccessContactsStore);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58[48] = v13;
  v57[49] = CFSTR("mergeCandidateConfidenceThreshold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mergeCandidateConfidenceThreshold);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58[49] = v14;
  v57[50] = CFSTR("IntelligencePlatformVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_intelligencePlatformVersion);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58[50] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 51);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Info");
  return CFSTR("Info");
}

- (unsigned)domain
{
  return 21;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_creationDateTimeInterval);
}

- (NSDate)dateOfLastIncrementalUpdateInvocation
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_dateOfLastIncrementalUpdateInvocationTimeInterval);
}

- (NSLocale)locale
{
  return (NSLocale *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", self->_localeIdentifier);
}

- (NSArray)languageIdentifiers
{
  return (NSArray *)objc_msgSend((id)objc_opt_class(), "deserializeLanguageIdentifiers:", self->_flattenedLanguageIdentifiers);
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfDefaultAssets
       + self->_numberOfUtilityAssets
       + self->_numberOfImprovedAssets
       + self->_numberOfBetterAssets;
}

- (double)topTierAestheticScore
{
  double result;

  result = self->_topTierAestheticScore;
  if (result < 0.52)
    return 0.52;
  return result;
}

- (double)topTierAestheticScoreForTripKeyAsset
{
  double result;

  result = self->_topTierAestheticScoreForTripKeyAsset;
  if (result < 0.52)
    return 0.52;
  return result;
}

- (NSString)localeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)geoServiceProviderID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)curationAlgorithmsVersion
{
  return self->_curationAlgorithmsVersion;
}

- (unint64_t)relatedAlgorithmsVersion
{
  return self->_relatedAlgorithmsVersion;
}

- (unint64_t)memoriesAlgorithmsVersion
{
  return self->_memoriesAlgorithmsVersion;
}

- (unint64_t)meaningAlgorithmsVersion
{
  return self->_meaningAlgorithmsVersion;
}

- (int64_t)eventLabelingV2ModelVersion
{
  return self->_eventLabelingV2ModelVersion;
}

- (int64_t)personalTraitsEntityNamesVersion
{
  return self->_personalTraitsEntityNamesVersion;
}

- (unint64_t)personActivityMeaningAlgorithmsVersion
{
  return self->_personActivityMeaningAlgorithmsVersion;
}

- (unint64_t)relationshipAlgorithmsVersion
{
  return self->_relationshipAlgorithmsVersion;
}

- (unint64_t)businessItemAlgorithmsVersion
{
  return self->_businessItemAlgorithmsVersion;
}

- (unint64_t)publicEventAlgorithmsVersion
{
  return self->_publicEventAlgorithmsVersion;
}

- (unint64_t)holidayAlgorithmsVersion
{
  return self->_holidayAlgorithmsVersion;
}

- (unint64_t)frequentLocationAlgorithmsVersion
{
  return self->_frequentLocationAlgorithmsVersion;
}

- (unint64_t)autonamingAlgorithmsVersion
{
  return self->_autonamingAlgorithmsVersion;
}

- (unint64_t)questionsVersion
{
  return self->_questionsVersion;
}

- (unint64_t)tripKeyAssetAlgorithmsVersion
{
  return self->_tripKeyAssetAlgorithmsVersion;
}

- (unint64_t)ageCategoryAlgorithmsVersion
{
  return self->_ageCategoryAlgorithmsVersion;
}

- (unint64_t)memoryQualityAlgorithmsVersion
{
  return self->_memoryQualityAlgorithmsVersion;
}

- (unint64_t)petAlgorithmsVersion
{
  return self->_petAlgorithmsVersion;
}

- (unint64_t)featuredPhotoAlgorithmsVersion
{
  return self->_featuredPhotoAlgorithmsVersion;
}

- (unint64_t)longTailFeaturedPhotoAlgorithmsVersion
{
  return self->_longTailFeaturedPhotoAlgorithmsVersion;
}

- (unint64_t)sharedLibrarySuggestionsAlgorithmsVersion
{
  return self->_sharedLibrarySuggestionsAlgorithmsVersion;
}

- (unint64_t)sharedLibraryStartAlgorithmsVersion
{
  return self->_sharedLibraryStartAlgorithmsVersion;
}

- (unint64_t)sharedLibraryCameraLibrarySwitchAlgorithmsVersion
{
  return self->_sharedLibraryCameraLibrarySwitchAlgorithmsVersion;
}

- (unint64_t)wallpaperAlgorithmsVersion
{
  return self->_wallpaperAlgorithmsVersion;
}

- (unint64_t)locationRepresentativeAssetAlgorithmsVersion
{
  return self->_locationRepresentativeAssetAlgorithmsVersion;
}

- (BOOL)canUseLocationDomain
{
  return self->_canUseLocationDomain;
}

- (PGRoutineInfoStruct)routineInfo
{
  PGRoutineInfoStruct *result;

  objc_copyStruct(retstr, &self->_routineInfo, 64, 1, 0);
  return result;
}

- (double)personalGoodAestheticsThreshold
{
  return self->_personalGoodAestheticsThreshold;
}

- (double)personalHighAestheticsThreshold
{
  return self->_personalHighAestheticsThreshold;
}

- (unint64_t)numberOfSelfies
{
  return self->_numberOfSelfies;
}

- (unint64_t)numberOfUtilityAssets
{
  return self->_numberOfUtilityAssets;
}

- (unint64_t)numberOfDefaultAssets
{
  return self->_numberOfDefaultAssets;
}

- (unint64_t)numberOfImprovedAssets
{
  return self->_numberOfImprovedAssets;
}

- (unint64_t)numberOfBetterAssets
{
  return self->_numberOfBetterAssets;
}

- (BOOL)canAccessContactsStore
{
  return self->_canAccessContactsStore;
}

- (double)mergeCandidateConfidenceThreshold
{
  return self->_mergeCandidateConfidenceThreshold;
}

- (double)intelligencePlatformVersion
{
  return self->_intelligencePlatformVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoServiceProviderID, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_flattenedLanguageIdentifiers, 0);
}

+ (id)genericPropertiesWithCreationDate:(id)a3 localeIdentifier:(id)a4 languageIdentifiers:(id)a5 geoServiceProviderID:(id)a6 curationAlgorithmsVersion:(unint64_t)a7 contactsStoreAccess:(BOOL)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
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
  _BOOL4 v35;
  void *v37;
  void *v38;
  void *v39;
  PGEventLabelingConfiguration *v40;
  _QWORD v41[33];
  _QWORD v42[35];

  v35 = a8;
  v42[33] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  objc_msgSend((id)objc_opt_class(), "serializeLanguageIdentifiers:", v13);
  v15 = objc_claimAutoreleasedReturnValue();

  v40 = objc_alloc_init(PGEventLabelingConfiguration);
  v16 = -[PGEventLabelingConfiguration modelVersion](v40, "modelVersion");
  if (_os_feature_enabled_impl())
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D77EE8]);
    v18 = objc_msgSend(v17, "configurationVersion");

  }
  else
  {
    v18 = 0;
  }
  v19 = *MEMORY[0x1E0D3DF78];
  v41[0] = CFSTR("creationDate");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v39;
  v41[1] = CFSTR("dateOfLastIncrementalUpdateInvocation");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v23 = v22;

  objc_msgSend(v21, "numberWithDouble:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v24;
  v42[2] = v11;
  v38 = v11;
  v41[2] = CFSTR("localeIdentifier");
  v41[3] = CFSTR("languageIdentifiers");
  v42[3] = v15;
  v42[4] = v12;
  v41[4] = CFSTR("geoServiceProviderID");
  v41[5] = CFSTR("canAccessContactsStore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v25;
  v41[6] = CFSTR("eventLabelingV2ModelVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v26;
  v41[7] = CFSTR("personalTraitsEntityNamesVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v27;
  v41[8] = CFSTR("curationAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v28;
  v42[9] = &unk_1E84E4D78;
  v41[9] = CFSTR("relatedAlgorithmsVersion");
  v41[10] = CFSTR("memoriesAlgorithmsVersion");
  v42[10] = &unk_1E84E4D90;
  v42[11] = &unk_1E84E4DA8;
  v37 = (void *)v15;
  v41[11] = CFSTR("meaningAlgorithmsVersion");
  v41[12] = CFSTR("personActivityMeaningAlgorithmsVersion");
  v42[12] = &unk_1E84E4DC0;
  v42[13] = &unk_1E84E4D78;
  v41[13] = CFSTR("relationshipAlgorithmsVersion");
  v41[14] = CFSTR("businessitemAlgorithmsVersion");
  v42[14] = &unk_1E84E4DC0;
  v42[15] = &unk_1E84E4DC0;
  v41[15] = CFSTR("publiceventAlgorithmsVersion");
  v41[16] = CFSTR("holidayAlgorithmsVersion");
  v42[16] = &unk_1E84E4DD8;
  v42[17] = &unk_1E84E4DD8;
  v41[17] = CFSTR("frequentlocationAlgorithmsVersion");
  v41[18] = CFSTR("autonamingAlgorithmsVersion");
  v42[18] = &unk_1E84E4DC0;
  v42[19] = &unk_1E84E4DF0;
  v41[19] = CFSTR("questionsVersion");
  v41[20] = CFSTR("tripKeyAssetAlgorithmsVersion");
  v42[20] = &unk_1E84E4DC0;
  v42[21] = &unk_1E84E4DC0;
  v41[21] = CFSTR("ageCategoryAlgorithmsVersion");
  v41[22] = CFSTR("memoryQualityAlgorithmsVersion");
  v42[22] = &unk_1E84E4DC0;
  v41[23] = CFSTR("petAlgorithmsVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 201);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[23] = v29;
  v42[24] = &unk_1E84E4DC0;
  v41[24] = CFSTR("featuredPhotoAlgorithmsVersion");
  v41[25] = CFSTR("longTailFeaturedPhotoAlgorithmsVersion");
  v42[25] = &unk_1E84E4DC0;
  v42[26] = &unk_1E84E4DC0;
  v41[26] = CFSTR("sharedLibrarySuggestionsAlgorithmsVersion");
  v41[27] = CFSTR("sharedLibraryStartAlgorithmsVersion");
  v42[27] = &unk_1E84E4DC0;
  v42[28] = &unk_1E84E4DD8;
  v41[28] = CFSTR("sharedLibraryCameraLibrarySwitchAlgorithmsVersion");
  v41[29] = CFSTR("wallpaperAlgorithmsVersion");
  v42[29] = &unk_1E84E4DC0;
  v42[30] = &unk_1E84E4DD8;
  v41[30] = CFSTR("locationRepresentativeAssetAlgorithmsVersion");
  v41[31] = CFSTR("mergeCandidateConfidenceThreshold");
  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D77E08], "mergeCandidateConfidenceThreshold");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[31] = v31;
  v41[32] = CFSTR("IntelligencePlatformVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[32] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 33);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)propertiesWithLastIncrementalUpdateInvocationOnDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("dateOfLastIncrementalUpdateInvocation");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)locationPropertiesWithCanUseLocationDomain:(BOOL)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("canUseLocationDomain");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)routineInfoPropertiesWithServiceManager:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v18[8];
  _QWORD v19[9];

  v19[8] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("routineAvailable");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "routineIsAvailable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v18[1] = CFSTR("routineNumberOfLocationsOfInterest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfLocationsOfInterest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  v18[2] = CFSTR("routineNumberOfVisits");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfVisits"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("routineNumberOfTimeMatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfTimeMatches"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v8;
  v18[4] = CFSTR("routineNumberOfClosebyLocationMatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfCloseByLocationMatches"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v9;
  v18[5] = CFSTR("routineNumberOfRemoteLocationMatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfRemoteLocationMatches"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v10;
  v18[6] = CFSTR("routineNumberofMatchRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfMatchRequests"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v11;
  v18[7] = CFSTR("routinePinningVisitsRatio");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "pinningVisitsRatio");
  v14 = v13;

  objc_msgSend(v12, "numberWithDouble:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)assetPropertiesWithNumberOfUtilityAssets:(unint64_t)a3 numberOfDefaultAssets:(unint64_t)a4 numberOfImprovedAssets:(unint64_t)a5 numberOfBetterAssets:(unint64_t)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("numberOfUtilityAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v15[1] = CFSTR("numberOfDefaultAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  v15[2] = CFSTR("numberOfImprovedAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  v15[3] = CFSTR("numberOfBetterAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)topTierScorePropertiesWithAestheticScore:(double)a3 aestheticScoreForTripKeyAsset:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("topTierAestheticScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("topTierAestheticScoreForTripKeyAsset");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)personalAestheticsPropertiesWithHighAestheticsThreshold:(double)a3 goodAestheticsThreshold:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("personalHighAestheticsThreshold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("personalGoodAestheticsThreshold");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)numberOfSelfies:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("numberOfSelfies");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)serializeLanguageIdentifiers:(id)a3
{
  return (id)objc_msgSend(a3, "componentsJoinedByString:", CFSTR(","));
}

+ (id)deserializeLanguageIdentifiers:(id)a3
{
  return (id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
}

@end
