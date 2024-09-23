@implementation TrafficIncidentsStorageManager

- (TrafficIncidentsStorageManager)init
{
  TrafficIncidentsStorageManager *v2;
  TrafficIncidentsStorageManager *v3;
  TrafficIncidentsStorageManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TrafficIncidentsStorageManager;
  v2 = -[TrafficIncidentsStorageManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[TrafficIncidentsStorageManager _deleteExpiredReports](v2, "_deleteExpiredReports");
    -[TrafficIncidentsStorageManager _startExpirationRefresh](v3, "_startExpirationRefresh");
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager reportsExpirationTimer](self, "reportsExpirationTimer"));
  objc_msgSend(v3, "invalidate");

  -[TrafficIncidentsStorageManager setReportsExpirationTimer:](self, "setReportsExpirationTimer:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager reportsResubmissionTimer](self, "reportsResubmissionTimer"));
  objc_msgSend(v4, "invalidate");

  -[TrafficIncidentsStorageManager setReportsResubmissionTimer:](self, "setReportsResubmissionTimer:", 0);
  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentsStorageManager;
  -[TrafficIncidentsStorageManager dealloc](&v5, "dealloc");
}

+ (id)sharedInstance
{
  if (qword_1014D1E10 != -1)
    dispatch_once(&qword_1014D1E10, &stru_1011ADC30);
  return (id)qword_1014D1E08;
}

- (void)addReport:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager _reports](self, "_reports"));
  if ((objc_msgSend(v4, "containsObject:", v6) & 1) == 0)
  {
    -[TrafficIncidentsStorageManager _addReport:](self, "_addReport:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager observers](self, "observers"));
    objc_msgSend(v5, "incidentsStorageManagerDidAddReport:", v6);

  }
}

- (void)removeReport:(id)a3
{
  id v4;

  -[TrafficIncidentsStorageManager _removeReport:](self, "_removeReport:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager observers](self, "observers"));
  objc_msgSend(v4, "incidentsStorageManagerDidUpdate");

}

- (void)hideReport:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "setHidden:", 1);
  -[TrafficIncidentsStorageManager _didModifyExistingReport:](self, "_didModifyExistingReport:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager observers](self, "observers"));
  objc_msgSend(v5, "incidentsStorageManagerDidUpdate");

}

- (id)visibleReports
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager _reports](self, "_reports"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011ADC70));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "filteredArrayUsingPredicate:", v3));

  return v4;
}

- (void)_didModifyExistingReport:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager _reports](self, "_reports"));
  if (objc_msgSend(v4, "containsObject:", v5))
    -[TrafficIncidentsStorageManager _addReport:](self, "_addReport:", v5);

}

- (void)resubmitLastReport
{
  void *v3;
  void *v4;
  id v5;
  uint64_t UInteger;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager _reports](self, "_reports"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  objc_msgSend(v4, "setSubmissionCount:", (char *)objc_msgSend(v4, "submissionCount") + 1);
  objc_msgSend(v4, "setSubmissionFailed:", 0);
  -[TrafficIncidentsStorageManager _didModifyExistingReport:](self, "_didModifyExistingReport:", v4);
  v5 = objc_msgSend(v4, "submissionCount");
  if ((unint64_t)v5 <= GEOConfigGetUInteger(MapsConfig_TrafficIncidentsStorageMaxSubmissionCount, off_1014B35B8))
  {
    UInteger = GEOConfigGetUInteger(MapsConfig_TrafficIncidentsStorageRetrySubmissionDelay, off_1014B35C8);
    v7 = dispatch_time(0, 1000000000 * UInteger);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100257520;
    block[3] = &unk_1011AC860;
    v9 = v4;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)removeTrafficIncidentFeature:(id)a3
{
  id v4;
  NSMutableSet *trafficIncidentFeatures;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;

  v4 = a3;
  trafficIncidentFeatures = self->_trafficIncidentFeatures;
  v9 = v4;
  if (!trafficIncidentFeatures)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_trafficIncidentFeatures;
    self->_trafficIncidentFeatures = v6;

    v4 = v9;
    trafficIncidentFeatures = self->_trafficIncidentFeatures;
  }
  -[NSMutableSet addObject:](trafficIncidentFeatures, "addObject:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager observers](self, "observers"));
  objc_msgSend(v8, "incidentsStorageManagerDidUpdateVendorIncidentFeatures");

  -[TrafficIncidentsStorageManager _updateTrafficIncidentFeatures](self, "_updateTrafficIncidentFeatures");
}

- (id)removedTrafficIncidentFeaturesIds
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager _trafficIncidentFeaturesUniqueIds](self, "_trafficIncidentFeaturesUniqueIds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

- (id)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___TrafficIncidentsStorageManagerObserver, &_dispatch_main_q);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (id)_sharedUserDefaults
{
  return +[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults");
}

- (void)_addReport:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager _sharedUserDefaults](self, "_sharedUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dictionaryForKey:", CFSTR("TrafficIncidentsStorageDictionaryKey")));
  v6 = objc_msgSend(v5, "mutableCopy");

  if (!v6)
    v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  objc_msgSend(v6, "setValue:forKey:", v7, v9);

  v10 = objc_msgSend(v6, "copy");
  objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("TrafficIncidentsStorageDictionaryKey"));

  objc_msgSend(v11, "synchronize");
}

- (void)_removeReport:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager _sharedUserDefaults](self, "_sharedUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryForKey:", CFSTR("TrafficIncidentsStorageDictionaryKey")));
  v6 = objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    objc_msgSend(v6, "removeObjectForKey:", v8);

    v9 = objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("TrafficIncidentsStorageDictionaryKey"));

    objc_msgSend(v4, "synchronize");
  }

}

- (id)_reports
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager _sharedUserDefaults](self, "_sharedUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryForKey:", CFSTR("TrafficIncidentsStorageDictionaryKey")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v5 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("timestamp"), 1);
  v6 = sub_10039DCD4(v4, &stru_1011ADCB0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingDescriptors:", v8));

  return v9;
}

- (id)_trafficIncidentFeaturesUniqueIds
{
  id v3;
  void *v4;

  if (-[NSMutableSet count](self->_trafficIncidentFeatures, "count"))
  {
    v3 = sub_10039DCD4(self->_trafficIncidentFeatures, &stru_1011ADCF0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = &__NSArray0__struct;
  }
  return v4;
}

- (void)_updateTrafficIncidentFeatures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[NSMutableSet count](self->_trafficIncidentFeatures, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appCoordinator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chromeViewController"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_mapLayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_trafficIncidentFeatures, "allObjects"));
    objc_msgSend(v6, "setHiddenTrafficIncidentFeatures:", v7);

  }
}

- (void)clearCache
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager _sharedUserDefaults](self, "_sharedUserDefaults"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("TrafficIncidentsStorageDictionaryKey"));
  objc_msgSend(v4, "synchronize");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager observers](self, "observers"));
  objc_msgSend(v3, "incidentsStorageManagerDidUpdate");

}

- (void)_startExpirationRefresh
{
  NSTimer *v3;
  id v4;

  v3 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_deleteExpiredReports", 0, 1, GEOConfigGetDouble(MapsConfig_TrafficIncidentReportExpirationTimer, off_1014B3518));
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[TrafficIncidentsStorageManager setReportsExpirationTimer:](self, "setReportsExpirationTimer:", v4);

}

- (void)_deleteExpiredReports
{
  double Current;
  void *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *i;
  void *v10;
  double v11;
  void *v12;
  id v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];

  Current = CFAbsoluteTimeGetCurrent();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager _reports](self, "_reports"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "timestamp");
        if (Current - v11 > GEOConfigGetDouble(MapsConfig_TrafficIncidentReportTTL, off_1014B34F8))
        {
          -[TrafficIncidentsStorageManager _removeReport:](self, "_removeReport:", v10);
          v7 = 1;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v6);
    if (((objc_msgSend(v4, "count") != 0) & v7) == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsStorageManager observers](self, "observers"));
      objc_msgSend(v12, "incidentsStorageManagerDidUpdate");

      v13 = sub_100257624();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "TrafficIncidentsStorageManager deleted expired reports : %@", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(v4, "count");
  }

}

+ (int64_t)creationPreference
{
  return 1;
}

- (NSTimer)reportsExpirationTimer
{
  return self->_reportsExpirationTimer;
}

- (void)setReportsExpirationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reportsExpirationTimer, a3);
}

- (NSTimer)reportsResubmissionTimer
{
  return self->_reportsResubmissionTimer;
}

- (void)setReportsResubmissionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reportsResubmissionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportsResubmissionTimer, 0);
  objc_storeStrong((id *)&self->_reportsExpirationTimer, 0);
  objc_storeStrong((id *)&self->_trafficIncidentFeatures, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
