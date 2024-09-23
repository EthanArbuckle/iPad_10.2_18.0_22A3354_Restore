@implementation _OSActivityHistory

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B36C;
  block[3] = &unk_100060720;
  block[4] = a1;
  if (qword_100076840 != -1)
    dispatch_once(&qword_100076840, block);
  return (id)qword_100076838;
}

- (void)loadHistoryFromUnderlyingDataSource
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
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
  _QWORD v36[7];
  _QWORD v37[5];
  _QWORD v38[5];
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  NSMutableArray *v45;
  _QWORD v46[5];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;

  v31 = (void *)os_transaction_create("com.apple.osintelligence.activityhistory.loadHistoryFromUnderlyingDataSource");
  v3 = BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "Activity"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "Level"));

  v6 = objc_alloc((Class)BMPublisherOptions);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -5184000.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = objc_msgSend(v6, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v7, v8, 8000, 0, 0);

  v30 = v9;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "publisherWithOptions:", v9));
  v10 = BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "Device"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "TimeZone"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publisher"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "orderedMergeWithOther:comparator:", v34, &stru_100060998));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "filterWithIsIncluded:", &stru_1000609D8));
  v15 = objc_msgSend(objc_alloc((Class)BPSTuple), "initWithFirst:second:", 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scanWithInitial:nextPartialResult:", v15, &stru_100060A18));

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10000BA08;
  v46[3] = &unk_100060A40;
  v46[4] = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filterWithIsIncluded:", v46));
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_10000BA70;
  v44 = sub_10000BA80;
  v45 = objc_opt_new(NSMutableArray);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_10000BA70;
  v38[4] = sub_10000BA80;
  v39 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "filterWithIsIncluded:", &stru_100060A80));
  v37[1] = 3221225472;
  v37[2] = sub_10000BAD8;
  v37[3] = &unk_100060AA8;
  v37[4] = self;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10000BB38;
  v36[3] = &unk_100060AD0;
  v36[4] = self;
  v36[5] = v38;
  v36[6] = &v40;
  v37[0] = _NSConcreteStackBlock;
  v19 = objc_msgSend(v18, "sinkWithCompletion:receiveInput:", v37, v36);

  -[_OSIntervalHistory setAllIntervalsSortByStartAsc:](self, "setAllIntervalsSortByStartAsc:", v41[5]);
  v20 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory log](self, "log"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
    v22 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 134217984;
    v48 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Constructed %lu active interval(s) from Biome", buf, 0xCu);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[_OSIntervalHistory setLastRefreshDate:](self, "setLastRefreshDate:", v23);

  v24 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory log](self, "log"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory lastRefreshDate](self, "lastRefreshDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory oldestIntervalInHistory](self, "oldestIntervalInHistory"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory newestIntervalInHistory](self, "newestIntervalInHistory"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate"));
    *(_DWORD *)buf = 138412802;
    v48 = v25;
    v49 = 2112;
    v50 = v27;
    v51 = 2112;
    v52 = v29;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Reloaded from Biome at %@ with activities ranging from %@ to %@", buf, 0x20u);

  }
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(&v40, 8);
}

- (void)updateStratasWithQueryDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory lastQueryDate](self, "lastQueryDate"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory lastQueryDate](self, "lastQueryDate"));
    if (v7 == v4)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_OSActivityHistory intervalsSameDayOfWeekAsQuery](self, "intervalsSameDayOfWeekAsQuery"));
      v7 = v4;
      if (v15)
      {
        v16 = objc_claimAutoreleasedReturnValue(-[_OSActivityHistory intervalsSameWorkOrOffAsQuery](self, "intervalsSameWorkOrOffAsQuery"));
        if (v16)
        {
          v17 = (void *)v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[_OSActivityHistory intervalsRecentFromQuery](self, "intervalsRecentFromQuery"));

          if (v18)
            goto LABEL_7;
          goto LABEL_4;
        }

        v7 = v4;
      }
    }

  }
LABEL_4:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:withDateDistance:fromDate:](OSIntelligenceUtilities, "filterEvents:withDateDistance:fromDate:", v8, 7, v4));
  -[_OSActivityHistory setIntervalsSameDayOfWeekAsQuery:](self, "setIntervalsSameDayOfWeekAsQuery:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:withSameWorkOrOffStatusAs:](OSIntelligenceUtilities, "filterEvents:withSameWorkOrOffStatusAs:", v10, v4));
  -[_OSActivityHistory setIntervalsSameWorkOrOffAsQuery:](self, "setIntervalsSameWorkOrOffAsQuery:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities filterEvents:isRecentForDate:goingDaysBack:useEndDate:](OSIntelligenceUtilities, "filterEvents:isRecentForDate:goingDaysBack:useEndDate:", v12, v4, 3, 1));
  -[_OSActivityHistory setIntervalsRecentFromQuery:](self, "setIntervalsRecentFromQuery:", v13);

  v14 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory log](self, "log"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10003DED8((uint64_t)v4, self, v14);

  -[_OSIntervalHistory setLastQueryDate:](self, "setLastQueryDate:", v4);
LABEL_7:

}

- (double)recommendedDecayDegree
{
  return 0.04;
}

- (double)hoursUntilNextActivityAtDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C0DC;
  v15[3] = &unk_100060AF8;
  v6 = v4;
  v16 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v15);

  v8 = 24.0;
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
    objc_msgSend(v11, "timeIntervalSinceDate:", v6);
    v13 = v12 / 3600.0;

    v8 = fmin(v13, 24.0);
  }

  return v8;
}

- (id)historicalTimesUntilNextActivityAtDate:(id)a3 whichStrata:(int64_t)a4 useDecay:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a5;
  v8 = a3;
  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", v8);
  v9 = objc_opt_new(NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[_OSActivityHistory getDailyAnchorsForDate:whichStrata:](self, "getDailyAnchorsForDate:whichStrata:", v8, a4));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v15 = +[OSIntelligenceUtilities datewiseDistanceBetweenDate:andDate:](OSIntelligenceUtilities, "datewiseDistanceBetweenDate:andDate:", v8, v14);
        v16 = 1.0;
        if (v5)
        {
          +[OSIntelligenceUtilities exponentialDecayByDateDistance:withDegree:](OSIntelligenceUtilities, "exponentialDecayByDateDistance:withDegree:", v15, 0.04);
          v16 = v17;
        }
        -[_OSActivityHistory hoursUntilNextActivityAtDate:](self, "hoursUntilNextActivityAtDate:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16 * v18));
        -[NSMutableArray addObject:](v9, "addObject:", v19);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  return v9;
}

- (id)historicalSecondsSinceInactiveAtDate:(id)a3 whichStrata:(int64_t)a4
{
  id v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a3;
  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", v6);
  v7 = objc_opt_new(NSMutableArray);
  v20 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSActivityHistory getDailyAnchorsForDate:whichStrata:](self, "getDailyAnchorsForDate:whichStrata:", v6, a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory newestIntervalInHistory](self, "newestIntervalInHistory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "laterDate:", v10));

        if (v17 != v16)
        {
          +[OSIntelligenceUtilities secondsSinceBecomingInactiveAtDate:](OSIntelligenceUtilities, "secondsSinceBecomingInactiveAtDate:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          -[NSMutableArray addObject:](v7, "addObject:", v18);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  return v7;
}

+ (BOOL)isValidBMStoreEventForInactivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  char v13;
  BOOL v14;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventBody"));

  if (!v5)
    goto LABEL_8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v7 = objc_opt_class(BMActivityLevel);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v10 = v9;
  if ((isKindOfClass & 1) == 0)
  {
    v12 = objc_opt_class(BMDeviceScreenLocked);
    v13 = objc_opt_isKindOfClass(v10, v12);

    if ((v13 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
      v11 = objc_msgSend(v10, "hasStarting");
      goto LABEL_7;
    }
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  v11 = objc_msgSend(v9, "hasInUseStatus");
LABEL_7:
  v14 = v11;

LABEL_9:
  return v14;
}

- (id)getHistoryStrata:(int64_t)a3 endsBefore:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", v6);
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v7 = 40;
      goto LABEL_9;
    case 2:
      v7 = 48;
      goto LABEL_9;
    case 3:
      v7 = 56;
LABEL_9:
      v10 = *(id *)((char *)&self->super.super.isa + v7);
      break;
    default:
      v8 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory log](self, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10003E014(a3, v8, v9);

LABEL_6:
      v10 = (id)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
      break;
  }
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("endDate <= %@"), v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v12));

  return v13;
}

- (id)getPastSliceTimewiseNearDate:(id)a3 whichStrata:(int64_t)a4 earlyBoundaryInSeconds:(double)a5 laterBoundaryInSeconds:(double)a6 clipIntervals:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  NSMutableArray *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  _OSActivityInterval *v25;
  void *v26;
  void *v27;
  _OSActivityInterval *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  int64_t v34;
  void *v35;
  NSMutableArray *v36;
  void *v37;
  id v38;
  _OSActivityHistory *v39;
  NSMutableArray *v40;
  NSMutableArray *obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  double v48;
  double v49;
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  int64_t v54;
  __int16 v55;
  double v56;
  __int16 v57;
  double v58;

  v7 = a7;
  v12 = a3;
  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", v12);
  v13 = objc_opt_new(NSMutableArray);
  if (a5 >= a6)
  {
    v29 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory log](self, "log"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10003E080(v29, a5, a6);

    v18 = v13;
    v40 = v18;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_OSActivityHistory getHistoryStrata:endsBefore:](self, "getHistoryStrata:endsBefore:", a4, v12));
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10000CABC;
    v46[3] = &unk_100060B20;
    v15 = v12;
    v47 = v15;
    v48 = a5;
    v49 = a6;
    v16 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v46));
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredArrayUsingPredicate:", v17));

    if (-[NSMutableArray count](v18, "count"))
    {
      v39 = self;
      if (v7)
      {
        v34 = a4;
        v35 = v17;
        v37 = v16;
        v38 = v12;
        v40 = objc_opt_new(NSMutableArray);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v36 = v18;
        obj = v18;
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v43 != v21)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities clipInterval:withTimewiseSliceDefineBy:leftBoundary:rightBoundary:](OSIntelligenceUtilities, "clipInterval:withTimewiseSliceDefineBy:leftBoundary:rightBoundary:", v23, v15, a5, a6, v34));
              v25 = [_OSActivityInterval alloc];
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endDate"));
              v28 = -[_OSActivityInterval initWithStartDate:andEndDate:andActiveStatus:](v25, "initWithStartDate:andEndDate:andActiveStatus:", v26, v27, objc_msgSend(v23, "isActive"));

              if (-[_OSIInterval isValidInterval](v28, "isValidInterval")
                && -[_OSActivityInterval hasReasonableDuration](v28, "hasReasonableDuration"))
              {
                -[NSMutableArray addObject:](v40, "addObject:", v28);
              }

            }
            v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v20);
        }

        if (-[NSMutableArray count](v40, "count"))
        {
          v16 = v37;
          v12 = v38;
          v17 = v35;
          v18 = v36;
        }
        else
        {
          v32 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory log](v39, "log"));
          v12 = v38;
          v17 = v35;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138413058;
            v52 = v15;
            v53 = 2048;
            v54 = v34;
            v55 = 2048;
            v56 = a5;
            v57 = 2048;
            v58 = a6;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "WARNING: no interval left after clipping at %@ for strata=%lu and bounds=(%.2f, %.2f)", buf, 0x2Au);
          }

          v18 = v36;
          v16 = v37;
        }
      }
      else
      {
        v40 = v18;
      }
    }
    else
    {
      v30 = v16;
      v31 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory log](self, "log"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v52 = v15;
        v53 = 2048;
        v54 = a4;
        v55 = 2048;
        v56 = a5;
        v57 = 2048;
        v58 = a6;
        _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "WARNING: vertical slice is empty for at %@ strata=%lu and bounds=(%.2f, %.2f)", buf, 0x2Au);
      }

      v40 = v18;
      v16 = v30;
    }

  }
  return v40;
}

- (id)getDailyAnchorsForDate:(id)a3 whichStrata:(int64_t)a4
{
  id v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  int v11;
  int v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  double v16;

  v6 = a3;
  v7 = objc_opt_new(NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory oldestIntervalInHistory](self, "oldestIntervalInHistory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v10 = +[OSIntelligenceUtilities datewiseDistanceBetweenDate:andDate:](OSIntelligenceUtilities, "datewiseDistanceBetweenDate:andDate:", v6, v9);

  if ((v10 & 0x80000000) == 0)
  {
    v11 = v10 + 1;
    v12 = -v10;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v6, (double)v12 * 86400.0));
      switch(a4)
      {
        case 1:
          v14 = +[OSIntelligenceUtilities pandasWeekdayOf:](OSIntelligenceUtilities, "pandasWeekdayOf:", v6);
          v15 = +[OSIntelligenceUtilities pandasWeekdayOf:](OSIntelligenceUtilities, "pandasWeekdayOf:", v13);
          break;
        case 3:
          objc_msgSend(v6, "timeIntervalSinceDate:", v13);
          if (v16 > 259200.0)
            goto LABEL_12;
LABEL_11:
          -[NSMutableArray addObject:](v7, "addObject:", v13);
          goto LABEL_12;
        case 2:
          v14 = +[OSIntelligenceUtilities isRestDay:](OSIntelligenceUtilities, "isRestDay:", v6);
          v15 = +[OSIntelligenceUtilities isRestDay:](OSIntelligenceUtilities, "isRestDay:", v13);
          break;
        default:
          goto LABEL_11;
      }
      if (v14 == v15)
        goto LABEL_11;
LABEL_12:

      --v11;
      ++v12;
    }
    while (v11 > 0);
  }

  return v7;
}

- (void)clearActivityHistory
{
  NSArray *v3;

  v3 = objc_opt_new(NSArray);
  -[_OSIntervalHistory setAllIntervalsSortByStartAsc:](self, "setAllIntervalsSortByStartAsc:", v3);

}

- (NSArray)intervalsSameDayOfWeekAsQuery
{
  return self->_intervalsSameDayOfWeekAsQuery;
}

- (void)setIntervalsSameDayOfWeekAsQuery:(id)a3
{
  objc_storeStrong((id *)&self->_intervalsSameDayOfWeekAsQuery, a3);
}

- (NSArray)intervalsSameWorkOrOffAsQuery
{
  return self->_intervalsSameWorkOrOffAsQuery;
}

- (void)setIntervalsSameWorkOrOffAsQuery:(id)a3
{
  objc_storeStrong((id *)&self->_intervalsSameWorkOrOffAsQuery, a3);
}

- (NSArray)intervalsRecentFromQuery
{
  return self->_intervalsRecentFromQuery;
}

- (void)setIntervalsRecentFromQuery:(id)a3
{
  objc_storeStrong((id *)&self->_intervalsRecentFromQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalsRecentFromQuery, 0);
  objc_storeStrong((id *)&self->_intervalsSameWorkOrOffAsQuery, 0);
  objc_storeStrong((id *)&self->_intervalsSameDayOfWeekAsQuery, 0);
}

@end
