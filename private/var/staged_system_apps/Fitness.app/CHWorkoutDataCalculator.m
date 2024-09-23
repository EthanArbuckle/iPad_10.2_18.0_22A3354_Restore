@implementation CHWorkoutDataCalculator

- (CHWorkoutDataCalculator)initWithHealthStore:(id)a3 unitManager:(id)a4
{
  id v7;
  id v8;
  CHWorkoutDataCalculator *v9;
  CHWorkoutDataCalculator *v10;
  NSCache *v11;
  NSCache *cache;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHWorkoutDataCalculator;
  v9 = -[CHWorkoutDataCalculator init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v10->_unitManager, a4);
    v11 = (NSCache *)objc_alloc_init((Class)NSCache);
    cache = v10->_cache;
    v10->_cache = v11;

    -[NSCache setEvictsObjectsWithDiscardedContent:](v10->_cache, "setEvictsObjectsWithDiscardedContent:", 0);
    -[NSCache setCountLimit:](v10->_cache, "setCountLimit:", 100);
  }

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (self->_effortObserverQuery)
  {
    _HKInitializeLogging(self, a2);
    v3 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Workout Data Calculator] dealloc Stopping Workout Effort Relationship Query", buf, 2u);
    }
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_effortObserverQuery);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutDataCalculator;
  -[CHWorkoutDataCalculator dealloc](&v4, "dealloc");
}

- (id)cacheContainerForWorkout:(id)a3 workoutActivity:(id)a4
{
  void *v5;
  void *v6;
  CHWorkoutCacheContainer *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _uuidForWorkout:workoutActivity:](self, "_uuidForWorkout:workoutActivity:", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cache](self, "cache"));
  v7 = (CHWorkoutCacheContainer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  if (!v7)
  {
    v7 = objc_alloc_init(CHWorkoutCacheContainer);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cache](self, "cache"));
    objc_msgSend(v8, "setObject:forKey:", v7, v5);

  }
  return v7;
}

- (void)saveContainerToCache:(id)a3 forWorkout:(id)a4 workoutActivity:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _uuidForWorkout:workoutActivity:](self, "_uuidForWorkout:workoutActivity:", a4, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cache](self, "cache"));
  objc_msgSend(v9, "setObject:forKey:", v8, v10);

}

- (id)averageHeartRateForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "averageHeartRate"));

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _averageHeartRateQuantityFromWorkout:workoutActivity:](self, "_averageHeartRateQuantityFromWorkout:workoutActivity:", v6, v7));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit"));
      objc_msgSend(v11, "doubleValueForUnit:", v12);
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (void)heartRateDataForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, void *, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void ***v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *, void *, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(id, void *, void *, void *, _QWORD);
  id v27;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, void *, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heartRateReadings"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heartRateReadings"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recoveryHeartRateReadings"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "averageHeartRate"));
    v10[2](v10, v13, v14, v15, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_10006EDC8;
    v22 = &unk_100778758;
    v23 = v11;
    objc_copyWeak(&v27, &location);
    v16 = v8;
    v24 = v16;
    v17 = v9;
    v25 = v17;
    v26 = v10;
    v18 = objc_retainBlock(&v19);
    -[CHWorkoutDataCalculator _fetchHeartRateDataForWorkout:workoutActivity:completion:](self, "_fetchHeartRateDataForWorkout:workoutActivity:completion:", v16, v17, v18, v19, v20, v21, v22);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

}

- (id)_averageHeartRateQuantityFromWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierHeartRate));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statisticsForType:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "averageQuantity"));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "metadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", NLWorkoutMetadataKeyAverageHeartRate));
  }

  return v8;
}

- (void)_fetchHeartRateDataForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD block[4];
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  NSObject *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[5];
  id v61;

  v8 = a3;
  v9 = a4;
  v31 = a5;
  v10 = dispatch_group_create();
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierHeartRate));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _activeDateIntervalsForWorkout:workoutActivity:](self, "_activeDateIntervalsForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _averageHeartRateQuantityFromWorkout:workoutActivity:](self, "_averageHeartRateQuantityFromWorkout:workoutActivity:", v8, v9));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _predicateForActiveDateIntervals:](self, "_predicateForActiveDateIntervals:", v11));
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = sub_10006F3C4;
  v60[4] = sub_10006F3D4;
  v61 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = sub_10006F3C4;
  v58[4] = sub_10006F3D4;
  v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = sub_10006F3C4;
  v56[4] = sub_10006F3D4;
  v57 = 0;
  dispatch_group_enter(v10);
  v13 = objc_alloc((Class)HKQuantitySeriesSampleQuery);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10006F3DC;
  v47[3] = &unk_100778780;
  v47[4] = self;
  v30 = v11;
  v48 = v30;
  v53 = v58;
  v54 = v60;
  v14 = v12;
  v49 = v14;
  v55 = v56;
  v15 = v9;
  v50 = v15;
  v16 = v8;
  v51 = v16;
  v17 = v10;
  v52 = v17;
  v18 = objc_msgSend(v13, "initWithQuantityType:predicate:quantityHandler:", v33, v32, v47);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator healthStore](self, "healthStore"));
  objc_msgSend(v19, "executeQuery:", v18);

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_10006F3C4;
  v45[4] = sub_10006F3D4;
  v46 = 0;
  if (!v15
    || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "workoutActivities")),
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastObject")),
        v22 = objc_msgSend(v21, "isEqual:", v15),
        v21,
        v20,
        v22))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[_HKHeartRateRecoveryQueryUtility recoveryDateIntervalWithWorkout:](_HKHeartRateRecoveryQueryUtility, "recoveryDateIntervalWithWorkout:", v16));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[_HKHeartRateRecoveryQueryUtility predicateForWorkoutRecoveryTimeWithWorkout:](_HKHeartRateRecoveryQueryUtility, "predicateForWorkoutRecoveryTimeWithWorkout:", v16));
    dispatch_group_enter(v17);
    v25 = objc_alloc((Class)HKQuantitySeriesSampleQuery);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10006F77C;
    v40[3] = &unk_1007787A8;
    v26 = v23;
    v41 = v26;
    v43 = v45;
    v44 = v60;
    v42 = v17;
    v27 = objc_msgSend(v25, "initWithQuantityType:predicate:quantityHandler:", v33, v24, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator healthStore](self, "healthStore"));
    objc_msgSend(v28, "executeQuery:", v27);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F914;
  block[3] = &unk_1007787D0;
  v35 = v31;
  v36 = v58;
  v37 = v45;
  v38 = v56;
  v39 = v60;
  v29 = v31;
  dispatch_group_notify(v17, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);

}

- (void)distanceSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void (**v16)(id, void *, _QWORD);
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "distanceSamples"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "distanceSamples"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10006FB4C;
    v21[3] = &unk_1007787F8;
    v22 = v11;
    objc_copyWeak(&v26, &location);
    v14 = v8;
    v23 = v14;
    v15 = v9;
    v24 = v15;
    v16 = v10;
    v25 = v16;
    v17 = objc_retainBlock(v21);
    if (v15)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "distanceType"));
    }
    else
    {
      v19 = _HKWorkoutDistanceTypeForActivityType(objc_msgSend(v14, "workoutActivityType"));
      v18 = objc_claimAutoreleasedReturnValue(v19);
    }
    v20 = (void *)v18;
    if (v18)
      -[CHWorkoutDataCalculator _seriesSamplesForType:workout:workoutActivity:completion:](self, "_seriesSamplesForType:workout:workoutActivity:completion:", v18, v14, v15, v17);
    else
      v16[2](v16, 0, 0);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

- (void)totalDistanceForWorkout:(id)a3 workoutActivity:(id)a4 atDate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  void *v31;
  id v32;
  _QWORD *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  void (**v43)(id, void *, _QWORD);
  id v44;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, _QWORD))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v10, v11));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "totalDistance"));

  if (!v15)
  {
    v16 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v14, "setTotalDistance:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "totalDistance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v12));

  if (v18)
  {
    v13[2](v13, v18, 0);
  }
  else
  {
    objc_initWeak(location, self);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10006FF34;
    v38[3] = &unk_100778820;
    v39 = v14;
    v19 = v12;
    v40 = v19;
    objc_copyWeak(&v44, location);
    v32 = v10;
    v34 = v10;
    v41 = v34;
    v20 = v11;
    v42 = v20;
    v43 = v13;
    v33 = objc_retainBlock(v38);
    v21 = objc_alloc((Class)NSDateInterval);
    if (v20)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
      v23 = objc_msgSend(v21, "initWithStartDate:endDate:", v22, v19);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _activeDateIntervalsForWorkoutActivity:during:](self, "_activeDateIntervalsForWorkoutActivity:during:", v20, v23));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "workoutConfiguration"));
      v25 = _HKWorkoutDistanceTypeForActivityType(objc_msgSend(v24, "activityType"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "startDate"));
      v23 = objc_msgSend(v21, "initWithStartDate:endDate:", v27, v19);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _activeDateIntervalsForWorkout:during:](self, "_activeDateIntervalsForWorkout:during:", v34, v23));
      v28 = _HKWorkoutDistanceTypeForActivityType(objc_msgSend(v34, "workoutActivityType"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v28);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10006FFD4;
    v35[3] = &unk_100778848;
    v29 = v31;
    v36 = v29;
    v30 = v33;
    v37 = v30;
    -[CHWorkoutDataCalculator distanceSamplesForWorkout:workoutActivity:completion:](self, "distanceSamplesForWorkout:workoutActivity:completion:", v34, v20, v35);

    objc_destroyWeak(&v44);
    objc_destroyWeak(location);
    v10 = v32;
  }

}

- (void)_seriesSamplesForType:(id)a3 workout:(id)a4 workoutActivity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, void *, void *, int, void *);
  void *v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_10006F3C4;
  v30[4] = sub_10006F3D4;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_10006F3C4;
  v28[4] = sub_10006F3D4;
  v29 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _predicateForObjectsFromWorkout:withinWorkoutActivity:](self, "_predicateForObjectsFromWorkout:withinWorkoutActivity:", v11, v12));
  v15 = objc_alloc((Class)HKQuantitySeriesSampleQuery);
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_100070478;
  v23 = &unk_100778870;
  v26 = v28;
  v16 = v10;
  v24 = v16;
  v27 = v30;
  v17 = v13;
  v25 = v17;
  v18 = objc_msgSend(v15, "initWithQuantityType:predicate:quantityHandler:", v16, v14, &v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator healthStore](self, "healthStore", v20, v21, v22, v23));
  objc_msgSend(v19, "executeQuery:", v18);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

}

- (void)cadenceSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id *v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  void (**v26)(id, void *, _QWORD);
  id v27;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cadenceSamples"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cadenceSamples"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000708D8;
    v22[3] = &unk_1007787F8;
    v23 = v11;
    v20 = &v27;
    objc_copyWeak(&v27, &location);
    v14 = v8;
    v24 = v14;
    v15 = v9;
    v25 = v15;
    v26 = v10;
    v21 = objc_retainBlock(v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierStepCount));
    if (objc_msgSend(v14, "workoutActivityType") == (id)13
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "workoutConfiguration", &v27)),
          v18 = objc_msgSend(v17, "activityType"),
          v17,
          v18 == (id)13))
    {
      v19 = objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierCyclingCadence, v20));

      v16 = (void *)v19;
    }
    -[CHWorkoutDataCalculator _seriesSamplesForType:workout:workoutActivity:completion:](self, "_seriesSamplesForType:workout:workoutActivity:completion:", v16, v14, v15, v21);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

}

- (void)strokeSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  void (**v31)(id, void *, _QWORD);
  id v32;
  id location;
  void *v34;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "strokeSamples"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "strokeSamples"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100070CE0;
    v27[3] = &unk_1007787F8;
    v28 = v11;
    objc_copyWeak(&v32, &location);
    v14 = v8;
    v29 = v14;
    v15 = v9;
    v30 = v15;
    v31 = v10;
    v16 = objc_retainBlock(v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _predicateForObjectsFromWorkout:withinWorkoutActivity:](self, "_predicateForObjectsFromWorkout:withinWorkoutActivity:", v14, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierSwimmingStrokeCount));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", HKSampleSortIdentifierStartDate, 1));
    v19 = objc_alloc((Class)HKSampleQuery);
    v34 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100070D6C;
    v25[3] = &unk_100777FE0;
    v21 = v16;
    v26 = v21;
    v22 = objc_msgSend(v19, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v17, v24, 0, v20, v25);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator healthStore](self, "healthStore"));
    objc_msgSend(v23, "executeQuery:", v22);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

}

- (void)paceSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void ***v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(id, void *, _QWORD);
  id v26;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "paceSamples"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "paceSamples"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_100071014;
    v21 = &unk_1007787F8;
    v22 = v11;
    objc_copyWeak(&v26, &location);
    v14 = v8;
    v23 = v14;
    v15 = v9;
    v24 = v15;
    v25 = v10;
    v16 = objc_retainBlock(&v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierRunningSpeed, v18, v19, v20, v21));
    -[CHWorkoutDataCalculator _seriesSamplesForType:workout:workoutActivity:completion:](self, "_seriesSamplesForType:workout:workoutActivity:completion:", v17, v14, v15, v16);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

- (void)powerSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSString *v16;
  void *v17;
  id v18;
  NSString *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  void (**v27)(id, void *, _QWORD);
  id v28;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "powerSamples"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "powerSamples"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000712E0;
    v23[3] = &unk_1007787F8;
    v24 = v11;
    objc_copyWeak(&v28, &location);
    v14 = v8;
    v25 = v14;
    v15 = v9;
    v26 = v15;
    v27 = v10;
    v21 = objc_retainBlock(v23);
    v16 = HKQuantityTypeIdentifierRunningPower;
    if (objc_msgSend(v14, "workoutActivityType") == (id)13
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "workoutConfiguration")),
          v18 = objc_msgSend(v17, "activityType"),
          v17,
          v18 == (id)13))
    {
      v19 = HKQuantityTypeIdentifierCyclingPower;

      v16 = v19;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", v16, v21));
    -[CHWorkoutDataCalculator _seriesSamplesForType:workout:workoutActivity:completion:](self, "_seriesSamplesForType:workout:workoutActivity:completion:", v20, v14, v15, v22);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

}

- (void)cyclingSpeedSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  NSString *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  void (**v23)(id, void *, _QWORD);
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cyclingSpeedSamples"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cyclingSpeedSamples"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100071554;
    v19[3] = &unk_1007787F8;
    v20 = v11;
    objc_copyWeak(&v24, &location);
    v14 = v8;
    v21 = v14;
    v15 = v9;
    v22 = v15;
    v23 = v10;
    v16 = objc_retainBlock(v19);
    v17 = HKQuantityTypeIdentifierCyclingSpeed;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", v17));
    -[CHWorkoutDataCalculator _seriesSamplesForType:workout:workoutActivity:completion:](self, "_seriesSamplesForType:workout:workoutActivity:completion:", v18, v14, v15, v16);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

}

- (void)strideLengthSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void ***v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(id, void *, _QWORD);
  id v26;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "strideLengthSamples"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "strideLengthSamples"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_1000717B8;
    v21 = &unk_1007787F8;
    v22 = v11;
    objc_copyWeak(&v26, &location);
    v14 = v8;
    v23 = v14;
    v15 = v9;
    v24 = v15;
    v25 = v10;
    v16 = objc_retainBlock(&v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierRunningStrideLength, v18, v19, v20, v21));
    -[CHWorkoutDataCalculator _seriesSamplesForType:workout:workoutActivity:completion:](self, "_seriesSamplesForType:workout:workoutActivity:completion:", v17, v14, v15, v16);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

- (void)verticalOscillationSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void ***v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(id, void *, _QWORD);
  id v26;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "verticalOscillationSamples"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "verticalOscillationSamples"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_100071A1C;
    v21 = &unk_1007787F8;
    v22 = v11;
    objc_copyWeak(&v26, &location);
    v14 = v8;
    v23 = v14;
    v15 = v9;
    v24 = v15;
    v25 = v10;
    v16 = objc_retainBlock(&v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierRunningVerticalOscillation, v18, v19, v20, v21));
    -[CHWorkoutDataCalculator _seriesSamplesForType:workout:workoutActivity:completion:](self, "_seriesSamplesForType:workout:workoutActivity:completion:", v17, v14, v15, v16);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

- (void)groundContactTimeSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void ***v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(id, void *, _QWORD);
  id v26;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groundContactTimeSamples"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groundContactTimeSamples"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_100071C80;
    v21 = &unk_1007787F8;
    v22 = v11;
    objc_copyWeak(&v26, &location);
    v14 = v8;
    v23 = v14;
    v15 = v9;
    v24 = v15;
    v25 = v10;
    v16 = objc_retainBlock(&v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierRunningGroundContactTime, v18, v19, v20, v21));
    -[CHWorkoutDataCalculator _seriesSamplesForType:workout:workoutActivity:completion:](self, "_seriesSamplesForType:workout:workoutActivity:completion:", v17, v14, v15, v16);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

- (void)splitsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  id v23;
  _QWORD *v24;
  void *v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  void (**v35)(id, void *, _QWORD);
  id v36;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator unitManager](self, "unitManager"));
  if (v9)
    v12 = v9;
  else
    v12 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fiui_activityType"));
  v14 = objc_msgSend(v11, "userDistanceHKUnitForDistanceType:", FIUIDistanceTypeForActivityType(v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "splits"));
  if (v17
    && (v18 = (void *)v17,
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userPreferredDistanceUnit")),
        v20 = objc_msgSend(v19, "isEqual:", v15),
        v19,
        v18,
        v20))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "splits"));
    v10[2](v10, v21, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100071FA0;
    v31[3] = &unk_1007787F8;
    v32 = v16;
    objc_copyWeak(&v36, &location);
    v22 = v8;
    v33 = v22;
    v23 = v9;
    v34 = v23;
    v35 = v10;
    v24 = objc_retainBlock(v31);
    if (v9)
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "fiui_splitsForUserPreferredDistanceUnit:", v15));
    else
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fiui_workoutSplitsForUserPreferredDistanceUnit:", v15));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10007202C;
    v28[3] = &unk_1007788D8;
    v29 = v25;
    v30 = v24;
    v26 = v25;
    v27 = v24;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v28);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

}

- (void)customSplitsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  void (**v27)(id, void *, _QWORD);
  id v28;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "customSplits"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "customSplits"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100072258;
    v23[3] = &unk_1007787F8;
    v24 = v11;
    objc_copyWeak(&v28, &location);
    v14 = v8;
    v25 = v14;
    v15 = v9;
    v26 = v15;
    v27 = v10;
    v16 = objc_retainBlock(v23);
    if (v15)
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fiui_customSplits"));
    else
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fiui_workoutCustomSplits"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000722E4;
    v20[3] = &unk_1007788D8;
    v21 = v17;
    v22 = v16;
    v18 = v17;
    v19 = v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

}

- (void)segmentsForWorkout:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  void (**v26)(id, void *, _QWORD);
  id v27;
  id location[2];

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v6, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "segments"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "segments"));
    v7[2](v7, v10, 0);

  }
  else
  {
    objc_initWeak(location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100072590;
    v23[3] = &unk_100778900;
    v24 = v8;
    objc_copyWeak(&v27, location);
    v11 = v6;
    v25 = v11;
    v26 = v7;
    v12 = objc_retainBlock(v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "workoutEvents"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100778920));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v14));

    if (-[CHWorkoutDataCalculator shouldUseFakeSegmentMarkers](self, "shouldUseFakeSegmentMarkers"))
    {
      v16 = objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _testMarkersForWorkout:](self, "_testMarkersForWorkout:", v11));

      v15 = (void *)v16;
    }
    if (objc_msgSend(v15, "count"))
    {
      global_queue = dispatch_get_global_queue(25, 0);
      v18 = objc_claimAutoreleasedReturnValue(global_queue);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100072694;
      v19[3] = &unk_100778948;
      v19[4] = self;
      v20 = v11;
      v21 = v15;
      v22 = v12;
      dispatch_async(v18, v19);

    }
    else
    {
      ((void (*)(_QWORD *, void *, _QWORD))v12[2])(v12, &__NSArray0__struct, 0);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(location);
  }

}

- (void)downhillRunsForWorkout:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void (**v22)(id, void *, _QWORD);
  id v23;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v6, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downhillRuns"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downhillRuns"));
    v7[2](v7, v10, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100072940;
    v19[3] = &unk_100778900;
    v20 = v8;
    objc_copyWeak(&v23, &location);
    v11 = v6;
    v21 = v11;
    v22 = v7;
    v12 = objc_retainBlock(v19);
    global_queue = dispatch_get_global_queue(25, 0);
    v14 = objc_claimAutoreleasedReturnValue(global_queue);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000729B4;
    v16[3] = &unk_100778680;
    v16[4] = self;
    v17 = v11;
    v18 = v12;
    v15 = v12;
    dispatch_async(v14, v16);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

}

- (void)intervalsForWorkout:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void (**v22)(id, void *, _QWORD);
  id v23;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v6, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "intervals"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "intervals"));
    v7[2](v7, v10, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100072C60;
    v19[3] = &unk_100778900;
    v20 = v8;
    objc_copyWeak(&v23, &location);
    v11 = v6;
    v21 = v11;
    v22 = v7;
    v12 = objc_retainBlock(v19);
    global_queue = dispatch_get_global_queue(25, 0);
    v14 = objc_claimAutoreleasedReturnValue(global_queue);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100072CD4;
    v16[3] = &unk_100778680;
    v16[4] = self;
    v17 = v11;
    v18 = v12;
    v15 = v12;
    dispatch_async(v14, v16);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

}

- (void)trackLapsForWorkout:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  void (**v26)(id, void *, _QWORD);
  id v27;
  id location[2];

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v6, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trackLaps"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trackLaps"));
    v7[2](v7, v10, 0);

  }
  else
  {
    objc_initWeak(location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10007307C;
    v23[3] = &unk_100778900;
    v24 = v8;
    objc_copyWeak(&v27, location);
    v11 = v6;
    v25 = v11;
    v26 = v7;
    v12 = objc_retainBlock(v23);
    if ((objc_msgSend(v11, "supportsTrackWorkout") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "workoutEvents"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100778968));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v14));

      if (-[CHWorkoutDataCalculator shouldUseFakeSegmentMarkers](self, "shouldUseFakeSegmentMarkers"))
      {
        v16 = objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _testTrackLapsForWorkout:](self, "_testTrackLapsForWorkout:", v11));

        v15 = (void *)v16;
      }
      if (objc_msgSend(v15, "count"))
      {
        global_queue = dispatch_get_global_queue(25, 0);
        v18 = objc_claimAutoreleasedReturnValue(global_queue);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100073110;
        v19[3] = &unk_100778948;
        v19[4] = self;
        v20 = v11;
        v21 = v15;
        v22 = v12;
        dispatch_async(v18, v19);

      }
      else
      {
        ((void (*)(_QWORD *, void *, _QWORD))v12[2])(v12, &__NSArray0__struct, 0);
      }

    }
    else
    {
      ((void (*)(_QWORD *, void *, _QWORD))v12[2])(v12, &__NSArray0__struct, 0);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(location);
  }

}

- (void)swimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  void (**v28)(id, void *, _QWORD);
  id v29;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "swimDistanceByStrokeStyle"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "swimDistanceByStrokeStyle"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000733F8;
    v24[3] = &unk_100778990;
    v25 = v11;
    objc_copyWeak(&v29, location);
    v14 = v8;
    v26 = v14;
    v15 = v9;
    v27 = v15;
    v28 = v10;
    v16 = objc_retainBlock(v24);
    global_queue = dispatch_get_global_queue(25, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100073484;
    block[3] = &unk_100778948;
    block[4] = self;
    v21 = v14;
    v22 = v15;
    v23 = v16;
    v19 = v16;
    dispatch_async(v18, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(location);
  }

}

- (void)openWaterSwimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  void (**v28)(id, void *, _QWORD);
  id v29;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "swimDistanceByStrokeStyle"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "swimDistanceByStrokeStyle"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10007376C;
    v24[3] = &unk_100778990;
    v25 = v11;
    objc_copyWeak(&v29, location);
    v14 = v8;
    v26 = v14;
    v15 = v9;
    v27 = v15;
    v28 = v10;
    v16 = objc_retainBlock(v24);
    global_queue = dispatch_get_global_queue(25, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000737F8;
    block[3] = &unk_100778948;
    block[4] = self;
    v21 = v14;
    v22 = v15;
    v23 = v16;
    v19 = v16;
    dispatch_async(v18, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(location);
  }

}

- (void)swimmingSetsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  void (**v28)(id, void *, _QWORD);
  id v29;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "swimmingSets"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "swimmingSets"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100073AE0;
    v24[3] = &unk_1007787F8;
    v25 = v11;
    objc_copyWeak(&v29, location);
    v14 = v8;
    v26 = v14;
    v15 = v9;
    v27 = v15;
    v28 = v10;
    v16 = objc_retainBlock(v24);
    global_queue = dispatch_get_global_queue(25, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100073B6C;
    block[3] = &unk_100778948;
    block[4] = self;
    v21 = v14;
    v22 = v15;
    v23 = v16;
    v19 = v16;
    dispatch_async(v18, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(location);
  }

}

- (void)swimmingSplitsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  void (**v28)(id, void *, _QWORD);
  id v29;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "swimmingSplits"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "swimmingSplits"));
    v10[2](v10, v13, 0);

  }
  else
  {
    objc_initWeak(location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100073E54;
    v24[3] = &unk_100778990;
    v25 = v11;
    objc_copyWeak(&v29, location);
    v14 = v8;
    v26 = v14;
    v15 = v9;
    v27 = v15;
    v28 = v10;
    v16 = objc_retainBlock(v24);
    global_queue = dispatch_get_global_queue(25, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100073EE0;
    block[3] = &unk_100778948;
    block[4] = self;
    v21 = v14;
    v22 = v15;
    v23 = v16;
    v19 = v16;
    dispatch_async(v18, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(location);
  }

}

- (void)effortForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id inited;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  HKWorkoutEffortRelationshipQuery *v17;
  HKWorkoutEffortRelationshipQuery *effortObserverQuery;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD *v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  void (**v43)(id, void *);
  id v44;
  _QWORD v45[4];
  id v46;
  id location;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[WOEffortBridges demoExertionForWorkout:](WOEffortBridges, "demoExertionForWorkout:", v8));
  if (v11)
  {
    v10[2](v10, v11);
  }
  else
  {
    inited = objc_initWeak(&location, self);
    if (!self->_effortObserverQuery)
    {
      _HKInitializeLogging(inited, v13);
      v14 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Workout Data Calculator] Kicking off Workout Effort Relationship Query", buf, 2u);
      }
      v15 = objc_alloc((Class)HKWorkoutEffortRelationshipQuery);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[HKQueryAnchor latestAnchor](HKQueryAnchor, "latestAnchor"));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000744C8;
      v45[3] = &unk_1007789E0;
      objc_copyWeak(&v46, &location);
      v17 = (HKWorkoutEffortRelationshipQuery *)objc_msgSend(v15, "initWithPredicate:anchor:options:resultsHandler:", 0, v16, 0, v45);
      effortObserverQuery = self->_effortObserverQuery;
      self->_effortObserverQuery = v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator healthStore](self, "healthStore"));
      objc_msgSend(v19, "executeQuery:", self->_effortObserverQuery);

      objc_destroyWeak(&v46);
    }
    if (v9
      && (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workoutConfiguration")),
          v21 = objc_msgSend(v20, "activityType") == (id)83,
          v20,
          v21))
    {
      v10[2](v10, 0);
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v8, v9));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "effortSampleCollection"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "preferredQuantity"));

      if (v23)
      {
        _HKInitializeLogging(v24, v25);
        v26 = HKLogWorkouts;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
          *(_DWORD *)buf = 138412802;
          v49 = v27;
          v50 = 2112;
          v51 = v28;
          v52 = 2112;
          v53 = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Effort cache hit for %@ (%@) with quantity %@", buf, 0x20u);

        }
        v10[2](v10, v23);
      }
      else
      {
        _HKInitializeLogging(v24, v25);
        v29 = HKLogWorkouts;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
          *(_DWORD *)buf = 138412546;
          v49 = v30;
          v50 = 2112;
          v51 = v31;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Effort cache miss for %@ (%@), fetching from database.", buf, 0x16u);

        }
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1000746E8;
        v40[3] = &unk_100778A08;
        objc_copyWeak(&v44, &location);
        v32 = v8;
        v41 = v32;
        v33 = v9;
        v42 = v33;
        v43 = v10;
        v34 = objc_retainBlock(v40);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator healthStore](self, "healthStore"));
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_1000747B4;
        v38[3] = &unk_100778A30;
        v36 = v34;
        v39 = v36;
        +[WOEffortBridges fetchExertionForWorkout:workoutActivity:healthStore:completion:](WOEffortBridges, "fetchExertionForWorkout:workoutActivity:healthStore:completion:", v32, v33, v35, v38);

        objc_destroyWeak(&v44);
      }

    }
    objc_destroyWeak(&location);
  }

}

- (void)_handleUpdatedRelationships:(id)a3 withAnchor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CHEffortSampleCollection *v17;
  void *v18;
  CHEffortSampleCollection *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  const __CFString *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _BYTE v41[128];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator lastEffortAnchor](self, "lastEffortAnchor"));
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    v29 = v7;
    -[CHWorkoutDataCalculator setLastEffortAnchor:](self, "setLastEffortAnchor:", v7);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v30 = v6;
    obj = v6;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v10)
    {
      v11 = v10;
      v32 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v32)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "workout"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activity"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v14, v15));

          v17 = [CHEffortSampleCollection alloc];
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "samples"));
          v19 = -[CHEffortSampleCollection initWithSamples:](v17, "initWithSamples:", v18);

          objc_msgSend(v16, "setEffortSampleCollection:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "workout"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activity"));
          -[CHWorkoutDataCalculator saveContainerToCache:forWorkout:workoutActivity:](self, "saveContainerToCache:forWorkout:workoutActivity:", v16, v20, v21);

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activity"));
          if (v22)
          {
            v39[0] = CFSTR("WorkoutUUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "workout"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUID"));
            v39[1] = CFSTR("ActivityUUID");
            v40[0] = v24;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activity"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUID"));
            v40[1] = v26;
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 2));

          }
          else
          {
            v37 = CFSTR("WorkoutUUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "workout"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUID"));
            v38 = v24;
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
          }

          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("CHEffortChangedNotification"), 0, v27);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v11);
    }

    v7 = v29;
    v6 = v30;
  }

}

- (id)cachedDownhillRunsForWorkout:(id)a3 workoutActivity:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downhillRuns"));

  return v5;
}

- (id)cachedEffortForWorkout:(id)a3 workoutActivity:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "effortSampleCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredQuantity"));

  return v6;
}

- (id)cachedEffortSampleCollectionForWorkout:(id)a3 workoutActivity:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "effortSampleCollection"));

  return v5;
}

- (void)averageHeartRateForWorkout:(id)a3 during:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void ***v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v15;
  CHWorkoutDataCalculator *v16;
  id v17;
  id v18;
  id v19;

  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100074D38;
  v15 = &unk_100778A58;
  v16 = self;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v8 = v19;
  v9 = v18;
  v10 = v17;
  v11 = objc_retainBlock(&v12);
  -[CHWorkoutDataCalculator heartRateDataForWorkout:workoutActivity:completion:](self, "heartRateDataForWorkout:workoutActivity:completion:", v10, 0, v11, v12, v13, v14, v15, v16);

}

- (void)averageCadenceForWorkout:(id)a3 during:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  CHWorkoutDataCalculator *v11;
  id v12;
  id v13;
  id v14;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100075104;
  v10[3] = &unk_100778A80;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v7 = v14;
  v8 = v13;
  v9 = v12;
  -[CHWorkoutDataCalculator cadenceSamplesForWorkout:workoutActivity:completion:](v11, "cadenceSamplesForWorkout:workoutActivity:completion:", v9, 0, v10);

}

- (void)averagePowerForWorkout:(id)a3 during:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  CHWorkoutDataCalculator *v11;
  id v12;
  id v13;
  id v14;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100075544;
  v10[3] = &unk_100778A80;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v7 = v14;
  v8 = v13;
  v9 = v12;
  -[CHWorkoutDataCalculator powerSamplesForWorkout:workoutActivity:completion:](v11, "powerSamplesForWorkout:workoutActivity:completion:", v9, 0, v10);

}

- (void)swimmingPacePerHundredForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100075890;
  v9[3] = &unk_100778AA8;
  v10 = a5;
  v8 = v10;
  -[CHWorkoutDataCalculator swimmingSplitsForWorkout:workoutActivity:completion:](self, "swimmingSplitsForWorkout:workoutActivity:completion:", a3, a4, v9);

}

- (id)_queue_intervalsForWorkout:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  CHWorkoutInterval *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  id v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *k;
  void *v37;
  double v38;
  double v39;
  void *v40;
  BOOL v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *m;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  unsigned int v55;
  unsigned int v56;
  id v57;
  void *n;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  dispatch_time_t v70;
  id v71;
  void *v72;
  id *v74;
  id v75;
  id v76;
  id v77;
  BOOL v78;
  uint64_t v79;
  id obj;
  id obja;
  NSObject *objb;
  void *v84;
  _QWORD v85[5];
  NSObject *v86;
  uint64_t *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  CHWorkoutDataCalculator *v96;
  NSObject *v97;
  uint64_t *v98;
  BOOL v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[4];
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD v124[2];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];

  v5 = a3;
  if (objc_msgSend(v5, "isIntervalWorkout"))
  {
    v74 = a4;
    v6 = objc_alloc_init((Class)NSMutableArray);
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v84 = v5;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workoutActivities"));
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v121;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v121 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)i);
          v11 = objc_alloc_init(CHWorkoutInterval);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
          -[CHWorkoutSegment setStartDate:](v11, "setStartDate:", v12);

          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
          -[CHWorkoutSegment setEndDate:](v11, "setEndDate:", v13);

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[HKWorkout kIntervalWorkoutStepMetadataKey](HKWorkout, "kIntervalWorkoutStepMetadataKey"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));
          -[CHWorkoutInterval setStepKeyPath:](v11, "setStepKeyPath:", v16);

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[HKWorkout kIntervalWorkoutStepSuccessful](HKWorkout, "kIntervalWorkoutStepSuccessful"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));
          -[CHWorkoutInterval setWasSuccessful:](v11, "setWasSuccessful:", objc_msgSend(v19, "BOOLValue"));

          objc_msgSend(v6, "addObject:", v11);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
      }
      while (v7);
    }

    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472;
    v118[2] = sub_1000764D8;
    v118[3] = &unk_100778AD0;
    v76 = objc_alloc_init((Class)NSMutableArray);
    v119 = v76;
    objc_msgSend(v84, "_enumerateActiveTimePeriods:", v118);
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v77 = v6;
    v20 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v114, v128, 16);
    if (v20)
    {
      obja = *(id *)v115;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(id *)v115 != obja)
            objc_enumerationMutation(v77);
          v22 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)j);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stepKeyPath"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "expectedIntervalDurationForStepKeyPath:", v23));

          v25 = objc_msgSend(v22, "wasSuccessful");
          if (v24)
            v26 = v25;
          else
            v26 = 0;
          if (v26 == 1)
          {
            v27 = (id)objc_claimAutoreleasedReturnValue(+[HKUnit secondUnit](HKUnit, "secondUnit"));
            objc_msgSend(v24, "doubleValueForUnit:", v27);
            v29 = v28;
          }
          else
          {
            v30 = objc_alloc((Class)NSDateInterval);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "endDate"));
            v27 = objc_msgSend(v30, "initWithStartDate:endDate:", v31, v32);

            v112 = 0u;
            v113 = 0u;
            v110 = 0u;
            v111 = 0u;
            v33 = v76;
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v110, v127, 16);
            if (v34)
            {
              v35 = *(_QWORD *)v111;
              v29 = 0.0;
              do
              {
                for (k = 0; k != v34; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v111 != v35)
                    objc_enumerationMutation(v33);
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "intersectionWithDateInterval:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)k)));
                  objc_msgSend(v37, "duration");
                  v39 = v38;

                  v29 = v29 + v39;
                }
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v110, v127, 16);
              }
              while (v34);
            }
            else
            {
              v29 = 0.0;
            }

          }
          objc_msgSend(v22, "setElapsedTime:", v29);

        }
        v20 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v114, v128, 16);
      }
      while (v20);
    }

    objb = dispatch_group_create();
    v104 = 0;
    v105 = &v104;
    v106 = 0x3032000000;
    v107 = sub_10006F3C4;
    v108 = sub_10006F3D4;
    v109 = 0;
    v40 = v84;
    v41 = objc_msgSend(v84, "workoutActivityType") == (id)46 && objc_msgSend(v84, "fiui_swimmingLocationType") == (id)1;
    if (-[CHWorkoutDataCalculator _workoutSupportsDistanceAndPace:](self, "_workoutSupportsDistanceAndPace:", v84))
    {
      v78 = v41;
      dispatch_group_enter(objb);
      v43 = objc_alloc_init((Class)NSMutableArray);
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v44 = v77;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v100, v126, 16);
      if (v45)
      {
        v46 = *(_QWORD *)v101;
        do
        {
          for (m = 0; m != v45; m = (char *)m + 1)
          {
            if (*(_QWORD *)v101 != v46)
              objc_enumerationMutation(v44);
            v48 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)m);
            v49 = objc_alloc((Class)NSDateInterval);
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "startDate"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "endDate"));
            v52 = objc_msgSend(v49, "initWithStartDate:endDate:", v50, v51);
            objc_msgSend(v43, "addObject:", v52);

            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stepKeyPath"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "expectedIntervalDistanceForStepKeyPath:", v53));

            v55 = objc_msgSend(v48, "wasSuccessful");
            if (v54)
              v56 = v55;
            else
              v56 = 0;
            if (v56 == 1)
              objc_msgSend(v48, "setDistance:", v54);

          }
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v100, v126, 16);
        }
        while (v45);
      }

      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_100076550;
      v92[3] = &unk_100778B20;
      v98 = &v104;
      v75 = v43;
      v93 = v75;
      v94 = v44;
      v99 = v78;
      v95 = v84;
      v96 = self;
      v97 = objb;
      -[CHWorkoutDataCalculator distanceSamplesForWorkout:workoutActivity:completion:](self, "distanceSamplesForWorkout:workoutActivity:completion:", v95, 0, v92);

    }
    else
    {
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v75 = v77;
      v57 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v88, v125, 16);
      if (v57)
      {
        v79 = *(_QWORD *)v89;
        do
        {
          for (n = 0; n != v57; n = (char *)n + 1)
          {
            if (*(_QWORD *)v89 != v79)
              objc_enumerationMutation(v75);
            v59 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)n);
            dispatch_group_enter(objb);
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsFromWorkout:](HKQuery, "predicateForObjectsFromWorkout:", v40));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "startDate"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "endDate"));
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v61, v62, 1));

            v124[0] = v60;
            v124[1] = v63;
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v124, 2));
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v64));

            v66 = objc_alloc((Class)HKStatisticsQuery);
            v67 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierActiveEnergyBurned));
            v85[0] = _NSConcreteStackBlock;
            v85[1] = 3221225472;
            v85[2] = sub_1000768A0;
            v85[3] = &unk_100778B48;
            v85[4] = v59;
            v87 = &v104;
            v86 = objb;
            v68 = objc_msgSend(v66, "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", v67, v65, 16, v85);

            v69 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator healthStore](self, "healthStore"));
            objc_msgSend(v69, "executeQuery:", v68);

            v40 = v84;
          }
          v57 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v88, v125, 16);
        }
        while (v57);
      }
    }

    v70 = dispatch_time(0, 20000000000);
    dispatch_group_wait(objb, v70);
    v71 = (id)v105[5];
    v72 = v71;
    if (v71)
    {
      if (v74)
        *v74 = objc_retainAutorelease(v71);
      else
        _HKLogDroppedError(v71);
    }

    v42 = v77;
    _Block_object_dispose(&v104, 8);

    v5 = v84;
  }
  else
  {
    v42 = &__NSArray0__struct;
  }

  return v42;
}

- (id)_queue_segmentsForWorkout:(id)a3 markerEvents:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  CHWorkoutSegment *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *j;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  double v38;
  void *k;
  void *v40;
  double v41;
  double v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *m;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *n;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  dispatch_time_t v66;
  id v67;
  void *v68;
  id *v70;
  CHWorkoutSegment *v71;
  id v72;
  id v73;
  uint64_t v74;
  id v76;
  dispatch_group_t group;
  dispatch_group_t groupa;
  NSObject *groupb;
  id v80;
  id obj;
  void *v82;
  _QWORD v83[5];
  NSObject *v84;
  uint64_t *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
  id v92;
  NSObject *v93;
  uint64_t *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[4];
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[2];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];

  v70 = a5;
  v6 = a3;
  v7 = a4;
  v80 = objc_alloc_init((Class)NSMutableArray);
  v82 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v124, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v116;
    group = (dispatch_group_t)FIUIPrivateMetadataKeySegmentDistance;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v116 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateInterval", v70));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
        objc_msgSend(v14, "timeIntervalSinceDate:", v8);
        v16 = v15;

        if (fabs(round(v16)) >= 2.22044605e-16)
        {
          v17 = objc_alloc_init(CHWorkoutSegment);
          -[CHWorkoutSegment setStartDate:](v17, "setStartDate:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateInterval"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
          -[CHWorkoutSegment setEndDate:](v17, "setEndDate:", v19);

          objc_msgSend(v80, "addObject:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateInterval"));
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));

          if (objc_msgSend(v82, "isTrackWorkout"))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadata"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", group));

            if (v23)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
              objc_msgSend(v23, "doubleValue");
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v24));
              -[CHWorkoutSegment setDistance:](v17, "setDistance:", v25);

            }
          }

          v8 = (void *)v21;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v124, 16);
    }
    while (v9);
  }

  v71 = objc_alloc_init(CHWorkoutSegment);
  -[CHWorkoutSegment setStartDate:](v71, "setStartDate:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "endDate"));
  -[CHWorkoutSegment setEndDate:](v71, "setEndDate:", v26);

  objc_msgSend(v80, "addObject:", v71);
  if ((unint64_t)objc_msgSend(v80, "count") >= 2)
  {
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_1000772F4;
    v113[3] = &unk_100778AD0;
    v76 = objc_alloc_init((Class)NSMutableArray);
    v114 = v76;
    objc_msgSend(v82, "_enumerateActiveTimePeriods:", v113);
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v73 = v80;
    v28 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
    if (v28)
    {
      groupa = *(dispatch_group_t *)v110;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(dispatch_group_t *)v110 != groupa)
            objc_enumerationMutation(v73);
          v30 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)j);
          v31 = objc_alloc((Class)NSDateInterval);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "endDate"));
          v34 = objc_msgSend(v31, "initWithStartDate:endDate:", v32, v33);

          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v35 = v76;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v105, v122, 16);
          if (v36)
          {
            v37 = *(_QWORD *)v106;
            v38 = 0.0;
            do
            {
              for (k = 0; k != v36; k = (char *)k + 1)
              {
                if (*(_QWORD *)v106 != v37)
                  objc_enumerationMutation(v35);
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "intersectionWithDateInterval:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)k), v70));
                objc_msgSend(v40, "duration");
                v42 = v41;

                v38 = v38 + v42;
              }
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v105, v122, 16);
            }
            while (v36);
          }
          else
          {
            v38 = 0.0;
          }

          objc_msgSend(v30, "setElapsedTime:", v38);
        }
        v28 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
      }
      while (v28);
    }

    groupb = dispatch_group_create();
    v99 = 0;
    v100 = &v99;
    v101 = 0x3032000000;
    v102 = sub_10006F3C4;
    v103 = sub_10006F3D4;
    v104 = 0;
    if (-[CHWorkoutDataCalculator _workoutSupportsDistanceAndPace:](self, "_workoutSupportsDistanceAndPace:", v82))
    {
      dispatch_group_enter(groupb);
      v43 = objc_alloc_init((Class)NSMutableArray);
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v44 = v73;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v95, v121, 16);
      if (v45)
      {
        v46 = *(_QWORD *)v96;
        do
        {
          for (m = 0; m != v45; m = (char *)m + 1)
          {
            if (*(_QWORD *)v96 != v46)
              objc_enumerationMutation(v44);
            v48 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)m);
            v49 = objc_alloc((Class)NSDateInterval);
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "startDate"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "endDate"));
            v52 = objc_msgSend(v49, "initWithStartDate:endDate:", v50, v51);
            objc_msgSend(v43, "addObject:", v52);

          }
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v95, v121, 16);
        }
        while (v45);
      }

      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10007736C;
      v90[3] = &unk_100778B98;
      v94 = &v99;
      v72 = v43;
      v91 = v72;
      v92 = v44;
      v93 = groupb;
      -[CHWorkoutDataCalculator distanceSamplesForWorkout:workoutActivity:completion:](self, "distanceSamplesForWorkout:workoutActivity:completion:", v82, 0, v90);

    }
    else
    {
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v72 = v73;
      v53 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v120, 16);
      if (v53)
      {
        v74 = *(_QWORD *)v87;
        do
        {
          for (n = 0; n != v53; n = (char *)n + 1)
          {
            if (*(_QWORD *)v87 != v74)
              objc_enumerationMutation(v72);
            v55 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)n);
            dispatch_group_enter(groupb);
            v56 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsFromWorkout:](HKQuery, "predicateForObjectsFromWorkout:", v82));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "startDate"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "endDate"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v57, v58, 1));

            v119[0] = v56;
            v119[1] = v59;
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v119, 2));
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v60));

            v62 = objc_alloc((Class)HKStatisticsQuery);
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierActiveEnergyBurned));
            v83[0] = _NSConcreteStackBlock;
            v83[1] = 3221225472;
            v83[2] = sub_1000774AC;
            v83[3] = &unk_100778B48;
            v83[4] = v55;
            v85 = &v99;
            v84 = groupb;
            v64 = objc_msgSend(v62, "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", v63, v61, 16, v83);

            v65 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator healthStore](self, "healthStore"));
            objc_msgSend(v65, "executeQuery:", v64);

          }
          v53 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v120, 16);
        }
        while (v53);
      }
    }

    v66 = dispatch_time(0, 20000000000);
    dispatch_group_wait(groupb, v66);
    v67 = (id)v100[5];
    v68 = v67;
    if (v67)
    {
      if (v70)
        *v70 = objc_retainAutorelease(v67);
      else
        _HKLogDroppedError(v67);
    }

    v27 = v73;
    _Block_object_dispose(&v99, 8);

  }
  else
  {
    v27 = &__NSArray0__struct;
  }

  return v27;
}

- (id)_queue_downhillRunsForWorkout:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  HKHealthStore *healthStore;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v7 = dispatch_group_create();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10006F3C4;
  v29 = sub_10006F3D4;
  v30 = 0;
  dispatch_group_enter(v7);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10006F3C4;
  v23 = sub_10006F3D4;
  v24 = 0;
  healthStore = self->_healthStore;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000776DC;
  v15[3] = &unk_100778BC0;
  v17 = &v19;
  v18 = &v25;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v6, "makeDownhillRunBridgesWithHealthStore:completion:", healthStore, v15);
  v10 = dispatch_time(0, 20000000000);
  dispatch_group_wait(v9, v10);
  v11 = (id)v20[5];
  v12 = v11;
  if (v11)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError(v11);
  }

  v13 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

- (id)_queue_trackLapsForWorkout:(id)a3 lapEvents:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  CHWorkoutTrackLap *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  double v23;
  void *j;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  id v29;
  id v30;
  void *k;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  dispatch_time_t v43;
  id v44;
  void *v45;
  id v46;
  id v49;
  id v50;
  id obj;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  _QWORD v57[5];
  NSObject *v58;
  uint64_t *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  id v66;
  NSObject *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[2];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];

  v6 = a3;
  v7 = a4;
  v56 = objc_alloc_init((Class)NSMutableArray);
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100077E04;
  v83[3] = &unk_100778AD0;
  v50 = objc_alloc_init((Class)NSMutableArray);
  v84 = v50;
  v53 = v6;
  objc_msgSend(v6, "_enumerateActiveTimePeriods:", v83);
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
  if (v8)
  {
    v54 = *(_QWORD *)v80;
    v9 = FIPrivateMetadataKeyLapDuration;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v80 != v54)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
        v12 = -[CHWorkoutTrackLap initWithWorkoutEvent:]([CHWorkoutTrackLap alloc], "initWithWorkoutEvent:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));
        v15 = objc_msgSend(v14, "containsObject:", v9);

        if ((v15 & 1) == 0)
        {
          v16 = objc_alloc((Class)NSDateInterval);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment startDate](v12, "startDate"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment endDate](v12, "endDate"));
          v19 = objc_msgSend(v16, "initWithStartDate:endDate:", v17, v18);

          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v20 = v50;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v76;
            v23 = 0.0;
            do
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(_QWORD *)v76 != v22)
                  objc_enumerationMutation(v20);
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "intersectionWithDateInterval:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j)));
                objc_msgSend(v25, "duration");
                v27 = v26;

                v23 = v23 + v27;
              }
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
            }
            while (v21);
          }
          else
          {
            v23 = 0.0;
          }

          -[CHWorkoutSegment setElapsedTime:](v12, "setElapsedTime:", v23);
        }
        objc_msgSend(v56, "addObject:", v12);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    }
    while (v8);
  }

  v28 = dispatch_group_create();
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = sub_10006F3C4;
  v73 = sub_10006F3D4;
  v74 = 0;
  if (-[CHWorkoutDataCalculator _workoutSupportsDistanceAndPace:](self, "_workoutSupportsDistanceAndPace:", v53))
  {
    dispatch_group_enter(v28);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100077E7C;
    v64[3] = &unk_100778B98;
    v68 = &v69;
    v65 = v56;
    v66 = obj;
    v67 = v28;
    -[CHWorkoutDataCalculator distanceSamplesForWorkout:workoutActivity:completion:](self, "distanceSamplesForWorkout:workoutActivity:completion:", v53, 0, v64);

    v29 = v65;
  }
  else
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v29 = v56;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v86, 16);
    if (v30)
    {
      v55 = *(_QWORD *)v61;
      v49 = v29;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(_QWORD *)v61 != v55)
            objc_enumerationMutation(v49);
          v32 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)k);
          dispatch_group_enter(v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsFromWorkout:](HKQuery, "predicateForObjectsFromWorkout:", v53));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "startDate"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "endDate"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v34, v35, 1));

          v85[0] = v33;
          v85[1] = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 2));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v37));

          v39 = objc_alloc((Class)HKStatisticsQuery);
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierActiveEnergyBurned));
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_10007815C;
          v57[3] = &unk_100778B48;
          v57[4] = v32;
          v59 = &v69;
          v58 = v28;
          v41 = objc_msgSend(v39, "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", v40, v38, 16, v57);

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator healthStore](self, "healthStore"));
          objc_msgSend(v42, "executeQuery:", v41);

        }
        v29 = v49;
        v30 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v60, v86, 16);
      }
      while (v30);
    }
  }

  v43 = dispatch_time(0, 20000000000);
  dispatch_group_wait(v28, v43);
  v44 = (id)v70[5];
  v45 = v44;
  if (v44)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v44);
    else
      _HKLogDroppedError(v44);
  }

  v46 = v56;
  _Block_object_dispose(&v69, 8);

  return v46;
}

- (id)_queue_openWaterSwimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  intptr_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, uint64_t, _BYTE *);
  void *v30;
  id v31;
  uint64_t *v32;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  uint64_t v52;

  v7 = a3;
  v8 = a4;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_10006F3C4;
  v49 = sub_10006F3D4;
  v50 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_10006F3C4;
  v43 = sub_10006F3D4;
  v44 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100078528;
  v36[3] = &unk_100778C10;
  v38 = &v45;
  v10 = v9;
  v37 = v10;
  -[CHWorkoutDataCalculator strokeSamplesForWorkout:workoutActivity:completion:](self, "strokeSamplesForWorkout:workoutActivity:completion:", v7, v8, v36);
  dispatch_group_enter(v10);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100078564;
  v33[3] = &unk_100778C10;
  v35 = &v39;
  v11 = v10;
  v34 = v11;
  -[CHWorkoutDataCalculator distanceSamplesForWorkout:workoutActivity:completion:](self, "distanceSamplesForWorkout:workoutActivity:completion:", v7, v8, v33);
  v12 = dispatch_time(0, 20000000000);
  v13 = dispatch_group_wait(v11, v12);
  _HKInitializeLogging(v13, v14);
  v15 = HKLogActivity;
  v16 = os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    v18 = v46[5];
    *(_DWORD *)buf = 138412290;
    v52 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Stroke samples: %@", buf, 0xCu);
  }
  _HKInitializeLogging(v16, v17);
  v19 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v40[5];
    *(_DWORD *)buf = 138412290;
    v52 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Distance samples: %@", buf, 0xCu);
  }
  v21 = objc_alloc_init((Class)NSMutableDictionary);
  v22 = (void *)v46[5];
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_1000785A0;
  v30 = &unk_100778C38;
  v32 = &v39;
  v23 = v21;
  v31 = v23;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", &v27);
  v24 = objc_alloc((Class)NSDictionary);
  v25 = objc_msgSend(v24, "initWithDictionary:", v23, v27, v28, v29, v30);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v25;
}

- (id)_queue_swimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  uint64_t v22;
  void *v23;
  _UNKNOWN **v24;
  _UNKNOWN **v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  if (v7)
    v9 = v7;
  else
    v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workoutEvents"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100778C58));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v11));

  if (objc_msgSend(v12, "count"))
  {
    v31 = v7;
    v30 = v10;
    if (v7)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "workoutConfiguration"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lapLength"));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", HKMetadataKeyLapLength));
    }
    v16 = (void *)v14;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v12;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(obj);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "metadata"));
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", HKMetadataKeySwimmingStrokeStyle));
          v23 = (void *)v22;
          if (v22)
            v24 = (_UNKNOWN **)v22;
          else
            v24 = &off_1007B3BD8;
          v25 = v24;

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v25));
          if (v26)
          {
            v27 = v26;
            v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_quantityByAddingQuantity:", v16));

          }
          else
          {
            v28 = v16;
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, v25);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v18);
    }

    v15 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v8);
    v7 = v31;
    v10 = v30;
  }
  else
  {
    v15 = &__NSDictionary0__struct;
  }

  return v15;
}

- (id)_queue_swimmingSetsForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *v34;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  CHWorkoutDataCalculator *v41;
  id v42;
  _QWORD *v43;
  uint64_t *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  NSObject *v54;
  uint64_t *v55;
  _QWORD v56[4];
  NSObject *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _QWORD v65[5];
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];

  v36 = a3;
  v37 = a4;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = sub_10006F3C4;
  v65[4] = sub_10006F3D4;
  v66 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_10006F3C4;
  v63 = sub_10006F3D4;
  v64 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100078ED4;
  v56[3] = &unk_100778C10;
  v58 = v65;
  v7 = v6;
  v57 = v7;
  -[CHWorkoutDataCalculator strokeSamplesForWorkout:workoutActivity:completion:](self, "strokeSamplesForWorkout:workoutActivity:completion:", v36, v37, v56);
  dispatch_group_enter(v7);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100078F10;
  v53[3] = &unk_100778C10;
  v55 = &v59;
  v8 = v7;
  v54 = v8;
  -[CHWorkoutDataCalculator distanceSamplesForWorkout:workoutActivity:completion:](self, "distanceSamplesForWorkout:workoutActivity:completion:", v36, v37, v53);
  v9 = dispatch_time(0, 20000000000);
  v34 = v8;
  dispatch_group_wait(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit yardUnit](HKUnit, "yardUnit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v10, 0.0));

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v12 = (id)v60[5];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v68, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v50;
    do
    {
      v15 = 0;
      v16 = v11;
      do
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v15), "quantity", v34));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_quantityByAddingQuantity:", v17));

        v15 = (char *)v15 + 1;
        v16 = v11;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v68, 16);
    }
    while (v13);
  }

  v18 = objc_alloc_init((Class)NSMutableArray);
  if (v37)
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "workoutEvents"));
  else
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "workoutEvents"));
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v67, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v46;
    v23 = FIUIPrivateMetadataKeySegmentEventSubtype;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v22)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v25, "type", v34) == (id)7)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "metadata"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", v23));

          if (objc_msgSend(v27, "intValue") != 1 && objc_msgSend(v27, "intValue") != 3)
            objc_msgSend(v18, "addObject:", v25);

        }
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v67, 16);
    }
    while (v21);
  }

  v28 = objc_alloc_init((Class)NSMutableArray);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100078F4C;
  v38[3] = &unk_100778CD0;
  v29 = v18;
  v39 = v29;
  v43 = v65;
  v44 = &v59;
  v30 = v20;
  v40 = v30;
  v41 = self;
  v31 = v28;
  v42 = v31;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v38);
  v32 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v31);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(v65, 8);

  return v32;
}

- (int64_t)_queue_strokeStyleForLaps:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  _UNKNOWN **v12;
  _UNKNOWN **v13;
  void *v14;
  void *v15;
  _UNKNOWN **v16;
  id v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  float v25;
  void *j;
  float v27;
  id v28;
  id v29;
  uint64_t v30;
  float v32;
  void *k;
  void *v34;
  void *v35;
  float v36;
  float v37;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), "metadata"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", HKMetadataKeySwimmingStrokeStyle));
        v11 = (void *)v10;
        if (v10)
          v12 = (_UNKNOWN **)v10;
        else
          v12 = &off_1007B3BD8;
        v13 = v12;

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v13));
        if (v14)
        {
          v15 = v14;
          v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v14, "integerValue") + 1));

        }
        else
        {
          v16 = &off_1007B3BF0;
        }
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v13);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v6);
  }

  v17 = objc_msgSend(v4, "count");
  v18 = (int64_t)v17;
  if (v17)
  {
    if (v17 == (id)1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
      v18 = (int64_t)objc_msgSend(v20, "integerValue");

    }
    else
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v45;
        v25 = 0.0;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v45 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j), "floatValue");
            v25 = v25 + v27;
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        }
        while (v23);
      }
      else
      {
        v25 = 0.0;
      }

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
      v28 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v41;
        if (v25 >= 10.9999999 || v25 <= 2.00000012)
          v32 = v25;
        else
          v32 = v25 + -1.0;
        v18 = 1;
        while (2)
        {
          for (k = 0; k != v29; k = (char *)k + 1)
          {
            if (*(_QWORD *)v41 != v30)
              objc_enumerationMutation(v19);
            v34 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)k);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v34));
            objc_msgSend(v35, "floatValue");
            v37 = v36;

            if ((float)(v37 / v32) > 0.9)
            {
              v18 = (int64_t)objc_msgSend(v34, "integerValue");
              goto LABEL_43;
            }
          }
          v29 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          if (v29)
            continue;
          break;
        }
      }
      else
      {
        v18 = 1;
      }
    }
LABEL_43:

  }
  return v18;
}

- (void)_updateSplits:(id)a3 withDistance:(double)a4 duration:(double)a5 strokeCount:(int64_t)a6 splitDelimiterInUserUnit:(double)a7
{
  id v11;
  CHWorkoutSwimmingSplit *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  CHWorkoutSwimmingSplit *v26;
  double v27;
  double v28;

  v11 = a3;
  if (objc_msgSend(v11, "count"))
  {
    v12 = (CHWorkoutSwimmingSplit *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
  }
  else
  {
    v12 = -[CHWorkoutSwimmingSplit initWithSplitDelimiterDistance:distanceInUserUnit:strokeCount:duration:]([CHWorkoutSwimmingSplit alloc], "initWithSplitDelimiterDistance:distanceInUserUnit:strokeCount:duration:", (uint64_t)a7, 0, 0.0, 0.0);
    objc_msgSend(v11, "addObject:", v12);
  }
  -[CHWorkoutSwimmingSplit distanceInUserUnit](v12, "distanceInUserUnit");
  v14 = a4 - (a7 - v13);
  -[CHWorkoutSwimmingSplit distanceInUserUnit](v12, "distanceInUserUnit");
  if (v14 <= 2.22044605e-16)
  {
    -[CHWorkoutSwimmingSplit setDistanceInUserUnit:](v12, "setDistanceInUserUnit:", v15 + a4);
    -[CHWorkoutSwimmingSplit duration](v12, "duration");
    -[CHWorkoutSwimmingSplit setDuration:](v12, "setDuration:", v27 + a5);
    -[CHWorkoutSwimmingSplit setStrokeCount:](v12, "setStrokeCount:", (char *)-[CHWorkoutSwimmingSplit strokeCount](v12, "strokeCount") + a6);
  }
  else
  {
    v16 = (a7 - v15) / a4;
    -[CHWorkoutSwimmingSplit distanceInUserUnit](v12, "distanceInUserUnit");
    -[CHWorkoutSwimmingSplit setDistanceInUserUnit:](v12, "setDistanceInUserUnit:", v17 + v16 * a4);
    -[CHWorkoutSwimmingSplit duration](v12, "duration");
    -[CHWorkoutSwimmingSplit setDuration:](v12, "setDuration:", v18 + v16 * a5);
    v19 = (double)a6;
    v20 = -[CHWorkoutSwimmingSplit setStrokeCount:](v12, "setStrokeCount:", (uint64_t)((double)-[CHWorkoutSwimmingSplit strokeCount](v12, "strokeCount") + v16 * (double)a6));
    v22 = a4 - v16 * a4;
    v23 = vcvtmd_u64_f64(v22 / a7);
    if (v23)
    {
      v24 = llround(a7 / a4 * v19);
      v25 = v23;
      do
      {
        v26 = -[CHWorkoutSwimmingSplit initWithSplitDelimiterDistance:distanceInUserUnit:strokeCount:duration:]([CHWorkoutSwimmingSplit alloc], "initWithSplitDelimiterDistance:distanceInUserUnit:strokeCount:duration:", (uint64_t)a7, v24, a7, a7 / a4 * a5);

        v20 = objc_msgSend(v11, "addObject:", v26);
        v12 = v26;
        --v25;
      }
      while (v25);
    }
    else
    {
      v26 = v12;
    }
    v28 = v22 - (double)v23 * a7;
    if (v28 >= 0.0)
    {
      if (v28 > a7)
      {
        _HKInitializeLogging(v20, v21);
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR))
          sub_1005F2378();
      }
    }
    else
    {
      _HKInitializeLogging(v20, v21);
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR))
        sub_1005F234C();
    }
    if (v28 <= 0.01)
    {
      v12 = v26;
    }
    else
    {
      v12 = -[CHWorkoutSwimmingSplit initWithSplitDelimiterDistance:distanceInUserUnit:strokeCount:duration:]([CHWorkoutSwimmingSplit alloc], "initWithSplitDelimiterDistance:distanceInUserUnit:strokeCount:duration:", (uint64_t)a7, llround(v28 / a4 * v19), v28 / a4 * a4, v28 / a4 * a5);

      objc_msgSend(v11, "addObject:", v12);
    }
  }

}

- (double)_activeWorkoutElapsedTimeFromDate:(id)a3 toDate:(id)a4 forWorkout:(id)a5 workoutActivity:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  _QWORD v18[5];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (v12)
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutEvents"));
  else
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "workoutEvents"));
  v15 = (void *)v14;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100079D90;
  v18[3] = &unk_100778CF8;
  v18[4] = &v19;
  _HKEnumerateActiveWorkoutIntervals(v9, v10, v14, v18);
  v16 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)_swimmingSplitsForWorkout:(id)a3 workoutActivity:(id)a4 distanceSamples:(id)a5 strokeSamples:(id)a6 forDelimeterUnit:(id)a7 splitDelimiter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  id v44;
  id v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  CHWorkoutDataCalculator *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = (void *)v20;
  if (v16 && v17)
  {
    if (objc_msgSend(v16, "count"))
    {
      v49 = v17;
      if (v15)
        v24 = v15;
      else
        v24 = v14;
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 0));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));
      v50 = (void *)v25;
      -[CHWorkoutDataCalculator _activeWorkoutElapsedTimeFromDate:toDate:forWorkout:workoutActivity:](self, "_activeWorkoutElapsedTimeFromDate:toDate:forWorkout:workoutActivity:", v25, v27, v14, v15);
      v29 = v28;

      if (v29 > 2.22044605e-16)
      {
        objc_msgSend(v19, "doubleValueForUnit:", v18);
        -[CHWorkoutDataCalculator _updateSplits:withDistance:duration:strokeCount:splitDelimiterInUserUnit:](self, "_updateSplits:withDistance:duration:strokeCount:splitDelimiterInUserUnit:", v22, 0, 0.0, v29, v30);
      }
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10007A130;
      v56[3] = &unk_100778D20;
      v51 = self;
      v56[4] = self;
      v31 = v18;
      v32 = v16;
      v57 = v32;
      v55 = v14;
      v33 = v14;
      v58 = v33;
      v34 = v19;
      v35 = v15;
      v59 = v35;
      v36 = v22;
      v60 = v36;
      v52 = v34;
      v48 = v34;
      v61 = v48;
      v53 = v31;
      v46 = v31;
      v62 = v46;
      v17 = v49;
      v63 = v49;
      objc_msgSend(v32, "enumerateObjectsUsingBlock:", v56);
      v54 = v22;
      if (v15)
        v37 = v35;
      else
        v37 = v33;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate", v46));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastObject"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "endDate"));
      -[CHWorkoutDataCalculator _activeWorkoutElapsedTimeFromDate:toDate:forWorkout:workoutActivity:](v51, "_activeWorkoutElapsedTimeFromDate:toDate:forWorkout:workoutActivity:", v40, v38, v33, v35);
      v42 = v41;

      if (v42 > 2.22044605e-16)
      {
        objc_msgSend(v48, "doubleValueForUnit:", v47);
        -[CHWorkoutDataCalculator _updateSplits:withDistance:duration:strokeCount:splitDelimiterInUserUnit:](v51, "_updateSplits:withDistance:duration:strokeCount:splitDelimiterInUserUnit:", v36, 0, 0.0, v42, v43);
      }
      v44 = v36;

      v22 = v54;
      v14 = v55;
      v19 = v52;
      v18 = v53;
    }
    else
    {
      _HKInitializeLogging(0, v23);
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR))
        sub_1005F23D0();
    }
  }
  else
  {
    _HKInitializeLogging(v20, v21);
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR))
      sub_1005F23A4();
  }

  return v22;
}

- (id)_queue_swimmingSplitsForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5
{
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  dispatch_group_t group;
  id v59;
  id v60;
  id obj;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  void *i;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[16];
  _QWORD v76[4];
  dispatch_group_t v77;
  uint64_t *v78;
  _QWORD v79[4];
  NSObject *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;
  id *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  _QWORD v94[3];
  _QWORD v95[3];
  NSString *v96;
  _UNKNOWN **v97;
  _BYTE v98[128];
  _BYTE v99[128];

  v59 = a3;
  v60 = a4;
  v88 = 0;
  v89 = (id *)&v88;
  v90 = 0x3032000000;
  v91 = sub_10006F3C4;
  v92 = sub_10006F3D4;
  v93 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = sub_10006F3C4;
  v86 = sub_10006F3D4;
  v87 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_10007AB48;
  v79[3] = &unk_100778C10;
  v81 = &v88;
  v7 = v6;
  v80 = v7;
  -[CHWorkoutDataCalculator strokeSamplesForWorkout:workoutActivity:completion:](self, "strokeSamplesForWorkout:workoutActivity:completion:", v59, v60, v79);
  dispatch_group_enter(v7);
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10007AB84;
  v76[3] = &unk_100778C10;
  v78 = &v82;
  group = v7;
  v77 = group;
  -[CHWorkoutDataCalculator distanceSamplesForWorkout:workoutActivity:completion:](self, "distanceSamplesForWorkout:workoutActivity:completion:", v59, v60, v76);
  v8 = dispatch_time(0, 20000000000);
  dispatch_group_wait(group, v8);
  v9 = objc_msgSend(v89[5], "count");
  if (v9 == objc_msgSend((id)v83[5], "count"))
    goto LABEL_34;
  if (v60)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "workoutConfiguration"));
    v11 = objc_msgSend(v10, "swimmingLocationType");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", HKMetadataKeySwimmingLocationType));
    v11 = objc_msgSend(v12, "integerValue");

  }
  if (v11 == (id)2)
  {
    _HKInitializeLogging(v13, v14);
    v15 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Open water swim with differing count of distance and stroke count samples. Adding empty stroke samples.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
  }
  else
  {
    _HKInitializeLogging(v13, v14);
    v15 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Pool swim with differing count of distance and stroke count samples (kickboarding?). Adding empty stroke samples.";
      goto LABEL_10;
    }
  }
  v63 = objc_alloc_init((Class)NSMutableArray);
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = (id)v83[5];
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v99, 16);
  if (v64)
  {
    v62 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v64; i = (char *)i + 1)
      {
        if (*(_QWORD *)v72 != v62)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fiui_dateInterval"));
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v19 = v89[5];
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v98, 16);
        v65 = v17;
        if (v20)
        {
          v21 = *(_QWORD *)v68;
LABEL_18:
          v22 = 0;
          while (1)
          {
            if (*(_QWORD *)v68 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "fiui_dateInterval"));
            objc_msgSend(v18, "duration");
            if (v25 > 2.22044605e-16)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "intersectionWithDateInterval:", v18));
              objc_msgSend(v26, "duration");
              v28 = v27;
              objc_msgSend(v18, "duration");
              v30 = v28 / v29 > 0.9;

              if (v30)
                break;
            }

            if (v20 == (id)++v22)
            {
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v98, 16);
              if (v20)
                goto LABEL_18;
              goto LABEL_25;
            }
          }
          v31 = v23;

          if (v31)
            goto LABEL_28;
        }
        else
        {
LABEL_25:

        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierSwimmingStrokeCount));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit countUnit](HKUnit, "countUnit"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v33, 0.0));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "startDate"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "endDate"));
        v96 = HKMetadataKeySwimmingStrokeStyle;
        v97 = &off_1007B3BD8;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1));
        v31 = (id)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v32, v34, v35, v36, v37));

LABEL_28:
        objc_msgSend(v63, "addObject:", v31);

      }
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v99, 16);
    }
    while (v64);
  }

  objc_storeStrong(v89 + 5, v63);
  v38 = objc_msgSend(v89[5], "count");
  v39 = objc_msgSend((id)v83[5], "count");
  if (v38 != v39)
  {
    _HKInitializeLogging(v39, v40);
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR))
      sub_1005F23FC();
  }

LABEL_34:
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator unitManager](self, "unitManager"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "userDistanceHKUnitForDistanceType:", 3));

  v43 = v83[5];
  v44 = v89[5];
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v42, 100.0));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _swimmingSplitsForWorkout:workoutActivity:distanceSamples:strokeSamples:forDelimeterUnit:splitDelimiter:](self, "_swimmingSplitsForWorkout:workoutActivity:distanceSamples:strokeSamples:forDelimeterUnit:splitDelimiter:", v59, v60, v43, v44, v42, v45));

  v47 = v83[5];
  v48 = v89[5];
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v42, 50.0));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _swimmingSplitsForWorkout:workoutActivity:distanceSamples:strokeSamples:forDelimeterUnit:splitDelimiter:](self, "_swimmingSplitsForWorkout:workoutActivity:distanceSamples:strokeSamples:forDelimeterUnit:splitDelimiter:", v59, v60, v47, v48, v42, v49));

  v51 = v83[5];
  v52 = v89[5];
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v42, 25.0));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _swimmingSplitsForWorkout:workoutActivity:distanceSamples:strokeSamples:forDelimeterUnit:splitDelimiter:](self, "_swimmingSplitsForWorkout:workoutActivity:distanceSamples:strokeSamples:forDelimeterUnit:splitDelimiter:", v59, v60, v51, v52, v42, v53));

  v94[0] = &off_1007B3BA8;
  v94[1] = &off_1007B3C08;
  v95[0] = v46;
  v95[1] = v50;
  v94[2] = &off_1007B3C20;
  v95[2] = v54;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v95, v94, 3));

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v88, 8);

  return v55;
}

- (id)_uuidForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v4;

  if (a4)
    v4 = a4;
  else
    v4 = a3;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID", a3));
}

- (id)_predicateForObjectsFromWorkout:(id)a3 withinWorkoutActivity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsFromWorkout:](HKQuery, "predicateForObjectsFromWorkout:", v5));
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = v8;
  if (v6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10007ADDC;
    v17[3] = &unk_100778AD0;
    v10 = &v18;
    v18 = v8;
    v11 = v17;
    v12 = v6;
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10007AD88;
    v19[3] = &unk_100778AD0;
    v10 = &v20;
    v20 = v8;
    v11 = v19;
    v12 = v5;
  }
  objc_msgSend(v12, "_enumerateActiveTimePeriods:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v9));
  v21[0] = v7;
  v21[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v14));

  return v15;
}

- (id)_activeDateIntervalsForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id *v9;
  void ***v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = v7;
  if (v6)
  {
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10007AF94;
    v16 = &unk_100778AD0;
    v9 = &v17;
    v17 = v7;
    v10 = &v13;
    v11 = v6;
  }
  else
  {
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_10007AF1C;
    v21 = &unk_100778AD0;
    v9 = &v22;
    v22 = v7;
    v10 = &v18;
    v11 = v5;
  }
  objc_msgSend(v11, "_enumerateActiveTimePeriods:", v10, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);

  return v8;
}

- (id)_predicateForWorkout:(id)a3 during:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsFromWorkout:](HKQuery, "predicateForObjectsFromWorkout:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _activeDateIntervalsForWorkout:during:](self, "_activeDateIntervalsForWorkout:during:", v7, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator _predicateForActiveDateIntervals:](self, "_predicateForActiveDateIntervals:", v9));
  v14[0] = v8;
  v14[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

  return v12;
}

- (id)_predicateForActiveDateIntervals:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "hk_map:", &stru_100778D60));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v3));

  return v4;
}

- (BOOL)_activeDateIntervals:(id)a3 containsDate:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate", (_QWORD)v21));
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        v14 = v13;

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
        objc_msgSend(v15, "timeIntervalSinceReferenceDate");
        v17 = v16;

        objc_msgSend(v6, "timeIntervalSinceReferenceDate");
        if (v18 >= v14 && v18 < v17)
        {
          LOBYTE(v8) = 1;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_14:

  return (char)v8;
}

- (id)_activeDateIntervalsForWorkout:(id)a3 during:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a4;
  v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007B414;
  v12[3] = &unk_100778D88;
  v13 = v5;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v14 = v7;
  v8 = v5;
  objc_msgSend(v6, "_enumerateActiveTimePeriods:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)_activeDateIntervalsForWorkoutActivity:(id)a3 during:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a4;
  v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007B640;
  v12[3] = &unk_100778D88;
  v13 = v5;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v14 = v7;
  v8 = v5;
  objc_msgSend(v6, "_enumerateActiveTimePeriods:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)_testMarkersForWorkout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  uint64_t v25;
  _UNKNOWN **v26;
  uint64_t v27;
  _UNKNOWN **v28;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  v8 = v7 / 3.0;
  v9 = objc_alloc((Class)NSDateInterval);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", v8));
  v12 = objc_msgSend(v9, "initWithStartDate:duration:", v11, 0.0);
  v13 = FIUIPrivateMetadataKeyMarkerEventSubtype;
  v27 = FIUIPrivateMetadataKeyMarkerEventSubtype;
  v28 = &off_1007B3C38;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[HKWorkoutEvent workoutEventWithType:dateInterval:metadata:](HKWorkoutEvent, "workoutEventWithType:dateInterval:metadata:", 4, v12, v14));

  v16 = objc_alloc((Class)NSDateInterval);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dateByAddingTimeInterval:", v8 + v8));
  v19 = objc_msgSend(v16, "initWithStartDate:duration:", v18, 0.0);
  v25 = v13;
  v26 = &off_1007B3C38;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[HKWorkoutEvent workoutEventWithType:dateInterval:metadata:](HKWorkoutEvent, "workoutEventWithType:dateInterval:metadata:", 4, v19, v20));

  v24[0] = v15;
  v24[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));

  return v22;
}

- (id)_testTrackLapsForWorkout:(id)a3
{
  double v3;
  double v4;
  id v5;
  uint64_t v6;
  double v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[4];

  v22 = a3;
  objc_msgSend(v22, "duration");
  v4 = v3 * 0.125;
  v5 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
  v21 = FIPrivateMetadataKeyLapIndex;
  v20 = FIPrivateMetadataKeyLaneNumber;
  v19 = FIPrivateMetadataKeyLapDuration;
  v6 = 1;
  v18 = FIPrivateMetadataKeyLapDistance;
  v7 = 0.0;
  do
  {
    v8 = objc_alloc((Class)NSDateInterval);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dateByAddingTimeInterval:", v4 * v7));
    v9 = objc_msgSend(v8, "initWithStartDate:duration:", v23, v4);
    v25[0] = v21;
    v7 = v7 + 1.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    v26[0] = v10;
    v26[1] = &off_1007B3BF0;
    v25[1] = v20;
    v25[2] = v19;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit secondUnit](HKUnit, "secondUnit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v11, v4));
    v26[2] = v12;
    v25[3] = v18;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v13, 400.0));
    v26[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HKWorkoutEvent workoutEventWithType:dateInterval:metadata:](HKWorkoutEvent, "workoutEventWithType:dateInterval:metadata:", 3, v9, v15));

    objc_msgSend(v5, "addObject:", v16);
    v6 = (v6 + 1);
  }
  while ((_DWORD)v6 != 9);

  return v5;
}

- (BOOL)_workoutSupportsDistanceAndPace:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fiui_activityType"));
  v5 = +[FIUIWorkoutDefaultMetricsProvider metricsVersionForWorkout:](FIUIWorkoutDefaultMetricsProvider, "metricsVersionForWorkout:", v3);
  v6 = objc_alloc((Class)FIUIWorkoutDefaultMetricsProvider);
  v7 = objc_msgSend(v3, "_activityMoveMode");
  v8 = FIUIDeviceSupportsElevationGain();
  v9 = objc_msgSend(v6, "initWithMetricsVersion:activityType:activityMoveMode:deviceSupportsElevationMetrics:deviceSupportsGroundElevationMetrics:", v5, v4, v7, v8, FIUIDeviceSupportsGroundElevation());
  v10 = objc_msgSend(v3, "fiui_isConnectedGymWorkout");

  LOBYTE(v3) = objc_msgSend(v9, "isMetricTypeSupported:isMachineWorkout:activityType:", 1, v10, v4);
  return (char)v3;
}

- (void)_setDistanceSamples:(id)a3 forWorkout:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v6, 0));
  objc_msgSend(v8, "setDistanceSamples:", v7);

  -[CHWorkoutDataCalculator saveContainerToCache:forWorkout:workoutActivity:](self, "saveContainerToCache:forWorkout:workoutActivity:", v8, v6, 0);
}

- (void)_setStrokeSamples:(id)a3 forWorkout:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", v6, 0));
  objc_msgSend(v8, "setStrokeSamples:", v7);

  -[CHWorkoutDataCalculator saveContainerToCache:forWorkout:workoutActivity:](self, "saveContainerToCache:forWorkout:workoutActivity:", v8, v6, 0);
}

- (id)_getDistanceSamplesForWorkout:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataCalculator cacheContainerForWorkout:workoutActivity:](self, "cacheContainerForWorkout:workoutActivity:", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "distanceSamples"));

  return v4;
}

- (id)_getDistanceAchievedDateForInterval:(id)a3 fromDistanceSamples:(id)a4 withDistanceTarget:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc((Class)NSDateInterval);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
  v13 = objc_msgSend(v10, "initWithStartDate:endDate:", v11, v12);

  objc_msgSend(v13, "duration");
  if (fabs(v14) >= 2.22044605e-16)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
    objc_msgSend(v9, "doubleValueForUnit:", v16);
    v18 = v17;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v19 = v8;
    v15 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v15)
    {
      v38 = v9;
      v39 = v8;
      v20 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v19);
          v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fiui_dateInterval"));
          objc_msgSend(v23, "duration");
          if (fabs(v24) >= 2.22044605e-16)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "intersectionWithDateInterval:", v13));
            objc_msgSend(v25, "duration");
            v27 = v26;
            objc_msgSend(v23, "duration");
            v29 = v27 / v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "quantity"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
            objc_msgSend(v30, "doubleValueForUnit:", v31);
            v33 = v29 * v32;

            if (v18 <= v33)
            {
              objc_msgSend(v23, "duration");
              v35 = v18 / v33 * v34;
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));
              v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dateByAddingTimeInterval:", v35));

              goto LABEL_15;
            }
            v18 = v18 - v33;

          }
        }
        v15 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v15)
          continue;
        break;
      }
LABEL_15:
      v8 = v39;
      v9 = v38;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)shouldUseFakeSegmentMarkers
{
  return self->_shouldUseFakeSegmentMarkers;
}

- (void)setShouldUseFakeSegmentMarkers:(BOOL)a3
{
  self->_shouldUseFakeSegmentMarkers = a3;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (FIUIUnitManager)unitManager
{
  return self->_unitManager;
}

- (void)setUnitManager:(id)a3
{
  objc_storeStrong((id *)&self->_unitManager, a3);
}

- (HKWorkoutEffortRelationshipQuery)effortObserverQuery
{
  return self->_effortObserverQuery;
}

- (void)setEffortObserverQuery:(id)a3
{
  objc_storeStrong((id *)&self->_effortObserverQuery, a3);
}

- (HKQueryAnchor)lastEffortAnchor
{
  return self->_lastEffortAnchor;
}

- (void)setLastEffortAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_lastEffortAnchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEffortAnchor, 0);
  objc_storeStrong((id *)&self->_effortObserverQuery, 0);
  objc_storeStrong((id *)&self->_unitManager, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
