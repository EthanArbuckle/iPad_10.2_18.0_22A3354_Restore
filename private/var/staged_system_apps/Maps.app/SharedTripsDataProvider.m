@implementation SharedTripsDataProvider

- (SharedTripsDataProvider)initWithCombineAllTrips:(BOOL)a3
{
  SharedTripsDataProvider *v4;
  SharedTripsDataProvider *v5;
  NSArray *sharedTripSummaries;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SharedTripsDataProvider;
  v4 = -[SharedTripsDataProvider init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    v4->_combineAllTrips = a3;
    sharedTripSummaries = v4->_sharedTripSummaries;
    v4->_sharedTripSummaries = (NSArray *)&__NSArray0__struct;

  }
  return v5;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "addReceivingObserver:", self);

      -[SharedTripsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 0);
    }
    else
    {
      objc_msgSend(v5, "removeReceivingObserver:", self);

    }
  }
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  NSArray *v7;
  NSArray *sharedTrips;
  id v9;
  void *v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *sharedTripSummaries;
  id v20;
  NSObject *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  const char *v29;
  _BOOL4 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;
  _BYTE v42[128];

  if (self->_active)
  {
    v3 = a3;
    self->_hasInitialData = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "receivedTrips"));
    sharedTrips = self->_sharedTrips;
    self->_sharedTrips = v7;

    v9 = objc_alloc_init((Class)NSMutableArray);
    if (-[NSArray count](self->_sharedTrips, "count"))
    {
      if (-[SharedTripsDataProvider combineAllTrips](self, "combineAllTrips"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSummary summaryWithSharedTrips:](SharedTripSummary, "summaryWithSharedTrips:", self->_sharedTrips));
        objc_msgSend(v9, "addObject:", v10);

      }
      else
      {
        v29 = a2;
        v30 = v3;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v11 = self->_sharedTrips;
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v32;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v32 != v14)
                objc_enumerationMutation(v11);
              v41 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1, v29));
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSummary summaryWithSharedTrips:](SharedTripSummary, "summaryWithSharedTrips:", v16));
              objc_msgSend(v9, "addObject:", v17);

              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
          }
          while (v13);
        }

        v3 = v30;
        a2 = v29;
      }
    }
    v18 = (NSArray *)objc_msgSend(v9, "copy", v29);
    sharedTripSummaries = self->_sharedTripSummaries;
    self->_sharedTripSummaries = v18;

    v20 = sub_100432EDC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class(self);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = sub_10039E4FC(v3);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138412802;
      v36 = v24;
      v37 = 2112;
      v38 = v26;
      v39 = 2112;
      v40 = v28;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ %@%@", buf, 0x20u);

    }
    if (v3)
      -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);

  }
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3
{
  -[SharedTripsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
}

- (void)sharedTripService:(id)a3 didReceiveSharedTrip:(id)a4
{
  -[SharedTripsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1, a4);
}

- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4
{
  -[SharedTripsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1, a4);
}

- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4
{
  -[SharedTripsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1, a4);
}

- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
  -[SharedTripsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1, a4);
}

- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
  -[SharedTripsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1, a4);
}

- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
  -[SharedTripsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1, a4);
}

- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
  -[SharedTripsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1, a4);
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (BOOL)combineAllTrips
{
  return self->_combineAllTrips;
}

- (NSArray)sharedTripSummaries
{
  return self->_sharedTripSummaries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTripSummaries, 0);
  objc_storeStrong((id *)&self->_sharedTrips, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
