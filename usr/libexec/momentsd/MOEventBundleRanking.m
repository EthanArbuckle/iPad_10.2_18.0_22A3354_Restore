@implementation MOEventBundleRanking

- (void)setRankingParamsFromRankingParamsMO:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  id v9;
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
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  uint8_t buf[4];
  id v40;

  v5 = a3;
  if (!self)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:].cold.2(v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("MORankingParams+CoreDataTransformable.m"), 23, CFSTR("MOEventBundleRanking was not initialized (in %s:%d)"), "-[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:]", 23);

  }
  if (v5)
  {
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v5, "activityInterfaceTypeEngagementWeight");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, &off_1002D8438);

    objc_msgSend(v5, "outingInterfaceTypeEngagementWeight");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, &off_1002D8450);

    objc_msgSend(v5, "photoMomentInterfaceTypeEngagementWeight");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, &off_1002D8468);

    objc_msgSend(v5, "significantContactInterfaceTypeEngagementWeight");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, &off_1002D8480);

    objc_msgSend(v5, "yourMediaInterfaceTypeEngagementWeight");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, &off_1002D8498);

    objc_msgSend(v5, "yourTimeAtHomeInterfaceTypeEngagementWeight");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, &off_1002D84B0);

    objc_msgSend(v5, "yourSharedContentInterfaceTypeEngagementWeight");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, &off_1002D84C8);

    objc_msgSend(v5, "topicsOfInterestInterfaceTypeEngagementWeight");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, &off_1002D84E0);

    objc_msgSend(v5, "trendInterfaceTypeEngagementWeight");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, &off_1002D84F8);

    objc_msgSend(v5, "photoMemoryInterfaceTypeEngagementWeight");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, &off_1002D8510);

    objc_msgSend(v5, "evergreenInterfaceTypeEngagementWeight");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, &off_1002D8528);

    objc_msgSend(v5, "timeContextInterfaceTypeEngagementWeight");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, &off_1002D8540);

    objc_msgSend(v5, "tripInterfaceTypeEngagementWeight");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, &off_1002D8558);

    objc_msgSend(v5, "stateOfMindInterfaceTypeEngagementWeight");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, &off_1002D8570);

    objc_msgSend(v5, "clusteringInterfaceTypeEngagementWeight");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, &off_1002D8588);

    if (objc_msgSend(v9, "count") != (id)15)
    {
      v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:].cold.1(v9, v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MORankingParams+CoreDataTransformable.m"), 44, CFSTR("Mismatch between ranking modelParameterDict, %lu and bundle interface type, %lu (in %s:%d)"), objc_msgSend(v9, "count"), 15, "-[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:]", 44);

    }
    v28 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v5, "wisdomEvergreenTypeEngagementWeight");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("WISDOM"));

    objc_msgSend(v5, "gratitudeEvergreenTypeEngagementWeight");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("GRATITUDE"));

    objc_msgSend(v5, "kindnessEvergreenTypeEngagementWeight");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("KINDNESS"));

    objc_msgSend(v5, "purposeEvergreenTypeEngagementWeight");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, CFSTR("PURPOSE"));

    objc_msgSend(v5, "resilienceEvergreenTypeEngagementWeight");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v33, CFSTR("RESILIENCE"));

    objc_msgSend(v5, "creativityEvergreenTypeEngagementWeight");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v34, CFSTR("CREATIVITY"));

    -[MOEventBundleRanking setDynamicModelParameterDict:](self, "setDynamicModelParameterDict:", v9);
    v35 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v9;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "dynamicModelParameterDict was set to %@ using Moments DB", buf, 0xCu);
    }

    -[MOEventBundleRanking setEvergreenEngagementScoreParameterDict:](self, "setEvergreenEngagementScoreParameterDict:", v28);
    v37 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v28;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "evergreenEngagementScoreParameterDict was set to %@ using Moments DB", buf, 0xCu);
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken_2 != -1)
    dispatch_once(&defineClassCollections_onceToken_2, &__block_literal_global_38);
}

void __46__MOEventBundleRanking_defineClassCollections__block_invoke(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
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
  uint64_t v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[4];
  _QWORD v23[15];
  _QWORD v24[51];

  v24[0] = GEOPOICategoryAmusementPark;
  v24[1] = GEOPOICategoryAquarium;
  v24[2] = GEOPOICategoryBeach;
  v24[3] = GEOPOICategoryBrewery;
  v24[4] = GEOPOICategoryCafe;
  v24[5] = GEOPOICategoryFitnessCenter;
  v24[6] = GEOPOICategoryLibrary;
  v24[7] = GEOPOICategoryMarina;
  v24[8] = GEOPOICategoryMovieTheater;
  v24[9] = GEOPOICategoryMuseum;
  v24[10] = GEOPOICategoryNationalPark;
  v24[11] = GEOPOICategoryNightlife;
  v24[12] = GEOPOICategoryPark;
  v24[13] = GEOPOICategoryPlayground;
  v24[14] = GEOPOICategoryReligiousSite;
  v24[15] = GEOPOICategoryRestaurant;
  v24[16] = GEOPOICategoryStadium;
  v24[17] = GEOPOICategoryTheater;
  v24[18] = GEOPOICategoryWinery;
  v24[19] = GEOPOICategoryZoo;
  v24[20] = GEOPOICategoryCampground;
  v24[21] = GEOPOICategoryBaseball;
  v24[22] = GEOPOICategoryBasketball;
  v24[23] = GEOPOICategoryBeauty;
  v24[24] = GEOPOICategoryBowling;
  v24[25] = GEOPOICategoryCastle;
  v24[26] = GEOPOICategoryConventionCenter;
  v24[27] = GEOPOICategoryDistillery;
  v24[28] = GEOPOICategoryFairground;
  v24[29] = GEOPOICategoryFishing;
  v24[30] = GEOPOICategoryFortress;
  v24[31] = GEOPOICategoryGolf;
  v24[32] = GEOPOICategoryGoKart;
  v24[33] = GEOPOICategoryHiking;
  v24[34] = GEOPOICategoryKayaking;
  v24[35] = GEOPOICategoryLandmark;
  v24[36] = GEOPOICategoryMiniGolf;
  v24[37] = GEOPOICategoryMusicVenue;
  v24[38] = GEOPOICategoryNationalMonument;
  v24[39] = GEOPOICategoryPlanetarium;
  v24[40] = GEOPOICategoryRockClimbing;
  v24[41] = GEOPOICategoryRVPark;
  v24[42] = GEOPOICategorySkatePark;
  v24[43] = GEOPOICategorySkating;
  v24[44] = GEOPOICategorySkiing;
  v24[45] = GEOPOICategorySoccer;
  v24[46] = GEOPOICategorySpa;
  v24[47] = GEOPOICategorySurfing;
  v24[48] = GEOPOICategorySwimming;
  v24[49] = GEOPOICategoryTennis;
  v24[50] = GEOPOICategoryVolleyball;
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 51));
  v2 = (void *)interestingPOIcategories;
  interestingPOIcategories = v1;

  v23[0] = GEOPOICategoryAirportGate;
  v23[1] = GEOPOICategoryAirportTerminal;
  v23[2] = GEOPOICategoryATM;
  v23[3] = GEOPOICategoryBank;
  v23[4] = GEOPOICategoryCarRental;
  v23[5] = GEOPOICategoryEVCharger;
  v23[6] = GEOPOICategoryGasStation;
  v23[7] = GEOPOICategoryLaundry;
  v23[8] = GEOPOICategoryParking;
  v23[9] = GEOPOICategoryPharmacy;
  v23[10] = GEOPOICategoryPostOffice;
  v23[11] = GEOPOICategoryPublicTransport;
  v23[12] = GEOPOICategoryRestroom;
  v23[13] = GEOPOICategoryAutomotiveRepair;
  v23[14] = GEOPOICategoryMailbox;
  v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 15));
  v4 = (void *)nonInterestingPOIcategories;
  nonInterestingPOIcategories = v3;

  v22[0] = GEOPOICategoryHospital;
  v22[1] = GEOPOICategoryPolice;
  v22[2] = GEOPOICategoryFireStation;
  v22[3] = GEOPOICategoryAnimalService;
  v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  v6 = (void *)sensitivePOICategories;
  sensitivePOICategories = v5;

  v21[0] = GEOPOICategoryHotel;
  v21[1] = GEOPOICategoryFoodMarket;
  v21[2] = GEOPOICategoryBakery;
  v21[3] = GEOPOICategorySchool;
  v21[4] = GEOPOICategoryStore;
  v21[5] = GEOPOICategoryUniversity;
  v7 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 6));
  v8 = (void *)neutralPOIcategories;
  neutralPOIcategories = v7;

  v9 = (void *)enrichedActionTags;
  enrichedActionTags = (uint64_t)&off_1002DC9C8;

  v10 = (void *)interestingTimeTags;
  interestingTimeTags = (uint64_t)&off_1002DC9E0;

  v11 = (void *)visitActionTags;
  visitActionTags = (uint64_t)&off_1002DC9F8;

  v12 = (void *)visitSubtypeVariants;
  visitSubtypeVariants = (uint64_t)&off_1002DCA10;

  v13 = (void *)dailyMediaSubtypeVariants;
  dailyMediaSubtypeVariants = (uint64_t)&off_1002DCA28;

  v14 = (void *)MediaWeeklySummarySubtypeVariants;
  MediaWeeklySummarySubtypeVariants = (uint64_t)&off_1002DCA40;

  v15 = (void *)timeAtHomeSubtypeVariants;
  timeAtHomeSubtypeVariants = (uint64_t)&off_1002DCA58;

  v16 = (void *)phoneSensedWalkingVariants;
  phoneSensedWalkingVariants = (uint64_t)&off_1002DCA70;

  v17 = (void *)workoutSubtypeVariants;
  workoutSubtypeVariants = (uint64_t)&off_1002DCA88;

  v18 = (void *)thirdPartyMediaSubtypeVariants;
  thirdPartyMediaSubtypeVariants = (uint64_t)&off_1002DCAA0;

  v19 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &stru_1002B68D0));
  v20 = (void *)emptyStringSet;
  emptyStringSet = v19;

}

- (id)generateRankingInput:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _fetchBundleInforForRanking:](self, "_fetchBundleInforForRanking:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13));
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_fetchBundleInforForRanking:(id)a3
{
  id v4;
  void *v5;
  MOEventBundleRankingInput *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = objc_opt_new(MOEventBundleRankingInput);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  -[MOEventBundleRankingInput setBundleIdentifier:](v6, "setBundleIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
  -[MOEventBundleRankingInput setSuggestionIdentifier:](v6, "setSuggestionIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
  -[MOEventBundleRankingInput setEvents:](v6, "setEvents:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subSuggestionIDs"));
  -[MOEventBundleRankingInput setSubSuggestionIDs:](v6, "setSubSuggestionIDs:", v10);

  -[MOEventBundleRanking _fillRecencyInfoForRanking:forBundle:](self, "_fillRecencyInfoForRanking:forBundle:", v6, v4);
  -[MOEventBundleRanking _fillRichnessInfoForRanking:forBundle:](self, "_fillRichnessInfoForRanking:forBundle:", v6, v4);
  -[MOEventBundleRanking _fillDistincnessInfoForRanking:forBundle:](self, "_fillDistincnessInfoForRanking:forBundle:", v6, v4);
  -[MOEventBundleRanking _fillHeuristicsInfoForRanking:forBundle:](self, "_fillHeuristicsInfoForRanking:forBundle:", v6, v4);
  -[MOEventBundleRanking _fillQualityInfoForRanking:forBundle:](self, "_fillQualityInfoForRanking:forBundle:", v6, v4);
  -[MOEventBundleRanking _fillEngagementInfoForRanking:forBundle:](self, "_fillEngagementInfoForRanking:forBundle:", v6, v4);
  -[MOEventBundleRanking _fillCurationInfoForRanking:forBundle:](self, "_fillCurationInfoForRanking:forBundle:", v6, v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (void)_fillRecencyInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9 / -86400.0;
  *(float *)&v10 = v10;
  objc_msgSend(v6, "setBundleRecencyDaysElapsed:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  objc_msgSend(v6, "setBundleStartDate:", v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
  objc_msgSend(v6, "setBundleEndDate:", v12);

}

- (void)_fillCurationInfoForRanking:(id)a3 forBundle:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  id v19;

  v6 = (void *)visitSubtypeVariants;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "bundleSubType")));
  v10 = objc_msgSend(v6, "containsObject:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
  if (objc_msgSend(v11, "placeUserType") == (id)2)
    v12 = v10;
  else
    v12 = 0;
  objc_msgSend(v8, "setIsWorkVisit:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VisitDuration")));
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("shortVisitDurationThresholdInSec")));
  objc_msgSend(v19, "floatValue");
  if (v16 < v17)
    v18 = v10;
  else
    v18 = 0;
  objc_msgSend(v8, "setIsShortVisit:", v18);

}

- (void)_fillQualityInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id os_log;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  double v25;
  id v26;
  float v27;
  double v28;
  void *v29;
  double v30;
  float v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  double v46;
  void *v47;
  uint64_t v48;
  double v49;
  void *v50;
  char *v51;
  double v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  double v58;
  void *v59;
  id v60;
  double v61;
  id v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  float v71;
  double v72;
  float v73;
  double v74;
  float v75;
  float v76;
  void *v77;
  void *v78;
  float v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  void *v84;
  void *v85;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
  v8 = objc_msgSend(v7, "actionType");
  LODWORD(v9) = 0;
  if (v8)
    *(float *)&v9 = 0.5;
  objc_msgSend(v5, "setIsBundleActionSpecific:", v9);

  v10 = (void *)enrichedActionTags;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "actionType")));
  LODWORD(v10) = objc_msgSend(v10, "containsObject:", v12);

  if ((_DWORD)v10)
  {
    objc_msgSend(v5, "isBundleActionSpecific");
    if ((float)(*(float *)&v13 + 0.5) > 1.0)
    {
      LODWORD(v13) = 1.0;
      objc_msgSend(v5, "setIsBundleActionSpecific:", v13);
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v15 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
  if (-[NSObject actionType](v15, "actionType") != (id)1)
    goto LABEL_12;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
  v24 = objc_msgSend(v23, "actionSubtype");

  if (v24 == (id)4)
  {
    objc_msgSend(v5, "isBundleActionSpecific");
    if ((float)(*(float *)&v25 + 0.5) > 1.0)
    {
      LODWORD(v25) = 1.0;
      objc_msgSend(v5, "setIsBundleActionSpecific:", v25);
      v26 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v15 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
LABEL_11:
        -[MOEventBundleRanking _fillQualityInfoForRanking:forBundle:].cold.3(v15, v16, v17, v18, v19, v20, v21, v22);
LABEL_12:

      goto LABEL_14;
    }
LABEL_13:
    objc_msgSend(v5, "isBundleActionSpecific");
    *(float *)&v28 = v27 + 0.5;
    objc_msgSend(v5, "setIsBundleActionSpecific:", v28);
  }
LABEL_14:
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "time"));
  v31 = 0.0;
  if (objc_msgSend(v29, "timeTag"))
    *(float *)&v30 = 0.5;
  else
    *(float *)&v30 = 0.0;
  objc_msgSend(v5, "setIsBundleTimeTagSpecific:", v30);

  v32 = (void *)interestingTimeTags;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "time"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "timeTag")));
  LODWORD(v32) = objc_msgSend(v32, "containsObject:", v34);

  if ((_DWORD)v32)
  {
    objc_msgSend(v5, "isBundleTimeTagSpecific");
    if ((float)(*(float *)&v35 + 0.5) <= 1.0)
    {
      objc_msgSend(v5, "isBundleTimeTagSpecific");
      *(float *)&v46 = v45 + 0.5;
      objc_msgSend(v5, "setIsBundleTimeTagSpecific:", v46);
    }
    else
    {
      LODWORD(v35) = 1.0;
      objc_msgSend(v5, "setIsBundleTimeTagSpecific:", v35);
      v36 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[MOEventBundleRanking _fillQualityInfoForRanking:forBundle:].cold.2(v37, v38, v39, v40, v41, v42, v43, v44);

    }
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "place"));
  v48 = (uint64_t)objc_msgSend(v47, "placeType");

  if (v48 > 99)
  {
    if (v48 == 100 || v48 == 101 || v48 == 102)
    {
LABEL_29:
      v31 = 1.0;
LABEL_30:
      *(float *)&v49 = v31;
      objc_msgSend(v5, "setIsBundlePlaceTypeSpecific:", v49);
    }
  }
  else
  {
    switch(v48)
    {
      case 0:
      case 1:
        goto LABEL_30;
      case 2:
        v31 = 0.8;
        goto LABEL_30;
      case 3:
      case 6:
        goto LABEL_29;
      case 4:
        v31 = 0.4;
        goto LABEL_30;
      case 5:
        v31 = 0.2;
        goto LABEL_30;
      default:
        break;
    }
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "place"));
  v51 = (char *)objc_msgSend(v50, "placeUserType");

  if ((unint64_t)(v51 - 1) < 4)
    goto LABEL_32;
  if (!v51)
  {
    LODWORD(v52) = 0;
    goto LABEL_33;
  }
  if (v51 == (char *)100)
  {
LABEL_32:
    LODWORD(v52) = 1.0;
LABEL_33:
    objc_msgSend(v5, "setIsBundlePlaceTypeSpecific:", v52);
  }
  objc_msgSend(v5, "isBundlePlaceTypeSpecific");
  v54 = v53;
  objc_msgSend(v5, "isBundleTimeTagSpecific");
  v56 = v54 + v55;
  objc_msgSend(v5, "isBundleActionSpecific");
  *(float *)&v58 = v56 + v57;
  objc_msgSend(v5, "setLabelSpecificityNormalized:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persons"));
  v60 = objc_msgSend(v59, "count");

  if (v60)
  {
    objc_msgSend(v5, "labelSpecificityNormalized");
    if ((float)(*(float *)&v61 + 0.5) <= 4.0)
    {
      objc_msgSend(v5, "labelSpecificityNormalized");
      *(float *)&v72 = v71 + 0.5;
      objc_msgSend(v5, "setLabelSpecificityNormalized:", v72);
    }
    else
    {
      LODWORD(v61) = 4.0;
      objc_msgSend(v5, "setLabelSpecificityNormalized:", v61);
      v62 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v63 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        -[MOEventBundleRanking _fillQualityInfoForRanking:forBundle:].cold.1(v63, v64, v65, v66, v67, v68, v69, v70);

    }
  }
  objc_msgSend(v5, "labelSpecificityNormalized");
  *(float *)&v74 = v73 * 0.25;
  objc_msgSend(v5, "setLabelSpecificityNormalized:", v74);
  objc_msgSend(v5, "labelSpecificityNormalized");
  v76 = v75;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metaDataForRank"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKey:", CFSTR("LabelConfidence")));
  objc_msgSend(v78, "floatValue");
  *(float *)&v80 = v76 * v79;
  objc_msgSend(v5, "setLabelQualityScore:", v80);

  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metaDataForRank"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKey:", CFSTR("TimeCorrelationScore")));

  if (v82)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metaDataForRank"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKey:", CFSTR("TimeCorrelationScore")));
    objc_msgSend(v85, "floatValue");
    objc_msgSend(v5, "setTimeCorrelationScoreFeature:");

  }
  else
  {
    LODWORD(v83) = 0;
    objc_msgSend(v5, "setTimeCorrelationScoreFeature:", v83);
  }

}

- (void)_fillHeuristicsInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  double v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  double v37;
  float v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  void *v46;
  float v47;
  float v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  float v63;
  double v64;
  float v65;
  double v66;
  float v67;
  double v68;
  float v69;
  double v70;
  float v71;
  double v72;
  float v73;
  double v74;
  id v75;
  id v76;
  NSObject *v77;
  float v78;
  BOOL v79;
  double v80;
  double v81;
  float v82;
  double v83;
  double v84;
  float v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  float v91;
  float v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  float v101;
  float v102;
  double v103;
  void *v104;
  float v105;
  float v106;
  double v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  float v114;
  float v115;
  void *v116;
  void *v117;
  double v118;
  void *v119;
  void *v120;
  float v121;
  double v122;
  void *v123;
  void *v124;
  unsigned int v125;
  void *v126;
  void *v127;
  unsigned int v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  double v137;
  void *v138;
  void *v139;
  float v140;
  float v141;
  void *v142;
  void *v143;
  float v144;
  float v145;
  double v146;
  void *v147;
  void *v148;
  float v149;
  void *v150;
  void *v151;
  float v152;
  float v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  float v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  float v163;
  float v164;
  double v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  unsigned int v170;
  double v171;
  float v172;
  void *v173;
  void *v174;
  int v175;
  void *v176;
  void *v177;
  float v178;
  float v179;
  void *v180;
  void *v181;
  float v182;
  double v183;
  void *v184;
  void *v185;
  float v186;
  float v187;
  double v188;
  void *v189;
  void *v190;
  float v191;
  float v192;
  void *v193;
  void *v194;
  double v195;
  double v196;
  void *v197;
  void *v198;
  double v199;
  double v200;
  void *v201;
  void *v202;
  double v203;
  double v204;
  double v205;
  void *v206;
  void *v207;
  double v208;
  double v209;
  void *v210;
  void *v211;
  double v212;
  float v213;
  double v214;
  void *v215;
  void *v216;
  double v217;
  float v218;
  float v219;
  double v220;
  void *v221;
  void *v222;
  double v223;
  double v224;
  float v225;
  void *v226;
  void *v227;
  float v228;
  float v229;
  void *v230;
  void *v231;
  float v232;
  double v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  double v238;
  double v239;
  double v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  double v245;
  double v246;
  double v247;
  double v248;
  void *v249;
  void *v250;
  double v251;
  void *v252;
  void *v253;
  double v254;
  double v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  _BYTE v265[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "interfaceType") == (id)13)
  {
    -[MOEventBundleRanking updateTripMetaDataForRank:](self, "updateTripMetaDataForRank:", v7);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[MOEventBundleRanking _fillHeuristicsInfoForRanking:forBundle:].cold.3(v7, v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PoiCategory")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v260 = v11;
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) != 0)
  {
    LODWORD(v14) = 0;
    objc_msgSend(v6, "setInterestingPOIFeature:", v14);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PoiCategory")));
    objc_msgSend(v16, "floatValue");
    objc_msgSend(v6, "setInterestingPOIFeature:");

  }
  objc_msgSend(v6, "setIsSensitivePOI:", 0);
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
  v18 = objc_claimAutoreleasedReturnValue(-[NSObject poiCategory](v17, "poiCategory"));
  if (v18)
  {
    v19 = (void *)v18;
    v20 = (void *)sensitivePOICategories;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "poiCategory"));
    LODWORD(v20) = objc_msgSend(v20, "containsObject:", v22);

    if (!(_DWORD)v20)
      goto LABEL_13;
    objc_msgSend(v6, "setIsSensitivePOI:", 1);
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v17 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[MOEventBundleRanking _fillHeuristicsInfoForRanking:forBundle:].cold.2(v7, v17);
  }

LABEL_13:
  LODWORD(v23) = 0;
  objc_msgSend(v6, "setFamiliarityIndexFeature:", v23);
  LODWORD(v25) = 0;
  objc_msgSend(v6, "setDistanceToHomeFeatureNormalized:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("FamiliarityIndex")));

  if (!v27)
    goto LABEL_38;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("FamiliarityIndex")));
  objc_msgSend(v30, "floatValue");
  v32 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("FIDownRankThreshold")));
  objc_msgSend(v34, "floatValue");
  v36 = v35;

  if (v32 != 0.0
    || (objc_msgSend(v6, "interestingPOIFeature"), v38 = 1.0, *(float *)&v37 != 1.0)
    && (objc_msgSend(v6, "numPhotoAssetsResourcesNormalized"), *(float *)&v37 <= 0.0))
  {
    if (v32 > 0.0
      && v32 <= v36
      && ((objc_msgSend(v6, "interestingPOIFeature"), *(float *)&v37 == 1.0)
       || (objc_msgSend(v6, "numPhotoAssetsResourcesNormalized"), *(float *)&v37 > 0.0)))
    {
      v38 = (float)(v32 * -4.0) + 3.0;
    }
    else
    {
      v39 = v32;
      if (v32 > v36
        && self->_recommendedTabVisitFIThreshold >= v39
        && (objc_msgSend(v6, "numPhotoAssetsResourcesNormalized"), *(float *)&v37 == 0.0))
      {
        v38 = (float)(v32 * -6.67) + 5.0;
      }
      else
      {
        if (v32 >= 1.0)
          goto LABEL_30;
        if (self->_recommendedTabVisitFIThreshold >= v39)
          goto LABEL_30;
        objc_msgSend(v6, "numPhotoAssetsResourcesNormalized");
        v38 = -1.0;
        if (*(float *)&v37 != 0.0)
          goto LABEL_30;
      }
    }
  }
  *(float *)&v37 = v38;
  objc_msgSend(v6, "setFamiliarityIndexFeature:", v37);
LABEL_30:
  objc_msgSend(v6, "familiarityIndexFeature");
  if (*(float *)&v40 > 1.0)
  {
    LODWORD(v40) = 1.0;
    objc_msgSend(v6, "setFamiliarityIndexFeature:", v40);
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("DistanceToHome")));
  objc_msgSend(v42, "floatValue");
  v44 = v43;

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("distanceToHomeThreshold")));
  objc_msgSend(v46, "floatValue");
  v48 = v47;

  objc_msgSend(v6, "interestingPOIFeature");
  if (*(float *)&v28 != -1.0 && v32 >= 0.0 && v32 <= v36 && v44 > 0.0)
  {
    *(float *)&v28 = v44 / v48;
    objc_msgSend(v6, "setDistanceToHomeFeatureNormalized:", v28);
    if (v44 > v48)
    {
      LODWORD(v28) = 1.0;
      objc_msgSend(v6, "setDistanceToHomeFeatureNormalized:", v28);
    }
  }
LABEL_38:
  LODWORD(v28) = 0;
  objc_msgSend(v6, "setNumFamilyNormalized:", v28);
  LODWORD(v49) = 0;
  objc_msgSend(v6, "setNumKidsNormalized:", v49);
  LODWORD(v50) = 0;
  objc_msgSend(v6, "setNumFriendsNormalized:", v50);
  LODWORD(v51) = 0;
  objc_msgSend(v6, "setNumCoworkersNormalized:", v51);
  LODWORD(v52) = 0;
  objc_msgSend(v6, "setNumPetsNormalized:", v52);
  LODWORD(v53) = 0;
  objc_msgSend(v6, "setNumOtherPersonsNormalized:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persons"));
  v55 = objc_msgSend(v54, "count");

  if (v55)
  {
    v263 = 0u;
    v264 = 0u;
    v261 = 0u;
    v262 = 0u;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persons"));
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v261, v265, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v262;
      do
      {
        v60 = 0;
        do
        {
          if (*(_QWORD *)v262 != v59)
            objc_enumerationMutation(v56);
          v61 = *(void **)(*((_QWORD *)&v261 + 1) + 8 * (_QWORD)v60);
          if ((objc_msgSend(v61, "isMePerson") & 1) == 0)
          {
            v62 = +[MOClusteringUtility getTheBestPersonRelationtshipTagFor:](MOClusteringUtility, "getTheBestPersonRelationtshipTagFor:", v61);
            if (v62 > 20)
            {
              switch(v62)
              {
                case 21:
                  objc_msgSend(v6, "numFriendsNormalized");
                  *(float *)&v72 = v71 + 1.0;
                  objc_msgSend(v6, "setNumFriendsNormalized:", v72);
                  break;
                case 22:
                  objc_msgSend(v6, "numCoworkersNormalized");
                  *(float *)&v74 = v73 + 1.0;
                  objc_msgSend(v6, "setNumCoworkersNormalized:", v74);
                  break;
                case 27:
                  objc_msgSend(v6, "numPetsNormalized");
                  *(float *)&v66 = v65 + 1.0;
                  objc_msgSend(v6, "setNumPetsNormalized:", v66);
                  break;
              }
            }
            else
            {
              switch(v62)
              {
                case 1:
                  objc_msgSend(v6, "numOtherPersonsNormalized");
                  *(float *)&v68 = v67 + 1.0;
                  objc_msgSend(v6, "setNumOtherPersonsNormalized:", v68);
                  break;
                case 4:
                  objc_msgSend(v6, "numFamilyNormalized");
                  *(float *)&v70 = v69 + 1.0;
                  objc_msgSend(v6, "setNumFamilyNormalized:", v70);
                  break;
                case 15:
                  objc_msgSend(v6, "numKidsNormalized");
                  *(float *)&v64 = v63 + 1.0;
                  objc_msgSend(v6, "setNumKidsNormalized:", v64);
                  break;
              }
            }
          }
          v60 = (char *)v60 + 1;
        }
        while (v58 != v60);
        v75 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v261, v265, 16);
        v58 = v75;
      }
      while (v75);
    }

  }
  v76 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v77 = objc_claimAutoreleasedReturnValue(v76);
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleRanking _fillHeuristicsInfoForRanking:forBundle:].cold.1(v6, v77);

  objc_msgSend(v6, "numFamilyNormalized");
  v78 = 1.0;
  v79 = *(float *)&v80 < 2.0;
  LODWORD(v80) = 1.0;
  if (v79)
  {
    objc_msgSend(v6, "numFamilyNormalized", v80);
    *(float *)&v80 = *(float *)&v80 * 0.5;
  }
  objc_msgSend(v6, "setNumFamilyNormalized:", v80);
  objc_msgSend(v6, "numKidsNormalized");
  if (*(float *)&v81 < 2.0)
  {
    objc_msgSend(v6, "numKidsNormalized");
    v78 = *(float *)&v81 * 0.5;
  }
  *(float *)&v81 = v78;
  objc_msgSend(v6, "setNumKidsNormalized:", v81);
  objc_msgSend(v6, "numFriendsNormalized");
  v82 = 1.0;
  v79 = *(float *)&v83 < 2.0;
  LODWORD(v83) = 1.0;
  if (v79)
  {
    objc_msgSend(v6, "numFriendsNormalized", v83);
    *(float *)&v83 = *(float *)&v83 * 0.5;
  }
  objc_msgSend(v6, "setNumFriendsNormalized:", v83);
  objc_msgSend(v6, "numCoworkersNormalized");
  if (*(float *)&v84 < 2.0)
  {
    objc_msgSend(v6, "numCoworkersNormalized");
    v82 = *(float *)&v84 * 0.5;
  }
  *(float *)&v84 = v82;
  objc_msgSend(v6, "setNumCoworkersNormalized:", v84);
  objc_msgSend(v6, "numPetsNormalized");
  v85 = 1.0;
  v79 = *(float *)&v86 < 2.0;
  LODWORD(v86) = 1.0;
  if (v79)
  {
    objc_msgSend(v6, "numPetsNormalized", v86);
    *(float *)&v86 = *(float *)&v86 * 0.5;
  }
  objc_msgSend(v6, "setNumPetsNormalized:", v86);
  objc_msgSend(v6, "numOtherPersonsNormalized");
  if (*(float *)&v87 < 2.0)
  {
    objc_msgSend(v6, "numOtherPersonsNormalized");
    v85 = *(float *)&v87 * 0.5;
  }
  *(float *)&v87 = v85;
  objc_msgSend(v6, "setNumOtherPersonsNormalized:", v87);
  LODWORD(v88) = 0;
  objc_msgSend(v6, "setCallDurationFeatureNormalized:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("callDurationThreshold")));
  objc_msgSend(v90, "floatValue");
  v92 = v91;

  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v94 = CFSTR("callDuration");
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", CFSTR("callDuration")));
  objc_msgSend(v95, "doubleValue");
  v97 = v96;

  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v99 = v98;
  if (v97 <= 0.0)
  {
    v94 = CFSTR("dailyAggregateCallDuration");
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKey:", CFSTR("dailyAggregateCallDuration")));
    objc_msgSend(v100, "floatValue");
    v102 = v101;

    if (v102 <= 0.0)
      goto LABEL_84;
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
    v99 = v98;
  }
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKey:", v94));
  objc_msgSend(v104, "floatValue");
  v106 = v105;

  *(float *)&v107 = v106 / v92;
  objc_msgSend(v6, "setCallDurationFeatureNormalized:", v107);
  if (v106 > v92)
  {
    LODWORD(v103) = 1.0;
    objc_msgSend(v6, "setCallDurationFeatureNormalized:", v103);
  }
LABEL_84:
  LODWORD(v103) = 0;
  objc_msgSend(v6, "setBurstyInteractionCountFeatureNormalized:", v103);
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "objectForKey:", CFSTR("burstyInteractionCount")));
  objc_msgSend(v109, "doubleValue");
  v111 = v110;

  if (v111 > 0.0)
  {
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "objectForKey:", CFSTR("burstyInteractionCount")));
    objc_msgSend(v113, "floatValue");
    v115 = v114;

    v116 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("burstyInteractionCountThreshold")));
    *(float *)&v118 = v115 / (float)(int)objc_msgSend(v117, "intValue");
    objc_msgSend(v6, "setBurstyInteractionCountFeatureNormalized:", v118);

    v119 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("burstyInteractionCountThreshold")));
    v121 = (float)(int)objc_msgSend(v120, "intValue");

    if (v115 > v121)
    {
      LODWORD(v122) = 1.0;
      objc_msgSend(v6, "setBurstyInteractionCountFeatureNormalized:", v122);
    }
  }
  objc_msgSend(v6, "setMultipleInteractionTypesFeature:", 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKey:", CFSTR("multipleInteractionTypes")));
  v125 = objc_msgSend(v124, "BOOLValue");

  if (v125)
    objc_msgSend(v6, "setMultipleInteractionTypesFeature:", 1);
  objc_msgSend(v6, "setContactLocationWorkFeature:", 0);
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "objectForKey:", CFSTR("contactLocationWork")));
  v128 = objc_msgSend(v127, "BOOLValue");

  if (v128)
    objc_msgSend(v6, "setContactLocationWorkFeature:", 0xFFFFFFFFLL);
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("isFamilyContact")));
  objc_msgSend(v130, "floatValue");
  objc_msgSend(v6, "setIsFamilyContact:");

  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("isCoworkerContact")));
  objc_msgSend(v132, "floatValue");
  objc_msgSend(v6, "setIsCoworkerContact:");

  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("isRepetitiveContact")));
  objc_msgSend(v6, "setIsRepetitiveContact:", objc_msgSend(v134, "BOOLValue"));

  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "objectForKeyedSubscript:", CFSTR("isGroupConversation")));
  objc_msgSend(v6, "setGroupConversationFeature:", objc_msgSend(v136, "BOOLValue"));

  LODWORD(v137) = 0;
  objc_msgSend(v6, "setWorkoutDurationFeatureNormalized:", v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "objectForKey:", CFSTR("WorkoutDuration")));
  objc_msgSend(v139, "floatValue");
  v141 = v140;

  v142 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("workoutDurationThreshold")));
  objc_msgSend(v143, "floatValue");
  v145 = v144;

  if (objc_msgSend(v6, "bundleSubType") == (id)202)
  {
    v147 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("WeeklySummaryWorkoutDurationThreshold")));
    objc_msgSend(v148, "floatValue");
    v145 = v149;

  }
  if (v141 > 0.0)
  {
    *(float *)&v146 = v141 / v145;
    if (v141 >= v145)
      *(float *)&v146 = 1.0;
    objc_msgSend(v6, "setWorkoutDurationFeatureNormalized:", v146);
  }
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "objectForKeyedSubscript:", CFSTR("mediaPlayTimeThreshold")));
  objc_msgSend(v151, "floatValue");
  v153 = v152;

  v154 = (void *)MediaWeeklySummarySubtypeVariants;
  v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "bundleSubType")));
  LODWORD(v154) = objc_msgSend(v154, "containsObject:", v155);

  if ((_DWORD)v154)
  {
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "objectForKeyedSubscript:", CFSTR("weeklySummaryMediaPlayTimeThreshold")));
    objc_msgSend(v157, "floatValue");
    v153 = v158;

  }
  v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKey:", CFSTR("MediaActionIsRepeat")));
  objc_msgSend(v160, "floatValue");
  objc_msgSend(v6, "setMediaScoreFeatureNormalized:");

  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "objectForKey:", CFSTR("MediaTotalPlayTime")));
  objc_msgSend(v162, "floatValue");
  v164 = v163;

  if (v164 > 0.0)
  {
    objc_msgSend(v6, "mediaScoreFeatureNormalized");
    if (v164 >= v153)
    {
      *(float *)&v165 = *(float *)&v165 + 0.5;
    }
    else
    {
      v165 = v164 * 0.5 / v153 + *(float *)&v165;
      *(float *)&v165 = v165;
    }
    objc_msgSend(v6, "setMediaScoreFeatureNormalized:", v165);
  }
  objc_msgSend(v6, "setItemFromMeFeature:", 0);
  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "objectForKey:", CFSTR("ItemShareDirection")));
  if (objc_msgSend(v167, "intValue") == 1)
  {

LABEL_107:
    objc_msgSend(v6, "setItemFromMeFeature:", 1);
    goto LABEL_108;
  }
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "objectForKey:", CFSTR("ItemShareDirection")));
  v170 = objc_msgSend(v169, "intValue");

  if (v170 == 3)
    goto LABEL_107;
LABEL_108:
  v172 = 0.0;
  LODWORD(v171) = 0;
  objc_msgSend(v6, "setShareCountFeatureNormalized:", v171);
  v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "objectForKey:", CFSTR("ItemAttributionsCount")));
  v175 = objc_msgSend(v174, "intValue");

  if (v175 >= 1)
  {
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
    v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "objectForKey:", CFSTR("ItemAttributionsCount")));
    objc_msgSend(v177, "floatValue");
    v179 = v178;

    v180 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
    v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("shareCountThreshold")));
    objc_msgSend(v181, "floatValue");
    *(float *)&v183 = v179 / v182;
    objc_msgSend(v6, "setShareCountFeatureNormalized:", v183);

    v184 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
    v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("shareCountThreshold")));
    objc_msgSend(v185, "floatValue");
    v187 = v186;

    if (v179 > v187)
    {
      LODWORD(v188) = 1.0;
      objc_msgSend(v6, "setShareCountFeatureNormalized:", v188);
    }
  }
  v189 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
  v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("maxPeopleCountFromSocialContext")));
  objc_msgSend(v190, "floatValue");
  v192 = v191;

  v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "objectForKey:", CFSTR("PeopleCountWeightedAverage")));

  if (v194)
  {
    objc_msgSend(v194, "floatValue");
    v172 = *(float *)&v195 / v192;
  }
  *(float *)&v195 = v172;
  objc_msgSend(v6, "setPeopleCountWeightedAverageNormalized:", v195);
  objc_msgSend(v6, "peopleCountWeightedAverageNormalized");
  if (*(float *)&v196 > 1.0)
  {
    LODWORD(v196) = 1.0;
    objc_msgSend(v6, "setPeopleCountWeightedAverageNormalized:", v196);
  }
  v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "objectForKey:", CFSTR("PeopleCountMax")));

  if (v198)
  {
    objc_msgSend(v198, "floatValue");
    *(float *)&v199 = *(float *)&v199 / v192;
  }
  else
  {
    LODWORD(v199) = 0;
  }
  objc_msgSend(v6, "setPeopleCountMaxNormalized:", v199);
  objc_msgSend(v6, "peopleCountMaxNormalized");
  if (*(float *)&v200 > 1.0)
  {
    LODWORD(v200) = 1.0;
    objc_msgSend(v6, "setPeopleCountMaxNormalized:", v200);
  }
  v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
  v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
  objc_msgSend(v201, "timeIntervalSinceDate:", v202);
  v204 = v203;

  if (v204 <= 0.0)
  {
    LODWORD(v205) = 0;
    objc_msgSend(v6, "setPeopleCountWeightedSumNormalized:", v205);
  }
  else
  {
    v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    objc_msgSend(v206, "timeIntervalSinceDate:", v207);
    v209 = v208;

    v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
    v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "objectForKey:", CFSTR("PeopleCountWeightedSum")));

    if (v211)
    {
      v213 = v209 * v192;
      objc_msgSend(v211, "floatValue");
      *(float *)&v212 = *(float *)&v212 / v213;
    }
    else
    {
      LODWORD(v212) = 0;
    }
    objc_msgSend(v6, "setPeopleCountWeightedSumNormalized:", v212);
    objc_msgSend(v6, "peopleCountWeightedSumNormalized");
    if (*(float *)&v214 > 1.0)
    {
      LODWORD(v214) = 1.0;
      objc_msgSend(v6, "setPeopleCountWeightedSumNormalized:", v214);
    }

  }
  v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "objectForKey:", CFSTR("PeopleDensityWeightedAverage")));

  v218 = 0.0;
  if (v216)
  {
    objc_msgSend(v6, "interestingPOIFeature");
    if (v219 > 0.0 || objc_msgSend(v7, "interfaceType") == (id)1)
    {
      objc_msgSend(v216, "floatValue");
      v218 = *(float *)&v217 / v192;
    }
  }
  *(float *)&v217 = v218;
  objc_msgSend(v6, "setPeopleDensityWeightedAverageNormalized:", v217);
  objc_msgSend(v6, "peopleDensityWeightedAverageNormalized");
  if (*(float *)&v220 > 1.0)
  {
    LODWORD(v220) = 1.0;
    objc_msgSend(v6, "setPeopleDensityWeightedAverageNormalized:", v220);
  }
  v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "objectForKey:", CFSTR("PeopleDensityMax")));

  if (v222)
  {
    objc_msgSend(v222, "floatValue");
    *(float *)&v223 = *(float *)&v223 / v192;
  }
  else
  {
    LODWORD(v223) = 0;
  }
  objc_msgSend(v6, "setPeopleDensityMaxNormalized:", v223, v194);
  objc_msgSend(v6, "peopleDensityMaxNormalized");
  v225 = 1.0;
  if (*(float *)&v224 > 1.0)
  {
    LODWORD(v224) = 1.0;
    objc_msgSend(v6, "setPeopleDensityMaxNormalized:", v224);
  }
  v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "objectForKeyedSubscript:", CFSTR("TimeAtHomeDuration")));
  objc_msgSend(v227, "floatValue");
  v229 = v228;
  v230 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
  v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "objectForKeyedSubscript:", CFSTR("timeAtHomeDurationThreshold")));
  objc_msgSend(v231, "floatValue");
  *(float *)&v233 = v229 / v232;
  objc_msgSend(v6, "setTimeAtHomeDuration:", v233);

  v234 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v234, "objectForKey:", CFSTR("StateOfMindLabels")));

  v236 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
  v237 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v236, "objectForKeyedSubscript:", CFSTR("stateOfMindLabelCountThreshold")));
  objc_msgSend(v237, "doubleValue");
  v239 = v238;

  v240 = (double)(unint64_t)objc_msgSend(v235, "count");
  if (v239 > v240)
  {
    v240 = (double)(unint64_t)objc_msgSend(v235, "count") / v239;
    v225 = v240;
  }
  *(float *)&v240 = v225;
  objc_msgSend(v6, "setStateOfMindLabelCountNormalized:", v240);
  v241 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241, "objectForKey:", CFSTR("StateOfMindDomains")));

  v243 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
  v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v243, "objectForKeyedSubscript:", CFSTR("stateOfMindDomainCountThreshold")));
  objc_msgSend(v244, "doubleValue");
  v246 = v245;

  v247 = (double)(unint64_t)objc_msgSend(v242, "count");
  LODWORD(v248) = 1.0;
  if (v246 > v247)
  {
    v248 = (double)(unint64_t)objc_msgSend(v242, "count", v248) / v246;
    *(float *)&v248 = v248;
  }
  objc_msgSend(v6, "setStateOfMindDomainCountNormalized:", v248);
  v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v249, "objectForKey:", CFSTR("StateOfMindLoggedIn3pApp")));
  *(float *)&v251 = (float)objc_msgSend(v250, "BOOLValue");
  objc_msgSend(v6, "setStateOfMindLoggedIn3pApp:", v251);

  v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaDataForRank"));
  v253 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v252, "objectForKey:", CFSTR("StateOfMindLoggedInJournalApp")));
  *(float *)&v254 = (float)objc_msgSend(v253, "BOOLValue");
  objc_msgSend(v6, "setStateOfMindLoggedInJournalApp:", v254);

  objc_msgSend(v6, "setIsBundleAggregated:", objc_msgSend(v7, "isAggregatedAndSuppressed"));
  objc_msgSend(v6, "setSummarizationGranularity:", objc_msgSend(v7, "summarizationGranularity"));
  LODWORD(v255) = 0;
  objc_msgSend(v6, "setAvgSubBundleGoodnessScores:", v255);
  if (objc_msgSend(v7, "interfaceType") == (id)15)
  {
    v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clusterMetadata"));
    v257 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "subBundleGoodnessScores"));
    v258 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v257, "valueForKeyPath:", CFSTR("@avg.self")));
    objc_msgSend(v258, "floatValue");
    objc_msgSend(v6, "setAvgSubBundleGoodnessScores:");

  }
}

- (void)_fillRichnessInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  unint64_t v55;
  id v56;
  uint64_t v57;
  void *i;
  void *v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  NSMutableDictionary *v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *j;
  void *v69;
  void *v70;
  void *v71;
  float v72;
  float v73;
  double v74;
  void *v75;
  void *v76;
  float v77;
  float v78;
  double v79;
  void *v80;
  void *v81;
  float v82;
  float v83;
  double v84;
  void *v85;
  BOOL v86;
  id v87;
  id v88;
  NSMutableDictionary *v89;
  NSMutableDictionary *v90;
  id obj;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[4];
  id v97;
  NSMutableDictionary *v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[5];
  _QWORD v107[5];
  _QWORD v108[5];
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  NSMutableSet *v114;
  _BYTE v115[128];
  _BYTE v116[128];

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "setBundleInterfaceType:", objc_msgSend(v6, "interfaceType"));
  objc_msgSend(v5, "setBundleSubType:", objc_msgSend(v6, "bundleSubType"));
  objc_msgSend(v5, "setBundleSuperType:", objc_msgSend(v6, "bundleSuperType"));
  objc_msgSend(v5, "setEvergreenType:", 0);
  objc_msgSend(v5, "setEvergreenPromptExists:", 0);
  if (objc_msgSend(v6, "interfaceType") == (id)11)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      objc_msgSend(v5, "setEvergreenType:", v11);

      os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v13 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[MOEventBundleRanking _fillRichnessInfoForRanking:forBundle:].cold.2(v5, v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "promptIndexes"));
      v15 = objc_msgSend(v14, "count") == 0;

      if (!v15)
      {
        objc_msgSend(v5, "setEvergreenPromptExists:", 1);
        v16 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[MOEventBundleRanking _fillRichnessInfoForRanking:forBundle:].cold.1();

      }
    }
  }
  v18 = (void *)visitSubtypeVariants;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "bundleSubType")));
  if ((objc_msgSend(v18, "containsObject:", v19) & 1) != 0
    || objc_msgSend(v6, "bundleSubType") == (id)105)
  {
    v20 = 0;
  }
  else
  {
    v34 = (void *)phoneSensedWalkingVariants;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "bundleSubType")));
    if ((objc_msgSend(v34, "containsObject:", v18) & 1) == 0)
    {

LABEL_35:
      objc_msgSend(v5, "setAllPlaceNames:", emptyStringSet);
      goto LABEL_36;
    }
    v20 = 1;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "place"));
  if (v21)
  {

    if (v20)
    goto LABEL_17;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "places"));

  if ((v20 & 1) != 0)
  {

    if (!v33)
      goto LABEL_35;
  }
  else
  {

    if (!v33)
      goto LABEL_35;
  }
LABEL_17:
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__30;
  v113 = __Block_byref_object_dispose__30;
  v114 = objc_opt_new(NSMutableSet);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "place"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "placeName"));
  v24 = v23 == 0;

  if (!v24)
  {
    v25 = (void *)v110[5];
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "place"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "placeName"));
    objc_msgSend(v25, "addObject:", v27);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "places"));
  v29 = v28 == 0;

  if (!v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "places"));
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472;
    v108[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke;
    v108[3] = &unk_1002B46C8;
    v108[4] = &v109;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v108);

  }
  v31 = objc_msgSend((id)v110[5], "count");
  if (v31)
    v32 = objc_msgSend((id)v110[5], "copy");
  else
    v32 = (id)emptyStringSet;
  objc_msgSend(v5, "setAllPlaceNames:", v32);
  if (v31)

  _Block_object_dispose(&v109, 8);
LABEL_36:
  if (objc_msgSend(v6, "bundleSuperType") != (id)3
    || (v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persons")),
        v36 = v35 == 0,
        v35,
        v36))
  {
    objc_msgSend(v5, "setAllContactIdentifiers:", emptyStringSet);
  }
  else
  {
    v109 = 0;
    v110 = &v109;
    v111 = 0x3032000000;
    v112 = __Block_byref_object_copy__30;
    v113 = __Block_byref_object_dispose__30;
    v114 = objc_opt_new(NSMutableSet);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persons"));
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_2;
    v107[3] = &unk_1002B46F0;
    v107[4] = &v109;
    objc_msgSend(v37, "enumerateObjectsUsingBlock:", v107);

    v38 = objc_msgSend((id)v110[5], "count");
    if (v38)
      v39 = objc_msgSend((id)v110[5], "copy");
    else
      v39 = (id)emptyStringSet;
    objc_msgSend(v5, "setAllContactIdentifiers:", v39);
    if (v38)

    _Block_object_dispose(&v109, 8);
  }
  v40 = (void *)workoutSubtypeVariants;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "bundleSubType")));
  if ((objc_msgSend(v40, "containsObject:", v41) & 1) != 0)
    goto LABEL_49;
  v42 = (void *)phoneSensedWalkingVariants;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "bundleSubType")));
  if ((objc_msgSend(v42, "containsObject:", v43) & 1) != 0
    || objc_msgSend(v6, "bundleSubType") == (id)203)
  {

LABEL_49:
    goto LABEL_50;
  }
  v86 = objc_msgSend(v6, "bundleSubType") == (id)202;

  if (!v86)
  {
    objc_msgSend(v5, "setWorkoutTypes:", emptyStringSet);
    goto LABEL_62;
  }
LABEL_50:
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__30;
  v113 = __Block_byref_object_dispose__30;
  v114 = objc_opt_new(NSMutableSet);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "actionName"));
  if (!v45)
  {
LABEL_53:

    goto LABEL_54;
  }
  v46 = objc_msgSend(v6, "bundleSubType") == (id)202;

  if (!v46)
  {
    v47 = (void *)v110[5];
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "actionName"));
    objc_msgSend(v47, "addObject:", v48);

    goto LABEL_53;
  }
LABEL_54:
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));
  v50 = v49 == 0;

  if (!v50)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_3;
    v106[3] = &unk_1002B4718;
    v106[4] = &v109;
    objc_msgSend(v51, "enumerateObjectsUsingBlock:", v106);

  }
  v52 = objc_msgSend((id)v110[5], "count");
  if (v52)
    v53 = objc_msgSend((id)v110[5], "copy");
  else
    v53 = (id)emptyStringSet;
  objc_msgSend(v5, "setWorkoutTypes:", v53);
  if (v52)

  _Block_object_dispose(&v109, 8);
LABEL_62:
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_4;
  v104[3] = &unk_1002B10F8;
  v54 = objc_alloc_init((Class)NSCountedSet);
  v105 = v54;
  objc_msgSend(v6, "withResourcesUsingBlock:", v104);
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v54;
  v55 = 0;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
  if (v56)
  {
    v57 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(_QWORD *)v101 != v57)
          objc_enumerationMutation(obj);
        v59 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v59, "intValue") && objc_msgSend(v59, "intValue") != 12)
          ++v55;
      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
    }
    while (v56);
  }

  v89 = objc_opt_new(NSMutableDictionary);
  *(float *)&v60 = (float)v55 / 7.0;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v60));
  -[NSMutableDictionary setObject:forKey:](v89, "setObject:forKey:", v61, CFSTR("RankingRichnessPrimaryPriorityScoreKey"));

  -[NSMutableDictionary setObject:forKey:](v89, "setObject:forKey:", &off_1002DCD38, CFSTR("RankingRichnessSecondaryPriorityScoreKey"));
  -[NSMutableDictionary setObject:forKey:](v89, "setObject:forKey:", &off_1002DCD38, CFSTR("RankingRichnessAuxiliaryPriorityScoreKey"));
  LODWORD(v62) = 0;
  objc_msgSend(v5, "setNumPhotoAssetsResourcesNormalized:", v62);
  LODWORD(v63) = 0;
  objc_msgSend(v5, "setNumMediaTypeResourcesNormalized:", v63);
  v64 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v64, "setObject:forKey:", v89, CFSTR("NumUniqueResourceTypesNormalizedKey"));
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_619;
  v96[3] = &unk_1002B4740;
  v88 = v5;
  v97 = v88;
  v90 = v64;
  v98 = v90;
  v99 = v6;
  v87 = v99;
  objc_msgSend(v99, "withResourcesUsingBlock:", v96);
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v90, "allKeys"));
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
  if (v66)
  {
    v67 = *(_QWORD *)v93;
    do
    {
      for (j = 0; j != v66; j = (char *)j + 1)
      {
        if (*(_QWORD *)v93 != v67)
          objc_enumerationMutation(v65);
        v69 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v69, "isEqualToString:", CFSTR("NumUniqueResourceTypesNormalizedKey")) & 1) == 0)
        {
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v90, "objectForKeyedSubscript:", v69));
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("RankingRichnessPrimaryPriorityScoreKey")));
          objc_msgSend(v71, "floatValue");
          v73 = v72;

          *(float *)&v74 = v73 / 13.0;
          if ((float)(v73 / 13.0) > 1.0)
            *(float *)&v74 = 1.0;
          v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v74));
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v75, CFSTR("RankingRichnessPrimaryPriorityScoreKey"));

          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("RankingRichnessSecondaryPriorityScoreKey")));
          objc_msgSend(v76, "floatValue");
          v78 = v77;

          *(float *)&v79 = v78 / 13.0;
          if ((float)(v78 / 13.0) > 1.0)
            *(float *)&v79 = 1.0;
          v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v79));
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v80, CFSTR("RankingRichnessSecondaryPriorityScoreKey"));

          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("RankingRichnessAuxiliaryPriorityScoreKey")));
          objc_msgSend(v81, "floatValue");
          v83 = v82;

          *(float *)&v84 = v83 / 13.0;
          if ((float)(v83 / 13.0) > 1.0)
            *(float *)&v84 = 1.0;
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v84));
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v85, CFSTR("RankingRichnessAuxiliaryPriorityScoreKey"));

        }
      }
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
    }
    while (v66);
  }

  objc_msgSend(v88, "setBundleRichnessDict:", v90);
}

void __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeName"));

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeName"));
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactIdentifier"));

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactIdentifier"));
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionName"));

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionName"));
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "type")));
  objc_msgSend(v2, "addObject:", v3);

}

void __62__MOEventBundleRanking__fillRichnessInfoForRanking_forBundle___block_invoke_619(uint64_t a1, void *a2)
{
  void *v3;
  float v4;
  double v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  float v21;
  double v22;
  double v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  float v33;
  float v34;
  float v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  id v50;

  v50 = a2;
  if (objc_msgSend(v50, "type") == (id)2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "numPhotoAssetsResourcesNormalized");
    *(float *)&v5 = v4 + 1.0;
    objc_msgSend(v3, "setNumPhotoAssetsResourcesNormalized:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", objc_msgSend(v50, "type")));
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", CFSTR("RankingRichnessPrimaryPriorityScoreKey")));
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", CFSTR("RankingRichnessSecondaryPriorityScoreKey")));
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", CFSTR("RankingRichnessAuxiliaryPriorityScoreKey")));
    objc_msgSend(v15, "floatValue");
    v17 = v16;

  }
  else
  {
    v14 = 0.0;
    v17 = 0.0;
    v11 = 0.0;
  }
  objc_msgSend(v50, "priorityScore");
  if (v18 >= 200.0)
  {
    objc_msgSend(v50, "priorityScore");
    if (v23 < 300.0)
    {
      if (objc_msgSend(v50, "type") == (id)2)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "photoCurationScore"));
        objc_msgSend(v24, "floatValue");
        v26 = v25;

        if (v26 == 0.0)
        {
          v14 = v14 + 0.5;
          goto LABEL_36;
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "photoCurationScore"));
        objc_msgSend(v38, "floatValue");
        v14 = v14 + v43;
        goto LABEL_35;
      }
      v36 = (void *)thirdPartyMediaSubtypeVariants;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "bundleSubType")));
      LODWORD(v36) = objc_msgSend(v36, "containsObject:", v37);

      if (!(_DWORD)v36)
        v14 = v14 + 1.0;
      goto LABEL_36;
    }
    objc_msgSend(v50, "priorityScore");
    v30 = v29;
    v31 = objc_msgSend(v50, "type");
    HIDWORD(v22) = 1081294848;
    if (v30 < 308.0)
    {
      if (v31 == (id)2)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "photoCurationScore"));
        objc_msgSend(v32, "floatValue");
        v34 = v33;

        if (v34 == 0.0)
        {
          v35 = 0.5;
          goto LABEL_27;
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "photoCurationScore"));
        objc_msgSend(v38, "floatValue");
        v17 = v17 + v44;
      }
      else
      {
        v40 = (void *)thirdPartyMediaSubtypeVariants;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "bundleSubType")));
        if (!objc_msgSend(v40, "containsObject:", v38))
        {
          v41 = (void *)MediaWeeklySummarySubtypeVariants;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "bundleSubType")));
          LODWORD(v41) = objc_msgSend(v41, "containsObject:", v42);

          if (!(_DWORD)v41)
            v17 = v17 + 1.0;
          goto LABEL_36;
        }
      }
LABEL_35:

      goto LABEL_36;
    }
    if (v31 != (id)10 && objc_msgSend(v50, "type") != (id)6)
      goto LABEL_36;
    v35 = 1.0;
LABEL_27:
    v17 = v17 + v35;
    goto LABEL_36;
  }
  if (objc_msgSend(v50, "type") == (id)2)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "photoCurationScore"));
    objc_msgSend(v19, "floatValue");
    v21 = v20;

    if (v21 == 0.0)
    {
      v11 = v11 + 0.5;
      goto LABEL_36;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "photoCurationScore"));
    objc_msgSend(v38, "floatValue");
    v11 = v11 + v39;
    goto LABEL_35;
  }
  v27 = (void *)thirdPartyMediaSubtypeVariants;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "bundleSubType")));
  LODWORD(v27) = objc_msgSend(v27, "containsObject:", v28);

  if (!(_DWORD)v27)
    v11 = v11 + 1.0;
LABEL_36:
  if (!v8)
    v8 = objc_opt_new(NSMutableDictionary);
  *(float *)&v22 = v11;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v45, CFSTR("RankingRichnessPrimaryPriorityScoreKey"));

  *(float *)&v46 = v14;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v46));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v47, CFSTR("RankingRichnessSecondaryPriorityScoreKey"));

  *(float *)&v48 = v17;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v48));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v49, CFSTR("RankingRichnessAuxiliaryPriorityScoreKey"));

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, v6);
}

- (void)_fillDistincnessInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  unsigned int v21;
  float v22;
  double v23;
  float v24;
  double v25;
  float v26;
  double v27;
  float v28;
  double v29;
  void *v30;
  float v31;
  double v32;
  double v33;
  float v34;
  double v35;
  double v36;
  float v37;
  double v38;
  double v39;
  BOOL v40;
  double v41;
  double v42;
  double v43;
  float v44;
  float v45;
  double v46;
  double v47;
  uint64_t v48;
  NSMutableSet *v49;
  void *v50;
  _QWORD v51[5];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];

  v5 = a3;
  v6 = a4;
  LODWORD(v7) = 0;
  objc_msgSend(v5, "setNumAnomalyEventsNormalized:", v7);
  LODWORD(v8) = 0;
  objc_msgSend(v5, "setNumTrendEventsNormalized:", v8);
  LODWORD(v9) = 0;
  objc_msgSend(v5, "setNumRoutineEventsNormalized:", v9);
  LODWORD(v10) = 0;
  objc_msgSend(v5, "setNumStateOfMindEventsNormalized:", v10);
  v49 = objc_opt_new(NSMutableSet);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v50 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "provider") == (id)5)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "patterns"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalyFeatureType")));
          v18 = objc_msgSend(v17, "isEqual:", &off_1002DABE0);

          if ((v18 & 1) != 0)
            continue;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "patterns"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
          v21 = objc_msgSend(v20, "intValue");

          switch(v21)
          {
            case 2u:
              objc_msgSend(v5, "numRoutineEventsNormalized");
              *(float *)&v27 = v26 + 1.0;
              objc_msgSend(v5, "setNumRoutineEventsNormalized:", v27);
              break;
            case 1u:
              objc_msgSend(v5, "numTrendEventsNormalized");
              *(float *)&v25 = v24 + 1.0;
              objc_msgSend(v5, "setNumTrendEventsNormalized:", v25);
              break;
            case 0u:
              objc_msgSend(v5, "numAnomalyEventsNormalized");
              *(float *)&v23 = v22 + 1.0;
              objc_msgSend(v5, "setNumAnomalyEventsNormalized:", v23);
              break;
          }
        }
        v52 = 0;
        v53 = &v52;
        v54 = 0x2020000000;
        v55 = 0;
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = __65__MOEventBundleRanking__fillDistincnessInfoForRanking_forBundle___block_invoke;
        v51[3] = &unk_1002B4768;
        v51[4] = &v52;
        objc_msgSend(v50, "withResourcesUsingBlock:", v51);
        if (objc_msgSend(v15, "category") == (id)24 && objc_msgSend(v15, "provider") != (id)5 && *((_BYTE *)v53 + 24))
        {
          objc_msgSend(v5, "numStateOfMindEventsNormalized");
          *(float *)&v29 = v28 + 1.0;
          objc_msgSend(v5, "setNumStateOfMindEventsNormalized:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifierFromProvider"));
          -[NSMutableSet addObject:](v49, "addObject:", v30);

        }
        _Block_object_dispose(&v52, 8);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v12);
  }

  objc_msgSend(v5, "numAnomalyEventsNormalized");
  *(float *)&v32 = v31 * 0.25;
  objc_msgSend(v5, "setNumAnomalyEventsNormalized:", v32);
  objc_msgSend(v5, "numAnomalyEventsNormalized");
  if (*(float *)&v33 > 1.0)
  {
    LODWORD(v33) = 1.0;
    objc_msgSend(v5, "setNumAnomalyEventsNormalized:", v33);
  }
  objc_msgSend(v5, "numTrendEventsNormalized");
  *(float *)&v35 = v34 * 0.25;
  objc_msgSend(v5, "setNumTrendEventsNormalized:", v35);
  objc_msgSend(v5, "numTrendEventsNormalized");
  if (*(float *)&v36 > 1.0)
  {
    LODWORD(v36) = 1.0;
    objc_msgSend(v5, "setNumTrendEventsNormalized:", v36);
  }
  objc_msgSend(v5, "numRoutineEventsNormalized");
  *(float *)&v38 = v37 * 0.25;
  objc_msgSend(v5, "setNumRoutineEventsNormalized:", v38);
  objc_msgSend(v5, "numRoutineEventsNormalized");
  if (*(float *)&v39 > 1.0)
  {
    LODWORD(v39) = 1.0;
    objc_msgSend(v5, "setNumRoutineEventsNormalized:", v39);
  }
  if (objc_msgSend(v5, "bundleInterfaceType") == (id)4)
  {
    objc_msgSend(v5, "numAnomalyEventsNormalized");
    v40 = *(float *)&v41 <= 0.0;
    LODWORD(v41) = 0;
    if (!v40)
      *(float *)&v41 = 1.0;
    objc_msgSend(v5, "setNumAnomalyEventsNormalized:", v41);
    objc_msgSend(v5, "numTrendEventsNormalized");
    v40 = *(float *)&v42 <= 0.0;
    LODWORD(v42) = 0;
    if (!v40)
      *(float *)&v42 = 1.0;
    objc_msgSend(v5, "setNumTrendEventsNormalized:", v42);
    objc_msgSend(v5, "numRoutineEventsNormalized");
    v40 = *(float *)&v43 <= 0.0;
    LODWORD(v43) = 0;
    if (!v40)
      *(float *)&v43 = 1.0;
    objc_msgSend(v5, "setNumRoutineEventsNormalized:", v43);
  }
  objc_msgSend(v5, "numStateOfMindEventsNormalized");
  if (v44 <= 0.0)
  {
    v48 = emptyStringSet;
  }
  else
  {
    objc_msgSend(v5, "numStateOfMindEventsNormalized");
    *(float *)&v46 = v45 * 0.25;
    objc_msgSend(v5, "setNumStateOfMindEventsNormalized:", v46);
    objc_msgSend(v5, "numStateOfMindEventsNormalized");
    v48 = (uint64_t)v49;
    if (*(float *)&v47 > 1.0)
    {
      LODWORD(v47) = 1.0;
      objc_msgSend(v5, "setNumStateOfMindEventsNormalized:", v49, v47);
      v48 = (uint64_t)v49;
    }
  }
  objc_msgSend(v5, "setAllStateOfMindIdentifiers:", v48);

}

id __65__MOEventBundleRanking__fillDistincnessInfoForRanking_forBundle___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id result;

  result = objc_msgSend(a2, "type");
  if (result == (id)16)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)_fillEngagementInfoForRanking:(id)a3 forBundle:(id)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  double v21;
  float v22;
  double v23;
  double v24;
  id v25;

  v25 = a3;
  v6 = a4;
  objc_msgSend(v25, "setSuggestionIsDeleted:", objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsDeleted")));
  objc_msgSend(v25, "setSuggestionIsSelected:", objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsSelected")));
  objc_msgSend(v25, "setSuggestionQuickAddEntry:", objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsQuickAddEntry")));
  objc_msgSend(v25, "setJournalEntryIsEdited:", objc_msgSend(v6, "hasAppEntryEngagementEvent:", CFSTR("appEntryEdited")));
  objc_msgSend(v25, "setJournalEntryIsCreated:", objc_msgSend(v6, "hasAppEntryEngagementEvent:", CFSTR("appEntryCreated")));
  objc_msgSend(v25, "setJournalEntryIsCancelled:", objc_msgSend(v6, "hasAppEntryEngagementEvent:", CFSTR("appEntryCancelled")));
  objc_msgSend(v25, "setJournalEntryIsDeleted:", objc_msgSend(v6, "hasAppEntryEngagementEvent:", CFSTR("appEntryDeleted")));
  LODWORD(v7) = 0;
  objc_msgSend(v25, "setViewCountNormalized:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking viewCountBasedAdjustmentParameterDict](self, "viewCountBasedAdjustmentParameterDict"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minDaysElapsedForAdjustment")));
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking viewCountBasedAdjustmentParameterDict](self, "viewCountBasedAdjustmentParameterDict"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("minViewCountForAdjustment")));
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking viewCountBasedAdjustmentParameterDict](self, "viewCountBasedAdjustmentParameterDict"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("maxViewCountForAdjustment")));
  objc_msgSend(v17, "floatValue");
  v19 = v18;

  if (objc_msgSend(v6, "suggestionEngagementViewCount"))
  {
    if ((objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsSelected")) & 1) == 0
      && (objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsQuickAddEntry")) & 1) == 0
      && (objc_msgSend(v6, "hasSuggestionEngagementEvent:", CFSTR("suggestionsDeleted")) & 1) == 0)
    {
      objc_msgSend(v25, "bundleRecencyDaysElapsed");
      if (v20 > v11)
      {
        v21 = fmax((float)((float)(unint64_t)objc_msgSend(v6, "suggestionEngagementViewCount") - v15), 0.0);
        *(float *)&v21 = v21;
        objc_msgSend(v25, "setViewCountNormalized:", v21);
        objc_msgSend(v25, "viewCountNormalized");
        *(float *)&v23 = v22 / (float)(v19 - v15);
        objc_msgSend(v25, "setViewCountNormalized:", v23);
        objc_msgSend(v25, "viewCountNormalized");
        if (*(float *)&v24 > 1.0)
        {
          LODWORD(v24) = 1.0;
          objc_msgSend(v25, "setViewCountNormalized:", v24);
        }
      }
    }
  }

}

- (MOEventBundleRanking)initWithUniverse:(id)a3
{
  void *v4;
  MOEventBundleRanking *v5;
  id os_log;
  NSObject *v8;
  void *v9;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "getService:", CFSTR("MOConfigurationManager")));
    self = -[MOEventBundleRanking initWithConfigurationManager:](self, "initWithConfigurationManager:", v4);

    v5 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOEventBundleRanking initWithUniverse:].cold.1();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleRanking.m"), 1068, CFSTR("Invalid parameter not satisfying: universe"));

    v5 = 0;
  }

  return v5;
}

- (MOEventBundleRanking)initWithConfigurationManager:(id)a3
{
  id v6;
  MOEventBundleRanking *v7;
  NSString *rankingAlgorithmVersion;
  MOConfigurationManagerBase *configurationManager;
  _UNKNOWN **v10;
  void *v11;
  double v12;
  float v13;
  MOConfigurationManagerBase *v14;
  void *v15;
  double v16;
  float v17;
  id os_log;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  float v27;
  NSMutableDictionary *v28;
  MOConfigurationManagerBase *v29;
  void *v30;
  double v31;
  void *v32;
  MOConfigurationManagerBase *v33;
  void *v34;
  double v35;
  void *v36;
  MOConfigurationManagerBase *v37;
  void *v38;
  double v39;
  void *v40;
  MOConfigurationManagerBase *v41;
  void *v42;
  double v43;
  void *v44;
  MOConfigurationManagerBase *v45;
  void *v46;
  double v47;
  void *v48;
  MOConfigurationManagerBase *v49;
  void *v50;
  double v51;
  void *v52;
  MOConfigurationManagerBase *v53;
  void *v54;
  double v55;
  void *v56;
  MOConfigurationManagerBase *v57;
  void *v58;
  double v59;
  void *v60;
  MOConfigurationManagerBase *v61;
  void *v62;
  double v63;
  void *v64;
  MOConfigurationManagerBase *v65;
  void *v66;
  double v67;
  void *v68;
  MOConfigurationManagerBase *v69;
  void *v70;
  double v71;
  void *v72;
  MOConfigurationManagerBase *v73;
  void *v74;
  double v75;
  void *v76;
  MOConfigurationManagerBase *v77;
  void *v78;
  double v79;
  void *v80;
  MOConfigurationManagerBase *v81;
  void *v82;
  double v83;
  void *v84;
  MOConfigurationManagerBase *v85;
  void *v86;
  double v87;
  void *v88;
  MOConfigurationManagerBase *v89;
  void *v90;
  double v91;
  void *v92;
  MOConfigurationManagerBase *v93;
  void *v94;
  double v95;
  void *v96;
  MOConfigurationManagerBase *v97;
  void *v98;
  double v99;
  void *v100;
  MOConfigurationManagerBase *v101;
  void *v102;
  double v103;
  void *v104;
  MOConfigurationManagerBase *v105;
  void *v106;
  double v107;
  void *v108;
  MOConfigurationManagerBase *v109;
  void *v110;
  double v111;
  void *v112;
  MOConfigurationManagerBase *v113;
  void *v114;
  double v115;
  void *v116;
  MOConfigurationManagerBase *v117;
  void *v118;
  double v119;
  void *v120;
  MOConfigurationManagerBase *v121;
  void *v122;
  double v123;
  void *v124;
  MOConfigurationManagerBase *v125;
  void *v126;
  double v127;
  void *v128;
  MOConfigurationManagerBase *v129;
  void *v130;
  double v131;
  void *v132;
  MOConfigurationManagerBase *v133;
  void *v134;
  double v135;
  void *v136;
  MOConfigurationManagerBase *v137;
  void *v138;
  double v139;
  void *v140;
  MOConfigurationManagerBase *v141;
  void *v142;
  double v143;
  void *v144;
  MOConfigurationManagerBase *v145;
  void *v146;
  double v147;
  void *v148;
  MOConfigurationManagerBase *v149;
  void *v150;
  double v151;
  void *v152;
  MOConfigurationManagerBase *v153;
  void *v154;
  double v155;
  void *v156;
  MOConfigurationManagerBase *v157;
  void *v158;
  double v159;
  void *v160;
  MOConfigurationManagerBase *v161;
  void *v162;
  double v163;
  void *v164;
  MOConfigurationManagerBase *v165;
  void *v166;
  double v167;
  void *v168;
  MOConfigurationManagerBase *v169;
  void *v170;
  double v171;
  void *v172;
  MOConfigurationManagerBase *v173;
  void *v174;
  double v175;
  void *v176;
  MOConfigurationManagerBase *v177;
  void *v178;
  double v179;
  void *v180;
  MOConfigurationManagerBase *v181;
  void *v182;
  double v183;
  void *v184;
  NSMutableDictionary *v185;
  MOConfigurationManagerBase *v186;
  void *v187;
  void *v188;
  MOConfigurationManagerBase *v189;
  void *v190;
  void *v191;
  MOConfigurationManagerBase *v192;
  void *v193;
  void *v194;
  MOConfigurationManagerBase *v195;
  void *v196;
  double v197;
  void *v198;
  MOConfigurationManagerBase *v199;
  void *v200;
  void *v201;
  MOConfigurationManagerBase *v202;
  void *v203;
  double v204;
  void *v205;
  MOConfigurationManagerBase *v206;
  void *v207;
  void *v208;
  MOConfigurationManagerBase *v209;
  void *v210;
  double v211;
  void *v212;
  MOConfigurationManagerBase *v213;
  void *v214;
  double v215;
  void *v216;
  MOConfigurationManagerBase *v217;
  void *v218;
  double v219;
  void *v220;
  MOConfigurationManagerBase *v221;
  void *v222;
  double v223;
  void *v224;
  NSMutableDictionary *v225;
  MOConfigurationManagerBase *v226;
  void *v227;
  double v228;
  void *v229;
  MOConfigurationManagerBase *v230;
  void *v231;
  double v232;
  void *v233;
  MOConfigurationManagerBase *v234;
  void *v235;
  double v236;
  void *v237;
  MOConfigurationManagerBase *v238;
  void *v239;
  double v240;
  void *v241;
  MOConfigurationManagerBase *v242;
  void *v243;
  double v244;
  void *v245;
  MOConfigurationManagerBase *v246;
  void *v247;
  double v248;
  void *v249;
  MOConfigurationManagerBase *v250;
  void *v251;
  double v252;
  void *v253;
  MOConfigurationManagerBase *v254;
  void *v255;
  double v256;
  void *v257;
  MOConfigurationManagerBase *v258;
  void *v259;
  double v260;
  void *v261;
  MOConfigurationManagerBase *v262;
  void *v263;
  double v264;
  void *v265;
  MOConfigurationManagerBase *v266;
  void *v267;
  double v268;
  void *v269;
  MOConfigurationManagerBase *v270;
  void *v271;
  double v272;
  void *v273;
  MOConfigurationManagerBase *v274;
  void *v275;
  double v276;
  void *v277;
  MOConfigurationManagerBase *v278;
  void *v279;
  double v280;
  void *v281;
  MOConfigurationManagerBase *v282;
  void *v283;
  double v284;
  void *v285;
  MOConfigurationManagerBase *v286;
  void *v287;
  double v288;
  void *v289;
  MOConfigurationManagerBase *v290;
  void *v291;
  double v292;
  void *v293;
  MOConfigurationManagerBase *v294;
  void *v295;
  double v296;
  void *v297;
  MOConfigurationManagerBase *v298;
  void *v299;
  double v300;
  void *v301;
  MOConfigurationManagerBase *v302;
  void *v303;
  double v304;
  void *v305;
  MOConfigurationManagerBase *v306;
  void *v307;
  double v308;
  void *v309;
  MOConfigurationManagerBase *v310;
  void *v311;
  double v312;
  void *v313;
  MOConfigurationManagerBase *v314;
  void *v315;
  double v316;
  void *v317;
  MOConfigurationManagerBase *v318;
  void *v319;
  double v320;
  void *v321;
  MOConfigurationManagerBase *v322;
  void *v323;
  double v324;
  void *v325;
  MOConfigurationManagerBase *v326;
  void *v327;
  double v328;
  void *v329;
  MOConfigurationManagerBase *v330;
  void *v331;
  double v332;
  void *v333;
  MOConfigurationManagerBase *v334;
  void *v335;
  double v336;
  void *v337;
  MOConfigurationManagerBase *v338;
  void *v339;
  double v340;
  void *v341;
  NSMutableDictionary *v342;
  MOConfigurationManagerBase *v343;
  void *v344;
  double v345;
  void *v346;
  MOConfigurationManagerBase *v347;
  void *v348;
  void *v349;
  MOConfigurationManagerBase *v350;
  void *v351;
  void *v352;
  MOConfigurationManagerBase *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  uint64_t v358;
  uint64_t v359;
  NSObject *v360;
  void *v361;
  double v362;
  id v363;
  NSObject *v364;
  id v365;
  NSObject *v366;
  void *v367;
  MOEventBundleRanking *v368;
  void *v369;
  float v370;
  id v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  int v378;
  void *v379;
  MOConfigurationManagerBase *v380;
  void *v381;
  double v382;
  void *v383;
  void *v384;
  NSMutableDictionary *v385;
  const __CFString *v386;
  void *v387;
  MOConfigurationManagerBase *v388;
  void *v389;
  double v390;
  void *v391;
  void *v392;
  void *v393;
  MOConfigurationManagerBase *v394;
  void *v395;
  double v396;
  void *v397;
  void *v398;
  void *v399;
  MOConfigurationManagerBase *v400;
  void *v401;
  double v402;
  void *v403;
  void *v404;
  void *v405;
  MOConfigurationManagerBase *v406;
  void *v407;
  double v408;
  void *v409;
  void *v410;
  void *v411;
  MOConfigurationManagerBase *v412;
  void *v413;
  double v414;
  void *v415;
  void *v416;
  void *v417;
  MOConfigurationManagerBase *v418;
  void *v419;
  double v420;
  void *v421;
  void *v422;
  void *v423;
  MOConfigurationManagerBase *v424;
  void *v425;
  double v426;
  void *v427;
  void *v428;
  void *v429;
  MOConfigurationManagerBase *v430;
  void *v431;
  double v432;
  void *v433;
  void *v434;
  void *v435;
  MOConfigurationManagerBase *v436;
  void *v437;
  double v438;
  void *v439;
  void *v440;
  void *v441;
  MOConfigurationManagerBase *v442;
  void *v443;
  double v444;
  void *v445;
  void *v446;
  void *v447;
  MOConfigurationManagerBase *v448;
  void *v449;
  double v450;
  void *v451;
  void *v452;
  void *v453;
  MOConfigurationManagerBase *v454;
  void *v455;
  double v456;
  void *v457;
  void *v458;
  void *v459;
  MOConfigurationManagerBase *v460;
  void *v461;
  double v462;
  void *v463;
  void *v464;
  uint64_t v465;
  NSMutableDictionary *v466;
  id v467;
  id v468;
  uint64_t v469;
  void *i;
  uint64_t v471;
  void *v472;
  void *v473;
  _UNKNOWN **v474;
  void *v475;
  void *v476;
  id v477;
  void *v478;
  NSMutableDictionary *v479;
  _UNKNOWN **v480;
  MOConfigurationManagerBase *v481;
  void *v482;
  void *v483;
  MOConfigurationManagerBase *v484;
  void *v485;
  void *v486;
  MOConfigurationManagerBase *v487;
  void *v488;
  void *v489;
  MOConfigurationManagerBase *v490;
  void *v491;
  void *v492;
  MOConfigurationManagerBase *v493;
  void *v494;
  double v495;
  void *v496;
  MOConfigurationManagerBase *v497;
  void *v498;
  double v499;
  void *v500;
  NSMutableDictionary *v501;
  MOConfigurationManagerBase *v502;
  void *v503;
  double v504;
  void *v505;
  MOConfigurationManagerBase *v506;
  void *v507;
  double v508;
  void *v509;
  MOConfigurationManagerBase *v510;
  void *v511;
  double v512;
  void *v513;
  NSMutableDictionary *v514;
  void *v515;
  uint64_t j;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  void *v522;
  NSDictionary *richnessWeightsDict;
  NSDictionary *engagementScoreParameterDict;
  NSDictionary *staticModelParameterMatrix;
  NSDictionary *dynamicModelParameterDict;
  NSDictionary *v527;
  NSDictionary *heuristicsParameterDict;
  NSDictionary *v529;
  NSDictionary *rankingScoreThresholdDict;
  NSDictionary *viewCountBasedAdjustmentParameterDict;
  NSMutableDictionary *v532;
  NSDictionary *bprRegularizationFactor;
  NSMutableDictionary *v534;
  NSMutableDictionary *pairWiseWeights;
  NSMutableDictionary *v536;
  NSDictionary *evergreenEngagementScoreParameterDict;
  NSMutableDictionary *v538;
  NSDictionary *curationParameterDict;
  NSMutableDictionary *v540;
  void *v542;
  NSMutableDictionary *v543;
  NSMutableDictionary *v544;
  NSMutableDictionary *v545;
  id v546;
  NSMutableDictionary *v547;
  NSMutableDictionary *v548;
  NSMutableDictionary *v549;
  NSMutableDictionary *v550;
  NSMutableDictionary *v551;
  NSMutableDictionary *v552;
  NSMutableDictionary *v553;
  MOEventBundleRanking *v554;
  NSMutableDictionary *v555;
  NSMutableDictionary *v556;
  unsigned int v557;
  void *v558;
  void **p_configurationManager;
  NSMutableDictionary *v560;
  NSMutableDictionary *v561;
  id v562;
  NSMutableDictionary *obj;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  objc_super v568;
  _BYTE v569[128];

  v6 = a3;
  if (v6)
  {
    v568.receiver = self;
    v568.super_class = (Class)MOEventBundleRanking;
    v7 = -[MOEventBundleRanking init](&v568, "init");
    if (v7)
    {
      v546 = v6;
      +[MOEventBundleRanking defineClassCollections](MOEventBundleRanking, "defineClassCollections");
      rankingAlgorithmVersion = v7->_rankingAlgorithmVersion;
      v7->_rankingAlgorithmVersion = (NSString *)CFSTR("17.2.0");

      p_configurationManager = (void **)&v7->_configurationManager;
      objc_storeStrong((id *)&v7->_configurationManager, a3);
      v7->_isInternalBuild = +[MOPlatformInfo isInternalBuild](MOPlatformInfo, "isInternalBuild");
      configurationManager = v7->_configurationManager;
      v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("diversityCoefficientAlpha")));
      LODWORD(v12) = 1120403456;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](configurationManager, "getFloatSettingForKey:withFallback:", v11, v12);
      v7->_frequencyPenalty = v13;

      v14 = v7->_configurationManager;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("engagementScoreWeight")));
      LODWORD(v16) = 1036831949;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v14, "getFloatSettingForKey:withFallback:", v15, v16);
      v7->_engagementScoreWeight = v17;

      os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v19 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[MOEventBundleRanking initWithConfigurationManager:].cold.4((uint64_t)&v7->_engagementScoreWeight, v19, v20, v21, v22, v23, v24, v25);

      HIDWORD(v26) = 1072483532;
      *(float *)&v26 = 0.9;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_RecommendedTabVisitFIThreshold"), v26);
      v7->_recommendedTabVisitFIThreshold = v27;
      v28 = objc_opt_new(NSMutableDictionary);
      v29 = v7->_configurationManager;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("distanceToHomeThreshold")));
      LODWORD(v31) = 10.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v29, "getFloatSettingForKey:withFallback:", v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v32, CFSTR("distanceToHomeThreshold"));

      v33 = v7->_configurationManager;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("callDurationThreshold")));
      LODWORD(v35) = 1172373504;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v33, "getFloatSettingForKey:withFallback:", v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v36, CFSTR("callDurationThreshold"));

      v37 = v7->_configurationManager;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("workoutDurationThreshold")));
      LODWORD(v39) = 1180762112;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v37, "getFloatSettingForKey:withFallback:", v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v40, CFSTR("workoutDurationThreshold"));

      v41 = v7->_configurationManager;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("WeeklySummaryWorkoutDurationThreshold")));
      LODWORD(v43) = 1187307520;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v41, "getFloatSettingForKey:withFallback:", v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v44, CFSTR("WeeklySummaryWorkoutDurationThreshold"));

      v45 = v7->_configurationManager;
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("timeAtHomeDurationThreshold")));
      LODWORD(v47) = 1202241536;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v45, "getFloatSettingForKey:withFallback:", v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v48, CFSTR("timeAtHomeDurationThreshold"));

      v49 = v7->_configurationManager;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("FIDownRankThreshold")));
      LODWORD(v51) = 0.75;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v49, "getFloatSettingForKey:withFallback:", v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v52, CFSTR("FIDownRankThreshold"));

      v53 = v7->_configurationManager;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("burstyInteractionCountThreshold")));
      LODWORD(v55) = 1125515264;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v53, "getFloatSettingForKey:withFallback:", v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v56, CFSTR("burstyInteractionCountThreshold"));

      v57 = v7->_configurationManager;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("maxPeopleCountFromSocialContext")));
      LODWORD(v59) = 1115684864;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v57, "getFloatSettingForKey:withFallback:", v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v60, CFSTR("maxPeopleCountFromSocialContext"));

      v61 = v7->_configurationManager;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("mediaPlayTimeThreshold")));
      LODWORD(v63) = 1177075712;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v61, "getFloatSettingForKey:withFallback:", v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v64, CFSTR("mediaPlayTimeThreshold"));

      v65 = v7->_configurationManager;
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weeklySummaryMediaPlayTimeThreshold")));
      LODWORD(v67) = 1187307520;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v65, "getFloatSettingForKey:withFallback:", v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v68, CFSTR("weeklySummaryMediaPlayTimeThreshold"));

      v69 = v7->_configurationManager;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("shareCountThreshold")));
      LODWORD(v71) = 5.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v69, "getFloatSettingForKey:withFallback:", v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v72, CFSTR("shareCountThreshold"));

      v73 = v7->_configurationManager;
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("contactHoldOffThreshold")));
      LODWORD(v75) = -921458688;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v73, "getFloatSettingForKey:withFallback:", v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v76, CFSTR("contactHoldOffThreshold"));

      v77 = v7->_configurationManager;
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("stateOfMindLabelCountThreshold")));
      LODWORD(v79) = 5.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v77, "getFloatSettingForKey:withFallback:", v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v80, CFSTR("stateOfMindLabelCountThreshold"));

      v81 = v7->_configurationManager;
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("stateOfMindDomainCountThreshold")));
      LODWORD(v83) = 5.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v81, "getFloatSettingForKey:withFallback:", v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v84, CFSTR("stateOfMindDomainCountThreshold"));

      v85 = v7->_configurationManager;
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionAcceptThresholdForVisitSubTypeVariants")));
      LODWORD(v87) = -1130113270;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v85, "getFloatSettingForKey:withFallback:", v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v88, CFSTR("suggestionAcceptThresholdForVisitSubTypeVariants"));

      v89 = v7->_configurationManager;
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionAcceptThresholdForTripSubType")));
      LODWORD(v91) = -1130113270;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v89, "getFloatSettingForKey:withFallback:", v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v92, CFSTR("suggestionAcceptThresholdForTripSubType"));

      v93 = v7->_configurationManager;
      v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionAcceptThresholdForWorkoutSubtype")));
      LODWORD(v95) = -1130113270;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v93, "getFloatSettingForKey:withFallback:", v94, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v96, CFSTR("suggestionAcceptThresholdForWorkoutSubtype"));

      v97 = v7->_configurationManager;
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionAcceptThresholdForMotionActivityWalkingSubtype")));
      LODWORD(v99) = -1130113270;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v97, "getFloatSettingForKey:withFallback:", v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v100, CFSTR("suggestionAcceptThresholdForMotionActivityWalkingSubtype"));

      v101 = v7->_configurationManager;
      v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionAcceptThresholdForWorkoutWeeklySummarySubType")));
      LODWORD(v103) = -1.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v101, "getFloatSettingForKey:withFallback:", v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v104, CFSTR("suggestionAcceptThresholdForWorkoutWeeklySummarySubType"));

      v105 = v7->_configurationManager;
      v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionAcceptThresholdForContactSubType")));
      LODWORD(v107) = -1.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v105, "getFloatSettingForKey:withFallback:", v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v108, CFSTR("suggestionAcceptThresholdForContactSubType"));

      v109 = v7->_configurationManager;
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionAcceptThresholdForContactWeeklySummarySubType")));
      LODWORD(v111) = 1023671095;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v109, "getFloatSettingForKey:withFallback:", v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v112, CFSTR("suggestionAcceptThresholdForContactWeeklySummarySubType"));

      v113 = v7->_configurationManager;
      v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionAcceptThresholdForDailyMediaVariants")));
      LODWORD(v115) = -1.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v113, "getFloatSettingForKey:withFallback:", v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v116, CFSTR("suggestionAcceptThresholdForDailyMediaVariants"));

      v117 = v7->_configurationManager;
      v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionAcceptThresholdForWeeklyMediaSummaryVariants")));
      LODWORD(v119) = -1.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v117, "getFloatSettingForKey:withFallback:", v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v120, CFSTR("suggestionAcceptThresholdForWeeklyMediaSummaryVariants"));

      v121 = v7->_configurationManager;
      v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionAcceptThresholdForTimeAtHomeSubTypeVariants")));
      LODWORD(v123) = -1.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v121, "getFloatSettingForKey:withFallback:", v122, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v124, CFSTR("suggestionAcceptThresholdForTimeAtHomeSubTypeVariants"));

      v125 = v7->_configurationManager;
      v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionRecommendThresholdForVisitSubTypeVariants")));
      LODWORD(v127) = 1017370378;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v125, "getFloatSettingForKey:withFallback:", v126, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v128, CFSTR("suggestionRecommendThresholdForVisitSubTypeVariants"));

      v129 = v7->_configurationManager;
      v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionRecommendThresholdForTripSubType")));
      LODWORD(v131) = 1017370378;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v129, "getFloatSettingForKey:withFallback:", v130, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v132, CFSTR("suggestionRecommendThresholdForTripSubType"));

      v133 = v7->_configurationManager;
      v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionRecommendThresholdForWorkoutSubtype")));
      LODWORD(v135) = 1025758986;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v133, "getFloatSettingForKey:withFallback:", v134, v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v136, CFSTR("suggestionRecommendThresholdForWorkoutSubtype"));

      v137 = v7->_configurationManager;
      v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionRecommendThresholdForMotionActivityWalkingSubtype")));
      LODWORD(v139) = 1017370378;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v137, "getFloatSettingForKey:withFallback:", v138, v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v140, CFSTR("suggestionRecommendThresholdForMotionActivityWalkingSubtype"));

      v141 = v7->_configurationManager;
      v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionRecommendThresholdForWorkoutWeeklySummarySubType")));
      LODWORD(v143) = 1025758986;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v141, "getFloatSettingForKey:withFallback:", v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v144, CFSTR("suggestionRecommendThresholdForWorkoutWeeklySummarySubType"));

      v145 = v7->_configurationManager;
      v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionRecommendThresholdForContactSubType")));
      LODWORD(v147) = 1028443341;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v145, "getFloatSettingForKey:withFallback:", v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v148, CFSTR("suggestionRecommendThresholdForContactSubType"));

      v149 = v7->_configurationManager;
      v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionRecommendThresholdForContactWeeklySummarySubType")));
      LODWORD(v151) = 1023671095;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v149, "getFloatSettingForKey:withFallback:", v150, v151);
      v152 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v152, CFSTR("suggestionRecommendThresholdForContactWeeklySummarySubType"));

      v153 = v7->_configurationManager;
      v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionRecommendThresholdForDailyMediaVariants")));
      LODWORD(v155) = -1.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v153, "getFloatSettingForKey:withFallback:", v154, v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v156, CFSTR("suggestionRecommendThresholdForDailyMediaVariants"));

      v157 = v7->_configurationManager;
      v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionRecommendThresholdForWeeklyMediaSummaryVariants")));
      LODWORD(v159) = -1.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v157, "getFloatSettingForKey:withFallback:", v158, v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v160, CFSTR("suggestionRecommendThresholdForWeeklyMediaSummaryVariants"));

      v161 = v7->_configurationManager;
      v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("suggestionRecommendThresholdForTimeAtHomeSubTypeVariants")));
      LODWORD(v163) = 1025758986;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v161, "getFloatSettingForKey:withFallback:", v162, v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v164, CFSTR("suggestionRecommendThresholdForTimeAtHomeSubTypeVariants"));

      v165 = v7->_configurationManager;
      v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("summarizationThresholdForVisitSubTypeVariants")));
      LODWORD(v167) = -1130113270;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v165, "getFloatSettingForKey:withFallback:", v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v168, CFSTR("summarizationThresholdForVisitSubTypeVariants"));

      v169 = v7->_configurationManager;
      v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("summarizationThresholdForWorkoutSubType")));
      LODWORD(v171) = -1130113270;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v169, "getFloatSettingForKey:withFallback:", v170, v171);
      v172 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v172, CFSTR("summarizationThresholdForWorkoutSubType"));

      v173 = v7->_configurationManager;
      v174 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("summarizationThresholdForMotionActivityWalkingSubType")));
      LODWORD(v175) = -1130113270;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v173, "getFloatSettingForKey:withFallback:", v174, v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v176, CFSTR("summarizationThresholdForMotionActivityWalkingSubType"));

      v177 = v7->_configurationManager;
      v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("tripSummarizationThresholdForVisitSubType")));
      LODWORD(v179) = 1025758986;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v177, "getFloatSettingForKey:withFallback:", v178, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v180, CFSTR("tripSummarizationThresholdForVisitSubType"));

      v181 = v7->_configurationManager;
      v182 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("tripSummarizationThresholdForWorkoutSubType")));
      LODWORD(v183) = -1130113270;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v181, "getFloatSettingForKey:withFallback:", v182, v183);
      v184 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      v545 = v28;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v184, CFSTR("tripSummarizationThresholdForWorkoutSubType"));

      v185 = objc_opt_new(NSMutableDictionary);
      v186 = v7->_configurationManager;
      v187 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("rejectWorkVisitWithPhotos")));
      v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](v186, "getBoolSettingForKey:withFallback:", v187, 0)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v188, CFSTR("rejectWorkVisitWithPhotos"));

      v189 = v7->_configurationManager;
      v190 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("rejectWorkVisitWithNoPhoto")));
      v191 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](v189, "getBoolSettingForKey:withFallback:", v190, 1)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v191, CFSTR("rejectWorkVisitWithNoPhoto"));

      v192 = v7->_configurationManager;
      v193 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("rejectShortVisit")));
      v194 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](v192, "getBoolSettingForKey:withFallback:", v193, 0)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v194, CFSTR("rejectShortVisit"));

      v195 = v7->_configurationManager;
      v196 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("shortVisitDurationThresholdInSec")));
      LODWORD(v197) = 1150681088;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v195, "getFloatSettingForKey:withFallback:", v196, v197);
      v198 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v198, CFSTR("shortVisitDurationThresholdInSec"));

      v199 = v7->_configurationManager;
      v200 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("rejectSignificantContactWithHighSignificanceScore")));
      v201 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](v199, "getBoolSettingForKey:withFallback:", v200, 0)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v201, CFSTR("rejectSignificantContactWithHighSignificanceScore"));

      v202 = v7->_configurationManager;
      v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("highContactSignificanceScoreThreshold")));
      LODWORD(v204) = 1064514355;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v202, "getFloatSettingForKey:withFallback:", v203, v204);
      v205 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v205, CFSTR("highContactSignificanceScoreThreshold"));

      v206 = v7->_configurationManager;
      v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("minSensedBundleCountInRecommendedTab")));
      v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v206, "getIntegerSettingForKey:withFallback:", v207, 10)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v208, CFSTR("minSensedBundleCountInRecommendedTab"));

      v209 = v7->_configurationManager;
      v210 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("maxDaysInRecommendedTabForWorkoutRoutine")));
      LODWORD(v211) = 7.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v209, "getFloatSettingForKey:withFallback:", v210, v211);
      v212 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v212, CFSTR("maxDaysInRecommendedTabForWorkoutRoutine"));

      v213 = v7->_configurationManager;
      v214 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("maxDaysInRecommendedTabForContact")));
      LODWORD(v215) = 3.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v213, "getFloatSettingForKey:withFallback:", v214, v215);
      v216 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v216, CFSTR("maxDaysInRecommendedTabForContact"));

      v217 = v7->_configurationManager;
      v218 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("maxDaysInRecommendedTabForStateOfMind")));
      LODWORD(v219) = 2.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v217, "getFloatSettingForKey:withFallback:", v218, v219);
      v220 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v220, CFSTR("maxDaysInRecommendedTabForStateOfMind"));

      v221 = v7->_configurationManager;
      v222 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("daysToSuppressCoarseSummaryAfterOnboarding")));
      LODWORD(v223) = 7.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v221, "getFloatSettingForKey:withFallback:", v222, v223);
      v224 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      v547 = v185;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v185, "setObject:forKeyedSubscript:", v224, CFSTR("daysToSuppressCoarseSummaryAfterOnboarding"));

      v225 = objc_opt_new(NSMutableDictionary);
      v226 = v7->_configurationManager;
      v227 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForInterestingPOI")));
      LODWORD(v228) = 1024148374;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v226, "getFloatSettingForKey:withFallback:", v227, v228);
      v229 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v229, CFSTR("weightForInterestingPOI"));

      v230 = v7->_configurationManager;
      v231 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForDistanceFromHome")));
      LODWORD(v232) = 1024953680;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v230, "getFloatSettingForKey:withFallback:", v231, v232);
      v233 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v233, CFSTR("weightForDistanceFromHome"));

      v234 = v7->_configurationManager;
      v235 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForCallDuration")));
      LODWORD(v236) = 1041865114;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v234, "getFloatSettingForKey:withFallback:", v235, v236);
      v237 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v237, CFSTR("weightForCallDuration"));

      v238 = v7->_configurationManager;
      v239 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForBurstyInteractionCount")));
      LODWORD(v240) = 1028443341;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v238, "getFloatSettingForKey:withFallback:", v239, v240);
      v241 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v241, CFSTR("weightForBurstyInteractionCount"));

      v242 = v7->_configurationManager;
      v243 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForMultipleInteractionTypes")));
      LODWORD(v244) = 0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v242, "getFloatSettingForKey:withFallback:", v243, v244);
      v245 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v245, CFSTR("weightForMultipleInteractionTypes"));

      v246 = v7->_configurationManager;
      v247 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForContactLocationWork")));
      LODWORD(v248) = 0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v246, "getFloatSettingForKey:withFallback:", v247, v248);
      v249 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v249, CFSTR("weightForContactLocationWork"));

      v250 = v7->_configurationManager;
      v251 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForGroupConversation")));
      LODWORD(v252) = 0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v250, "getFloatSettingForKey:withFallback:", v251, v252);
      v253 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v253, CFSTR("weightForGroupConversation"));

      v254 = v7->_configurationManager;
      v255 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForPCountMax")));
      LODWORD(v256) = 0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254, "getFloatSettingForKey:withFallback:", v255, v256);
      v257 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v257, CFSTR("weightForPCountMax"));

      v258 = v7->_configurationManager;
      v259 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForPCountWeightedAverage")));
      LODWORD(v260) = 1008981770;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v258, "getFloatSettingForKey:withFallback:", v259, v260);
      v261 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v261, CFSTR("weightForPCountWeightedAverage"));

      v262 = v7->_configurationManager;
      v263 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForPDensityWeightedAverage")));
      LODWORD(v264) = 1008981770;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v262, "getFloatSettingForKey:withFallback:", v263, v264);
      v265 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v265, CFSTR("weightForPDensityWeightedAverage"));

      v266 = v7->_configurationManager;
      v267 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForPCountWeightedSum")));
      LODWORD(v268) = 0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v266, "getFloatSettingForKey:withFallback:", v267, v268);
      v269 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v269, CFSTR("weightForPCountWeightedSum"));

      v270 = v7->_configurationManager;
      v271 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForItemFromMe")));
      LODWORD(v272) = 1017370378;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v270, "getFloatSettingForKey:withFallback:", v271, v272);
      v273 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v273, CFSTR("weightForItemFromMe"));

      v274 = v7->_configurationManager;
      v275 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightShareCountFeature")));
      LODWORD(v276) = 1017370378;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v274, "getFloatSettingForKey:withFallback:", v275, v276);
      v277 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v277, CFSTR("weightShareCountFeature"));

      v278 = v7->_configurationManager;
      v279 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForTimeAtHomeDuration")));
      LODWORD(v280) = 0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v278, "getFloatSettingForKey:withFallback:", v279, v280);
      v281 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v281, CFSTR("weightForTimeAtHomeDuration"));

      v282 = v7->_configurationManager;
      v283 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForWorkoutDurationNormalized")));
      LODWORD(v284) = 1050924810;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v282, "getFloatSettingForKey:withFallback:", v283, v284);
      v285 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v285, CFSTR("weightForWorkoutDurationNormalized"));

      v286 = v7->_configurationManager;
      v287 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForFamiliarityIndex")));
      LODWORD(v288) = 1030322389;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v286, "getFloatSettingForKey:withFallback:", v287, v288);
      v289 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v289, CFSTR("weightForFamiliarityIndex"));

      v290 = v7->_configurationManager;
      v291 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForIsFamilyContact")));
      LODWORD(v292) = 1008981770;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v290, "getFloatSettingForKey:withFallback:", v291, v292);
      v293 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v293, CFSTR("weightForIsFamilyContact"));

      v294 = v7->_configurationManager;
      v295 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForIsCoworkerContact")));
      LODWORD(v296) = -1130113270;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v294, "getFloatSettingForKey:withFallback:", v295, v296);
      v297 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v297, CFSTR("weightForIsCoworkerContact"));

      v298 = v7->_configurationManager;
      v299 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForMediaPlayTime")));
      LODWORD(v300) = 1026206379;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v298, "getFloatSettingForKey:withFallback:", v299, v300);
      v301 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v301, CFSTR("weightForMediaPlayTime"));

      v302 = v7->_configurationManager;
      v303 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("maxBundleGoodnessScorePhotoMemory")));
      LODWORD(v304) = 1028443341;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v302, "getFloatSettingForKey:withFallback:", v303, v304);
      v305 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v305, CFSTR("maxBundleGoodnessScorePhotoMemory"));

      v306 = v7->_configurationManager;
      v307 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("bundleGoodnessScoreIncrementPhotoMemory")));
      LODWORD(v308) = 1017370378;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v306, "getFloatSettingForKey:withFallback:", v307, v308);
      v309 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v309, CFSTR("bundleGoodnessScoreIncrementPhotoMemory"));

      v310 = v7->_configurationManager;
      v311 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightStateOfMindLabelCountNormalized")));
      LODWORD(v312) = 1028443341;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v310, "getFloatSettingForKey:withFallback:", v311, v312);
      v313 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v313, CFSTR("weightStateOfMindLabelCountNormalized"));

      v314 = v7->_configurationManager;
      v315 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightStateOfMindDomainCountNormalized")));
      LODWORD(v316) = 1028443341;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v314, "getFloatSettingForKey:withFallback:", v315, v316);
      v317 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v317, CFSTR("weightStateOfMindDomainCountNormalized"));

      v318 = v7->_configurationManager;
      v319 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForNumFamilyNormalized")));
      LODWORD(v320) = 1022739087;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v318, "getFloatSettingForKey:withFallback:", v319, v320);
      v321 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v321, CFSTR("weightForNumFamilyNormalized"));

      v322 = v7->_configurationManager;
      v323 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForNumFriendsNormalized")));
      LODWORD(v324) = 1022739087;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v322, "getFloatSettingForKey:withFallback:", v323, v324);
      v325 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v325, CFSTR("weightForNumFidsNormalized"));

      v326 = v7->_configurationManager;
      v327 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForNumFriendsNormalized")));
      LODWORD(v328) = 1017370378;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v326, "getFloatSettingForKey:withFallback:", v327, v328);
      v329 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v329, CFSTR("weightForNumFriendsNormalized"));

      v330 = v7->_configurationManager;
      v331 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForNumPetsNormalized")));
      LODWORD(v332) = 1017370378;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v330, "getFloatSettingForKey:withFallback:", v331, v332);
      v333 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v333, CFSTR("weightForNumPetsNormalized"));

      v334 = v7->_configurationManager;
      v335 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForNumCoworkersNormalized")));
      LODWORD(v336) = 1014350479;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v334, "getFloatSettingForKey:withFallback:", v335, v336);
      v337 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v337, CFSTR("weightForNumCoworkersNormalized"));

      v338 = v7->_configurationManager;
      v339 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForNumOtherPersonsNormalized")));
      LODWORD(v340) = 1008981770;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v338, "getFloatSettingForKey:withFallback:", v339, v340);
      v341 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      v544 = v225;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v341, CFSTR("weightForNumOtherPersonsNormalized"));

      v342 = objc_opt_new(NSMutableDictionary);
      v343 = v7->_configurationManager;
      v344 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("weightForViewCountBasedPenalty")));
      LODWORD(v345) = 0.125;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v343, "getFloatSettingForKey:withFallback:", v344, v345);
      v346 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v342, "setObject:forKeyedSubscript:", v346, CFSTR("weightForViewCountBasedPenalty"));

      v347 = v7->_configurationManager;
      v348 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("minViewCountForAdjustment")));
      v349 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v347, "getIntegerSettingForKey:withFallback:", v348, 2)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v342, "setObject:forKeyedSubscript:", v349, CFSTR("minViewCountForAdjustment"));

      v350 = v7->_configurationManager;
      v351 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("maxViewCountForAdjustment")));
      v352 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v350, "getIntegerSettingForKey:withFallback:", v351, 12)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v342, "setObject:forKeyedSubscript:", v352, CFSTR("maxViewCountForAdjustment"));

      v353 = v7->_configurationManager;
      v354 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("minDaysElapsedForAdjustment")));
      v355 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v353, "getIntegerSettingForKey:withFallback:", v354, 2)));
      v543 = v342;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v342, "setObject:forKeyedSubscript:", v355, CFSTR("minDaysElapsedForAdjustment"));

      v356 = (void *)objc_claimAutoreleasedReturnValue(-[MOConfigurationManagerBase fDefaultsManager](v7->_configurationManager, "fDefaultsManager"));
      v357 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v356, "objectForKey:", CFSTR("OnboardingDate")));

      v542 = v357;
      if (v357 && (v359 = objc_opt_class(NSDate, v358), (objc_opt_isKindOfClass(v357, v359) & 1) != 0))
      {
        v360 = v357;
        v361 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v361, "timeIntervalSinceDate:", v360);
        *(float *)&v362 = v362 / 86400.0;
        v7->_elapsedDaysSinceOnboardingDate = *(float *)&v362;

        v363 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v364 = objc_claimAutoreleasedReturnValue(v363);
        if (os_log_type_enabled(v364, OS_LOG_TYPE_DEBUG))
          -[MOEventBundleRanking initWithConfigurationManager:].cold.3((uint64_t)v360, &v7->_elapsedDaysSinceOnboardingDate, v364);

      }
      else
      {
        v369 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v547, "objectForKeyedSubscript:", CFSTR("daysToSuppressCoarseSummaryAfterOnboarding")));
        objc_msgSend(v369, "floatValue");
        v7->_elapsedDaysSinceOnboardingDate = v370 + 1.0;

        v371 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v360 = objc_claimAutoreleasedReturnValue(v371);
        if (os_log_type_enabled(v360, OS_LOG_TYPE_DEBUG))
          -[MOEventBundleRanking initWithConfigurationManager:].cold.2((uint64_t)&v7->_elapsedDaysSinceOnboardingDate, v360, v372, v373, v374, v375, v376, v377);
      }

      v555 = objc_opt_new(NSMutableDictionary);
      v551 = objc_opt_new(NSMutableDictionary);
      obj = objc_opt_new(NSMutableDictionary);
      v562 = objc_alloc_init((Class)NSString);
      v553 = objc_opt_new(NSMutableDictionary);
      v550 = objc_opt_new(NSMutableDictionary);
      v378 = 1;
      v554 = v7;
      do
      {
        v557 = v378;
        switch(v378)
        {
          case 1:
            v379 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v379);

            v380 = v7->_configurationManager;
            v381 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_ActivityInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v382) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v380, "getFloatSettingForKey:withFallback:", v381, v382);
            v383 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v384 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v383, v384);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD48, CFSTR("weightForNumRoutineEventsNormalized"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD58, CFSTR("richnessScoreScalingParameter"));
            v386 = CFSTR("%@_ActivityInterfaceType");
            goto LABEL_31;
          case 2:
            v387 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v387);

            v388 = v7->_configurationManager;
            v389 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_OutingInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v390) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v388, "getFloatSettingForKey:withFallback:", v389, v390);
            v391 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v392 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v391, v392);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD58, CFSTR("weightForNumAnamolyEventsNormalized"));
            v386 = CFSTR("%@_OutingInterfaceType");
            goto LABEL_31;
          case 3:
            v393 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v393);

            v394 = v7->_configurationManager;
            v395 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_PhotoMomentInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v396) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v394, "getFloatSettingForKey:withFallback:", v395, v396);
            v397 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v398 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v397, v398);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            v386 = CFSTR("%@_PhotoMomentInterfaceType");
            goto LABEL_31;
          case 4:
            v399 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v399);

            v400 = v7->_configurationManager;
            v401 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_SignificantContactInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v402) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v400, "getFloatSettingForKey:withFallback:", v401, v402);
            v403 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v404 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v403, v404);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD68, CFSTR("weightForNumAnamolyEventsNormalized"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD68, CFSTR("weightForNumTrendEventsNormalized"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD78, CFSTR("richnessScoreScalingParameter"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD88, CFSTR("bundleScoreConstant"));
            v386 = CFSTR("%@_SignificantContactInterfaceType");
            goto LABEL_31;
          case 5:
            v405 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v405);

            v406 = v7->_configurationManager;
            v407 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_YourMediaInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v408) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v406, "getFloatSettingForKey:withFallback:", v407, v408);
            v409 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v410 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v409, v410);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            v386 = CFSTR("%@_YourMediaInterfaceType");
            goto LABEL_31;
          case 6:
            v411 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v411);

            v412 = v7->_configurationManager;
            v413 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_YourSharedContentInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v414) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v412, "getFloatSettingForKey:withFallback:", v413, v414);
            v415 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v416 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v415, v416);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD98, CFSTR("bundleScoreConstant"));
            v386 = CFSTR("%@_YourSharedContentInterfaceType");
            goto LABEL_31;
          case 7:
            v417 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v417);

            v418 = v7->_configurationManager;
            v419 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_YourTimeAtHomeInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v420) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v418, "getFloatSettingForKey:withFallback:", v419, v420);
            v421 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v422 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v421, v422);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCDA8, CFSTR("bundleScoreConstant"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCDB8, CFSTR("bundleScoreScalingParameter"));
            v386 = CFSTR("%@_YourTimeAtHomeInterfaceType");
            goto LABEL_31;
          case 8:
            v423 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v423);

            v424 = v7->_configurationManager;
            v425 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_TopicsOfInterestInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v426) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v424, "getFloatSettingForKey:withFallback:", v425, v426);
            v427 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v428 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v427, v428);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            v386 = CFSTR("%@_TopicsOfInterestInterfaceType");
            goto LABEL_31;
          case 9:
            v429 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v429);

            v430 = v7->_configurationManager;
            v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_TrendInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v432) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v430, "getFloatSettingForKey:withFallback:", v431, v432);
            v433 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v434 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v433, v434);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            v386 = CFSTR("%@_TrendInterfaceType");
            goto LABEL_31;
          case 10:
            v435 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v435);

            v436 = v7->_configurationManager;
            v437 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_PhotoMemoryInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v438) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v436, "getFloatSettingForKey:withFallback:", v437, v438);
            v439 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v440 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v439, v440);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCDC8, CFSTR("decayRate"));
            v386 = CFSTR("%@_PhotoMemoryInterfaceType");
            goto LABEL_31;
          case 11:
            v441 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 11));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v441);

            v442 = v7->_configurationManager;
            v443 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_EvergreenInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v444) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v442, "getFloatSettingForKey:withFallback:", v443, v444);
            v445 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v446 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 11));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v445, v446);

            -[NSMutableDictionary setObject:forKeyedSubscript:](v550, "setObject:forKeyedSubscript:", &off_1002DCD38, CFSTR("WISDOM"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v550, "setObject:forKeyedSubscript:", &off_1002DCD38, CFSTR("GRATITUDE"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v550, "setObject:forKeyedSubscript:", &off_1002DCD38, CFSTR("KINDNESS"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v550, "setObject:forKeyedSubscript:", &off_1002DCD38, CFSTR("PURPOSE"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v550, "setObject:forKeyedSubscript:", &off_1002DCD38, CFSTR("RESILIENCE"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v550, "setObject:forKeyedSubscript:", &off_1002DCD38, CFSTR("CREATIVITY"));
            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));

            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD38, CFSTR("decayRate"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD38, CFSTR("weightForLabelQualityScore"));
            v386 = CFSTR("%@_EvergreenInterfaceType");
            goto LABEL_31;
          case 12:
            v447 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 12));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v447);

            v448 = v7->_configurationManager;
            v449 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_TimeContextInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v450) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v448, "getFloatSettingForKey:withFallback:", v449, v450);
            v451 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v452 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 12));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v451, v452);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD48, CFSTR("weightForNumRoutineEventsNormalized"));
            v386 = CFSTR("%@_TimeContextInterfaceType");
            goto LABEL_31;
          case 13:
            v453 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 13));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v453);

            v454 = v7->_configurationManager;
            v455 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_TripInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v456) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v454, "getFloatSettingForKey:withFallback:", v455, v456);
            v457 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v458 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 13));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v457, v458);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            v386 = CFSTR("%@_TripInterfaceType");
            goto LABEL_31;
          case 14:
            v459 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 14));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v551, "setObject:forKeyedSubscript:", &off_1002DCD38, v459);

            v460 = v7->_configurationManager;
            v461 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_StateOfMindInterfaceType_%@"), CFSTR("rankingParams"), CFSTR("BPRRegularizationWeight")));
            LODWORD(v462) = 1120403456;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v460, "getFloatSettingForKey:withFallback:", v461, v462);
            v463 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            v464 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 14));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v553, "setObject:forKeyedSubscript:", v463, v464);

            v385 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultFallbackFactorDict](v7, "_getDefaultFallbackFactorDict"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCD78, CFSTR("bundleScoreConstant"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v385, "setObject:forKeyedSubscript:", &off_1002DCDD8, CFSTR("decayRate"));
            v386 = CFSTR("%@_StateOfMindInterfaceType");
LABEL_31:
            obj = v385;
            v465 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", v386, CFSTR("rankingParams")));

            v562 = (id)v465;
            break;
          default:
            break;
        }
        v466 = objc_opt_new(NSMutableDictionary);
        v564 = 0u;
        v565 = 0u;
        v566 = 0u;
        v567 = 0u;
        obj = obj;
        v467 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v564, v569, 16);
        if (v467)
        {
          v468 = v467;
          v469 = *(_QWORD *)v565;
          do
          {
            for (i = 0; i != v468; i = (char *)i + 1)
            {
              if (*(_QWORD *)v565 != v469)
                objc_enumerationMutation(obj);
              v471 = *(_QWORD *)(*((_QWORD *)&v564 + 1) + 8 * (_QWORD)i);
              v472 = *p_configurationManager;
              v473 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[329], "stringWithFormat:", CFSTR("%@_%@"), v562, v471));
              v474 = v10;
              v475 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v471));
              objc_msgSend(v475, "floatValue");
              objc_msgSend(v472, "getFloatSettingForKey:withFallback:", v473);
              v476 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v466, "setObject:forKeyedSubscript:", v476, v471);

              v10 = v474;
            }
            v468 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v564, v569, 16);
          }
          while (v468);
        }

        v477 = -[NSMutableDictionary copy](v466, "copy");
        v478 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v557));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v555, "setObject:forKeyedSubscript:", v477, v478);

        v378 = v557 + 1;
        v7 = v554;
      }
      while (v557 != 15);
      v479 = objc_opt_new(NSMutableDictionary);
      v480 = v10;
      v481 = v554->_configurationManager;
      v482 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480[329], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("minEngagementCount")));
      v483 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v481, "getIntegerSettingForKey:withFallback:", v482, 5)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v479, "setObject:forKeyedSubscript:", v483, CFSTR("minEngagementCount"));

      v484 = v554->_configurationManager;
      v485 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480[329], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("minInterfaceTypes")));
      v486 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v484, "getIntegerSettingForKey:withFallback:", v485, 2)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v479, "setObject:forKeyedSubscript:", v486, CFSTR("minInterfaceTypes"));

      v487 = v554->_configurationManager;
      v488 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480[329], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("minTimeIntervalForUpdateSec")));
      v489 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v487, "getIntegerSettingForKey:withFallback:", v488, 259200)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v479, "setObject:forKeyedSubscript:", v489, CFSTR("minTimeIntervalForUpdateSec"));

      v490 = v554->_configurationManager;
      v491 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480[329], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("longTimePeriodSinceEngagementScoreParamsUpdatedSec")));
      v492 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v490, "getIntegerSettingForKey:withFallback:", v491, 2419200)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v479, "setObject:forKeyedSubscript:", v492, CFSTR("longTimePeriodSinceEngagementScoreParamsUpdatedSec"));

      v493 = v554->_configurationManager;
      v494 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480[329], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("lowerBoundOfEngagementScoreParams")));
      LODWORD(v495) = -1.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v493, "getFloatSettingForKey:withFallback:", v494, v495);
      v496 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v479, "setObject:forKeyedSubscript:", v496, CFSTR("lowerBoundOfEngagementScoreParams"));

      v497 = v554->_configurationManager;
      v498 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480[329], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("upperBoundOfEngagementScoreParams")));
      LODWORD(v499) = 1.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v497, "getFloatSettingForKey:withFallback:", v498, v499);
      v500 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      v560 = v479;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v479, "setObject:forKeyedSubscript:", v500, CFSTR("upperBoundOfEngagementScoreParams"));

      v501 = objc_opt_new(NSMutableDictionary);
      v502 = v554->_configurationManager;
      v503 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480[329], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("pairWiseFarthest")));
      LODWORD(v504) = 2.5;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v502, "getFloatSettingForKey:withFallback:", v503, v504);
      v505 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v501, "setObject:forKeyedSubscript:", v505, CFSTR("pairWiseFarthest"));

      v506 = v554->_configurationManager;
      v507 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480[329], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("pairWiseFarther")));
      LODWORD(v508) = 2.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v506, "getFloatSettingForKey:withFallback:", v507, v508);
      v509 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v501, "setObject:forKeyedSubscript:", v509, CFSTR("pairWiseFarther"));

      v510 = v554->_configurationManager;
      v511 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480[329], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), CFSTR("pairWiseFar")));
      LODWORD(v512) = 1.0;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v510, "getFloatSettingForKey:withFallback:", v511, v512);
      v513 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v501, "setObject:forKeyedSubscript:", v513, CFSTR("pairWiseFar"));

      v514 = objc_opt_new(NSMutableDictionary);
      v515 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getDefaultRichnessWeightDict](v554, "_getDefaultRichnessWeightDict"));
      for (j = 0; j != 17; ++j)
      {
        v517 = (void *)objc_claimAutoreleasedReturnValue(+[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", j));
        v518 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v515, "objectForKeyedSubscript:", v517));
        v519 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getRichnessScoreWeightFromConfigurationManager:withDefaultWeightDict:](v554, "_getRichnessScoreWeightFromConfigurationManager:withDefaultWeightDict:", v517, v518));
        -[NSMutableDictionary setObject:forKey:](v514, "setObject:forKey:", v519, v517);

      }
      v520 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("NumUniqueResourceTypesNormalizedKey")));
      v521 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getRichnessScoreWeightFromConfigurationManager:withDefaultWeightDict:](v554, "_getRichnessScoreWeightFromConfigurationManager:withDefaultWeightDict:", CFSTR("NumUniqueResourceTypesNormalizedKey"), v520));
      -[NSMutableDictionary setObject:forKey:](v514, "setObject:forKey:", v521, CFSTR("NumUniqueResourceTypesNormalizedKey"));

      v558 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("NumWorkoutRouteMapAssets")));
      v522 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _getRichnessScoreWeightFromConfigurationManager:withDefaultWeightDict:](v554, "_getRichnessScoreWeightFromConfigurationManager:withDefaultWeightDict:", CFSTR("NumWorkoutRouteMapAssets"), v558));
      -[NSMutableDictionary setObject:forKey:](v514, "setObject:forKey:", v522, CFSTR("NumWorkoutRouteMapAssets"));

      richnessWeightsDict = v554->_richnessWeightsDict;
      v554->_richnessWeightsDict = &v514->super;
      v549 = v514;

      engagementScoreParameterDict = v554->_engagementScoreParameterDict;
      v554->_engagementScoreParameterDict = &v560->super;
      v548 = v560;

      staticModelParameterMatrix = v554->_staticModelParameterMatrix;
      v554->_staticModelParameterMatrix = &v555->super;
      v561 = v555;

      dynamicModelParameterDict = v554->_dynamicModelParameterDict;
      v554->_dynamicModelParameterDict = &v551->super;
      v556 = v551;

      v527 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _checkAndUpdateNumericLimits:](v554, "_checkAndUpdateNumericLimits:", v544));
      heuristicsParameterDict = v554->_heuristicsParameterDict;
      v554->_heuristicsParameterDict = v527;
      v529 = v527;

      rankingScoreThresholdDict = v554->_rankingScoreThresholdDict;
      v554->_rankingScoreThresholdDict = &v545->super;
      v552 = v545;

      viewCountBasedAdjustmentParameterDict = v554->_viewCountBasedAdjustmentParameterDict;
      v554->_viewCountBasedAdjustmentParameterDict = &v543->super;
      v532 = v543;

      bprRegularizationFactor = v554->_bprRegularizationFactor;
      v554->_bprRegularizationFactor = &v553->super;
      v534 = v553;

      pairWiseWeights = v554->_pairWiseWeights;
      v554->_pairWiseWeights = v501;
      v536 = v501;

      evergreenEngagementScoreParameterDict = v554->_evergreenEngagementScoreParameterDict;
      v554->_evergreenEngagementScoreParameterDict = &v550->super;
      v538 = v550;

      curationParameterDict = v554->_curationParameterDict;
      v554->_curationParameterDict = &v547->super;
      v540 = v547;

      v6 = v546;
      v7 = v554;
    }
    self = v7;
    v368 = self;
  }
  else
  {
    v365 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v366 = objc_claimAutoreleasedReturnValue(v365);
    if (os_log_type_enabled(v366, OS_LOG_TYPE_ERROR))
      -[MOPeopleDiscoveryManager initWithUniverse:].cold.1();

    v367 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v367, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleRanking.m"), 1078, CFSTR("Invalid parameter not satisfying: configurationManager"));

    v368 = 0;
  }

  return v368;
}

- (id)_getRichnessScoreWeightFromConfigurationManager:(id)a3 withDefaultWeightDict:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  MOConfigurationManagerBase *configurationManager;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MOConfigurationManagerBase *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MOConfigurationManagerBase *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("_Resource_PrimaryWeight")));
  configurationManager = self->_configurationManager;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RankingRichnessPrimaryPriorityScoreKey")));
  objc_msgSend(v12, "floatValue");
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](configurationManager, "getFloatSettingForKey:withFallback:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));

  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v13, CFSTR("RankingRichnessPrimaryPriorityScoreKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("_Resource_SecondaryWeight")));

  v15 = self->_configurationManager;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RankingRichnessPrimaryPriorityScoreKey")));
  objc_msgSend(v17, "floatValue");
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v15, "getFloatSettingForKey:withFallback:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));

  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v18, CFSTR("RankingRichnessSecondaryPriorityScoreKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("_Resource_AuxiliaryWeight")));

  v20 = self->_configurationManager;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("rankingParams"), v19));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RankingRichnessPrimaryPriorityScoreKey")));

  objc_msgSend(v22, "floatValue");
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v20, "getFloatSettingForKey:withFallback:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));

  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v23, CFSTR("RankingRichnessAuxiliaryPriorityScoreKey"));
  return v8;
}

- (void)generateBundleRanking:(id)a3 withMinRecommendedBundleCountRequirement:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  _BOOL4 v32;
  void *context;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v4 = a4;
  v5 = a3;
  context = objc_autoreleasePoolPush();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v40 = objc_msgSend(v5, "count");
    v41 = 1024;
    LODWORD(v42) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Input bundle count: %lu, minimumRecommendedBundleRequired:%d", buf, 0x12u);
  }
  v32 = v4;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
        if (v16)
        {
          v17 = (void *)v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "suggestionID"));

          if (v18)
            continue;
        }
        objc_msgSend(v8, "addIndex:", (char *)i + v12);
        v19 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "suggestionID"));
          *(_DWORD *)buf = 138412546;
          v40 = v21;
          v41 = 2112;
          v42 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "bundle with nil bundleID or nil suggestionID was filtered out: bundleID %@ suggestionID %@", buf, 0x16u);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      v12 += (uint64_t)i;
    }
    while (v11);
  }

  objc_msgSend(v9, "removeObjectsAtIndexes:", v8);
  v23 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v40 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Input bundle count after nil ID filters: %lu", buf, 0xCu);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking generateRankingInput:](self, "generateRankingInput:", v9));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:](self, "_calculateRankingScore:withMinRecommendedBundleCountRequirement:", v26, v32));
  if (self->_isInternalBuild)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:](self, "_submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:", v27, v26, v28);

  }
  -[MOEventBundleRanking _mergeScoresToBundles:usingScore:](self, "_mergeScoresToBundles:usingScore:", v9, v27);
  v29 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v40 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "generateBundleRanking completed for %lu bundles", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

- (id)_calculateRankingScore:(id)a3 withMinRecommendedBundleCountRequirement:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSMutableDictionary *v6;
  void *v7;
  float v8;
  id os_log;
  NSObject *v10;
  double v11;
  float v12;
  void *v13;
  float v14;
  void *v15;
  signed int v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  float v27;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  double v50;
  NSNumber *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  NSObject *v58;
  _BOOL8 v59;
  _BOOL8 v60;
  uint64_t v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  NSObject *v72;
  id v73;
  float v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  MOConfigurationManagerBase *configurationManager;
  void *v82;
  double v83;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  void *v88;
  void *v89;
  id v90;
  void *j;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  float v97;
  float v98;
  void *v99;
  float v100;
  float v101;
  void *v102;
  float v103;
  float v104;
  void *v105;
  float v106;
  float v107;
  void *v108;
  float v109;
  float v110;
  void *v111;
  float v112;
  float v113;
  void *v114;
  float v115;
  float v116;
  void *v117;
  float v118;
  float v119;
  void *v120;
  float v121;
  float v122;
  void *v123;
  float v124;
  float v125;
  void *v126;
  float v127;
  float v128;
  void *v129;
  float v130;
  float v131;
  void *v132;
  float v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  float v154;
  float v155;
  float v156;
  float v157;
  float v158;
  float v159;
  float v160;
  void *v161;
  float v162;
  float v163;
  void *v164;
  void *v165;
  float v166;
  float v167;
  float v168;
  void *v169;
  void *v170;
  float v171;
  float v172;
  float v173;
  float v174;
  void *v175;
  void *v176;
  float v177;
  float v178;
  float v179;
  float v180;
  void *v181;
  void *v182;
  float v183;
  float v184;
  float v185;
  float v186;
  id v187;
  NSObject *v188;
  float v189;
  void *v190;
  float v191;
  float v192;
  void *v193;
  float v194;
  float v195;
  void *v196;
  void *v197;
  float v198;
  float v199;
  float v200;
  void *v201;
  void *v202;
  float v203;
  float v204;
  float v205;
  float v206;
  void *v207;
  void *v208;
  float v209;
  float v210;
  float v211;
  float v212;
  void *v213;
  void *v214;
  float v215;
  float v216;
  float v217;
  float v218;
  id v219;
  NSObject *v220;
  void *v221;
  void *v222;
  float v223;
  float v224;
  void *v225;
  void *v226;
  float v227;
  float v228;
  void *v229;
  void *v230;
  float v231;
  float v232;
  void *v233;
  float v234;
  float v235;
  void *v236;
  float v237;
  float v238;
  void *v239;
  float v240;
  float v241;
  float v242;
  float v243;
  float v244;
  float v245;
  _BOOL4 v246;
  void *v247;
  float v248;
  float v249;
  float v250;
  float v251;
  uint64_t v252;
  id v253;
  NSObject *v254;
  void *v255;
  void *v256;
  id v257;
  NSObject *v258;
  void *v259;
  void *v260;
  id v261;
  void *v262;
  void *v263;
  id v264;
  void *v265;
  void *v266;
  signed int v267;
  void *v268;
  id v269;
  uint64_t v270;
  unint64_t v271;
  void *k;
  void *v273;
  id v274;
  NSObject *v275;
  void *v276;
  id v277;
  id v278;
  unint64_t v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  void *v288;
  double v289;
  _BOOL8 v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  double v297;
  void *v298;
  double v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  signed int v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  float v311;
  void *v312;
  void *v313;
  float v314;
  float v315;
  void *v316;
  void *v317;
  float v318;
  float v319;
  void *v320;
  void *v321;
  float v322;
  float v323;
  float v324;
  id v325;
  void *v326;
  void *v327;
  float v328;
  void *v329;
  void *v330;
  float v331;
  void *v332;
  void *v333;
  float v334;
  float v335;
  void *v336;
  void *v337;
  float v338;
  float v339;
  id v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  float v345;
  void *v346;
  void *v347;
  float v348;
  void *v349;
  void *v350;
  float v351;
  _BOOL4 v352;
  uint64_t v353;
  uint64_t v354;
  void *v355;
  void *v356;
  float v357;
  void *v358;
  void *v359;
  float v360;
  id v361;
  NSObject *v362;
  uint64_t v363;
  id v364;
  NSObject *v365;
  void *v366;
  void *v367;
  id v368;
  uint64_t v369;
  id v370;
  NSObject *v371;
  _BOOL4 v372;
  void *v373;
  void *v374;
  id v375;
  void *v376;
  void *v377;
  id v378;
  void *v379;
  void *v380;
  uint64_t v381;
  float v382;
  float v383;
  void *v384;
  float v385;
  _BOOL4 v386;
  id v387;
  NSObject *v388;
  void *v389;
  float v390;
  float v391;
  void *v392;
  void *v393;
  id v394;
  float v395;
  float v396;
  float v397;
  void *v398;
  float v399;
  _BOOL4 v400;
  id v401;
  NSObject *v402;
  void *v403;
  float v404;
  float v405;
  void *v406;
  void *v407;
  id v408;
  float v409;
  float v410;
  float v411;
  void *v412;
  float v413;
  _BOOL4 v414;
  id v415;
  NSObject *v416;
  _BOOL4 v417;
  void *v418;
  float v419;
  float v420;
  void *v421;
  void *v422;
  id v423;
  float v424;
  void *v425;
  float v426;
  float v427;
  void *v428;
  void *v429;
  float v430;
  float v431;
  id v432;
  id v433;
  _BOOL4 v434;
  void *v435;
  void *v436;
  uint64_t v437;
  void *v438;
  void *v439;
  id v440;
  NSObject *v441;
  void *v442;
  void *v443;
  id v444;
  uint64_t v445;
  id v446;
  _BOOL4 v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  id v452;
  NSObject *v453;
  void *v454;
  void *v455;
  id v456;
  unsigned int v457;
  id v458;
  NSObject *v459;
  void *v460;
  void *v461;
  id v462;
  id v463;
  id v464;
  NSObject *v465;
  void *v466;
  void *v467;
  id v468;
  _BOOL4 v469;
  id v470;
  _BOOL4 v471;
  void *v472;
  void *v473;
  id v474;
  uint64_t v475;
  float v476;
  id v477;
  void *v478;
  void *v479;
  unsigned int v480;
  unsigned int v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  id v486;
  void *v487;
  void *v488;
  id v489;
  void *v490;
  void *v491;
  float v492;
  void *v493;
  void *v494;
  float v495;
  void *v496;
  void *v497;
  float v498;
  void *v499;
  void *v500;
  float v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  float v506;
  void *v507;
  void *v508;
  float v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  float v514;
  void *v515;
  void *v516;
  float v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  float v522;
  void *v523;
  void *v524;
  float v525;
  id v526;
  void *v527;
  void *v528;
  signed int v529;
  id v530;
  NSObject *v531;
  id v532;
  NSObject *v533;
  id v534;
  NSObject *v535;
  id v536;
  id v537;
  id v538;
  NSObject *v539;
  id v540;
  NSObject *v541;
  id v542;
  NSObject *v543;
  float frequencyPenalty;
  void *v545;
  id v546;
  float v547;
  uint64_t v548;
  double v549;
  void *m;
  uint64_t v551;
  void *v552;
  float v553;
  float v554;
  long double v555;
  void *v556;
  id v557;
  NSObject *v558;
  id v559;
  NSObject *v560;
  void *v561;
  id v562;
  uint64_t v563;
  uint64_t v564;
  void *n;
  void *v566;
  void *v567;
  unsigned int v568;
  void *v569;
  void *v570;
  void *v571;
  float v572;
  float v573;
  void *v574;
  float v575;
  float v576;
  void *v577;
  float v578;
  float v579;
  float v580;
  void *v581;
  float v582;
  float v583;
  float v584;
  NSMutableDictionary *v585;
  double v586;
  void *v587;
  double v588;
  void *v589;
  void *v590;
  id v591;
  NSObject *v592;
  void *v593;
  void *v594;
  void *v595;
  void *v596;
  void *v597;
  id v598;
  void *v599;
  id v600;
  id v601;
  void *v602;
  void *v603;
  void *v604;
  void *v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  void *v610;
  id v611;
  NSMutableArray *v612;
  NSDate *v613;
  id v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  id v618;
  NSObject *v619;
  void *v620;
  void *v621;
  void *v622;
  void *v623;
  id v624;
  NSObject *v625;
  float v626;
  void *v627;
  _BOOL4 v628;
  void *v629;
  signed int v630;
  id v631;
  void *v632;
  void *v633;
  void *v634;
  id v635;
  void *v636;
  id v637;
  id v638;
  void *v639;
  void *v640;
  id v641;
  NSObject *v642;
  void *v643;
  void *v644;
  id v645;
  NSObject *v646;
  void *v647;
  void *v648;
  void *v649;
  NSMutableArray *v650;
  id v651;
  id v652;
  NSDate *v654;
  NSDate *v655;
  NSSet *v656;
  int v657;
  unint64_t v658;
  int v659;
  float v660;
  NSSet *v661;
  unint64_t v662;
  void *v663;
  id v665;
  unint64_t v666;
  NSMutableDictionary *v667;
  uint64_t v668;
  float v669;
  float elapsedDaysSinceOnboardingDate;
  NSMutableArray *v671;
  id v672;
  float v673;
  float v674;
  float v675;
  float v676;
  float v677;
  float v678;
  float v679;
  float v680;
  float v681;
  float v682;
  float v683;
  unsigned int v684;
  float v685;
  float v686;
  float v687;
  float v688;
  float v689;
  float v690;
  float v691;
  float v692;
  float v693;
  float v694;
  float v695;
  float v696;
  float v697;
  float v698;
  float v699;
  unsigned int v700;
  float v701;
  float v702;
  float v703;
  int v704;
  float v705;
  float v706;
  float v707;
  unsigned int v708;
  float v709;
  float v710;
  float v711;
  float v712;
  float v713;
  float v714;
  float v715;
  float v716;
  float v717;
  float v718;
  float v719;
  void *v720;
  void *v721;
  void *v722;
  void *v723;
  void *v724;
  void *v725;
  void *v726;
  void *v727;
  unsigned int v728;
  void *v729;
  uint64_t v730;
  void *v731;
  void *v732;
  void *v733;
  void *v734;
  void *v735;
  void *v736;
  void *v737;
  void *v738;
  void *v739;
  void *v740;
  void *v741;
  void *v742;
  void *v743;
  void *v744;
  void *v745;
  void *v746;
  void *v747;
  void *v748;
  void *v749;
  void *v750;
  void *v751;
  void *v752;
  void *v753;
  void *v754;
  void *v755;
  void *v756;
  void *v757;
  void *v758;
  void *v759;
  void *v760;
  void *v761;
  void *v762;
  uint64_t v763;
  void *v764;
  void *v765;
  void *v766;
  float v767;
  void *v768;
  void *v769;
  float v770;
  void *v771;
  void *v772;
  float v773;
  void *v774;
  void *v775;
  float v776;
  void *v777;
  float v778;
  void *v779;
  float v780;
  void *v781;
  void *v782;
  float v783;
  void *v784;
  id v785;
  void *v786;
  float v787;
  void *v788;
  float v789;
  void *v790;
  id v791;
  unsigned int v792;
  NSMutableDictionary *v793;
  unsigned int v794;
  void *v795;
  id obj;
  void *v797;
  void *v798;
  id v799;
  void *v800;
  NSMutableSet *v801;
  NSMutableSet *v802;
  float v803;
  id v804;
  id v805;
  id v806;
  id v807;
  NSMutableArray *v808;
  uint64_t v809;
  void *v810;
  void *v811;
  void *v812;
  NSMutableArray *v813;
  NSMutableArray *v815;
  NSDate *v816;
  void *v817;
  void *v818;
  NSMutableDictionary *v819;
  _QWORD v820[4];
  id v821;
  uint64_t *v822;
  uint64_t v823;
  _QWORD v824[4];
  NSMutableArray *v825;
  NSDate *v826;
  NSDate *v827;
  id v828;
  _BYTE *v829;
  uint64_t *v830;
  uint64_t *v831;
  uint64_t *v832;
  _QWORD *v833;
  _QWORD *v834;
  _QWORD *v835;
  uint64_t *v836;
  _QWORD *v837;
  uint64_t *v838;
  _QWORD *v839;
  _QWORD *v840;
  _QWORD *v841;
  uint64_t *v842;
  char v843;
  _QWORD v844[3];
  char v845;
  _QWORD v846[3];
  char v847;
  _QWORD v848[3];
  char v849;
  uint64_t v850;
  uint64_t *v851;
  uint64_t v852;
  uint64_t v853;
  uint64_t v854;
  uint64_t *v855;
  uint64_t v856;
  uint64_t v857;
  uint64_t v858;
  uint64_t *v859;
  uint64_t v860;
  uint64_t v861;
  uint64_t v862;
  uint64_t *v863;
  uint64_t v864;
  uint64_t (*v865)(uint64_t, uint64_t);
  void (*v866)(uint64_t);
  NSMutableDictionary *v867;
  _QWORD v868[5];
  NSMutableSet *v869;
  _QWORD v870[5];
  NSMutableSet *v871;
  _QWORD v872[5];
  NSMutableSet *v873;
  uint64_t v874;
  uint64_t *v875;
  uint64_t v876;
  uint64_t (*v877)(uint64_t, uint64_t);
  void (*v878)(uint64_t);
  NSMutableSet *v879;
  uint64_t v880;
  uint64_t *v881;
  uint64_t v882;
  uint64_t (*v883)(uint64_t, uint64_t);
  void (*v884)(uint64_t);
  NSMutableSet *v885;
  _QWORD v886[4];
  _QWORD v887[4];
  NSMutableArray *v888;
  _QWORD v889[4];
  id v890;
  id v891;
  _QWORD v892[4];
  NSMutableArray *v893;
  _QWORD v894[5];
  NSMutableDictionary *v895;
  NSMutableArray *v896;
  _BYTE *v897;
  uint64_t *v898;
  uint64_t *v899;
  _QWORD v900[4];
  id v901;
  id v902;
  __int128 v903;
  __int128 v904;
  __int128 v905;
  __int128 v906;
  __int128 v907;
  __int128 v908;
  __int128 v909;
  __int128 v910;
  __int128 v911;
  __int128 v912;
  __int128 v913;
  __int128 v914;
  __int128 v915;
  __int128 v916;
  __int128 v917;
  __int128 v918;
  char v919;
  char v920[15];
  __int128 v921;
  __int128 v922;
  __int128 v923;
  __int128 v924;
  __int128 v925;
  __int128 v926;
  __int128 v927;
  __int128 v928;
  uint8_t v929[4];
  void *v930;
  __int16 v931;
  uint64_t v932;
  __int16 v933;
  void *v934;
  char v935[16];
  _BYTE v936[128];
  _BYTE v937[128];
  _QWORD v938[40];
  _QWORD v939[40];
  uint8_t v940[128];
  _BYTE buf[24];
  _BYTE v942[38];
  __int16 v943;
  id v944;
  _BYTE v945[128];
  char v946[24];
  _BYTE v947[128];
  _BYTE v948[128];
  _QWORD v949[6];
  _QWORD v950[6];

  v4 = a4;
  v5 = a3;
  v949[0] = CFSTR("GRATITUDE");
  v949[1] = CFSTR("CREATIVITY");
  v950[0] = &off_1002DCDE8;
  v950[1] = &off_1002DCDF8;
  v949[2] = CFSTR("WISDOM");
  v949[3] = CFSTR("PURPOSE");
  v950[2] = &off_1002DCE08;
  v950[3] = &off_1002DCE18;
  v949[4] = CFSTR("KINDNESS");
  v949[5] = CFSTR("RESILIENCE");
  v950[4] = &off_1002DCE28;
  v950[5] = &off_1002DCD18;
  v663 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v950, v949, 6));
  v802 = objc_opt_new(NSMutableSet);
  v801 = objc_opt_new(NSMutableSet);
  v655 = objc_opt_new(NSDate);
  v654 = objc_opt_new(NSDate);
  v656 = objc_opt_new(NSSet);
  v661 = objc_opt_new(NSSet);
  v6 = objc_opt_new(NSMutableDictionary);
  v671 = objc_opt_new(NSMutableArray);
  v731 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v732 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  elapsedDaysSinceOnboardingDate = self->_elapsedDaysSinceOnboardingDate;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("daysToSuppressCoarseSummaryAfterOnboarding")));
  objc_msgSend(v7, "floatValue");
  v669 = v8;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(float *)&v11 = elapsedDaysSinceOnboardingDate;
    v12 = self->_elapsedDaysSinceOnboardingDate;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("daysToSuppressCoarseSummaryAfterOnboarding"), v11));
    objc_msgSend(v13, "floatValue");
    *(_DWORD *)buf = 134218496;
    *(double *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)v942 = elapsedDaysSinceOnboardingDate < v669;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "elapsedDaysSinceOnboardingDate, %.2f, maxDaysToSuppressCoarseSummaryAfterOnboarding,%.2f,suppressCoarseSummary:%d", buf, 0x1Cu);

  }
  if (v4)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("minSensedBundleCountInRecommendedTab")));
    v16 = objc_msgSend(v15, "intValue");

    v658 = v16;
  }
  else
  {
    v658 = 0;
  }
  v928 = 0u;
  v927 = 0u;
  v926 = 0u;
  v925 = 0u;
  obj = v5;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v925, v948, 16);
  if (!v17)
    goto LABEL_19;
  v18 = *(_QWORD *)v926;
  do
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(_QWORD *)v926 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v925 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v20, "suggestionIsDeleted"))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "suggestionIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
        -[NSMutableSet addObject:](v802, "addObject:", v22);

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subSuggestionIDs"));
        -[NSMutableSet addObjectsFromArray:](v802, "addObjectsFromArray:", v23);
LABEL_16:

        continue;
      }
      if ((objc_msgSend(v20, "suggestionIsSelected") & 1) != 0
        || objc_msgSend(v20, "suggestionQuickAddEntry"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "suggestionIdentifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
        -[NSMutableSet addObject:](v801, "addObject:", v25);

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subSuggestionIDs"));
        -[NSMutableSet addObjectsFromArray:](v801, "addObjectsFromArray:", v23);
        goto LABEL_16;
      }
    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v925, v948, 16);
  }
  while (v17);
LABEL_19:

  v657 = 0;
  v659 = 0;
  v26 = 0;
  v27 = 1.0;
  while (2)
  {
    if (v27 < 0.0 || v26 > v658)
    {
      v667 = v6;
      goto LABEL_321;
    }
    v660 = v27;
    v667 = objc_opt_new(NSMutableDictionary);

    v29 = objc_opt_new(NSMutableArray);
    v924 = 0u;
    v923 = 0u;
    v922 = 0u;
    v921 = 0u;
    v665 = obj;
    v672 = objc_msgSend(v665, "countByEnumeratingWithState:objects:count:", &v921, v947, 16);
    v671 = v29;
    if (!v672)
    {
      v666 = 0;
      goto LABEL_301;
    }
    v666 = 0;
    v662 = 0;
    v668 = *(_QWORD *)v922;
    while (2)
    {
      v30 = 0;
      while (2)
      {
        if (*(_QWORD *)v922 != v668)
        {
          v31 = v30;
          objc_enumerationMutation(v665);
          v30 = v31;
        }
        v730 = v30;
        v817 = *(void **)(*((_QWORD *)&v921 + 1) + 8 * v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleStartDate"));
        v33 = objc_msgSend(v32, "isAfterDate:", v732);

        if (v33)
        {
          v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleStartDate"));

          v732 = (void *)v34;
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleStartDate"));
        v36 = objc_msgSend(v35, "isBeforeDate:", v731);

        if (v36)
        {
          v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleStartDate"));

          v731 = (void *)v37;
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "UUIDString"));
        if ((-[NSMutableSet containsObject:](v802, "containsObject:", v39) & 1) != 0)
        {
          v794 = 1;
        }
        else if (objc_msgSend(v817, "bundleInterfaceType") == (id)13)
        {
          v794 = 0;
        }
        else
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "subSuggestionIDs"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v40));
          v794 = -[NSMutableSet intersectsSet:](v802, "intersectsSet:", v41);

        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "UUIDString"));
        if ((-[NSMutableSet containsObject:](v801, "containsObject:", v43) & 1) != 0)
        {
          v792 = 1;
        }
        else if (objc_msgSend(v817, "bundleInterfaceType") == (id)13 || objc_msgSend(v817, "bundleSubType") == (id)202)
        {
          v792 = 0;
        }
        else
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "subSuggestionIDs"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v44));
          v792 = -[NSMutableSet intersectsSet:](v801, "intersectsSet:", v45);

        }
        v46 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v49;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v942 = v792;
          *(_WORD *)&v942[4] = 1024;
          *(_DWORD *)&v942[6] = v794;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Engagement status: bundleID %@, suggestionID %@, isBundleOrSubBundlesSelectedOrQuickAdded %d, isBundleOrSubBundleDeleted %d", buf, 0x22u);

        }
        if (!objc_msgSend(v817, "bundleInterfaceType"))
        {
          v728 = 0;
          v59 = 0;
          v60 = 0;
          v61 = 0;
          v763 = 0;
          v62 = 0.0;
          v63 = -1.0;
          v64 = -1.0;
          v65 = 0.0;
          v66 = 0.0;
          v783 = 0.0;
          v778 = 0.0;
          v787 = 0.0;
          v803 = 0.0;
          v67 = 0.0;
          goto LABEL_146;
        }
        v51 = objc_opt_new(NSNumber);
        if (objc_msgSend(v817, "bundleInterfaceType") != (id)11)
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking dynamicModelParameterDict](self, "dynamicModelParameterDict"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleInterfaceType")));
          v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", v69));

          v56 = (void *)v70;
          if (v70)
            goto LABEL_61;
          v71 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          v72 = objc_claimAutoreleasedReturnValue(v71);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v340 = objc_msgSend(v817, "bundleInterfaceType");
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)&buf[4] = v340;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)v942 = 1573;
            _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "Dynamic model parameter is not set for bundleInterfaceType %lu (in %s:%d)", buf, 0x1Cu);
          }

          v58 = objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleRanking.m"), 1573, CFSTR("Dynamic model parameter is not set for bundleInterfaceType %lu (in %s:%d)"), objc_msgSend(v817, "bundleInterfaceType"), "-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]", 1573);
          v51 = 0;
LABEL_60:

          v56 = v51;
          goto LABEL_61;
        }
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "evergreenType"));

        if (!v52)
        {
          v73 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v58 = objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.7(&v919, v920);
          goto LABEL_60;
        }
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking evergreenEngagementScoreParameterDict](self, "evergreenEngagementScoreParameterDict"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "evergreenType"));
        v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", v54));

        v56 = (void *)v55;
        if (!v55)
        {
          v57 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v58 = objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.8((uint64_t)v946, (uint64_t)v817);
          v51 = (NSNumber *)&off_1002DCD38;
          goto LABEL_60;
        }
LABEL_61:
        v720 = v56;
        objc_msgSend(v56, "floatValue");
        v783 = v74;
        if (objc_msgSend(v817, "bundleInterfaceType") == (id)12 && objc_msgSend(v817, "bundleSuperType") == (id)1)
        {
          v75 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking staticModelParameterMatrix](self, "staticModelParameterMatrix"));
          v797 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", &off_1002DA9B8));
        }
        else
        {
          v76 = (void *)phoneSensedWalkingVariants;
          v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleSubType")));
          LODWORD(v76) = objc_msgSend(v76, "containsObject:", v77);

          if ((_DWORD)v76)
          {
            v78 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking staticModelParameterMatrix](self, "staticModelParameterMatrix"));
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", &off_1002DA9B8));
            v80 = objc_msgSend(v79, "mutableCopy");

            configurationManager = self->_configurationManager;
            v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_MotionActivityWalkingSubType_%@"), CFSTR("rankingParams"), CFSTR("bundleScoreConstant")));
            LODWORD(v83) = -1138501878;
            -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](configurationManager, "getFloatSettingForKey:withFallback:", v82, v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
            objc_msgSend(v80, "setObject:forKeyedSubscript:", v84, CFSTR("bundleScoreConstant"));

            v75 = v80;
            v797 = v75;
          }
          else if (objc_msgSend(v817, "bundleSubType") == (id)201 || objc_msgSend(v817, "bundleSubType") == (id)205)
          {
            v75 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking staticModelParameterMatrix](self, "staticModelParameterMatrix"));
            v797 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", &off_1002DABF8));
          }
          else
          {
            v75 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking staticModelParameterMatrix](self, "staticModelParameterMatrix"));
            v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleInterfaceType")));
            v797 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", v85));

          }
        }

        if (!v797)
        {
          v86 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          v87 = objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
          {
            v325 = objc_msgSend(v817, "bundleInterfaceType");
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)&buf[4] = v325;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)v942 = 1605;
            _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "Static model parameters are not set for bundleInterfaceType %lu (in %s:%d)", buf, 0x1Cu);
          }

          v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleRanking.m"), 1605, CFSTR("Static model parameters are not set for bundleInterfaceType %lu (in %s:%d)"), objc_msgSend(v817, "bundleInterfaceType"), "-[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:]", 1605);

        }
        v918 = 0u;
        v917 = 0u;
        v916 = 0u;
        v915 = 0u;
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleRichnessDict"));
        v804 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "allKeys"));

        v90 = objc_msgSend(v804, "countByEnumeratingWithState:objects:count:", &v915, v945, 16);
        if (v90)
        {
          v809 = *(_QWORD *)v916;
          v67 = 0.0;
          do
          {
            for (j = 0; j != v90; j = (char *)j + 1)
            {
              if (*(_QWORD *)v916 != v809)
                objc_enumerationMutation(v804);
              v92 = *(_QWORD *)(*((_QWORD *)&v915 + 1) + 8 * (_QWORD)j);
              v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_richnessWeightsDict, "objectForKeyedSubscript:", v92));
              v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleRichnessDict"));
              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "objectForKeyedSubscript:", v92));

              v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("RankingRichnessPrimaryPriorityScoreKey")));
              objc_msgSend(v96, "floatValue");
              v98 = v97;
              v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("RankingRichnessPrimaryPriorityScoreKey")));
              objc_msgSend(v99, "floatValue");
              v101 = v100;
              v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("RankingRichnessSecondaryPriorityScoreKey")));
              objc_msgSend(v102, "floatValue");
              v104 = v103;
              v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("RankingRichnessSecondaryPriorityScoreKey")));
              objc_msgSend(v105, "floatValue");
              v107 = v106;
              v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("RankingRichnessAuxiliaryPriorityScoreKey")));
              objc_msgSend(v108, "floatValue");
              v110 = v109;
              v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("RankingRichnessAuxiliaryPriorityScoreKey")));
              objc_msgSend(v111, "floatValue");
              v113 = v112;

              v67 = v67 + (float)((float)((float)(v104 * v107) + (float)(v98 * v101)) + (float)(v110 * v113));
            }
            v90 = objc_msgSend(v804, "countByEnumeratingWithState:objects:count:", &v915, v945, 16);
          }
          while (v90);
        }
        else
        {
          v67 = 0.0;
        }

        v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("weightForLabelQualityScore")));
        objc_msgSend(v114, "floatValue");
        v711 = v115;
        objc_msgSend(v817, "labelQualityScore");
        v710 = v116;
        v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("weightForTimeCorrelationScore")));
        objc_msgSend(v117, "floatValue");
        v707 = v118;
        objc_msgSend(v817, "timeCorrelationScoreFeature");
        v706 = v119;

        v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("weightForNumAnamolyEventsNormalized")));
        objc_msgSend(v120, "floatValue");
        v703 = v121;
        objc_msgSend(v817, "numAnomalyEventsNormalized");
        v702 = v122;
        v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("weightForNumTrendEventsNormalized")));
        objc_msgSend(v123, "floatValue");
        v699 = v124;
        objc_msgSend(v817, "numTrendEventsNormalized");
        v698 = v125;
        v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("weightForNumRoutineEventsNormalized")));
        objc_msgSend(v126, "floatValue");
        v695 = v127;
        objc_msgSend(v817, "numRoutineEventsNormalized");
        v694 = v128;
        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("weightForNumStateOfMindEventsNormalized")));
        objc_msgSend(v129, "floatValue");
        v693 = v130;
        objc_msgSend(v817, "numStateOfMindEventsNormalized");
        v691 = v131;

        v132 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v810 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("weightForInterestingPOI")));
        objc_msgSend(v810, "floatValue");
        v719 = v133;
        objc_msgSend(v817, "interestingPOIFeature");
        v718 = v134;
        v805 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v788 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v805, "objectForKeyedSubscript:", CFSTR("weightForDistanceFromHome")));
        objc_msgSend(v788, "floatValue");
        v717 = v135;
        objc_msgSend(v817, "distanceToHomeFeatureNormalized");
        v716 = v136;
        v779 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v775 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v779, "objectForKeyedSubscript:", CFSTR("weightForCallDuration")));
        objc_msgSend(v775, "floatValue");
        v715 = v137;
        objc_msgSend(v817, "callDurationFeatureNormalized");
        v714 = v138;
        v772 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v769 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v772, "objectForKeyedSubscript:", CFSTR("weightForBurstyInteractionCount")));
        objc_msgSend(v769, "floatValue");
        v713 = v139;
        objc_msgSend(v817, "burstyInteractionCountFeatureNormalized");
        v712 = v140;
        v766 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v764 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v766, "objectForKeyedSubscript:", CFSTR("weightForMultipleInteractionTypes")));
        objc_msgSend(v764, "floatValue");
        v709 = v141;
        v708 = objc_msgSend(v817, "multipleInteractionTypesFeature");
        v761 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v759 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v761, "objectForKeyedSubscript:", CFSTR("weightForContactLocationWork")));
        objc_msgSend(v759, "floatValue");
        v705 = v142;
        v704 = objc_msgSend(v817, "contactLocationWorkFeature");
        v757 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v755 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v757, "objectForKeyedSubscript:", CFSTR("weightForGroupConversation")));
        objc_msgSend(v755, "floatValue");
        v701 = v143;
        v700 = objc_msgSend(v817, "groupConversationFeature");
        v753 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v751 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v753, "objectForKeyedSubscript:", CFSTR("weightForPCountMax")));
        objc_msgSend(v751, "floatValue");
        v697 = v144;
        objc_msgSend(v817, "peopleCountMaxNormalized");
        v696 = v145;
        v749 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v747 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v749, "objectForKeyedSubscript:", CFSTR("weightForPCountWeightedSum")));
        objc_msgSend(v747, "floatValue");
        v692 = v146;
        objc_msgSend(v817, "peopleCountWeightedSumNormalized");
        v690 = v147;
        v745 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v743 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v745, "objectForKeyedSubscript:", CFSTR("weightForPCountWeightedAverage")));
        objc_msgSend(v743, "floatValue");
        v689 = v148;
        objc_msgSend(v817, "peopleCountWeightedAverageNormalized");
        v688 = v149;
        v741 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v739 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v741, "objectForKeyedSubscript:", CFSTR("weightForPDensityWeightedAverage")));
        objc_msgSend(v739, "floatValue");
        v687 = v150;
        objc_msgSend(v817, "peopleDensityWeightedAverageNormalized");
        v686 = v151;
        v737 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v735 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("weightForItemFromMe")));
        objc_msgSend(v735, "floatValue");
        v685 = v152;
        v684 = objc_msgSend(v817, "itemFromMeFeature");
        v733 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v729 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v733, "objectForKeyedSubscript:", CFSTR("weightShareCountFeature")));
        objc_msgSend(v729, "floatValue");
        v683 = v153;
        objc_msgSend(v817, "shareCountFeatureNormalized");
        v682 = v154;
        v727 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v726 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v727, "objectForKeyedSubscript:", CFSTR("weightForTimeAtHomeDuration")));
        objc_msgSend(v726, "floatValue");
        v681 = v155;
        objc_msgSend(v817, "timeAtHomeDuration");
        v680 = v156;
        v725 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v724 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v725, "objectForKeyedSubscript:", CFSTR("weightForIsFamilyContact")));
        objc_msgSend(v724, "floatValue");
        v679 = v157;
        objc_msgSend(v817, "isFamilyContact");
        v678 = v158;
        v723 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v722 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v723, "objectForKeyedSubscript:", CFSTR("weightForIsCoworkerContact")));
        objc_msgSend(v722, "floatValue");
        v677 = v159;
        objc_msgSend(v817, "isCoworkerContact");
        v676 = v160;
        v721 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v721, "objectForKeyedSubscript:", CFSTR("weightForMediaPlayTime")));
        objc_msgSend(v161, "floatValue");
        v675 = v162;
        objc_msgSend(v817, "mediaScoreFeatureNormalized");
        v674 = v163;
        v164 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "objectForKeyedSubscript:", CFSTR("weightForFamiliarityIndex")));
        objc_msgSend(v165, "floatValue");
        v673 = v166;
        objc_msgSend(v817, "familiarityIndexFeature");
        v168 = v167;
        v169 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("weightForWorkoutDurationNormalized")));
        objc_msgSend(v170, "floatValue");
        v172 = v171;
        objc_msgSend(v817, "workoutDurationFeatureNormalized");
        v174 = v173;
        v175 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("weightStateOfMindLabelCountNormalized")));
        objc_msgSend(v176, "floatValue");
        v178 = v177;
        objc_msgSend(v817, "stateOfMindLabelCountNormalized");
        v180 = v179;
        v181 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "objectForKeyedSubscript:", CFSTR("weightStateOfMindDomainCountNormalized")));
        objc_msgSend(v182, "floatValue");
        v184 = v183;
        objc_msgSend(v817, "stateOfMindDomainCountNormalized");
        v186 = v185;

        v187 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v188 = objc_claimAutoreleasedReturnValue(v187);
        v189 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v717 * v716) + (float)(v719 * v718)) + (float)(v715 * v714)) + (float)(v713 * v712)) + (float)(v709 * (float)v708)) + (float)(v705 * (float)v704)) + (float)(v701 * (float)v700)) + (float)(v697 * v696)) + (float)(v692 * v690)) + (float)(v689 * v688))
                                                                                             + (float)(v687 * v686))
                                                                                     + (float)(v685 * (float)v684))
                                                                             + (float)(v683 * v682))
                                                                     + (float)(v681 * v680))
                                                             + (float)(v679 * v678))
                                                     + (float)(v677 * v676))
                                             + (float)(v675 * v674))
                                     + (float)(v673 * v168))
                             + (float)(v172 * v174))
                     + (float)(v178 * v180))
             + (float)(v184 * v186);
        if (os_log_type_enabled(v188, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v189;
          _os_log_debug_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_DEBUG, "heuristics score before person-relationship based bonus %.3f", buf, 0xCu);
        }
        v789 = v189;

        v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v811 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "objectForKeyedSubscript:", CFSTR("weightForNumFamilyNormalized")));
        objc_msgSend(v811, "floatValue");
        v780 = v191;
        objc_msgSend(v817, "numFamilyNormalized");
        v776 = v192;
        v806 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v806, "objectForKeyedSubscript:", CFSTR("weightForNumFidsNormalized")));
        objc_msgSend(v193, "floatValue");
        v773 = v194;
        objc_msgSend(v817, "numKidsNormalized");
        v770 = v195;
        v196 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("weightForNumFriendsNormalized")));
        objc_msgSend(v197, "floatValue");
        v767 = v198;
        objc_msgSend(v817, "numFriendsNormalized");
        v200 = v199;
        v201 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "objectForKeyedSubscript:", CFSTR("weightForNumPetsNormalized")));
        objc_msgSend(v202, "floatValue");
        v204 = v203;
        objc_msgSend(v817, "numPetsNormalized");
        v206 = v205;
        v207 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "objectForKeyedSubscript:", CFSTR("weightForNumCoworkersNormalized")));
        objc_msgSend(v208, "floatValue");
        v210 = v209;
        objc_msgSend(v817, "numCoworkersNormalized");
        v212 = v211;
        v213 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
        v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v213, "objectForKeyedSubscript:", CFSTR("weightForNumOtherPersonsNormalized")));
        objc_msgSend(v214, "floatValue");
        v216 = v215;
        objc_msgSend(v817, "numOtherPersonsNormalized");
        v218 = v217;

        v219 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v220 = objc_claimAutoreleasedReturnValue(v219);
        v787 = v789
             + (float)((float)((float)((float)((float)((float)(v773 * v770) + (float)(v780 * v776))
                                             + (float)(v767 * v200))
                                     + (float)(v204 * v206))
                             + (float)(v210 * v212))
                     + (float)(v216 * v218));
        if (os_log_type_enabled(v220, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v787;
          _os_log_debug_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_DEBUG, "heuristics score after person-relationship based bonus %.3f", buf, 0xCu);
        }

        v778 = (float)(v707 * v706) + (float)(v711 * v710);
        v803 = (float)((float)((float)(v699 * v698) + (float)(v703 * v702)) + (float)(v695 * v694))
             + (float)(v693 * v691);
        if (objc_msgSend(v817, "bundleInterfaceType") == (id)11)
        {
          v65 = 1.0;
          v62 = 0.0;
          v66 = v783;
          if (v783 <= 0.0)
          {
            v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "evergreenType"));
            v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v663, "objectForKeyedSubscript:", v221));
            objc_msgSend(v222, "floatValue");
            v66 = v223;

          }
        }
        else if (objc_msgSend(v817, "bundleInterfaceType") == (id)15)
        {
          objc_msgSend(v817, "avgSubBundleGoodnessScores");
          v62 = v224;
          v65 = 0.0;
          v66 = v224;
        }
        else
        {
          if (objc_msgSend(v817, "bundleInterfaceType") == (id)10)
          {
            v225 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
            v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v225, "objectForKeyedSubscript:", CFSTR("maxBundleGoodnessScorePhotoMemory")));
            objc_msgSend(v226, "floatValue");
            v228 = v227;
            v229 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
            v230 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScoreIncrementPhotoMemory")));
            objc_msgSend(v230, "floatValue");
            v232 = v231;

            v62 = v228 - (float)(v232 * (float)v662++);
          }
          else if (objc_msgSend(v817, "bundleSuperType") != (id)4
                 || (v62 = -0.49, objc_msgSend(v817, "bundleSubType") != (id)407)
                 && objc_msgSend(v817, "bundleSubType") != (id)409
                 && objc_msgSend(v817, "bundleSubType") != (id)408
                 && objc_msgSend(v817, "bundleSubType") != (id)410)
          {
            v233 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("richnessScoreScalingParameter")));
            objc_msgSend(v233, "floatValue");
            v235 = v234;
            v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("bundleScoreScalingParameter")));
            objc_msgSend(v236, "floatValue");
            v238 = v237;
            v239 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("bundleScoreConstant")));
            objc_msgSend(v239, "floatValue");
            v241 = v240;

            v62 = (float)((float)(v778 + (float)(v787 + (float)(v803 + (float)(v67 * v235)))) / v238) + v241;
          }
          -[MOEventBundleRanking engagementScoreWeight](self, "engagementScoreWeight");
          v243 = v242;
          -[MOEventBundleRanking engagementScoreWeight](self, "engagementScoreWeight");
          v245 = v244;
          v246 = objc_msgSend(v817, "bundleInterfaceType") == (id)10;
          v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("decayRate")));
          objc_msgSend(v247, "floatValue");
          v249 = v248;
          objc_msgSend(v817, "bundleRecencyDaysElapsed");
          v66 = (float)(v783 * v245) + (float)((float)(1.0 - v243) * v62);
          v251 = -v249;
          if (v246)
            v65 = expf(floorf(v250) * v251);
          else
            v65 = expf(v250 * v251);

        }
        if (objc_msgSend(v817, "bundleInterfaceType") != (id)10 && objc_msgSend(v817, "bundleInterfaceType") != (id)11)
        {
          if (objc_msgSend(v817, "bundleSubType") == (id)406)
          {
            v253 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            v254 = objc_claimAutoreleasedReturnValue(v253);
            v64 = -1.0;
            if (os_log_type_enabled(v254, OS_LOG_TYPE_INFO))
            {
              v255 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
              v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v255;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v256;
              _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_INFO, "Internal media bundle got rejected: bundleID %@, suggestionID %@", buf, 0x16u);

            }
LABEL_127:
            v60 = 0;
            v59 = 0;
            v728 = 0;
            v63 = -1.0;
            goto LABEL_128;
          }
          if (objc_msgSend(v817, "bundleInterfaceType") == (id)15)
          {
            v264 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            v254 = objc_claimAutoreleasedReturnValue(v264);
            v64 = -1.0;
            if (os_log_type_enabled(v254, OS_LOG_TYPE_INFO))
            {
              v265 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
              v266 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v265;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v266;
              _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_INFO, "Clustering bundle got rejected: bundleID %@, suggestionID %@", buf, 0x16u);

            }
            goto LABEL_127;
          }
          v307 = (void *)visitSubtypeVariants;
          v308 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleSubType")));
          LODWORD(v307) = objc_msgSend(v307, "containsObject:", v308);

          if ((_DWORD)v307)
          {
            v309 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v310 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v309, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThresholdForVisitSubTypeVariants")));
            objc_msgSend(v310, "floatValue");
            v64 = v311;

            v312 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v313 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v312, "objectForKeyedSubscript:", CFSTR("suggestionRecommendThresholdForVisitSubTypeVariants")));
            objc_msgSend(v313, "floatValue");
            v315 = v314;

            v316 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v317 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v316, "objectForKeyedSubscript:", CFSTR("summarizationThresholdForVisitSubTypeVariants")));
            objc_msgSend(v317, "floatValue");
            v319 = v318;

            v320 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v321 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v320, "objectForKeyedSubscript:", CFSTR("tripSummarizationThresholdForVisitSubType")));
            objc_msgSend(v321, "floatValue");
            v323 = v322;

            v60 = v62 > v319;
            v59 = v62 > v323;
            if ((objc_msgSend(v817, "isShortVisit") & 1) != 0
              || objc_msgSend(v817, "isWorkVisit"))
            {
              objc_msgSend(v817, "numPhotoAssetsResourcesNormalized");
              if (v324 == 0.0)
                goto LABEL_158;
            }
LABEL_169:
            if ((float)(v64 + (float)(v660 * (float)(v315 - v64))) >= v64)
              v63 = v64 + (float)(v660 * (float)(v315 - v64));
            else
              v63 = v64;
            v361 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            v362 = objc_claimAutoreleasedReturnValue(v361);
            if (os_log_type_enabled(v362, OS_LOG_TYPE_DEBUG))
            {
              v486 = objc_msgSend(v817, "bundleSubType");
              *(_DWORD *)buf = 134218752;
              *(_QWORD *)&buf[4] = v486;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v64;
              *(_WORD *)&buf[22] = 2048;
              *(double *)v942 = v63;
              *(_WORD *)&v942[8] = 2048;
              *(double *)&v942[10] = v660;
              _os_log_debug_impl((void *)&_mh_execute_header, v362, OS_LOG_TYPE_DEBUG, "Current bundle subtype, %lu, acceptThreshold,%.3f, recommendThreshold, %.3f, recommendThresholdMultiplier, %.3f", buf, 0x2Au);
            }

            if (v62 <= v63)
            {
              v370 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              v371 = objc_claimAutoreleasedReturnValue(v370);
              v372 = os_log_type_enabled(v371, OS_LOG_TYPE_INFO);
              if (v62 <= v64)
              {
                if (v372)
                {
                  v379 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                  v380 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                  *(_DWORD *)buf = 138413314;
                  *(_QWORD *)&buf[4] = v379;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v380;
                  *(_WORD *)&buf[22] = 2048;
                  *(double *)v942 = v62;
                  *(_WORD *)&v942[8] = 2048;
                  *(double *)&v942[10] = v63;
                  *(_WORD *)&v942[18] = 2048;
                  *(double *)&v942[20] = v64;
                  _os_log_impl((void *)&_mh_execute_header, v371, OS_LOG_TYPE_INFO, "Suggestion was rejected to goodness score: bundleID %@, suggestionID %@ goodnessScore %.3f suggestionRecommendThreshold %.3f suggestionAcceptThreshold %.3f", buf, 0x34u);

                }
              }
              else
              {
                if (v372)
                {
                  v373 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                  v374 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                  *(_DWORD *)buf = 138413314;
                  *(_QWORD *)&buf[4] = v373;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v374;
                  *(_WORD *)&buf[22] = 2048;
                  *(double *)v942 = v62;
                  *(_WORD *)&v942[8] = 2048;
                  *(double *)&v942[10] = v63;
                  *(_WORD *)&v942[18] = 2048;
                  *(double *)&v942[20] = v64;
                  _os_log_impl((void *)&_mh_execute_header, v371, OS_LOG_TYPE_INFO, "Suggestion was set to present only in Recent tab due to goodness score: bundleID %@, suggestionID %@ goodnessScore %.3f suggestionRecommendThreshold %.3f suggestionAcceptThreshold %.3f", buf, 0x34u);

                }
                if (((objc_msgSend(v817, "isBundleAggregated") & 1) != 0
                   || objc_msgSend(v817, "summarizationGranularity") != (id)2)
                  && objc_msgSend(v817, "bundleSubType") != (id)203
                  && objc_msgSend(v817, "bundleSubType") != (id)303)
                {
                  v61 = 3;
                  v763 = 2;
                  goto LABEL_234;
                }
                v375 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                v371 = objc_claimAutoreleasedReturnValue(v375);
                if (os_log_type_enabled(v371, OS_LOG_TYPE_INFO))
                {
                  v376 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                  v377 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                  v378 = objc_msgSend(v817, "bundleSubType");
                  *(_DWORD *)buf = 138413570;
                  *(_QWORD *)&buf[4] = v376;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v377;
                  *(_WORD *)&buf[22] = 2048;
                  *(double *)v942 = v62;
                  *(_WORD *)&v942[8] = 2048;
                  *(double *)&v942[10] = v63;
                  *(_WORD *)&v942[18] = 2048;
                  *(double *)&v942[20] = v64;
                  *(_WORD *)&v942[28] = 2048;
                  *(_QWORD *)&v942[30] = v378;
                  _os_log_impl((void *)&_mh_execute_header, v371, OS_LOG_TYPE_INFO, "Suggestion was rejected due to goodness score: bundleID %@, suggestionID %@ goodnessScore %.3f suggestionRecommendThreshold %.3f suggestionAcceptThreshold %.3f subtype %lu", buf, 0x3Eu);

                }
              }
              v61 = 4;
              v763 = 3;
              v381 = (uint64_t)v661;
              goto LABEL_232;
            }
            if ((objc_msgSend(v817, "isBundleAggregated") & 1) == 0
              && objc_msgSend(v817, "summarizationGranularity") == (id)2
              || objc_msgSend(v817, "bundleSubType") == (id)303)
            {
              if (objc_msgSend(v817, "bundleSubType") == (id)202)
              {
                v363 = objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "workoutTypes"));

                v659 = 1;
                v656 = (NSSet *)v363;
              }
              if (elapsedDaysSinceOnboardingDate < v669)
              {
                v364 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                v365 = objc_claimAutoreleasedReturnValue(v364);
                if (os_log_type_enabled(v365, OS_LOG_TYPE_INFO))
                {
                  v366 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                  v367 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                  v368 = objc_msgSend(v817, "bundleSubType");
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v366;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v367;
                  *(_WORD *)&buf[22] = 2048;
                  *(_QWORD *)v942 = v368;
                  _os_log_impl((void *)&_mh_execute_header, v365, OS_LOG_TYPE_INFO, "Coarse summary suggestion got rejected due to suppressCoarseSummary==True: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);

                }
                v659 = (objc_msgSend(v817, "bundleSubType") != (id)202) & v659;
                v61 = 4;
                v369 = 3;
                goto LABEL_199;
              }
              v61 = 2;
            }
            else
            {
              v61 = 1;
            }
            v369 = 1;
LABEL_199:
            v763 = v369;
            if (objc_msgSend(v817, "bundleSubType") == (id)203)
            {
              v381 = objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "workoutTypes"));

              objc_msgSend(v817, "bundleRecencyDaysElapsed");
              v383 = v382;
              v384 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("maxDaysInRecommendedTabForWorkoutRoutine")));
              objc_msgSend(v384, "floatValue");
              v386 = v383 > v385;

              if (v386)
              {
                v387 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                v388 = objc_claimAutoreleasedReturnValue(v387);
                if (os_log_type_enabled(v388, OS_LOG_TYPE_INFO))
                {
                  v389 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("maxDaysInRecommendedTabForWorkoutRoutine")));
                  objc_msgSend(v389, "floatValue");
                  v391 = v390;
                  v392 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                  v393 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                  v394 = objc_msgSend(v817, "bundleSubType");
                  objc_msgSend(v817, "bundleRecencyDaysElapsed");
                  *(_DWORD *)buf = 134219010;
                  *(double *)&buf[4] = v391;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v392;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)v942 = v393;
                  *(_WORD *)&v942[8] = 2048;
                  *(_QWORD *)&v942[10] = v394;
                  *(_WORD *)&v942[18] = 2048;
                  *(double *)&v942[20] = v395;
                  _os_log_impl((void *)&_mh_execute_header, v388, OS_LOG_TYPE_INFO, "Workout routine suggestion was rejected because elapsed time >%.2f days: bundleID %@, suggestionID %@, bundleSubType %lu, elapsedTime %.2f", buf, 0x34u);

                }
                v657 = 0;
                v61 = 4;
                v763 = 3;
              }
              else
              {
                v763 = 1;
                v61 = 2;
                v657 = 1;
              }
            }
            else
            {
              v381 = (uint64_t)v661;
            }
            if (objc_msgSend(v817, "bundleSuperType") == (id)3 && objc_msgSend(v817, "bundleSubType") != (id)303)
            {
              objc_msgSend(v817, "bundleRecencyDaysElapsed");
              v397 = v396;
              v398 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("maxDaysInRecommendedTabForContact")));
              objc_msgSend(v398, "floatValue");
              v400 = v397 > v399;

              if (v400)
              {
                v401 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                v402 = objc_claimAutoreleasedReturnValue(v401);
                if (os_log_type_enabled(v402, OS_LOG_TYPE_INFO))
                {
                  v403 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("maxDaysInRecommendedTabForContact")));
                  objc_msgSend(v403, "floatValue");
                  v405 = v404;
                  v406 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                  v407 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                  v408 = objc_msgSend(v817, "bundleSubType");
                  objc_msgSend(v817, "bundleRecencyDaysElapsed");
                  *(_DWORD *)buf = 134219010;
                  *(double *)&buf[4] = v405;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v406;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)v942 = v407;
                  *(_WORD *)&v942[8] = 2048;
                  *(_QWORD *)&v942[10] = v408;
                  *(_WORD *)&v942[18] = 2048;
                  *(double *)&v942[20] = v409;
                  _os_log_impl((void *)&_mh_execute_header, v402, OS_LOG_TYPE_INFO, "Suggestion was dismissed from Recommended tab because elapsed time >%.2f days: bundleID %@, suggestionID %@, bundleSubType %lu, elapsedTime %.2f", buf, 0x34u);

                }
                v61 = 3;
                v763 = 2;
              }
            }
            if (objc_msgSend(v817, "bundleSuperType") == (id)8)
            {
              objc_msgSend(v817, "bundleRecencyDaysElapsed");
              v411 = v410;
              v412 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("maxDaysInRecommendedTabForStateOfMind")));
              objc_msgSend(v412, "floatValue");
              v414 = v411 > v413;

              v415 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              v416 = objc_claimAutoreleasedReturnValue(v415);
              v417 = os_log_type_enabled(v416, OS_LOG_TYPE_INFO);
              if (v414)
              {
                if (v417)
                {
                  v418 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("maxDaysInRecommendedTabForContact")));
                  objc_msgSend(v418, "floatValue");
                  v420 = v419;
                  v421 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                  v422 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                  v423 = objc_msgSend(v817, "bundleSuperType");
                  objc_msgSend(v817, "bundleRecencyDaysElapsed");
                  *(_DWORD *)buf = 134219010;
                  *(double *)&buf[4] = v420;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v421;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)v942 = v422;
                  *(_WORD *)&v942[8] = 2048;
                  *(_QWORD *)&v942[10] = v423;
                  *(_WORD *)&v942[18] = 2048;
                  *(double *)&v942[20] = v424;
                  _os_log_impl((void *)&_mh_execute_header, v416, OS_LOG_TYPE_INFO, "Suggestion was dismissed from Recommended tab because elapsed time >%.2f days: bundleID %@, suggestionID %@,bundleSubType %lu, elapsedTime %.2f, ", buf, 0x34u);

                }
                v61 = 3;
                v763 = 2;
              }
              else if (v417)
              {
                v425 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_curationParameterDict, "objectForKeyedSubscript:", CFSTR("maxDaysInRecommendedTabForContact")));
                objc_msgSend(v425, "floatValue");
                v427 = v426;
                v428 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                v429 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                objc_msgSend(v817, "bundleRecencyDaysElapsed");
                v431 = v430;
                v432 = objc_msgSend(v817, "bundleSuperType");
                *(_DWORD *)buf = 134219266;
                *(double *)&buf[4] = v427;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v428;
                *(_WORD *)&buf[22] = 2112;
                *(_QWORD *)v942 = v429;
                *(_WORD *)&v942[8] = 2048;
                *(double *)&v942[10] = v431;
                *(_WORD *)&v942[18] = 1024;
                *(_DWORD *)&v942[20] = v792;
                *(_WORD *)&v942[24] = 2048;
                *(_QWORD *)&v942[26] = v432;
                _os_log_impl((void *)&_mh_execute_header, v416, OS_LOG_TYPE_INFO, "Suggestion was not dismissed from Recommended tab since elapsed time >%.2f days: bundleID %@, suggestionID %@ elapsedTime %.2f isBundleOrSubBundlesSelectedOrQuickAdded %d, bundleSuperType %lu,", buf, 0x3Au);

              }
            }
            if (((objc_msgSend(v817, "isBundleAggregated") & 1) != 0
               || objc_msgSend(v817, "summarizationGranularity") != (id)1
               || objc_msgSend(v817, "bundleSuperType") == (id)3)
              && objc_msgSend(v817, "bundleSubType") != (id)102)
            {
              goto LABEL_233;
            }
            v433 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            v371 = objc_claimAutoreleasedReturnValue(v433);
            v434 = os_log_type_enabled(v371, OS_LOG_TYPE_INFO);
            if (elapsedDaysSinceOnboardingDate >= v669)
            {
              if (v434)
              {
                v438 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                v439 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v438;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v439;
                _os_log_impl((void *)&_mh_execute_header, v371, OS_LOG_TYPE_INFO, "Fine granularity summary suggestion was set to present only in Recent tab: bundleID %@, suggestionID %@", buf, 0x16u);

              }
              v61 = 3;
              v437 = 2;
            }
            else
            {
              if (v434)
              {
                v435 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                v436 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v435;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v436;
                _os_log_impl((void *)&_mh_execute_header, v371, OS_LOG_TYPE_INFO, "Fine granularity summary suggestion was set to present on Recommended tab to enrich Recommended tab: bundleID %@, suggestionID %@", buf, 0x16u);

              }
              v61 = 1;
              v437 = 1;
            }
            v763 = v437;
LABEL_232:

LABEL_233:
            v661 = (NSSet *)v381;
LABEL_234:
            if (objc_msgSend(v817, "isBundleAggregated")
              && (!objc_msgSend(v817, "summarizationGranularity")
               || objc_msgSend(v817, "summarizationGranularity") == (id)1
               || objc_msgSend(v817, "summarizationGranularity") == (id)2))
            {
              v440 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              v441 = objc_claimAutoreleasedReturnValue(v440);
              if (os_log_type_enabled(v441, OS_LOG_TYPE_INFO))
              {
                v442 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                v443 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                v444 = objc_msgSend(v817, "summarizationGranularity");
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v442;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v443;
                *(_WORD *)&buf[22] = 2048;
                *(_QWORD *)v942 = v444;
                _os_log_impl((void *)&_mh_execute_header, v441, OS_LOG_TYPE_INFO, "Suggestion was rejected due to isBundleAggregated label: bundleID %@, suggestionID %@ summarizationGranularity %lu", buf, 0x20u);

              }
            }
            else
            {
              if (v61 == 4 || !objc_msgSend(v817, "isSensitivePOI"))
              {
LABEL_247:
                if (v794)
                {
                  v452 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                  v453 = objc_claimAutoreleasedReturnValue(v452);
                  if (os_log_type_enabled(v453, OS_LOG_TYPE_INFO))
                  {
                    v454 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                    v455 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                    v456 = objc_msgSend(v817, "bundleSubType");
                    *(_DWORD *)buf = 138412802;
                    *(_QWORD *)&buf[4] = v454;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v455;
                    *(_WORD *)&buf[22] = 2048;
                    *(_QWORD *)v942 = v456;
                    _os_log_impl((void *)&_mh_execute_header, v453, OS_LOG_TYPE_INFO, "Suggestion was rejected due to isBundleOrSubBundleDeleted: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);

                  }
                  if (objc_msgSend(v817, "bundleSubType") == (id)203)
                  {
                    v657 = 0;
                    goto LABEL_271;
                  }
                  v463 = objc_msgSend(v817, "bundleSubType");
                }
                else
                {
                  if (v61 == 4)
                    v457 = 0;
                  else
                    v457 = v792;
                  if (v457 != 1)
                    goto LABEL_273;
                  if ((objc_msgSend(v817, "isBundleAggregated") & 1) != 0
                    || objc_msgSend(v817, "summarizationGranularity") != (id)2)
                  {
                    if (objc_msgSend(v817, "bundleSubType") == (id)303)
                    {
                      v464 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                      v465 = objc_claimAutoreleasedReturnValue(v464);
                      if (os_log_type_enabled(v465, OS_LOG_TYPE_INFO))
                      {
                        v466 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                        v467 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                        v468 = objc_msgSend(v817, "bundleSubType");
                        *(_DWORD *)buf = 138412802;
                        *(_QWORD *)&buf[4] = v466;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = v467;
                        *(_WORD *)&buf[22] = 2048;
                        *(_QWORD *)v942 = v468;
                        _os_log_impl((void *)&_mh_execute_header, v465, OS_LOG_TYPE_INFO, "Contact trend bundle got rejected due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);

                      }
                    }
                    else
                    {
                      v469 = objc_msgSend(v817, "bundleSubType") == (id)203;
                      v470 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                      v465 = objc_claimAutoreleasedReturnValue(v470);
                      v471 = os_log_type_enabled(v465, OS_LOG_TYPE_INFO);
                      if (!v469)
                      {
                        if (v471)
                        {
                          v487 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                          v488 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                          v489 = objc_msgSend(v817, "bundleSubType");
                          *(_DWORD *)buf = 134219522;
                          *(_QWORD *)&buf[4] = v763;
                          *(_WORD *)&buf[12] = 2048;
                          *(_QWORD *)&buf[14] = v61;
                          *(_WORD *)&buf[22] = 2048;
                          *(_QWORD *)v942 = 2;
                          *(_WORD *)&v942[8] = 2048;
                          *(_QWORD *)&v942[10] = 3;
                          *(_WORD *)&v942[18] = 2112;
                          *(_QWORD *)&v942[20] = v487;
                          *(_WORD *)&v942[28] = 2112;
                          *(_QWORD *)&v942[30] = v488;
                          v943 = 2048;
                          v944 = v489;
                          _os_log_impl((void *)&_mh_execute_header, v465, OS_LOG_TYPE_INFO, "(rankingCategory,visibilityCategory) were updated from (%lu,%lu) to (%lu,%lu) due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@, bundleSubType %lu", buf, 0x48u);

                        }
                        v61 = 3;
                        v475 = 2;
                        goto LABEL_272;
                      }
                      if (v471)
                      {
                        v472 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                        v473 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                        v474 = objc_msgSend(v817, "bundleSubType");
                        *(_DWORD *)buf = 138412802;
                        *(_QWORD *)&buf[4] = v472;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = v473;
                        *(_WORD *)&buf[22] = 2048;
                        *(_QWORD *)v942 = v474;
                        _os_log_impl((void *)&_mh_execute_header, v465, OS_LOG_TYPE_INFO, "Workout routine bundle got rejected due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);

                      }
                    }

LABEL_271:
                    v61 = 4;
                    v475 = 3;
LABEL_272:
                    v763 = v475;
LABEL_273:
                    if ((objc_msgSend(v817, "isWorkVisit") & 1) == 0
                      && !objc_msgSend(v817, "isShortVisit"))
                    {
                      goto LABEL_121;
                    }
                    objc_msgSend(v817, "numPhotoAssetsResourcesNormalized");
                    if (v476 != 0.0)
                      goto LABEL_121;
                    v477 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                    v254 = objc_claimAutoreleasedReturnValue(v477);
                    if (os_log_type_enabled(v254, OS_LOG_TYPE_INFO))
                    {
                      v478 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                      v479 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                      v480 = objc_msgSend(v817, "isWorkVisit");
                      v481 = objc_msgSend(v817, "isShortVisit");
                      *(_DWORD *)buf = 138413058;
                      *(_QWORD *)&buf[4] = v478;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v479;
                      *(_WORD *)&buf[22] = 1024;
                      *(_DWORD *)v942 = v480;
                      *(_WORD *)&v942[4] = 1024;
                      *(_DWORD *)&v942[6] = v481;
                      _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_INFO, "Outing suggestion was rejected because it was either work or short visit (or both) without any photo: bundleID %@, suggestionID %@ isWorkVisit %d isShortVisit %d", buf, 0x22u);

                    }
                    v728 = 1;
LABEL_128:
                    v763 = 3;
                    v61 = 4;
                    goto LABEL_129;
                  }
                  v458 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                  v459 = objc_claimAutoreleasedReturnValue(v458);
                  if (os_log_type_enabled(v459, OS_LOG_TYPE_INFO))
                  {
                    v460 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                    v461 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                    v462 = objc_msgSend(v817, "bundleSubType");
                    *(_DWORD *)buf = 138412802;
                    *(_QWORD *)&buf[4] = v460;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v461;
                    *(_WORD *)&buf[22] = 2048;
                    *(_QWORD *)v942 = v462;
                    _os_log_impl((void *)&_mh_execute_header, v459, OS_LOG_TYPE_INFO, "Coarse summary suggestion got rejected due to isBundleOrSubBundlesSelectedOrQuickAdded: bundleID %@, suggestionID %@ bundleSubType %lu", buf, 0x20u);

                  }
                  v463 = objc_msgSend(v817, "bundleSubType");
                }
                v659 = (v463 != (id)202) & v659;
                goto LABEL_271;
              }
              v446 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              v441 = objc_claimAutoreleasedReturnValue(v446);
              v447 = os_log_type_enabled(v441, OS_LOG_TYPE_INFO);
              if (v61 != 2)
              {
                if (v447)
                {
                  v482 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                  v483 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                  v484 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleStartDate"));
                  v485 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleEndDate"));
                  *(_DWORD *)buf = 138413058;
                  *(_QWORD *)&buf[4] = v482;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v483;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)v942 = v484;
                  *(_WORD *)&v942[8] = 2112;
                  *(_QWORD *)&v942[10] = v485;
                  _os_log_impl((void *)&_mh_execute_header, v441, OS_LOG_TYPE_INFO, "Suggestion was set to recent only since it contains sensitive POI: bundleID %@, suggestionID %@ startDate %@ endDate %@", buf, 0x2Au);

                }
                v61 = 3;
                v445 = 2;
                goto LABEL_241;
              }
              if (v447)
              {
                v448 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                v449 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
                v450 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleStartDate"));
                v451 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleEndDate"));
                *(_DWORD *)buf = 138413058;
                *(_QWORD *)&buf[4] = v448;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v449;
                *(_WORD *)&buf[22] = 2112;
                *(_QWORD *)v942 = v450;
                *(_WORD *)&v942[8] = 2112;
                *(_QWORD *)&v942[10] = v451;
                _os_log_impl((void *)&_mh_execute_header, v441, OS_LOG_TYPE_INFO, "Suggestion (recommended only) was rejected since it contains sensitive POI: bundleID %@, suggestionID %@ startDate %@ endDate %@", buf, 0x2Au);

              }
            }
            v61 = 4;
            v445 = 3;
LABEL_241:
            v763 = v445;

            goto LABEL_247;
          }
          v315 = -1.0;
          if (objc_msgSend(v817, "bundleSubType") == (id)105)
          {
            v60 = 0;
            v59 = 1;
LABEL_161:
            v64 = -1.0;
            goto LABEL_169;
          }
          if (objc_msgSend(v817, "bundleSubType") == (id)201)
          {
            v326 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v327 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v326, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThresholdForWorkoutSubtype")));
            objc_msgSend(v327, "floatValue");
            v64 = v328;

            v329 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v330 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "objectForKeyedSubscript:", CFSTR("suggestionRecommendThresholdForWorkoutSubtype")));
            objc_msgSend(v330, "floatValue");
            v315 = v331;

            v332 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v333 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v332, "objectForKeyedSubscript:", CFSTR("summarizationThresholdForWorkoutSubType")));
            objc_msgSend(v333, "floatValue");
            v335 = v334;

            v336 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v337 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v336, "objectForKeyedSubscript:", CFSTR("tripSummarizationThresholdForWorkoutSubType")));
            objc_msgSend(v337, "floatValue");
            v339 = v338;

            v60 = v62 > v335;
            v59 = v62 > v339;
            goto LABEL_169;
          }
          v341 = (void *)phoneSensedWalkingVariants;
          v342 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleSubType")));
          LODWORD(v341) = objc_msgSend(v341, "containsObject:", v342);

          if ((_DWORD)v341)
          {
            v343 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v344 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v343, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThresholdForMotionActivityWalkingSubtype")));
            objc_msgSend(v344, "floatValue");
            v64 = v345;

            v346 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v347 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v346, "objectForKeyedSubscript:", CFSTR("suggestionRecommendThresholdForMotionActivityWalkingSubtype")));
            objc_msgSend(v347, "floatValue");
            v315 = v348;

            v349 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
            v350 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v349, "objectForKeyedSubscript:", CFSTR("summarizationThresholdForMotionActivityWalkingSubType")));
            objc_msgSend(v350, "floatValue");
            v352 = v62 > v351;

            if (v352)
            {
              v59 = 0;
              v60 = 1;
              goto LABEL_169;
            }
          }
          else
          {
            if (objc_msgSend(v817, "bundleSubType") == (id)202)
            {
              v353 = objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleStartDate"));

              v354 = objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleEndDate"));
              v355 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
              v356 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v355, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThresholdForWorkoutWeeklySummarySubType")));
              objc_msgSend(v356, "floatValue");
              v64 = v357;

              v358 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
              v359 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v358, "objectForKeyedSubscript:", CFSTR("suggestionRecommendThresholdForWorkoutWeeklySummarySubType")));
              objc_msgSend(v359, "floatValue");
              v315 = v360;

              v59 = 0;
              v60 = 0;
              v654 = (NSDate *)v354;
              v655 = (NSDate *)v353;
              goto LABEL_169;
            }
            if (objc_msgSend(v817, "bundleSubType") == (id)301 || objc_msgSend(v817, "bundleSubType") == (id)303)
            {
              v490 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
              v491 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v490, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThresholdForContactSubType")));
              objc_msgSend(v491, "floatValue");
              v64 = v492;

              v493 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
              v494 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v493, "objectForKeyedSubscript:", CFSTR("suggestionRecommendThresholdForContactSubType")));
              objc_msgSend(v494, "floatValue");
              v315 = v495;

            }
            else if (objc_msgSend(v817, "bundleSubType") == (id)302)
            {
              v496 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
              v497 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v496, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThresholdForContactWeeklySummarySubType")));
              objc_msgSend(v497, "floatValue");
              v64 = v498;

              v499 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
              v500 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v499, "objectForKeyedSubscript:", CFSTR("suggestionRecommendThresholdForContactWeeklySummarySubType")));
              objc_msgSend(v500, "floatValue");
              v315 = v501;

            }
            else
            {
              v502 = (void *)dailyMediaSubtypeVariants;
              v503 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleSubType")));
              LODWORD(v502) = objc_msgSend(v502, "containsObject:", v503);

              if ((_DWORD)v502)
              {
                v504 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
                v505 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v504, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThresholdForDailyMediaVariants")));
                objc_msgSend(v505, "floatValue");
                v64 = v506;

                v507 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
                v508 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v507, "objectForKeyedSubscript:", CFSTR("suggestionRecommendThresholdForDailyMediaVariants")));
                objc_msgSend(v508, "floatValue");
                v315 = v509;

              }
              else
              {
                v510 = (void *)MediaWeeklySummarySubtypeVariants;
                v511 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleSubType")));
                LODWORD(v510) = objc_msgSend(v510, "containsObject:", v511);

                if ((_DWORD)v510)
                {
                  v512 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
                  v513 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v512, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThresholdForWeeklyMediaSummaryVariants")));
                  objc_msgSend(v513, "floatValue");
                  v64 = v514;

                  v515 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
                  v516 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v515, "objectForKeyedSubscript:", CFSTR("suggestionRecommendThresholdForWeeklyMediaSummaryVariants")));
                  objc_msgSend(v516, "floatValue");
                  v315 = v517;

                }
                else
                {
                  v518 = (void *)timeAtHomeSubtypeVariants;
                  v519 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleSubType")));
                  LODWORD(v518) = objc_msgSend(v518, "containsObject:", v519);

                  if (!(_DWORD)v518)
                  {
                    v59 = 0;
                    v60 = 0;
                    goto LABEL_161;
                  }
                  v520 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
                  v521 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v520, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThresholdForTimeAtHomeSubTypeVariants")));
                  objc_msgSend(v521, "floatValue");
                  v64 = v522;

                  v523 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
                  v524 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v523, "objectForKeyedSubscript:", CFSTR("suggestionRecommendThresholdForTimeAtHomeSubTypeVariants")));
                  objc_msgSend(v524, "floatValue");
                  v315 = v525;

                }
              }
            }
          }
LABEL_158:
          v59 = 0;
          v60 = 0;
          goto LABEL_169;
        }
        if (objc_msgSend(v817, "bundleInterfaceType") == (id)11
          && (objc_msgSend(v817, "evergreenPromptExists") & 1) == 0)
        {
          v257 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v258 = objc_claimAutoreleasedReturnValue(v257);
          if (os_log_type_enabled(v258, OS_LOG_TYPE_INFO))
          {
            v259 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
            v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v259;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v260;
            _os_log_impl((void *)&_mh_execute_header, v258, OS_LOG_TYPE_INFO, "Evergreen suggestion got rejected because prompt doesn't exist: bundleID %@, suggestionID %@", buf, 0x16u);

          }
          v61 = 4;
          v252 = 3;
        }
        else
        {
          v61 = 2;
          v252 = 1;
        }
        v763 = v252;
        v59 = 0;
        v63 = -1.0;
        if (objc_msgSend(v817, "bundleInterfaceType") == (id)10 && v792 | v794)
        {
          v261 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v254 = objc_claimAutoreleasedReturnValue(v261);
          v64 = -1.0;
          if (os_log_type_enabled(v254, OS_LOG_TYPE_INFO))
          {
            v262 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
            v263 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v262;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v263;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)v942 = v792;
            *(_WORD *)&v942[4] = 1024;
            *(_DWORD *)&v942[6] = v794;
            _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_INFO, "Photo Memory suggestion got rejected due to engagement signal: bundleID %@, suggestionID %@, isBundleOrSubBundlesSelectedOrQuickAdded %d, isBundleOrSubBundleDeleted %d", buf, 0x22u);

          }
          v60 = 0;
          v59 = 0;
          v728 = 0;
          goto LABEL_128;
        }
        v60 = 0;
        v64 = -1.0;
LABEL_121:
        if ((unint64_t)(v61 - 1) > 1 || objc_msgSend(v817, "bundleInterfaceType") == (id)11)
        {
          v728 = 0;
          goto LABEL_130;
        }
        v303 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleInterfaceType")));
        v304 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v667, "objectForKeyedSubscript:", v303));
        v305 = objc_msgSend(v304, "intValue");

        v254 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v305 + 1));
        v306 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleInterfaceType")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v667, "setObject:forKeyedSubscript:", v254, v306);

        v728 = 0;
LABEL_129:

LABEL_130:
        v267 = -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](self->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("EventManagerOverridePatternRehydrationFailureCountThreshold"), 10);
        v914 = 0u;
        v913 = 0u;
        v912 = 0u;
        v911 = 0u;
        v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "events"));
        v269 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v911, v940, 16);
        if (v269)
        {
          v270 = *(_QWORD *)v912;
          v271 = v267;
          do
          {
            for (k = 0; k != v269; k = (char *)k + 1)
            {
              if (*(_QWORD *)v912 != v270)
                objc_enumerationMutation(v268);
              v273 = *(void **)(*((_QWORD *)&v911 + 1) + 8 * (_QWORD)k);
              if ((unint64_t)objc_msgSend(v273, "rehydrationFailCount") >= v271)
              {
                v274 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
                v275 = objc_claimAutoreleasedReturnValue(v274);
                if (os_log_type_enabled(v275, OS_LOG_TYPE_INFO))
                {
                  v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
                  v277 = objc_msgSend(v273, "rehydrationFailCount");
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v276;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = v277;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)v942 = v273;
                  _os_log_impl((void *)&_mh_execute_header, v275, OS_LOG_TYPE_INFO, "rejecting bundle %@ due to rehydration failures count bigger than threshold, %lu, in event %@", buf, 0x20u);

                }
                v61 = 4;
              }
            }
            v269 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v911, v940, 16);
          }
          while (v269);
        }

        if (v61 != 4)
        {
          v278 = objc_msgSend(v817, "bundleInterfaceType");
          v279 = v666;
          if (v278 != (id)11)
            v279 = v666 + 1;
          v666 = v279;
        }

LABEL_146:
        if (v65 > 1.0)
          v65 = 1.0;
        v938[0] = CFSTR("richnessScore");
        *(float *)&v50 = v67;
        v812 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v50));
        v939[0] = v812;
        v938[1] = CFSTR("distinctnessScore");
        *(float *)&v280 = v803;
        v807 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v280));
        v939[1] = v807;
        v938[2] = CFSTR("heuristicsScore");
        *(float *)&v281 = v787;
        v798 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v281));
        v939[2] = v798;
        v938[3] = CFSTR("qualityScore");
        *(float *)&v282 = v778;
        v790 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v282));
        v939[3] = v790;
        v938[4] = CFSTR("engagementScore");
        *(float *)&v283 = v783;
        v784 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v283));
        *(float *)&v284 = fmaxf(v66, 0.0);
        v939[4] = v784;
        v938[5] = CFSTR("baseScore");
        v781 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v284));
        v939[5] = v781;
        v938[6] = CFSTR("bundleInterfaceType");
        v777 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleInterfaceType")));
        v939[6] = v777;
        v938[7] = CFSTR("bundleSubType");
        v774 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleSubType")));
        v939[7] = v774;
        v938[8] = CFSTR("bundleSuperType");
        v771 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v817, "bundleSuperType")));
        v939[8] = v771;
        v938[9] = CFSTR("decayFactor");
        *(float *)&v285 = v65;
        v768 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v285));
        v939[9] = v768;
        v938[10] = CFSTR("rankingCategory");
        v765 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v763));
        v939[10] = v765;
        v938[11] = CFSTR("visibilityCategoryForUI");
        v762 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v61));
        v939[11] = v762;
        v938[12] = CFSTR("viewCountBasedScoreAdjustment");
        LODWORD(v286) = 0;
        v760 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v286));
        v939[12] = v760;
        v938[13] = CFSTR("bundleGoodnessScore");
        *(float *)&v287 = v62;
        v758 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v287));
        v939[13] = v758;
        v938[14] = CFSTR("elapsedDaysFromBundleEndDate");
        objc_msgSend(v817, "bundleRecencyDaysElapsed");
        v756 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
        v939[14] = v756;
        v938[15] = CFSTR("bundleIdentifier");
        v754 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleIdentifier"));
        v939[15] = v754;
        v938[16] = CFSTR("suggestionIdentifier");
        v752 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "suggestionIdentifier"));
        v939[16] = v752;
        v939[17] = &off_1002DAC10;
        v938[17] = CFSTR("isDuplicated");
        v938[18] = CFSTR("isEligibleForTimeContextSummarization");
        v750 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v60));
        v939[18] = v750;
        v938[19] = CFSTR("isEligibleForTripSummarization");
        v748 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v59));
        v939[19] = v748;
        v939[20] = &off_1002DAC10;
        v938[20] = CFSTR("isPseudoDupInRecommendedTab");
        v938[21] = CFSTR("isPseudoDupInRecentTab");
        v939[21] = &off_1002DAC10;
        v939[22] = &off_1002DAC10;
        v938[22] = CFSTR("isWithinHoldOffPeriod");
        v938[23] = CFSTR("allPlaceNamesSet");
        v746 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "allPlaceNames"));
        v939[23] = v746;
        v938[24] = CFSTR("workoutTypesSet");
        v744 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "workoutTypes"));
        v939[24] = v744;
        v938[25] = CFSTR("allContactIdentifiersSet");
        v742 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "allContactIdentifiers"));
        v939[25] = v742;
        v938[26] = CFSTR("allStateOfMindIdentifiersSet");
        v740 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "allStateOfMindIdentifiers"));
        v939[26] = v740;
        v938[27] = CFSTR("stateOfMindLoggedIn3pApp");
        objc_msgSend(v817, "stateOfMindLoggedIn3pApp");
        v738 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
        v939[27] = v738;
        v938[28] = CFSTR("stateOfMindLoggedInJournalApp");
        objc_msgSend(v817, "stateOfMindLoggedInJournalApp");
        v736 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
        v939[28] = v736;
        v938[29] = CFSTR("numAnomalyEventsNormalized");
        objc_msgSend(v817, "numAnomalyEventsNormalized");
        v734 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
        v939[29] = v734;
        v938[30] = CFSTR("numPhotoAssetsResourcesNormalized");
        objc_msgSend(v817, "numPhotoAssetsResourcesNormalized");
        v288 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
        v939[30] = v288;
        v938[31] = CFSTR("isCoarseGranularitySummaryKey");
        v290 = (objc_msgSend(v817, "isBundleAggregated") & 1) == 0
            && objc_msgSend(v817, "summarizationGranularity") == (id)2;
        *(float *)&v289 = elapsedDaysSinceOnboardingDate;
        v291 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v290, v289));
        v939[31] = v291;
        v938[32] = CFSTR("isBundleOrSubBundleDeleted");
        v292 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v794));
        v939[32] = v292;
        v938[33] = CFSTR("isBundleOrSubBundlesSelectedOrQuickAdded");
        v293 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v792));
        v939[33] = v293;
        v938[34] = CFSTR("bundleStartDate");
        v294 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleStartDate"));
        v939[34] = v294;
        v938[35] = CFSTR("bundleEndDate");
        v295 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "bundleEndDate"));
        v939[35] = v295;
        v938[36] = CFSTR("suppressCoarseSummarization");
        v296 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", elapsedDaysSinceOnboardingDate < v669));
        v939[36] = v296;
        v938[37] = CFSTR("suggestionAcceptThreshold");
        *(float *)&v297 = v64;
        v298 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v297));
        v939[37] = v298;
        v938[38] = CFSTR("suggestionRecommendThreshold");
        *(float *)&v299 = v63;
        v300 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v299));
        v939[38] = v300;
        v938[39] = CFSTR("kRejectedByVisitHeuristicsFilter");
        v301 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v728));
        v939[39] = v301;
        v818 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v939, v938, 40));

        v302 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _checkAndUpdateNumericLimits:](self, "_checkAndUpdateNumericLimits:", v818));
        -[NSMutableArray addObject:](v671, "addObject:", v302);

        v30 = v730 + 1;
        if ((id)(v730 + 1) != v672)
          continue;
        break;
      }
      v526 = objc_msgSend(v665, "countByEnumeratingWithState:objects:count:", &v921, v947, 16);
      v672 = v526;
      if (v526)
        continue;
      break;
    }
LABEL_301:

    v527 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v667, "allValues"));
    v528 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v527, "valueForKeyPath:", CFSTR("@sum.self")));
    v529 = objc_msgSend(v528, "intValue");

    v530 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v531 = objc_claimAutoreleasedReturnValue(v530);
    v26 = v529;
    if (os_log_type_enabled(v531, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v666;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v529;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)v942 = v658;
      _os_log_impl((void *)&_mh_execute_header, v531, OS_LOG_TYPE_INFO, "Current allowed sensed bundle count=%lu, total sensed bundle count in Recommended tab =%lu, minimum sensed bundle count threshold in Recommended tab %lu", buf, 0x20u);
    }

    if (v666)
    {
      if (v666 != v529)
      {
        if (v658 <= v529)
        {
          v6 = v667;
        }
        else
        {
          v6 = objc_opt_new(NSMutableDictionary);

          v532 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v533 = objc_claimAutoreleasedReturnValue(v532);
          if (os_log_type_enabled(v533, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v658;
            *(_WORD *)&buf[22] = 2048;
            *(double *)v942 = v660;
            _os_log_impl((void *)&_mh_execute_header, v533, OS_LOG_TYPE_INFO, "Sensed suggestion count in Recommended tab (%lu) is less than required (%lu). Setting lower recommended threshold %f ", buf, 0x20u);
          }

        }
        v27 = v660 + -0.25;
        if ((float)(v660 + -0.25) < 0.0)
        {
          v534 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v535 = objc_claimAutoreleasedReturnValue(v534);
          if (os_log_type_enabled(v535, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v658;
            _os_log_impl((void *)&_mh_execute_header, v535, OS_LOG_TYPE_INFO, "Recommendation threshold is set to rejection threshold, but still can't satisfy minimum suggestion count requirement (%lu). continue", buf, 0xCu);
          }
          v667 = v6;
          break;
        }
        continue;
      }
      v537 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v535 = objc_claimAutoreleasedReturnValue(v537);
      if (os_log_type_enabled(v535, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v535, OS_LOG_TYPE_INFO, "Labeled all unrejected bundles to be shown on Recommended tab", buf, 2u);
      }
      v26 = v666;
    }
    else
    {
      v536 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v535 = objc_claimAutoreleasedReturnValue(v536);
      if (os_log_type_enabled(v535, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v535, OS_LOG_TYPE_INFO, "No bundle available for the sheet", buf, 2u);
      }
    }
    break;
  }

LABEL_321:
  v538 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v539 = objc_claimAutoreleasedReturnValue(v538);
  if (os_log_type_enabled(v539, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.6(v657 & 1, v659 & 1, v539);

  v540 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v541 = objc_claimAutoreleasedReturnValue(v540);
  if (os_log_type_enabled(v541, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.5();

  if ((v657 & v659 & 1) != 0)
  {
    if (-[NSSet isEqualToSet:](v656, "isEqualToSet:", v661))
    {
      v542 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v543 = objc_claimAutoreleasedReturnValue(v542);
      if (os_log_type_enabled(v543, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v543, OS_LOG_TYPE_INFO, "Both Workout Routine and weekly workout summary are eligible for recommended tab. Tagging weekly summary to be suppressed downstream.", buf, 2u);
      }

      LOBYTE(v659) = 0;
    }
    else
    {
      LOBYTE(v659) = 1;
    }
  }
  frequencyPenalty = self->_frequencyPenalty;
  v819 = objc_opt_new(NSMutableDictionary);
  v910 = 0u;
  v909 = 0u;
  v908 = 0u;
  v907 = 0u;
  v545 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v667, "allKeys"));
  v546 = objc_msgSend(v545, "countByEnumeratingWithState:objects:count:", &v907, v937, 16);
  if (v546)
  {
    v547 = log((float)(frequencyPenalty + 1.0));
    v548 = *(_QWORD *)v908;
    v549 = v547;
    do
    {
      for (m = 0; m != v546; m = (char *)m + 1)
      {
        if (*(_QWORD *)v908 != v548)
          objc_enumerationMutation(v545);
        v551 = *(_QWORD *)(*((_QWORD *)&v907 + 1) + 8 * (_QWORD)m);
        if (v26)
        {
          v552 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v667, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v907 + 1) + 8 * (_QWORD)m)));
          objc_msgSend(v552, "floatValue");
          v554 = v553;

          v555 = log((float)((float)(self->_frequencyPenalty * (float)(1.0 - (float)(v554 / (float)v26))) + 1.0)) / v549;
          *(float *)&v555 = v555;
          v556 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", (double)v555));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v819, "setObject:forKeyedSubscript:", v556, v551);

        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v819, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v907 + 1) + 8 * (_QWORD)m));
        }
      }
      v546 = objc_msgSend(v545, "countByEnumeratingWithState:objects:count:", &v907, v937, 16);
    }
    while (v546);
  }

  v557 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v558 = objc_claimAutoreleasedReturnValue(v557);
  if (os_log_type_enabled(v558, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.4();

  v559 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v560 = objc_claimAutoreleasedReturnValue(v559);
  if (os_log_type_enabled(v560, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.3();

  v561 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v819, "allKeys"));
  v799 = objc_msgSend(v561, "count");

  v813 = objc_opt_new(NSMutableArray);
  v906 = 0u;
  v905 = 0u;
  v904 = 0u;
  v903 = 0u;
  v808 = v671;
  v562 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v808, "countByEnumeratingWithState:objects:count:", &v903, v936, 16);
  if (v562)
  {
    v563 = 0;
    v564 = *(_QWORD *)v904;
    do
    {
      for (n = 0; n != v562; n = (char *)n + 1)
      {
        if (*(_QWORD *)v904 != v564)
          objc_enumerationMutation(v808);
        v566 = *(void **)(*((_QWORD *)&v903 + 1) + 8 * (_QWORD)n);
        v567 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v566, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
        v568 = objc_msgSend(v567, "intValue");

        v569 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v566, "objectForKeyedSubscript:", CFSTR("bundleInterfaceType")));
        v570 = v569;
        if (v568 - 1 > 1)
        {
          v583 = 0.0;
          v573 = 1.0;
          if (objc_msgSend(v569, "intValue") != 11)
            goto LABEL_361;
        }
        else
        {
          v571 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v819, "objectForKeyedSubscript:", v569));
          objc_msgSend(v571, "floatValue");
          v573 = v572;

          if (v799 == (id)1)
            v573 = 1.0;
          if (objc_msgSend(v570, "intValue") != 11)
          {
            v574 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v566, "objectForKeyedSubscript:", CFSTR("baseScore")));
            objc_msgSend(v574, "floatValue");
            v576 = v575;
            v577 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v566, "objectForKeyedSubscript:", CFSTR("viewCountBasedScoreAdjustment")));
            objc_msgSend(v577, "floatValue");
            v579 = v578;

            if ((float)(v576 + v579) >= 0.0)
              v580 = v576 + v579;
            else
              v580 = 0.0;
            v581 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v566, "objectForKeyedSubscript:", CFSTR("decayFactor")));
            objc_msgSend(v581, "floatValue");
            v583 = v573 * (float)(v580 * v582);
            goto LABEL_360;
          }
        }
        v581 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v566, "objectForKeyedSubscript:", CFSTR("baseScore")));
        objc_msgSend(v581, "floatValue");
        v583 = v584;
LABEL_360:

LABEL_361:
        v585 = objc_opt_new(NSMutableDictionary);
        -[NSMutableDictionary addEntriesFromDictionary:](v585, "addEntriesFromDictionary:", v566);
        *(float *)&v586 = v583;
        v587 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v586));
        -[NSMutableDictionary setObject:forKey:](v585, "setObject:forKey:", v587, CFSTR("rankingScore"));

        *(float *)&v588 = v573;
        v589 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v588));
        -[NSMutableDictionary setObject:forKey:](v585, "setObject:forKey:", v589, CFSTR("diversityCoefficient"));

        v590 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)n + v563));
        -[NSMutableDictionary setObject:forKey:](v585, "setObject:forKey:", v590, CFSTR("rankingDictionaryIndex"));

        -[NSMutableArray addObject:](v813, "addObject:", v585);
      }
      v562 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v808, "countByEnumeratingWithState:objects:count:", &v903, v936, 16);
      v563 += (uint64_t)n;
    }
    while (v562);
  }

  v800 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v591 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v592 = objc_claimAutoreleasedReturnValue(v591);
  if (os_log_type_enabled(v592, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.2();

  v593 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v800, "components:fromDate:", 28, v731));
  v594 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v800, "dateFromComponents:", v593));

  v782 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v800, "components:fromDate:", 28, v732));
  v595 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v800, "dateFromComponents:", v782));

  v795 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v800, "dateByAddingUnit:value:toDate:options:", 16, 1, v595, 0));
  v793 = objc_opt_new(NSMutableDictionary);
  v785 = v594;
  v596 = v785;
  if (objc_msgSend(v785, "compare:", v795) == (id)-1)
  {
    v596 = v785;
    do
    {
      v635 = v596;
      v636 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v800, "dateByAddingUnit:value:toDate:options:", 16, 1, v635, 0));
      v900[0] = _NSConcreteStackBlock;
      v900[1] = 3221225472;
      v900[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke;
      v900[3] = &unk_1002B4790;
      v637 = v635;
      v901 = v637;
      v638 = v636;
      v902 = v638;
      v639 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v900));
      v640 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray filteredArrayUsingPredicate:](v813, "filteredArrayUsingPredicate:", v639));
      v641 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v642 = objc_claimAutoreleasedReturnValue(v641);
      if (os_log_type_enabled(v642, OS_LOG_TYPE_DEBUG))
      {
        v651 = objc_msgSend(v640, "count");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v637;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v638;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)v942 = v651;
        _os_log_debug_impl((void *)&_mh_execute_header, v642, OS_LOG_TYPE_DEBUG, "RankingDict count between %@-%@:%lu", buf, 0x20u);
      }

      v643 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("visibilityCategoryForUI"), &off_1002DCAB8));
      v644 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v640, "filteredArrayUsingPredicate:", v643));

      v645 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v646 = objc_claimAutoreleasedReturnValue(v645);
      if (os_log_type_enabled(v646, OS_LOG_TYPE_DEBUG))
        -[MOEventBundleRanking _calculateRankingScore:withMinRecommendedBundleCountRequirement:].cold.1((uint64_t)v935, (uint64_t)v644);

      v647 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("bundleGoodnessScore"), 0));
      v648 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v647));
      v649 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v644, "sortedArrayUsingDescriptors:", v648));

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)v942 = __Block_byref_object_copy__30;
      *(_QWORD *)&v942[8] = __Block_byref_object_dispose__30;
      *(_QWORD *)&v942[16] = objc_opt_new(NSMutableSet);
      v880 = 0;
      v881 = &v880;
      v882 = 0x2020000000;
      v883 = 0;
      v874 = 0;
      v875 = &v874;
      v876 = 0x2020000000;
      LOBYTE(v877) = 0;
      v894[0] = _NSConcreteStackBlock;
      v894[1] = 3221225472;
      v894[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_741;
      v894[3] = &unk_1002B47B8;
      v894[4] = self;
      v895 = v793;
      v650 = v813;
      v896 = v650;
      v897 = buf;
      v898 = &v880;
      v899 = &v874;
      objc_msgSend(v649, "enumerateObjectsUsingBlock:", v894);
      if (*((_BYTE *)v875 + 24) && v881[3] >= 2)
      {
        v892[0] = _NSConcreteStackBlock;
        v892[1] = 3221225472;
        v892[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_745;
        v892[3] = &unk_1002B47E0;
        v893 = v650;
        objc_msgSend(v649, "enumerateObjectsUsingBlock:", v892);

      }
      _Block_object_dispose(&v874, 8);
      _Block_object_dispose(&v880, 8);
      _Block_object_dispose(buf, 8);

      v596 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v800, "dateByAddingUnit:value:toDate:options:", 16, 1, v637, 0));
    }
    while (objc_msgSend(v596, "compare:", v795) == (id)-1);
  }

  v815 = objc_opt_new(NSMutableArray);
  v791 = v785;
  v597 = v791;
  if (objc_msgSend(v791, "compare:", v795) == (id)-1)
  {
    v597 = v791;
    do
    {
      v598 = v597;
      v599 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v800, "dateByAddingUnit:value:toDate:options:", 16, 1, v598, 0));
      v889[0] = _NSConcreteStackBlock;
      v889[1] = 3221225472;
      v889[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_746;
      v889[3] = &unk_1002B4790;
      v600 = v598;
      v890 = v600;
      v601 = v599;
      v891 = v601;
      v602 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v889));
      v603 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray filteredArrayUsingPredicate:](v813, "filteredArrayUsingPredicate:", v602));
      v604 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("visibilityCategoryForUI"), &off_1002DCAD0));
      v605 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v603, "filteredArrayUsingPredicate:", v604));

      v606 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("bundleStartDate"), 0));
      v607 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v606));
      v608 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v605, "sortedArrayUsingDescriptors:", v607));

      v887[0] = _NSConcreteStackBlock;
      v887[1] = 3221225472;
      v887[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_2;
      v887[3] = &unk_1002B47E0;
      v888 = v815;
      objc_msgSend(v608, "enumerateObjectsUsingBlock:", v887);

      v597 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v800, "dateByAddingUnit:value:toDate:options:", 16, 1, v600, 0));
    }
    while (objc_msgSend(v597, "compare:", v795) == (id)-1);
  }

  v786 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("rankingScore"), 0));
  v609 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v786));
  v610 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v813, "sortedArrayUsingDescriptors:", v609));
  v611 = objc_msgSend(v610, "mutableCopy");

  v886[0] = 0;
  v886[1] = v886;
  v886[2] = 0x2020000000;
  v886[3] = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)v942 = __Block_byref_object_copy__30;
  *(_QWORD *)&v942[8] = __Block_byref_object_dispose__30;
  *(_QWORD *)&v942[16] = objc_opt_new(NSMutableSet);
  v880 = 0;
  v881 = &v880;
  v882 = 0x3032000000;
  v883 = __Block_byref_object_copy__30;
  v884 = __Block_byref_object_dispose__30;
  v885 = objc_opt_new(NSMutableSet);
  v874 = 0;
  v875 = &v874;
  v876 = 0x3032000000;
  v877 = __Block_byref_object_copy__30;
  v878 = __Block_byref_object_dispose__30;
  v879 = objc_opt_new(NSMutableSet);
  v872[0] = 0;
  v872[1] = v872;
  v872[2] = 0x3032000000;
  v872[3] = __Block_byref_object_copy__30;
  v872[4] = __Block_byref_object_dispose__30;
  v873 = objc_opt_new(NSMutableSet);
  v870[0] = 0;
  v870[1] = v870;
  v870[2] = 0x3032000000;
  v870[3] = __Block_byref_object_copy__30;
  v870[4] = __Block_byref_object_dispose__30;
  v871 = objc_opt_new(NSMutableSet);
  v868[0] = 0;
  v868[1] = v868;
  v868[2] = 0x3032000000;
  v868[3] = __Block_byref_object_copy__30;
  v868[4] = __Block_byref_object_dispose__30;
  v869 = objc_opt_new(NSMutableSet);
  v862 = 0;
  v863 = &v862;
  v864 = 0x3032000000;
  v865 = __Block_byref_object_copy__30;
  v866 = __Block_byref_object_dispose__30;
  v867 = objc_opt_new(NSMutableDictionary);
  v858 = 0;
  v859 = &v858;
  v860 = 0x2020000000;
  v861 = 0;
  v854 = 0;
  v855 = &v854;
  v856 = 0x2020000000;
  v857 = 0;
  v850 = 0;
  v851 = &v850;
  v852 = 0x2020000000;
  v853 = 0;
  v848[0] = 0;
  v848[1] = v848;
  v848[2] = 0x2020000000;
  v849 = 0;
  v846[0] = 0;
  v846[1] = v846;
  v846[2] = 0x2020000000;
  v847 = 0;
  v844[0] = 0;
  v844[1] = v844;
  v844[2] = 0x2020000000;
  v845 = 0;
  v824[0] = _NSConcreteStackBlock;
  v824[1] = 3221225472;
  v824[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3;
  v824[3] = &unk_1002B4808;
  v829 = buf;
  v830 = &v880;
  v831 = &v874;
  v832 = &v854;
  v612 = v815;
  v825 = v612;
  v843 = v659 & 1;
  v816 = v655;
  v826 = v816;
  v613 = v654;
  v827 = v613;
  v833 = v870;
  v834 = v872;
  v835 = v868;
  v836 = &v858;
  v837 = v886;
  v838 = &v862;
  v839 = v848;
  v840 = v846;
  v841 = v844;
  v842 = &v850;
  v614 = v611;
  v828 = v614;
  objc_msgSend(v614, "enumerateObjectsUsingBlock:", v824);
  v615 = v851[3];
  if (v615 >= 24)
  {
    v855[3] = 0;
  }
  else
  {
    v616 = 3;
    if (v615 > 15)
      v616 = 4;
    if (v615 <= 19)
      v617 = v616;
    else
      v617 = 5;
    v855[3] = 0;
    v618 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v619 = objc_claimAutoreleasedReturnValue(v618);
    if (os_log_type_enabled(v619, OS_LOG_TYPE_INFO))
    {
      v620 = (void *)v851[3];
      *(_DWORD *)v929 = 134218240;
      v930 = v620;
      v931 = 2048;
      v932 = v617;
      _os_log_impl((void *)&_mh_execute_header, v619, OS_LOG_TYPE_INFO, "Total recommended sensed suggestion count=%ld, Adjust evergreen count to %ld", v929, 0x16u);
    }

    v820[0] = _NSConcreteStackBlock;
    v820[1] = 3221225472;
    v820[2] = __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_749;
    v820[3] = &unk_1002B4830;
    v822 = &v854;
    v823 = v617;
    v821 = v614;
    objc_msgSend(v821, "enumerateObjectsUsingBlock:", v820);

  }
  v621 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("rankingDictionaryIndex"), 1));
  v622 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v621));

  v623 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v614, "sortedArrayUsingDescriptors:", v622));
  v624 = objc_msgSend(v623, "mutableCopy");

  v625 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v863[5], "objectForKeyedSubscript:", CFSTR("numPhotoAssetsResourcesNormalized")));
  -[NSObject floatValue](v625, "floatValue");
  if (v626 == 0.0)
  {
    v627 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v863[5], "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
    if ((objc_msgSend(v627, "isEqualToSet:", emptyStringSet) & 1) == 0)
    {

      goto LABEL_395;
    }
    v628 = (unint64_t)v859[3] > 1;

    if (v628)
    {
      objc_msgSend((id)v863[5], "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("visibilityCategoryForUI"));
      objc_msgSend((id)v863[5], "setObject:forKeyedSubscript:", &off_1002DA9B8, CFSTR("rankingCategory"));
      objc_msgSend((id)v863[5], "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isPseudoDupInRecommendedTab"));
      objc_msgSend((id)v863[5], "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
      v629 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v863[5], "objectForKeyedSubscript:", CFSTR("rankingDictionaryIndex")));
      v630 = objc_msgSend(v629, "intValue");
      objc_msgSend(v624, "replaceObjectAtIndex:withObject:", v630, v863[5]);

      v631 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v625 = objc_claimAutoreleasedReturnValue(v631);
      if (os_log_type_enabled(v625, OS_LOG_TYPE_INFO))
      {
        v632 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v863[5], "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
        v633 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v863[5], "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
        v634 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v863[5], "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
        *(_DWORD *)v929 = 138412802;
        v930 = v632;
        v931 = 2112;
        v932 = (uint64_t)v633;
        v933 = 2112;
        v934 = v634;
        _os_log_impl((void *)&_mh_execute_header, v625, OS_LOG_TYPE_INFO, "Top Phone-sensed walking got suppressed from Recommended tab since it does not have location or photo and we have other unsuppressed walking suggestions. SuggestionID:%@, bundleID:%@, startDate:%@", v929, 0x20u);

      }
      goto LABEL_395;
    }
  }
  else
  {
LABEL_395:

  }
  v652 = objc_msgSend(v624, "copy");

  _Block_object_dispose(v844, 8);
  _Block_object_dispose(v846, 8);
  _Block_object_dispose(v848, 8);
  _Block_object_dispose(&v850, 8);
  _Block_object_dispose(&v854, 8);
  _Block_object_dispose(&v858, 8);
  _Block_object_dispose(&v862, 8);

  _Block_object_dispose(v868, 8);
  _Block_object_dispose(v870, 8);

  _Block_object_dispose(v872, 8);
  _Block_object_dispose(&v874, 8);

  _Block_object_dispose(&v880, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v886, 8);
  return v652;
}

uint64_t __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
  v5 = objc_msgSend(v4, "isAfterDate:", *(_QWORD *)(a1 + 32));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
  v7 = v5 & objc_msgSend(v6, "isBeforeDate:", *(_QWORD *)(a1 + 40));

  return v7;
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_741(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id os_log;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  float v51;
  float v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  float v60;
  float v61;
  void *v62;
  unsigned __int8 v63;
  void *v64;
  void *v65;
  __int128 v66;
  void *v67;
  uint64_t v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleSuperType")));
  v5 = objc_msgSend(v4, "intValue");

  if (v5 == 3)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allContactIdentifiersSet")));
    v69 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    if (!v69)
      goto LABEL_17;
    v68 = *(_QWORD *)v71;
    *(_QWORD *)&v7 = 138413058;
    v66 = v7;
    v67 = v6;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v71 != v68)
          objc_enumerationMutation(v6);
        v9 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleStartDate"), v66));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rankingScoreThresholdDict"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("contactHoldOffThreshold")));
        objc_msgSend(v12, "floatValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", v13));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9));
        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9));
          if (-[NSObject compare:](v16, "compare:", v14) == (id)1)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isWithinHoldOffPeriod")));
            v18 = objc_msgSend(v17, "isEqual:", &off_1002DAC10);

            if (!v18)
              goto LABEL_13;
            objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DA8C8, CFSTR("visibilityCategoryForUI"));
            objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("rankingCategory"));
            objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isWithinHoldOffPeriod"));
            objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
            v19 = *(void **)(a1 + 48);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rankingDictionaryIndex")));
            objc_msgSend(v19, "replaceObjectAtIndex:withObject:", (int)objc_msgSend(v20, "intValue"), v3);

            os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            v16 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
              *(_DWORD *)buf = v66;
              v75 = v22;
              v76 = 2112;
              v77 = v23;
              v78 = 2112;
              v79 = v24;
              v80 = 2112;
              v81 = v25;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Contact was suppressed from Recent tab since there is a visible suggestion with same contactID in the hold off period. SuggestionID:%@, BundleID:%@, startDate:%@,subType:%@", buf, 0x2Au);

              v6 = v67;
            }
          }

        }
LABEL_13:
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rankingCategory")));
        v27 = objc_msgSend(v26, "intValue");

        if (v27 != 3)
        {
          v28 = *(void **)(a1 + 40);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
          objc_msgSend(v28, "setObject:forKey:", v29, v9);

        }
        v8 = (char *)v8 + 1;
      }
      while (v69 != v8);
      v69 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      if (!v69)
      {
LABEL_17:

        break;
      }
    }
  }
  v30 = (void *)phoneSensedWalkingVariants;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  if (objc_msgSend(v30, "containsObject:", v31))
  {

  }
  else
  {
    v32 = (void *)visitSubtypeVariants;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
    LODWORD(v32) = objc_msgSend(v32, "containsObject:", v33);

    if (!(_DWORD)v32)
      goto LABEL_44;
  }
  v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
  if ((objc_msgSend(v34, "containsObject:", v35) & 1) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numPhotoAssetsResourcesNormalized")));
    objc_msgSend(v36, "floatValue");
    v38 = v37;

    if (v38 == 0.0)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DA8C8, CFSTR("visibilityCategoryForUI"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("rankingCategory"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isPseudoDupInRecentTab"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
      v39 = *(void **)(a1 + 48);
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rankingDictionaryIndex")));
      objc_msgSend(v39, "replaceObjectAtIndex:withObject:", (int)objc_msgSend(v40, "intValue"), v3);

      v41 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
LABEL_26:

        goto LABEL_42;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
      *(_DWORD *)buf = 138413058;
      v75 = v43;
      v76 = 2112;
      v77 = v44;
      v78 = 2112;
      v79 = v45;
      v80 = 2112;
      v81 = v46;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Phone-sensed walk or outing bundle was suppressed from Recent tab since it shares the same place(s) with other bundle(s) with higher goodness score from the same day. SuggestionID:%@, BundleID:%@, startDate:%@,subType:%@", buf, 0x2Au);

LABEL_25:
      goto LABEL_26;
    }
  }
  else
  {

  }
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) >= 1)
  {
    v47 = (void *)phoneSensedWalkingVariants;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
    if (objc_msgSend(v47, "containsObject:", v48))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
      if ((objc_msgSend(v49, "isEqualToSet:", emptyStringSet) & 1) != 0)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numPhotoAssetsResourcesNormalized")));
        objc_msgSend(v50, "floatValue");
        v52 = v51;

        if (v52 == 0.0)
        {
          objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DA8C8, CFSTR("visibilityCategoryForUI"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("rankingCategory"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isPseudoDupInRecentTab"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
          v53 = *(void **)(a1 + 48);
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rankingDictionaryIndex")));
          objc_msgSend(v53, "replaceObjectAtIndex:withObject:", (int)objc_msgSend(v54, "intValue"), v3);

          v55 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v42 = objc_claimAutoreleasedReturnValue(v55);
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            goto LABEL_26;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
          *(_DWORD *)buf = 138412802;
          v75 = v43;
          v76 = 2112;
          v77 = v44;
          v78 = 2112;
          v79 = v45;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Phone-sensed walk with no location was suppressed from Recent tab since there is other unsuppressed walking suggestion with higher goodness score. SuggestionID:%@, BundleID:%@, startDate:%@", buf, 0x20u);
          goto LABEL_25;
        }
        goto LABEL_36;
      }

    }
  }
LABEL_36:
  v56 = (void *)phoneSensedWalkingVariants;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  LODWORD(v56) = objc_msgSend(v56, "containsObject:", v57);

  if (!(_DWORD)v56)
    goto LABEL_42;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
  if ((objc_msgSend(v58, "isEqualToSet:", emptyStringSet) & 1) == 0)
  {

    goto LABEL_41;
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numPhotoAssetsResourcesNormalized")));
  objc_msgSend(v59, "floatValue");
  v61 = v60;

  if (v61 > 0.0)
LABEL_41:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
LABEL_42:
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
  v63 = objc_msgSend(v62, "isEqualToSet:", emptyStringSet);

  if ((v63 & 1) == 0)
  {
    v64 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
    objc_msgSend(v64, "addObject:", v65);

  }
LABEL_44:

}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_745(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  id os_log;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  v3 = a2;
  v4 = (void *)phoneSensedWalkingVariants;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) == 0)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
  v7 = v6;
  if (v6 != (void *)emptyStringSet)
  {

LABEL_4:
    goto LABEL_5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numPhotoAssetsResourcesNormalized")));
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  if (v10 == 0.0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DA8C8, CFSTR("visibilityCategoryForUI"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("rankingCategory"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isPseudoDupInRecentTab"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
    v11 = *(void **)(a1 + 32);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rankingDictionaryIndex")));
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", (int)objc_msgSend(v12, "intValue"), v3);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v14 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
      v18 = 138412802;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Phone-sensed walking with no destination or photo got suppressed from Recent tab since richer walking bundle was found in the same day. SuggestionID:%@, BundleID:%@, startDate:%@", (uint8_t *)&v18, 0x20u);

    }
  }
LABEL_5:

}

uint64_t __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_746(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
  v5 = objc_msgSend(v4, "isAfterDate:", *(_QWORD *)(a1 + 32));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
  v7 = v5 & objc_msgSend(v6, "isBeforeDate:", *(_QWORD *)(a1 + 40));

  return v7;
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundleSuperType")));
  if (objc_msgSend(v3, "intValue") == 8)
    goto LABEL_4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allStateOfMindIdentifiersSet")));
  v5 = objc_msgSend(v4, "isEqualToSet:", emptyStringSet);

  if ((v5 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allStateOfMindIdentifiersSet")));
    objc_msgSend(v6, "addObjectsFromArray:", v3);
LABEL_4:

  }
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  id v29;
  id v30;
  _UNKNOWN **v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  _UNKNOWN **v42;
  id v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  unsigned __int8 v51;
  void *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  int v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  const char *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  _UNKNOWN **v67;
  _UNKNOWN **v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  float v75;
  float v76;
  void *v77;
  unsigned int v78;
  _UNKNOWN **v79;
  _UNKNOWN **v80;
  id v81;
  void *v82;
  void *v83;
  unsigned __int8 v84;
  void *v85;
  void *v86;
  float v87;
  float v88;
  void *v89;
  unsigned int v90;
  _UNKNOWN **v91;
  _UNKNOWN **v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  _UNKNOWN **v98;
  _UNKNOWN **v99;
  void *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  void *v104;
  float v105;
  float v106;
  void *v107;
  unsigned int v108;
  _UNKNOWN **v109;
  _UNKNOWN **v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  unsigned int v118;
  id v119;
  void *v120;
  unsigned int v121;
  id v122;
  void *v123;
  unsigned int v124;
  id v125;
  void *v126;
  unsigned int v127;
  id v128;
  void *v129;
  float v130;
  float v131;
  void *v132;
  unsigned int v133;
  _UNKNOWN **v134;
  _UNKNOWN **v135;
  id v136;
  void *v137;
  uint64_t v138;
  void *v139;
  unsigned int v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  unsigned __int8 v147;
  void *v148;
  int v149;
  void *v150;
  unsigned __int8 v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  unsigned __int8 v158;
  void *v159;
  void *v160;
  void *v161;
  unsigned __int8 v162;
  void *v163;
  void *v164;
  id v165;
  NSObject *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  uint64_t v171;
  id v172;
  uint64_t v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint8_t v178[128];
  uint8_t buf[4];
  void *v180;
  __int16 v181;
  void *v182;
  __int16 v183;
  double v184;

  v6 = a2;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
  if (objc_msgSend(v7, "containsObject:", v8))
  {

  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
    LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10);

    if (!(_DWORD)v9)
      goto LABEL_7;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DA8C8, CFSTR("visibilityCategoryForUI"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("rankingCategory"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isDuplicated"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
    *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankingScore"))));
    objc_msgSend((id)v3, "floatValue");
    *(_DWORD *)buf = 138412802;
    v180 = v13;
    v181 = 2112;
    v182 = v14;
    v183 = 2048;
    v184 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Bundle got rejected since it shares suggestionID(%@) or bundleID(%@) with the other bundle with higher ranking score: %.3f", buf, 0x20u);

  }
LABEL_7:
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleInterfaceType")));
  if (objc_msgSend(v16, "intValue") == 11)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
    v18 = objc_msgSend(v17, "intValue");

    if (v18 == 4)
      goto LABEL_16;
    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
    LODWORD(v19) = objc_msgSend(v19, "containsObject:", v20);

    if ((_DWORD)v19)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DA8C8, CFSTR("visibilityCategoryForUI"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("rankingCategory"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isDuplicated"));
      v21 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
        *(_DWORD *)buf = 138412546;
        v180 = v23;
        v181 = 2112;
        v182 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Evergreen bundle got rejected since it is the same type as the other evergreen bundle: suggestionID %@ bundleID %@", buf, 0x16u);

      }
    }
    else
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    }
    v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
    objc_msgSend(v25, "addObject:", v16);
  }

LABEL_16:
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  v27 = objc_msgSend(v26, "intValue");

  v171 = a1;
  if (v27 == 802)
  {
    v169 = a3;
    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allStateOfMindIdentifiersSet")));
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v174, v178, 16);
    if (v29)
    {
      v30 = v29;
      v31 = &off_1002DA8C8;
      v32 = CFSTR("visibilityCategoryForUI");
      v33 = CFSTR("rankingCategory");
      v34 = *(_QWORD *)v175;
      v173 = *(_QWORD *)v175;
      do
      {
        *(double *)&v3 = 0.0;
        v172 = v30;
        do
        {
          if (*(_QWORD *)v175 != v34)
            objc_enumerationMutation(v28);
          if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * v3)))
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, v32);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC28, v33);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isDuplicated"));
            v35 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
              v39 = v33;
              v40 = v28;
              v41 = v32;
              v42 = v31;
              v43 = v6;
              v44 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
              *(_DWORD *)buf = 138412802;
              v180 = v37;
              v181 = 2112;
              v182 = v38;
              v183 = 2112;
              v184 = v44;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Standalone emotion bundle got suppressed from both tabs since the emotion is contained in another bundle. SuggestionID:%@, bundleID:%@, startDate:%@", buf, 0x20u);

              v6 = v43;
              v31 = v42;
              v32 = v41;
              v28 = v40;
              v33 = v39;

              v30 = v172;
              a1 = v171;
            }

            v34 = v173;
          }
          ++v3;
        }
        while (v30 != (id)v3);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v174, v178, 16);
      }
      while (v30);
    }

    a3 = v169;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSuperType")));
  if (objc_msgSend(v45, "intValue") != 8)
    goto LABEL_32;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankingCategory")));
  if (objc_msgSend(v46, "isEqual:", &off_1002DAC28))
  {

LABEL_32:
    goto LABEL_37;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stateOfMindLoggedIn3pApp")));
  if (objc_msgSend(v47, "BOOLValue"))
  {

  }
  else
  {
    *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stateOfMindLoggedInJournalApp"))));
    v48 = objc_msgSend((id)v3, "BOOLValue");

    if (!v48)
      goto LABEL_37;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("visibilityCategoryForUI"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DA9B8, CFSTR("rankingCategory"));
LABEL_37:
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  if (objc_msgSend(v49, "intValue") == 802)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankingCategory")));
    v51 = objc_msgSend(v50, "isEqual:", &off_1002DAC28);

    if ((v51 & 1) == 0)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("visibilityCategoryForUI"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DA9B8, CFSTR("rankingCategory"));
    }
  }
  else
  {

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
  if (objc_msgSend(v52, "intValue") == 1)
  {

  }
  else
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
    v54 = objc_msgSend(v53, "intValue");

    if (v54 != 2)
      goto LABEL_148;
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  if (objc_msgSend(v55, "intValue") == 202)
  {
    v56 = *(unsigned __int8 *)(v171 + 176);

    if (!v56)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DA8C8, CFSTR("visibilityCategoryForUI"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("rankingCategory"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
      v57 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
        *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
        *(_DWORD *)buf = 138412802;
        v180 = v59;
        v181 = 2112;
        v182 = v60;
        v183 = 2112;
        v184 = *(double *)&v3;
        v61 = "Weekly summary bundle got suppressed from Recommended tab since workout routine with the same workout type"
              "s exists. SuggestionID:%@, bundleID:%@, startDate:%@";
LABEL_131:
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, v61, buf, 0x20u);

        goto LABEL_132;
      }
      goto LABEL_132;
    }
  }
  else
  {

  }
  if (*(_BYTE *)(v171 + 176))
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
    if (objc_msgSend(v62, "intValue") == 201)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate")));
      v3 = v171;
      if ((objc_msgSend(v63, "isAfterDate:", *(_QWORD *)(v171 + 40)) & 1) != 0)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleEndDate")));
        *(double *)&v3 = COERCE_DOUBLE(objc_msgSend(v64, "isBeforeDate:", *(_QWORD *)(v171 + 48)));

        if ((_DWORD)v3)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCoarseGranularitySummaryKey")));
          v66 = objc_msgSend(v65, "BOOLValue");

          if (v66)
            v67 = &off_1002DA8C8;
          else
            v67 = &off_1002DAC28;
          if (v66)
            v68 = &off_1002DAC28;
          else
            v68 = &off_1002DA9B8;
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v67, CFSTR("visibilityCategoryForUI"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v68, CFSTR("rankingCategory"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isPseudoDupInRecommendedTab"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
          v69 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v58 = objc_claimAutoreleasedReturnValue(v69);
          if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            goto LABEL_132;
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
          *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
          *(_DWORD *)buf = 138412802;
          v180 = v59;
          v181 = 2112;
          v182 = v60;
          v183 = 2112;
          v184 = *(double *)&v3;
          v61 = "Workout bundle got suppressed from Recommended tab since weekly workout summary is shown on Recommended "
                "tab. SuggestionID:%@, bundleID:%@, startDate:%@";
          goto LABEL_131;
        }
        goto LABEL_63;
      }

    }
  }
LABEL_63:
  v70 = (void *)workoutSubtypeVariants;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  if (!objc_msgSend(v70, "containsObject:", v71))
  {
LABEL_75:

    goto LABEL_76;
  }
  v72 = *(void **)(*(_QWORD *)(*(_QWORD *)(v171 + 96) + 8) + 40);
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("workoutTypesSet")));
  if ((objc_msgSend(v72, "containsObject:", v73) & 1) == 0)
  {

    goto LABEL_75;
  }
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numPhotoAssetsResourcesNormalized")));
  objc_msgSend(v74, "floatValue");
  v76 = v75;

  if (v76 == 0.0)
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCoarseGranularitySummaryKey")));
    v78 = objc_msgSend(v77, "BOOLValue");

    if (v78)
      v79 = &off_1002DA8C8;
    else
      v79 = &off_1002DAC28;
    if (v78)
      v80 = &off_1002DAC28;
    else
      v80 = &off_1002DA9B8;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v79, CFSTR("visibilityCategoryForUI"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v80, CFSTR("rankingCategory"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isPseudoDupInRecommendedTab"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
    v81 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v58 = objc_claimAutoreleasedReturnValue(v81);
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      goto LABEL_132;
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
    *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
    *(_DWORD *)buf = 138412802;
    v180 = v59;
    v181 = 2112;
    v182 = v60;
    v183 = 2112;
    v184 = *(double *)&v3;
    v61 = "Workout bundle got suppressed from Recommended tab since it has the same workout type(s) with the other bundle"
          " with higher ranking score. SuggestionID:%@, bundleID:%@, startDate:%@";
    goto LABEL_131;
  }
LABEL_76:
  v82 = (void *)visitSubtypeVariants;
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  v84 = objc_msgSend(v82, "containsObject:", v83);
  if ((v84 & 1) == 0)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
    if (objc_msgSend(v82, "intValue") != 105)
      goto LABEL_91;
  }
  v85 = *(void **)(*(_QWORD *)(*(_QWORD *)(v171 + 104) + 8) + 40);
  *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet"))));
  if (!objc_msgSend(v85, "containsObject:", v3))
  {

    if ((v84 & 1) != 0)
    {
LABEL_92:

      goto LABEL_93;
    }
LABEL_91:

    goto LABEL_92;
  }
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numPhotoAssetsResourcesNormalized")));
  objc_msgSend(v86, "floatValue");
  v88 = v87;

  if ((v84 & 1) == 0)
  if (v88 == 0.0)
  {
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCoarseGranularitySummaryKey")));
    v90 = objc_msgSend(v89, "BOOLValue");

    if (v90)
      v91 = &off_1002DA8C8;
    else
      v91 = &off_1002DAC28;
    if (v90)
      v92 = &off_1002DAC28;
    else
      v92 = &off_1002DA9B8;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v91, CFSTR("visibilityCategoryForUI"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v92, CFSTR("rankingCategory"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isPseudoDupInRecommendedTab"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
    v93 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v58 = objc_claimAutoreleasedReturnValue(v93);
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      goto LABEL_132;
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
    *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
    *(_DWORD *)buf = 138412802;
    v180 = v59;
    v181 = 2112;
    v182 = v60;
    v183 = 2112;
    v184 = *(double *)&v3;
    v61 = "Visit bundle got suppressed from Recommended tab since it shared the same place(s) with more highly ranked bun"
          "dle. SuggestionID:%@, bundleID:%@, startDate:%@";
    goto LABEL_131;
  }
LABEL_93:
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSuperType")));
  if (objc_msgSend(v94, "intValue") == 3)
  {
    v95 = *(void **)(*(_QWORD *)(*(_QWORD *)(v171 + 112) + 8) + 40);
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allContactIdentifiersSet")));
    LODWORD(v95) = objc_msgSend(v95, "containsObject:", v96);

    if ((_DWORD)v95)
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCoarseGranularitySummaryKey")));
      if (objc_msgSend(v97, "BOOLValue"))
      {

        v98 = &off_1002DAC28;
        v99 = &off_1002DA8C8;
      }
      else
      {
        v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
        v124 = objc_msgSend(v123, "intValue");

        if (v124 == 303)
          v99 = &off_1002DA8C8;
        else
          v99 = &off_1002DAC28;
        if (v124 == 303)
          v98 = &off_1002DAC28;
        else
          v98 = &off_1002DA9B8;
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v99, CFSTR("visibilityCategoryForUI"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v98, CFSTR("rankingCategory"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isPseudoDupInRecommendedTab"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
      v125 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v58 = objc_claimAutoreleasedReturnValue(v125);
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        goto LABEL_132;
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
      *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
      *(_DWORD *)buf = 138412802;
      v180 = v59;
      v181 = 2112;
      v182 = v60;
      v183 = 2112;
      v184 = *(double *)&v3;
      v61 = "Contact bundle got suppressed from Recommended tab since it shares the same contact id(s) with the other bun"
            "dle with higher ranking score. SuggestionID:%@, bundleID:%@, startDate:%@";
      goto LABEL_131;
    }
  }
  else
  {

  }
  v100 = (void *)phoneSensedWalkingVariants;
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  LODWORD(v100) = objc_msgSend(v100, "containsObject:", v101);

  if (!(_DWORD)v100)
  {
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
    v118 = objc_msgSend(v117, "intValue");

    if (v118 == 401)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v171 + 144) + 8) + 24))
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("visibilityCategoryForUI"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DA9B8, CFSTR("rankingCategory"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
        v119 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v58 = objc_claimAutoreleasedReturnValue(v119);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
          *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
          *(_DWORD *)buf = 138412802;
          v180 = v59;
          v181 = 2112;
          v182 = v60;
          v183 = 2112;
          v184 = *(double *)&v3;
          v61 = "Daily SongOnrepeat bundle was suppressed from Recommended tab since the same type already exists in Reco"
                "mmended tab. SuggestionID:%@, bundleID:%@, startDate:%@";
          goto LABEL_131;
        }
LABEL_132:

        goto LABEL_149;
      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 128) + 8) + 24);
      v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v137, CFSTR("ordinalRankInRecommendedTab"));

      v138 = *(_QWORD *)(v171 + 144);
      goto LABEL_177;
    }
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
    v121 = objc_msgSend(v120, "intValue");

    if (v121 == 402)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v171 + 152) + 8) + 24))
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("visibilityCategoryForUI"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DA9B8, CFSTR("rankingCategory"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
        v122 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v58 = objc_claimAutoreleasedReturnValue(v122);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
          *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
          *(_DWORD *)buf = 138412802;
          v180 = v59;
          v181 = 2112;
          v182 = v60;
          v183 = 2112;
          v184 = *(double *)&v3;
          v61 = "Daily PlayedSong bundle was suppressed from Recommended tab since the same type already exists in Recomm"
                "ended tab. SuggestionID:%@, bundleID:%@, startDate:%@";
          goto LABEL_131;
        }
        goto LABEL_132;
      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 128) + 8) + 24);
      v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v164, CFSTR("ordinalRankInRecommendedTab"));

      v138 = *(_QWORD *)(v171 + 152);
      goto LABEL_177;
    }
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
    v127 = objc_msgSend(v126, "intValue");

    if (v127 == 403)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v171 + 160) + 8) + 24))
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("visibilityCategoryForUI"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DA9B8, CFSTR("rankingCategory"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
        v128 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v58 = objc_claimAutoreleasedReturnValue(v128);
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          goto LABEL_132;
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
        *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
        *(_DWORD *)buf = 138412802;
        v180 = v59;
        v181 = 2112;
        v182 = v60;
        v183 = 2112;
        v184 = *(double *)&v3;
        v61 = "Daily PlayedPodCast bundle was suppressed from Recommended tab since the same type already exists in Recom"
              "mended tab. SuggestionID:%@, bundleID:%@, startDate:%@";
        goto LABEL_131;
      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 128) + 8) + 24);
      v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v168, CFSTR("ordinalRankInRecommendedTab"));

      v138 = *(_QWORD *)(v171 + 160);
LABEL_177:
      *(_BYTE *)(*(_QWORD *)(v138 + 8) + 24) = 1;
      goto LABEL_149;
    }
    v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleInterfaceType")));
    v140 = objc_msgSend(v139, "intValue");

    if (v140 != 11)
    {
      v165 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v166 = objc_claimAutoreleasedReturnValue(v165);
      if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
        __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3_cold_1(v171, v6);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 128) + 8) + 24);
      v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v167, CFSTR("ordinalRankInRecommendedTab"));

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 168) + 8) + 24);
      goto LABEL_149;
    }
LABEL_148:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
    goto LABEL_149;
  }
  v102 = *(void **)(*(_QWORD *)(*(_QWORD *)(v171 + 104) + 8) + 40);
  v103 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
  if (!objc_msgSend(v102, "containsObject:", v103))
  {
LABEL_109:

    goto LABEL_110;
  }
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numPhotoAssetsResourcesNormalized")));
  objc_msgSend(v104, "floatValue");
  v106 = v105;

  if (v106 == 0.0)
  {
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCoarseGranularitySummaryKey")));
    v108 = objc_msgSend(v107, "BOOLValue");

    if (v108)
      v109 = &off_1002DA8C8;
    else
      v109 = &off_1002DAC28;
    if (v108)
      v110 = &off_1002DAC28;
    else
      v110 = &off_1002DA9B8;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v109, CFSTR("visibilityCategoryForUI"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v110, CFSTR("rankingCategory"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isPseudoDupInRecommendedTab"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
    v111 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v103 = objc_claimAutoreleasedReturnValue(v111);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
    {
      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
      *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
      *(_DWORD *)buf = 138412802;
      v180 = v112;
      v181 = 2112;
      v182 = v113;
      v183 = 2112;
      v184 = *(double *)&v3;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, "Phone sensed bundle got suppressed from Recommended tab since it shared the same place(s) with more highly ranked bundle and it does not have any photo. SuggestionID:%@, bundleID:%@, startDate:%@", buf, 0x20u);

    }
    goto LABEL_109;
  }
LABEL_110:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 120) + 8) + 24))
  {
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
    v115 = v114;
    if (v114 == (void *)emptyStringSet)
    {
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numPhotoAssetsResourcesNormalized")));
      objc_msgSend(v129, "floatValue");
      v131 = v130;

      if (v131 == 0.0)
      {
        v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCoarseGranularitySummaryKey")));
        v133 = objc_msgSend(v132, "BOOLValue");

        if (v133)
          v134 = &off_1002DA8C8;
        else
          v134 = &off_1002DAC28;
        if (v133)
          v135 = &off_1002DAC28;
        else
          v135 = &off_1002DA9B8;
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v134, CFSTR("visibilityCategoryForUI"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v135, CFSTR("rankingCategory"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC40, CFSTR("isPseudoDupInRecommendedTab"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DAC58, CFSTR("ordinalRankInRecommendedTab"));
        v136 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v58 = objc_claimAutoreleasedReturnValue(v136);
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          goto LABEL_132;
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
        *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"))));
        *(_DWORD *)buf = 138412802;
        v180 = v59;
        v181 = 2112;
        v182 = v60;
        v183 = 2112;
        v184 = *(double *)&v3;
        v61 = "Phone-sensed walking bundle got suppressed from Recommended tab since it has the same workout type(s) with"
              " the other bundle with higher ranking score. SuggestionID:%@, bundleID:%@, startDate:%@";
        goto LABEL_131;
      }
    }
    else
    {

    }
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 120) + 8) + 24);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 128) + 8) + 24);
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v116, CFSTR("ordinalRankInRecommendedTab"));

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v171 + 136) + 8) + 40), "count"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v171 + 136) + 8) + 40), a2);
LABEL_149:
  objc_msgSend(*(id *)(v171 + 56), "setObject:atIndexedSubscript:", v6, a3);
  v141 = *(void **)(*(_QWORD *)(*(_QWORD *)(v171 + 64) + 8) + 40);
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
  objc_msgSend(v141, "addObject:", v142);

  v143 = *(void **)(*(_QWORD *)(*(_QWORD *)(v171 + 72) + 8) + 40);
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
  objc_msgSend(v143, "addObject:", v144);

  v145 = (void *)visitSubtypeVariants;
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  v147 = objc_msgSend(v145, "containsObject:", v146);
  if ((v147 & 1) != 0)
  {
    v148 = v6;
    v149 = 0;
  }
  else
  {
    v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
    if (objc_msgSend(v145, "intValue") == 105)
    {
      v148 = v6;
      v149 = 0;
    }
    else
    {
      v154 = (void *)phoneSensedWalkingVariants;
      *(double *)&v3 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType"))));
      if ((objc_msgSend(v154, "containsObject:", v3) & 1) == 0)
      {

        v152 = v171;
        goto LABEL_162;
      }
      v148 = v6;
      v149 = 1;
    }
  }
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
  v151 = objc_msgSend(v150, "isEqualToSet:", emptyStringSet);

  if (v149)
  v152 = v171;
  if ((v147 & 1) == 0)

  v6 = v148;
  if ((v151 & 1) == 0)
  {
    v153 = *(void **)(*(_QWORD *)(*(_QWORD *)(v171 + 104) + 8) + 40);
    v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("allPlaceNamesSet")));
    objc_msgSend(v153, "addObject:", v146);
LABEL_162:

  }
  v155 = (void *)workoutSubtypeVariants;
  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType")));
  if (objc_msgSend(v155, "containsObject:", v156))
  {
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("workoutTypesSet")));
    v158 = objc_msgSend(v157, "isEqualToSet:", emptyStringSet);

    if ((v158 & 1) != 0)
      goto LABEL_167;
    v159 = *(void **)(*(_QWORD *)(*(_QWORD *)(v152 + 96) + 8) + 40);
    v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("workoutTypesSet")));
    objc_msgSend(v159, "addObject:", v156);
  }

LABEL_167:
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSuperType")));
  if (objc_msgSend(v160, "intValue") != 3)
  {
LABEL_170:

    goto LABEL_171;
  }
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allContactIdentifiersSet")));
  v162 = objc_msgSend(v161, "isEqualToSet:", emptyStringSet);

  if ((v162 & 1) == 0)
  {
    v163 = *(void **)(*(_QWORD *)(*(_QWORD *)(v152 + 112) + 8) + 40);
    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allContactIdentifiersSet")));
    objc_msgSend(v163, "addObject:", v160);
    goto LABEL_170;
  }
LABEL_171:

}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_749(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id os_log;
  NSObject *v10;
  int v11;
  id v12;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleInterfaceType")));
  if (objc_msgSend(v6, "intValue") == 11)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
    v8 = objc_msgSend(v7, "intValue");

    if (v8 != 4 && ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > *(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1002DA8C8, CFSTR("visibilityCategoryForUI"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1002DAC28, CFSTR("rankingCategory"));
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v10 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Evergreen bundle got rejected because allowable evergreen count is reached: %@", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a3);
    }
  }
  else
  {

  }
}

- (void)_mergeScoresToBundles:(id)a3 usingScore:(id)a4
{
  id v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  char *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  MOEventBundleRanking *v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  char *v33;
  id v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MOEventBundleRanking _mergeScoresToBundles:usingScore:].cold.1(v7, v8, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleRanking.m"), 2531, CFSTR("Mismatch between bundle count %lu and score array count %lu (in %s:%d)"), objc_msgSend(v7, "count"), objc_msgSend(v8, "count"), "-[MOEventBundleRanking _mergeScoresToBundles:usingScore:]", 2531);

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v42)
  {
    v38 = 0;
    v39 = 0;
    v13 = 0;
    v36 = 0;
    v37 = 0;
    v43 = 0;
    v41 = *(_QWORD *)v45;
    v34 = v8;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v45 != v41)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", (char *)v14 + v43));
        v17 = objc_msgSend(v16, "mutableCopy");

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("bundleInterfaceType")));
        v19 = objc_msgSend(v18, "intValue");

        if (v19 == 11)
        {
          ++v13;
        }
        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
          v26 = objc_msgSend(v25, "intValue");

          switch(v26)
          {
            case 1u:
              ++v36;
              break;
            case 2u:
              ++v37;
              break;
            case 3u:
              ++v38;
              break;
            case 4u:
              ++v39;
              break;
            default:
              break;
          }
        }
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("bundleInterfaceType"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("bundleSubType"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("bundleSuperType"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("elapsedDaysFromBundleEndDate"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("rankingDictionaryIndex"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("bundleIdentifier"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("suggestionIdentifier"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("allPlaceNamesSet"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("workoutTypesSet"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("allContactIdentifiersSet"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("allStateOfMindIdentifiersSet"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("numAnomalyEventsNormalized"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("numPhotoAssetsResourcesNormalized"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("numMediaAssetsResourcesNormalized"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("isCoarseGranularitySummaryKey"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("bundleStartDate"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("bundleEndDate"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("stateOfMindLoggedIn3pApp"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("stateOfMindLoggedInJournalApp"));
        v20 = (char *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking _checkAndUpdateNumericLimits:](self, "_checkAndUpdateNumericLimits:", v17));
        v21 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
          v35 = v13;
          v28 = self;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "suggestionID"));
          *(_DWORD *)buf = 134218498;
          v49 = (char *)v14 + v43;
          v50 = 2112;
          v51 = v27;
          v52 = 2112;
          v53 = v29;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Bundle index %lu, BundleID %@, suggestionID %@", buf, 0x20u);

          self = v28;
          v13 = v35;

          v8 = v34;
        }

        v23 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "RankingDict %@", buf, 0xCu);
        }

        objc_msgSend(v15, "setRankingDictionary:", v20);
        v14 = (char *)v14 + 1;
      }
      while (v42 != v14);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
      v42 = v30;
      v43 += (uint64_t)v14;
    }
    while (v30);
  }
  else
  {
    v38 = 0;
    v39 = 0;
    v13 = 0;
    v36 = 0;
    v37 = 0;
  }

  v31 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = (char *)objc_msgSend(obj, "count");
    *(_DWORD *)buf = 134219264;
    v49 = v33;
    v50 = 2048;
    v51 = v36;
    v52 = 2048;
    v53 = v37;
    v54 = 2048;
    v55 = v38;
    v56 = 2048;
    v57 = v39;
    v58 = 2048;
    v59 = v13;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Added ranking dictionaries to bundle array: Num totalBundles=%lu, NumSensedBundlesEligibleForBothTabs=%lu,NumSensedBundlesRecommendedOnly=%lu, NumSensedBundlesRecentOnly=%lu, numSensedBundlesRejected=%lu, numEvergreenBundles=%lu  ", buf, 0x3Eu);
  }

}

- (void)_submitEventBundleRankingAnalytics:(id)a3 withRankingInput:(id)a4 andSubmissionDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id os_log;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
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
  float v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  float v52;
  double v53;
  void *v54;
  float v55;
  double v56;
  void *v57;
  float v58;
  double v59;
  void *v60;
  float v61;
  double v62;
  void *v63;
  float v64;
  double v65;
  void *v66;
  float v67;
  double v68;
  void *v69;
  float v70;
  double v71;
  void *v72;
  float v73;
  double v74;
  void *v75;
  float v76;
  double v77;
  void *v78;
  float v79;
  double v80;
  void *v81;
  float v82;
  double v83;
  void *v84;
  float v85;
  double v86;
  void *v87;
  float v88;
  double v89;
  void *v90;
  float v91;
  double v92;
  void *v93;
  float v94;
  double v95;
  void *v96;
  float v97;
  double v98;
  void *v99;
  float v100;
  double v101;
  void *v102;
  float v103;
  double v104;
  void *v105;
  float v106;
  double v107;
  void *v108;
  float v109;
  double v110;
  void *v111;
  float v112;
  double v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  float v118;
  double v119;
  void *v120;
  void *v121;
  float v122;
  double v123;
  void *v124;
  void *v125;
  float v126;
  double v127;
  void *v128;
  void *v129;
  float v130;
  double v131;
  void *v132;
  void *v133;
  float v134;
  double v135;
  void *v136;
  void *v137;
  float v138;
  double v139;
  void *v140;
  void *v141;
  float v142;
  double v143;
  void *v144;
  void *v145;
  float v146;
  double v147;
  void *v148;
  void *v149;
  float v150;
  double v151;
  void *v152;
  void *v153;
  float v154;
  double v155;
  void *v156;
  void *v157;
  float v158;
  double v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  NSObject *v165;
  NSObject *p_super;
  id v167;
  id v168;
  NSObject *v169;
  NSMutableDictionary *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  NSMutableDictionary *v196;
  uint64_t v197;
  void *v198;
  NSNumber *v199;
  NSNumber *v200;
  NSNumber *v201;
  NSNumber *v202;
  uint64_t v203;
  NSNumber *v204;
  NSNumber *v205;
  void *v206;
  uint64_t v207;
  NSNumber *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  float v215;
  double v216;
  void *v217;
  void *v218;
  float v219;
  double v220;
  void *v221;
  void *v222;
  uint64_t v223;
  NSNumber *v224;
  NSNumber *v225;
  void *v226;
  uint64_t v227;
  NSNumber *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  float v235;
  double v236;
  void *v237;
  void *v238;
  float v239;
  double v240;
  void *v241;
  void *v242;
  uint64_t v243;
  NSNumber *v244;
  NSNumber *v245;
  void *v246;
  uint64_t v247;
  NSNumber *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  float v255;
  double v256;
  void *v257;
  void *v258;
  float v259;
  double v260;
  void *v261;
  void *v262;
  id v263;
  NSObject *v264;
  NSObject *v265;
  id v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  id obj;
  uint64_t v287;
  NSMutableDictionary *v288;
  id v289;
  NSMutableArray *v290;
  id v291;
  NSMutableSet *v292;
  id v293;
  NSMutableSet *v294;
  id v295;
  NSNumber *v296;
  NSNumber *v297;
  NSNumber *v298;
  id v299;
  uint64_t v300;
  void *v301;
  id v302;
  void *v303;
  uint64_t v304;
  NSNumber *v305;
  _QWORD v306[4];
  NSObject *v307;
  uint8_t v308[16];
  char v309;
  char v310[7];
  _QWORD v311[4];
  NSMutableDictionary *v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  uint8_t v317[128];
  uint8_t buf[4];
  id v319[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v301 = v9;
  v12 = objc_msgSend(v9, "count");
  if (v12 != objc_msgSend(v10, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:].cold.5(v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleRanking.m"), 2596, CFSTR("Mismatch between score dict and input dict sizes (in %s:%d)"), "-[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:]", 2596);

  }
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v319[0] = objc_msgSend(v9, "count");
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%lu bundle rankings and inputs are set to be submitted to CoreAnalytics.", buf, 0xCu);
  }

  v282 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v283 = v11;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "components:fromDate:", 764, v11));
  v289 = objc_msgSend(v18, "year");
  v291 = objc_msgSend(v18, "month");
  v293 = objc_msgSend(v18, "day");
  v295 = objc_msgSend(v18, "hour");
  v281 = v18;
  v299 = objc_msgSend(v18, "minute");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOConfigurationManagerBase getTrialExperimentIdentifiers](self->_configurationManager, "getTrialExperimentIdentifiers"));
  v313 = 0u;
  v314 = 0u;
  v315 = 0u;
  v316 = 0u;
  obj = v10;
  v302 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v313, v317, 16);
  if (v302)
  {
    v304 = 0;
    v287 = *(_QWORD *)v314;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v314 != v287)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v313 + 1) + 8 * (_QWORD)v20);
        v22 = objc_autoreleasePoolPush();
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "objectAtIndexedSubscript:", (char *)v20 + v304));
        v24 = objc_opt_new(NSMutableDictionary);
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v289));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("submissionTimeYear"), v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v291));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("submissionTimeMonth"), v26);

        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v293));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("submissionTimeDay"), v27);

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v295));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("submissionTimeHour"), v28);

        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v299));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("submissionTimeMinute"), v29);

        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("scalingFactorForAnalytics"), &off_1002DCE38);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bundleIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v30, "hash")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("bundleId"), v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "suggestionIdentifier"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "hash")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("suggestionId"), v33);

        if (v19)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "experimentId"));
          -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("trialExperimentId"), v34);

          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v19, "deploymentId")));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringValue"));
          -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("trialDeploymentId"), v36);

          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "treatmentId"));
          -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("trialTreatmentId"), v37);

        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v21, "suggestionIsDeleted")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("isDeleted"), v38);

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v21, "suggestionIsSelected")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("isSelected"), v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v21, "suggestionQuickAddEntry")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("quickAddEntry"), v40);

        objc_msgSend(v21, "viewCountNormalized");
        *(float *)&v42 = v41 * 10000.0;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v42));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("viewCountNormalized"), v43);

        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v21, "journalEntryIsCreated")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("journalEntryIsCreated"), v44);

        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v21, "journalEntryIsEdited")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("journalEntryIsEdited"), v45);

        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v21, "journalEntryIsCancelled")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("journalEntryIsCancelled"), v46);

        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v21, "journalEntryIsDeleted")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("journalEntryIsDeleted"), v47);

        objc_msgSend(v21, "bundleRecencyDaysElapsed");
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("bundleRecencyDaysElapsed"), v48);

        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "bundleInterfaceType")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("bundleInterfaceType"), v49);

        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "bundleSubType")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("bundleSubType"), v50);

        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "bundleSuperType")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("bundleSuperType"), v51);

        objc_msgSend(v21, "numAnomalyEventsNormalized");
        *(float *)&v53 = v52 * 10000.0;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v53));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numAnomalyEventsNormalized"), v54);

        objc_msgSend(v21, "numTrendEventsNormalized");
        *(float *)&v56 = v55 * 10000.0;
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v56));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numTrendEventsNormalized"), v57);

        objc_msgSend(v21, "numRoutineEventsNormalized");
        *(float *)&v59 = v58 * 10000.0;
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v59));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numRoutineEventsNormalized"), v60);

        objc_msgSend(v21, "numStateOfMindEventsNormalized");
        *(float *)&v62 = v61 * 10000.0;
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v62));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numStateOfMindEventsNormalized"), v63);

        objc_msgSend(v21, "numUniqueResourceTypesNormalized");
        *(float *)&v65 = v64 * 10000.0;
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v65));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numUniqueResourceTypesNormalized"), v66);

        objc_msgSend(v21, "numValueTypeResourcesNormalized");
        *(float *)&v68 = v67 * 10000.0;
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v68));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numValueTypeResourcesNormalized"), v69);

        objc_msgSend(v21, "numPhotoAssetsResourcesNormalized");
        *(float *)&v71 = v70 * 10000.0;
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v71));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numPhotoAssetsResourcesNormalized"), v72);

        objc_msgSend(v21, "numMediaTypeResourcesNormalized");
        *(float *)&v74 = v73 * 10000.0;
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v74));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numMediaTypeResourcesNormalized"), v75);

        objc_msgSend(v21, "numWebLinkTypeResourcesNormalized");
        *(float *)&v77 = v76 * 10000.0;
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v77));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numWebLinkTypeResourcesNormalized"), v78);

        objc_msgSend(v21, "numInterfaceTagTypeResourcesNormalized");
        *(float *)&v80 = v79 * 10000.0;
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v80));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numInterfaceTagTypeResourcesNormalized"), v81);

        objc_msgSend(v21, "numMapItemTypeResourcesNormalized");
        *(float *)&v83 = v82 * 10000.0;
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v83));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numMapItemTypeResourcesNormalized"), v84);

        objc_msgSend(v21, "numAppTypeResourcesNormalized");
        *(float *)&v86 = v85 * 10000.0;
        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v86));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numAppTypeResourcesNormalized"), v87);

        objc_msgSend(v21, "numWorkoutRingAssetsNormalized");
        *(float *)&v89 = v88 * 10000.0;
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v89));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numWorkoutRingAssetsNormalized"), v90);

        objc_msgSend(v21, "numWorkoutIconAssetsNormalized");
        *(float *)&v92 = v91 * 10000.0;
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v92));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numWorkoutIconAssetsNormalized"), v93);

        objc_msgSend(v21, "numWorkoutRouteMapAssetsNormalized");
        *(float *)&v95 = v94 * 10000.0;
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v95));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("numWorkoutRouteMapAssetsNormalized"), v96);

        objc_msgSend(v21, "isBundleActionSpecific");
        *(float *)&v98 = v97 * 10000.0;
        v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v98));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("isBundleActionSpecificGranular"), v99);

        objc_msgSend(v21, "isBundlePlaceTypeSpecific");
        *(float *)&v101 = v100 * 10000.0;
        v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v101));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("isBundlePlaceTypeSpecificGranular"), v102);

        objc_msgSend(v21, "isBundleTimeTagSpecific");
        *(float *)&v104 = v103 * 10000.0;
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v104));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("isBundleTimeTagSpecificGranular"), v105);

        objc_msgSend(v21, "labelSpecificityNormalized");
        *(float *)&v107 = v106 * 10000.0;
        v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v107));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("labelSpecificityNormalized"), v108);

        objc_msgSend(v21, "labelQualityScore");
        *(float *)&v110 = v109 * 10000.0;
        v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v110));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("labelQualityScore"), v111);

        objc_msgSend(v21, "peopleDensityWeightedAverageNormalized");
        *(float *)&v113 = v112 * 10000.0;
        v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v113));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("pDensityWeightedAverageNormalized"), v114);

        v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v21, "isWorkVisit")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("isWorkVisit"), v115);

        v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v21, "isShortVisit")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("isShortVisit"), v116);

        v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("richnessScore")));
        objc_msgSend(v117, "floatValue");
        *(float *)&v119 = v118 * 10000.0;
        v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v119));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("richnessScore"), v120);

        v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("distinctnessScore")));
        objc_msgSend(v121, "floatValue");
        *(float *)&v123 = v122 * 10000.0;
        v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v123));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("distinctnessScore"), v124);

        v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("heuristicsScore")));
        objc_msgSend(v125, "floatValue");
        *(float *)&v127 = v126 * 10000.0;
        v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v127));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("heuristicsScore"), v128);

        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("qualityScore")));
        objc_msgSend(v129, "floatValue");
        *(float *)&v131 = v130 * 10000.0;
        v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v131));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("qualityScore"), v132);

        v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("viewCountBasedScoreAdjustment")));
        objc_msgSend(v133, "floatValue");
        *(float *)&v135 = v134 * 10000.0;
        v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v135));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("viewCountBasedScoreAdjustment"), v136);

        v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("baseScore")));
        objc_msgSend(v137, "floatValue");
        *(float *)&v139 = v138 * 10000.0;
        v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v139));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("baseScore"), v140);

        v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("engagementScore")));
        objc_msgSend(v141, "floatValue");
        *(float *)&v143 = v142 * 10000.0;
        v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v143));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("engagementScore"), v144);

        v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("diversityCoefficient")));
        objc_msgSend(v145, "floatValue");
        *(float *)&v147 = v146 * 10000.0;
        v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v147));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("diversityCoefficient"), v148);

        v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("decayFactor")));
        objc_msgSend(v149, "floatValue");
        *(float *)&v151 = v150 * 10000.0;
        v152 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v151));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("decayFactor"), v152);

        v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rankingScore")));
        objc_msgSend(v153, "floatValue");
        *(float *)&v155 = v154 * 10000.0;
        v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v155));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("rankingScore"), v156);

        v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
        objc_msgSend(v157, "floatValue");
        *(float *)&v159 = v158 * 10000.0;
        v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v159));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("bundleGoodnessScore"), v160);

        v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rankingCategory")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("rankingCategory"), v161);

        v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("visibilityCategoryForUI"), v162);

        v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ordinalRankInRecommendedTab")));
        -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v24, CFSTR("ordinalRankInRecommendedTab"), v163);

        if (v24)
        {
          v311[0] = _NSConcreteStackBlock;
          v311[1] = 3221225472;
          v311[2] = __94__MOEventBundleRanking__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate___block_invoke;
          v311[3] = &unk_1002B2238;
          v312 = v24;
          AnalyticsSendEventLazy(CFSTR("com.apple.Moments.MOEventBundleRanking"), v311);
          v164 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          v165 = objc_claimAutoreleasedReturnValue(v164);
          if (os_log_type_enabled(v165, OS_LOG_TYPE_DEBUG))
            -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:].cold.4(&v309, v310);

          p_super = &v312->super.super;
        }
        else
        {
          v167 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          p_super = objc_claimAutoreleasedReturnValue(v167);
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:].cold.3(buf, v319, p_super);
        }

        objc_autoreleasePoolPop(v22);
        v20 = (char *)v20 + 1;
      }
      while (v302 != v20);
      v302 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v313, v317, 16);
      v304 += (uint64_t)v20;
    }
    while (v302);
  }

  v168 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v169 = objc_claimAutoreleasedReturnValue(v168);
  if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v308 = 0;
    _os_log_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_INFO, "Completed individual Ranking CoreAnalytics submission.", v308, 2u);
  }

  v170 = objc_opt_new(NSMutableDictionary);
  v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v289));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("submissionTimeYear"), v171);

  v172 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v291));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("submissionTimeMonth"), v172);

  v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v293));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("submissionTimeDay"), v173);

  v174 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v295));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("submissionTimeHour"), v174);

  v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v299));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("submissionTimeMinute"), v175);

  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("scalingFactorForAnalytics"), &off_1002DCE38);
  if (v19)
  {
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "experimentId"));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("trialExperimentId"), v176);

    v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v19, "deploymentId")));
    v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "stringValue"));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("trialDeploymentId"), v178);

    v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "treatmentId"));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("trialTreatmentId"), v179);

  }
  v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v301, "count")));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("totalBundleCount"), v180);

  v285 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("ordinalRankInRecommendedTab"), 1));
  v284 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "sortedArrayUsingDescriptors:"));
  v182 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("visibilityCategoryForUI"), &off_1002DCAE8));
  v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "filteredArrayUsingPredicate:", v182));

  v184 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v183, "count")));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v170, CFSTR("recommendedSuggestionCount"), v184);

  v288 = v170;
  v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %lu"), CFSTR("bundleInterfaceType"), 11));

  v280 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "filteredArrayUsingPredicate:", v185));
  v186 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v280, "count")));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("evergreenBundleCount"), v186);

  v187 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %lu"), CFSTR("bundleInterfaceType"), 10));
  v279 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "filteredArrayUsingPredicate:", v187));
  v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v279, "count")));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("photoMemoryBundleCount"), v188);

  v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("visibilityCategoryForUI"), &off_1002DCB00));
  v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "filteredArrayUsingPredicate:", v189));
  v191 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v190, "count")));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("suggestionCountInRecentTab"), v191);

  v192 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K <= 1"), CFSTR("elapsedDaysFromBundleEndDate")));
  v277 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "filteredArrayUsingPredicate:", v192));
  v193 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v277, "count")));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("suggestionCountInRecenTabFromPast1Day"), v193);

  v194 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K <= 3"), CFSTR("elapsedDaysFromBundleEndDate")));
  v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "filteredArrayUsingPredicate:", v194));
  v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v276, "count")));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("suggestionCountInRecenTabFromPast3Days"), v195);

  v196 = v288;
  v197 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K <= 7"), CFSTR("elapsedDaysFromBundleEndDate")));

  v278 = v190;
  v275 = (void *)v197;
  v274 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "filteredArrayUsingPredicate:", v197));
  v198 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v274, "count")));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("suggestionCountInRecenTabFromPast7Days"), v198);

  v294 = objc_opt_new(NSMutableSet);
  v292 = objc_opt_new(NSMutableSet);
  v290 = objc_opt_new(NSMutableArray);
  v199 = objc_opt_new(NSNumber);
  v200 = objc_opt_new(NSNumber);
  v201 = objc_opt_new(NSNumber);
  v202 = objc_opt_new(NSNumber);
  v303 = v183;
  if ((unint64_t)objc_msgSend(v183, "count") < 3)
  {
    v305 = v199;
    v300 = 0;
  }
  else
  {
    v203 = 0;
    v300 = 0;
    do
    {
      v204 = v199;
      v205 = v200;
      v296 = v202;
      v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v203));
      v207 = objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "objectForKeyedSubscript:", CFSTR("bundleInterfaceType")));

      v208 = (NSNumber *)v207;
      v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v203));
      v305 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "objectForKeyedSubscript:", CFSTR("bundleSubType")));

      v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v203));
      v200 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "objectForKeyedSubscript:", CFSTR("bundleSuperType")));

      v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v203));
      v202 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("elapsedDaysFromBundleEndDate")));

      v201 = v208;
      if (-[NSNumber intValue](v208, "intValue") == 10)
      {
        ++v300;
        v199 = v305;
      }
      else
      {
        v199 = v305;
        -[NSMutableSet addObject:](v294, "addObject:", v305);
        -[NSMutableSet addObject:](v292, "addObject:", v200);
        -[NSMutableArray addObject:](v290, "addObject:", v202);
      }
      ++v203;
    }
    while (v203 != 3);
    v212 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](v294, "count")));
    v196 = v288;
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("uniqueBundleSubTypeCountForSensedBundlesInTop3"), v212);

    v213 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](v292, "count")));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("uniqueBundleSuperTypeCountForSensedBundlesInTop3"), v213);

    v214 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v290, "valueForKeyPath:", CFSTR("@avg.self")));
    objc_msgSend(v214, "floatValue");
    *(float *)&v216 = v215 * 10000.0;
    v217 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v216));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("averageBundleAgeInTop3"), v217);

    v218 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v290, "valueForKeyPath:", CFSTR("@max.self")));
    objc_msgSend(v218, "floatValue");
    *(float *)&v220 = v219 * 10000.0;
    v221 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v220));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("maxBundleAgeInTop3"), v221);

    v222 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v300));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("numPhotoMemoriesInTop3"), v222);

  }
  if ((unint64_t)objc_msgSend(v303, "count") >= 5)
  {
    v223 = 3;
    v224 = v305;
    do
    {
      v225 = v200;
      v297 = v202;
      v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v223));
      v227 = objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "objectForKeyedSubscript:", CFSTR("bundleInterfaceType")));

      v228 = (NSNumber *)v227;
      v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v223));
      v305 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("bundleSubType")));

      v230 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v223));
      v200 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "objectForKeyedSubscript:", CFSTR("bundleSuperType")));

      v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v223));
      v202 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("elapsedDaysFromBundleEndDate")));

      v201 = v228;
      if (-[NSNumber intValue](v228, "intValue") == 10)
      {
        ++v300;
        v224 = v305;
      }
      else
      {
        v224 = v305;
        -[NSMutableSet addObject:](v294, "addObject:", v305);
        -[NSMutableSet addObject:](v292, "addObject:", v200);
        -[NSMutableArray addObject:](v290, "addObject:", v202);
      }
      ++v223;
    }
    while (v223 != 5);
    v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](v294, "count")));
    v196 = v288;
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("uniqueBundleSubTypeCountForSensedBundlesInTop5"), v232);

    v233 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](v292, "count")));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("uniqueBundleSuperTypeCountForSensedBundlesInTop5"), v233);

    v234 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v290, "valueForKeyPath:", CFSTR("@avg.self")));
    objc_msgSend(v234, "floatValue");
    *(float *)&v236 = v235 * 10000.0;
    v237 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v236));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("averageBundleAgeInTop5"), v237);

    v238 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v290, "valueForKeyPath:", CFSTR("@max.self")));
    objc_msgSend(v238, "floatValue");
    *(float *)&v240 = v239 * 10000.0;
    v241 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v240));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("maxBundleAgeInTop5"), v241);

    v242 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v300));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("numPhotoMemoriesInTop5"), v242);

  }
  if ((unint64_t)objc_msgSend(v303, "count") >= 0xA)
  {
    v243 = 5;
    v244 = v305;
    do
    {
      v245 = v200;
      v298 = v202;
      v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v243));
      v247 = objc_claimAutoreleasedReturnValue(objc_msgSend(v246, "objectForKeyedSubscript:", CFSTR("bundleInterfaceType")));

      v248 = (NSNumber *)v247;
      v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v243));
      v305 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v249, "objectForKeyedSubscript:", CFSTR("bundleSubType")));

      v250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v243));
      v200 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v250, "objectForKeyedSubscript:", CFSTR("bundleSuperType")));

      v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "objectAtIndexedSubscript:", v243));
      v202 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "objectForKeyedSubscript:", CFSTR("elapsedDaysFromBundleEndDate")));

      v201 = v248;
      if (-[NSNumber intValue](v248, "intValue") == 10)
      {
        ++v300;
        v244 = v305;
      }
      else
      {
        v244 = v305;
        -[NSMutableSet addObject:](v294, "addObject:", v305);
        -[NSMutableSet addObject:](v292, "addObject:", v200);
        -[NSMutableArray addObject:](v290, "addObject:", v202);
      }
      ++v243;
    }
    while (v243 != 10);
    v252 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](v294, "count")));
    v196 = v288;
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("uniqueBundleSubTypeCountForSensedBundlesInTop10"), v252);

    v253 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](v292, "count")));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("uniqueBundleSuperTypeCountForSensedBundlesInTop10"), v253);

    v254 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v290, "valueForKeyPath:", CFSTR("@avg.self")));
    objc_msgSend(v254, "floatValue");
    *(float *)&v256 = v255 * 10000.0;
    v257 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v256));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("averageBundleAgeInTop10"), v257);

    v258 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v290, "valueForKeyPath:", CFSTR("@max.self")));
    objc_msgSend(v258, "floatValue");
    *(float *)&v260 = v259 * 10000.0;
    v261 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v260));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("maxBundleAgeInTop10"), v261);

    v262 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v300));
    -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v288, CFSTR("numPhotoMemoriesInTop10"), v262);

  }
  if (v196)
  {
    v306[0] = _NSConcreteStackBlock;
    v306[1] = 3221225472;
    v306[2] = __94__MOEventBundleRanking__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate___block_invoke_770;
    v306[3] = &unk_1002B2238;
    v307 = v196;
    AnalyticsSendEventLazy(CFSTR("com.apple.Moments.MOEventBundleRankingAggregated"), v306);
    v263 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    v264 = objc_claimAutoreleasedReturnValue(v263);
    if (os_log_type_enabled(v264, OS_LOG_TYPE_DEBUG))
      -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:].cold.2();

    v265 = v307;
  }
  else
  {
    v266 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    v265 = objc_claimAutoreleasedReturnValue(v266);
    if (os_log_type_enabled(v265, OS_LOG_TYPE_ERROR))
      -[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:].cold.1(v265, v267, v268, v269, v270, v271, v272, v273);
  }

}

id __94__MOEventBundleRanking__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __94__MOEventBundleRanking__submitEventBundleRankingAnalytics_withRankingInput_andSubmissionDate___block_invoke_770(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateEngagementScoreParamsUsingBFGS
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Number of iteration in BFGS %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __60__MOEventBundleRanking_updateEngagementScoreParamsUsingBFGS__block_invoke(uint64_t result, int a2, double a3)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  else
    *(double *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (void)_computeGradient:(double *)a3 initialParams:(double *)a4 Update:(double *)a5
{
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v9 = 0;
  v10 = *((_OWORD *)a3 + 5);
  v11 = *((_OWORD *)a3 + 3);
  v32 = *((_OWORD *)a3 + 4);
  v33 = v10;
  v12 = *((_OWORD *)a3 + 5);
  v34 = *((_OWORD *)a3 + 6);
  v13 = *((_OWORD *)a3 + 1);
  v29[0] = *(_OWORD *)a3;
  v29[1] = v13;
  v14 = *((_OWORD *)a3 + 3);
  v16 = *(_OWORD *)a3;
  v15 = *((_OWORD *)a3 + 1);
  v30 = *((_OWORD *)a3 + 2);
  v31 = v14;
  v25 = v32;
  v26 = v12;
  v27 = *((_OWORD *)a3 + 6);
  v35 = *((_QWORD *)a3 + 14);
  v28 = *((_QWORD *)a3 + 14);
  v21 = v16;
  v22 = v15;
  v23 = v30;
  v24 = v11;
  do
  {
    *(double *)((char *)v29 + v9) = *(double *)((char *)v29 + v9) + 0.000001;
    *(double *)((char *)&v21 + v9) = *(double *)((char *)&v21 + v9) + -0.000001;
    -[MOEventBundleRanking _generateBPROptUsing:initialParams:](self, "_generateBPROptUsing:initialParams:", v29, a4, v21, v22, v23, v24, v25, v26, v27, v28);
    v18 = v17;
    -[MOEventBundleRanking _generateBPROptUsing:initialParams:](self, "_generateBPROptUsing:initialParams:", &v21, a4);
    a5[v9 / 8] = (v18 - v19) / 0.000002;
    v20 = a3[v9 / 8];
    *(double *)((char *)v29 + v9) = v20;
    *(double *)((char *)&v21 + v9) = v20;
    v9 += 8;
  }
  while (v9 != 120);
}

- (double)_computeBPROptForPairs:(double *)a3 withTotalBundleCountsForInterfaceTypesHigherTier:(id)a4 WithTotalBundleCountsForInterfaceTypesLowerTier:(id)a5 bprOpt:(double)a6 pairWiseMult:(float)a7
{
  id v11;
  id v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  void *i;
  void *v17;
  void *v18;
  int v19;
  signed int v20;
  void *v21;
  void *v22;
  signed int v23;
  id v24;
  void *j;
  void *v26;
  void *v27;
  int v28;
  signed int v29;
  void *v30;
  void *v31;
  signed int v32;
  id v33;
  id v34;
  uint64_t v35;
  double v36;
  void *k;
  void *v38;
  NSMutableArray *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *m;
  void *v44;
  double v45;
  double v46;
  double v47;
  long double v48;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  id obja;
  NSMutableArray *objb;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];

  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "count") && objc_msgSend(v12, "count"))
  {
    v51 = v12;
    v13 = objc_opt_new(NSMutableArray);
    v14 = objc_opt_new(NSMutableArray);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v50 = v11;
    v15 = v11;
    obj = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    if (obj)
    {
      v52 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != obj; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v52)
            objc_enumerationMutation(v15);
          v17 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v17, v50));
          v19 = objc_msgSend(v18, "intValue");

          if (v19 >= 1)
          {
            v20 = 0;
            do
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3[objc_msgSend(v17, "intValue") - 1]));
              -[NSMutableArray addObject:](v13, "addObject:", v21);

              ++v20;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v17));
              v23 = objc_msgSend(v22, "intValue");

            }
            while (v20 < v23);
          }
        }
        obj = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
      }
      while (obj);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v24 = v51;
    obja = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    if (obja)
    {
      v53 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != obja; j = (char *)j + 1)
        {
          if (*(_QWORD *)v66 != v53)
            objc_enumerationMutation(v24);
          v26 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v26, v50));
          v28 = objc_msgSend(v27, "intValue");

          if (v28 >= 1)
          {
            v29 = 0;
            do
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3[objc_msgSend(v26, "intValue") - 1]));
              -[NSMutableArray addObject:](v14, "addObject:", v30);

              ++v29;
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v26));
              v32 = objc_msgSend(v31, "intValue");

            }
            while (v29 < v32);
          }
        }
        obja = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      }
      while (obja);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    objb = v13;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v62;
      v36 = a7;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(_QWORD *)v62 != v35)
            objc_enumerationMutation(objb);
          v38 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)k);
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v39 = v14;
          v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v58;
            do
            {
              for (m = 0; m != v41; m = (char *)m + 1)
              {
                if (*(_QWORD *)v58 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)m);
                objc_msgSend(v38, "doubleValue", v50);
                v46 = v45;
                objc_msgSend(v44, "doubleValue");
                v48 = exp(-(v46 - v47));
                a6 = a6 + log(1.0 / (v48 + 1.0)) * v36;
              }
              v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
            }
            while (v41);
          }

        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      }
      while (v34);
    }

    v11 = v50;
    v12 = v51;
  }

  return a6;
}

- (double)_generateBPROptUsing:(double *)a3 initialParams:(double *)a4
{
  uint64_t v7;
  double v8;
  NSDictionary *bprRegularizationFactor;
  void *v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  int v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  int v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  int v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  int v44;
  double v45;
  double v46;
  double v47;

  v7 = 0;
  v8 = 0.0;
  do
  {
    bprRegularizationFactor = self->_bprRegularizationFactor;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7 + 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](bprRegularizationFactor, "objectForKeyedSubscript:", v10));
    objc_msgSend(v11, "floatValue");
    v13 = a3[v7] - a4[v7];
    v8 = v8 + -(v13 * v12) * v13;

    ++v7;
  }
  while (v7 != 15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_interfaceTypeCountFromSuggestionEngagementDict, "objectForKeyedSubscript:", CFSTR("journalWasWritten")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_interfaceTypeCountFromSuggestionEngagementDict, "objectForKeyedSubscript:", CFSTR("journalEntryWasCreatedWithNoWriting")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_interfaceTypeCountFromSuggestionEngagementDict, "objectForKeyedSubscript:", CFSTR("suggestionWasViewedButNotEngaged")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_interfaceTypeCountFromSuggestionEngagementDict, "objectForKeyedSubscript:", CFSTR("suggestionWasDeleted")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pairWiseWeights, "objectForKeyedSubscript:", CFSTR("pairWiseFarthest")));
  objc_msgSend(v18, "floatValue");
  LODWORD(v20) = v19;
  -[MOEventBundleRanking _computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:](self, "_computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:", a3, v14, v17, v8, v20);
  v22 = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pairWiseWeights, "objectForKeyedSubscript:", CFSTR("pairWiseFarther")));
  objc_msgSend(v23, "floatValue");
  LODWORD(v25) = v24;
  -[MOEventBundleRanking _computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:](self, "_computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:", a3, v14, v16, v22, v25);
  v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pairWiseWeights, "objectForKeyedSubscript:", CFSTR("pairWiseFarther")));
  objc_msgSend(v28, "floatValue");
  LODWORD(v30) = v29;
  -[MOEventBundleRanking _computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:](self, "_computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:", a3, v15, v17, v27, v30);
  v32 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_engagementScoreParameterDict, "objectForKeyedSubscript:", CFSTR("pairWiseFar")));
  objc_msgSend(v33, "floatValue");
  LODWORD(v35) = v34;
  -[MOEventBundleRanking _computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:](self, "_computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:", a3, v14, v15, v32, v35);
  v37 = v36;

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pairWiseWeights, "objectForKeyedSubscript:", CFSTR("pairWiseFar")));
  objc_msgSend(v38, "floatValue");
  LODWORD(v40) = v39;
  -[MOEventBundleRanking _computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:](self, "_computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:", a3, v15, v16, v37, v40);
  v42 = v41;

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pairWiseWeights, "objectForKeyedSubscript:", CFSTR("pairWiseFar")));
  objc_msgSend(v43, "floatValue");
  LODWORD(v45) = v44;
  -[MOEventBundleRanking _computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:](self, "_computeBPROptForPairs:withTotalBundleCountsForInterfaceTypesHigherTier:WithTotalBundleCountsForInterfaceTypesLowerTier:bprOpt:pairWiseMult:", a3, v16, v17, v42, v45);
  v47 = v46;

  return -v47;
}

- (double)_calculateNormSquare:(double *)a3
{
  double __C;

  __C = 0.0;
  vDSP_dotprD(a3, 1, a3, 1, &__C, 0xFuLL);
  return __C;
}

- (void)_setToIdentityMatrix:(double *)a3 forNumRows:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  double v7;

  if (a4)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      for (i = 0; i != a4; ++i)
      {
        if (v4 == i)
          v7 = 1.0;
        else
          v7 = 0.0;
        a3[v5 + i] = v7;
      }
      ++v4;
      v5 += i;
    }
    while (v4 != a4);
  }
}

- (void)_lineSearch:(double *)a3 initialParams:(double *)a4 With:(double *)a5 And:(double *)a6 handler:(id)a7
{
  void (**v12)(id, _QWORD, double);
  double v13;
  double v14;
  unint64_t v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  id os_log;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  double v31;
  double v32;
  double __B;
  double __A[15];
  double v35[15];
  double __C[15];

  v12 = (void (**)(id, _QWORD, double))a7;
  __B = 1.0;
  -[MOEventBundleRanking _generateBPROptUsing:initialParams:](self, "_generateBPROptUsing:initialParams:", a3, a4);
  v14 = v13;
  v15 = 1;
  vDSP_vsmulD(a5, 1, &__B, __C, 1, 0xFuLL);
  vDSP_vaddD(a3, 1, __C, 1, v35, 1, 0xFuLL);
  -[MOEventBundleRanking _computeGradient:initialParams:Update:](self, "_computeGradient:initialParams:Update:", v35, a4, __A);
  v16 = 0;
  while (1)
  {
    -[MOEventBundleRanking _generateBPROptUsing:initialParams:](self, "_generateBPROptUsing:initialParams:", v35, a4);
    v18 = v17;
    v32 = 0.0;
    vDSP_mmulD(a6, 1, a5, 1, &v32, 1, 1uLL, 1uLL, 0xFuLL);
    v19 = v14 + v32 * 0.0001 * __B;
    v31 = 0.0;
    vDSP_mmulD(__A, 1, a5, 1, &v31, 1, 1uLL, 1uLL, 0xFuLL);
    if (v18 <= v19 && v31 > v32 * 0.9)
      break;
    __B = __B * 0.5;
    vDSP_vsmulD(a5, 1, &__B, __C, 1, 0xFuLL);
    vDSP_vaddD(a3, 1, __C, 1, v35, 1, 0xFuLL);
    -[MOEventBundleRanking _computeGradient:initialParams:Update:](self, "_computeGradient:initialParams:Update:", v35, a4, __A);
    v16 = v15++ > 0x63;
    if (v15 == 101)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v21 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[MOEventBundleRanking _lineSearch:initialParams:With:And:handler:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);

      v16 = 1;
      break;
    }
  }
  v29 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleRanking _lineSearch:initialParams:With:And:handler:].cold.1();

  ((void (**)(id, BOOL, double))v12)[2](v12, v16, __B);
}

- (id)_getDefaultFallbackFactorDict
{
  void *v2;
  id v3;
  _QWORD v5[10];
  _QWORD v6[10];

  v5[0] = CFSTR("decayRate");
  v5[1] = CFSTR("weightForNumAnamolyEventsNormalized");
  v6[0] = &off_1002DCE48;
  v6[1] = &off_1002DCE58;
  v5[2] = CFSTR("weightForNumTrendEventsNormalized");
  v5[3] = CFSTR("weightForNumRoutineEventsNormalized");
  v6[2] = &off_1002DCE58;
  v6[3] = &off_1002DCE68;
  v5[4] = CFSTR("weightForNumStateOfMindEventsNormalized");
  v5[5] = CFSTR("weightForLabelQualityScore");
  v6[4] = &off_1002DCD58;
  v6[5] = &off_1002DCD38;
  v5[6] = CFSTR("weightForTimeCorrelationScore");
  v5[7] = CFSTR("richnessScoreScalingParameter");
  v6[6] = &off_1002DCD38;
  v6[7] = &off_1002DCD18;
  v5[8] = CFSTR("bundleScoreScalingParameter");
  v5[9] = CFSTR("bundleScoreConstant");
  v6[8] = &off_1002DCD18;
  v6[9] = &off_1002DCD38;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 10));
  v3 = objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (void)identifyRepetitiveSignificantContactBundlesFromBundles:(id)a3 precedingSignificantContactBundles:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  id os_log;
  NSObject *v10;
  NSString *v11;
  void *v12;
  id v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSString *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  id v42;
  void *v43;
  void *v44;
  unsigned __int8 v45;
  unint64_t v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  NSMutableSet *v50;
  id v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned __int8 v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *i;
  void *v65;
  unsigned int v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  void *j;
  void *v79;
  void *v80;
  void *v81;
  NSString *v82;
  void *v83;
  void *v84;
  __CFString *v85;
  void *v86;
  id v87;
  id v88;
  NSString *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  const __CFString *v94;
  NSString *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  uint64_t v101;
  void *k;
  void *v103;
  void *v104;
  void *v105;
  unsigned int v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  NSMutableSet *v111;
  void *v112;
  NSMutableArray *obj;
  const char *v114;
  uint64_t v115;
  id v116;
  void *v117;
  void *v118;
  void *context;
  uint64_t v120;
  NSMutableArray *v121;
  id v122;
  id v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _QWORD v136[6];
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[5];
  _QWORD v142[4];
  NSMutableSet *v143;
  _BYTE v144[128];
  _BYTE v145[128];
  uint8_t v146[128];
  uint8_t buf[4];
  void *v148;
  __int16 v149;
  unint64_t v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  const __CFString *v154;
  __int16 v155;
  id v156;
  __int16 v157;
  id v158;
  _BYTE v159[128];
  id v160;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v142[0] = _NSConcreteStackBlock;
    v142[1] = 3221225472;
    v142[2] = __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke;
    v142[3] = &unk_1002B13E0;
    v8 = objc_opt_new(NSMutableSet);
    v143 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v142);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    v111 = v8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = objc_msgSend(v6, "count");
      v14 = -[NSMutableSet count](v111, "count");
      v15 = (const __CFString *)objc_msgSend(v7, "count");
      *(_DWORD *)buf = 138413058;
      v148 = v12;
      v149 = 2048;
      v150 = (unint64_t)v13;
      v151 = 2048;
      v152 = (uint64_t)v14;
      v153 = 2048;
      v154 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@, event bundle count, %lu, contact bundle count, %lu, preceding contact bundle count, %lu", buf, 0x2Au);

      v8 = v111;
    }
    v112 = v6;

    if (objc_msgSend(v7, "count"))
      -[NSMutableSet addObjectsFromArray:](v8, "addObjectsFromArray:", v7);
    v110 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v8, "allObjects"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v16));

    v109 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v160 = v109;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v160, 1));
    objc_msgSend(v17, "sortUsingDescriptors:", v18);

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v114 = a2;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = objc_msgSend(v17, "count");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "firstObject"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "lastObject"));
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));
      *(_DWORD *)buf = 138413058;
      v148 = v22;
      v149 = 2048;
      v150 = (unint64_t)v23;
      v151 = 2112;
      v152 = (uint64_t)v25;
      v153 = 2112;
      v154 = v27;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@, merged contact bundle count, %lu, first bundle start date, %@, last bundle start date, %@", buf, 0x2Au);

      a2 = v114;
    }

    v141[0] = _NSConcreteStackBlock;
    v141[1] = 3221225472;
    v141[2] = __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_778;
    v141[3] = &__block_descriptor_40_e30_v32__0__MOEventBundle_8Q16_B24l;
    v141[4] = a2;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v141);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate firstSaturdayBeforeReferenceDate:](NSDate, "firstSaturdayBeforeReferenceDate:", v29));

    v31 = objc_opt_new(NSMutableArray);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "endDate"));
    v34 = v30;
    LODWORD(v30) = objc_msgSend(v30, "isBeforeDate:", v33);

    if ((_DWORD)v30)
    {
      do
      {
        v35 = v34;
        v36 = objc_autoreleasePoolPush();
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "dateByAddingTimeInterval:", 604800.0));
        v38 = (void *)v37;
        if (v34)
        {
          if (v37)
          {
            v39 = v34;
            v40 = v38;
            v41 = objc_msgSend(v39, "isBeforeDate:", v38);
            v38 = v40;
            if (v41)
            {
              v42 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v35, v40);
              -[NSMutableArray addObject:](v31, "addObject:", v42);

              v38 = v40;
            }
          }
        }
        v34 = v38;

        objc_autoreleasePoolPop(v36);
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "endDate"));
        v45 = objc_msgSend(v34, "isBeforeDate:", v44);

      }
      while ((v45 & 1) != 0);
    }
    v108 = v34;
    v121 = objc_opt_new(NSMutableArray);
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    obj = v31;
    v116 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
    if (v116)
    {
      v46 = 0;
      v115 = *(_QWORD *)v138;
      do
      {
        v47 = 0;
        do
        {
          if (*(_QWORD *)v138 != v115)
            objc_enumerationMutation(obj);
          v122 = *(id *)(*((_QWORD *)&v137 + 1) + 8 * v47);
          context = objc_autoreleasePoolPush();
          v48 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v49 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            v95 = NSStringFromSelector(a2);
            v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
            v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "startDate"));
            v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "endDate"));
            *(_DWORD *)buf = 138412802;
            v148 = v96;
            v149 = 2112;
            v150 = (unint64_t)v97;
            v151 = 2112;
            v152 = (uint64_t)v98;
            _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "%@, interval startDate, %@, interval endDate, %@", buf, 0x20u);

          }
          v120 = v47;

          v50 = objc_opt_new(NSMutableSet);
          while (v46 < (unint64_t)objc_msgSend(v17, "count"))
          {
            v51 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
            v52 = objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              v82 = NSStringFromSelector(a2);
              v117 = (void *)objc_claimAutoreleasedReturnValue(v82);
              v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v46));
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "bundleIdentifier"));
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v46));
              v85 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "startDate"));
              v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v46));
              v87 = objc_msgSend(v86, "summarizationGranularity");
              v88 = -[NSMutableSet count](v50, "count");
              *(_DWORD *)buf = 138413570;
              v148 = v117;
              v149 = 2048;
              v150 = v46;
              v151 = 2112;
              v152 = (uint64_t)v83;
              v153 = 2112;
              v154 = v85;
              v155 = 2048;
              v156 = v87;
              v157 = 2048;
              v158 = v88;
              _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%@, bundle idx, %lu, identifier, %@, startDate, %@, summarizationGranularity, %lu, contactIdentifierList count, %lu", buf, 0x3Eu);

              a2 = v114;
            }

            v136[0] = _NSConcreteStackBlock;
            v136[1] = 3221225472;
            v136[2] = __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_780;
            v136[3] = &__block_descriptor_48_e22_v24__0__NSString_8_B16l;
            v136[4] = a2;
            v136[5] = v46;
            -[NSMutableSet enumerateObjectsUsingBlock:](v50, "enumerateObjectsUsingBlock:", v136);
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v46));
            v54 = objc_msgSend(v53, "summarizationGranularity");

            if (v54 == (id)1)
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v46));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "startDate"));
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "endDate"));
              v58 = objc_msgSend(v56, "isAfterDate:", v57);

              if ((v58 & 1) != 0)
                break;
              v134 = 0u;
              v135 = 0u;
              v132 = 0u;
              v133 = 0u;
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v46));
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "persons"));

              v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
              if (v61)
              {
                v62 = v61;
                v63 = *(_QWORD *)v133;
                while (2)
                {
                  for (i = 0; i != v62; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v133 != v63)
                      objc_enumerationMutation(v60);
                    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v132 + 1)
                                                                                       + 8 * (_QWORD)i), "contactIdentifier"));
                    v66 = -[NSMutableSet containsObject:](v50, "containsObject:", v65);

                    if (v66)
                    {
                      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v46));
                      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "bundleIdentifier"));
                      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "UUIDString"));
                      -[NSMutableArray addObject:](v121, "addObject:", v70);

                      v67 = 1;
                      goto LABEL_38;
                    }
                  }
                  v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
                  if (v62)
                    continue;
                  break;
                }
                v67 = 0;
              }
              else
              {
                v67 = 0;
              }
LABEL_38:

              v71 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
              v72 = objc_claimAutoreleasedReturnValue(v71);
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
              {
                v89 = NSStringFromSelector(a2);
                v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
                v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v46));
                v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "bundleIdentifier"));
                v93 = (void *)v92;
                *(_DWORD *)buf = 138413058;
                v94 = CFSTR("NO");
                if (v67)
                  v94 = CFSTR("YES");
                v148 = v90;
                v149 = 2048;
                v150 = v46;
                v151 = 2112;
                v152 = v92;
                v153 = 2112;
                v154 = v94;
                _os_log_debug_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "%@, bundle idx, %lu, identifier, %@, repetitiveBundle, %@", buf, 0x2Au);

              }
              if ((v67 & 1) == 0)
              {
                v130 = 0u;
                v131 = 0u;
                v128 = 0u;
                v129 = 0u;
                v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v46));
                v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "persons"));

                v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
                if (v75)
                {
                  v76 = v75;
                  v77 = *(_QWORD *)v129;
                  do
                  {
                    for (j = 0; j != v76; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v129 != v77)
                        objc_enumerationMutation(v74);
                      v79 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)j);
                      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "contactIdentifier"));

                      if (v80)
                      {
                        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "contactIdentifier"));
                        -[NSMutableSet addObject:](v50, "addObject:", v81);

                      }
                    }
                    v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
                  }
                  while (v76);
                }

              }
            }
            ++v46;
          }

          objc_autoreleasePoolPop(context);
          v47 = v120 + 1;
        }
        while ((id)(v120 + 1) != v116);
        v116 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
      }
      while (v116);
    }

    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    v123 = v112;
    v99 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v124, v144, 16);
    if (v99)
    {
      v100 = v99;
      v101 = *(_QWORD *)v125;
      do
      {
        for (k = 0; k != v100; k = (char *)k + 1)
        {
          if (*(_QWORD *)v125 != v101)
            objc_enumerationMutation(v123);
          v103 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)k);
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "bundleIdentifier"));
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "UUIDString"));
          v106 = -[NSMutableArray containsObject:](v121, "containsObject:", v105);

          if (v106)
            v107 = &__kCFBooleanTrue;
          else
            v107 = &__kCFBooleanFalse;
          objc_msgSend(v103, "addMetaDataForRankForKey:value:", CFSTR("isRepetitiveContact"), v107);
        }
        v100 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v124, v144, 16);
      }
      while (v100);
    }

    v6 = v112;
    v7 = v110;
  }

}

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "interfaceType") == (id)4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_778(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id os_log;
  NSObject *v7;
  NSString *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;

  v5 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 138412802;
    v11 = v9;
    v12 = 2048;
    v13 = a3;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, bundle, %@", (uint8_t *)&v10, 0x20u);

  }
}

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_780(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_780_cold_1(a1);

}

- (id)_getDefaultRichnessWeightDict
{
  NSMutableDictionary *v2;
  unint64_t i;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];

  v2 = objc_opt_new(NSMutableDictionary);
  for (i = 0; i != 17; ++i)
  {
    v4 = objc_opt_new(NSMutableDictionary);
    v5 = v4;
    if (i <= 0x10)
    {
      v6 = off_1002B4990[i];
      v7 = off_1002B4A18[i];
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", off_1002B4908[i], CFSTR("RankingRichnessPrimaryPriorityScoreKey"));
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, CFSTR("RankingRichnessSecondaryPriorityScoreKey"));
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, CFSTR("RankingRichnessAuxiliaryPriorityScoreKey"));
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", i));
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v5, v8);

  }
  v15[0] = CFSTR("RankingRichnessPrimaryPriorityScoreKey");
  v15[1] = CFSTR("RankingRichnessSecondaryPriorityScoreKey");
  v16[0] = &off_1002DCE78;
  v16[1] = &off_1002DCE78;
  v15[2] = CFSTR("RankingRichnessAuxiliaryPriorityScoreKey");
  v16[2] = &off_1002DCE78;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v9, CFSTR("NumUniqueResourceTypesNormalizedKey"));
  v13[0] = CFSTR("RankingRichnessPrimaryPriorityScoreKey");
  v13[1] = CFSTR("RankingRichnessSecondaryPriorityScoreKey");
  v14[0] = &off_1002DCE78;
  v14[1] = &off_1002DCE78;
  v13[2] = CFSTR("RankingRichnessAuxiliaryPriorityScoreKey");
  v14[2] = &off_1002DCE78;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v10, CFSTR("NumWorkoutRouteMapAssets"));
  v11 = -[NSMutableDictionary copy](v2, "copy");

  return v11;
}

- (id)_checkAndUpdateNumericLimits:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  id os_log;
  NSObject *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v23;
    *(_QWORD *)&v7 = 138412290;
    v21 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v11, v21));
        v14 = objc_opt_class(NSNumber, v13);
        if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0)
          goto LABEL_9;
        objc_msgSend(v12, "doubleValue");
        if (fabs(v15) != INFINITY)
        {
          objc_msgSend(v12, "doubleValue");
LABEL_9:
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v11));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, v11);

          goto LABEL_10;
        }
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v18 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v21;
          v27 = v11;
          _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Value is either infinite or NaN for key %@", buf, 0xCu);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &off_1002DD128, v11);
LABEL_10:

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      v8 = v19;
    }
    while (v19);
  }

  return v4;
}

- (id)dictionary
{
  NSMutableDictionary *v3;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  _QWORD v27[5];
  NSMutableDictionary *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSMutableDictionary *v31;
  _QWORD *v32;
  _QWORD v33[4];
  NSMutableDictionary *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingAlgorithmVersion](self, "rankingAlgorithmVersion"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("kMORankingAlgorithmVersion"), v4);

  v5 = objc_opt_new(NSMutableDictionary);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__30;
  v36[4] = __Block_byref_object_dispose__30;
  v37 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking staticModelParameterMatrix](self, "staticModelParameterMatrix"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __34__MOEventBundleRanking_dictionary__block_invoke;
  v33[3] = &unk_1002B48C0;
  v35 = v36;
  v7 = v5;
  v34 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v33);

  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("staticModelParameterMatrix"), v7);
  v8 = objc_opt_new(NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking dynamicModelParameterDict](self, "dynamicModelParameterDict"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __34__MOEventBundleRanking_dictionary__block_invoke_2;
  v30[3] = &unk_1002B48C0;
  v32 = v36;
  v10 = v8;
  v31 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v30);

  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("dynamicModelParameterDict"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("heuristicsParameterDict"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking engagementScoreParameterDict](self, "engagementScoreParameterDict"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("engagementScoreParameterDict"), v12);

  -[MOEventBundleRanking engagementScoreWeight](self, "engagementScoreWeight");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("engagementScoreWeight"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("rankingScoreThresholdDict"), v14);

  -[MOEventBundleRanking frequencyPenalty](self, "frequencyPenalty");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("frequencyPenaltyCoefficient"), v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking curationParameterDict](self, "curationParameterDict"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("curationParameterDict"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking evergreenEngagementScoreParameterDict](self, "evergreenEngagementScoreParameterDict"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("evergreenEngagementScoreParameterDict"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking viewCountBasedAdjustmentParameterDict](self, "viewCountBasedAdjustmentParameterDict"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v3, CFSTR("viewCountBasedAdjustmentParameterDict"), v18);

  v19 = objc_opt_new(NSMutableDictionary);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking bprRegularizationFactor](self, "bprRegularizationFactor"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __34__MOEventBundleRanking_dictionary__block_invoke_3;
  v27[3] = &unk_1002B48E8;
  v29 = v36;
  v27[4] = self;
  v21 = v3;
  v28 = v21;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v27);

  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v21, CFSTR("bprRegularizationFactor"), v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking pairWiseWeights](self, "pairWiseWeights"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v21, CFSTR("pairWiseWeights"), v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking richnessWeightsDict](self, "richnessWeightsDict"));
  -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:](self, "safeSavePropertyToDictionary:withKey:andValue:", v21, CFSTR("richnessWeightsDict"), v23);

  v24 = v28;
  v25 = v21;

  _Block_object_dispose(v36, 8);
  return v25;
}

void __34__MOEventBundleRanking_dictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundle getInterfaceTypeString:superType:](MOEventBundle, "getInterfaceTypeString:superType:", (int)objc_msgSend(a2, "intValue"), 0));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __34__MOEventBundleRanking_dictionary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundle getInterfaceTypeString:superType:](MOEventBundle, "getInterfaceTypeString:superType:", (int)objc_msgSend(a2, "intValue"), 0));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __34__MOEventBundleRanking_dictionary__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundle getInterfaceTypeString:superType:](MOEventBundle, "getInterfaceTypeString:superType:", (int)objc_msgSend(a2, "intValue"), 0));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "safeSavePropertyToDictionary:withKey:andValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
}

- (void)safeSavePropertyToDictionary:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id os_log;
  NSObject *v11;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(a3, "setObject:forKey:", v8, v7);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[MOEventBundleRanking safeSavePropertyToDictionary:withKey:andValue:].cold.1();

  }
}

- (void)encodeWithCoder:(id)a3
{
  float frequencyPenalty;
  double v5;
  void *v6;
  void *v7;
  id v8;

  frequencyPenalty = self->_frequencyPenalty;
  v8 = a3;
  *(float *)&v5 = frequencyPenalty;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("frequencyPenaltyCoefficient"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_recommendedTabVisitFIThreshold));
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("recommendedTabVisitFIThreshold"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_richnessWeightsDict, CFSTR("richnessWeightsDict"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_staticModelParameterMatrix, CFSTR("staticModelParameterMatrix"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_dynamicModelParameterDict, CFSTR("dynamicModelParameterDict"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_heuristicsParameterDict, CFSTR("heuristicsParameterDict"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_engagementScoreParameterDict, CFSTR("engagementScoreParameterDict"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_rankingScoreThresholdDict, CFSTR("rankingScoreThresholdDict"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_viewCountBasedAdjustmentParameterDict, CFSTR("viewCountBasedAdjustmentParameterDict"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_interfaceTypeCountFromSuggestionEngagementDict, CFSTR("interfaceTypeCountFromSuggestionEngagement"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_bprRegularizationFactor, CFSTR("bprRegularizationFactor"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_pairWiseWeights, CFSTR("pairWiseWeights"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_evergreenEngagementScoreParameterDict, CFSTR("evergreenEngagementScoreParameterDict"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_curationParameterDict, CFSTR("curationParameterDict"));

}

- (MOEventBundleRanking)initWithCoder:(id)a3
{
  id v4;
  MOConfigurationManagerBase *v5;
  MOEventBundleRanking *v6;
  uint64_t v7;
  id v8;
  void *v9;
  float v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSSet *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *richnessWeightsDict;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSSet *v29;
  void *v30;
  uint64_t v31;
  NSDictionary *staticModelParameterMatrix;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSSet *v38;
  void *v39;
  uint64_t v40;
  NSDictionary *dynamicModelParameterDict;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSSet *v47;
  void *v48;
  uint64_t v49;
  NSDictionary *heuristicsParameterDict;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSSet *v56;
  void *v57;
  uint64_t v58;
  NSDictionary *engagementScoreParameterDict;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSSet *v65;
  void *v66;
  uint64_t v67;
  NSDictionary *rankingScoreThresholdDict;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSSet *v74;
  void *v75;
  uint64_t v76;
  NSDictionary *viewCountBasedAdjustmentParameterDict;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSSet *v83;
  void *v84;
  uint64_t v85;
  NSDictionary *interfaceTypeCountFromSuggestionEngagementDict;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSSet *v92;
  void *v93;
  uint64_t v94;
  NSDictionary *bprRegularizationFactor;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSSet *v101;
  void *v102;
  uint64_t v103;
  NSMutableDictionary *pairWiseWeights;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSSet *v110;
  void *v111;
  uint64_t v112;
  NSDictionary *evergreenEngagementScoreParameterDict;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  NSSet *v119;
  void *v120;
  uint64_t v121;
  NSDictionary *curationParameterDict;

  v4 = a3;
  v5 = objc_alloc_init(MOConfigurationManagerBase);
  v6 = -[MOEventBundleRanking initWithConfigurationManager:](self, "initWithConfigurationManager:", v5);

  if (v6)
  {
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v7), CFSTR("frequencyPenaltyCoefficient"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v9, "floatValue");
    v6->_frequencyPenalty = v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v11), CFSTR("recommendedTabVisitFIThreshold"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v13, "doubleValue");
    v6->_recommendedTabVisitFIThreshold = v14;

    v16 = objc_opt_class(NSDictionary, v15);
    v18 = objc_opt_class(NSString, v17);
    v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, v18, objc_opt_class(NSNumber, v19), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("richnessWeightsDict")));
    richnessWeightsDict = v6->_richnessWeightsDict;
    v6->_richnessWeightsDict = (NSDictionary *)v22;

    v25 = objc_opt_class(NSDictionary, v24);
    v27 = objc_opt_class(NSString, v26);
    v29 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, v27, objc_opt_class(NSNumber, v28), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("staticModelParameterMatrix")));
    staticModelParameterMatrix = v6->_staticModelParameterMatrix;
    v6->_staticModelParameterMatrix = (NSDictionary *)v31;

    v34 = objc_opt_class(NSDictionary, v33);
    v36 = objc_opt_class(NSString, v35);
    v38 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v34, v36, objc_opt_class(NSNumber, v37), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("dynamicModelParameterDict")));
    dynamicModelParameterDict = v6->_dynamicModelParameterDict;
    v6->_dynamicModelParameterDict = (NSDictionary *)v40;

    v43 = objc_opt_class(NSDictionary, v42);
    v45 = objc_opt_class(NSString, v44);
    v47 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v43, v45, objc_opt_class(NSNumber, v46), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("heuristicsParameterDict")));
    heuristicsParameterDict = v6->_heuristicsParameterDict;
    v6->_heuristicsParameterDict = (NSDictionary *)v49;

    v52 = objc_opt_class(NSDictionary, v51);
    v54 = objc_opt_class(NSString, v53);
    v56 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v52, v54, objc_opt_class(NSNumber, v55), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v57, CFSTR("engagementScoreParameterDict")));
    engagementScoreParameterDict = v6->_engagementScoreParameterDict;
    v6->_engagementScoreParameterDict = (NSDictionary *)v58;

    v61 = objc_opt_class(NSDictionary, v60);
    v63 = objc_opt_class(NSString, v62);
    v65 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v61, v63, objc_opt_class(NSNumber, v64), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v66, CFSTR("rankingScoreThresholdDict")));
    rankingScoreThresholdDict = v6->_rankingScoreThresholdDict;
    v6->_rankingScoreThresholdDict = (NSDictionary *)v67;

    v70 = objc_opt_class(NSDictionary, v69);
    v72 = objc_opt_class(NSString, v71);
    v74 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v70, v72, objc_opt_class(NSNumber, v73), 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
    v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v75, CFSTR("viewCountBasedAdjustmentParameterDict")));
    viewCountBasedAdjustmentParameterDict = v6->_viewCountBasedAdjustmentParameterDict;
    v6->_viewCountBasedAdjustmentParameterDict = (NSDictionary *)v76;

    v79 = objc_opt_class(NSDictionary, v78);
    v81 = objc_opt_class(NSString, v80);
    v83 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v79, v81, objc_opt_class(NSNumber, v82), 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
    v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v84, CFSTR("interfaceTypeCountFromSuggestionEngagement")));
    interfaceTypeCountFromSuggestionEngagementDict = v6->_interfaceTypeCountFromSuggestionEngagementDict;
    v6->_interfaceTypeCountFromSuggestionEngagementDict = (NSDictionary *)v85;

    v88 = objc_opt_class(NSDictionary, v87);
    v90 = objc_opt_class(NSString, v89);
    v92 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v88, v90, objc_opt_class(NSNumber, v91), 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
    v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v93, CFSTR("bprRegularizationFactor")));
    bprRegularizationFactor = v6->_bprRegularizationFactor;
    v6->_bprRegularizationFactor = (NSDictionary *)v94;

    v97 = objc_opt_class(NSDictionary, v96);
    v99 = objc_opt_class(NSString, v98);
    v101 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v97, v99, objc_opt_class(NSNumber, v100), 0);
    v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
    v103 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v102, CFSTR("pairWiseWeights")));
    pairWiseWeights = v6->_pairWiseWeights;
    v6->_pairWiseWeights = (NSMutableDictionary *)v103;

    v106 = objc_opt_class(NSDictionary, v105);
    v108 = objc_opt_class(NSString, v107);
    v110 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v106, v108, objc_opt_class(NSNumber, v109), 0);
    v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
    v112 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v111, CFSTR("evergreenEngagementScoreParameterDict")));
    evergreenEngagementScoreParameterDict = v6->_evergreenEngagementScoreParameterDict;
    v6->_evergreenEngagementScoreParameterDict = (NSDictionary *)v112;

    v115 = objc_opt_class(NSDictionary, v114);
    v117 = objc_opt_class(NSString, v116);
    v119 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v115, v117, objc_opt_class(NSNumber, v118), 0);
    v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
    v121 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v120, CFSTR("curationParameterDict")));
    curationParameterDict = v6->_curationParameterDict;
    v6->_curationParameterDict = (NSDictionary *)v121;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventBundleRanking *v4;
  void *v5;
  MOEventBundleRanking *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;

  v4 = [MOEventBundleRanking alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking configurationManager](self, "configurationManager"));
  v6 = -[MOEventBundleRanking initWithConfigurationManager:](v4, "initWithConfigurationManager:", v5);

  if (v6)
  {
    -[MOEventBundleRanking frequencyPenalty](self, "frequencyPenalty");
    -[MOEventBundleRanking setFrequencyPenalty:](v6, "setFrequencyPenalty:");
    -[MOEventBundleRanking recommendedTabVisitFIThreshold](self, "recommendedTabVisitFIThreshold");
    -[MOEventBundleRanking setRecommendedTabVisitFIThreshold:](v6, "setRecommendedTabVisitFIThreshold:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking richnessWeightsDict](self, "richnessWeightsDict"));
    v8 = objc_msgSend(v7, "copy");
    -[MOEventBundleRanking setRichnessWeightsDict:](v6, "setRichnessWeightsDict:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking staticModelParameterMatrix](self, "staticModelParameterMatrix"));
    v10 = objc_msgSend(v9, "copy");
    -[MOEventBundleRanking setStaticModelParameterMatrix:](v6, "setStaticModelParameterMatrix:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking dynamicModelParameterDict](self, "dynamicModelParameterDict"));
    v12 = objc_msgSend(v11, "copy");
    -[MOEventBundleRanking setDynamicModelParameterDict:](v6, "setDynamicModelParameterDict:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking heuristicsParameterDict](self, "heuristicsParameterDict"));
    v14 = objc_msgSend(v13, "copy");
    -[MOEventBundleRanking setHeuristicsParameterDict:](v6, "setHeuristicsParameterDict:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking engagementScoreParameterDict](self, "engagementScoreParameterDict"));
    v16 = objc_msgSend(v15, "copy");
    -[MOEventBundleRanking setEngagementScoreParameterDict:](v6, "setEngagementScoreParameterDict:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking rankingScoreThresholdDict](self, "rankingScoreThresholdDict"));
    v18 = objc_msgSend(v17, "copy");
    -[MOEventBundleRanking setRankingScoreThresholdDict:](v6, "setRankingScoreThresholdDict:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking viewCountBasedAdjustmentParameterDict](self, "viewCountBasedAdjustmentParameterDict"));
    v20 = objc_msgSend(v19, "copy");
    -[MOEventBundleRanking setViewCountBasedAdjustmentParameterDict:](v6, "setViewCountBasedAdjustmentParameterDict:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking interfaceTypeCountFromSuggestionEngagementDict](self, "interfaceTypeCountFromSuggestionEngagementDict"));
    v22 = objc_msgSend(v21, "copy");
    -[MOEventBundleRanking setInterfaceTypeCountFromSuggestionEngagementDict:](v6, "setInterfaceTypeCountFromSuggestionEngagementDict:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking bprRegularizationFactor](self, "bprRegularizationFactor"));
    v24 = objc_msgSend(v23, "copy");
    -[MOEventBundleRanking setBprRegularizationFactor:](v6, "setBprRegularizationFactor:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking pairWiseWeights](self, "pairWiseWeights"));
    v26 = objc_msgSend(v25, "copy");
    -[MOEventBundleRanking setPairWiseWeights:](v6, "setPairWiseWeights:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking evergreenEngagementScoreParameterDict](self, "evergreenEngagementScoreParameterDict"));
    v28 = objc_msgSend(v27, "copy");
    -[MOEventBundleRanking setEvergreenEngagementScoreParameterDict:](v6, "setEvergreenEngagementScoreParameterDict:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleRanking curationParameterDict](self, "curationParameterDict"));
    v30 = objc_msgSend(v29, "copy");
    -[MOEventBundleRanking setCurationParameterDict:](v6, "setCurationParameterDict:", v30);

  }
  return v6;
}

- (void)updateTripMetaDataForRank:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  void *i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id os_log;
  NSObject *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  NSObject *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  char v40;
  _BYTE v41[15];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  _BYTE v50[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "places"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "places"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (!v9)
    {
LABEL_24:

      goto LABEL_25;
    }
    v10 = v9;
    v39 = v5;
    v11 = *(_QWORD *)v43;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
        if (v17)
        {
          v18 = (void *)v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
            objc_msgSend(v20, "timeIntervalSinceDate:", v21);
            v23 = v22;

            objc_msgSend(v16, "distanceToHomeInMiles");
            *(float *)&v24 = v24;
            if (*(float *)&v24 >= 0.0)
            {
              objc_msgSend(v16, "distanceToHomeInMiles");
              *(float *)&v28 = v28;
              objc_msgSend(v16, "distanceToHomeInMiles", v28);
              *(float *)&v29 = v29;
              v14 = v14 + *(float *)&v29 * v23;
            }
            else
            {
              os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
              v26 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v47 = "-[MOEventBundleRanking updateTripMetaDataForRank:]";
                v48 = 1024;
                v49 = 3531;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Trip bundle distanceToHomeInMiles is negative (in %s:%d)", buf, 0x12u);
              }

              v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
              objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleRanking.m"), 3531, CFSTR("Trip bundle distanceToHomeInMiles is negative (in %s:%d)"), "-[MOEventBundleRanking updateTripMetaDataForRank:]", 3531);

            }
            objc_msgSend(v16, "familiarityIndexLOI");
            *(float *)&v30 = v30;
            if (*(float *)&v30 == -1.0)
            {
              v32 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
              v33 = objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
                -[MOEventBundleRanking updateTripMetaDataForRank:].cold.1(&v40, v41);

            }
            else
            {
              objc_msgSend(v16, "familiarityIndexLOI");
              *(float *)&v31 = v31;
              v13 = v13 + *(float *)&v31 * v23;
            }
            v12 = v23 + v12;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v10);

    v5 = v39;
    if (v12 > 0.0)
    {
      *(float *)&v34 = v14 / v12;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34));
      objc_msgSend(v39, "addMetaDataForRankForKey:value:", CFSTR("DistanceToHome"), v35);

      *(float *)&v36 = v12;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36));
      objc_msgSend(v39, "addMetaDataForRankForKey:value:", CFSTR("VisitDuration"), v37);

      *(float *)&v38 = v13 / v12;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v38));
      objc_msgSend(v39, "addMetaDataForRankForKey:value:", CFSTR("FamiliarityIndex"), v8);
      goto LABEL_24;
    }
  }
LABEL_25:

}

- (float)frequencyPenalty
{
  return self->_frequencyPenalty;
}

- (void)setFrequencyPenalty:(float)a3
{
  self->_frequencyPenalty = a3;
}

- (double)recommendedTabVisitFIThreshold
{
  return self->_recommendedTabVisitFIThreshold;
}

- (void)setRecommendedTabVisitFIThreshold:(double)a3
{
  self->_recommendedTabVisitFIThreshold = a3;
}

- (NSDictionary)richnessWeightsDict
{
  return self->_richnessWeightsDict;
}

- (void)setRichnessWeightsDict:(id)a3
{
  objc_storeStrong((id *)&self->_richnessWeightsDict, a3);
}

- (NSDictionary)staticModelParameterMatrix
{
  return self->_staticModelParameterMatrix;
}

- (void)setStaticModelParameterMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_staticModelParameterMatrix, a3);
}

- (NSDictionary)dynamicModelParameterDict
{
  return self->_dynamicModelParameterDict;
}

- (void)setDynamicModelParameterDict:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicModelParameterDict, a3);
}

- (NSDictionary)heuristicsParameterDict
{
  return self->_heuristicsParameterDict;
}

- (void)setHeuristicsParameterDict:(id)a3
{
  objc_storeStrong((id *)&self->_heuristicsParameterDict, a3);
}

- (NSDictionary)engagementScoreParameterDict
{
  return self->_engagementScoreParameterDict;
}

- (void)setEngagementScoreParameterDict:(id)a3
{
  objc_storeStrong((id *)&self->_engagementScoreParameterDict, a3);
}

- (float)engagementScoreWeight
{
  return self->_engagementScoreWeight;
}

- (void)setEngagementScoreWeight:(float)a3
{
  self->_engagementScoreWeight = a3;
}

- (NSDictionary)rankingScoreThresholdDict
{
  return self->_rankingScoreThresholdDict;
}

- (void)setRankingScoreThresholdDict:(id)a3
{
  objc_storeStrong((id *)&self->_rankingScoreThresholdDict, a3);
}

- (NSString)rankingAlgorithmVersion
{
  return self->_rankingAlgorithmVersion;
}

- (void)setRankingAlgorithmVersion:(id)a3
{
  objc_storeStrong((id *)&self->_rankingAlgorithmVersion, a3);
}

- (NSDictionary)viewCountBasedAdjustmentParameterDict
{
  return self->_viewCountBasedAdjustmentParameterDict;
}

- (void)setViewCountBasedAdjustmentParameterDict:(id)a3
{
  objc_storeStrong((id *)&self->_viewCountBasedAdjustmentParameterDict, a3);
}

- (NSDictionary)interfaceTypeCountFromSuggestionEngagementDict
{
  return self->_interfaceTypeCountFromSuggestionEngagementDict;
}

- (void)setInterfaceTypeCountFromSuggestionEngagementDict:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceTypeCountFromSuggestionEngagementDict, a3);
}

- (NSDictionary)bprRegularizationFactor
{
  return self->_bprRegularizationFactor;
}

- (void)setBprRegularizationFactor:(id)a3
{
  objc_storeStrong((id *)&self->_bprRegularizationFactor, a3);
}

- (NSMutableDictionary)pairWiseWeights
{
  return self->_pairWiseWeights;
}

- (void)setPairWiseWeights:(id)a3
{
  objc_storeStrong((id *)&self->_pairWiseWeights, a3);
}

- (NSDictionary)evergreenEngagementScoreParameterDict
{
  return self->_evergreenEngagementScoreParameterDict;
}

- (void)setEvergreenEngagementScoreParameterDict:(id)a3
{
  objc_storeStrong((id *)&self->_evergreenEngagementScoreParameterDict, a3);
}

- (NSDictionary)curationParameterDict
{
  return self->_curationParameterDict;
}

- (void)setCurationParameterDict:(id)a3
{
  objc_storeStrong((id *)&self->_curationParameterDict, a3);
}

- (MOConfigurationManagerBase)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (float)elapsedDaysSinceOnboardingDate
{
  return self->_elapsedDaysSinceOnboardingDate;
}

- (void)setElapsedDaysSinceOnboardingDate:(float)a3
{
  self->_elapsedDaysSinceOnboardingDate = a3;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_curationParameterDict, 0);
  objc_storeStrong((id *)&self->_evergreenEngagementScoreParameterDict, 0);
  objc_storeStrong((id *)&self->_pairWiseWeights, 0);
  objc_storeStrong((id *)&self->_bprRegularizationFactor, 0);
  objc_storeStrong((id *)&self->_interfaceTypeCountFromSuggestionEngagementDict, 0);
  objc_storeStrong((id *)&self->_viewCountBasedAdjustmentParameterDict, 0);
  objc_storeStrong((id *)&self->_rankingAlgorithmVersion, 0);
  objc_storeStrong((id *)&self->_rankingScoreThresholdDict, 0);
  objc_storeStrong((id *)&self->_engagementScoreParameterDict, 0);
  objc_storeStrong((id *)&self->_heuristicsParameterDict, 0);
  objc_storeStrong((id *)&self->_dynamicModelParameterDict, 0);
  objc_storeStrong((id *)&self->_staticModelParameterMatrix, 0);
  objc_storeStrong((id *)&self->_richnessWeightsDict, 0);
}

- (void)_fillQualityInfoForRanking:(uint64_t)a3 forBundle:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "rankingInput.labelSpecificityNormalized reached limit (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_fillQualityInfoForRanking:(uint64_t)a3 forBundle:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "rankingInput.isBundleTimeTagSpecific reached limit (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_fillQualityInfoForRanking:(uint64_t)a3 forBundle:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "rankingInput.isBundleActionSpecific reached limit (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_fillHeuristicsInfoForRanking:(void *)a1 forBundle:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;
  int v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;

  objc_msgSend(a1, "numFamilyNormalized");
  v5 = v4;
  objc_msgSend(a1, "numKidsNormalized");
  v7 = v6;
  objc_msgSend(a1, "numFriendsNormalized");
  v9 = v8;
  objc_msgSend(a1, "numCoworkersNormalized");
  v11 = v10;
  objc_msgSend(a1, "numPetsNormalized");
  v13 = v12;
  objc_msgSend(a1, "numOtherPersonsNormalized");
  v15 = 134219264;
  v16 = v5;
  v17 = 2048;
  v18 = v7;
  v19 = 2048;
  v20 = v9;
  v21 = 2048;
  v22 = v11;
  v23 = 2048;
  v24 = v13;
  v25 = 2048;
  v26 = v14;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Person relationship heuristics: numFamily %.f,numKids %.f,numFriends %.f,numCoworkers %.f,numPets %.f,numOtherPersons %.f,", (uint8_t *)&v15, 0x3Eu);
}

- (void)_fillHeuristicsInfoForRanking:(void *)a1 forBundle:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "place"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "poiCategory"));
  v9 = 138413058;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  v13 = 2112;
  v14 = v6;
  v15 = 2112;
  v16 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Bundle contains sensitive POI: bundleID %@, startDate %@, endDate %@, poiCategory %@", (uint8_t *)&v9, 0x2Au);

}

- (void)_fillHeuristicsInfoForRanking:(void *)a1 forBundle:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "metaDataForRank"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v4, "Filled in metadata for rank for trip bundle: %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_fillRichnessInfoForRanking:forBundle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_4((void *)&_mh_execute_header, v0, v1, "Evergreen prompt exists", v2);
  OUTLINED_FUNCTION_2_2();
}

- (void)_fillRichnessInfoForRanking:(void *)a1 forBundle:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "evergreenType"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v4, "Evergreen type is set to %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)initWithUniverse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: universe", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithConfigurationManager:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a2, a3, "User onboarding date is not available. Setting elapsedDaysSinceOnboardingDate to %.3f for default behavior", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithConfigurationManager:(NSObject *)a3 .cold.3(uint64_t a1, float *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(double *)&v3[14] = *a2;
  OUTLINED_FUNCTION_4_8((void *)&_mh_execute_header, (uint64_t)a2, a3, "User onboarding date %@, elapsedDaysSinceOnboardingDate %.3f", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)initWithConfigurationManager:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a2, a3, "EngagementScoreWeight is set to %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_calculateRankingScore:(uint64_t)a1 withMinRecommendedBundleCountRequirement:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "count");
  *v3 = 134217984;
  *v2 = v4;
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v5, v6, "RankingDict count After filtering for ones shown in Recent tab:%lu");
  OUTLINED_FUNCTION_7_1();
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_8((void *)&_mh_execute_header, v0, v1, "Min bundle date:%@, max bundle date:%@");
  OUTLINED_FUNCTION_1();
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "diversityCoefficientDict:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "visibleInterfaceTypeAndCountDict:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_calculateRankingScore:withMinRecommendedBundleCountRequirement:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_8((void *)&_mh_execute_header, v0, v1, "workoutTypesInWeeklySummary=%@ , workoutTypesInWorkoutRoutine=%@");
  OUTLINED_FUNCTION_1();
}

- (void)_calculateRankingScore:(os_log_t)log withMinRecommendedBundleCountRequirement:.cold.6(char a1, char a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1 & 1;
  v4 = 1024;
  v5 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "isWorkoutRoutineInRecommendedTab=%d , isWorkoutWeeklySummaryInRecommendedTab=%d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_1();
}

- (void)_calculateRankingScore:(_BYTE *)a1 withMinRecommendedBundleCountRequirement:(_BYTE *)a2 .cold.7(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_3(a1, a2);
  OUTLINED_FUNCTION_4_4((void *)&_mh_execute_header, v2, (uint64_t)v2, "Evergreen type is not found. Use random score instead.", v3);
}

- (void)_calculateRankingScore:(uint64_t)a1 withMinRecommendedBundleCountRequirement:(uint64_t)a2 .cold.8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "evergreenType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v6, v7, "Evergreen engagement score parameter is not set for evergreenType %@. Use default dynamic param.");

  OUTLINED_FUNCTION_7_1();
}

void __88__MOEventBundleRanking__calculateRankingScore_withMinRecommendedBundleCountRequirement___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
  OUTLINED_FUNCTION_1_11((void *)&_mh_execute_header, v3, v4, "Ordinal rank %lu:  SuggestionID:%@, bundleID:%@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3_1();
}

- (void)_mergeScoresToBundles:(NSObject *)a3 usingScore:.cold.1(void *a1, void *a2, NSObject *a3)
{
  int v5;
  id v6;
  __int16 v7;
  id v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;

  v5 = 134218754;
  v6 = objc_msgSend(a1, "count");
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  v9 = 2080;
  v10 = "-[MOEventBundleRanking _mergeScoresToBundles:usingScore:]";
  v11 = 1024;
  v12 = 2531;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Mismatch between bundle count %lu and score array count %lu (in %s:%d)", (uint8_t *)&v5, 0x26u);
  OUTLINED_FUNCTION_3_1();
}

- (void)_submitEventBundleRankingAnalytics:(uint64_t)a3 withRankingInput:(uint64_t)a4 andSubmissionDate:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "CA payload (%@) is nil. Skip submission", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_4((void *)&_mh_execute_header, v0, v1, "Completed aggregated Ranking CoreAnalytics submission", v2);
  OUTLINED_FUNCTION_2_2();
}

- (void)_submitEventBundleRankingAnalytics:(uint8_t *)buf withRankingInput:(_QWORD *)a2 andSubmissionDate:(os_log_t)log .cold.3(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = CFSTR("com.apple.Moments.MOEventBundleRanking");
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CA payload (%@) is nil. Skip submission", buf, 0xCu);
}

- (void)_submitEventBundleRankingAnalytics:(_BYTE *)a1 withRankingInput:(_BYTE *)a2 andSubmissionDate:.cold.4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_3(a1, a2);
  OUTLINED_FUNCTION_4_4((void *)&_mh_execute_header, v2, (uint64_t)v2, "Submitted ranking CA message", v3);
}

- (void)_submitEventBundleRankingAnalytics:(os_log_t)log withRankingInput:andSubmissionDate:.cold.5(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOEventBundleRanking _submitEventBundleRankingAnalytics:withRankingInput:andSubmissionDate:]";
  v3 = 1024;
  v4 = 2596;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Mismatch between score dict and input dict sizes (in %s:%d)", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_lineSearch:initialParams:With:And:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Num iterations in BFGS - _lineSearch is %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lineSearch:(uint64_t)a3 initialParams:(uint64_t)a4 With:(uint64_t)a5 And:(uint64_t)a6 handler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "Too many iterations BFGS - _lineSearch is %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __114__MOEventBundleRanking_identifyRepetitiveSignificantContactBundlesFromBundles_precedingSignificantContactBundles___block_invoke_780_cold_1(uint64_t a1)
{
  NSString *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_11((void *)&_mh_execute_header, v3, v4, "%@, bundle idx, %lu, contact identifier, %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_1();
}

- (void)safeSavePropertyToDictionary:withKey:andValue:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_0_7();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "key-value pair contains nil value (key=%@, value=%@). Skip dict update", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)updateTripMetaDataForRank:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  os_log_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_3(a1, a2);
  _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "Trip bundle familiarity index is -1", v3, 2u);
}

@end
