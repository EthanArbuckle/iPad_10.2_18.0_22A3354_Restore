@implementation MOEventPatternDetectorPredicateFilterWorkouts

- (MOEventPatternDetectorPredicateFilterWorkouts)init
{
  MOEventPatternDetectorPredicateFilterWorkouts *v2;
  MOEventPatternDetectorPredicateFilterWorkouts *v3;
  MOEventPatternDetectorPredicateFilterWorkouts *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorPredicateFilterWorkouts;
  v2 = -[MOEventPatternDetectorPredicateFilterWorkouts init](&v6, "init");
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
  void *v10;
  void *v11;
  NSMutableArray *v12;
  id v14;
  uint8_t buf[4];
  id v16;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu AND %K = %lu AND %K != %@"), CFSTR("category"), 2, CFSTR("provider"), 1, CFSTR("workoutType"), CFSTR("HKWorkoutActivityTypeCooldown")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v5));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found %lu workout events", buf, 0xCu);
  }

  v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v14 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingDescriptors:", v10));

  if (objc_msgSend(v6, "count"))
  {
    -[NSMutableArray addObject:](v4, "addObject:", v11);
    v12 = v4;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end
