@implementation MOWorkoutAnnotationManager

- (MOWorkoutAnnotationManager)initWithUniverse:(id)a3
{
  id v4;
  MOWorkoutAnnotationManager *v5;
  void *v6;
  uint64_t v7;
  NSSet *lessInterestingPoiCategories;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  MOConfigurationManager *configurationManager;
  double v15;
  float v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  float v24;
  double v25;
  float v26;
  double v27;
  float v28;
  double v29;
  float v30;
  double v31;
  float v32;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  float v38;
  double v39;
  float v40;
  double v41;
  float v42;
  double v43;
  float v44;
  double v45;
  float v46;
  double v47;
  float v48;
  objc_super v50;
  _QWORD v51[5];

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MOWorkoutAnnotationManager;
  v5 = -[MOTimeContextAnnotationManager initWithUniverse:](&v50, "initWithUniverse:", v4);
  if (v5)
  {
    v51[0] = GEOPOICategoryATM;
    v51[1] = GEOPOICategoryEVCharger;
    v51[2] = GEOPOICategoryParking;
    v51[3] = GEOPOICategoryPublicTransport;
    v51[4] = GEOPOICategoryRestroom;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 5));
    v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    lessInterestingPoiCategories = v5->_lessInterestingPoiCategories;
    v5->_lessInterestingPoiCategories = (NSSet *)v7;

    v10 = (objc_class *)objc_opt_class(MOConfigurationManager, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v12));
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v13;

    HIDWORD(v15) = 1072483532;
    *(float *)&v15 = 0.9;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_VisitLabelMediumConfidenceThreshold"), v15);
    v5->_visitLabelMediumConfidenceThreshold = v16;
    HIDWORD(v17) = 1072588390;
    *(float *)&v17 = 0.95;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_VisitLabelHighConfidenceThreshold"), v17);
    v5->_visitLabelHighConfidenceThreshold = v18;
    HIDWORD(v19) = 1071644672;
    *(float *)&v19 = 0.5;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VA_AOIVisitLabelConfidentThreshold"), v19);
    v21 = v20;
    v5->_aoiVisitLabelConfidentThreshold = v21;
    LODWORD(v21) = 1128792064;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MaximumWatchPhoneVisitDistanceKey"), v21);
    v23 = v22;
    v5->_maximumWatchPhoneVisitDistance = v23;
    LODWORD(v23) = 15.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MotionActivityWalkDurationThresholdKey"), v23);
    v25 = v24;
    v5->_motionActivityWalkDurationThreshold = v25;
    LODWORD(v25) = 5.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MotionActivityRunDurationThresholdKey"), v25);
    v27 = v26;
    v5->_motionActivityRunDurationThreshold = v27;
    LODWORD(v27) = 10.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MotionActivityMixedRunningWalkingDurationThresholdKey"), v27);
    v29 = v28;
    v5->_motionActivityMixedRunningWalkingDurationThreshold = v29;
    LODWORD(v29) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MotionActivityWalkCadenceThresholdKey"), v29);
    v31 = v30;
    v5->_motionActivityWalkCadenceThreshold = v31;
    LODWORD(v31) = 1128792064;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MotionActivityWalkSpanThresholdKey"), v31);
    v33 = v32;
    v5->_motionActivityWalkSpanThreshold = v33;
    LODWORD(v33) = 1128792064;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MotionActivityRunSpanThresholdKey"), v33);
    v35 = v34;
    v5->_motionActivityRunSpanThreshold = v35;
    LODWORD(v35) = 1128792064;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MotionActivityMixedRunningWalkingSpanThresholdKey"), v35);
    v37 = v36;
    v5->_motionActivityMixedRunningWalkingSpanThreshold = v37;
    LODWORD(v37) = 1140457472;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MotionActivityRunDistanceThresholdKey"), v37);
    v39 = v38;
    v5->_motionActivityRunDistanceThreshold = v39;
    LODWORD(v39) = 1140457472;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MotionActivityMixedRunningWalkingDistanceThresholdKey"), v39);
    v41 = v40;
    v5->_motionActivityMixedRunningWalkingDistanceThreshold = v41;
    LODWORD(v41) = 1137180672;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MotionActivityWalkMinimumLocationUncertaintyKey"), v41);
    v43 = v42;
    v5->_motionActivityWalkMinimumLocationUncertainty = v43;
    LODWORD(v43) = 1067030938;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("kMotionActivityReferencePointRatioKey"), v43);
    v45 = v44;
    v5->_motionActivityReferencePointRatio = v45;
    LODWORD(v45) = 1155596288;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("VisitMinimumIntersectionWithActivityAbsoluteTime"), v45);
    v5->_visitMinimumIntersectionWithActivityAbsoluteTime = v46;
    v5->_allowDuplicatedWorkouts = -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](v5->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("AllowDuplicatedWorkoutsKey"), 0);
    LODWORD(v47) = 1180762112;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v5->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("EmotionAttachmentActivityBundleDurationThreshold"), v47);
    v5->_emotionAttachmentBundleDurationThreshold = v48;
  }

  return v5;
}

- (id)getBaseEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@ AND %K !=[c] %@"), CFSTR("category"), &off_1002DCB60, CFSTR("workoutType"), CFSTR("HKWorkoutActivityTypeCooldown")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

- (id)groupedEventsFromEvents:(id)a3
{
  id v4;
  uint64_t v5;
  _UNKNOWN **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  NSMutableArray *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  id v28;
  MOWorkoutAnnotationManager *v30;
  uint64_t v31;
  id v32;
  id obj;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSMutableArray *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v28 = &__NSArray0__struct;
    goto LABEL_24;
  }
  v30 = self;
  v39 = objc_opt_new(NSMutableArray);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.workoutType")));
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v34)
    goto LABEL_20;
  v5 = *(_QWORD *)v41;
  v6 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v31 = *(_QWORD *)v41;
  v32 = v4;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v41 != v5)
        objc_enumerationMutation(obj);
      v38 = v7;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[322], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("workoutType"), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v7)));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:"));
      v35 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
      v44 = v35;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
      v36 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingDescriptors:", v9));

      v11 = objc_opt_new(NSMutableArray);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      -[NSMutableArray addObject:](v11, "addObject:", v12);

      if ((unint64_t)objc_msgSend(v10, "count") < 2)
        goto LABEL_17;
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        v13 = 1;
        while (1)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v13 - 1));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v13));
          v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
          -[NSMutableArray timeIntervalSinceDate:](v16, "timeIntervalSinceDate:", v17);
          if (v18 <= 300.0)
            break;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
          v21 = objc_msgSend(v19, "isBeforeDate:", v20);

          if ((v21 & 1) == 0)
          {
            v22 = -[NSMutableArray copy](v11, "copy");
            -[NSMutableArray addObject:](v39, "addObject:", v22);

            v16 = v11;
            v11 = objc_opt_new(NSMutableArray);
LABEL_14:

          }
          -[NSMutableArray addObject:](v11, "addObject:", v15);

          if ((unint64_t)objc_msgSend(v10, "count") <= ++v13)
            goto LABEL_16;
        }

        goto LABEL_14;
      }
LABEL_16:
      v5 = v31;
      v4 = v32;
      v6 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      if (-[NSMutableArray count](v11, "count"))
      {
LABEL_17:
        v23 = -[NSMutableArray copy](v11, "copy");
        -[NSMutableArray addObject:](v39, "addObject:", v23);

      }
      v7 = v38 + 1;
    }
    while ((id)(v38 + 1) != v34);
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  }
  while (v34);
LABEL_20:
  v24 = v39;
  v25 = v24;
  if (!-[MOWorkoutAnnotationManager allowDuplicatedWorkouts](v30, "allowDuplicatedWorkouts"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOWorkoutAnnotationManager removePhoneActivitiesOverlappingWorkouts:](v30, "removePhoneActivitiesOverlappingWorkouts:", v24));
    v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MOWorkoutAnnotationManager removeDuplicateWorkouts:](v30, "removeDuplicateWorkouts:", v26));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v25, "sortedArrayUsingComparator:", &__block_literal_global_42));
  v28 = objc_msgSend(v27, "copy");

LABEL_24:
  return v28;
}

int64_t __54__MOWorkoutAnnotationManager_groupedEventsFromEvents___block_invoke(id a1, NSArray *a2, NSArray *a3)
{
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](a2, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v4, "firstObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
  v9 = objc_msgSend(v6, "compare:", v8);

  return (int64_t)v9;
}

- (id)removePhoneActivitiesOverlappingWorkouts:(id)a3
{
  id v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  NSMutableArray *v14;
  void *v15;
  id v16;
  void *j;
  void *v18;
  NSMutableArray *v19;
  id v20;
  id v21;
  int v22;
  void *k;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  id v33;
  NSMutableArray *obj;
  NSMutableArray *v35;
  NSMutableArray *v36;
  NSMutableArray *v37;
  uint64_t v38;
  id v39;
  void *v40;
  NSMutableArray *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v35 = objc_opt_new(NSMutableArray);
    v4 = objc_opt_new(NSMutableArray);
    v5 = objc_opt_new(NSMutableArray);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v33 = v3;
    v6 = (NSMutableArray *)v3;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject", v33));
          v13 = objc_msgSend(v12, "category");

          v14 = v4;
          if (v13 != (id)2)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
            v16 = objc_msgSend(v15, "category");

            v14 = v5;
            if (v16 != (id)16)
              continue;
          }
          -[NSMutableArray addObject:](v14, "addObject:", v11);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v8);
    }

    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v4);
    if (-[NSMutableArray count](v5, "count"))
    {
      v3 = v33;
      if (-[NSMutableArray count](v4, "count"))
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        obj = v5;
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (!v39)
          goto LABEL_34;
        v37 = v4;
        v38 = *(_QWORD *)v48;
        v36 = v5;
        while (1)
        {
          for (j = 0; j != v39; j = (char *)j + 1)
          {
            if (*(_QWORD *)v48 != v38)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v19 = v4;
            v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
            if (!v20)
            {

LABEL_31:
              -[NSMutableArray addObject:](v35, "addObject:", v18, v33);
              continue;
            }
            v21 = v20;
            v40 = j;
            v41 = v19;
            v22 = 0;
            v42 = *(_QWORD *)v44;
            do
            {
              for (k = 0; k != v21; k = (char *)k + 1)
              {
                if (*(_QWORD *)v44 != v42)
                  objc_enumerationMutation(v41);
                v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)k);
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject", v33));
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "startDate"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateWithStartDate:endDate:", v26, v28));

                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "filteredArrayUsingPredicate:", v29));
                if (objc_msgSend(v30, "count"))
                  ++v22;

              }
              v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
            }
            while (v21);

            v5 = v36;
            v4 = v37;
            j = v40;
            if (!v22)
              goto LABEL_31;
          }
          v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          if (!v39)
          {
LABEL_34:

            v6 = v35;
            goto LABEL_35;
          }
        }
      }
    }
    else
    {
LABEL_35:
      v3 = v33;
    }
    v31 = v6;

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)removeDuplicateWorkouts:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  double v34;
  char *v35;
  void *v36;
  id v37;
  uint64_t v39;
  NSMutableArray *v40;
  id v41;
  id v42;
  id obj;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_opt_new(NSMutableArray);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v47;
      v40 = v4;
      v41 = v3;
      v39 = *(_QWORD *)v47;
      do
      {
        v8 = 0;
        v42 = v6;
        do
        {
          if (*(_QWORD *)v47 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v8);
          if ((unint64_t)objc_msgSend(v9, "count") > 1)
          {
            v45 = v8;
            v10 = objc_opt_new(NSMutableArray);
            v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
            v50 = v11;
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingDescriptors:", v12));

            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
            v44 = v11;
            if ((unint64_t)objc_msgSend(v13, "count") < 2)
            {
              v37 = v14;
            }
            else
            {
              v15 = 1;
              do
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v15));
                v17 = objc_alloc((Class)NSDateInterval);
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
                v20 = objc_msgSend(v17, "initWithStartDate:endDate:", v18, v19);

                v21 = objc_alloc((Class)NSDateInterval);
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
                v24 = objc_msgSend(v21, "initWithStartDate:endDate:", v22, v23);

                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "intersectionWithDateInterval:", v20));
                objc_msgSend(v20, "duration");
                v27 = v26;
                v28 = v16;
                objc_msgSend(v20, "duration");
                v30 = v29;
                objc_msgSend(v24, "duration");
                if (v30 <= v31)
                {
                  v33 = v28;
                }
                else
                {
                  objc_msgSend(v24, "duration");
                  v27 = v32;
                  v33 = v14;

                }
                if (v27 <= 0.0 || (objc_msgSend(v25, "duration"), v34 / v27 <= 0.5))
                {
                  -[NSMutableArray addObject:](v10, "addObject:", v14);
                  v35 = (char *)objc_msgSend(v13, "count") - 1;
                  v36 = v28;
                }
                else
                {
                  v35 = (char *)objc_msgSend(v13, "count") - 1;
                  v36 = v33;
                }
                if ((char *)v15 == v35)
                  -[NSMutableArray addObject:](v10, "addObject:", v36);
                v37 = v36;

                ++v15;
                v14 = v37;
              }
              while ((unint64_t)objc_msgSend(v13, "count") > v15);
            }
            v4 = v40;
            -[NSMutableArray addObject:](v40, "addObject:", v10);

            v3 = v41;
            v6 = v42;
            v7 = v39;
            v8 = v45;
          }
          else
          {
            -[NSMutableArray addObject:](v4, "addObject:", v9);
          }
          v8 = (char *)v8 + 1;
        }
        while (v8 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void **p_vtable;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id os_log;
  NSObject *v36;
  uint64_t v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  uint64_t v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  void *v69;
  unsigned int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id obj;
  uint64_t v91;
  uint64_t v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  uint64_t v97;
  NSMutableArray *v98;
  id v99;
  void *v100;
  id v101;
  void **v102;
  void *v103;
  void *v104;
  uint64_t v105;
  id v106;
  void *v107;
  void *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  uint8_t v119[128];
  uint8_t buf[4];
  void *v121;
  __int16 v122;
  id v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  void *v127;
  _QWORD v128[2];
  _QWORD v129[3];

  v7 = a3;
  v89 = a4;
  v95 = a5;
  v8 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("category"), &off_1002DCB78));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
  v13 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateWithStartDate:endDate:", v10, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
  v18 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateWithStartDate:endDate:distanceThreshold:](MOContextAnnotationUtilities, "predicateWithStartDate:endDate:distanceThreshold:", v15, v17, 0.5));

  v86 = (void *)v13;
  v87 = (void *)v8;
  v129[0] = v8;
  v129[1] = v13;
  v85 = (void *)v18;
  v129[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v129, 3));
  v20 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "endDate"));
  v25 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEventsWithPlaySessionsWithStartDate:endData:distanceThreshold:](MOContextAnnotationUtilities, "predicateOfEventsWithPlaySessionsWithStartDate:endData:distanceThreshold:", v22, v24, 0.5));

  v26 = v7;
  v83 = (void *)v25;
  v84 = (void *)v20;
  v128[0] = v25;
  v128[1] = v20;
  p_vtable = &OBJC_METACLASS___MOSignificantContactManager.vtable;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v128, 2));
  v29 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v28));

  v82 = (void *)v29;
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "filteredArrayUsingPredicate:", v29));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "endDate"));
  v34 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfSocialContextEventWithStartDate:endData:](MOContextAnnotationUtilities, "predicateOfSocialContextEventWithStartDate:endData:", v31, v33));

  v81 = (void *)v34;
  v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "filteredArrayUsingPredicate:", v34));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v36 = objc_claimAutoreleasedReturnValue(os_log);
  v93 = v7;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v38 = (objc_class *)objc_opt_class(self, v37);
    v39 = NSStringFromClass(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = objc_msgSend(v88, "count");
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "startDate"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "endDate"));
    *(_DWORD *)buf = 138413058;
    v121 = v40;
    v122 = 2048;
    v123 = v41;
    v124 = 2112;
    v125 = v43;
    v126 = 2112;
    v127 = v45;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@: filtered social context event count, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

    v26 = v7;
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "startDate"));
  v48 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastObject"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "endDate"));
  v50 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateOfEmotionLogsWithStartDate:endDate:", v47, v49));

  v80 = (void *)v50;
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "filteredArrayUsingPredicate:", v50));
  v51 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v52 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    v54 = (objc_class *)objc_opt_class(self, v53);
    v55 = NSStringFromClass(v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v48 = objc_msgSend(v94, "count");
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "startDate"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastObject"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "endDate"));
    *(_DWORD *)buf = 138413058;
    v121 = v56;
    v122 = 2048;
    v123 = v48;
    v124 = 2112;
    v125 = v58;
    v126 = 2112;
    v127 = v60;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%@: filtered emotion event count, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

    v26 = v7;
  }

  v98 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObjectsFromArray:](v98, "addObjectsFromArray:", v88);
  v61 = (void *)v92;
  v62 = v94;
  if (objc_msgSend(v95, "count"))
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    obj = v26;
    v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
    if (!v96)
      goto LABEL_33;
    v91 = *(_QWORD *)v115;
    while (1)
    {
      v63 = 0;
      do
      {
        if (*(_QWORD *)v115 != v91)
          objc_enumerationMutation(obj);
        v97 = v63;
        v100 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v63);
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        v113 = 0u;
        v99 = v95;
        v106 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
        if (v106)
        {
          v105 = *(_QWORD *)v111;
          do
          {
            v64 = 0;
            do
            {
              if (*(_QWORD *)v111 != v105)
                objc_enumerationMutation(v99);
              v65 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)v64);
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "patterns"));
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
              v68 = objc_msgSend(v67, "intValue");
              if (v68
                || (v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "eventIdentifier")),
                    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "UUIDString")),
                    p_vtable = (void **)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "patterns")),
                    v48 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(p_vtable, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalousEventIdentifier"))), v103 = v69, (objc_msgSend(v69, "isEqualToString:", v48) & 1) == 0))
              {
                v107 = v67;
                v109 = v66;
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "patterns"));
                v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
                v73 = v65;
                if (objc_msgSend(v72, "intValue") == 2)
                {
                  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "patterns"));
                  v102 = p_vtable;
                  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("kEventPatternRoutineEventIdentifierList")));
                  v101 = v48;
                  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "eventIdentifier"));
                  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "UUIDString"));
                  v70 = objc_msgSend(v75, "containsObject:", v77);

                  v48 = v101;
                  p_vtable = v102;

                }
                else
                {
                  v70 = 0;
                }

                if (v68)
                {

                  v65 = v73;
                  if (!v70)
                    goto LABEL_25;
LABEL_24:
                  -[NSMutableArray addObject:](v98, "addObject:", v65);
                  goto LABEL_25;
                }
                v65 = v73;
                v67 = v107;
                v66 = v109;
              }
              else
              {
                LOBYTE(v70) = 1;
              }

              if ((v70 & 1) != 0)
                goto LABEL_24;
LABEL_25:
              v64 = (char *)v64 + 1;
            }
            while (v106 != v64);
            v78 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
            v106 = v78;
          }
          while (v78);
        }

        v63 = v97 + 1;
        v61 = (void *)v92;
        v26 = v93;
        v62 = v94;
      }
      while ((id)(v97 + 1) != v96);
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
      if (!v96)
      {
LABEL_33:

        break;
      }
    }
  }
  if (objc_msgSend(v61, "count"))
    -[NSMutableArray addObjectsFromArray:](v98, "addObjectsFromArray:", v61);
  if (objc_msgSend(v62, "count"))
    -[NSMutableArray addObjectsFromArray:](v98, "addObjectsFromArray:", v62);

  return v98;
}

+ (unint64_t)subTypeFromBaseEvents:(id)a3
{
  void *v3;
  void *v4;
  char *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstObject"));
  if (objc_msgSend(v3, "category") == (id)16
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "motionActivityEvent")),
        v5 = (char *)objc_msgSend(v4, "motionType"),
        v4,
        (unint64_t)(v5 - 2) <= 4))
  {
    v6 = qword_10029F330[(_QWORD)(v5 - 2)];
  }
  else
  {
    v6 = 201;
  }

  return v6;
}

- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  int v16;
  id v17;
  uint64_t v18;
  double v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  unsigned int v32;
  double v33;
  id v34;
  NSObject *v35;
  double v36;
  double v37;
  id v38;
  NSObject *p_super;
  const char *v40;
  id os_log;
  NSObject *v42;
  MOEventBundle *v43;
  void *v44;
  void *v45;
  MOEventBundle *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  double v63;
  double v64;
  id v65;
  id v66;
  NSObject *v67;
  double v68;
  double v69;
  id v70;
  id v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL4 v80;
  NSMutableDictionary *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  MOResource *v92;
  void *v93;
  id v94;
  NSObject *v95;
  void *v96;
  void *v97;
  id v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  BOOL v105;
  void *v106;
  id v107;
  NSMutableDictionary *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  MOResource *v116;
  void *v117;
  void *v118;
  id v119;
  NSObject *v120;
  NSMutableArray *v121;
  void *v122;
  NSObject *v123;
  void *v124;
  BOOL v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  NSObject *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  double v146;
  MODaemonUniverse *v147;
  void *v148;
  MOEventBundle *v149;
  id v150;
  NSObject *v151;
  double v152;
  void *v153;
  void *v154;
  id v155;
  NSObject *v156;
  double v157;
  id v158;
  id v159;
  uint64_t v160;
  void *j;
  id v162;
  NSObject *v163;
  void *v164;
  uint64_t v165;
  id v166;
  double v168;
  double v169;
  double v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  id v175;
  int v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  NSMutableArray *v184;
  NSMutableArray *v185;
  id v186;
  char v188;
  void *v189;
  void *v190;
  NSMutableDictionary *obj;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  _QWORD v196[4];
  MOEventBundle *v197;
  uint64_t *v198;
  _BYTE *v199;
  objc_super v200;
  uint64_t v201;
  double *v202;
  uint64_t v203;
  uint64_t v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  _BYTE v213[128];
  id v214;
  uint8_t v215[4];
  double v216;
  _BYTE buf[24];
  __int128 v218;
  NSMutableArray *v219;
  _BYTE v220[128];
  _BYTE v221[128];

  v5 = a3;
  v6 = a4;
  v190 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v186 = v6;
    v7 = +[MOWorkoutAnnotationManager subTypeFromBaseEvents:](MOWorkoutAnnotationManager, "subTypeFromBaseEvents:", v5);
    if (v7 - 204 > 4 || ((1 << (v7 + 52)) & 0x19) == 0)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v42 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[MOWorkoutAnnotationManager.annotateBaseEvents] annotating regular workout activity", buf, 2u);
      }

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
      objc_msgSend(v10, "timeIntervalSinceDate:", v12);
      v14 = v13;

      v211 = 0u;
      v212 = 0u;
      v209 = 0u;
      v210 = 0u;
      v15 = v5;
      v16 = 0;
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v209, v221, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v210;
        v19 = 0.0;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v210 != v18)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * (_QWORD)i);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "motionActivityEvent"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "motionStepCount"));
            v24 = objc_msgSend(v23, "intValue");

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "motionActivityEvent"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "motionDistance"));
            objc_msgSend(v26, "doubleValue");
            v28 = v27;

            v16 += v24;
            v19 = v19 + v28;
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v209, v221, 16);
        }
        while (v17);
      }
      else
      {
        v19 = 0.0;
      }

      +[MOWorkoutAnnotationManager maxDistanceSpanFromStartUsingSparseLocations:](MOWorkoutAnnotationManager, "maxDistanceSpanFromStartUsingSparseLocations:", v15);
      v31 = v30;
      v32 = -[MOConfigurationManager isAllowedToPromptEventCategory:](self->_configurationManager, "isAllowedToPromptEventCategory:", 1);
      v33 = v14 / 60.0;
      switch(v7)
      {
        case 0xD0uLL:
          v61 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v62 = objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "[MOWorkoutAnnotationManager.annotateBaseEvents] annotating motion activity - mixed running & walking", buf, 2u);
          }

          -[MOWorkoutAnnotationManager motionActivityMixedRunningWalkingDurationThreshold](self, "motionActivityMixedRunningWalkingDurationThreshold");
          if (v33 < v63
            || (-[MOWorkoutAnnotationManager motionActivityMixedRunningWalkingDistanceThreshold](self, "motionActivityMixedRunningWalkingDistanceThreshold"), v19 < v64)|| v32&& (-[MOWorkoutAnnotationManager motionActivityMixedRunningWalkingSpanThreshold](self, "motionActivityMixedRunningWalkingSpanThreshold"), v31 < v169))
          {
            v65 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            p_super = objc_claimAutoreleasedReturnValue(v65);
            if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
              goto LABEL_45;
LABEL_43:
            *(_DWORD *)buf = 134218752;
            *(double *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v19;
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v218) = v32;
            WORD2(v218) = 2048;
            *(double *)((char *)&v218 + 6) = v31;
            v40 = "[MOWorkoutAnnotationManager.annotateBaseEvents] Failed to meet bundling criteria, duration=%fl, totalD"
                  "istance=%fl, allowedToUseLocation=%d, boutsSpan=%fl";
            goto LABEL_44;
          }
          break;
        case 0xCFuLL:
          v66 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v67 = objc_claimAutoreleasedReturnValue(v66);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "[MOWorkoutAnnotationManager.annotateBaseEvents] annotating motion activity - running", buf, 2u);
          }

          -[MOWorkoutAnnotationManager motionActivityRunDurationThreshold](self, "motionActivityRunDurationThreshold");
          if (v33 < v68
            || (-[MOWorkoutAnnotationManager motionActivityRunDistanceThreshold](self, "motionActivityRunDistanceThreshold"), v19 < v69)|| v32&& (-[MOWorkoutAnnotationManager motionActivityRunSpanThreshold](self, "motionActivityRunSpanThreshold"), v31 < v170))
          {
            v70 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            p_super = objc_claimAutoreleasedReturnValue(v70);
            if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
              goto LABEL_45;
            goto LABEL_43;
          }
          break;
        case 0xCCuLL:
          v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[MOWorkoutAnnotationManager.annotateBaseEvents] annotating motion activity - walking", buf, 2u);
          }

          -[MOWorkoutAnnotationManager motionActivityWalkDurationThreshold](self, "motionActivityWalkDurationThreshold");
          if (v33 >= v36)
          {
            -[MOWorkoutAnnotationManager motionActivityWalkCadenceThreshold](self, "motionActivityWalkCadenceThreshold");
            if ((double)v16 / v33 >= v37)
            {
              if (!v32)
                break;
              -[MOWorkoutAnnotationManager motionActivityWalkSpanThreshold](self, "motionActivityWalkSpanThreshold");
              if (v31 >= v168)
                break;
            }
          }
          v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          p_super = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218752;
            *(double *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = (double)v16 / v33;
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v218) = v32;
            WORD2(v218) = 2048;
            *(double *)((char *)&v218 + 6) = v31;
            v40 = "[MOWorkoutAnnotationManager.annotateBaseEvents] Failed to meet bundling criteria, duration=%fl, cadenc"
                  "e=%fl, allowedToUseLocation=%d, boutsSpan=%fl";
LABEL_44:
            _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, v40, buf, 0x26u);
          }
LABEL_45:
          v29 = 0;
LABEL_124:

          goto LABEL_125;
        default:
          v29 = 0;
LABEL_125:
          v6 = v186;
          goto LABEL_126;
      }
    }
    v43 = [MOEventBundle alloc];
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v46 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v43, "initWithBundleIdentifier:creationDate:", v44, v45);

    -[MOEventBundle setInterfaceType:](v46, "setInterfaceType:", 1);
    -[MOEventBundle setBundleSuperType:](v46, "setBundleSuperType:", 2);
    -[MOEventBundle setBundleSubType:](v46, "setBundleSubType:", v7);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "firstObject"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "startDate"));
    -[MOEventBundle setStartDate:](v46, "setStartDate:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "lastObject"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "endDate"));
    -[MOEventBundle setEndDate:](v46, "setEndDate:", v50);

    v184 = objc_opt_new(NSMutableArray);
    -[NSMutableArray addObjectsFromArray:](v184, "addObjectsFromArray:", v190);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities setActionForActivityBundle:](MOContextAnnotationUtilities, "setActionForActivityBundle:", v190));
    -[MOEventBundle setAction:](v46, "setAction:", v51);

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "firstObject"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "startDate"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager timeZoneManager](self, "timeZoneManager"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v53, v54));
    -[MOEventBundle setTime:](v46, "setTime:", v55);

    v56 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v46, "action"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "base Action, %@", buf, 0xCu);

    }
    v177 = (void *)objc_claimAutoreleasedReturnValue(-[MOWorkoutAnnotationManager annotateEventBundle:withContextEvents:andBaseEventReference:](self, "annotateEventBundle:withContextEvents:andBaseEventReference:", v46, v186, v190));
    -[NSMutableArray addObjectsFromArray:](v184, "addObjectsFromArray:", v177);
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v46, "resources"));
    if (v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v46, "resources"));
      v185 = (NSMutableArray *)objc_msgSend(v60, "mutableCopy");

    }
    else
    {
      v185 = objc_opt_new(NSMutableArray);
    }

    v207 = 0u;
    v208 = 0u;
    v205 = 0u;
    v206 = 0u;
    obj = v190;
    v71 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v205, v220, 16);
    if (v71)
    {
      v188 = 0;
      v72 = *(_QWORD *)v206;
      v73 = 100.0;
LABEL_50:
      v74 = 0;
      while (1)
      {
        if (*(_QWORD *)v206 != v72)
          objc_enumerationMutation(obj);
        v75 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * v74);
        if (objc_msgSend(v75, "category") != (id)2)
          goto LABEL_66;
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "startDate"));
        if (!v76)
          goto LABEL_66;
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "endDate"));
        if (!v77)
          goto LABEL_65;
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "workoutEvent"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "workoutType"));
        if (!v79)
        {

LABEL_65:
LABEL_66:
          if (objc_msgSend(v75, "category") == (id)16 && objc_msgSend(v75, "provider") == (id)7)
          {

            v108 = objc_opt_new(NSMutableDictionary);
            v109 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v46, "startDate"));
            objc_msgSend(v109, "timeIntervalSince1970");
            v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v110, CFSTR("MOActivityMetaDataKeyStartDate"));

            v111 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v46, "endDate"));
            objc_msgSend(v111, "timeIntervalSince1970");
            v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v112, CFSTR("MOActivityMetaDataKeyEndDate"));

            v113 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v46, "action"));
            v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "actionMetaData"));

            v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("ActivityActionMetaDataValue")));
            v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("ActivityActionMetaDataUnit")));
            v115 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v46, "action"));
            v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "actionName"));

            if (v189 && v182)
            {
              -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v189, CFSTR("MOActivityMetaDataKeyStepCount"));
              -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v182, CFSTR("MOActivityMetaDataKeyUnit"));
            }
            -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v180, CFSTR("MOActivityMetaDataMotionType"));
            v116 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("MotionActivity"), 13, v108, 0.0);
            v117 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary firstObject](obj, "firstObject"));
            v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "eventIdentifier"));
            -[MOResource setSourceEventIdentifier:](v116, "setSourceEventIdentifier:", v118);

            -[MOResource setPriorityScore:](v116, "setPriorityScore:", v73);
            v119 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v120 = objc_claimAutoreleasedReturnValue(v119);
            if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_INFO, "Activity: Primary MOResource created for phone walk bundle", buf, 2u);
            }

            -[NSMutableArray addObject:](v185, "addObject:", v116);
            v121 = objc_opt_new(NSMutableArray);
            v122 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));

            if (v122)
            {
              v123 = objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
              if (-[NSObject placeUserType](v123, "placeUserType") == (id)1)
                goto LABEL_92;
              v124 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
              v125 = objc_msgSend(v124, "placeUserType") == (id)2;

              if (!v125)
              {
                v171 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
                -[NSMutableArray addObject:](v121, "addObject:", v171);

                v172 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v121, "firstObject"));
                objc_msgSend(v172, "setPriorityScore:", 20000.0);

                v173 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v123 = objc_claimAutoreleasedReturnValue(v173);
                if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
                {
                  v174 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v174;
                  _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_INFO, "Activity, visit based location is available for motion activity, place, %@", buf, 0xCu);

                }
LABEL_92:

              }
            }
            v126 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities locationsFromMotionEvents:](MOContextAnnotationUtilities, "locationsFromMotionEvents:", obj));
            -[MOWorkoutAnnotationManager motionActivityReferencePointRatio](self, "motionActivityReferencePointRatio");
            v128 = v127;
            -[MOWorkoutAnnotationManager motionActivityWalkMinimumLocationUncertainty](self, "motionActivityWalkMinimumLocationUncertainty");
            v130 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities placeFromRoutes:referencePointRatio:minimumRangeOfLocation:](MOContextAnnotationUtilities, "placeFromRoutes:referencePointRatio:minimumRangeOfLocation:", v126, v128, v129));
            -[MOEventBundle setPlace:](v46, "setPlace:", v130);

            v131 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
            if (v131)
            {
              v132 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary firstObject](obj, "firstObject"));
              v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "eventIdentifier"));
              v134 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
              objc_msgSend(v134, "setSourceEventIdentifier:", v133);

              v135 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
              objc_msgSend(v135, "setPriorityScore:", 200.0);

              v136 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
              -[NSMutableArray addObject:](v121, "addObject:", v136);

              v137 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v138 = objc_claimAutoreleasedReturnValue(v137);
              if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
              {
                v139 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v139;
                _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_INFO, "Activity, walk area map created for motion activity, place, %@", buf, 0xCu);

              }
            }
            if (v121)
              -[MOEventBundle setPlaces:](v46, "setPlaces:", v121);

            v176 = 1;
            goto LABEL_101;
          }
          goto LABEL_68;
        }
        v80 = objc_msgSend(v75, "provider") == (id)1;

        if (!v80)
          goto LABEL_66;
        v81 = objc_opt_new(NSMutableDictionary);
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "startDate"));
        objc_msgSend(v82, "timeIntervalSince1970");
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v81, "setObject:forKey:", v83, CFSTR("MOWorkoutMetaDataKeyStartDate"));

        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "endDate"));
        objc_msgSend(v84, "timeIntervalSince1970");
        v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v81, "setObject:forKey:", v85, CFSTR("MOWorkoutMetaDataKeyEndDate"));

        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "workoutEvent"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "workoutType"));
        -[NSMutableDictionary setObject:forKey:](v81, "setObject:forKey:", v87, CFSTR("MOWorkoutMetaDataKeyActivityType"));

        v88 = objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "workoutEvent"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend((id)v88, "isIndoors")));
        -[NSMutableDictionary setObject:forKey:](v81, "setObject:forKey:", v89, CFSTR("MOWorkoutMetaDataKeyIsIndoors"));

        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "identifierFromProvider"));
        LOBYTE(v88) = v90 == 0;

        if ((v88 & 1) == 0)
        {
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "identifierFromProvider"));
          -[NSMutableDictionary setObject:forKey:](v81, "setObject:forKey:", v91, CFSTR("MOWorkoutMetaDataKeyWorkoutID"));

        }
        v92 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("Workout"), 10, v81, 0.0);
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "eventIdentifier"));
        -[MOResource setSourceEventIdentifier:](v92, "setSourceEventIdentifier:", v93);

        if (v73 == 100.0)
        {
          -[MOResource setPriorityScore:](v92, "setPriorityScore:", 100.0);
          v94 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v95 = objc_claimAutoreleasedReturnValue(v94);
          if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v75;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_INFO, "Activity: Primary MOResource created for workout event, %@", buf, 0xCu);
          }

          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "workoutEvent"));
          v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "workoutLocationRoute"));

          v188 |= v97 != 0;
          v73 = 500.0;
        }
        else
        {
          -[MOResource setPriorityScore:](v92, "setPriorityScore:", v73);
          v98 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v99 = objc_claimAutoreleasedReturnValue(v98);
          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v75;
            _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "Activity: Additional MOResource created for workout event, %@", buf, 0xCu);
          }

          v73 = v73 + 1.0;
        }
        -[NSMutableArray addObject:](v185, "addObject:", v92);
        v100 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));

        if (v100)
          break;
LABEL_80:

LABEL_68:
        if (v71 == (id)++v74)
        {
          v107 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v205, v220, 16);
          v71 = v107;
          if (v107)
            goto LABEL_50;
          goto LABEL_84;
        }
      }
      v101 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
      v102 = v101;
      if ((v188 & 1) != 0)
      {
        v103 = objc_msgSend(v101, "copy");

        objc_msgSend(v103, "setPriorityScore:", 20000.0);
      }
      else
      {
        if (objc_msgSend(v101, "placeUserType") == (id)1)
        {
          v103 = v102;
          goto LABEL_79;
        }
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
        v105 = objc_msgSend(v104, "placeUserType") == (id)2;

        if (v105)
          goto LABEL_80;
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v46, "place"));
        v103 = objc_msgSend(v106, "copy");

        objc_msgSend(v103, "setPriorityScore:", 200.0);
      }
      -[MOEventBundle setPlace:](v46, "setPlace:", v103);
LABEL_79:

      goto LABEL_80;
    }
LABEL_84:
    v176 = 0;
    v108 = obj;
LABEL_101:

    v140 = -[NSMutableArray copy](v184, "copy");
    -[MOEventBundle setEvents:](v46, "setEvents:", v140);

    -[MOEventBundle setPropertiesBasedOnEvents](v46, "setPropertiesBasedOnEvents");
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary firstObject](obj, "firstObject"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "startDate"));
    -[MOEventBundle setStartDate:](v46, "setStartDate:", v142);

    v143 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary lastObject](obj, "lastObject"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "endDate"));
    -[MOEventBundle setEndDate:](v46, "setEndDate:", v144);

    -[MOEventBundle setResources:](v46, "setResources:", v185);
    v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
    v183 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray filteredArrayUsingPredicate:](v184, "filteredArrayUsingPredicate:", v145));
    if (objc_msgSend(v183, "count"))
    {
      +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindResourceForBundle:withEmotionEvents:", v46, v183);
      v146 = 203.0;
    }
    else
    {
      v146 = 202.0;
    }
    v201 = 0;
    v202 = (double *)&v201;
    v203 = 0x2020000000;
    v204 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&v218 = __Block_byref_object_copy__33;
    *((_QWORD *)&v218 + 1) = __Block_byref_object_dispose__33;
    v219 = objc_opt_new(NSMutableArray);
    v200.receiver = self;
    v200.super_class = (Class)MOWorkoutAnnotationManager;
    v147 = -[MOAnnotationManager fUniverse](&v200, "fUniverse");
    v148 = (void *)objc_claimAutoreleasedReturnValue(v147);
    v196[0] = _NSConcreteStackBlock;
    v196[1] = 3221225472;
    v196[2] = __63__MOWorkoutAnnotationManager_annotateBaseEvents_contextEvents___block_invoke;
    v196[3] = &unk_1002B5000;
    v149 = v46;
    v197 = v149;
    v198 = &v201;
    v199 = buf;
    +[MOContextAnnotationUtilities addPhotoResources:universe:handler:](MOContextAnnotationUtilities, "addPhotoResources:universe:handler:", v149, v148, v196);

    v150 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v151 = objc_claimAutoreleasedReturnValue(v150);
    if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
    {
      v152 = v202[3];
      *(_DWORD *)v215 = 134217984;
      v216 = v152;
      _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_INFO, "activity,photoSource,%lu", v215, 0xCu);
    }

    if (*((_QWORD *)v202 + 3))
    {
      v179 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("type"), 2));
      v153 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v149, "resources"));
      v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "filteredArrayUsingPredicate:", v179));

      v175 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("photoCurationScore"), 0);
      v214 = v175;
      v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v214, 1));
      v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "sortedArrayUsingDescriptors:", v154));

      v155 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v156 = objc_claimAutoreleasedReturnValue(v155);
      if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
      {
        v157 = COERCE_DOUBLE(objc_msgSend(v181, "count"));
        *(_DWORD *)v215 = 134217984;
        v216 = v157;
        _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_INFO, "activity, %lu photo resources available for asset scoring", v215, 0xCu);
      }

      if (objc_msgSend(v181, "count"))
      {
        v194 = 0u;
        v195 = 0u;
        v192 = 0u;
        v193 = 0u;
        v158 = v181;
        v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v192, v213, 16);
        if (v159)
        {
          v160 = *(_QWORD *)v193;
          do
          {
            for (j = 0; j != v159; j = (char *)j + 1)
            {
              if (*(_QWORD *)v193 != v160)
                objc_enumerationMutation(v158);
              objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * (_QWORD)j), "setPriorityScore:", v146);
              v162 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v163 = objc_claimAutoreleasedReturnValue(v162);
              if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v215 = 134217984;
                v216 = v146;
                _os_log_debug_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEBUG, "activity, priority score %f set for photo asset", v215, 0xCu);
              }

              v146 = v146 + 1.0;
            }
            v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v192, v213, 16);
          }
          while (v159);
        }

        if (v176)
        {
          v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "firstObject"));
          objc_msgSend(v164, "setPriorityScore:", 99.0);

        }
      }

      v165 = *((_QWORD *)v202 + 3);
    }
    else
    {
      v165 = 0;
    }
    -[MOEventBundle setPhotoSource:](v149, "setPhotoSource:", v165);
    v166 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "copy");
    -[MOEventBundle setPhotoTraits:](v149, "setPhotoTraits:", v166);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOWorkoutAnnotationManager buildRankingMetaDataDict:withBaseEvents:andContextEvents:](self, "buildRankingMetaDataDict:withBaseEvents:andContextEvents:", v149, obj, v186));
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v201, 8);
    p_super = &v184->super.super;
    goto LABEL_124;
  }
  v29 = 0;
LABEL_126:

  return v29;
}

void __63__MOWorkoutAnnotationManager_annotateBaseEvents_contextEvents___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;

  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setResources:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)annotateEventBundle:(id)a3 withContextEvents:(id)a4 andBaseEventReference:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  id os_log;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  NSSet *lessInterestingPoiCategories;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  NSMutableArray *v47;
  id v48;
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
  NSMutableArray *v60;
  void *v61;
  void *v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_new(NSMutableArray);
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 5));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:"));
  if (objc_msgSend(v12, "count"))
    -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v12);
  v58 = v12;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("stateOfMindEvent.reflectiveInterval = %d"), 1));
  v56 = v13;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:"));
  -[MOWorkoutAnnotationManager emotionAttachmentBundleDurationThreshold](self, "emotionAttachmentBundleDurationThreshold");
  *(float *)&v15 = v15;
  v54 = (void *)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:", v8, v10, v14, v15));
  -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v16);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v18 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v64 = objc_msgSend(v16, "count");
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "annotateEventBundle emotion events, %lu", buf, 0xCu);
  }
  v53 = v16;

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 6));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:"));
  v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 134217984;
    v64 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "annotateEventBundle Media Events (Playback), %lu", buf, 0xCu);
  }

  v51 = v19;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:playbackMediaEvents:](MOContextAnnotationUtilities, "annotateEventBundle:playbackMediaEvents:", v8, v19));
  v60 = v11;
  -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v23);
  v62 = v9;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:"));
  v61 = v10;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOWorkoutAnnotationManager filterPhoneVisits:farFromWorkoutEvents:forEventBundle:](self, "filterPhoneVisits:farFromWorkoutEvents:forEventBundle:", v24, v10, v8));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOWorkoutAnnotationManager referenceDateFromStartDate:endDate:index:](self, "referenceDateFromStartDate:endDate:index:", v26, v27, 0.3));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOWorkoutAnnotationManager majorVisitsFromVisits:referenceDate:](self, "majorVisitsFromVisits:referenceDate:", v25, v28));
  if (objc_msgSend(v29, "count"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
    v32 = -[MOWorkoutAnnotationManager isDominantPlaceForVisits:startDate:endDate:](self, "isDominantPlaceForVisits:startDate:endDate:", v29, v30, v31);

    if ((v32 & 1) == 0)
    {

      v29 = 0;
    }
  }
  v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = objc_msgSend(v24, "count");
    v36 = objc_msgSend(v25, "count");
    v37 = objc_msgSend(v29, "count");
    *(_DWORD *)buf = 134218496;
    v64 = v35;
    v65 = 2048;
    v66 = v36;
    v67 = 2048;
    v68 = v37;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "annotateEventBundle, visit Events, %lu, valid visits, %lu, majorVisits, %lu", buf, 0x20u);
  }

  if (v29 && objc_msgSend(v29, "count"))
  {
    lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
    -[MOWorkoutAnnotationManager visitLabelMediumConfidenceThreshold](self, "visitLabelMediumConfidenceThreshold");
    v40 = v39;
    -[MOWorkoutAnnotationManager visitLabelHighConfidenceThreshold](self, "visitLabelHighConfidenceThreshold");
    v42 = v41;
    -[MOWorkoutAnnotationManager aoiVisitLabelConfidentThreshold](self, "aoiVisitLabelConfidentThreshold");
    v44 = v43;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager fUniverse](self, "fUniverse"));
    v46 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:visitEvents:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:](MOContextAnnotationUtilities, "annotateEventBundle:visitEvents:poiCategoryBlocklist:mediumConfidenceThreshold:highConfidenceThreshold:aoiConfidenceThreshold:universe:", v8, v29, lessInterestingPoiCategories, v45, v40, v42, v44));

    v47 = v60;
    -[NSMutableArray addObjectsFromArray:](v60, "addObjectsFromArray:", v46);
    v23 = (void *)v46;
  }
  else
  {
    v47 = v60;
  }
  v48 = -[NSMutableArray copy](v47, "copy");

  return v48;
}

- (id)majorVisitsFromVisits:(id)a3 referenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD *v8;
  id os_log;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  double v23;
  void *j;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v32;
  id v33;
  id v34;
  id obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  double v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities groupedEventsFromEvents:propertyPath:](MOContextAnnotationUtilities, "groupedEventsFromEvents:propertyPath:", v5, CFSTR("placeName")));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = __66__MOWorkoutAnnotationManager_majorVisitsFromVisits_referenceDate___block_invoke;
    v45[3] = &unk_1002B3698;
    v33 = v6;
    v32 = v6;
    v46 = v32;
    v8 = objc_retainBlock(v45);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[MOWorkoutAnnotationManager majorVisitsFromVisits:referenceDate:].cold.1(v7);
    v34 = v5;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v42;
      v15 = 1.79769313e308;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          v18 = v7;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v17));
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v38;
            v23 = 1.79769313e308;
            do
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(_QWORD *)v38 != v22)
                  objc_enumerationMutation(v19);
                v23 = fmin(((double (*)(_QWORD *, _QWORD))v8[2])(v8, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j)), v23);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
            }
            while (v21);
          }
          else
          {
            v23 = 1.79769313e308;
          }
          v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v17;
            v49 = 2048;
            v50 = v23;
            _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "majorVisitsFromVisits, group, %@, distance, %f", buf, 0x16u);
          }

          if (v23 < v15)
          {
            v27 = v19;

            v36 = v27;
            v15 = v23;
          }
          v7 = v18;

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v13);
    }
    else
    {
      v15 = 1.79769313e308;
    }

    v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v28 = v36;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v48 = v32;
      v49 = 2048;
      v50 = v15;
      v51 = 2112;
      v52 = v36;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "annotateEventBundle Visit Events, reference date, %@, time distance, %f, visits, %@", buf, 0x20u);
    }

    v6 = v33;
    v5 = v34;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

double __66__MOWorkoutAnnotationManager_majorVisitsFromVisits_referenceDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v6 = fabs(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));

  objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v9 = fmin(v6, fabs(v8));

  return v9;
}

- (BOOL)isDominantPlaceForVisits:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  BOOL v25;
  id os_log;
  NSObject *v27;
  double v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v31 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("endDate"), 1);
    v40 = v31;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingDescriptors:", v11));

    v13 = objc_alloc((Class)NSDateInterval);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
    v18 = objc_msgSend(v13, "initWithStartDate:endDate:", v15, v17);

    v19 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v9, v10);
    objc_msgSend(v19, "duration");
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "intersectionWithDateInterval:", v19));
    objc_msgSend(v22, "duration");
    v24 = v23;

    if (v21 != 0.0)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v27 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        v33 = objc_msgSend(v8, "count");
        v34 = 2048;
        v35 = v24;
        v36 = 2048;
        v37 = v21;
        v38 = 2048;
        v39 = v24 / v21;
        _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "isDominantPlaceForVisits, visits.count, %lu, interaction, %f, workoutDuration, %f, overlap, %f", buf, 0x2Au);
      }

      if (v24 / v21 > 0.5)
      {
        v25 = 1;
        goto LABEL_11;
      }
      -[MOWorkoutAnnotationManager visitMinimumIntersectionWithActivityAbsoluteTime](self, "visitMinimumIntersectionWithActivityAbsoluteTime");
      if (v24 > v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
        v25 = objc_msgSend(v29, "placeUserType") != (id)1;

        goto LABEL_11;
      }
    }
    v25 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v25 = 0;
LABEL_12:

  return v25;
}

- (id)referenceDateFromStartDate:(id)a3 endDate:(id)a4 index:(double)a5
{
  id v7;
  double v8;
  id v9;
  void *v10;

  v7 = a3;
  objc_msgSend(a4, "timeIntervalSinceDate:", v7);
  if (v8 == 0.0)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", v8 * a5));
  v10 = v9;

  return v10;
}

- (id)buildRankingMetaDataDict:(id)a3 withBaseEvents:(id)a4 andContextEvents:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  void *i;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  NSMutableArray *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _UNKNOWN **v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSMutableArray *v66;
  NSMutableArray *v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  void *k;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSMutableArray *v83;
  NSMutableDictionary *v84;
  void *v85;
  NSMutableArray *obj;
  id obja;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];

  v7 = a3;
  v8 = a4;
  v84 = objc_opt_new(NSMutableDictionary);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
  v11 = v9;
  if (!v10)
    goto LABEL_10;
  v12 = v10;
  v13 = *(_QWORD *)v98;
  v14 = 0.0;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v98 != v13)
        objc_enumerationMutation(v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)i), "workoutDuration"));
      objc_msgSend(v16, "doubleValue");
      v14 = v14 + v17;

    }
    v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
  }
  while (v12);

  if (v14 > 0.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
    -[NSMutableDictionary setObject:forKey:](v84, "setObject:forKey:", v11, CFSTR("WorkoutDuration"));
LABEL_10:

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v19 = 0.0;
  if (objc_msgSend(v18, "category") == (id)2)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "workoutLocationStart"));

    if (!v21)
      goto LABEL_15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "workoutLocationStart"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager fUniverse](self, "fUniverse"));
    +[MOContextAnnotationUtilities distanceFromHomeToCLLocation:universe:](MOContextAnnotationUtilities, "distanceFromHomeToCLLocation:universe:", v22, v23);
    v19 = v24;

  }
LABEL_15:
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  if (objc_msgSend(v25, "category") == (id)16)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));

    if (!v26)
      goto LABEL_19;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
    objc_msgSend(v25, "distanceToHomeInMiles");
    v19 = v27;
  }

LABEL_19:
  if (v19 > 0.0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
    -[NSMutableDictionary setObject:forKey:](v84, "setObject:forKey:", v28, CFSTR("DistanceToHome"));

  }
  objc_msgSend(v7, "setMetaDataForRank:", v84);
  v29 = objc_opt_new(NSMutableArray);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
    -[NSMutableArray addObject:](v29, "addObject:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "places"));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "places"));
    -[NSMutableArray addObjectsFromArray:](v29, "addObjectsFromArray:", v33);

  }
  v88 = v9;
  v83 = v29;
  if (-[NSMutableArray count](v29, "count"))
  {
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    obj = v29;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
    if (!v34)
      goto LABEL_53;
    v35 = v34;
    v36 = *(_QWORD *)v94;
    while (1)
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(_QWORD *)v94 != v36)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)j);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
        v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "placeName"));
        if (!v40)
          goto LABEL_45;
        v41 = (void *)v40;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
        if (objc_msgSend(v42, "placeType"))
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "poiCategory"));

          v9 = v88;
          if (v44)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
            objc_msgSend(v45, "placeNameConfidence");
            if (v46 < 0.9)
            {

              goto LABEL_39;
            }
            v47 = (void *)nonInterestingPOIcategories;
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "poiCategory"));
            LODWORD(v47) = objc_msgSend(v47, "containsObject:", v49);

            if ((_DWORD)v47)
            {
              v50 = v7;
              v51 = &off_1002DCED8;
            }
            else
            {
LABEL_39:
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
              objc_msgSend(v52, "placeNameConfidence");
              if (v53 < 0.9)
              {

LABEL_44:
                v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                objc_msgSend(v7, "addMetaDataForRankForKey:value:", CFSTR("PoiCategory"), v39);
LABEL_45:

                goto LABEL_46;
              }
              v54 = (void *)interestingPOIcategories;
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "poiCategory"));
              LODWORD(v54) = objc_msgSend(v54, "containsObject:", v56);

              if (!(_DWORD)v54)
                goto LABEL_44;
              v50 = v7;
              v51 = &off_1002DCEE8;
            }
            objc_msgSend(v50, "addMetaDataForRankForKey:value:", CFSTR("PoiCategory"), v51);
          }
        }
        else
        {

          v9 = v88;
        }
LABEL_46:
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "placeName"));
        if (v57 && objc_msgSend(v38, "placeType"))
        {
          objc_msgSend(v38, "familiarityIndexLOI");
          v59 = v58;

          if (v59 == -1.0)
            continue;
          objc_msgSend(v38, "familiarityIndexLOI");
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v7, "addMetaDataForRankForKey:value:", CFSTR("FamiliarityIndex"), v57);
        }

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
      if (!v35)
      {
LABEL_53:

        v29 = v83;
        break;
      }
    }
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v61 = objc_msgSend(v60, "category");

  if (v61 == (id)16)
  {
    +[MOWorkoutAnnotationManager maxDistanceSpanFromStartUsingSparseLocations:](MOWorkoutAnnotationManager, "maxDistanceSpanFromStartUsingSparseLocations:", v9);
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v7, "addMetaDataForRankForKey:value:", CFSTR("MotionActivityWalkSpan"), v62);

  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "events"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "filteredArrayUsingPredicate:", v63));

  if (objc_msgSend(v65, "count"))
  {
    obja = v63;
    v66 = objc_opt_new(NSMutableArray);
    v67 = objc_opt_new(NSMutableArray);
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v85 = v65;
    v68 = v65;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v90;
      do
      {
        for (k = 0; k != v70; k = (char *)k + 1)
        {
          if (*(_QWORD *)v90 != v71)
            objc_enumerationMutation(v68);
          v73 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)k);
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "stateOfMindEvent"));
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "labels"));
          -[NSMutableArray addObjectsFromArray:](v66, "addObjectsFromArray:", v75);

          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "stateOfMindEvent"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "domains"));
          -[NSMutableArray addObjectsFromArray:](v67, "addObjectsFromArray:", v77);

        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
      }
      while (v70);
    }

    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v66));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "allObjects"));
    objc_msgSend(v7, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindLabels"), v79);

    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v67));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "allObjects"));
    objc_msgSend(v7, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindDomains"), v81);

    v63 = obja;
    v9 = v88;
    v29 = v83;
    v65 = v85;
  }

  return v7;
}

- (id)filterPhoneVisits:(id)a3 farFromWorkoutEvents:(id)a4 forEventBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  dispatch_once_t *v37;
  void *v38;
  void *v39;
  dispatch_once_t *v40;
  id v41;
  NSObject *v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  id v49;
  id v50;
  NSMutableArray *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  const char *v66;
  id v67;
  id v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v79;
  id v80;
  void *v81;
  NSMutableArray *v82;
  id obj;
  NSMutableArray *v84;
  NSMutableArray *v85;
  uint64_t v86;
  id v87;
  char v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  _BYTE v104[128];
  _BYTE v105[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[MOWorkoutAnnotationManager filterPhoneVisits:farFromWorkoutEvents:forEventBundle:].cold.3(v8);

  v82 = objc_opt_new(NSMutableArray);
  v84 = objc_opt_new(NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v14 = objc_msgSend(v13, "category");

  if (v14 == (id)16)
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[MOWorkoutAnnotationManager filterPhoneVisits:farFromWorkoutEvents:forEventBundle:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    v24 = (NSMutableArray *)v8;
    v25 = v84;
    goto LABEL_56;
  }
  v79 = v10;
  v81 = v8;
  v26 = objc_opt_new(NSMutableArray);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v80 = v9;
  v27 = v9;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  if (!v28)
  {
    v88 = 0;
    goto LABEL_21;
  }
  v29 = v28;
  v88 = 0;
  v30 = *(_QWORD *)v98;
  do
  {
    for (i = 0; i != v29; i = (char *)i + 1)
    {
      if (*(_QWORD *)v98 != v30)
        objc_enumerationMutation(v27);
      v32 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)i);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "workoutLocationRoute"));
      v34 = objc_msgSend(v33, "count");

      if (v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "workoutLocationRoute"));
        -[NSMutableArray addObjectsFromArray:](v26, "addObjectsFromArray:", v35);
        v88 = 1;
      }
      else
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "workoutLocationStart"));

        if (!v36)
          continue;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "workoutLocationStart"));
        -[NSMutableArray addObject:](v26, "addObject:", v35);
      }

    }
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  }
  while (v29);
LABEL_21:

  if (-[NSMutableArray count](v26, "count"))
  {
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    obj = v81;
    v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
    if (!v87)
      goto LABEL_49;
    v86 = *(_QWORD *)v94;
    v37 = &MOLogFacilityEventBundleManager;
    v85 = v26;
    while (1)
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v94 != v86)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v38);
        v40 = v37;
        v41 = _mo_log_facility_get_os_log(v37);
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v103 = v39;
          _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Filter phone visits: compare watch locations to visit: %@", buf, 0xCu);
        }

        v43 = objc_alloc((Class)CLLocation);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "location"));
        objc_msgSend(v44, "latitude");
        v46 = v45;
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "location"));
        objc_msgSend(v47, "longitude");
        v49 = objc_msgSend(v43, "initWithLatitude:longitude:", v46, v48);

        v50 = objc_msgSend(v39, "placeUserType");
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        v51 = v26;
        v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v90;
LABEL_31:
          v55 = 0;
          while (1)
          {
            if (*(_QWORD *)v90 != v54)
              objc_enumerationMutation(v51);
            objc_msgSend(v49, "distanceFromLocation:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v55));
            v57 = v56;
            -[MOWorkoutAnnotationManager maximumWatchPhoneVisitDistance](self, "maximumWatchPhoneVisitDistance");
            if (v57 <= v58)
              break;
            if (v53 == (id)++v55)
            {
              v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
              if (v53)
                goto LABEL_31;
              goto LABEL_37;
            }
          }
          v37 = v40;
          v59 = _mo_log_facility_get_os_log(v40);
          v60 = objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v103 = v39;
            _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "Filter phone visits: watch location distance from visit within threshold, visit: %@", buf, 0xCu);
          }

          if (((v50 == (id)1) & v88) != 0)
            goto LABEL_41;
          -[NSMutableArray addObject:](v82, "addObject:", v39);
          v67 = _mo_log_facility_get_os_log(v40);
          v64 = objc_claimAutoreleasedReturnValue(v67);
          if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            goto LABEL_44;
          *(_DWORD *)buf = 138412290;
          v103 = v39;
          v65 = v64;
          v66 = "Filter phone visits: At least 1 watch location within visit distance threshold so adding to return array, visit: %@";
          goto LABEL_47;
        }
LABEL_37:

        v37 = v40;
LABEL_41:
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "eventIdentifier"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "UUIDString"));
        -[NSMutableArray addObject:](v84, "addObject:", v62);

        v63 = _mo_log_facility_get_os_log(v37);
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v103 = v39;
          v65 = v64;
          v66 = "Filter phone visits: adding visit event ID to list of visit events excluded by location check, visit: %@";
LABEL_47:
          _os_log_debug_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, v66, buf, 0xCu);
        }
LABEL_44:
        v26 = v85;

        v38 = (char *)v38 + 1;
      }
      while (v38 != v87);
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
      v87 = v68;
      if (!v68)
      {
LABEL_49:

        v25 = v84;
        v10 = v79;
        if (-[NSMutableArray count](v84, "count"))
          objc_msgSend(v79, "setVisitEventsRejectedByWatchLocation:", v84);
        v24 = v82;
        v9 = v80;
        goto LABEL_55;
      }
    }
  }
  v69 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v70 = objc_claimAutoreleasedReturnValue(v69);
  v9 = v80;
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    -[MOWorkoutAnnotationManager filterPhoneVisits:farFromWorkoutEvents:forEventBundle:].cold.2(v70, v71, v72, v73, v74, v75, v76, v77);

  v24 = 0;
  v10 = v79;
  v25 = v84;
LABEL_55:

  v8 = v81;
LABEL_56:

  return v24;
}

+ (double)maxDistanceSpanFromStartUsingSparseLocations:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  double v31;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  id v45;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v45 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "workoutEvent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutLocationRoute"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v34 = v4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "workoutEvent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutLocationRoute"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v33 = v6;
      v15 = v6;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v40;
        v19 = 0.0;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v18)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "workoutEvent", v33));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "workoutLocationRoute"));
            v24 = objc_msgSend(v23, "count");

            if (v24)
            {
              v37 = 0u;
              v38 = 0u;
              v35 = 0u;
              v36 = 0u;
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "workoutEvent"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "workoutLocationRoute"));

              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v36;
                do
                {
                  for (j = 0; j != v28; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v36 != v29)
                      objc_enumerationMutation(v26);
                    objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j), "distanceFromLocation:", v14);
                    if (v31 > v19)
                      v19 = v31;
                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                }
                while (v28);
              }

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v17);
      }
      else
      {
        v19 = 0.0;
      }

      v6 = v33;
      v4 = v34;
    }
    else
    {
      v19 = 0.0;
    }

  }
  else
  {
    v19 = 0.0;
  }

  return v19;
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  return 0;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (double)visitLabelMediumConfidenceThreshold
{
  return self->_visitLabelMediumConfidenceThreshold;
}

- (void)setVisitLabelMediumConfidenceThreshold:(double)a3
{
  self->_visitLabelMediumConfidenceThreshold = a3;
}

- (double)visitLabelHighConfidenceThreshold
{
  return self->_visitLabelHighConfidenceThreshold;
}

- (void)setVisitLabelHighConfidenceThreshold:(double)a3
{
  self->_visitLabelHighConfidenceThreshold = a3;
}

- (double)aoiVisitLabelConfidentThreshold
{
  return self->_aoiVisitLabelConfidentThreshold;
}

- (void)setAoiVisitLabelConfidentThreshold:(double)a3
{
  self->_aoiVisitLabelConfidentThreshold = a3;
}

- (double)maximumWatchPhoneVisitDistance
{
  return self->_maximumWatchPhoneVisitDistance;
}

- (void)setMaximumWatchPhoneVisitDistance:(double)a3
{
  self->_maximumWatchPhoneVisitDistance = a3;
}

- (double)motionActivityWalkDurationThreshold
{
  return self->_motionActivityWalkDurationThreshold;
}

- (void)setMotionActivityWalkDurationThreshold:(double)a3
{
  self->_motionActivityWalkDurationThreshold = a3;
}

- (double)motionActivityRunDurationThreshold
{
  return self->_motionActivityRunDurationThreshold;
}

- (void)setMotionActivityRunDurationThreshold:(double)a3
{
  self->_motionActivityRunDurationThreshold = a3;
}

- (double)motionActivityMixedRunningWalkingDurationThreshold
{
  return self->_motionActivityMixedRunningWalkingDurationThreshold;
}

- (void)setMotionActivityMixedRunningWalkingDurationThreshold:(double)a3
{
  self->_motionActivityMixedRunningWalkingDurationThreshold = a3;
}

- (double)motionActivityWalkCadenceThreshold
{
  return self->_motionActivityWalkCadenceThreshold;
}

- (void)setMotionActivityWalkCadenceThreshold:(double)a3
{
  self->_motionActivityWalkCadenceThreshold = a3;
}

- (double)motionActivityWalkSpanThreshold
{
  return self->_motionActivityWalkSpanThreshold;
}

- (void)setMotionActivityWalkSpanThreshold:(double)a3
{
  self->_motionActivityWalkSpanThreshold = a3;
}

- (double)motionActivityRunSpanThreshold
{
  return self->_motionActivityRunSpanThreshold;
}

- (void)setMotionActivityRunSpanThreshold:(double)a3
{
  self->_motionActivityRunSpanThreshold = a3;
}

- (double)motionActivityMixedRunningWalkingSpanThreshold
{
  return self->_motionActivityMixedRunningWalkingSpanThreshold;
}

- (void)setMotionActivityMixedRunningWalkingSpanThreshold:(double)a3
{
  self->_motionActivityMixedRunningWalkingSpanThreshold = a3;
}

- (double)motionActivityRunDistanceThreshold
{
  return self->_motionActivityRunDistanceThreshold;
}

- (void)setMotionActivityRunDistanceThreshold:(double)a3
{
  self->_motionActivityRunDistanceThreshold = a3;
}

- (double)motionActivityMixedRunningWalkingDistanceThreshold
{
  return self->_motionActivityMixedRunningWalkingDistanceThreshold;
}

- (void)setMotionActivityMixedRunningWalkingDistanceThreshold:(double)a3
{
  self->_motionActivityMixedRunningWalkingDistanceThreshold = a3;
}

- (double)motionActivityWalkMinimumLocationUncertainty
{
  return self->_motionActivityWalkMinimumLocationUncertainty;
}

- (void)setMotionActivityWalkMinimumLocationUncertainty:(double)a3
{
  self->_motionActivityWalkMinimumLocationUncertainty = a3;
}

- (double)motionActivityReferencePointRatio
{
  return self->_motionActivityReferencePointRatio;
}

- (void)setMotionActivityReferencePointRatio:(double)a3
{
  self->_motionActivityReferencePointRatio = a3;
}

- (double)visitMinimumIntersectionWithActivityAbsoluteTime
{
  return self->_visitMinimumIntersectionWithActivityAbsoluteTime;
}

- (void)setVisitMinimumIntersectionWithActivityAbsoluteTime:(double)a3
{
  self->_visitMinimumIntersectionWithActivityAbsoluteTime = a3;
}

- (BOOL)allowDuplicatedWorkouts
{
  return self->_allowDuplicatedWorkouts;
}

- (void)setAllowDuplicatedWorkouts:(BOOL)a3
{
  self->_allowDuplicatedWorkouts = a3;
}

- (double)emotionAttachmentBundleDurationThreshold
{
  return self->_emotionAttachmentBundleDurationThreshold;
}

- (void)setEmotionAttachmentBundleDurationThreshold:(double)a3
{
  self->_emotionAttachmentBundleDurationThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_lessInterestingPoiCategories, 0);
}

- (void)majorVisitsFromVisits:(void *)a1 referenceDate:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v1, v2, "majorVisitsFromVisits, group count, %lu", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_5();
}

- (void)filterPhoneVisits:(uint64_t)a3 farFromWorkoutEvents:(uint64_t)a4 forEventBundle:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, a1, a3, "Filter phone visits: activity events are phone-based so return all visit events", a5, a6, a7, a8, 0);
}

- (void)filterPhoneVisits:(uint64_t)a3 farFromWorkoutEvents:(uint64_t)a4 forEventBundle:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, a1, a3, "Filter phone visits: no watch-based locations available for workouts in set so return nil", a5, a6, a7, a8, 0);
}

- (void)filterPhoneVisits:(void *)a1 farFromWorkoutEvents:forEventBundle:.cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v1, v2, "Filter phone visits: candidate visit event count is %lu", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_5();
}

@end
