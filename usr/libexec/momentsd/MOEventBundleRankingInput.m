@implementation MOEventBundleRankingInput

- (id)dictionary
{
  NSMutableDictionary *v3;
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

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRankingInput bundleIdentifier](self, "bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v5, CFSTR("bundleID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRankingInput suggestionIdentifier](self, "suggestionIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v7, CFSTR("suggestionID"));

  -[MOEventBundleRankingInput bundleRecencyDaysElapsed](self, "bundleRecencyDaysElapsed");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v8, CFSTR("bundleRecencyDaysElapsed"));

  -[MOEventBundleRankingInput numAnomalyEventsNormalized](self, "numAnomalyEventsNormalized");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v9, CFSTR("numAnomalyEventsNormalized"));

  -[MOEventBundleRankingInput numTrendEventsNormalized](self, "numTrendEventsNormalized");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v10, CFSTR("numTrendEventsNormalized"));

  -[MOEventBundleRankingInput numRoutineEventsNormalized](self, "numRoutineEventsNormalized");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v11, CFSTR("numRoutineEventsNormalized"));

  -[MOEventBundleRankingInput numStateOfMindEventsNormalized](self, "numStateOfMindEventsNormalized");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v12, CFSTR("numStateOfMindEventsNormalized"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOEventBundleRankingInput bundleInterfaceType](self, "bundleInterfaceType")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v13, CFSTR("bundleInterfaceType"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOEventBundleRankingInput bundleSubType](self, "bundleSubType")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v14, CFSTR("bundleSubType"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOEventBundleRankingInput bundleSuperType](self, "bundleSuperType")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v15, CFSTR("bundleSuperType"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRankingInput bundleRichnessDict](self, "bundleRichnessDict"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v16, CFSTR("bundleRichnessDict"));

  -[MOEventBundleRankingInput isBundleActionSpecific](self, "isBundleActionSpecific");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v17, CFSTR("isBundleActionSpecific"));

  -[MOEventBundleRankingInput isBundlePlaceTypeSpecific](self, "isBundlePlaceTypeSpecific");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v18, CFSTR("isBundlePlaceTypeSpecific"));

  -[MOEventBundleRankingInput isBundleTimeTagSpecific](self, "isBundleTimeTagSpecific");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v19, CFSTR("isBundleTimeTagSpecific"));

  -[MOEventBundleRankingInput labelSpecificityNormalized](self, "labelSpecificityNormalized");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v20, CFSTR("labelSpecificityNormalized"));

  -[MOEventBundleRankingInput interestingPOIFeature](self, "interestingPOIFeature");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v21, CFSTR("interestingPOIFeature"));

  -[MOEventBundleRankingInput distanceToHomeFeatureNormalized](self, "distanceToHomeFeatureNormalized");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v22, CFSTR("distanceToHomeFeatureNormalized"));

  -[MOEventBundleRankingInput familiarityIndexFeature](self, "familiarityIndexFeature");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v23, CFSTR("familiarityIndexFeature"));

  -[MOEventBundleRankingInput callDurationFeatureNormalized](self, "callDurationFeatureNormalized");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v24, CFSTR("callDurationFeatureNormalized"));

  -[MOEventBundleRankingInput burstyInteractionCountFeatureNormalized](self, "burstyInteractionCountFeatureNormalized");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v25, CFSTR("burstyInteractionCountFeatureNormalized"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput multipleInteractionTypesFeature](self, "multipleInteractionTypesFeature")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v26, CFSTR("multipleInteractionTypesFeature"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOEventBundleRankingInput contactLocationWorkFeature](self, "contactLocationWorkFeature")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v27, CFSTR("contactLocationWorkFeature"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput groupConversationFeature](self, "groupConversationFeature")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v28, CFSTR("groupConversationFeature"));

  -[MOEventBundleRankingInput timeCorrelationScoreFeature](self, "timeCorrelationScoreFeature");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v29, CFSTR("timeCorrelationScoreFeature"));

  -[MOEventBundleRankingInput labelQualityScore](self, "labelQualityScore");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v30, CFSTR("labelQualityScore"));

  -[MOEventBundleRankingInput labelConfidenceScoreFeature](self, "labelConfidenceScoreFeature");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v31, CFSTR("labelConfidenceScoreFeature"));

  -[MOEventBundleRankingInput mediaScoreFeatureNormalized](self, "mediaScoreFeatureNormalized");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v32, CFSTR("mediaScoreFeatureNormalized"));

  -[MOEventBundleRankingInput workoutDurationFeatureNormalized](self, "workoutDurationFeatureNormalized");
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v33, CFSTR("workoutDurationFeatureNormalized"));

  -[MOEventBundleRankingInput shareCountFeatureNormalized](self, "shareCountFeatureNormalized");
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v34, CFSTR("shareCountFeatureNormalized"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput itemFromMeFeature](self, "itemFromMeFeature")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v35, CFSTR("itemFromMeFeature"));

  -[MOEventBundleRankingInput isFamilyContact](self, "isFamilyContact");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v36, CFSTR("isFamilyContact"));

  -[MOEventBundleRankingInput isCoworkerContact](self, "isCoworkerContact");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v37, CFSTR("isCoworkerContact"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput isRepetitiveContact](self, "isRepetitiveContact")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v38, CFSTR("isRepetitiveContact"));

  -[MOEventBundleRankingInput peopleDensityWeightedAverageNormalized](self, "peopleDensityWeightedAverageNormalized");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v39, CFSTR("pDensityWeightedAverageNormalized"));

  -[MOEventBundleRankingInput peopleDensityMaxNormalized](self, "peopleDensityMaxNormalized");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v40, CFSTR("pDensityMaxNormalized"));

  -[MOEventBundleRankingInput peopleCountWeightedSumNormalized](self, "peopleCountWeightedSumNormalized");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v41, CFSTR("pCountWeightedSumNormalized"));

  -[MOEventBundleRankingInput peopleCountWeightedAverageNormalized](self, "peopleCountWeightedAverageNormalized");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v42, CFSTR("pCountWeightedAverageNormalized"));

  -[MOEventBundleRankingInput peopleCountMaxNormalized](self, "peopleCountMaxNormalized");
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v43, CFSTR("pCountMaxNormalized"));

  -[MOEventBundleRankingInput numFamilyNormalized](self, "numFamilyNormalized");
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v44, CFSTR("numFamilyNormalized"));

  -[MOEventBundleRankingInput numFriendsNormalized](self, "numFriendsNormalized");
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v45, CFSTR("numFriendsNormalized"));

  -[MOEventBundleRankingInput numKidsNormalized](self, "numKidsNormalized");
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v46, CFSTR("numKidsNormalized"));

  -[MOEventBundleRankingInput numCoworkersNormalized](self, "numCoworkersNormalized");
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v47, CFSTR("numCoworkersNormalized"));

  -[MOEventBundleRankingInput numPetsNormalized](self, "numPetsNormalized");
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v48, CFSTR("numPetsNormalized"));

  -[MOEventBundleRankingInput numOtherPersonsNormalized](self, "numOtherPersonsNormalized");
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v49, CFSTR("numOtherPersonsNormalized"));

  -[MOEventBundleRankingInput viewCountNormalized](self, "viewCountNormalized");
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v50, CFSTR("suggestionViewCountNormalized"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput suggestionIsDeleted](self, "suggestionIsDeleted")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v51, CFSTR("suggestionIsDeleted"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput suggestionIsSelected](self, "suggestionIsSelected")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v52, CFSTR("suggestionIsSelected"));

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput suggestionQuickAddEntry](self, "suggestionQuickAddEntry")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v53, CFSTR("suggestionQuickAddEntry"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput journalEntryIsCreated](self, "journalEntryIsCreated")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v54, CFSTR("journalEntryIsCreated"));

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput journalEntryIsEdited](self, "journalEntryIsEdited")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v55, CFSTR("journalEntryIsEdited"));

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput journalEntryIsCancelled](self, "journalEntryIsCancelled")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v56, CFSTR("journalEntryIsCancelled"));

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput journalEntryIsDeleted](self, "journalEntryIsDeleted")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v57, CFSTR("journalEntryIsDeleted"));

  -[MOEventBundleRankingInput placeNameConfidence](self, "placeNameConfidence");
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v58, CFSTR("placeNameConfidence"));

  -[MOEventBundleRankingInput timeAtHomeDuration](self, "timeAtHomeDuration");
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v59, CFSTR("timeAtHomeDuration"));

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRankingInput evergreenType](self, "evergreenType"));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v60, CFSTR("evergreenType"));

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput isBundleAggregated](self, "isBundleAggregated")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v61, CFSTR("isBundleAggregated"));

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOEventBundleRankingInput summarizationGranularity](self, "summarizationGranularity")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v62, CFSTR("summarizationGranularity"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput isWorkVisit](self, "isWorkVisit")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v63, CFSTR("isWorkVisit"));

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput isShortVisit](self, "isShortVisit")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v64, CFSTR("isShortVisit"));

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleRankingInput isSignificantContactWithHighSignificanceScore](self, "isSignificantContactWithHighSignificanceScore")));
  -[MOEventBundleRankingInput _saveToDictionary:object:forKey:](self, "_saveToDictionary:object:forKey:", v3, v65, CFSTR("isSignificantContactWithHighSignificanceScore"));

  return v3;
}

- (void)_saveToDictionary:(id)a3 object:(id)a4 forKey:(id)a5
{
  if (a4)
  {
    if (a5)
      objc_msgSend(a3, "setObject:forKey:", a4, a5);
  }
}

- (NSUUID)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSUUID)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (void)setSuggestionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionIdentifier, a3);
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (float)bundleRecencyDaysElapsed
{
  return self->_bundleRecencyDaysElapsed;
}

- (void)setBundleRecencyDaysElapsed:(float)a3
{
  self->_bundleRecencyDaysElapsed = a3;
}

- (float)numAnomalyEventsNormalized
{
  return self->_numAnomalyEventsNormalized;
}

- (void)setNumAnomalyEventsNormalized:(float)a3
{
  self->_numAnomalyEventsNormalized = a3;
}

- (float)numTrendEventsNormalized
{
  return self->_numTrendEventsNormalized;
}

- (void)setNumTrendEventsNormalized:(float)a3
{
  self->_numTrendEventsNormalized = a3;
}

- (float)numRoutineEventsNormalized
{
  return self->_numRoutineEventsNormalized;
}

- (void)setNumRoutineEventsNormalized:(float)a3
{
  self->_numRoutineEventsNormalized = a3;
}

- (float)numStateOfMindEventsNormalized
{
  return self->_numStateOfMindEventsNormalized;
}

- (void)setNumStateOfMindEventsNormalized:(float)a3
{
  self->_numStateOfMindEventsNormalized = a3;
}

- (unint64_t)bundleInterfaceType
{
  return self->_bundleInterfaceType;
}

- (void)setBundleInterfaceType:(unint64_t)a3
{
  self->_bundleInterfaceType = a3;
}

- (unint64_t)bundleSubType
{
  return self->_bundleSubType;
}

- (void)setBundleSubType:(unint64_t)a3
{
  self->_bundleSubType = a3;
}

- (unint64_t)bundleSuperType
{
  return self->_bundleSuperType;
}

- (void)setBundleSuperType:(unint64_t)a3
{
  self->_bundleSuperType = a3;
}

- (NSDictionary)bundleRichnessDict
{
  return self->_bundleRichnessDict;
}

- (void)setBundleRichnessDict:(id)a3
{
  objc_storeStrong((id *)&self->_bundleRichnessDict, a3);
}

- (float)numUniqueResourceTypesNormalized
{
  return self->_numUniqueResourceTypesNormalized;
}

- (void)setNumUniqueResourceTypesNormalized:(float)a3
{
  self->_numUniqueResourceTypesNormalized = a3;
}

- (float)numValueTypeResourcesNormalized
{
  return self->_numValueTypeResourcesNormalized;
}

- (void)setNumValueTypeResourcesNormalized:(float)a3
{
  self->_numValueTypeResourcesNormalized = a3;
}

- (float)numPhotoAssetsResourcesNormalized
{
  return self->_numPhotoAssetsResourcesNormalized;
}

- (void)setNumPhotoAssetsResourcesNormalized:(float)a3
{
  self->_numPhotoAssetsResourcesNormalized = a3;
}

- (float)numMediaTypeResourcesNormalized
{
  return self->_numMediaTypeResourcesNormalized;
}

- (void)setNumMediaTypeResourcesNormalized:(float)a3
{
  self->_numMediaTypeResourcesNormalized = a3;
}

- (float)numWebLinkTypeResourcesNormalized
{
  return self->_numWebLinkTypeResourcesNormalized;
}

- (void)setNumWebLinkTypeResourcesNormalized:(float)a3
{
  self->_numWebLinkTypeResourcesNormalized = a3;
}

- (float)numInterfaceTagTypeResourcesNormalized
{
  return self->_numInterfaceTagTypeResourcesNormalized;
}

- (void)setNumInterfaceTagTypeResourcesNormalized:(float)a3
{
  self->_numInterfaceTagTypeResourcesNormalized = a3;
}

- (float)numMapItemTypeResourcesNormalized
{
  return self->_numMapItemTypeResourcesNormalized;
}

- (void)setNumMapItemTypeResourcesNormalized:(float)a3
{
  self->_numMapItemTypeResourcesNormalized = a3;
}

- (float)numAppTypeResourcesNormalized
{
  return self->_numAppTypeResourcesNormalized;
}

- (void)setNumAppTypeResourcesNormalized:(float)a3
{
  self->_numAppTypeResourcesNormalized = a3;
}

- (float)numTopicTypeResourcesNormalized
{
  return self->_numTopicTypeResourcesNormalized;
}

- (void)setNumTopicTypeResourcesNormalized:(float)a3
{
  self->_numTopicTypeResourcesNormalized = a3;
}

- (float)numWorkoutRingAssetsNormalized
{
  return self->_numWorkoutRingAssetsNormalized;
}

- (void)setNumWorkoutRingAssetsNormalized:(float)a3
{
  self->_numWorkoutRingAssetsNormalized = a3;
}

- (float)numWorkoutIconAssetsNormalized
{
  return self->_numWorkoutIconAssetsNormalized;
}

- (void)setNumWorkoutIconAssetsNormalized:(float)a3
{
  self->_numWorkoutIconAssetsNormalized = a3;
}

- (float)numWorkoutRouteMapAssetsNormalized
{
  return self->_numWorkoutRouteMapAssetsNormalized;
}

- (void)setNumWorkoutRouteMapAssetsNormalized:(float)a3
{
  self->_numWorkoutRouteMapAssetsNormalized = a3;
}

- (float)numFamilyNormalized
{
  return self->_numFamilyNormalized;
}

- (void)setNumFamilyNormalized:(float)a3
{
  self->_numFamilyNormalized = a3;
}

- (float)numKidsNormalized
{
  return self->_numKidsNormalized;
}

- (void)setNumKidsNormalized:(float)a3
{
  self->_numKidsNormalized = a3;
}

- (float)numFriendsNormalized
{
  return self->_numFriendsNormalized;
}

- (void)setNumFriendsNormalized:(float)a3
{
  self->_numFriendsNormalized = a3;
}

- (float)numCoworkersNormalized
{
  return self->_numCoworkersNormalized;
}

- (void)setNumCoworkersNormalized:(float)a3
{
  self->_numCoworkersNormalized = a3;
}

- (float)numPetsNormalized
{
  return self->_numPetsNormalized;
}

- (void)setNumPetsNormalized:(float)a3
{
  self->_numPetsNormalized = a3;
}

- (float)numOtherPersonsNormalized
{
  return self->_numOtherPersonsNormalized;
}

- (void)setNumOtherPersonsNormalized:(float)a3
{
  self->_numOtherPersonsNormalized = a3;
}

- (float)isBundleActionSpecific
{
  return self->_isBundleActionSpecific;
}

- (void)setIsBundleActionSpecific:(float)a3
{
  self->_isBundleActionSpecific = a3;
}

- (float)isBundlePlaceTypeSpecific
{
  return self->_isBundlePlaceTypeSpecific;
}

- (void)setIsBundlePlaceTypeSpecific:(float)a3
{
  self->_isBundlePlaceTypeSpecific = a3;
}

- (float)isBundleTimeTagSpecific
{
  return self->_isBundleTimeTagSpecific;
}

- (void)setIsBundleTimeTagSpecific:(float)a3
{
  self->_isBundleTimeTagSpecific = a3;
}

- (float)labelSpecificityNormalized
{
  return self->_labelSpecificityNormalized;
}

- (void)setLabelSpecificityNormalized:(float)a3
{
  self->_labelSpecificityNormalized = a3;
}

- (float)interestingPOIFeature
{
  return self->_interestingPOIFeature;
}

- (void)setInterestingPOIFeature:(float)a3
{
  self->_interestingPOIFeature = a3;
}

- (BOOL)isSensitivePOI
{
  return self->_isSensitivePOI;
}

- (void)setIsSensitivePOI:(BOOL)a3
{
  self->_isSensitivePOI = a3;
}

- (float)distanceToHomeFeatureNormalized
{
  return self->_distanceToHomeFeatureNormalized;
}

- (void)setDistanceToHomeFeatureNormalized:(float)a3
{
  self->_distanceToHomeFeatureNormalized = a3;
}

- (float)familiarityIndexFeature
{
  return self->_familiarityIndexFeature;
}

- (void)setFamiliarityIndexFeature:(float)a3
{
  self->_familiarityIndexFeature = a3;
}

- (float)callDurationFeatureNormalized
{
  return self->_callDurationFeatureNormalized;
}

- (void)setCallDurationFeatureNormalized:(float)a3
{
  self->_callDurationFeatureNormalized = a3;
}

- (float)burstyInteractionCountFeatureNormalized
{
  return self->_burstyInteractionCountFeatureNormalized;
}

- (void)setBurstyInteractionCountFeatureNormalized:(float)a3
{
  self->_burstyInteractionCountFeatureNormalized = a3;
}

- (BOOL)multipleInteractionTypesFeature
{
  return self->_multipleInteractionTypesFeature;
}

- (void)setMultipleInteractionTypesFeature:(BOOL)a3
{
  self->_multipleInteractionTypesFeature = a3;
}

- (int)contactLocationWorkFeature
{
  return self->_contactLocationWorkFeature;
}

- (void)setContactLocationWorkFeature:(int)a3
{
  self->_contactLocationWorkFeature = a3;
}

- (BOOL)groupConversationFeature
{
  return self->_groupConversationFeature;
}

- (void)setGroupConversationFeature:(BOOL)a3
{
  self->_groupConversationFeature = a3;
}

- (float)timeCorrelationScoreFeature
{
  return self->_timeCorrelationScoreFeature;
}

- (void)setTimeCorrelationScoreFeature:(float)a3
{
  self->_timeCorrelationScoreFeature = a3;
}

- (float)labelQualityScore
{
  return self->_labelQualityScore;
}

- (void)setLabelQualityScore:(float)a3
{
  self->_labelQualityScore = a3;
}

- (float)labelConfidenceScoreFeature
{
  return self->_labelConfidenceScoreFeature;
}

- (void)setLabelConfidenceScoreFeature:(float)a3
{
  self->_labelConfidenceScoreFeature = a3;
}

- (float)mediaScoreFeatureNormalized
{
  return self->_mediaScoreFeatureNormalized;
}

- (void)setMediaScoreFeatureNormalized:(float)a3
{
  self->_mediaScoreFeatureNormalized = a3;
}

- (float)workoutDurationFeatureNormalized
{
  return self->_workoutDurationFeatureNormalized;
}

- (void)setWorkoutDurationFeatureNormalized:(float)a3
{
  self->_workoutDurationFeatureNormalized = a3;
}

- (float)shareCountFeatureNormalized
{
  return self->_shareCountFeatureNormalized;
}

- (void)setShareCountFeatureNormalized:(float)a3
{
  self->_shareCountFeatureNormalized = a3;
}

- (BOOL)itemFromMeFeature
{
  return self->_itemFromMeFeature;
}

- (void)setItemFromMeFeature:(BOOL)a3
{
  self->_itemFromMeFeature = a3;
}

- (float)isFamilyContact
{
  return self->_isFamilyContact;
}

- (void)setIsFamilyContact:(float)a3
{
  self->_isFamilyContact = a3;
}

- (float)isCoworkerContact
{
  return self->_isCoworkerContact;
}

- (void)setIsCoworkerContact:(float)a3
{
  self->_isCoworkerContact = a3;
}

- (BOOL)isRepetitiveContact
{
  return self->_isRepetitiveContact;
}

- (void)setIsRepetitiveContact:(BOOL)a3
{
  self->_isRepetitiveContact = a3;
}

- (float)peopleDensityWeightedAverageNormalized
{
  return self->_peopleDensityWeightedAverageNormalized;
}

- (void)setPeopleDensityWeightedAverageNormalized:(float)a3
{
  self->_peopleDensityWeightedAverageNormalized = a3;
}

- (float)peopleDensityMaxNormalized
{
  return self->_peopleDensityMaxNormalized;
}

- (void)setPeopleDensityMaxNormalized:(float)a3
{
  self->_peopleDensityMaxNormalized = a3;
}

- (float)stateOfMindLabelCountNormalized
{
  return self->_stateOfMindLabelCountNormalized;
}

- (void)setStateOfMindLabelCountNormalized:(float)a3
{
  self->_stateOfMindLabelCountNormalized = a3;
}

- (float)stateOfMindDomainCountNormalized
{
  return self->_stateOfMindDomainCountNormalized;
}

- (void)setStateOfMindDomainCountNormalized:(float)a3
{
  self->_stateOfMindDomainCountNormalized = a3;
}

- (float)stateOfMindLoggedIn3pApp
{
  return self->_stateOfMindLoggedIn3pApp;
}

- (void)setStateOfMindLoggedIn3pApp:(float)a3
{
  self->_stateOfMindLoggedIn3pApp = a3;
}

- (float)stateOfMindLoggedInJournalApp
{
  return self->_stateOfMindLoggedInJournalApp;
}

- (void)setStateOfMindLoggedInJournalApp:(float)a3
{
  self->_stateOfMindLoggedInJournalApp = a3;
}

- (float)avgSubBundleGoodnessScores
{
  return self->_avgSubBundleGoodnessScores;
}

- (void)setAvgSubBundleGoodnessScores:(float)a3
{
  self->_avgSubBundleGoodnessScores = a3;
}

- (float)peopleCountWeightedSumNormalized
{
  return self->_peopleCountWeightedSumNormalized;
}

- (void)setPeopleCountWeightedSumNormalized:(float)a3
{
  self->_peopleCountWeightedSumNormalized = a3;
}

- (float)peopleCountWeightedAverageNormalized
{
  return self->_peopleCountWeightedAverageNormalized;
}

- (void)setPeopleCountWeightedAverageNormalized:(float)a3
{
  self->_peopleCountWeightedAverageNormalized = a3;
}

- (float)peopleCountMaxNormalized
{
  return self->_peopleCountMaxNormalized;
}

- (void)setPeopleCountMaxNormalized:(float)a3
{
  self->_peopleCountMaxNormalized = a3;
}

- (float)viewCountNormalized
{
  return self->_viewCountNormalized;
}

- (void)setViewCountNormalized:(float)a3
{
  self->_viewCountNormalized = a3;
}

- (BOOL)suggestionIsDeleted
{
  return self->_suggestionIsDeleted;
}

- (void)setSuggestionIsDeleted:(BOOL)a3
{
  self->_suggestionIsDeleted = a3;
}

- (BOOL)suggestionIsSelected
{
  return self->_suggestionIsSelected;
}

- (void)setSuggestionIsSelected:(BOOL)a3
{
  self->_suggestionIsSelected = a3;
}

- (BOOL)suggestionQuickAddEntry
{
  return self->_suggestionQuickAddEntry;
}

- (void)setSuggestionQuickAddEntry:(BOOL)a3
{
  self->_suggestionQuickAddEntry = a3;
}

- (BOOL)journalEntryIsCreated
{
  return self->_journalEntryIsCreated;
}

- (void)setJournalEntryIsCreated:(BOOL)a3
{
  self->_journalEntryIsCreated = a3;
}

- (BOOL)journalEntryIsEdited
{
  return self->_journalEntryIsEdited;
}

- (void)setJournalEntryIsEdited:(BOOL)a3
{
  self->_journalEntryIsEdited = a3;
}

- (BOOL)journalEntryIsCancelled
{
  return self->_journalEntryIsCancelled;
}

- (void)setJournalEntryIsCancelled:(BOOL)a3
{
  self->_journalEntryIsCancelled = a3;
}

- (BOOL)journalEntryIsDeleted
{
  return self->_journalEntryIsDeleted;
}

- (void)setJournalEntryIsDeleted:(BOOL)a3
{
  self->_journalEntryIsDeleted = a3;
}

- (float)placeNameConfidence
{
  return self->_placeNameConfidence;
}

- (void)setPlaceNameConfidence:(float)a3
{
  self->_placeNameConfidence = a3;
}

- (float)timeAtHomeDuration
{
  return self->_timeAtHomeDuration;
}

- (void)setTimeAtHomeDuration:(float)a3
{
  self->_timeAtHomeDuration = a3;
}

- (NSString)evergreenType
{
  return self->_evergreenType;
}

- (void)setEvergreenType:(id)a3
{
  objc_storeStrong((id *)&self->_evergreenType, a3);
}

- (BOOL)evergreenPromptExists
{
  return self->_evergreenPromptExists;
}

- (void)setEvergreenPromptExists:(BOOL)a3
{
  self->_evergreenPromptExists = a3;
}

- (BOOL)isBundleAggregated
{
  return self->_isBundleAggregated;
}

- (void)setIsBundleAggregated:(BOOL)a3
{
  self->_isBundleAggregated = a3;
}

- (unint64_t)summarizationGranularity
{
  return self->_summarizationGranularity;
}

- (void)setSummarizationGranularity:(unint64_t)a3
{
  self->_summarizationGranularity = a3;
}

- (NSArray)subSuggestionIDs
{
  return self->_subSuggestionIDs;
}

- (void)setSubSuggestionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_subSuggestionIDs, a3);
}

- (BOOL)isWorkVisit
{
  return self->_isWorkVisit;
}

- (void)setIsWorkVisit:(BOOL)a3
{
  self->_isWorkVisit = a3;
}

- (BOOL)isShortVisit
{
  return self->_isShortVisit;
}

- (void)setIsShortVisit:(BOOL)a3
{
  self->_isShortVisit = a3;
}

- (BOOL)isSignificantContactWithHighSignificanceScore
{
  return self->_isSignificantContactWithHighSignificanceScore;
}

- (void)setIsSignificantContactWithHighSignificanceScore:(BOOL)a3
{
  self->_isSignificantContactWithHighSignificanceScore = a3;
}

- (NSSet)allPlaceNames
{
  return self->_allPlaceNames;
}

- (void)setAllPlaceNames:(id)a3
{
  objc_storeStrong((id *)&self->_allPlaceNames, a3);
}

- (NSSet)workoutTypes
{
  return self->_workoutTypes;
}

- (void)setWorkoutTypes:(id)a3
{
  objc_storeStrong((id *)&self->_workoutTypes, a3);
}

- (NSDate)bundleStartDate
{
  return self->_bundleStartDate;
}

- (void)setBundleStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_bundleStartDate, a3);
}

- (NSDate)bundleEndDate
{
  return self->_bundleEndDate;
}

- (void)setBundleEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_bundleEndDate, a3);
}

- (NSSet)allContactIdentifiers
{
  return self->_allContactIdentifiers;
}

- (void)setAllContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allContactIdentifiers, a3);
}

- (NSSet)allStateOfMindIdentifiers
{
  return self->_allStateOfMindIdentifiers;
}

- (void)setAllStateOfMindIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allStateOfMindIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allStateOfMindIdentifiers, 0);
  objc_storeStrong((id *)&self->_allContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleEndDate, 0);
  objc_storeStrong((id *)&self->_bundleStartDate, 0);
  objc_storeStrong((id *)&self->_workoutTypes, 0);
  objc_storeStrong((id *)&self->_allPlaceNames, 0);
  objc_storeStrong((id *)&self->_subSuggestionIDs, 0);
  objc_storeStrong((id *)&self->_evergreenType, 0);
  objc_storeStrong((id *)&self->_bundleRichnessDict, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
