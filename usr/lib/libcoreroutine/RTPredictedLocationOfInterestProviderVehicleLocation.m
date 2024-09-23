@implementation RTPredictedLocationOfInterestProviderVehicleLocation

- (RTPredictedLocationOfInterestProviderVehicleLocation)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithVehicleLocationProvider_distanceCalculator_);
}

- (RTPredictedLocationOfInterestProviderVehicleLocation)initWithVehicleLocationProvider:(id)a3 distanceCalculator:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTPredictedLocationOfInterestProviderVehicleLocation *v10;
  id *p_isa;
  RTPredictedLocationOfInterestProviderVehicleLocation *v12;
  NSObject *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTPredictedLocationOfInterestProviderVehicleLocation initWithVehicleLocationProvider:distanceCalculator:]";
      v19 = 1024;
      v20 = 33;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: vehicleLocationProvider (in %s:%d)", buf, 0x12u);
    }

    if (v9)
      goto LABEL_12;
    goto LABEL_9;
  }
  if (!v8)
  {
LABEL_9:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTPredictedLocationOfInterestProviderVehicleLocation initWithVehicleLocationProvider:distanceCalculator:]";
      v19 = 1024;
      v20 = 34;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator (in %s:%d)", buf, 0x12u);
    }

LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTPredictedLocationOfInterestProviderVehicleLocation;
  v10 = -[RTPredictedLocationOfInterestProviderVehicleLocation init](&v16, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_vehicleLocationProvider, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_13:

  return v12;
}

- (id)locationOfInterestFromVehicleEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0D183C0];
    v4 = a3;
    v5 = [v3 alloc];
    objc_msgSend(v4, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v5, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v6, v7, -1, 0, 0, 0, 1.0, v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)predictedLocationOfInterestFromVehicleEvent:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;

    if (v7 <= 432000.0)
      v8 = 1.0;
    else
      v8 = 0.0;
    -[RTPredictedLocationOfInterestProviderVehicleLocation locationOfInterestFromVehicleEvent:](self, "locationOfInterestFromVehicleEvent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184A0]), "initWithVehicleEvent:", v4);

    v11 = objc_alloc(MEMORY[0x1E0D18450]);
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithLocationOfInterest:confidence:nextEntryTime:modeOfTransportation:sources:", v9, 0, 0, v12, v8);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (BOOL)parkingEventIsUsualAndNearHome:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "nearbyLocationOfInterest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "usualLocation");

  v6 = 0;
  if (v5 && v4)
    v6 = objc_msgSend(v4, "type") == 0;

  return v6;
}

- (BOOL)requiresRoutineEnablement
{
  return 0;
}

- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  RTVehicleLocationProvider *vehicleLocationProvider;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  vehicleLocationProvider = self->_vehicleLocationProvider;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __114__RTPredictedLocationOfInterestProviderVehicleLocation_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke;
  v11[3] = &unk_1E9298FC8;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[RTVehicleLocationProvider fetchLastVehicleEventsWithHandler:](vehicleLocationProvider, "fetchLastVehicleEventsWithHandler:", v11);

}

void __114__RTPredictedLocationOfInterestProviderVehicleLocation_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "parkingEventIsUsualAndNearHome:", v7))
    {
      _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "nearbyLocationOfInterest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "suppressing vehicle event, %@, nearby location of interest, %@. location of vehicle event is too close to home", (uint8_t *)&v10, 0x16u);
LABEL_9:

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "predictedLocationOfInterestFromVehicleEvent:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
        objc_msgSend(v9, "setMinimumDistance:", 0.0);
        objc_msgSend(v9, "setMaximumDistance:", 144000.0);
        if (objc_msgSend(v9, "evaluatePredictedLocationOfInterest:", v8))
          objc_msgSend(v6, "addObject:", v8);
        goto LABEL_9;
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_11;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_11:

}

- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
}

@end
