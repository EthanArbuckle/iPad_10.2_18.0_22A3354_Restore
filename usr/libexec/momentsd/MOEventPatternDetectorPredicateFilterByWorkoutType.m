@implementation MOEventPatternDetectorPredicateFilterByWorkoutType

- (MOEventPatternDetectorPredicateFilterByWorkoutType)init
{
  MOEventPatternDetectorPredicateFilterByWorkoutType *v2;
  MOEventPatternDetectorPredicateFilterByWorkoutType *v3;
  MOEventPatternDetectorPredicateFilterByWorkoutType *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorPredicateFilterByWorkoutType;
  v2 = -[MOEventPatternDetectorPredicateFilterByWorkoutType init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)filterEvents:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  id os_log;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  void *v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu AND %K = %lu AND %K != %@"), CFSTR("category"), 2, CFSTR("provider"), 1, CFSTR("workoutType"), CFSTR("HKWorkoutActivityTypeCooldown")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v5));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v31 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found %lu workout events", buf, 0xCu);
  }

  if (objc_msgSend(v6, "count"))
  {
    v21 = v5;
    v22 = v3;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.workoutType")));
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          v13 = v4;
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("workoutType"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v12)));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v14));
          v16 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
          v28 = v16;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortedArrayUsingDescriptors:", v17));

          v4 = v13;
          -[NSMutableArray addObject:](v13, "addObject:", v18);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }
    v19 = v4;

    v5 = v21;
    v3 = v22;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end
