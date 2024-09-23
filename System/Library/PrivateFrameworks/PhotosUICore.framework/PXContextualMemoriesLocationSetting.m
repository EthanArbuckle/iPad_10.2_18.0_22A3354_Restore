@implementation PXContextualMemoriesLocationSetting

- (PXContextualMemoriesLocationSetting)init
{
  PXContextualMemoriesLocationSetting *v2;
  double latitude;
  double longitude;
  _PXCompletionHandlerManager *v5;
  _PXCompletionHandlerManager *completionHandlerManager;
  objc_super v8;
  CLLocationCoordinate2D v9;

  v8.receiver = self;
  v8.super_class = (Class)PXContextualMemoriesLocationSetting;
  v2 = -[PXContextualMemoriesLocationSetting init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "_simulatedLocationCoordinate");
    latitude = v9.latitude;
    longitude = v9.longitude;
    if (CLLocationCoordinate2DIsValid(v9))
    {
      v2->_coordinate.latitude = latitude;
      v2->_coordinate.longitude = longitude;
      v2->_locationState = 3;
      -[PXContextualMemoriesLocationSetting _updatePlacemarkForCoordinate:](v2, "_updatePlacemarkForCoordinate:", latitude, longitude);
    }
    else
    {
      v2->_coordinate = (CLLocationCoordinate2D)*MEMORY[0x1E0C9E500];
      v2->_locationState = 0;
    }
    v5 = objc_alloc_init(_PXCompletionHandlerManager);
    completionHandlerManager = v2->_completionHandlerManager;
    v2->_completionHandlerManager = v5;

    -[_PXCompletionHandlerManager setDelegate:](v2->_completionHandlerManager, "setDelegate:", v2);
  }
  return v2;
}

- (NSString)headerTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Location"), &stru_1E5149688, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)title
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[PXContextualMemoriesLocationSetting placemark](self, "placemark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXContextualMemoriesLocationSetting placemark](self, "placemark");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_title");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (void *)v5;

    return (NSString *)v6;
  }
  if (!CLLocationCoordinate2DIsValid(self->_coordinate))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("No Location Available"), &stru_1E5149688, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f, %.3f"), *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v6;
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  -[PXContextualMemoriesLocationSetting placemark](self, "placemark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  CLPlacemark *placemark;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if (self->_coordinate.latitude != a3.latitude || self->_coordinate.longitude != a3.longitude)
  {
    -[PXContextualMemoriesLocationSetting willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("coordinate"));
    self->_coordinate.latitude = latitude;
    self->_coordinate.longitude = longitude;
    placemark = self->_placemark;
    self->_placemark = 0;

    -[PXContextualMemoriesLocationSetting _updatePlacemarkForCoordinate:](self, "_updatePlacemarkForCoordinate:", latitude, longitude);
    -[PXContextualMemoriesLocationSetting didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("coordinate"));
  }
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v11 = *MEMORY[0x1E0C80C00];
  PLMemoriesGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%+.8f,%+.8f>"), *(_QWORD *)&latitude, *(_QWORD *)&longitude);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v10 = v7;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "[Settings] Set simulated location coordinate: %{private}@", buf, 0xCu);

  }
  -[PXContextualMemoriesLocationSetting setLocationState:](self, "setLocationState:", 3);
  objc_msgSend((id)objc_opt_class(), "_setSimulatedLocationCoordinate:", latitude, longitude);
  -[PXContextualMemoriesLocationSetting _setCoordinate:](self, "_setCoordinate:", latitude, longitude);
  -[PXContextualMemoriesLocationSetting completionHandlerManager](self, "completionHandlerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callCompletionHandlers");

}

- (void)_handleLocationAcquisitionUpdate:(id)a3
{
  id v5;
  double v6;
  double v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[PXContextualMemoriesLocationSetting locationState](self, "locationState") == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContextualMemoriesLocationSetting.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXContextualMemoriesLocationStateSimulated != [self locationState]"));

    if (!v5)
      goto LABEL_12;
  }
  else if (!v5)
  {
    goto LABEL_12;
  }
  objc_msgSend(v5, "coordinate");
  -[PXContextualMemoriesLocationSetting _setCoordinate:](self, "_setCoordinate:");
  if (-[PXContextualMemoriesLocationSetting locationState](self, "locationState") == 1)
  {
    objc_msgSend(v5, "horizontalAccuracy");
    v7 = v6;
    PLMemoriesGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7 <= 0.0 || v7 >= 100.0)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "[Settings] Did receive location not meeting accuracy goal: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "[Settings] Did acquire the current location: %@", buf, 0xCu);
      }

      -[PXContextualMemoriesLocationSetting setLocationState:](self, "setLocationState:", 2);
      -[PXContextualMemoriesLocationSetting completionHandlerManager](self, "completionHandlerManager");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject callCompletionHandlers](v8, "callCompletionHandlers");
    }

  }
LABEL_12:

}

- (void)_initiateLocationAcquisitionWithAccuracy:(double)a3
{
  void *v5;
  NSObject *v6;
  PXLocationStream *v7;
  PXLocationStream *v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  -[PXContextualMemoriesLocationSetting locationStream](self, "locationStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PXContextualMemoriesLocationSetting _setCoordinate:](self, "_setCoordinate:", *MEMORY[0x1E0C9E500], *(double *)(MEMORY[0x1E0C9E500] + 8));
    PLMemoriesGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "[Settings] Will attempt to acquire the current location...", (uint8_t *)buf, 2u);
    }

    -[PXContextualMemoriesLocationSetting setLocationState:](self, "setLocationState:", 1);
    objc_initWeak(buf, self);
    v7 = [PXLocationStream alloc];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__PXContextualMemoriesLocationSetting__initiateLocationAcquisitionWithAccuracy___block_invoke;
    v9[3] = &unk_1E511AAD0;
    objc_copyWeak(&v10, buf);
    v8 = -[PXLocationStream initWithAccuracy:handler:](v7, "initWithAccuracy:handler:", v9, a3);
    -[PXContextualMemoriesLocationSetting setLocationStream:](self, "setLocationStream:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (id)_locationForCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v5;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if (CLLocationCoordinate2DIsValid(a3))
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
  else
    v5 = 0;
  return v5;
}

- (CLLocation)location
{
  -[PXContextualMemoriesLocationSetting coordinate](self, "coordinate");
  return (CLLocation *)-[PXContextualMemoriesLocationSetting _locationForCoordinate:](self, "_locationForCoordinate:");
}

- (void)resetToDefault
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

- (void)_updatePlacemarkWithPlacemarks:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  CLPlacemark *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  CLPlacemark *placemark;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (CLPlacemark *)objc_claimAutoreleasedReturnValue();
    PLMemoriesGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[CLPlacemark px_title](v8, "px_title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLPlacemark px_subtitle](v8, "px_subtitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "[Settings] Reverse geocode returned: \"%@\", \"%@\", (uint8_t *)&v15, 0x16u);

    }
    -[PXContextualMemoriesLocationSetting willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("placemark"));
    placemark = self->_placemark;
    self->_placemark = v8;

    -[PXContextualMemoriesLocationSetting didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("placemark"));
  }
  else
  {
    PLMemoriesGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "[Settings] Reverse geocode failed: \"%@\", (uint8_t *)&v15, 0xCu);

    }
  }

}

- (void)_updatePlacemarkForCoordinate:(CLLocationCoordinate2D)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[PXContextualMemoriesLocationSetting _locationForCoordinate:](self, "_locationForCoordinate:", a3.latitude, a3.longitude);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C9E390]);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__PXContextualMemoriesLocationSetting__updatePlacemarkForCoordinate___block_invoke;
    v6[3] = &unk_1E5131928;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "reverseGeocodeLocation:completionHandler:", v4, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);

  }
}

- (void)setMonitorsCurrentLocation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_monitorsCurrentLocation != a3)
  {
    v3 = a3;
    self->_monitorsCurrentLocation = a3;
    PLMemoriesGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = CFSTR("Disable");
      if (v3)
        v6 = CFSTR("Enable");
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[Settings] %@ monitoring of the current location", (uint8_t *)&v9, 0xCu);
    }

    if (-[PXContextualMemoriesLocationSetting locationState](self, "locationState") != 3)
    {
      if (v3)
      {
        -[PXContextualMemoriesLocationSetting _initiateLocationAcquisitionWithAccuracy:](self, "_initiateLocationAcquisitionWithAccuracy:", *MEMORY[0x1E0C9E4D0]);
      }
      else
      {
        -[PXContextualMemoriesLocationSetting locationStream](self, "locationStream");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[PXContextualMemoriesLocationSetting setLocationState:](self, "setLocationState:", 0);
          -[PXContextualMemoriesLocationSetting completionHandlerManager](self, "completionHandlerManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "callCompletionHandlers");

        }
      }
    }
  }
}

- (void)didCallLastCompletionHandlerForCompletionHandlerManager:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[PXContextualMemoriesLocationSetting locationStream](self, "locationStream", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PXContextualMemoriesLocationSetting monitorsCurrentLocation](self, "monitorsCurrentLocation"))
    {
      PLMemoriesGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[Settings] Will keep monitoring for location changes...", v6, 2u);
      }

    }
    else
    {
      -[PXContextualMemoriesLocationSetting setLocationState:](self, "setLocationState:", 0);
      objc_msgSend(v4, "setClosed:", 1);
      -[PXContextualMemoriesLocationSetting setLocationStream:](self, "setLocationStream:", 0);
    }
  }

}

- (void)requestLocationUpdateWithAccuracy:(double)a3 completionHandler:(id)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a4;
  v6 = -[PXContextualMemoriesLocationSetting locationState](self, "locationState");
  if (v6 - 2 < 2)
  {
    v9[2]();
  }
  else if (v6 == 1)
  {
    -[PXContextualMemoriesLocationSetting completionHandlerManager](self, "completionHandlerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addCompletionHandler:", v9);

  }
  else if (!v6)
  {
    -[PXContextualMemoriesLocationSetting completionHandlerManager](self, "completionHandlerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addCompletionHandler:", v9);

    -[PXContextualMemoriesLocationSetting _initiateLocationAcquisitionWithAccuracy:](self, "_initiateLocationAcquisitionWithAccuracy:", a3);
  }

}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (void)setPlacemark:(id)a3
{
  objc_storeStrong((id *)&self->_placemark, a3);
}

- (unint64_t)locationState
{
  return self->_locationState;
}

- (void)setLocationState:(unint64_t)a3
{
  self->_locationState = a3;
}

- (PXLocationStream)locationStream
{
  return self->_locationStream;
}

- (void)setLocationStream:(id)a3
{
  objc_storeStrong((id *)&self->_locationStream, a3);
}

- (_PXCompletionHandlerManager)completionHandlerManager
{
  return self->_completionHandlerManager;
}

- (void)setCompletionHandlerManager:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlerManager, a3);
}

- (BOOL)monitorsCurrentLocation
{
  return self->_monitorsCurrentLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlerManager, 0);
  objc_storeStrong((id *)&self->_locationStream, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
}

void __69__PXContextualMemoriesLocationSetting__updatePlacemarkForCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_updatePlacemarkWithPlacemarks:error:", v6, v5);

}

void __53__PXContextualMemoriesLocationSetting_resetToDefault__block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend((id)objc_opt_class(), "_setSimulatedLocationCoordinate:", *MEMORY[0x1E0C9E500], *(double *)(MEMORY[0x1E0C9E500] + 8));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_initiateLocationAcquisitionWithAccuracy:", *MEMORY[0x1E0C9E4D0]);

}

void __80__PXContextualMemoriesLocationSetting__initiateLocationAcquisitionWithAccuracy___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleLocationAcquisitionUpdate:", v3);

}

+ (BOOL)automaticallyNotifiesObserversOfCoordinate
{
  return 0;
}

+ (id)keyPathsForValuesAffectingPlacemark
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E53E88B0);
}

+ (id)keyPathsForValuesAffectingTitle
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E53E88C8);
}

+ (id)keyPathsForValuesAffectingSubtitle
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E53E88E0);
}

+ (void)_setSimulatedLocationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v14 = *MEMORY[0x1E0C80C00];
  if (*(double *)&_simulatedLocationCoordinate != a3.latitude
    || *((double *)&_simulatedLocationCoordinate + 1) != a3.longitude)
  {
    _simulatedLocationCoordinate = (__int128)a3;
    if (CLLocationCoordinate2DIsValid(a3))
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v6, "numberWithDouble:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", latitude);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", longitude);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PLMemoriesGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%+.8f,%+.8f>"), *(_QWORD *)&latitude, *(_QWORD *)&longitude);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v13 = v11;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "[Settings] Storing simulated location coordinate: %{private}@", buf, 0xCu);

      }
    }
    else
    {
      v9 = 0;
      v8 = 0;
      v7 = 0;
    }
    CFPreferencesSetAppValue(CFSTR("SimulatedCoordinateDate"), v7, CFSTR("com.apple.mobileslideshow"));
    CFPreferencesSetAppValue(CFSTR("SimulatedCoordinateLatitude"), v8, CFSTR("com.apple.mobileslideshow"));
    CFPreferencesSetAppValue(CFSTR("SimulatedCoordinateLongitude"), v9, CFSTR("com.apple.mobileslideshow"));

  }
}

+ (CLLocationCoordinate2D)_simulatedLocationCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  if (_simulatedLocationCoordinate_predicate != -1)
    dispatch_once(&_simulatedLocationCoordinate_predicate, &__block_literal_global_28098);
  v3 = *((double *)&_simulatedLocationCoordinate + 1);
  v2 = *(double *)&_simulatedLocationCoordinate;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

void __67__PXContextualMemoriesLocationSetting__simulatedLocationCoordinate__block_invoke()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  NSObject *v4;
  void *v5;
  double v6;
  CLLocationDegrees v7;
  CLLocationDegrees v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _simulatedLocationCoordinate = *MEMORY[0x1E0C9E500];
  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("SimulatedCoordinateDate"), CFSTR("com.apple.mobileslideshow"));
  if (v0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v0, "doubleValue");
      v2 = v1;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      if (v3 - v2 >= 86400.0)
      {
        PLMemoriesGetLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "[Settings] Ignoring old simulated location coordinate", buf, 2u);
        }
      }
      else
      {
        v4 = CFPreferencesCopyAppValue(CFSTR("SimulatedCoordinateLatitude"), CFSTR("com.apple.mobileslideshow"));
        v5 = (void *)CFPreferencesCopyAppValue(CFSTR("SimulatedCoordinateLongitude"), CFSTR("com.apple.mobileslideshow"));
        if (v4)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v5)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[NSObject doubleValue](v4, "doubleValue");
                v7 = v6;
                objc_msgSend(v5, "doubleValue");
                _simulatedLocationCoordinate = (__int128)CLLocationCoordinate2DMake(v7, v8);
                PLMemoriesGetLog();
                v9 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%+.8f,%+.8f>"), _simulatedLocationCoordinate);
                  v10 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138477827;
                  v12 = v10;
                  _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "[Settings] Restoring simulated location coordinate: %{private}@", buf, 0xCu);

                }
              }
            }
          }
        }

      }
    }
  }

}

@end
