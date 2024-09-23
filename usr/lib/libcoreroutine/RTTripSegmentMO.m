@implementation RTTripSegmentMO

+ (id)managedObjectWithTripSegment:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  RTTripSegmentMO *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v9 = 0;
      goto LABEL_10;
    }
    LOWORD(v19) = 0;
    v16 = "Invalid parameter not satisfying: tripSegment";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, 2u);
    goto LABEL_9;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v19) = 0;
    v16 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v18;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentMO: invoked managedObjectWithTripSegment on UUID %@", (uint8_t *)&v19, 0xCu);

  }
  v9 = -[RTTripSegmentMO initWithContext:]([RTTripSegmentMO alloc], "initWithContext:", v7);
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTripSegmentMO setIdentifier:](v9, "setIdentifier:", v10);

  objc_msgSend(v5, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTripSegmentMO setStartDate:](v9, "setStartDate:", v12);

  objc_msgSend(v5, "dateInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTripSegmentMO setEndDate:](v9, "setEndDate:", v14);

  objc_msgSend(v5, "tripDistance");
  -[RTTripSegmentMO setTripDistance_m:](v9, "setTripDistance_m:");
  objc_msgSend(v5, "tripDistanceUncertainty");
  -[RTTripSegmentMO setTripDistanceUncertainty_m:](v9, "setTripDistanceUncertainty_m:");
  -[RTTripSegmentMO setModeOfTransportation:](v9, "setModeOfTransportation:", (__int16)objc_msgSend(v5, "modeOfTransportation"));
LABEL_10:

  return v9;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTTripSegmentMO"));
}

@end
