@implementation TransitSchedulesDepartureDataProvider

- (TransitSchedulesDepartureDataProvider)initWithTransitMapItem:(id)a3 selectedDepartureSequence:(id)a4 departureSequences:(id)a5 timeZone:(id)a6 initialScheduleDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  TransitSchedulesDepartureDataProvider *v17;
  NSTimeZone *v18;
  NSTimeZone *timeZone;
  uint64_t v20;
  MKMapItemIdentifier *stationIdentifier;
  uint64_t v22;
  NSString *stationName;
  NSArray *v24;
  NSArray *departureSequences;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v34.receiver = self;
  v34.super_class = (Class)TransitSchedulesDepartureDataProvider;
  v17 = -[TransitSchedulesDepartureDataProvider init](&v34, "init");
  if (v17)
  {
    if (v15)
      v18 = (NSTimeZone *)v15;
    else
      v18 = (NSTimeZone *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timeZone"));
    timeZone = v17->_timeZone;
    v17->_timeZone = v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_identifier"));
    stationIdentifier = v17->_stationIdentifier;
    v17->_stationIdentifier = (MKMapItemIdentifier *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    stationName = v17->_stationName;
    v17->_stationName = (NSString *)v22;

    v24 = (NSArray *)objc_msgSend(v14, "copy");
    departureSequences = v17->_departureSequences;
    v17->_departureSequences = v24;

    objc_storeStrong((id *)&v17->_selectedDepartureSequence, a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitDepartureSequence departures](v17->_selectedDepartureSequence, "departures"));
    v17->_remoteNetworkState = v26 != 0;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "line"));
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
      v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "line"));

    }
    v17->_transitLineIdentifier = (unint64_t)objc_msgSend(v29, "muid");
    objc_storeStrong((id *)&v17->_scheduleWindowStartDate, a7);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "countryCode"));
    v17->_arePastDeparturesDroppedByService = objc_msgSend(v32, "isEqualToString:", CFSTR("CN"));

  }
  return v17;
}

+ (double)durationForVisibleDeparturesStartingAtDate:(id)a3 timeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  objc_msgSend(v7, "setTimeZone:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:", 2097180, v6));
  objc_msgSend(v8, "setDay:", (char *)objc_msgSend(v8, "day") + 1);
  objc_msgSend(v8, "setHour:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateFromComponents:", v8));
  objc_msgSend(v9, "timeIntervalSinceDate:", v6);
  v11 = v10;

  return fmax(v11, 43200.0);
}

+ (id)serviceTraitsForScheduleDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
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

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultTraits"));

  objc_msgSend(a1, "durationForVisibleDeparturesStartingAtDate:timeZone:", v7, v6);
  v11 = v10;

  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transitScheduleFilter"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "highFrequencyFilter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeRange"));
  objc_msgSend(v16, "setStartTime:", v13);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "highFrequencyFilter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timeRange"));
  objc_msgSend(v18, "setDuration:", v11);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "highFrequencyFilter"));
  objc_msgSend(v19, "setNumAdditionalDepartures:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowFrequencyFilter"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "timeRange"));
  objc_msgSend(v21, "setStartTime:", v13);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowFrequencyFilter"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "timeRange"));
  objc_msgSend(v23, "setDuration:", v11);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowFrequencyFilter"));
  objc_msgSend(v24, "setNumAdditionalDepartures:", 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "operatingHoursRange"));
  objc_msgSend(v25, "setStartTime:", v13);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "operatingHoursRange"));
  objc_msgSend(v26, "setDuration:", v11);

  return v9;
}

- (void)_fetchNewScheduleDataForDate:(id)a3 tripIdentifier:(unint64_t)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a5;
  v10 = -[MKMapItemIdentifier muid](self->_stationIdentifier, "muid");
  v11 = objc_msgSend((id)objc_opt_class(self), "serviceTraitsForScheduleDate:timeZone:", v8, self->_timeZone);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ticketForTransitDeparturesAtStation:line:referenceTripID:includeAllDirectionNames:traits:", v10, self->_transitLineIdentifier, a4, -[TransitSchedulesDepartureDataProvider requestAllDirections](self, "requestAllDirections"), v12));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100935970;
  v16[3] = &unk_1011B21F8;
  objc_copyWeak(&v18, &location);
  v15 = v9;
  v17 = v15;
  objc_msgSend(v14, "submitWithHandler:networkActivity:", v16, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_clearDepartures
{
  NSArray *departureSequences;
  id v4;

  departureSequences = self->_departureSequences;
  self->_departureSequences = 0;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider delegate](self, "delegate"));
  objc_msgSend(v4, "departureDataProvider:updatedDepartures:", self, 0);

}

- (void)setScheduleWindowStartDate:(id)a3
{
  id v5;
  id v6;
  NSDate *scheduleWindowStartDate;
  _QWORD v8[4];
  id v9;
  id location;

  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_scheduleWindowStartDate, "isEqualToDate:", v5))
  {
    objc_storeStrong((id *)&self->_scheduleWindowStartDate, a3);
    v6 = -[GEOTransitDeparture tripIdentifier](self->_selectedDeparture, "tripIdentifier");
    -[TransitSchedulesDepartureDataProvider _clearDepartures](self, "_clearDepartures");
    -[TransitSchedulesDepartureDataProvider setRemoteNetworkState:](self, "setRemoteNetworkState:", 2);
    objc_initWeak(&location, self);
    scheduleWindowStartDate = self->_scheduleWindowStartDate;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100935D44;
    v8[3] = &unk_1011DC430;
    objc_copyWeak(&v9, &location);
    -[TransitSchedulesDepartureDataProvider _fetchNewScheduleDataForDate:tripIdentifier:withHandler:](self, "_fetchNewScheduleDataForDate:tripIdentifier:withHandler:", scheduleWindowStartDate, v6, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (id)frequencyStringForDeparture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scheduledDepartureDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitDepartureSequence frequencyToDescribeAtDate:](self->_selectedDepartureSequence, "frequencyToDescribeAtDate:", v4));
    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_formattedDescriptionForFrequency:](NSString, "_navigation_formattedDescriptionForFrequency:", v5));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)filterActiveDepartureSequencesFrom:(id)a3 referenceDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  TransitSchedulesDepartureDataProvider *v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") == (id)1)
  {
    v8 = v6;
  }
  else
  {
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100936020;
    v16 = &unk_1011DC458;
    v17 = v7;
    v18 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexesOfObjectsPassingTest:", &v13));
    if (objc_msgSend(v9, "count", v13, v14, v15, v16)
      && (v10 = objc_msgSend(v9, "count"), v10 != objc_msgSend(v6, "count")))
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectsAtIndexes:", v9));
    }
    else
    {
      v11 = v6;
    }
    v8 = v11;

  }
  return v8;
}

- (void)processDeparturesFromDepartureSequences:(id)a3 animatingDifferences:(BOOL)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSUInteger v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *accruedDepartures;
  GEOTransitDeparture *selectedDeparture;
  GEOTransitDepartureSequence *v16;
  GEOTransitDepartureSequence *selectedDepartureSequence;
  id v18;
  NSObject *v19;
  GEOTransitDepartureSequence *v20;
  GEOTransitDepartureSequence *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  id v26;
  _QWORD v27[5];
  uint8_t buf[4];
  NSUInteger v29;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    v6 = sub_1004325AC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[NSArray count](self->_departureSequences, "count");
      *(_DWORD *)buf = 134217984;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "The data provider is attempting to process a response without departure sequences. The provider currently has %ld sequences", buf, 0xCu);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitItemReferenceDateUpdater referenceDate](MKTransitItemReferenceDateUpdater, "referenceDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider filterActiveDepartureSequencesFrom:referenceDate:](self, "filterActiveDepartureSequencesFrom:referenceDate:", v5, v9));

  v11 = objc_msgSend(v10, "copy");
  objc_storeStrong((id *)&self->_departureSequences, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitDepartureSequence headsign](self->_selectedDepartureSequence, "headsign"));
  if (self->_arePastDeparturesDroppedByService)
  {
    if (!self->_accruedDepartures)
    {
      v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      accruedDepartures = self->_accruedDepartures;
      self->_accruedDepartures = v13;

    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100936374;
    v27[3] = &unk_1011DC480;
    v27[4] = self;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v27);
  }
  selectedDeparture = self->_selectedDeparture;
  if (selectedDeparture)
  {
    v16 = (GEOTransitDepartureSequence *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider _departureSequenceContainingTripIdentifier:](self, "_departureSequenceContainingTripIdentifier:", -[GEOTransitDeparture tripIdentifier](selectedDeparture, "tripIdentifier")));
    selectedDepartureSequence = self->_selectedDepartureSequence;
    self->_selectedDepartureSequence = v16;

  }
  if (!self->_selectedDepartureSequence)
  {
    v18 = sub_1004325AC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (NSUInteger)v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "No selectedDepartureSequence found after update. Selected headsign prior to update: %@", buf, 0xCu);
    }

    v20 = (GEOTransitDepartureSequence *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_departureSequences, "firstObject"));
    v21 = self->_selectedDepartureSequence;
    self->_selectedDepartureSequence = v20;

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider delegate](self, "delegate"));
  objc_msgSend(v22, "departureDataProvider:updatedDepartureSequences:", self, self->_departureSequences);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider delegate](self, "delegate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider departures](self, "departures"));
  objc_msgSend(v23, "departureDataProvider:updatedDepartures:", self, v24);

  v25 = -[TransitSchedulesDepartureDataProvider _indexForSelectedTripIdentifier](self, "_indexForSelectedTripIdentifier");
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    v26 = -[TransitSchedulesDepartureDataProvider selectDepartureAtIndex:](self, "selectDepartureAtIndex:", v25);

}

- (NSArray)departures
{
  id v3;
  NSObject *v4;
  NSMutableDictionary *accruedDepartures;
  void *v6;
  void *v7;
  uint8_t v9[16];

  if (!self->_selectedDepartureSequence)
  {
    v3 = sub_1004325AC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Requested departures but there is no selected departure sequence", v9, 2u);
    }

  }
  if (!-[NSMutableDictionary count](self->_accruedDepartures, "count"))
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[GEOTransitDepartureSequence departures](self->_selectedDepartureSequence, "departures"));
  accruedDepartures = self->_accruedDepartures;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitDepartureSequence headsign](self->_selectedDepartureSequence, "headsign"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](accruedDepartures, "objectForKeyedSubscript:", v6));

  return (NSArray *)v7;
}

- (BOOL)selectDepartureWithTripIdentifier:(unint64_t)a3
{
  GEOTransitDepartureSequence *v5;
  GEOTransitDepartureSequence *selectedDepartureSequence;
  unint64_t v7;
  id v8;

  if (!self->_selectedDepartureSequence)
  {
    v5 = (GEOTransitDepartureSequence *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider _departureSequenceContainingTripIdentifier:](self, "_departureSequenceContainingTripIdentifier:", a3));
    selectedDepartureSequence = self->_selectedDepartureSequence;
    self->_selectedDepartureSequence = v5;

  }
  v7 = -[TransitSchedulesDepartureDataProvider _indexForTripIdentifier:scheduledDepartureDate:](self, "_indexForTripIdentifier:scheduledDepartureDate:", a3, 0);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    v8 = -[TransitSchedulesDepartureDataProvider selectDepartureAtIndex:](self, "selectDepartureAtIndex:", v7);
  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)departureSequenceContainingTripIdentifier:(unint64_t)a3 departureSequences:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  unint64_t v19;

  v5 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100936A68;
  v16 = sub_100936A78;
  v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100936A80;
  v11[3] = &unk_1011DC4D0;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
  v6 = (void *)v13[5];
  if (!v6)
  {
    v7 = sub_1004325AC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not find a departureSequence containing the trip identifier %llu", buf, 0xCu);
    }

    v6 = (void *)v13[5];
  }
  v9 = v6;
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)_departureSequenceContainingTripIdentifier:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(self), "departureSequenceContainingTripIdentifier:departureSequences:", a3, self->_departureSequences);
}

- (unint64_t)_indexForTripIdentifier:(unint64_t)a3 scheduledDepartureDate:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider departures](self, "departures"));
  if (objc_msgSend(v7, "count"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100936C64;
    v10[3] = &unk_1011DC4F8;
    v12 = a3;
    v11 = v6;
    v8 = (unint64_t)objc_msgSend(v7, "indexOfObjectPassingTest:", v10);

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (unint64_t)_indexForSelectedTripIdentifier
{
  GEOTransitDeparture *selectedDeparture;
  id v4;
  void *v5;
  unint64_t v6;

  selectedDeparture = self->_selectedDeparture;
  if (!selectedDeparture)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = -[GEOTransitDeparture tripIdentifier](selectedDeparture, "tripIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitDeparture scheduledDepartureDate](self->_selectedDeparture, "scheduledDepartureDate"));
  v6 = -[TransitSchedulesDepartureDataProvider _indexForTripIdentifier:scheduledDepartureDate:](self, "_indexForTripIdentifier:scheduledDepartureDate:", v4, v5);

  return v6;
}

- (unint64_t)_indexForNextIncomingDeparture
{
  void *v2;
  unint64_t v3;
  id v4;
  NSObject *v5;
  uint8_t v7[8];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider departures](self, "departures"));
  if (objc_msgSend(v2, "count"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100936E90;
    v8[3] = &unk_1011DC520;
    v8[4] = &v9;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v8);
    v3 = v10[3];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = sub_1004325AC();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "No incoming departures, so selecting the most recent one", v7, 2u);
      }

      v3 = (unint64_t)objc_msgSend(v2, "count") - 1;
      v10[3] = v3;
    }
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v3;
}

- (id)selectDepartureAtIndex:(unint64_t)a3
{
  void *v5;
  GEOTransitDeparture *v6;
  GEOTransitDeparture *selectedDeparture;
  GEOTransitDeparture *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider departures](self, "departures"));
  if ((unint64_t)objc_msgSend(v5, "count") > a3)
  {
    v6 = (GEOTransitDeparture *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
    selectedDeparture = self->_selectedDeparture;
    self->_selectedDeparture = v6;
    v8 = v6;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider delegate](self, "delegate"));
    objc_msgSend(v9, "departureDataProvider:selectedDeparture:withIndex:", self, v8, a3);

  }
  return 0;
}

- (unint64_t)indexForSelectedDepartureSequence
{
  return -[TransitSchedulesDepartureDataProvider indexForDepartureSequence:](self, "indexForDepartureSequence:", self->_selectedDepartureSequence);
}

- (unint64_t)indexForDepartureSequence:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSArray *departureSequences;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = v4;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_selectedDepartureSequence)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    departureSequences = self->_departureSequences;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100937058;
    v9[3] = &unk_1011DC548;
    v10 = v4;
    v11 = &v12;
    -[NSArray enumerateObjectsUsingBlock:](departureSequences, "enumerateObjectsUsingBlock:", v9);
    v6 = v13[3];

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (void)selectDepartureSequence:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = -[TransitSchedulesDepartureDataProvider indexForDepartureSequence:](self, "indexForDepartureSequence:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = sub_1004325AC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headsign"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "attempted to select headsign %@ but couldn't find it", (uint8_t *)&v9, 0xCu);

    }
  }
  -[TransitSchedulesDepartureDataProvider selectDepartureSequenceAtIndex:](self, "selectDepartureSequenceAtIndex:", v5);

}

- (void)selectDepartureSequenceAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  GEOTransitDeparture *selectedDeparture;
  void *v9;
  void *v10;
  void *v11;
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_departureSequences, "objectAtIndexedSubscript:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "headsign"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitDepartureSequence headsign](self->_selectedDepartureSequence, "headsign"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    selectedDeparture = self->_selectedDeparture;
    self->_selectedDeparture = 0;

    objc_storeStrong((id *)&self->_selectedDepartureSequence, obj);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider delegate](self, "delegate"));
    objc_msgSend(v9, "departureDataProvider:selectedDepartureSequence:withIndex:", self, self->_selectedDepartureSequence, a3);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider delegate](self, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider departures](self, "departures"));
    objc_msgSend(v10, "departureDataProvider:updatedDepartures:", self, v11);

  }
}

- (void)selectNextIncomingDeparture
{
  unint64_t v3;
  id v4;

  v3 = -[TransitSchedulesDepartureDataProvider _indexForNextIncomingDeparture](self, "_indexForNextIncomingDeparture");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    v4 = -[TransitSchedulesDepartureDataProvider selectDepartureAtIndex:](self, "selectDepartureAtIndex:", v3);
}

- (unint64_t)timeDisplayStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_departureSequences, "firstObject"));
  v3 = objc_msgSend(v2, "departureTimeDisplayStyle");

  return (unint64_t)v3;
}

- (unint64_t)remoteNetworkState
{
  return self->_remoteNetworkState;
}

- (void)setRemoteNetworkState:(unint64_t)a3
{
  self->_remoteNetworkState = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (GEOTransitDeparture)selectedDeparture
{
  return self->_selectedDeparture;
}

- (NSArray)departureSequences
{
  return self->_departureSequences;
}

- (GEOTransitDepartureSequence)selectedDepartureSequence
{
  return self->_selectedDepartureSequence;
}

- (BOOL)requestAllDirections
{
  return self->_requestAllDirections;
}

- (void)setRequestAllDirections:(BOOL)a3
{
  self->_requestAllDirections = a3;
}

- (NSDate)scheduleWindowStartDate
{
  return self->_scheduleWindowStartDate;
}

- (TransitSchedulesDepartureDataProviderDelegate)delegate
{
  return (TransitSchedulesDepartureDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scheduleWindowStartDate, 0);
  objc_storeStrong((id *)&self->_selectedDepartureSequence, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_accruedDepartures, 0);
  objc_storeStrong((id *)&self->_departureSequences, 0);
  objc_storeStrong((id *)&self->_selectedDeparture, 0);
  objc_storeStrong((id *)&self->_stationName, 0);
  objc_storeStrong((id *)&self->_stationIdentifier, 0);
}

@end
