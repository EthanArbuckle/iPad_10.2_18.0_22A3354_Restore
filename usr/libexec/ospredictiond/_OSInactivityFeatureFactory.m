@implementation _OSInactivityFeatureFactory

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  v2 = os_log_create("com.apple.osintelligence", "inactivity.featurefactory");
  v3 = (void *)qword_100076810;
  qword_100076810 = (uint64_t)v2;

}

+ (id)inputFeaturesWithNames:(id)a3 atDate:(id)a4 withIntervalHistory:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  __int128 v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  __int128 v28;
  id obj;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  _BYTE v39[128];

  v10 = a3;
  v31 = a4;
  v11 = a5;
  v30 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v34;
    *(_QWORD *)&v14 = 138412290;
    v28 = v14;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v17);
        v19 = objc_autoreleasePoolPush();
        v20 = objc_opt_class(_OSLockHistory);
        if ((objc_opt_isKindOfClass(v11, v20) & 1) != 0)
        {
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lockFeatureValueWithName:atDate:withLockHistory:withContext:", v18, v31, v11, v30));
          goto LABEL_10;
        }
        v22 = objc_opt_class(_OSActivityHistory);
        if ((objc_opt_isKindOfClass(v11, v22) & 1) != 0)
        {
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "activityFeatureValueWithName:atDate:withActivityHistory:withContext:", v18, v31, v11, v30));
LABEL_10:
          v23 = (void *)v21;
          if (v21)
            goto LABEL_14;
        }
        v24 = qword_100076810;
        if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v28;
          v38 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Feature value for %@ is nil! Default to 0", buf, 0xCu);
        }
        v23 = 0;
LABEL_14:
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, v18, v28);

        objc_autoreleasePoolPop(v19);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v15);
  }

  v32 = 0;
  v25 = objc_msgSend(objc_alloc((Class)MLDictionaryFeatureProvider), "initWithDictionary:error:", v12, &v32);
  v26 = v32;
  if (v26 && os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
    sub_10003D94C();

  return v25;
}

+ (id)lockFeatureValueWithName:(id)a3 atDate:(id)a4 withLockHistory:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "handleSpecialHistoryAgnosticFeaturesWithName:atDate:withContext:", v10, v11, v13));
      v15 = v14;
      if (v14)
      {
        v16 = v14;
LABEL_32:

        goto LABEL_33;
      }
      if (!v12
        || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allIntervalsSortByStartAsc")),
            v18 = objc_msgSend(v17, "count"),
            v17,
            !v18))
      {
        if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
          sub_10003DA04();
        v16 = 0;
        goto LABEL_32;
      }
      v19 = CFSTR("overlap");
      if ((objc_msgSend(v10, "containsString:", CFSTR("overlap")) & 1) != 0)
      {
        v20 = 0;
      }
      else
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixStringFromFeatureName:", v10));
        v20 = (int)objc_msgSend(a1, "suffixNumberFromFeatureName:", v10);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getAllLockIntervalsEndingBefore:", v11));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "filteredDurationsFromIntervals:beforeDate:whichHistorySubset:withBinWidth:", v21, v11, v19, v20));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extractPercentileOrQuantileNumberIfAnyFromFeatureName:", v10));
      v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "doubleValue");
        +[OSIntelligenceUtilities qthPercentileOf:withQ:](OSIntelligenceUtilities, "qthPercentileOf:withQ:", v22);
      }
      else if (objc_msgSend(v10, "containsString:", CFSTR("dur_std")))
      {
        +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v22);
      }
      else if (objc_msgSend(v10, "containsString:", CFSTR("dur_avg")))
      {
        +[OSIntelligenceUtilities meanOf:](OSIntelligenceUtilities, "meanOf:", v22);
      }
      else if (objc_msgSend(v10, "containsString:", CFSTR("dur_med")))
      {
        +[OSIntelligenceUtilities medianOf:](OSIntelligenceUtilities, "medianOf:", v22);
      }
      else if (objc_msgSend(v10, "containsString:", CFSTR("dur_mad")))
      {
        +[OSIntelligenceUtilities meanAbsoluteDeviationOf:](OSIntelligenceUtilities, "meanAbsoluteDeviationOf:", v22);
      }
      else
      {
        if (!objc_msgSend(v10, "containsString:", CFSTR("long_percent")))
        {
          if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
            sub_10003DA30();
          v16 = 0;
          goto LABEL_31;
        }
        +[OSIntelligenceUtilities percentOfLongDurationsIn:withLongThreshold:](OSIntelligenceUtilities, "percentOfLongDurationsIn:withLongThreshold:", v22, 10800.0);
      }
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
LABEL_31:

      goto LABEL_32;
    }
    if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
      sub_10003D9D8();
  }
  else if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
  {
    sub_10003D9AC();
  }
  v16 = 0;
LABEL_33:

  return v16;
}

+ (id)activityFeatureValueWithName:(id)a3 atDate:(id)a4 withActivityHistory:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  double v26;
  void *i;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _BYTE v43[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "handleSpecialHistoryAgnosticFeaturesWithName:atDate:withContext:", v10, v11, v13));
      v15 = v14;
      if (v14)
      {
        v16 = v14;
LABEL_46:

        goto LABEL_47;
      }
      if (!v12)
      {
        if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
          sub_10003DA90();
        v16 = 0;
        goto LABEL_46;
      }
      v17 = objc_msgSend(a1, "parseStrataTypeFromFeatureName:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getDailyAnchorsForDate:whichStrata:", v11, v17));
      if (objc_msgSend(v10, "containsString:", CFSTR("dur_til_act")))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "historicalTimesUntilNextActivityAtDate:whichStrata:useDecay:", v11, v17, 1));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extractPercentileOrQuantileNumberIfAnyFromFeatureName:", v10));
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "doubleValue");
          +[OSIntelligenceUtilities qthPercentileOf:withQ:](OSIntelligenceUtilities, "qthPercentileOf:withQ:", v19);
LABEL_19:
          v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

LABEL_45:
          goto LABEL_46;
        }
        if (objc_msgSend(v10, "containsString:", CFSTR("std")))
        {
          +[OSIntelligenceUtilities standardDeviationOf:](OSIntelligenceUtilities, "standardDeviationOf:", v19);
          goto LABEL_19;
        }

      }
      v42 = 0;
      if (objc_msgSend(a1, "extractLeftWatershed:andRight:fromFeatureName:", (char *)&v42 + 4, &v42, v10))
      {
        v37 = v10;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getPastSliceTimewiseNearDate:whichStrata:earlyBoundaryInSeconds:laterBoundaryInSeconds:clipIntervals:", v11, v17, 1, (double)(60 * HIDWORD(v42)), (double)(60 * (int)v42)));
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v22 = v18;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v39;
          v26 = 0.0;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(_QWORD *)v39 != v25)
                objc_enumerationMutation(v22);
              v28 = (double)((int)v42 - HIDWORD(v42)) / 60.0;
              v29 = +[OSIntelligenceUtilities datewiseDistanceBetweenDate:andDate:](OSIntelligenceUtilities, "datewiseDistanceBetweenDate:andDate:", v11, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i));
              objc_msgSend(v12, "recommendedDecayDegree");
              +[OSIntelligenceUtilities exponentialDecayByDateDistance:withDegree:](OSIntelligenceUtilities, "exponentialDecayByDateDistance:withDegree:", v29);
              v26 = v26 + v28 * v30;
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          }
          while (v24);
        }
        else
        {
          v26 = 0.0;
        }

        v10 = v37;
        v15 = 0;
        if (objc_msgSend(v37, "containsString:", CFSTR("dur")))
        {
          objc_msgSend(v12, "recommendedDecayDegree");
          +[OSIntelligenceUtilities sumIntervalsWithDateDecay:fromDate:withDecayDegree:](OSIntelligenceUtilities, "sumIntervalsWithDateDecay:fromDate:withDecayDegree:", v36, v11);
          v32 = v31 / 3600.0;
          if (objc_msgSend(v37, "hasSuffix:", CFSTR("act")))
          {
LABEL_36:
            v34 = v32;
LABEL_40:
            v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v34));

            goto LABEL_45;
          }
          if (objc_msgSend(v37, "hasSuffix:", CFSTR("r8")))
            goto LABEL_38;
        }
        if (objc_msgSend(v37, "containsString:", CFSTR("cnt")))
        {
          objc_msgSend(v12, "recommendedDecayDegree");
          +[OSIntelligenceUtilities countIntervalsWithDateDecay:fromDate:withDecayDegree:](OSIntelligenceUtilities, "countIntervalsWithDateDecay:fromDate:withDecayDegree:", v36, v11);
          v32 = v33;
          if (objc_msgSend(v37, "hasSuffix:", CFSTR("act")))
            goto LABEL_36;
          if (objc_msgSend(v37, "hasSuffix:", CFSTR("r8")))
          {
LABEL_38:
            v34 = v32 / v26;
            if (v26 == 0.0)
              v34 = 0.0;
            goto LABEL_40;
          }
        }

      }
      if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
        sub_10003DA30();
      v16 = 0;
      goto LABEL_45;
    }
    if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
      sub_10003D9D8();
  }
  else if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
  {
    sub_10003D9AC();
  }
  v16 = 0;
LABEL_47:

  return v16;
}

+ (id)handleSpecialHistoryAgnosticFeaturesWithName:(id)a3 atDate:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
      sub_10003D9AC();
    goto LABEL_10;
  }
  if (!v9
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7)), v11, !v11))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("time_of_day")))
    {
      +[OSIntelligenceUtilities timeOfDayWithDate:](OSIntelligenceUtilities, "timeOfDayWithDate:", v8);
      v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      goto LABEL_7;
    }
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v7));
LABEL_7:
  v13 = (void *)v12;
LABEL_11:

  return v13;
}

+ (id)filteredDurationsFromIntervals:(id)a3 beforeDate:(id)a4 whichHistorySubset:(id)a5 withBinWidth:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "filterInactiveEvents:beforeDate:whichHistorySubset:withHourBinWidth:", a3, v10, a5, a6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities dynamicDurationsFromEvents:withAnchorDate:withUnit:cappedAt:](OSIntelligenceUtilities, "dynamicDurationsFromEvents:withAnchorDate:withUnit:cappedAt:", v11, v10, 3600.0, 50400.0));

  return v12;
}

+ (id)filterInactiveEvents:(id)a3 beforeDate:(id)a4 whichHistorySubset:(id)a5 withHourBinWidth:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  void *v24;
  void **v25;
  uint64_t v26;
  id (*v27)(uint64_t, uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  void *v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000A6E8;
  v30[3] = &unk_100060918;
  v12 = v10;
  v31 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v30));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v13));

  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("overlap")))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:](OSIntelligenceUtilities, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:", v9, v12, v12, a6));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v14));
    objc_msgSend(v17, "addObjectsFromArray:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1));
    v32 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingDescriptors:", v19));

    if (objc_msgSend(v11, "isEqualToString:", CFSTR("all")))
    {
      v21 = v20;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("recent")))
    {
      v21 = (id)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:isRecentForDate:goingDaysBack:useEndDate:](OSIntelligenceUtilities, "filterEvents:isRecentForDate:goingDaysBack:useEndDate:", v20, v12, 3, 0));
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("woo")))
    {
      v21 = (id)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:withSameWorkOrOffStatusAs:](OSIntelligenceUtilities, "filterEvents:withSameWorkOrOffStatusAs:", v20, v12));
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("dow")))
    {
      v21 = (id)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:startOnSameWeekdayAs:withHourBinWidth:](OSIntelligenceUtilities, "filterEvents:startOnSameWeekdayAs:withHourBinWidth:", v20, v12, a6));
    }
    else
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("eligible")))
      {
        v22 = 600.0;
      }
      else
      {
        if (!objc_msgSend(v11, "isEqualToString:", CFSTR("long")))
        {
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("startafter")))
          {
            v25 = _NSConcreteStackBlock;
            v26 = 3221225472;
            v27 = sub_10000A700;
            v28 = &unk_100060918;
            v29 = v12;
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &v25));
            v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "filteredArrayUsingPredicate:", v24, v25, v26, v27, v28));

          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
              sub_10003DABC();
            v15 = 0;
          }
          goto LABEL_17;
        }
        v22 = 7200.0;
      }
      v21 = (id)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:withMinimumDuration:](OSIntelligenceUtilities, "filterEvents:withMinimumDuration:", v20, v22));
    }
    v15 = v21;
LABEL_17:

    goto LABEL_18;
  }
  v15 = v14;
LABEL_18:

  return v15;
}

+ (id)lockedEventsFromDataSourceUpToDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getAllLockIntervalsEndingBefore:", v3));

  return v5;
}

+ (int64_t)parseStrataTypeFromFeatureName:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixStringFromFeatureName:", v4));
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("all")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("woo")) & 1) != 0)
    {
      v6 = 2;
      goto LABEL_9;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("dow")) & 1) != 0)
    {
      v6 = 1;
      goto LABEL_9;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("l3d")) & 1) != 0)
    {
      v6 = 3;
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
      sub_10003DB1C();
  }
  v6 = 0;
LABEL_9:

  return v6;
}

+ (id)prefixStringFromFeatureName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v11;

  v3 = a3;
  v11 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("^([^_\\W]+)_"), 16, &v11));
  v5 = v11;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
      sub_10003DB7C();
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
    v6 = 0;
    if ((unint64_t)objc_msgSend(v7, "numberOfRanges") >= 2)
    {
      v8 = objc_msgSend(v7, "rangeAtIndex:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v8, v9));
    }

  }
  return v6;
}

+ (int)suffixNumberFromFeatureName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;

  v3 = a3;
  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("_(\\d+)$"), 16, &v12));
  v5 = v12;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
      sub_10003DBDC();
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
    if ((unint64_t)objc_msgSend(v7, "numberOfRanges") >= 2)
    {
      v8 = objc_msgSend(v7, "rangeAtIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v8, v9));
      v6 = objc_msgSend(v10, "intValue");

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

+ (id)extractPercentileOrQuantileNumberIfAnyFromFeatureName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v17;
  id v18;

  v3 = a3;
  if (v3)
  {
    v18 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("_q(\\d+)"), 1, &v18));
    v5 = v18;
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
        sub_10003DCC8();
      v7 = 0;
    }
    else
    {
      v17 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("_p(\\d+)"), 1, &v17));
      v6 = v17;
      if (v6)
      {
        if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
          sub_10003DC68();
        v7 = 0;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
        if ((unint64_t)objc_msgSend(v9, "numberOfRanges") < 2)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
          if ((unint64_t)objc_msgSend(v12, "numberOfRanges") < 2)
          {
            v7 = 0;
          }
          else
          {
            v13 = objc_msgSend(v12, "rangeAtIndex:", 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v13, v14));
            v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v15, "intValue")));

          }
        }
        else
        {
          v10 = objc_msgSend(v9, "rangeAtIndex:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v10, v11));
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v12, "intValue")));
        }

      }
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
      sub_10003DC3C();
    v7 = 0;
  }

  return v7;
}

+ (BOOL)extractLeftWatershed:(int *)a3 andRight:(int *)a4 fromFeatureName:(id)a5
{
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v20;

  v7 = a5;
  if (v7)
  {
    v20 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\\((-?\\d+),(-?\\d+)\\)"), 0, &v20));
    v9 = v20;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
        sub_10003DD28();
      v10 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length")));
      v12 = objc_msgSend(v11, "numberOfRanges");
      v10 = (unint64_t)v12 > 2;
      if ((unint64_t)v12 >= 3)
      {
        v13 = objc_msgSend(v11, "rangeAtIndex:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v13, v14));
        v16 = objc_msgSend(v11, "rangeAtIndex:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v16, v17));
        *a3 = objc_msgSend(v15, "intValue");
        *a4 = objc_msgSend(v18, "intValue");

      }
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100076810, OS_LOG_TYPE_ERROR))
      sub_10003DC3C();
    v10 = 0;
  }

  return v10;
}

@end
