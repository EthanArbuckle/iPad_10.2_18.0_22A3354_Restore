@implementation TransitSchedulesViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)shouldShowScheduleForTransitMapItem:(id)a3 sequence:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitItemReferenceDateUpdater referenceDate](MKTransitItemReferenceDateUpdater, "referenceDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "validDeparturesInDepartureSequence:withReferenceDate:", v5, v6));

  LOBYTE(v5) = objc_msgSend(v7, "count") != 0;
  return (char)v5;
}

- (TransitSchedulesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TransitSchedulesViewController *v4;
  GEOTransitVehicleUpdater *v5;
  GEOTransitVehicleUpdater *vehicleUpdater;
  TransitSchedulesLineOptionsProvider *v7;
  TransitSchedulesLineOptionsProvider *lineOptionsProvider;
  void *v9;
  uint64_t v10;
  NSArray *storeSubscriptionTypes;
  objc_super v13;
  uint64_t v14;

  v13.receiver = self;
  v13.super_class = (Class)TransitSchedulesViewController;
  v4 = -[TransitSchedulesViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (GEOTransitVehicleUpdater *)objc_msgSend(objc_alloc((Class)GEOTransitVehicleUpdater), "initWithDelegate:", v4);
    vehicleUpdater = v4->_vehicleUpdater;
    v4->_vehicleUpdater = v5;

    v7 = objc_alloc_init(TransitSchedulesLineOptionsProvider);
    lineOptionsProvider = v4->_lineOptionsProvider;
    v4->_lineOptionsProvider = v7;

    -[TransitSchedulesLineOptionsProvider setDelegate:](v4->_lineOptionsProvider, "setDelegate:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    objc_msgSend(v9, "subscribe:", v4);

    v14 = objc_opt_class(MSCollectionTransitItem);
    v10 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    storeSubscriptionTypes = v4->storeSubscriptionTypes;
    v4->storeSubscriptionTypes = (NSArray *)v10;

    -[TransitSchedulesViewController storeDidChangeWithTypes:](v4, "storeDidChangeWithTypes:", &__NSArray0__struct);
  }
  return v4;
}

- (TransitSchedulesViewController)initWithDepartureSequence:(id)a3 timeZone:(id)a4 scheduleWindowStartDate:(id)a5 includeAllDirections:(BOOL)a6
{
  id v10;
  id v11;
  NSDate *v12;
  TransitSchedulesViewController *v13;
  uint64_t v14;
  GEOTransitLine *selectedTransitLine;
  NSString *boardingStopName;
  uint64_t v17;
  NSDate *referenceDate;
  NSDate *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSNumber *selectedTripIdentifier;
  TransitScheduleStopsTableViewDataSource *v24;
  TransitScheduleStopsTableViewDataSource *stopsDataSource;

  v10 = a3;
  v11 = a4;
  v12 = (NSDate *)a5;
  v13 = -[TransitSchedulesViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "line"));
    selectedTransitLine = v13->_selectedTransitLine;
    v13->_selectedTransitLine = (GEOTransitLine *)v14;

    v13->_transitLineIdentifier = (unint64_t)-[GEOTransitLine muid](v13->_selectedTransitLine, "muid");
    v13->_boardingStopMuid = (unint64_t)objc_msgSend(v10, "transitId");
    boardingStopName = v13->_boardingStopName;
    v13->_boardingStopName = 0;

    objc_storeStrong((id *)&v13->_boardingStopTimeZone, a4);
    v13->_isRoutingScheduleCard = 0;
    v13->_requestAllDirections = a6;
    v17 = objc_claimAutoreleasedReturnValue(+[MKTransitItemReferenceDateUpdater referenceDate](MKTransitItemReferenceDateUpdater, "referenceDate"));
    referenceDate = v13->_referenceDate;
    v13->_referenceDate = (NSDate *)v17;

    v19 = v12;
    if (!v12)
      v19 = v13->_referenceDate;
    objc_storeStrong((id *)&v13->_scheduleWindowStartDate, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "departures"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

    if (v21)
    {
      v22 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "tripIdentifier")));
      selectedTripIdentifier = v13->_selectedTripIdentifier;
      v13->_selectedTripIdentifier = (NSNumber *)v22;

    }
    v24 = -[TransitScheduleStopsTableViewDataSource initWithBoardingStopMuid:transitLine:referenceDate:]([TransitScheduleStopsTableViewDataSource alloc], "initWithBoardingStopMuid:transitLine:referenceDate:", v13->_boardingStopMuid, v13->_selectedTransitLine, v13->_referenceDate);
    stopsDataSource = v13->_stopsDataSource;
    v13->_stopsDataSource = v24;

  }
  return v13;
}

- (TransitSchedulesViewController)initWithTransitMapItem:(id)a3 departureSequence:(id)a4
{
  id v7;
  id v8;
  TransitSchedulesViewController *v9;
  uint64_t v10;
  GEOTransitLine *selectedTransitLine;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *boardingStopName;
  uint64_t v18;
  NSTimeZone *boardingStopTimeZone;
  uint64_t v20;
  NSDate *referenceDate;
  void *v22;
  void *v23;
  void *v24;
  TransitSchedulesDepartureDataProvider *v25;
  void *v26;
  TransitSchedulesDepartureDataProvider *v27;
  uint64_t v28;
  NSNumber *selectedTripIdentifier;
  uint64_t v30;
  GEOTransitAttribution *attribution;
  TransitScheduleStopsTableViewDataSource *v32;
  TransitScheduleStopsTableViewDataSource *stopsDataSource;
  id v35;

  v7 = a3;
  v8 = a4;
  v9 = -[TransitSchedulesViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "line"));
    selectedTransitLine = v9->_selectedTransitLine;
    v9->_selectedTransitLine = (GEOTransitLine *)v10;

    v9->_transitLineIdentifier = (unint64_t)-[GEOTransitLine muid](v9->_selectedTransitLine, "muid");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_geoMapItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transitStationIdentifier"));
    v9->_boardingStopMuid = (unint64_t)objc_msgSend(v13, "muid");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_transitInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "displayName"));
    v16 = (NSString *)objc_msgSend(v15, "copy");
    boardingStopName = v9->_boardingStopName;
    v9->_boardingStopName = v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));
    boardingStopTimeZone = v9->_boardingStopTimeZone;
    v9->_boardingStopTimeZone = (NSTimeZone *)v18;

    v9->_isRoutingScheduleCard = 0;
    objc_storeStrong((id *)&v9->_boardingStopMapItem, a3);
    v20 = objc_claimAutoreleasedReturnValue(+[MKTransitItemReferenceDateUpdater referenceDate](MKTransitItemReferenceDateUpdater, "referenceDate"));
    referenceDate = v9->_referenceDate;
    v9->_referenceDate = (NSDate *)v20;

    objc_storeStrong((id *)&v9->_scheduleWindowStartDate, v9->_referenceDate);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "departures"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));

    if (v23
      && (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "departureDate")), v24, !v24))
    {
      v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v23, "tripIdentifier")));
      selectedTripIdentifier = v9->_selectedTripIdentifier;
      v9->_selectedTripIdentifier = (NSNumber *)v28;

    }
    else
    {
      v25 = [TransitSchedulesDepartureDataProvider alloc];
      v35 = v8;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
      v27 = -[TransitSchedulesDepartureDataProvider initWithTransitMapItem:selectedDepartureSequence:departureSequences:timeZone:initialScheduleDate:](v25, "initWithTransitMapItem:selectedDepartureSequence:departureSequences:timeZone:initialScheduleDate:", v7, v8, v26, v9->_boardingStopTimeZone, v9->_scheduleWindowStartDate);
      -[TransitSchedulesViewController setDepartureDataProvider:](v9, "setDepartureDataProvider:", v27);

      -[TransitSchedulesDepartureDataProvider setRequestAllDirections:](v9->_departureDataProvider, "setRequestAllDirections:", v9->_requestAllDirections);
      -[TransitSchedulesDepartureDataProvider setDelegate:](v9->_departureDataProvider, "setDelegate:", v9);
    }
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_transitAttribution"));
    attribution = v9->_attribution;
    v9->_attribution = (GEOTransitAttribution *)v30;

    v32 = -[TransitScheduleStopsTableViewDataSource initWithBoardingStopMuid:transitLine:referenceDate:]([TransitScheduleStopsTableViewDataSource alloc], "initWithBoardingStopMuid:transitLine:referenceDate:", v9->_boardingStopMuid, v9->_selectedTransitLine, v9->_referenceDate);
    stopsDataSource = v9->_stopsDataSource;
    v9->_stopsDataSource = v32;

  }
  return v9;
}

+ (id)validDeparturesInDepartureSequence:(id)a3 withReferenceDate:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "departures"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10035EEAC;
  v11[3] = &unk_1011B2A60;
  v12 = v5;
  v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v11));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v8));

  return v9;
}

- (TransitSchedulesViewController)initWithTransitRouteStep:(id)a3
{
  void *v3;
  id v5;
  TransitSchedulesViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  NSDate *v15;
  NSDate *selectedTripDepartureDate;
  uint64_t v17;
  GEOTransitLine *v18;
  uint64_t v19;
  NSData *routingParameters;
  void *v21;
  uint64_t v22;
  NSString *selectedTripVehicleNumber;
  void *v24;
  NSArray *v25;
  NSArray *incidents;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  NSString *boardingStopName;
  uint64_t v33;
  NSTimeZone *boardingStopTimeZone;
  id v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  GEOLocation *v41;
  GEOLocation *boardingStopLocation;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSDate *referenceDate;
  void *v49;
  TransitScheduleStopsTableViewDataSource *v50;
  id v51;
  uint64_t v52;
  TransitScheduleStopsTableViewDataSource *v53;
  void *v54;
  id v55;
  id transitLineIdentifier;
  uint64_t v57;
  GEOTransitLine *selectedTransitLine;
  uint64_t v59;
  TransitScheduleStopsTableViewDataSource *v60;
  TransitScheduleStopsTableViewDataSource *stopsDataSource;
  id v63;

  v5 = a3;
  v6 = -[TransitSchedulesViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextBoardingStep"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitStep"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scheduleInfo"));

    if (v9 && objc_msgSend(v9, "tripID") != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "tripID")));
      v12 = 0;
      v11 = 1;
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitVehicle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "tripMuid")));
      v11 = 0;
      v12 = 1;
    }
    objc_storeStrong((id *)&v6->_selectedTripIdentifier, v10);
    if (v12)
    {

    }
    if (v11)

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "staticDepartureDate"));
    v14 = v13;
    if (!v13)
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrivalTime"));
    objc_storeStrong((id *)&v6->_selectedTripDepartureDate, v14);
    if (!v13)

    v15 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowStartDate"));
    selectedTripDepartureDate = v15;
    if (!v15)
      selectedTripDepartureDate = v6->_selectedTripDepartureDate;
    objc_storeStrong((id *)&v6->_scheduleWindowStartDate, selectedTripDepartureDate);

    if (v9 && objc_msgSend(v9, "lineID") != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v6->_transitLineIdentifier = (unint64_t)objc_msgSend(v9, "lineID");
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitLine"));
      v55 = objc_msgSend(v54, "muid");
      transitLineIdentifier = (id)v6->_transitLineIdentifier;

      if (v55 == transitLineIdentifier)
      {
        v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitLine"));
        selectedTransitLine = v6->_selectedTransitLine;
        v6->_selectedTransitLine = (GEOTransitLine *)v57;

      }
    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitLine"));
      v18 = v6->_selectedTransitLine;
      v6->_selectedTransitLine = (GEOTransitLine *)v17;

      v6->_transitLineIdentifier = (unint64_t)-[GEOTransitLine muid](v6->_selectedTransitLine, "muid");
    }
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routingParameters"));
    routingParameters = v6->_routingParameters;
    v6->_routingParameters = (NSData *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitVehicle"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "vehicleNumber"));
    selectedTripVehicleNumber = v6->_selectedTripVehicleNumber;
    v6->_selectedTripVehicleNumber = (NSString *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitIncidents"));
    v25 = (NSArray *)objc_msgSend(v24, "copy");
    incidents = v6->_incidents;
    v6->_incidents = v25;

    v6->_isRoutingScheduleCard = 1;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v27, "setPresentedModally:", 1);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "originStop"));
    v6->_boardingStopMuid = (unint64_t)objc_msgSend(v28, "muid");
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "originStop"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "nameDisplayString"));
    v31 = (NSString *)objc_msgSend(v30, "copy");
    boardingStopName = v6->_boardingStopName;
    v6->_boardingStopName = v31;

    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "departureTimeZone"));
    boardingStopTimeZone = v6->_boardingStopTimeZone;
    v6->_boardingStopTimeZone = (NSTimeZone *)v33;

    v35 = objc_alloc((Class)GEOLocation);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "latLng"));
    objc_msgSend(v36, "lat");
    v38 = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "latLng"));
    objc_msgSend(v39, "lng");
    v41 = (GEOLocation *)objc_msgSend(v35, "initWithLatitude:longitude:", v38, v40);
    boardingStopLocation = v6->_boardingStopLocation;
    v6->_boardingStopLocation = v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextAlightingStep"));
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "destinationStop"));

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextAlightingStep"));
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "destinationHall"));

    v47 = objc_claimAutoreleasedReturnValue(+[MKTransitItemReferenceDateUpdater referenceDate](MKTransitItemReferenceDateUpdater, "referenceDate"));
    referenceDate = v6->_referenceDate;
    v6->_referenceDate = (NSDate *)v47;

    if (v44 | v46)
    {
      v63 = v5;
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "composedRoute"));
      v50 = (TransitScheduleStopsTableViewDataSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "getStationForHall:", v46));

      v51 = objc_msgSend((id)v44, "muid");
      if (v46)
        v52 = (uint64_t)objc_msgSend((id)v46, "muid");
      else
        v52 = 0x7FFFFFFFFFFFFFFFLL;
      if (v50)
        v59 = (uint64_t)-[TransitScheduleStopsTableViewDataSource muid](v50, "muid");
      else
        v59 = 0x7FFFFFFFFFFFFFFFLL;
      v60 = -[TransitScheduleStopsTableViewDataSource initWithBoardingStopMuid:alightStopMuid:alightHallMuid:alightStationMuid:transitLine:referenceDate:]([TransitScheduleStopsTableViewDataSource alloc], "initWithBoardingStopMuid:alightStopMuid:alightHallMuid:alightStationMuid:transitLine:referenceDate:", v6->_boardingStopMuid, v51, v52, v59, v6->_selectedTransitLine, v6->_referenceDate);
      stopsDataSource = v6->_stopsDataSource;
      v6->_stopsDataSource = v60;

      v5 = v63;
    }
    else
    {
      v53 = -[TransitScheduleStopsTableViewDataSource initWithBoardingStopMuid:transitLine:referenceDate:]([TransitScheduleStopsTableViewDataSource alloc], "initWithBoardingStopMuid:transitLine:referenceDate:", v6->_boardingStopMuid, v6->_selectedTransitLine, v6->_referenceDate);
      v50 = v6->_stopsDataSource;
      v6->_stopsDataSource = v53;
    }

  }
  return v6;
}

- (id)_collectionViewLayout
{
  _QWORD *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10035F58C;
  v7[3] = &unk_1011B2AB0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v3 = objc_retainBlock(v7);
  v4 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  objc_msgSend(v4, "setInterSectionSpacing:", 8.0);
  v5 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:configuration:", v3, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  ContainerHeaderView *v4;
  ContainerHeaderView *containerHeaderView;
  double v6;
  void *v7;
  TransitSchedulesHeaderView *v8;
  void *v9;
  TransitSchedulesHeaderView *v10;
  TransitSchedulesHeaderView *headerTitleView;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD *v25;
  void *v26;
  UICollectionViewDiffableDataSource *v27;
  UICollectionViewDiffableDataSource *dataSource;
  _QWORD *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  TransitSchedulesDepartureInfoProvider *v52;
  TransitSchedulesDepartureInfoProvider *departureInfoProvider;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD block[5];
  objc_super v85;
  const __CFString *v86;
  const __CFString *v87;
  _QWORD v88[4];
  _QWORD v89[4];

  v85.receiver = self;
  v85.super_class = (Class)TransitSchedulesViewController;
  -[ContaineeViewController viewDidLoad](&v85, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesDepartureView"));

  v4 = -[ContainerHeaderView initWithCardButtonType:]([ContainerHeaderView alloc], "initWithCardButtonType:", 0);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v4;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1148846080;
  -[ContainerHeaderView setContentCompressionResistancePriority:forAxis:](self->_containerHeaderView, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  -[ContainerHeaderView setDelegate:](self->_containerHeaderView, "setDelegate:", self);
  -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v7, "addSubview:", self->_containerHeaderView);

  v8 = [TransitSchedulesHeaderView alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTransitLine](self, "selectedTransitLine"));
  v10 = -[TransitSchedulesHeaderView initWithTransitLine:](v8, "initWithTransitLine:", v9);
  headerTitleView = self->_headerTitleView;
  self->_headerTitleView = v10;

  -[TransitSchedulesHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setTitleView:](self->_containerHeaderView, "setTitleView:", self->_headerTitleView);
  LODWORD(v12) = 1148846080;
  -[TransitSchedulesHeaderView setContentCompressionResistancePriority:forAxis:](self->_headerTitleView, "setContentCompressionResistancePriority:forAxis:", 1, v12);
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_containerHeaderView, "leadingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v79));
  v89[0] = v77;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_containerHeaderView, "trailingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "trailingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v71));
  v89[1] = v68;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_containerHeaderView, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v89[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_containerHeaderView, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
  v89[3] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController _collectionViewLayout](self, "_collectionViewLayout"));
  v22 = objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v83, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesDepartureCollectionView"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v22, "setDelegate:", self);
  objc_msgSend(v22, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v22, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v22, "setAllowsSelection:", 1);
  objc_msgSend(v22, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v22, "setPreservesSuperviewLayoutMargins:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v22, "setBackgroundColor:", v23);

  objc_msgSend(v22, "setContentInset:", 8.0, 0.0, 0.0, 0.0);
  v24 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v25 = sub_10046DA38(self);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (UICollectionViewDiffableDataSource *)objc_msgSend(v24, "initWithCollectionView:cellProvider:", v22, v26);
  dataSource = self->_dataSource;
  self->_dataSource = v27;

  v29 = sub_10046DBB0(self);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_dataSource, "setSupplementaryViewProvider:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v31, "addSubview:", v22);

  -[TransitSchedulesViewController setCollectionView:](self, "setCollectionView:", v22);
  +[TransitScheduleStopsTableViewDataSource registerCellsForCollectionView:](TransitScheduleStopsTableViewDataSource, "registerCellsForCollectionView:", v22);
  v32 = objc_opt_class(TransitStationLineScheduleSectionHeaderView);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[TransitStationLineScheduleSectionHeaderView identifier](TransitStationLineScheduleSectionHeaderView, "identifier"));
  objc_msgSend(v22, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v32, UICollectionElementKindSectionHeader, v33);

  v34 = objc_opt_class(TransitStationDatePickerHeaderView);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[TransitStationLineScheduleSectionHeaderView identifier](TransitStationDatePickerHeaderView, "identifier"));
  objc_msgSend(v22, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v34, UICollectionElementKindSectionHeader, v35);

  objc_msgSend(v22, "registerClass:forCellWithReuseIdentifier:", +[TransitSchedulesLineOptionsProvider cellClass](TransitSchedulesLineOptionsProvider, "cellClass"), CFSTR("TransitLineOptionsCellIdentifier"));
  objc_msgSend(v22, "registerClass:forCellWithReuseIdentifier:", +[TransitSchedulesDepartureInfoProvider cellClass](TransitSchedulesDepartureInfoProvider, "cellClass"), CFSTR("TransitLineDepartureInfoCellIdentifier"));
  objc_msgSend(v22, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(TransitAttributionSummaryCollectionViewCell), CFSTR("TransitAttributionCellIdentifier"));
  objc_msgSend(v22, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(TransitItemIncidentCollectionViewCell), CFSTR("IncidentsCellIdentifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureCellProvider](self, "departureCellProvider"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController collectionView](self, "collectionView"));
  objc_msgSend(v36, "registerCellsForCollectionView:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController headsignCellProvider](self, "headsignCellProvider"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController collectionView](self, "collectionView"));
  objc_msgSend(v38, "registerCellsForCollectionView:", v39);

  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "safeAreaLayoutGuide"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v74));
  v88[0] = v72;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "bottomAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v67));
  v88[1] = v66;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "safeAreaLayoutGuide"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v40));
  v88[2] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "safeAreaLayoutGuide"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v45));
  v88[3] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
  if (self->_departureDataProvider)
  {
    -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 3, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider departures](self->_departureDataProvider, "departures"));
    v50 = objc_msgSend(v49, "count");

    if (v50)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100360758;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  if (-[TransitSchedulesViewController hasIncidents](self, "hasIncidents"))
  {
    -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 4, v48);
    v87 = CFSTR("IncidentsCellIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v87, 1));
    objc_msgSend(v48, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v51, &off_10126CCD0);

  }
  if (-[TransitSchedulesViewController _shouldShowDepartureInfoSection](self, "_shouldShowDepartureInfoSection"))
  {
    v52 = -[TransitSchedulesDepartureInfoProvider initWithTransitLine:timeZone:referenceDate:]([TransitSchedulesDepartureInfoProvider alloc], "initWithTransitLine:timeZone:referenceDate:", self->_selectedTransitLine, self->_boardingStopTimeZone, self->_scheduleWindowStartDate);
    departureInfoProvider = self->_departureInfoProvider;
    self->_departureInfoProvider = v52;

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider selectedDepartureSequence](self->_departureDataProvider, "selectedDepartureSequence"));
    -[TransitSchedulesDepartureInfoProvider setDepartureSequence:](self->_departureInfoProvider, "setDepartureSequence:", v54);

    -[TransitSchedulesDepartureInfoProvider setDelegate:](self->_departureInfoProvider, "setDelegate:", self);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider identifiers](self->_departureInfoProvider, "identifiers"));
    if (objc_msgSend(v55, "count"))
    {
      -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 1, v48);
      objc_msgSend(v48, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v55, &off_10126CCE8);
    }

  }
  if (!self->_isRoutingScheduleCard)
  {
    -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 7, v48);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesLineOptionsProvider identifiers](self->_lineOptionsProvider, "identifiers"));
    objc_msgSend(v48, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v56, &off_10126CD00);

    v57 = -[TransitSchedulesViewController fetchSelectedTransitLineItem](self, "fetchSelectedTransitLineItem");
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitAttribution _providerNames](self->_attribution, "_providerNames"));
  v59 = objc_msgSend(v58, "count");

  if (v59)
  {
    -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 8, v48);
    v86 = CFSTR("AttributionCellIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1));
    objc_msgSend(v48, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v60, &off_10126CD18);

  }
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v48, 0);
  if (-[TransitSchedulesViewController hasSelectedTrip](self, "hasSelectedTrip")
    && !-[TransitScheduleStopsTableViewDataSource hasStops](self->_stopsDataSource, "hasStops"))
  {
    -[TransitSchedulesViewController fetchNewScheduleData](self, "fetchNewScheduleData");
  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  self->_initialViewMode = (int64_t)objc_msgSend(v61, "displayedViewMode");

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  self->_initialMapApplicationState = objc_msgSend(v62, "mapApplicationState");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController mapItemUpdater](self, "mapItemUpdater"));
  objc_msgSend(v5, "setActive:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController vehicleUpdater](self, "vehicleUpdater"));
  objc_msgSend(v6, "setActive:", 1);

  -[TransitSchedulesViewController _startObservingDepartureProvider](self, "_startObservingDepartureProvider");
  if (!-[TransitSchedulesViewController hasSelectedTrip](self, "hasSelectedTrip")
    && -[TransitSchedulesViewController _numberOfDeparturesInSnapshot](self, "_numberOfDeparturesInSnapshot") >= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
    objc_msgSend(v7, "selectNextIncomingDeparture");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTripRoute](self, "selectedTripRoute"));

  if (v8)
    -[TransitSchedulesViewController showRouteOnMap](self, "showRouteOnMap");
  v9.receiver = self;
  v9.super_class = (Class)TransitSchedulesViewController;
  -[ContaineeViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController vehicleUpdater](self, "vehicleUpdater"));
  objc_msgSend(v5, "setActive:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController mapItemUpdater](self, "mapItemUpdater"));
  objc_msgSend(v6, "setActive:", 0);

  -[TransitSchedulesViewController _stopObservingDepartureProvider](self, "_stopObservingDepartureProvider");
  -[TransitSchedulesViewController restoreInitialMapState](self, "restoreInitialMapState");
  v7.receiver = self;
  v7.super_class = (Class)TransitSchedulesViewController;
  -[ContaineeViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  TransitSchedulesDepartureDataProvider *v11;
  id v12;
  NSString *v13;
  void *v14;
  unsigned int v15;
  objc_super v16;

  v10 = a3;
  v11 = (TransitSchedulesDepartureDataProvider *)a4;
  v12 = a5;
  if (off_1014A72C8 == a6)
  {
    if (self->_departureDataProvider == v11)
    {
      v13 = NSStringFromSelector("remoteNetworkState");
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = objc_msgSend(v10, "isEqualToString:", v14);

      if (v15)
        -[TransitSchedulesViewController updateDeparturesSectionForNetworkState:](self, "updateDeparturesSectionForNetworkState:", -[TransitSchedulesDepartureDataProvider remoteNetworkState](self->_departureDataProvider, "remoteNetworkState"));
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)TransitSchedulesViewController;
    -[TransitSchedulesViewController observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)_startObservingDepartureProvider
{
  NSString *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
  v3 = NSStringFromSelector("remoteNetworkState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, v4, 4, off_1014A72C8);

}

- (void)_stopObservingDepartureProvider
{
  NSString *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
  v3 = NSStringFromSelector("remoteNetworkState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, v4);

}

- (BOOL)hasIncidents
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController incidents](self, "incidents"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)fetchSelectedTransitLineItem
{
  GEOTransitLineItem *selectedTransitLineItem;
  void *v4;
  void *v5;
  IncompleteTransitLineItem *v6;
  GEOTransitLineItem *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  void *v18;

  selectedTransitLineItem = self->_selectedTransitLineItem;
  if (selectedTransitLineItem && !sub_1002589D4(selectedTransitLineItem))
    return self->_selectedTransitLineItem;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTransitLine](self, "selectedTransitLine"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTransitLine](self, "selectedTransitLine"));
    v6 = -[IncompleteTransitLineItem initWithTransitLine:]([IncompleteTransitLineItem alloc], "initWithTransitLine:", v5);
    v7 = self->_selectedTransitLineItem;
    self->_selectedTransitLineItem = (GEOTransitLineItem *)v6;

    if (sub_1002589D4(self->_selectedTransitLineItem))
    {
      v8 = MKMapItemIdentifierFromGEOTransitLine(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v18 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ticketForTransitLines:traits:", v11, 0));

      objc_initWeak(&location, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100360D10;
      v14[3] = &unk_1011B2AD8;
      v15 = v5;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v12, "submitWithHandler:networkActivity:", v14, 0);
      objc_destroyWeak(&v16);

      objc_destroyWeak(&location);
    }

    return self->_selectedTransitLineItem;
  }
  return 0;
}

- (void)updateDeparturesSectionForNetworkState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;

  if (!self->_departureDataProvider)
    self->_initialRoutingSchedulesNetworkRequestState = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
  v6 = v5;
  if (a3 - 2 >= 3)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        -[TransitSchedulesViewController _removeSection:toSnapshot:](self, "_removeSection:toSnapshot:", 1, v5);
        if (objc_msgSend(v6, "indexOfSectionIdentifier:", &off_10126CD30) == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          -[TransitSchedulesViewController _clearSection:inSnapshot:](self, "_clearSection:inSnapshot:", 3, v6);
          objc_msgSend(v6, "deleteSectionsWithIdentifiers:", &off_1012730B0);
          -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 3, v6);
        }
      }
    }
    else
    {
      -[TransitSchedulesViewController _removeSection:toSnapshot:](self, "_removeSection:toSnapshot:", 3, v5);
      -[TransitSchedulesViewController _removeSection:toSnapshot:](self, "_removeSection:toSnapshot:", 2, v6);
    }
  }
  else
  {
    if (objc_msgSend(v5, "indexOfSectionIdentifier:", &off_10126CD48) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "deleteSectionsWithIdentifiers:", &off_1012730C8);
      -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 2, v6);
      v9 = CFSTR("DeparturesNetworkStateViewCellIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, &off_10126CD48);
    }
    else
    {
      v8 = CFSTR("DeparturesNetworkStateViewCellIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
      objc_msgSend(v6, "reloadItemsWithIdentifiers:", v7);
    }

  }
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v6, 0);

}

- (void)updateStopsSectionForNetworkState:(unint64_t)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;

  if (-[TransitScheduleStopsTableViewDataSource remoteNetworkState](self->_stopsDataSource, "remoteNetworkState") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
    -[TransitScheduleStopsTableViewDataSource setRemoteNetworkState:](self->_stopsDataSource, "setRemoteNetworkState:", a3);
    if (a3 - 2 >= 3)
    {
      if (a3 == 1 && objc_msgSend(v5, "indexOfSectionIdentifier:", &off_10126CD78) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "deleteSectionsWithIdentifiers:", &off_1012730E0);
        -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 6, v5);
      }
    }
    else
    {
      if (objc_msgSend(v5, "indexOfSectionIdentifier:", &off_10126CD60) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "deleteSectionsWithIdentifiers:", &off_1012730F8);
        -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 5, v5);
        v8 = CFSTR("StopsNetworkStateViewCellIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
        objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v6, &off_10126CD60);
      }
      else
      {
        v7 = CFSTR("StopsNetworkStateViewCellIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
        objc_msgSend(v5, "reloadItemsWithIdentifiers:", v6);
      }

    }
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v5, 1);

  }
}

- (void)setIncidents:(id)a3
{
  NSArray *v4;
  NSArray *incidents;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  _BOOL8 v10;
  void *v11;
  const __CFString *v12;

  v4 = (NSArray *)a3;
  incidents = self->_incidents;
  if (incidents != v4 && (-[NSArray isEqual:](incidents, "isEqual:", v4) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
    -[TransitSchedulesViewController _removeSection:toSnapshot:](self, "_removeSection:toSnapshot:", 4, v6);
    if (-[NSArray count](v4, "count"))
    {
      -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 4, v6);
      v12 = CFSTR("IncidentsCellIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, &off_10126CCD0);

    }
    v8 = (NSArray *)-[NSArray copy](v4, "copy");
    v9 = self->_incidents;
    self->_incidents = v8;

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v6, 1);
    v10 = -[NSArray count](self->_incidents, "count") != 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    objc_msgSend(v11, "setPlaceCardTransitAdvisoryBanner:", v10);

  }
}

- (void)setDepartureDataProvider:(id)a3
{
  TransitSchedulesDepartureDataProvider *v4;
  TransitSchedulesDepartureDataProvider *departureDataProvider;

  v4 = (TransitSchedulesDepartureDataProvider *)a3;
  departureDataProvider = self->_departureDataProvider;
  if (departureDataProvider)
  {
    -[TransitSchedulesViewController _stopObservingDepartureProvider](self, "_stopObservingDepartureProvider");
    departureDataProvider = self->_departureDataProvider;
  }
  self->_departureDataProvider = v4;

  if (v4)
    -[TransitSchedulesViewController _startObservingDepartureProvider](self, "_startObservingDepartureProvider");
}

- (TransitSchedulesDepartureViewProviding)departureCellProvider
{
  TransitSchedulesDepartureViewProviding *departureCellProvider;
  TransitSchedulesDeparturePickerProvider *v4;
  TransitSchedulesDepartureViewProviding *v5;

  departureCellProvider = self->_departureCellProvider;
  if (!departureCellProvider)
  {
    if (sub_1002A8AA0(self) == 5)
    {
      v4 = objc_alloc_init(TransitSchedulesDeparturePickerProvider);
      -[TransitSchedulesDeparturePickerProvider setDelegate:](v4, "setDelegate:", self);
    }
    else
    {
      v4 = objc_alloc_init(TransitSchedulesDepartureCellProvider);
    }
    v5 = self->_departureCellProvider;
    self->_departureCellProvider = (TransitSchedulesDepartureViewProviding *)v4;

    departureCellProvider = self->_departureCellProvider;
  }
  return departureCellProvider;
}

- (TransitSchedulesHeadsignViewProviding)headsignCellProvider
{
  TransitSchedulesHeadsignViewProviding *headsignCellProvider;
  TransitSchedulesHeadsignPickerProvider *v4;
  TransitSchedulesHeadsignViewProviding *v5;

  headsignCellProvider = self->_headsignCellProvider;
  if (!headsignCellProvider)
  {
    if (sub_1002A8AA0(self) == 5)
    {
      v4 = objc_alloc_init(TransitSchedulesHeadsignPickerProvider);
      -[TransitSchedulesHeadsignPickerProvider setDelegate:](v4, "setDelegate:", self);
    }
    else
    {
      v4 = objc_alloc_init(TransitSchedulesHeadsignCellProvider);
    }
    v5 = self->_headsignCellProvider;
    self->_headsignCellProvider = (TransitSchedulesHeadsignViewProviding *)v4;

    headsignCellProvider = self->_headsignCellProvider;
  }
  return headsignCellProvider;
}

- (void)_rebuildStopsSection
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
  -[TransitSchedulesViewController _clearSection:inSnapshot:](self, "_clearSection:inSnapshot:", 6, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource stopIdentifiers](self->_stopsDataSource, "stopIdentifiers"));
  objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v3, &off_10126CD78);
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v4, 1);
  -[TransitSchedulesViewController _updateStopsSectionHeader](self, "_updateStopsSectionHeader");

}

- (void)setBoardingStationMapItem:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  MKTransitMapItemUpdater *v9;
  MKTransitMapItemUpdater *mapItemUpdater;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  GEOTransitAttribution *v27;
  GEOTransitAttribution *attribution;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  const __CFString *v33;

  v5 = a3;
  if (!self->_mapItemUpdater)
  {
    v6 = objc_alloc((Class)MKMapItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
    v8 = objc_msgSend(v6, "initWithGeoMapItem:isPlaceHolderPlace:", v7, 0);

    v9 = (MKTransitMapItemUpdater *)objc_msgSend(objc_alloc((Class)MKTransitMapItemUpdater), "initWithMapItem:delegate:", v8, self);
    mapItemUpdater = self->_mapItemUpdater;
    self->_mapItemUpdater = v9;

    if (-[TransitSchedulesViewController isViewLoaded](self, "isViewLoaded"))
      -[MKTransitMapItemUpdater setActive:](self->_mapItemUpdater, "setActive:", 1);

  }
  if (!self->_attribution)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_transitAttribution"));

    if (v26)
    {
      v27 = (GEOTransitAttribution *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_transitAttribution"));
      attribution = self->_attribution;
      self->_attribution = v27;

      if (-[TransitSchedulesViewController isViewLoaded](self, "isViewLoaded"))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
        -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", 8, v29);
        v33 = CFSTR("AttributionCellIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
        objc_msgSend(v29, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v30, &off_10126CD18);

        -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v29, 0);
      }
    }
  }
  objc_storeStrong((id *)&self->_boardingStopMapItem, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_transitInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController headerTitleView](self, "headerTitleView"));
    objc_msgSend(v15, "setTitle:", v14);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subtitle"));
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subtitle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController headerTitleView](self, "headerTitleView"));
    objc_msgSend(v19, "setSubtitle:", v18);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lines"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100361A08;
  v32[3] = &unk_1011B2B00;
  v32[4] = self;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v32);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transitTripStops"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "composedRoute"));
    -[TransitSchedulesViewController setSelectedTripRoute:](self, "setSelectedTripRoute:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_transitInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "incidents"));
    -[TransitSchedulesViewController setIncidents:](self, "setIncidents:", v25);

    -[TransitSchedulesViewController _updateVehicleUpdater](self, "_updateVehicleUpdater");
    if (objc_msgSend(v21, "count"))
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100361AC4;
      v31[3] = &unk_1011B0F28;
      v31[4] = self;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v31);
      -[TransitScheduleStopsTableViewDataSource buildTransitTripStopItemsWithTransitStops:boardingStopDepartureDate:maintainingCollapsedState:](self->_stopsDataSource, "buildTransitTripStopItemsWithTransitStops:boardingStopDepartureDate:maintainingCollapsedState:", v21, self->_selectedTripDepartureDate, 0);
      if (-[TransitSchedulesViewController isViewLoaded](self, "isViewLoaded"))
        -[TransitSchedulesViewController _rebuildStopsSection](self, "_rebuildStopsSection");
    }

  }
}

- (void)setSelectedTripVehicleNumber:(id)a3
{
  NSString *v4;
  NSString *selectedTripVehicleNumber;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[NSString isEqual:](self->_selectedTripVehicleNumber, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    selectedTripVehicleNumber = self->_selectedTripVehicleNumber;
    self->_selectedTripVehicleNumber = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController _headerViewForSectionType:](self, "_headerViewForSectionType:", 6));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController titleForStopsHeader](self, "titleForStopsHeader"));
    objc_msgSend(v6, "setTitle:", v7);

  }
}

- (id)_headerViewForSectionType:(unint64_t)a3
{
  int64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = -[TransitSchedulesViewController _sectionIndexForSectionType:](self, "_sectionIndexForSectionType:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView supplementaryViewForElementKind:atIndexPath:](self->_collectionView, "supplementaryViewForElementKind:atIndexPath:", UICollectionElementKindSectionHeader, v6));
    v8 = objc_opt_class(TransitStationLineScheduleSectionHeaderView);
    v5 = 0;
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      v5 = v7;

  }
  return v5;
}

- (id)titleForStopsHeader
{
  NSUInteger v3;
  unsigned int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;

  v3 = -[NSString length](self->_selectedTripVehicleNumber, "length");
  v4 = -[GEOTransitLine isBus](self->_selectedTransitLine, "isBus");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v3)
  {
    if (v4)
      v7 = CFSTR("[Transit Schedules] (Bus) Stops for <vehicle number>");
    else
      v7 = CFSTR("[Transit Schedules] (Non-Bus) Stops for <vehicle number>");
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, self->_selectedTripVehicleNumber));
    v6 = (void *)v8;
  }
  else
  {
    if ((v4 & 1) != 0)
      v10 = CFSTR("[Transit Schedules] (Bus) Stops");
    else
      v10 = CFSTR("[Transit Schedules] (Non-Bus) Stops");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
  }

  return v9;
}

- (id)_startEndDatesForOperatingHoursTimeRanges:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate", (_QWORD)v15));
        objc_msgSend(v4, "addObject:", v11);

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = objc_msgSend(v4, "copy");
  return v13;
}

- (void)setSelectedTransitLine:(id)a3
{
  GEOTransitLine **p_selectedTransitLine;
  id v6;

  p_selectedTransitLine = &self->_selectedTransitLine;
  v6 = a3;
  if ((-[GEOTransitLine isEqual:](*p_selectedTransitLine, "isEqual:") & 1) == 0)
  {
    -[TransitSchedulesViewController _checkIfPinnedLine](self, "_checkIfPinnedLine");
    objc_storeStrong((id *)&self->_selectedTransitLine, a3);
    -[TransitSchedulesDepartureInfoProvider setTransitLine:](self->_departureInfoProvider, "setTransitLine:", *p_selectedTransitLine);
    -[TransitScheduleStopsTableViewDataSource setTransitLine:](self->_stopsDataSource, "setTransitLine:", *p_selectedTransitLine);
  }

}

- (BOOL)hasSelectedTrip
{
  return self->_selectedTripIdentifier != 0;
}

- (unint64_t)selectedTripIdentifier
{
  return -[NSNumber unsignedIntegerValue](self->_selectedTripIdentifier, "unsignedIntegerValue");
}

- (unint64_t)_departuresHeaderStyle
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTransitLine](self, "selectedTransitLine"));
  v4 = objc_msgSend(v3, "departureTimeDisplayStyle");

  if (v4 == (id)4 || v4 == (id)2)
    return 2 * !self->_isRoutingScheduleCard;
  else
    return 1;
}

- (id)traits
{
  void *v3;
  NSDate *v4;
  NSDate *scheduleWindowStartDate;
  NSDate *v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduleWindowStartDate"));
  scheduleWindowStartDate = v4;
  if (!v4)
    scheduleWindowStartDate = self->_scheduleWindowStartDate;
  v6 = scheduleWindowStartDate;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransitSchedulesDepartureDataProvider serviceTraitsForScheduleDate:timeZone:](TransitSchedulesDepartureDataProvider, "serviceTraitsForScheduleDate:timeZone:", v6, self->_boardingStopTimeZone));
  if (-[TransitSchedulesViewController hasSelectedTrip](self, "hasSelectedTrip"))
  {
    v8 = objc_alloc_init((Class)GEOTraitsTransitScheduleModeFilter);
    v9 = objc_alloc_init((Class)GEOTraitsTransitScheduleTimeRange);
    objc_msgSend(v8, "setTimeRange:", v9);

    -[NSDate timeIntervalSinceReferenceDate](self->_scheduleWindowStartDate, "timeIntervalSinceReferenceDate");
    v11 = v10 + -1.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeRange"));
    objc_msgSend(v12, "setStartTime:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeRange"));
    objc_msgSend(v13, "setDuration:", 2.0);

    v14 = objc_alloc_init((Class)GEOTraitsTransitScheduleFilter);
    objc_msgSend(v14, "setHighFrequencyFilter:", v8);
    objc_msgSend(v14, "setLowFrequencyFilter:", v8);
    objc_msgSend(v7, "setTransitTripStopTimeFilter:", v14);

  }
  return v7;
}

- (BOOL)isNetworkError:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if ((objc_msgSend(v4, "isEqual:", kCFErrorDomainCFNetwork) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v5 = objc_msgSend(v6, "isEqual:", NSURLErrorDomain);

  }
  return v5;
}

- (void)fetchNewScheduleData
{
  void *boardingStopMuid;
  void *transitLineIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10[4];
  id location;

  boardingStopMuid = (void *)self->_boardingStopMuid;
  transitLineIdentifier = (void *)self->_transitLineIdentifier;
  v5 = -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController traits](self, "traits"));
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ticketForTransitScheduleAtStation:line:referenceTripID:includeAllDirectionNames:routingParameters:traits:", boardingStopMuid, transitLineIdentifier, v5, self->_requestAllDirections, self->_routingParameters, v6));

  if (!self->_departureDataProvider)
    -[TransitSchedulesViewController updateDeparturesSectionForNetworkState:](self, "updateDeparturesSectionForNetworkState:", 2);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003623E4;
  v9[3] = &unk_1011B2B50;
  objc_copyWeak(v10, &location);
  v10[2] = transitLineIdentifier;
  v10[3] = v5;
  v10[1] = boardingStopMuid;
  v9[4] = self;
  objc_msgSend(v8, "submitWithHandler:networkActivity:", v9, 0);
  objc_destroyWeak(v10);

  objc_destroyWeak(&location);
}

- (void)processUpdatedDepartureSequencesFromMapItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TransitSchedulesDepartureInfoProvider *departureInfoProvider;
  TransitSchedulesDepartureDataProvider *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_transitInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "departureSequences"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "processDeparturesFromDepartureSequences:animatingDifferences:", v6, 0);

    goto LABEL_17;
  }
  if (!objc_msgSend(v6, "count"))
  {
    -[TransitSchedulesViewController updateDeparturesSectionForNetworkState:](self, "updateDeparturesSectionForNetworkState:", 0);
    goto LABEL_17;
  }
  if (!-[TransitSchedulesViewController hasSelectedTrip](self, "hasSelectedTrip"))
    goto LABEL_9;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransitSchedulesDepartureDataProvider departureSequenceContainingTripIdentifier:departureSequences:](TransitSchedulesDepartureDataProvider, "departureSequenceContainingTripIdentifier:departureSequences:", -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier"), v6));
  if (!v9)
  {
    if (objc_msgSend(v6, "count") == (id)1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      goto LABEL_10;
    }
LABEL_9:
    v9 = 0;
  }
LABEL_10:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "departures"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "departureDate"));

  departureInfoProvider = self->_departureInfoProvider;
  if (v12)
  {
    -[TransitSchedulesDepartureInfoProvider setDepartureSequence:](self->_departureInfoProvider, "setDepartureSequence:", v9);
    v14 = -[TransitSchedulesDepartureDataProvider initWithTransitMapItem:selectedDepartureSequence:departureSequences:timeZone:initialScheduleDate:]([TransitSchedulesDepartureDataProvider alloc], "initWithTransitMapItem:selectedDepartureSequence:departureSequences:timeZone:initialScheduleDate:", v16, v9, v6, self->_boardingStopTimeZone, self->_scheduleWindowStartDate);
    -[TransitSchedulesViewController setDepartureDataProvider:](self, "setDepartureDataProvider:", v14);
    -[TransitSchedulesDepartureDataProvider setRequestAllDirections:](v14, "setRequestAllDirections:", self->_requestAllDirections);
    -[TransitSchedulesDepartureDataProvider setDelegate:](v14, "setDelegate:", self);
    -[TransitSchedulesViewController selectDeparture](self, "selectDeparture");
  }
  else
  {
    if (v9)
    {
      -[TransitSchedulesDepartureInfoProvider setDepartureSequence:](self->_departureInfoProvider, "setDepartureSequence:", v9);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      -[TransitSchedulesDepartureInfoProvider setDepartureSequence:](departureInfoProvider, "setDepartureSequence:", v15);

    }
    v14 = 0;
  }
  -[TransitSchedulesViewController updateDeparturesSectionForNetworkState:](self, "updateDeparturesSectionForNetworkState:", -[TransitSchedulesDepartureDataProvider remoteNetworkState](v14, "remoteNetworkState"));

LABEL_17:
}

- (void)selectDeparture
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  if (-[TransitSchedulesViewController _numberOfDeparturesInSnapshot](self, "_numberOfDeparturesInSnapshot"))
  {
    if (!-[TransitSchedulesViewController hasSelectedTrip](self, "hasSelectedTrip")
      || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider")),
          v4 = objc_msgSend(v3, "selectDepartureWithTripIdentifier:", -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier")), v3, (v4 & 1) == 0))
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
      objc_msgSend(v5, "selectNextIncomingDeparture");

    }
  }
}

- (void)loadSelectedTripDetails
{
  void *boardingStopMuid;
  void *transitLineIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10[4];
  id location;

  objc_initWeak(&location, self);
  -[TransitScheduleStopsTableViewDataSource removeAllStops](self->_stopsDataSource, "removeAllStops");
  -[TransitSchedulesViewController updateStopsSectionForNetworkState:](self, "updateStopsSectionForNetworkState:", 2);
  -[TransitSchedulesViewController _updateVehicleUpdater](self, "_updateVehicleUpdater");
  boardingStopMuid = (void *)self->_boardingStopMuid;
  transitLineIdentifier = (void *)self->_transitLineIdentifier;
  v5 = -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController traits](self, "traits"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ticketForTransitTripDetailsAtStation:line:referenceTripID:includeAllDirectionNames:routingParameters:traits:", boardingStopMuid, transitLineIdentifier, v5, self->_requestAllDirections, self->_routingParameters, v6));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100362BD4;
  v9[3] = &unk_1011B2BA0;
  objc_copyWeak(v10, &location);
  v10[1] = boardingStopMuid;
  v10[2] = transitLineIdentifier;
  v10[3] = v5;
  objc_msgSend(v8, "submitWithHandler:networkActivity:", v9, 0);
  objc_destroyWeak(v10);

  objc_destroyWeak(&location);
}

- (BOOL)shouldShowChangeDateButton
{
  return !self->_isRoutingScheduleCard;
}

- (void)setSelectedTripRoute:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[GEOComposedRoute isEqual:](self->_selectedTripRoute, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedTripRoute, a3);
    -[TransitSchedulesViewController showRouteOnMap](self, "showRouteOnMap");
  }

}

- (void)setScheduleWindowStartDate:(id)a3
{
  NSDate *v4;
  void *v5;
  NSDate *scheduleWindowStartDate;

  v4 = (NSDate *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
  objc_msgSend(v5, "setScheduleWindowStartDate:", v4);

  -[TransitSchedulesDepartureInfoProvider setDate:](self->_departureInfoProvider, "setDate:", v4);
  scheduleWindowStartDate = self->_scheduleWindowStartDate;
  self->_scheduleWindowStartDate = v4;

}

- (void)changedDate:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_opt_class(UIDatePicker);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
    -[TransitSchedulesViewController setScheduleWindowStartDate:](self, "setScheduleWindowStartDate:", v5);

    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 7015, -[TransitSchedulesViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
  }

}

- (void)changeDate
{
  void *v3;
  void *v4;
  void *v5;
  RoutePlanningTimingViewController *v6;
  void *v7;
  RoutePlanningTimingViewController *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeZone"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduleWindowStartDate"));

  v6 = [RoutePlanningTimingViewController alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithDepartureDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithDepartureDate:departureTimeZone:arrivalTimeZone:", v5, v10, 0));
  v8 = -[RoutePlanningTimingViewController initWithCurrentTiming:shouldShowArriveBy:pickerDelegate:](v6, "initWithCurrentTiming:shouldShowArriveBy:pickerDelegate:", v7, 0, self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 7015, -[TransitSchedulesViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
}

- (void)showRouteOnMap
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTripRoute](self, "selectedTripRoute"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v5 = objc_msgSend(v4, "displayedViewMode");

    if (v5 != (id)3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v6, "updateViewMode:animated:", 3, 1);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v8 = objc_msgSend(v7, "mapApplicationState");

    if (v8 != 7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v9, "updateMapApplicationState:", 7);

    }
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController transitSchedulesDelegate](self, "transitSchedulesDelegate"));
  objc_msgSend(v10, "transitSchedulesViewControllerWantsToUpdateRouteAnnotations:", self);

}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTripRoute](self, "selectedTripRoute"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTripRoute](self, "selectedTripRoute"));
    v10 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    objc_msgSend(v4, "setRoutes:", v7);

  }
  else
  {
    objc_msgSend(v4, "setRoutes:", 0);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController lastReceivedVehiclePositions](self, "lastReceivedVehiclePositions"));
  objc_msgSend(v4, "setTransitVehiclePositions:", v8);

  return 1;
}

- (int64_t)_numberOfDeparturesInSnapshot
{
  void *v3;
  id v4;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
  v4 = objc_msgSend(v3, "indexOfSectionIdentifier:", &off_10126CD30);

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
  v7 = objc_msgSend(v6, "numberOfItemsInSection:", &off_10126CD30);

  return (int64_t)v7;
}

- (void)restoreInitialMapState
{
  void *v3;
  unsigned int v4;
  int64_t initialViewMode;
  void *v6;
  id v7;
  void *v8;
  int initialMapApplicationState;
  void *v10;
  unsigned int v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  if (objc_msgSend(v12, "displayedViewMode") != (id)3)
    goto LABEL_8;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "mapApplicationState");

  if (v4 == 7)
  {
    initialViewMode = self->_initialViewMode;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v7 = objc_msgSend(v6, "displayedViewMode");

    if ((id)initialViewMode != v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v8, "updateViewMode:animated:", self->_initialViewMode, 1);

    }
    initialMapApplicationState = self->_initialMapApplicationState;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v11 = objc_msgSend(v10, "mapApplicationState");

    if (initialMapApplicationState != v11)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v12, "updateMapApplicationState:", self->_initialMapApplicationState);
LABEL_8:

    }
  }
}

- (void)headerViewTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "wantsExpandLayout");

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  int *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id WeakRetained;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v6 = a4;
  v7 = &OBJC_IVAR___TransitSchedulesViewController__lineOptionsProvider;
  switch(-[TransitSchedulesViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v6, "section")))
  {
    case 0uLL:
      v8 = objc_msgSend(v6, "row");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
      objc_msgSend(v9, "selectDepartureSequenceAtIndex:", v8);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedDepartureSequence"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu, %@"), v8, v12));
      v14 = 49;
      goto LABEL_16;
    case 1uLL:
      v7 = &OBJC_IVAR___TransitSchedulesViewController__departureInfoProvider;
      goto LABEL_4;
    case 3uLL:
      v16 = objc_msgSend(v6, "row");
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
      v18 = objc_msgSend(v17, "selectDepartureAtIndex:", v16);

      goto LABEL_17;
    case 4uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_transitIncidentCell);
      v20 = WeakRetained;
      if (WeakRetained)
        v21 = WeakRetained;
      else
        v21 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController collectionView:cellForItemAtIndexPath:itemIdentifier:](self, "collectionView:cellForItemAtIndexPath:itemIdentifier:", v29, v6, CFSTR("IncidentsCellIdentifier")));
      v25 = v21;

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController actionCoordinator](self, "actionCoordinator"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController incidents](self, "incidents"));
      objc_msgSend(v26, "viewController:openTransitIncidents:fromView:withUserInfo:", self, v27, v25, 0);
      v14 = 7008;
      goto LABEL_13;
    case 7uLL:
LABEL_4:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v6));
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v7), "selectedCellAtIndexPath:withIdentifier:", v6, v15);

      goto LABEL_5;
    case 8uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "activeTileGroup"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "attributions"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "url"));
      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v26));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController transitSchedulesDelegate](self, "transitSchedulesDelegate"));
        objc_msgSend(v28, "transitSchedulesViewController:wantsToOpenURL:", self, v27);

        v14 = 7021;
LABEL_13:

      }
      else
      {
        v14 = 7021;
      }

      -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", v6, 1);
      v13 = 0;
LABEL_16:
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v14, -[TransitSchedulesViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), v13);

      goto LABEL_17;
    default:
LABEL_5:
      -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", v6, 1);
LABEL_17:

      return;
  }
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  unint64_t v5;
  BOOL result;
  uint64_t v7;

  v5 = -[TransitSchedulesViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(a4, "section", a3));
  result = 1;
  if (v5 <= 9)
  {
    if (((1 << v5) & 0x264) != 0)
      return 0;
    if (v5 == 1)
    {
      v7 = 280;
      return _objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v7), "allowsCellSelection");
    }
    if (v5 == 7)
    {
      v7 = 296;
      return _objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v7), "allowsCellSelection");
    }
  }
  return result;
}

- (void)_updateStopsSectionHeader
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController _headerViewForSectionType:](self, "_headerViewForSectionType:", 6));
  -[TransitSchedulesViewController _updateStopsSectionHeader:](self, "_updateStopsSectionHeader:", v3);

}

- (void)_updateStopsSectionHeader:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[TransitScheduleStopsTableViewDataSource canShowMoreStops](self->_stopsDataSource, "canShowMoreStops"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] More"), CFSTR("localized string not found"), 0));

    objc_msgSend(v6, "addButtonWithText:buttonTarget:buttonAction:", v5, self, "_expandStopsSection:");
  }
  else
  {
    objc_msgSend(v6, "removeSecondaryText");
  }

}

- (void)_expandStopsSection:(id)a3
{
  -[TransitScheduleStopsTableViewDataSource expandTransitTripStops](self->_stopsDataSource, "expandTransitTripStops", a3);
  -[TransitSchedulesViewController _rebuildStopsSection](self, "_rebuildStopsSection");
  -[TransitSchedulesViewController _updateStopsSectionHeader](self, "_updateStopsSectionHeader");
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9040, -[TransitSchedulesViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
}

- (void)_addSection:(unint64_t)a3 toSnapshot:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *sectionIdentifiers;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  void *v21;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIdentifiers"));
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100363CD0;
  v13[3] = &unk_1011B2BC8;
  v15 = &v17;
  v16 = a3;
  v8 = v6;
  v14 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
  if (!*((_BYTE *)v18 + 24))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v21 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    objc_msgSend(v8, "appendSectionsWithIdentifiers:", v10);

  }
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionIdentifiers"));
  sectionIdentifiers = self->_sectionIdentifiers;
  self->_sectionIdentifiers = v11;

  _Block_object_dispose(&v17, 8);
}

- (void)_clearSection:(unint64_t)a3 inSnapshot:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v9 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  objc_msgSend(v6, "deleteSectionsWithIdentifiers:", v8);

  -[TransitSchedulesViewController _addSection:toSnapshot:](self, "_addSection:toSnapshot:", a3, v6);
}

- (void)_removeSection:(unint64_t)a3 toSnapshot:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *sectionIdentifiers;
  void *v11;

  v6 = a4;
  if (-[TransitSchedulesViewController _sectionIndexForSectionType:](self, "_sectionIndexForSectionType:", a3) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v6, "deleteSectionsWithIdentifiers:", v8);

    v9 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIdentifiers"));
    sectionIdentifiers = self->_sectionIdentifiers;
    self->_sectionIdentifiers = v9;

  }
}

- (void)departureDataProvider:(id)a3 updatedDepartures:(id)a4
{
  UICollectionViewDiffableDataSource *dataSource;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v18;

  dataSource = self->_dataSource;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](dataSource, "snapshot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureCellProvider](self, "departureCellProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifiersForDepartures:", v6));

  if (objc_msgSend(v9, "count"))
  {
    v10 = sub_1004325AC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = v9;
      v13 = v12;
      if (v12)
      {
        if (objc_msgSend(v12, "count"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", ")));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v13, v14));

        }
        else
        {
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v13));
        }
      }
      else
      {
        v15 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updating departures section with identifiers: %{public}@", buf, 0xCu);

    }
    -[TransitSchedulesViewController _clearSection:inSnapshot:](self, "_clearSection:inSnapshot:", 3, v7);
    objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v9, &off_10126CD30);
    objc_msgSend(v7, "reloadItemsWithIdentifiers:", v9);
  }
  else
  {
    -[TransitSchedulesViewController _removeSection:toSnapshot:](self, "_removeSection:toSnapshot:", 3, v7);
  }
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v7, 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003641D0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)departureDataProvider:(id)a3 selectedDepartureSequence:(id)a4 withIndex:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a5, -[TransitSchedulesViewController _sectionIndexForSectionType:](self, "_sectionIndexForSectionType:", 0)));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController headsignCellProvider](self, "headsignCellProvider"));
  objc_msgSend(v8, "collectionView:selectedHeadsignForDepartureSequence:atIndexPath:", self->_collectionView, v13, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayName"));
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController headerTitleView](self, "headerTitleView"));
    objc_msgSend(v12, "setSubtitle:", v11);

  }
}

- (BOOL)_shouldShowDepartureInfoSection
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTransitLine](self, "selectedTransitLine"));
  if (objc_msgSend(v3, "departureTimeDisplayStyle") == (id)3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider departures](self->_departureDataProvider, "departures"));
    v4 = objc_msgSend(v5, "count") == 0;

  }
  return v4;
}

- (BOOL)_hasHeadsignSection
{
  return -[TransitSchedulesViewController _sectionIndexForSectionType:](self, "_sectionIndexForSectionType:", 0) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)departureDataProvider:(id)a3 updatedDepartureSequences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  _QWORD v14[6];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController headsignCellProvider](self, "headsignCellProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifiersForDepartureSequences:", v5));

  v8 = -[TransitSchedulesViewController _hasHeadsignSection](self, "_hasHeadsignSection");
  v9 = objc_msgSend(v5, "count");

  if ((unint64_t)v9 >= 2 && objc_msgSend(v7, "count"))
  {
    if ((v8 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
      -[TransitSchedulesViewController _clearSection:inSnapshot:](self, "_clearSection:inSnapshot:", 0, v10);
      -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](self->_dataSource, "applySnapshotUsingReloadData:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
    -[TransitSchedulesViewController _clearSection:inSnapshot:](self, "_clearSection:inSnapshot:", 0, v11);
    objc_msgSend(v11, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, &off_10126CD90);
    v12 = -[TransitSchedulesDepartureDataProvider indexForSelectedDepartureSequence](self->_departureDataProvider, "indexForSelectedDepartureSequence");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10036453C;
    v14[3] = &unk_1011AD518;
    v14[4] = self;
    v14[5] = v12;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    goto LABEL_8;
  }
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
    -[TransitSchedulesViewController _removeSection:toSnapshot:](self, "_removeSection:toSnapshot:", 0, v11);
LABEL_8:
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v11, 1);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider selectedDepartureSequence](self->_departureDataProvider, "selectedDepartureSequence"));
  -[TransitSchedulesDepartureInfoProvider setDepartureSequence:](self->_departureInfoProvider, "setDepartureSequence:", v13);

}

- (void)departureDataProvider:(id)a3 selectedDeparture:(id)a4 withIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a5, -[TransitSchedulesViewController _sectionIndexForSectionType:](self, "_sectionIndexForSectionType:", 3)));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureCellProvider](self, "departureCellProvider"));
  objc_msgSend(v8, "collectionView:selectedDeparture:atIndexPath:", self->_collectionView, v7, v9);

  -[TransitSchedulesViewController setSelectedDeparture:](self, "setSelectedDeparture:", v7);
}

- (void)setSelectedDeparture:(id)a3
{
  id v4;
  NSDate *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  NSNumber *v11;
  NSNumber *selectedTripIdentifier;
  NSDate *v13;
  NSDate *selectedTripDepartureDate;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "tripIdentifier");
  if (v4 == (id)-[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier"))
  {
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scheduledDepartureDate"));
    v6 = v5 == self->_selectedTripDepartureDate;

  }
  else
  {
    v6 = 0;
  }
  v7 = !-[TransitScheduleStopsTableViewDataSource hasStops](self->_stopsDataSource, "hasStops")
    && (id)-[TransitScheduleStopsTableViewDataSource remoteNetworkState](self->_stopsDataSource, "remoteNetworkState") != (id)2;
  v8 = v15;
  if (!v6 || v7)
  {
    v9 = -[TransitSchedulesViewController hasSelectedTrip](self, "hasSelectedTrip");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "vehicleIdentifier"));
    -[TransitSchedulesViewController setSelectedTripVehicleNumber:](self, "setSelectedTripVehicleNumber:", v10);

    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "tripIdentifier")));
    selectedTripIdentifier = self->_selectedTripIdentifier;
    self->_selectedTripIdentifier = v11;

    v13 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scheduledDepartureDate"));
    selectedTripDepartureDate = self->_selectedTripDepartureDate;
    self->_selectedTripDepartureDate = v13;

    -[TransitSchedulesViewController _clearVehicles](self, "_clearVehicles");
    if (v9)
      -[TransitSchedulesViewController loadSelectedTripDetails](self, "loadSelectedTripDetails");
    else
      -[TransitSchedulesViewController fetchNewScheduleData](self, "fetchNewScheduleData");
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3074, -[TransitSchedulesViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
    v8 = v15;
  }

}

- (void)departureCellProvider:(id)a3 selectDeparture:(id)a4 withIndex:(unint64_t)a5
{
  id v7;
  int64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v7 = a4;
  v8 = -[TransitSchedulesViewController _sectionIndexForSectionType:](self, "_sectionIndexForSectionType:", 3);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (id)v8;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController collectionView](self, "collectionView", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathsForSelectedItems"));

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v16, "section") == v9)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController collectionView](self, "collectionView"));
            objc_msgSend(v17, "deselectItemAtIndexPath:animated:", v16, 0);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a5, v9));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController collectionView](self, "collectionView"));
    objc_msgSend(v19, "selectItemAtIndexPath:animated:scrollPosition:", v18, 0, 0);

    -[TransitSchedulesViewController setSelectedDeparture:](self, "setSelectedDeparture:", v7);
  }

}

- (void)handleDismissAction:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 34, -[TransitSchedulesViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
  v5.receiver = self;
  v5.super_class = (Class)TransitSchedulesViewController;
  -[ContaineeViewController handleDismissAction:](&v5, "handleDismissAction:", v4);

}

- (double)heightForLayout:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double result;

  if (a3 - 3 < 3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v4, "availableHeight");
    v6 = v5;

    return v6;
  }
  if (a3 != 2)
  {
    v6 = -1.0;
    if (a3 == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v7, "bottomSafeOffset");
      v9 = v8;
      -[ContaineeViewController headerHeight](self, "headerHeight");
      v6 = v9 + v10;

    }
    return v6;
  }
  sub_1005EC2E4();
  return result;
}

- (unint64_t)preferredPresentationStyle
{
  return 2;
}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  id v5;

  v5 = a4;
  -[TransitSchedulesViewController setReferenceDate:](self, "setReferenceDate:", v5);
  -[TransitScheduleStopsTableViewDataSource setReferenceDate:dataSource:](self->_stopsDataSource, "setReferenceDate:dataSource:", v5, self->_dataSource);

}

- (id)ticketForTransitMapItemUpdater:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unint64_t boardingStopMuid;
  unint64_t v8;
  _BOOL8 requestAllDirections;
  NSData *routingParameters;
  void *v11;
  void *v12;
  id v14;
  NSObject *v15;
  uint8_t v16[16];

  if (-[TransitSchedulesViewController hasSelectedTrip](self, "hasSelectedTrip", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTransitLine](self, "selectedTransitLine"));
    v5 = objc_msgSend(v4, "muid");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    boardingStopMuid = self->_boardingStopMuid;
    v8 = -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier");
    requestAllDirections = self->_requestAllDirections;
    routingParameters = self->_routingParameters;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController traits](self, "traits"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ticketForUpdatedTransitScheduleDetailsAtStation:line:referenceTripID:includeAllDirectionNames:routingParameters:traits:", boardingStopMuid, v5, v8, requestAllDirections, routingParameters, v11));

    return v12;
  }
  else
  {
    v14 = sub_1004325AC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Attempting to update the schedule card's mapItem, but there is no selected trip", v16, 2u);
    }

    return 0;
  }
}

- (void)transitMapItemUpdater:(id)a3 updatedMapItem:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  unint64_t v27;
  id v28;
  NSObject *v29;
  unint64_t v30;
  int v31;
  unint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unint64_t v36;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    v9 = sub_1004325AC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v31 = 134218242;
      v32 = -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier");
      v33 = 2112;
      v34 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "The service encountered an error while updating trip id %llu. Error %@", (uint8_t *)&v31, 0x16u);
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_transitInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "departureSequences"));
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[TransitSchedulesViewController processUpdatedDepartureSequencesFromMapItem:](self, "processUpdatedDepartureSequencesFromMapItem:", v7);
    }
    else
    {
      v14 = sub_1004325AC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v31 = 134217984;
        v32 = -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "The service failed to return any departures for the requested trip id %llu while updating", (uint8_t *)&v31, 0xCu);
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_transitInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "transitTripStops"));
    v10 = objc_msgSend(v17, "copy");

    if (-[NSObject count](v10, "count"))
    {
      -[TransitSchedulesViewController updateStopsSectionForNetworkState:](self, "updateStopsSectionForNetworkState:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource stopIdentifiers](self->_stopsDataSource, "stopIdentifiers"));
      v19 = objc_msgSend(v18, "count");

      -[TransitScheduleStopsTableViewDataSource buildTransitTripStopItemsWithTransitStops:boardingStopDepartureDate:maintainingCollapsedState:](self->_stopsDataSource, "buildTransitTripStopItemsWithTransitStops:boardingStopDepartureDate:maintainingCollapsedState:", v10, self->_selectedTripDepartureDate, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource stopIdentifiers](self->_stopsDataSource, "stopIdentifiers"));
      v21 = objc_msgSend(v20, "count");

      if (v19 == v21)
      {
        v22 = sub_1004325AC();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource stopIdentifiers](self->_stopsDataSource, "stopIdentifiers"));
          v25 = objc_msgSend(v24, "count");
          v26 = -[NSObject count](v10, "count");
          v27 = -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier");
          v31 = 134218496;
          v32 = (unint64_t)v25;
          v33 = 2048;
          v34 = v26;
          v35 = 2048;
          v36 = v27;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "The number of transit stops changed (from %lu to %lu) during the network refresh for trip id %llu", (uint8_t *)&v31, 0x20u);

        }
      }
      -[TransitSchedulesViewController _rebuildStopsSection](self, "_rebuildStopsSection");
    }
    else
    {
      v28 = sub_1004325AC();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier");
        v31 = 134217984;
        v32 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "The service failed to return any transit stops when updating for the requested trip id %llu", (uint8_t *)&v31, 0xCu);
      }

    }
  }

}

- (void)transitVehicleUpdater:(id)a3 didUpdateVehiclePositions:(id)a4 forTripIDs:(id)a5
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  __int16 v16;
  void *v17;

  v6 = a4;
  if (objc_msgSend(v6, "count") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    v8 = sub_1004325AC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[TransitSchedulesViewController selectedTripIdentifier](self, "selectedTripIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timestamp"));
      v14 = 134218242;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received vehicle position update for trip %llu with timestamp %@", (uint8_t *)&v14, 0x16u);

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  -[TransitSchedulesViewController setLastReceivedVehiclePositions:](self, "setLastReceivedVehiclePositions:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController transitSchedulesDelegate](self, "transitSchedulesDelegate"));
  objc_msgSend(v13, "transitSchedulesViewControllerWantsToUpdateRouteAnnotations:", self);

}

- (void)transitVehicleUpdater:(id)a3 didTimeoutUpdateForTripIDs:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a4;
  v5 = sub_1004325AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Vehicle position update timeout for trip ids %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)transitVehicleUpdater:(id)a3 didFailUpdateForTripIDs:(id)a4 withError:(id)a5
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v6 = a4;
  v7 = a5;
  v8 = sub_1004325AC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Vehicle position update error for trip ids %@. Error: %@", (uint8_t *)&v10, 0x16u);
  }

}

- (void)_updateVehicleUpdater
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[TransitSchedulesViewController hasSelectedTrip](self, "hasSelectedTrip"))
    v3 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", self->_selectedTripIdentifier));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v5 = (id)v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController vehicleUpdater](self, "vehicleUpdater"));
  objc_msgSend(v4, "setTripIDs:", v5);

}

- (void)_clearVehicles
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController vehicleUpdater](self, "vehicleUpdater"));
  objc_msgSend(v4, "setTripIDs:", v3);

  -[TransitSchedulesViewController setLastReceivedVehiclePositions:](self, "setLastReceivedVehiclePositions:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController transitSchedulesDelegate](self, "transitSchedulesDelegate"));
  objc_msgSend(v5, "transitSchedulesViewControllerWantsToUpdateRouteAnnotations:", self);

}

- (unint64_t)_sectionTypeForSectionIndex:(unint64_t)a3
{
  void *v6;
  id v7;

  if (-[NSArray count](self->_sectionIdentifiers, "count") < a3)
    return 9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionIdentifiers, "objectAtIndexedSubscript:", a3));
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return (unint64_t)v7;
}

- (int64_t)_sectionIndexForSectionType:(unint64_t)a3
{
  NSArray *sectionIdentifiers;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  sectionIdentifiers = self->_sectionIdentifiers;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100365424;
  v6[3] = &unk_1011B2BF0;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](sectionIdentifiers, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  TransitSchedulesDepartureDataProvider *departureDataProvider;
  id initialRoutingSchedulesNetworkRequestState;
  UICollectionView *collectionView;
  void *v17;
  void *v18;
  TransitItemIncident **p_transitIncidentCell;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  switch(-[TransitSchedulesViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v9, "section")))
  {
    case 0uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController headsignCellProvider](self, "headsignCellProvider"));
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionView:headsignCellWithIdentifier:indexPath:dataProvider:", self->_collectionView, v10, v9, self->_departureDataProvider));
      goto LABEL_8;
    case 1uLL:
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TransitLineDepartureInfoCellIdentifier"), v9));
      v13 = 280;
      goto LABEL_14;
    case 2uLL:
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TransitScheduleNetworkActivityTableViewCellIdentifier"), v9));
      departureDataProvider = self->_departureDataProvider;
      if (departureDataProvider)
        initialRoutingSchedulesNetworkRequestState = -[TransitSchedulesDepartureDataProvider remoteNetworkState](departureDataProvider, "remoteNetworkState");
      else
        initialRoutingSchedulesNetworkRequestState = (id)self->_initialRoutingSchedulesNetworkRequestState;
      if (initialRoutingSchedulesNetworkRequestState != (id)3)
        goto LABEL_21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = v23;
      v25 = CFSTR("[Transit Schedule] Departures unavailable message");
      goto LABEL_20;
    case 3uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureCellProvider](self, "departureCellProvider"));
      collectionView = self->_collectionView;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController referenceDate](self, "referenceDate"));
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionView:departureCellWithIdentifier:indexPath:referenceDate:dataProvider:", collectionView, v10, v9, v17, self->_departureDataProvider));

LABEL_8:
      goto LABEL_22;
    case 4uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("IncidentsCellIdentifier"), v9));
      p_transitIncidentCell = &self->_transitIncidentCell;
      objc_storeWeak((id *)&self->_transitIncidentCell, v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController referenceDate](self, "referenceDate"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_transitIncidentCell);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController incidents](self, "incidents"));
      objc_msgSend(WeakRetained, "configureWithIncidents:referenceDate:", v22, v20);

      v12 = objc_loadWeakRetained((id *)p_transitIncidentCell);
      goto LABEL_22;
    case 5uLL:
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TransitScheduleNetworkActivityTableViewCellIdentifier"), v9));
      if ((id)-[TransitScheduleStopsTableViewDataSource remoteNetworkState](self->_stopsDataSource, "remoteNetworkState") == (id)3)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v24 = v23;
        v25 = CFSTR("[Transit Schedule] Stops unavailable message");
LABEL_20:
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", v25, CFSTR("localized string not found"), 0));
        objc_msgSend(v12, "setErrorStateWithString:", v26);

      }
      else
      {
        initialRoutingSchedulesNetworkRequestState = -[TransitScheduleStopsTableViewDataSource remoteNetworkState](self->_stopsDataSource, "remoteNetworkState");
LABEL_21:
        objc_msgSend(v12, "setState:", initialRoutingSchedulesNetworkRequestState);
      }
LABEL_22:

      return v12;
    case 6uLL:
      v12 = (id)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource collectionView:cellForItemAtIndexPath:itemIdentifier:](self->_stopsDataSource, "collectionView:cellForItemAtIndexPath:itemIdentifier:", v8, v9, v10));
      goto LABEL_22;
    case 7uLL:
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TransitLineOptionsCellIdentifier"), v9));
      v13 = 296;
LABEL_14:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v13), "configureCell:forIndexPath:withIdentifier:", v12, v9, v10);
      goto LABEL_22;
    case 8uLL:
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TransitAttributionCellIdentifier"), v9));
      objc_msgSend(v12, "setAttribution:", self->_attribution);
      goto LABEL_22;
    default:
      v12 = 0;
      goto LABEL_22;
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
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

  v7 = a3;
  v8 = a5;
  v9 = sub_1002A8AA0(self);
  v10 = -[TransitSchedulesViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v8, "section"));
  v11 = v10;
  if (v9 == 5
    && v10 == 3
    && (id)-[TransitSchedulesViewController _departuresHeaderStyle](self, "_departuresHeaderStyle") == (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransitStationLineScheduleSectionHeaderView identifier](TransitStationDatePickerHeaderView, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v12, v8));

    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "datePicker"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeZone"));
    objc_msgSend(v14, "setTimeZone:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scheduleWindowStartDate"));
    objc_msgSend(v14, "setMinimumDate:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "scheduleWindowStartDate"));
    objc_msgSend(v14, "setDate:", v20);

    objc_msgSend(v14, "setDatePickerMode:", 2);
    objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "changedDate:", 4096);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] macOS Departures Title"), CFSTR("localized string not found"), 0));
    objc_msgSend(v13, "setTitle:", v22);

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[TransitStationLineScheduleSectionHeaderView identifier](TransitStationLineScheduleSectionHeaderView, "identifier"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v23, v8));

    v13 = 0;
    switch(v11)
    {
      case 1uLL:
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Departure Info"), CFSTR("localized string not found"), 0));

        objc_msgSend(v14, "setTitle:", v24);
        goto LABEL_12;
      case 2uLL:
      case 3uLL:
        if ((id)-[TransitSchedulesViewController _departuresHeaderStyle](self, "_departuresHeaderStyle") == (id)2)
          objc_msgSend(v14, "addButtonWithTarget:action:", self, "changeDate");
        -[TransitSchedulesViewController _updateDeparturesHeaderTitlesForHeaderView:](self, "_updateDeparturesHeaderTitlesForHeaderView:", v14);
        goto LABEL_14;
      case 5uLL:
      case 6uLL:
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController titleForStopsHeader](self, "titleForStopsHeader"));
        objc_msgSend(v14, "setBottomHairlineHidden:", 1);
        objc_msgSend(v14, "setTitle:", v24);
        -[TransitSchedulesViewController _updateStopsSectionHeader:](self, "_updateStopsSectionHeader:", v14);
        goto LABEL_12;
      case 7uLL:
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Line Options"), CFSTR("localized string not found"), 0));

        objc_msgSend(v14, "setTitle:", v24);
        objc_msgSend(v14, "setBottomHairlineHidden:", 1);
LABEL_12:
        v14 = v14;

        v13 = v14;
        break;
      case 8uLL:
        objc_msgSend(v14, "setBottomHairlineHidden:", v9 != 5);
LABEL_14:
        v14 = v14;
        v13 = v14;
        break;
      default:
        break;
    }
  }

  return v13;
}

- (id)_firstVisibleDeparture
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (sub_1002A8AA0(self) == 5)
    goto LABEL_18;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (!v4)
    goto LABEL_18;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView visibleCells](self->_collectionView, "visibleCells", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v6)
  {

LABEL_18:
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController departureDataProvider](self, "departureDataProvider"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedDeparture"));
    goto LABEL_19;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
      v12 = objc_opt_class(TransitSchedulesDepartureCollectionViewCell);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        if (v8)
        {
          objc_msgSend(v11, "frame");
          v14 = v13;
          objc_msgSend(v8, "frame");
          if (v14 < v15)
          {
            v16 = v11;

            v8 = v16;
          }
        }
        else
        {
          v8 = v11;
        }
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v7);

  if (!v8)
    goto LABEL_18;
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "departure"));
LABEL_19:
  v18 = (void *)v17;

  return v18;
}

- (void)_updateDeparturesHeaderTitles
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController _headerViewForSectionType:](self, "_headerViewForSectionType:", 3));
  -[TransitSchedulesViewController _updateDeparturesHeaderTitlesForHeaderView:](self, "_updateDeparturesHeaderTitlesForHeaderView:", v3);

}

- (void)_updateDeparturesHeaderTitlesForHeaderView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Departures"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController _firstVisibleDeparture](self, "_firstVisibleDeparture"));
  if (sub_1002A8AA0(self) != 5)
  {
    if (v6)
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "departureDate"));
    else
      v7 = objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider scheduleWindowStartDate](self->_departureDataProvider, "scheduleWindowStartDate"));
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController referenceDate](self, "referenceDate"));
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    if (v11 <= GEOTransitDepartureNearFuturePeriod())
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Upcoming Departures"), CFSTR("localized string not found"), 0));

      v24 = (id)v13;
    }

  }
  v14 = -[TransitSchedulesViewController _departuresHeaderStyle](self, "_departuresHeaderStyle");
  if (v14 == 2)
  {
    if (sub_1002A8AA0(self) != 5)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider scheduleWindowStartDate](self->_departureDataProvider, "scheduleWindowStartDate"));
      objc_msgSend(v16, "timeIntervalSinceDate:", v17);
      v19 = v18;

      if (GEOTransitDepartureIsNearFutureDepartureTimeInterval(v19))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Now"), CFSTR("localized string not found"), 0));

        goto LABEL_13;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider scheduleWindowStartDate](self->_departureDataProvider, "scheduleWindowStartDate"));

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider timeZone](self->_departureDataProvider, "timeZone"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider scheduleWindowStartDate](self->_departureDataProvider, "scheduleWindowStartDate"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _maps_dateDescriptionShort:timeZone:bookingDate:](NSDate, "_maps_dateDescriptionShort:timeZone:bookingDate:", 0, v22, v23));

        goto LABEL_13;
      }
    }
    goto LABEL_12;
  }
  if (v14 != 1)
  {
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureDataProvider frequencyStringForDeparture:](self->_departureDataProvider, "frequencyStringForDeparture:", v6));
LABEL_13:
  objc_msgSend(v4, "setTitle:", v24);
  objc_msgSend(v4, "setSecondaryText:", v15);

}

- (int)currentUITargetForAnalytics
{
  return 651;
}

- (void)timingViewController:(id)a3 didPickTiming:(id)a4
{
  uint64_t v5;
  NSDate *v6;
  id v7;

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "departureDate", a3));
  v7 = (id)v5;
  if (v5)
  {
    -[TransitSchedulesViewController setScheduleWindowStartDate:](self, "setScheduleWindowStartDate:", v5);
  }
  else
  {
    v6 = objc_opt_new(NSDate);
    -[TransitSchedulesViewController setScheduleWindowStartDate:](self, "setScheduleWindowStartDate:", v6);

  }
}

- (void)selectDepartureSequence:(id)a3
{
  TransitSchedulesDepartureDataProvider *departureDataProvider;
  id v5;

  departureDataProvider = self->_departureDataProvider;
  v5 = a3;
  -[TransitSchedulesDepartureDataProvider selectDepartureSequence:](departureDataProvider, "selectDepartureSequence:", v5);
  -[TransitSchedulesDepartureInfoProvider setDepartureSequence:](self->_departureInfoProvider, "setDepartureSequence:", v5);

}

- (void)selectDeparture:(id)a3
{
  -[TransitSchedulesDepartureDataProvider selectDepartureWithTripIdentifier:](self->_departureDataProvider, "selectDepartureWithTripIdentifier:", objc_msgSend(a3, "tripIdentifier"));
}

- (void)viewLineOnMap
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTripRoute](self, "selectedTripRoute"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTripRoute](self, "selectedTripRoute"));
    -[GEOLocation coordinate](self->_boardingStopLocation, "coordinate");
    v5 = objc_msgSend(v4, "closestPointOnRoute:");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController transitSchedulesDelegate](self, "transitSchedulesDelegate"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapCameraControllerForTransitSchedulesViewController:", self));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController selectedTripRoute](self, "selectedTripRoute"));
    objc_msgSend(v9, "displayTransitRoute:boardingStopCoord:boardingStopIndex:animated:completion:", v7, v5, self->_boardingStopIndex, 1, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v8, "wantsLayout:", 1);

    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 7018, -[TransitSchedulesViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
  }
}

- (void)showDirectionsToSelectedTransitStop
{
  id v3;
  NSObject *v4;
  MKMapItem *boardingStopMapItem;
  SearchFieldItem *v6;
  void *v7;
  SearchFieldItem *v8;
  SearchResult *v9;
  DirectionItem *v10;
  void *v11;
  DirectionItem *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _UNKNOWN **v16;
  _QWORD v17[2];
  uint8_t buf[4];
  MKMapItem *v19;

  v3 = sub_1004325AC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    boardingStopMapItem = self->_boardingStopMapItem;
    *(_DWORD *)buf = 138412290;
    v19 = boardingStopMapItem;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Routing from current location to boarding stop: %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(SearchFieldItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
  -[SearchFieldItem setSearchResult:](v6, "setSearchResult:", v7);

  v8 = objc_alloc_init(SearchFieldItem);
  v9 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", self->_boardingStopMapItem);
  -[SearchFieldItem setSearchResult:](v8, "setSearchResult:", v9);

  v10 = [DirectionItem alloc];
  v17[0] = v6;
  v17[1] = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
  v12 = -[DirectionItem initWithItems:transportType:](v10, "initWithItems:transportType:", v11, 3);

  v15 = CFSTR("DirectionsSessionInitiatorKey");
  v16 = &off_10126CCE8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v14, "viewController:doDirectionItem:withUserInfo:", self, v12, v13);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6003, -[TransitSchedulesViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
}

- (void)showLineInfo
{
  void *v3;
  id v4;

  if (self->_selectedTransitLineItem)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController transitSchedulesDelegate](self, "transitSchedulesDelegate"));

    if (v3)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesViewController transitSchedulesDelegate](self, "transitSchedulesDelegate"));
      objc_msgSend(v4, "transitSchedulesViewController:wantsToShowInfoForLine:", self, self->_selectedTransitLineItem);

    }
  }
}

- (void)setPinnedTransitLine:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_pinnedTransitLine != a3)
  {
    self->_pinnedTransitLine = a3;
    if (-[TransitSchedulesViewController _sectionIndexForSectionType:](self, "_sectionIndexForSectionType:", 7) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesLineOptionsProvider identifiers](self->_lineOptionsProvider, "identifiers"));
      objc_msgSend(v5, "reloadItemsWithIdentifiers:", v4);
      -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v5, 1);

    }
  }
}

- (void)_checkIfPinnedLine
{
  _QWORD v3[4];
  id v4;
  id location;

  if (!self->_isRoutingScheduleCard)
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100366670;
    v3[3] = &unk_1011B2C18;
    objc_copyWeak(&v4, &location);
    -[TransitSchedulesViewController _fetchMapsSyncTransitLineItemWithCallback:](self, "_fetchMapsSyncTransitLineItemWithCallback:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)pinSelectedTransitLine
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc_init((Class)MSCollectionTransitItem);
  v4 = objc_msgSend(objc_alloc((Class)MSPTransitStorageLine), "initWithLine:", self->_selectedTransitLine);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
  objc_msgSend(v3, "setTransitLineStorage:", v5);

  objc_msgSend(v3, "setMuid:", -[GEOTransitLine muid](self->_selectedTransitLine, "muid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  v8 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v6, "saveWithObjects:completionHandler:", v7, &stru_1011B2C38);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 241, -[TransitSchedulesViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
}

- (void)unpinSelectedTransitLine
{
  -[TransitSchedulesViewController _fetchMapsSyncTransitLineItemWithCallback:](self, "_fetchMapsSyncTransitLineItemWithCallback:", &stru_1011B2C78);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 252, -[TransitSchedulesViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
}

- (void)_fetchMapsSyncTransitLineItemWithCallback:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = objc_alloc_init((Class)MSCollectionTransitItemRequest);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100366B90;
    v6[3] = &unk_1011B21F8;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    objc_msgSend(v5, "fetchWithCompletionHandler:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)updatedDepartureInfoProvider:(id)a3
{
  UICollectionViewDiffableDataSource **p_dataSource;
  void *v5;
  void *v6;
  id v7;

  if (-[TransitSchedulesViewController _shouldShowDepartureInfoSection](self, "_shouldShowDepartureInfoSection", a3))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider identifiers](self->_departureInfoProvider, "identifiers"));
    if (objc_msgSend(v7, "count"))
    {
      p_dataSource = &self->_dataSource;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
      -[TransitSchedulesViewController _clearSection:inSnapshot:](self, "_clearSection:inSnapshot:", 1, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1));
      objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, v6);

    }
    else
    {
      if (-[TransitSchedulesViewController _sectionIndexForSectionType:](self, "_sectionIndexForSectionType:", 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_8:

        return;
      }
      p_dataSource = &self->_dataSource;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot"));
      -[TransitSchedulesViewController _removeSection:toSnapshot:](self, "_removeSection:toSnapshot:", 1, v5);
    }
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](*p_dataSource, "applySnapshot:animatingDifferences:", v5, 1);

    goto LABEL_8;
  }
}

- (NSArray)incidents
{
  return self->_incidents;
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (TransitSchedulesViewControllerDelegate)transitSchedulesDelegate
{
  return (TransitSchedulesViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_transitSchedulesDelegate);
}

- (void)setTransitSchedulesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transitSchedulesDelegate, a3);
}

- (ActionCoordination)actionCoordinator
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_actionCoordinator);
}

- (void)setActionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_actionCoordinator, a3);
}

- (GEOTransitVehicleUpdater)vehicleUpdater
{
  return self->_vehicleUpdater;
}

- (void)setVehicleUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleUpdater, a3);
}

- (GEOComposedRoute)selectedTripRoute
{
  return self->_selectedTripRoute;
}

- (GEOTransitLine)selectedTransitLine
{
  return self->_selectedTransitLine;
}

- (NSString)selectedTripVehicleNumber
{
  return self->_selectedTripVehicleNumber;
}

- (NSArray)lastReceivedVehiclePositions
{
  return self->_lastReceivedVehiclePositions;
}

- (void)setLastReceivedVehiclePositions:(id)a3
{
  objc_storeStrong((id *)&self->_lastReceivedVehiclePositions, a3);
}

- (MKTransitMapItemUpdater)mapItemUpdater
{
  return self->_mapItemUpdater;
}

- (void)setMapItemUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_mapItemUpdater, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (TransitSchedulesHeaderView)headerTitleView
{
  return self->_headerTitleView;
}

- (void)setHeaderTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitleView, a3);
}

- (void)setDepartureCellProvider:(id)a3
{
  objc_storeStrong((id *)&self->_departureCellProvider, a3);
}

- (void)setHeadsignCellProvider:(id)a3
{
  objc_storeStrong((id *)&self->_headsignCellProvider, a3);
}

- (TransitSchedulesDepartureDataProvider)departureDataProvider
{
  return self->_departureDataProvider;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
  objc_storeStrong((id *)&self->_referenceDate, a3);
}

- (BOOL)isPinnedTransitLine
{
  return self->_pinnedTransitLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_departureDataProvider, 0);
  objc_storeStrong((id *)&self->_headsignCellProvider, 0);
  objc_storeStrong((id *)&self->_departureCellProvider, 0);
  objc_storeStrong((id *)&self->_headerTitleView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_mapItemUpdater, 0);
  objc_storeStrong((id *)&self->_lastReceivedVehiclePositions, 0);
  objc_storeStrong((id *)&self->_selectedTripVehicleNumber, 0);
  objc_storeStrong((id *)&self->_selectedTransitLine, 0);
  objc_storeStrong((id *)&self->_selectedTripRoute, 0);
  objc_storeStrong((id *)&self->_vehicleUpdater, 0);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_destroyWeak((id *)&self->_transitSchedulesDelegate);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_boardingStopMapItem, 0);
  objc_storeStrong((id *)&self->_selectedTransitLineItem, 0);
  objc_storeStrong((id *)&self->_lineOptionsProvider, 0);
  objc_storeStrong((id *)&self->_departureInfoProvider, 0);
  objc_destroyWeak((id *)&self->_transitIncidentCell);
  objc_storeStrong((id *)&self->_boardingStopTimeZone, 0);
  objc_storeStrong((id *)&self->_boardingStopLocation, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_stopsDataSource, 0);
  objc_storeStrong((id *)&self->_boardingStopName, 0);
  objc_storeStrong((id *)&self->_selectedTripIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_scheduleWindowStartDate, 0);
  objc_storeStrong((id *)&self->_selectedTripDepartureDate, 0);
  objc_storeStrong((id *)&self->_routingParameters, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end
