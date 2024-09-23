@implementation _OSLockHistory

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E46C;
  block[3] = &unk_100060720;
  block[4] = a1;
  if (qword_1000768C0 != -1)
    dispatch_once(&qword_1000768C0, block);
  return (id)qword_1000768B8;
}

- (void)loadHistoryFromUnderlyingDataSource
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
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
  _QWORD v40[8];
  _QWORD v41[5];
  _QWORD v42[5];
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  NSMutableArray *v55;
  _QWORD v56[5];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;

  v35 = (void *)os_transaction_create("com.apple.osintelligence.lockhistory.loadHistoryFromUnderlyingDataSource");
  v4 = BiomeLibrary(v35, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "Device"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ScreenLocked"));

  v7 = objc_alloc((Class)BMPublisherOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -5184000.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v10 = objc_msgSend(v7, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v8, v9, 15000, 0, 0);

  v34 = v10;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "publisherWithOptions:", v10));
  v12 = BiomeLibrary(v38, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "Device"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "TimeZone"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publisher"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "orderedMergeWithOther:comparator:", v38, &stru_1000611E0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "filterWithIsIncluded:", &stru_100061200));
  v17 = objc_msgSend(objc_alloc((Class)BPSTuple), "initWithFirst:second:", 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scanWithInitial:nextPartialResult:", v17, &stru_100061220));

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10002EB8C;
  v56[3] = &unk_100060A40;
  v56[4] = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filterWithIsIncluded:", v56));
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_10002EBF4;
  v54 = sub_10002EC04;
  v55 = objc_opt_new(NSMutableArray);
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_10002EBF4;
  v48 = sub_10002EC04;
  v49 = objc_opt_new(NSMutableArray);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_10002EBF4;
  v42[4] = sub_10002EC04;
  v43 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filterWithIsIncluded:", &stru_100061240));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10002EC5C;
  v41[3] = &unk_100060AA8;
  v41[4] = self;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10002ECBC;
  v40[3] = &unk_100061268;
  v40[4] = self;
  v40[5] = v42;
  v40[6] = &v50;
  v40[7] = &v44;
  v21 = objc_msgSend(v20, "sinkWithCompletion:receiveInput:", v41, v40);

  -[_OSIntervalHistory setAllIntervalsSortByStartAsc:](self, "setAllIntervalsSortByStartAsc:", v51[5]);
  -[_OSLockHistory setAllUnlocks:](self, "setAllUnlocks:", v45[5]);
  v22 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory log](self, "log"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
    v24 = objc_msgSend(v23, "count");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory allUnlocks](self, "allUnlocks"));
    v26 = objc_msgSend(v25, "count");
    *(_DWORD *)buf = 134218240;
    v58 = v24;
    v59 = 2048;
    v60 = v26;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Constructed %lu lock interval(s) and %lu unlock intervals from Biome", buf, 0x16u);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[_OSIntervalHistory setLastRefreshDate:](self, "setLastRefreshDate:", v27);

  v28 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory log](self, "log"));
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory lastRefreshDate](self, "lastRefreshDate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory oldestIntervalInHistory](self, "oldestIntervalInHistory"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory newestIntervalInHistory](self, "newestIntervalInHistory"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "endDate"));
    *(_DWORD *)buf = 138412802;
    v58 = v29;
    v59 = 2112;
    v60 = v31;
    v61 = 2112;
    v62 = v33;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Reloaded from Biome at %@ with lock events ranging from %@ to %@", buf, 0x20u);

  }
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

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
  double v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory lastQueryDate](self, "lastQueryDate"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory lastQueryDate](self, "lastQueryDate"));
    if (v7 == v4)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory hourBinsOfLongestLocks](self, "hourBinsOfLongestLocks"));

      if (v17)
        goto LABEL_7;
    }
    else
    {

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v4, -864000.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory oldestIntervalInHistory](self, "oldestIntervalInHistory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "laterDate:", v10));

  objc_msgSend(v4, "timeIntervalSinceDate:", v11);
  v13 = vcvtpd_s64_f64(v12 / 86400.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities accumulativelyBinKLongestIntervals:endAfter:startBefore:longerThan:fromIntervals:](OSIntelligenceUtilities, "accumulativelyBinKLongestIntervals:endAfter:startBefore:longerThan:fromIntervals:", v13, v11, v4, v14, 7200.0));
  -[_OSLockHistory setHourBinsOfLongestLocks:](self, "setHourBinsOfLongestLocks:", v15);

  v16 = objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory log](self, "log"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v18 = 134218498;
    v19 = v13;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Updated hour bins of %ld longest locks ending after %@ & starting before date %@", (uint8_t *)&v18, 0x20u);
  }

  -[_OSIntervalHistory setLastQueryDate:](self, "setLastQueryDate:", v4);
LABEL_7:

}

- (id)getAllLockIntervalsEndingBefore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("endDate <= %@"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v5));

  return v7;
}

- (id)unlockEventsIntersectingDateRangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("((startDate <= %@) AND (endDate >= %@))"), v7, v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory allUnlocks](self, "allUnlocks"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v8));

  return v10;
}

- (BOOL)didDateTakePlaceDuringRecentLongLocks:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", v4);
  +[OSIntelligenceUtilities hourFromDate:](OSIntelligenceUtilities, "hourFromDate:", v4);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory hourBinsOfLongestLocks](self, "hourBinsOfLongestLocks"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (uint64_t)v6));
  v9 = (int)objc_msgSend(v8, "intValue") > 0;

  return v9;
}

- (id)visualizationFromLongLockHourBinsAtDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory hourBinsOfLongestLocks](self, "hourBinsOfLongestLocks"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("%02ld: "), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory hourBinsOfLongestLocks](self, "hourBinsOfLongestLocks"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));
      v10 = (uint64_t)objc_msgSend(v9, "integerValue");

      if (v10 >= 1)
      {
        do
        {
          objc_msgSend(v4, "appendString:", CFSTR("*"));
          --v10;
        }
        while (v10);
      }
      objc_msgSend(v4, "appendString:", CFSTR("\n"));
      ++v7;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory hourBinsOfLongestLocks](self, "hourBinsOfLongestLocks"));
      v12 = objc_msgSend(v11, "count");

    }
    while ((unint64_t)v12 > v7);
  }
  return v4;
}

- (BOOL)hasEnoughHistoryForInactivityPrediction
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
  v5 = objc_msgSend(v4, "count");

  if ((unint64_t)v5 < 0x40)
  {
    v10 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory oldestIntervalInHistory](self, "oldestIntervalInHistory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    objc_msgSend(v3, "timeIntervalSinceDate:", v7);
    v9 = v8;

    v10 = v9 >= 691200.0;
  }

  return v10;
}

- (id)userHistoryDiagnosis
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
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
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory oldestIntervalInHistory](self, "oldestIntervalInHistory"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory newestIntervalInHistory](self, "newestIntervalInHistory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Amount of History] min required: %d days | actual: %f days"), 8, v10 / 86400.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Number of Inactive Events] required: %d | actual: %lu"), 64, v5));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory projectedDateOfHistorySufficiency](self, "projectedDateOfHistorySufficiency"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "descriptionWithLocale:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Projection> user should reach history sufficiency by %@"), v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory visualizationFromLongLockHourBinsAtDate:](self, "visualizationFromLongLockHourBinsAtDate:", v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@\n\n%@\n\n<Oldest lock>\n%@\n<Newest lock>\n%@\nLock count: %lu (need at least %d)\n<Recent Longest Locks>\n%@"), v11, v12, v16, v6, v21, v5, 64, v18));
  return v19;
}

- (id)projectedDateOfHistorySufficiency
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[_OSIntervalHistory refreshCacheIfStaleWithQueryDate:](self, "refreshCacheIfStaleWithQueryDate:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory oldestIntervalInHistory](self, "oldestIntervalInHistory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory newestIntervalInHistory](self, "newestIntervalInHistory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v8, 691200.0));

  if ((unint64_t)v5 >= 2 && v6 && v7)
  {
    v10 = 64 - (_QWORD)v5;
    v11 = (double)(unint64_t)v5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    objc_msgSend(v12, "timeIntervalSinceDate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11 / v14));

    objc_msgSend(v15, "doubleValue");
    v17 = (double)v10 / v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v18, v17));

    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "laterDate:", v19));
  }
  else
  {
    v20 = v9;
  }

  return v20;
}

- (id)lockedIntervalsQueryWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v4));

  return v6;
}

- (id)unlockedIntervalsQueryWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory allUnlocks](self, "allUnlocks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v4));

  return v6;
}

- (void)addLockIntervalAndSortAscendingByStartDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  -[_OSLockHistory addLockIntervalsAndSortAscendingByStartDate:](self, "addLockIntervalsAndSortAscendingByStartDate:", v5, v6);
}

- (void)addLockIntervalsAndSortAscendingByStartDate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  id v28;
  _BYTE v29[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    v6 = objc_opt_new(NSMutableArray);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11);
          if (v12
            && objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11), "isValidInterval", (_QWORD)v23)&& objc_msgSend(v12, "hasReasonableDuration"))
          {
            if (objc_msgSend(v12, "isLocked"))
              v13 = v5;
            else
              v13 = v6;
            -[NSMutableArray addObject:](v13, "addObject:", v12);
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v9);
    }

    v14 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    if (-[NSMutableArray count](v5, "count"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIntervalHistory allIntervalsSortByStartAsc](self, "allIntervalsSortByStartAsc"));
      v16 = objc_msgSend(v15, "mutableCopy");

      objc_msgSend(v16, "addObjectsFromArray:", v5);
      v28 = v14;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
      objc_msgSend(v16, "sortUsingDescriptors:", v17);

      v18 = objc_msgSend(v16, "copy");
      -[_OSIntervalHistory setAllIntervalsSortByStartAsc:](self, "setAllIntervalsSortByStartAsc:", v18);

    }
    else
    {
      v16 = 0;
    }
    if (-[NSMutableArray count](v6, "count", (_QWORD)v23))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_OSLockHistory allUnlocks](self, "allUnlocks"));
      v20 = objc_msgSend(v19, "mutableCopy");

      objc_msgSend(v20, "addObjectsFromArray:", v6);
      v27 = v14;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
      objc_msgSend(v20, "sortUsingDescriptors:", v21);

      v22 = objc_msgSend(v20, "copy");
      -[_OSLockHistory setAllUnlocks:](self, "setAllUnlocks:", v22);

      v16 = v20;
    }

  }
}

- (void)clearLockAndUnlockHistory
{
  NSArray *v3;
  NSArray *v4;

  v3 = objc_opt_new(NSArray);
  -[_OSIntervalHistory setAllIntervalsSortByStartAsc:](self, "setAllIntervalsSortByStartAsc:", v3);

  v4 = objc_opt_new(NSArray);
  -[_OSLockHistory setAllUnlocks:](self, "setAllUnlocks:", v4);

}

+ (BOOL)isLockedBiomeScreenLockedEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned __int8 v10;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventBody"))) != 0
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody")),
        v8 = objc_msgSend(v7, "hasStarting"),
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
    v10 = objc_msgSend(v9, "starting");

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (NSArray)allUnlocks
{
  return self->_allUnlocks;
}

- (void)setAllUnlocks:(id)a3
{
  objc_storeStrong((id *)&self->_allUnlocks, a3);
}

- (NSArray)hourBinsOfLongestLocks
{
  return self->_hourBinsOfLongestLocks;
}

- (void)setHourBinsOfLongestLocks:(id)a3
{
  objc_storeStrong((id *)&self->_hourBinsOfLongestLocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourBinsOfLongestLocks, 0);
  objc_storeStrong((id *)&self->_allUnlocks, 0);
}

@end
