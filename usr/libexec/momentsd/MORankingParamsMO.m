@implementation MORankingParamsMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MORankingParamsMO"));
}

- (id)rankingParams
{
  MORankingParams *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MORankingParams);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MORankingParamsMO engagementScoreParamsUpdateDate](self, "engagementScoreParamsUpdateDate"));
  -[MORankingParams setEngagementScoreParamsUpdateDate:](v3, "setEngagementScoreParamsUpdateDate:", v4);

  -[MORankingParamsMO activityInterfaceTypeEngagementWeight](self, "activityInterfaceTypeEngagementWeight");
  -[MORankingParams setActivityInterfaceTypeEngagementWeight:](v3, "setActivityInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO outingInterfaceTypeEngagementWeight](self, "outingInterfaceTypeEngagementWeight");
  -[MORankingParams setOutingInterfaceTypeEngagementWeight:](v3, "setOutingInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO photoMomentInterfaceTypeEngagementWeight](self, "photoMomentInterfaceTypeEngagementWeight");
  -[MORankingParams setPhotoMomentInterfaceTypeEngagementWeight:](v3, "setPhotoMomentInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO significantContactInterfaceTypeEngagementWeight](self, "significantContactInterfaceTypeEngagementWeight");
  -[MORankingParams setSignificantContactInterfaceTypeEngagementWeight:](v3, "setSignificantContactInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO yourMediaInterfaceTypeEngagementWeight](self, "yourMediaInterfaceTypeEngagementWeight");
  -[MORankingParams setYourMediaInterfaceTypeEngagementWeight:](v3, "setYourMediaInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO yourSharedContentInterfaceTypeEngagementWeight](self, "yourSharedContentInterfaceTypeEngagementWeight");
  -[MORankingParams setYourSharedContentInterfaceTypeEngagementWeight:](v3, "setYourSharedContentInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO yourTimeAtHomeInterfaceTypeEngagementWeight](self, "yourTimeAtHomeInterfaceTypeEngagementWeight");
  -[MORankingParams setYourTimeAtHomeInterfaceTypeEngagementWeight:](v3, "setYourTimeAtHomeInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO topicsOfInterestInterfaceTypeEngagementWeight](self, "topicsOfInterestInterfaceTypeEngagementWeight");
  -[MORankingParams setTopicsOfInterestInterfaceTypeEngagementWeight:](v3, "setTopicsOfInterestInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO trendInterfaceTypeEngagementWeight](self, "trendInterfaceTypeEngagementWeight");
  -[MORankingParams setTrendInterfaceTypeEngagementWeight:](v3, "setTrendInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO photoMemoryInterfaceTypeEngagementWeight](self, "photoMemoryInterfaceTypeEngagementWeight");
  -[MORankingParams setPhotoMemoryInterfaceTypeEngagementWeight:](v3, "setPhotoMemoryInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO evergreenInterfaceTypeEngagementWeight](self, "evergreenInterfaceTypeEngagementWeight");
  -[MORankingParams setEvergreenInterfaceTypeEngagementWeight:](v3, "setEvergreenInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO timeContextInterfaceTypeEngagementWeight](self, "timeContextInterfaceTypeEngagementWeight");
  -[MORankingParams setTimeContextInterfaceTypeEngagementWeight:](v3, "setTimeContextInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO tripInterfaceTypeEngagementWeight](self, "tripInterfaceTypeEngagementWeight");
  -[MORankingParams setTripInterfaceTypeEngagementWeight:](v3, "setTripInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO stateOfMindInterfaceTypeEngagementWeight](self, "stateOfMindInterfaceTypeEngagementWeight");
  -[MORankingParams setStateOfMindInterfaceTypeEngagementWeight:](v3, "setStateOfMindInterfaceTypeEngagementWeight:");
  -[MORankingParamsMO clusteringInterfaceTypeEngagementWeight](self, "clusteringInterfaceTypeEngagementWeight");
  -[MORankingParams setClusteringInterfaceTypeEngagementWeight:](v3, "setClusteringInterfaceTypeEngagementWeight:");
  -[MORankingParams setIsParamsUpdateOnHold:](v3, "setIsParamsUpdateOnHold:", -[MORankingParamsMO isParamsUpdateOnHold](self, "isParamsUpdateOnHold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MORankingParamsMO evergreenEngagementScoreParamsUpdateDate](self, "evergreenEngagementScoreParamsUpdateDate"));
  -[MORankingParams setEvergreenEngagementScoreParamsUpdateDate:](v3, "setEvergreenEngagementScoreParamsUpdateDate:", v5);

  -[MORankingParams setIsEvergreenEngagementScoreParamsUpdateOnHold:](v3, "setIsEvergreenEngagementScoreParamsUpdateOnHold:", -[MORankingParamsMO isEvergreenEngagementScoreParamsUpdateOnHold](self, "isEvergreenEngagementScoreParamsUpdateOnHold"));
  -[MORankingParamsMO wisdomEvergreenTypeEngagementWeight](self, "wisdomEvergreenTypeEngagementWeight");
  -[MORankingParams setWisdomEvergreenTypeEngagementWeight:](v3, "setWisdomEvergreenTypeEngagementWeight:");
  -[MORankingParamsMO gratitudeEvergreenTypeEngagementWeight](self, "gratitudeEvergreenTypeEngagementWeight");
  -[MORankingParams setGratitudeEvergreenTypeEngagementWeight:](v3, "setGratitudeEvergreenTypeEngagementWeight:");
  -[MORankingParamsMO kindnessEvergreenTypeEngagementWeight](self, "kindnessEvergreenTypeEngagementWeight");
  -[MORankingParams setKindnessEvergreenTypeEngagementWeight:](v3, "setKindnessEvergreenTypeEngagementWeight:");
  -[MORankingParamsMO purposeEvergreenTypeEngagementWeight](self, "purposeEvergreenTypeEngagementWeight");
  -[MORankingParams setPurposeEvergreenTypeEngagementWeight:](v3, "setPurposeEvergreenTypeEngagementWeight:");
  -[MORankingParamsMO resilienceEvergreenTypeEngagementWeight](self, "resilienceEvergreenTypeEngagementWeight");
  -[MORankingParams setResilienceEvergreenTypeEngagementWeight:](v3, "setResilienceEvergreenTypeEngagementWeight:");
  -[MORankingParamsMO creativityEvergreenTypeEngagementWeight](self, "creativityEvergreenTypeEngagementWeight");
  -[MORankingParams setCreativityEvergreenTypeEngagementWeight:](v3, "setCreativityEvergreenTypeEngagementWeight:");
  return v3;
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4 forContext:(id)a5 forEvergreenScore:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id os_log;
  NSObject *v18;
  MORankingParamsMO *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v28;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MORankingParamsMO fetchRequest](MORankingParamsMO, "fetchRequest"));
    objc_msgSend(v14, "setFetchLimit:", 1);
    objc_msgSend(v14, "setReturnsObjectsAsFaults:", 0);
    v28 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executeFetchRequest:error:", v14, &v28));
    v16 = v28;
    if (v16)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      v18 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[MORankingParamsMO managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:].cold.2((uint64_t)v16, v18);

      v19 = -[MORankingParamsMO initWithContext:]([MORankingParamsMO alloc], "initWithContext:", v12);
      objc_msgSend(a1, "_updateRankingParamsMO:with:forEvergreenScore:", v19, v11, 1);
      -[MORankingParamsMO setIsEvergreenEngagementScoreParamsUpdateOnHold:](v19, "setIsEvergreenEngagementScoreParamsUpdateOnHold:", 1);
      objc_msgSend(a1, "_updateRankingParamsMO:with:forEvergreenScore:", v19, v11, 0);
      -[MORankingParamsMO setIsParamsUpdateOnHold:](v19, "setIsParamsUpdateOnHold:", 1);
    }
    else
    {
      if (!objc_msgSend(v15, "count"))
      {
        v20 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          +[MORankingParamsMO managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:].cold.1(v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MORankingParamsMO+CoreDataClass.m"), 37, CFSTR("Ranking params array size is 0 (in %s:%d)"), "+[MORankingParamsMO managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:]", 37);

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
      objc_msgSend(a1, "_updateRankingParamsMO:with:forEvergreenScore:", v23, v11, v6);

      if (v6)
      {
        v24 = objc_msgSend(v13, "isEvergreenEngagementScoreParamsUpdateOnHold");
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v25, "setIsEvergreenEngagementScoreParamsUpdateOnHold:", v24);
      }
      else
      {
        v26 = objc_msgSend(v13, "isParamsUpdateOnHold");
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v25, "setIsParamsUpdateOnHold:", v26);
      }

      v19 = (MORankingParamsMO *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
    }

  }
  else
  {
    v19 = -[MORankingParamsMO initWithContext:]([MORankingParamsMO alloc], "initWithContext:", v12);
    objc_msgSend(a1, "_updateRankingParamsMO:with:forEvergreenScore:", v19, v11, 1);
    -[MORankingParamsMO setIsEvergreenEngagementScoreParamsUpdateOnHold:](v19, "setIsEvergreenEngagementScoreParamsUpdateOnHold:", 1);
    objc_msgSend(a1, "_updateRankingParamsMO:with:forEvergreenScore:", v19, v11, 0);
    -[MORankingParamsMO setIsParamsUpdateOnHold:](v19, "setIsParamsUpdateOnHold:", 1);
  }

  return v19;
}

+ (void)_updateRankingParamsMO:(id)a3 with:(id)a4 forEvergreenScore:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
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
  id v49;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (v5)
  {
    objc_msgSend(v8, "setEvergreenEngagementScoreParamsUpdateDate:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParameterDict"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WISDOM")));
    objc_msgSend(v11, "floatValue");
    objc_msgSend(v8, "setWisdomEvergreenTypeEngagementWeight:");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParameterDict"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GRATITUDE")));
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v8, "setGratitudeEvergreenTypeEngagementWeight:");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParameterDict"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("KINDNESS")));
    objc_msgSend(v15, "floatValue");
    objc_msgSend(v8, "setKindnessEvergreenTypeEngagementWeight:");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParameterDict"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PURPOSE")));
    objc_msgSend(v17, "floatValue");
    objc_msgSend(v8, "setPurposeEvergreenTypeEngagementWeight:");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParameterDict"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("RESILIENCE")));
    objc_msgSend(v19, "floatValue");
    objc_msgSend(v8, "setResilienceEvergreenTypeEngagementWeight:");

    v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParameterDict"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("CREATIVITY")));
    objc_msgSend(v20, "floatValue");
    objc_msgSend(v8, "setCreativityEvergreenTypeEngagementWeight:");
  }
  else
  {
    objc_msgSend(v8, "setEngagementScoreParamsUpdateDate:", v9);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", &off_1002D9230));
    objc_msgSend(v22, "floatValue");
    objc_msgSend(v8, "setActivityInterfaceTypeEngagementWeight:");

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", &off_1002D9248));
    objc_msgSend(v24, "floatValue");
    objc_msgSend(v8, "setOutingInterfaceTypeEngagementWeight:");

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", &off_1002D9260));
    objc_msgSend(v26, "floatValue");
    objc_msgSend(v8, "setPhotoMomentInterfaceTypeEngagementWeight:");

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", &off_1002D9278));
    objc_msgSend(v28, "floatValue");
    objc_msgSend(v8, "setSignificantContactInterfaceTypeEngagementWeight:");

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", &off_1002D9290));
    objc_msgSend(v30, "floatValue");
    objc_msgSend(v8, "setYourMediaInterfaceTypeEngagementWeight:");

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", &off_1002D92A8));
    objc_msgSend(v32, "floatValue");
    objc_msgSend(v8, "setYourSharedContentInterfaceTypeEngagementWeight:");

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", &off_1002D92C0));
    objc_msgSend(v34, "floatValue");
    objc_msgSend(v8, "setYourTimeAtHomeInterfaceTypeEngagementWeight:");

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", &off_1002D92D8));
    objc_msgSend(v36, "floatValue");
    objc_msgSend(v8, "setTopicsOfInterestInterfaceTypeEngagementWeight:");

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", &off_1002D92F0));
    objc_msgSend(v38, "floatValue");
    objc_msgSend(v8, "setTrendInterfaceTypeEngagementWeight:");

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", &off_1002D9308));
    objc_msgSend(v40, "floatValue");
    objc_msgSend(v8, "setPhotoMemoryInterfaceTypeEngagementWeight:");

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", &off_1002D9320));
    objc_msgSend(v42, "floatValue");
    objc_msgSend(v8, "setEvergreenInterfaceTypeEngagementWeight:");

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", &off_1002D9338));
    objc_msgSend(v44, "floatValue");
    objc_msgSend(v8, "setTimeContextInterfaceTypeEngagementWeight:");

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", &off_1002D9350));
    objc_msgSend(v46, "floatValue");
    objc_msgSend(v8, "setTripInterfaceTypeEngagementWeight:");

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", &off_1002D9368));
    objc_msgSend(v48, "floatValue");
    objc_msgSend(v8, "setStateOfMindInterfaceTypeEngagementWeight:");

    v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicModelParameterDict"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", &off_1002D9380));
    objc_msgSend(v20, "floatValue");
    objc_msgSend(v8, "setClusteringInterfaceTypeEngagementWeight:");
  }

}

+ (void)managedObjectWithObject:(os_log_t)log inManagedObjectContext:forContext:forEvergreenScore:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "+[MORankingParamsMO managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:]";
  v3 = 1024;
  v4 = 37;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ranking params array size is 0 (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

+ (void)managedObjectWithObject:(uint64_t)a1 inManagedObjectContext:(NSObject *)a2 forContext:forEvergreenScore:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error reading ranking core data, %@", (uint8_t *)&v2, 0xCu);
}

@end
