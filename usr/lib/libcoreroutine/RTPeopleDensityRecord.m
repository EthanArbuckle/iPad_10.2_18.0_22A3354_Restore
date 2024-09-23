@implementation RTPeopleDensityRecord

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *records;
  id v5;

  records = self->_records;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", records, CFSTR("DensityRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ongoingPeopleDensityEvent, CFSTR("OngoingPeopleDensityEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleStartDate, CFSTR("BundleStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addressToRssiValues, CFSTR("RSSIRecords"));

}

- (void)updateRecordOnFetchComplete:(unint64_t)a3 scanDuration:(double)a4 referenceDate:(id)a5 advertisements:(id)a6
{
  id v11;
  id v12;
  NSDate **p_bundleStartDate;
  double v14;
  double v15;
  NSDate *bundleStartDate;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  RTPeopleDensity *ongoingPeopleDensityEvent;
  NSObject *v22;
  NSDate *v23;
  RTPeopleDensity *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  RTPeopleDensitySingleRecord *v29;
  RTPeopleDensityRecordRunningRecentObservation *runningRecentBundle;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  double v47;
  double v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  p_bundleStartDate = &self->_bundleStartDate;
  objc_msgSend(v11, "timeIntervalSinceDate:", self->_bundleStartDate);
  v15 = v14;
  bundleStartDate = self->_bundleStartDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v17 = objc_claimAutoreleasedReturnValue();
  if (bundleStartDate == (NSDate *)v17)
  {

    goto LABEL_10;
  }
  v18 = (void *)v17;
  v19 = objc_msgSend(v11, "compare:", *p_bundleStartDate);

  if (v19 == -1)
  {
LABEL_10:
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "getFormattedDateString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v51 = (uint64_t)v25;
      _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "#RTPeopleDensityRecord update bundle start time to, %@", buf, 0xCu);

    }
    v23 = (NSDate *)v11;
    v24 = (RTPeopleDensity *)*p_bundleStartDate;
    *p_bundleStartDate = v23;
    goto LABEL_19;
  }
  if (v15 < (double)self->_maxBundleDuration)
    goto LABEL_20;
  if (v15 < (double)self->_maxBackstopDuration)
  {
    v47 = 0.0;
    v48 = -1.0;
    objc_msgSend((id)objc_opt_class(), "_computeDensityScore:scanDuration:forRecords:", &v48, &v47, self->_records);
    -[RTPeopleDensityRecord computeRssiHistogram](self, "computeRssiHistogram");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48 >= 0.0 && v47 > 1.0)
    {
      ongoingPeopleDensityEvent = self->_ongoingPeopleDensityEvent;
      if (ongoingPeopleDensityEvent)
        -[RTPeopleDensity uuid](ongoingPeopleDensityEvent, "uuid", v47);
      else
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v47);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_alloc(MEMORY[0x1E0D18410]);
      v42 = v20;
      v27 = (void *)objc_msgSend(v26, "initWithBundleUUID:startDate:endDate:densityScore:scanDuration:rssiHistogram:", v41, *p_bundleStartDate, v11, v20, v48, v47);
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v27, "description", v41);
        v39 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v51 = v39;
        v40 = (void *)v39;
        _os_log_debug_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEBUG, "#RTPeopleDensityRecord storing people density bundle, %@", buf, 0xCu);

      }
      -[RTPeopleDensityRecord closeDensityBundle:](self, "closeDensityBundle:", v27);

      v20 = v42;
    }

  }
  objc_storeStrong((id *)&self->_bundleStartDate, a5);
  -[NSMutableArray removeAllObjects](self->_records, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_addressToRssiValues, "removeAllObjects");
  v24 = self->_ongoingPeopleDensityEvent;
  self->_ongoingPeopleDensityEvent = 0;
LABEL_19:

LABEL_20:
  v29 = -[RTPeopleDensitySingleRecord initWithStats:scanDuration:]([RTPeopleDensitySingleRecord alloc], "initWithStats:scanDuration:", a3, a4);
  -[RTPeopleDensitySingleRecord setStartDatetime:](v29, "setStartDatetime:", v11);
  -[NSMutableArray addObject:](self->_records, "addObject:", v29);
  -[RTPeopleDensityRecordRunningRecentObservation addRecord:](self->_runningRecentBundle, "addRecord:", v29);
  -[RTPeopleDensityRecordRunningRecentObservation updateHistogramWithAdvs:](self->_runningRecentBundle, "updateHistogramWithAdvs:", v12);
  runningRecentBundle = self->_runningRecentBundle;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPeopleDensityRecordRunningRecentObservation trimRunningRecordsBeforeRef:](runningRecentBundle, "trimRunningRecordsBeforeRef:", v31);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = v12;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        v38 = (void *)MEMORY[0x1D8231EA8]();
        -[RTPeopleDensityRecord updateRSSIHistogramOnAdvertisementReceived:](self, "updateRSSIHistogramOnAdvertisementReceived:", v37);
        objc_autoreleasePoolPop(v38);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v34);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDensityRecord)initWithQueue:(id)a3 peopleDensityStore:(id)a4 defaultsManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  RTPeopleDensityRecord *v13;
  RTPeopleDensityRecord *v14;
  NSMutableArray *v15;
  NSMutableArray *records;
  RTPeopleDensityRecordRunningRecentObservation *v17;
  RTPeopleDensityRecordRunningRecentObservation *runningRecentBundle;
  uint64_t v19;
  NSDate *bundleStartDate;
  NSMutableDictionary *v21;
  NSMutableDictionary *addressToRssiValues;
  void *v23;
  double v24;
  unint64_t v25;
  NSObject *v26;
  const char *v27;
  RTPeopleDensityRecord *v28;
  void *v29;
  int v30;
  void *v31;
  unint64_t v32;
  objc_super v34;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v28 = 0;
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: peopleDensityStore";
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_9;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_21;
  }
  v34.receiver = self;
  v34.super_class = (Class)RTPeopleDensityRecord;
  v13 = -[RTPeopleDensityRecord init](&v34, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    objc_storeStrong((id *)&v14->_peopleDensityStore, a4);
    objc_storeStrong((id *)&v14->_defaultsManager, a5);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    records = v14->_records;
    v14->_records = v15;

    v17 = objc_alloc_init(RTPeopleDensityRecordRunningRecentObservation);
    runningRecentBundle = v14->_runningRecentBundle;
    v14->_runningRecentBundle = v17;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v19 = objc_claimAutoreleasedReturnValue();
    bundleStartDate = v14->_bundleStartDate;
    v14->_bundleStartDate = (NSDate *)v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    addressToRssiValues = v14->_addressToRssiValues;
    v14->_addressToRssiValues = v21;

    objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsPeopleDiscoveryProviderDensityBundleDuration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "doubleValue");
      v25 = (unint64_t)v24;
    }
    else
    {
      v25 = 3600;
    }
    v14->_maxBundleDuration = v25;
    objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsPeopleDiscoveryProviderHighDensityThreshold"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v29, "floatValue");
    else
      v30 = 1128792064;
    LODWORD(v14->_highDensityThreshold) = v30;
    objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsPeopleDiscoveryProviderMaximumBackstopDuration"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = (unint64_t)(double)objc_msgSend(v31, "integerValue");
    else
      v32 = 28800;
    v14->_maxBackstopDuration = v32;

  }
  self = v14;
  v28 = self;
LABEL_19:

  return v28;
}

- (void)updateRSSIHistogramOnAdvertisementReceived:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSMutableDictionary *addressToRssiValues;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "rssi");
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 < 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "description");
      v19 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "#RTPeopleDensityRecord update RSSI histogram for advertisement, %@", buf, 0xCu);

    }
    addressToRssiValues = self->_addressToRssiValues;
    objc_msgSend(v4, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](addressToRssiValues, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = self->_addressToRssiValues;
      objc_msgSend(v4, "address");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13);
      v7 = objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "rssi"));
        v8 = objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v7, "addObject:", v8);
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGathering);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "address");
          v20 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v23 = v20;
          _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#RTPeopleDensityRecord _addressToRssiValues has nil entry at address %@", buf, 0xCu);

        }
      }
      goto LABEL_12;
    }
    v14 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "rssi"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithArray:", v16);
    v7 = objc_claimAutoreleasedReturnValue();

    v17 = self->_addressToRssiValues;
    objc_msgSend(v4, "address");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v7, v18);

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "description");
    v8 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#RTPeopleDensityRecord received invalid RSSI value, adv, %@", buf, 0xCu);
LABEL_12:

  }
}

- (void)getCurrentScoreAndScanDuration:(double *)a3 scanDuration:(double *)a4
{
  objc_msgSend((id)objc_opt_class(), "_computeDensityScore:scanDuration:forRecords:", a3, a4, self->_records);
}

- (id)fetchOngoingPeopleDensityBundle:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  double v17;
  uint8_t buf[8];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: startDate";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_10;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: endDate";
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "compare:", self->_bundleStartDate) == -1)
  {
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "#RTPeopleDensityRecord generating real-time bundle", buf, 2u);
  }

  v17 = 0.0;
  *(_QWORD *)buf = 0xBFF0000000000000;
  objc_msgSend((id)objc_opt_class(), "_computeDensityScore:scanDuration:forRecords:", buf, &v17, self->_records);
  -[RTPeopleDensityRecord computeRssiHistogram](self, "computeRssiHistogram");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D18410]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithBundleUUID:startDate:endDate:densityScore:scanDuration:rssiHistogram:", v12, self->_bundleStartDate, 0, v10, *(double *)buf, v17);

  objc_storeStrong((id *)&self->_ongoingPeopleDensityEvent, v13);
LABEL_12:

  return v13;
}

- (id)fetchCurrentObservationBundle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  NSObject *v11;
  double v12;
  float v13;
  double v14;
  float v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v26;
  unint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = 0.0;
  *(double *)&v27 = -1.0;
  -[RTPeopleDensityRecordRunningRecentObservation runningRecords](self->_runningRecentBundle, "runningRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDatetime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v5);
  v8 = v7;

  v9 = (void *)objc_opt_class();
  -[RTPeopleDensityRecordRunningRecentObservation runningRecords](self->_runningRecentBundle, "runningRecords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_computeDensityScore:scanDuration:forRecords:", &v27, &v26, v10);

  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v26;
    -[RTPeopleDensityRecordRunningRecentObservation currentConfidenceThreshold](self->_runningRecentBundle, "currentConfidenceThreshold");
    *(_DWORD *)buf = 138413058;
    v29 = v5;
    v30 = 2048;
    v31 = v8;
    v32 = 2048;
    v33 = v12;
    v34 = 2048;
    v35 = v13;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#RTPeopleDensityRecord fetchCurrentHighConfidenceBundle runningRecordsStartdatetime:%@, theoreticalObsSpanSeconds: %f, totalScanDuration: %f, currentConfidenceThreshold: %f", buf, 0x2Au);
  }

  v14 = v26 / v8;
  -[RTPeopleDensityRecordRunningRecentObservation currentConfidenceThreshold](self->_runningRecentBundle, "currentConfidenceThreshold");
  if (v14 <= v15)
  {
    v24 = 0;
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0D18410]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPeopleDensityRecordRunningRecentObservation runningRecords](self->_runningRecentBundle, "runningRecords");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "startDatetime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v26;
    v21 = *(double *)&v27;
    -[RTPeopleDensityRecordRunningRecentObservation getHistogram](self->_runningRecentBundle, "getHistogram");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v16, "initWithBundleUUID:startDate:endDate:densityScore:scanDuration:rssiHistogram:", v17, v20, 0, v23, v21, v22);

  }
  return v24;
}

+ (void)_computeDensityScore:(double *)a3 scanDuration:(double *)a4 forRecords:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t j;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "scanDuration");
        v11 = v11 + v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
    if (v11 != 0.0)
    {
      *a4 = v11;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v14 = v7;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v27;
        v18 = 0.0;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
            objc_msgSend(v20, "scanDuration", (_QWORD)v26);
            v22 = 1.0 / (v21 / 900.0 + 1.0);
            v23 = (double)(unint64_t)objc_msgSend(v20, "advertisementsCount");
            objc_msgSend(v20, "scanDuration");
            v18 = v18 + v22 * (v24 / v11 * v23);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        }
        while (v16);
      }
      else
      {
        v18 = 0.0;
      }

      *a3 = v18;
      goto LABEL_23;
    }
  }
  else
  {
    v11 = 0.0;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "#RTPeopleDensityRecord receives zero total scan duration when computing scores", buf, 2u);
  }

  *a3 = -1.0;
  *a4 = v11;
LABEL_23:

}

- (id)computeRssiHistogram
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[NSMutableDictionary allKeys](self->_addressToRssiValues, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v16;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "#RTPeopleDensityRecord computing RSSI histogram, unique addresses %@", buf, 0xCu);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allKeys](self->_addressToRssiValues, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_addressToRssiValues, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_opt_class(), "_computeMeanOfRssi:", v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "integerValue") + 1;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v10);

          }
          else
          {
            objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9327C98, v10);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v3;
}

+ (int)_computeMeanOfRssi:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  NSObject *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v8 = v8 + (double)(int)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "intValue", (_QWORD)v13);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v11 = 3 * (uint64_t)rint(v8 / (double)(unint64_t)objc_msgSend(v4, "count") / 3.0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v3;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "_computeMeanOfRssi divide by 0: %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

+ (id)computeRssiHistogramForAdvs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v10, "address");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = (void *)objc_opt_new();
          objc_msgSend(v10, "address");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

        }
        objc_msgSend(v10, "address");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "rssi"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v5, "allKeys");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v30);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
        {
          v23 = objc_msgSend(a1, "_computeMeanOfRssi:", v22);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "integerValue") + 1;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, v24);

          }
          else
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E9327C98, v24);
          }

        }
      }
      v19 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v19);
  }

  return v4;
}

- (void)closeDensityBundle:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTPeopleDensityRecord queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__RTPeopleDensityRecord_closeDensityBundle___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __44__RTPeopleDensityRecord_closeDensityBundle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDensityBundle:", *(_QWORD *)(a1 + 40));
}

- (void)_closeDensityBundle:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  SEL v23;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    -[RTPeopleDensityRecord peopleDensityStore](self, "peopleDensityStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke;
    v21[3] = &unk_1E9297628;
    v23 = a2;
    v8 = v5;
    v22 = v8;
    objc_msgSend(v6, "storePeopleDensity:handler:", v8, v21);

    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke_30;
    v19[3] = &unk_1E929BAA0;
    v19[4] = self;
    v20 = v8;
    v9 = (void *)MEMORY[0x1D8232094](v19);
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke_2;
    v16[3] = &unk_1E929B460;
    v17 = (id)objc_msgSend(v10, "initWithCString:encoding:", RTAnalyticsEventPeopleDiscoveryDensityEvents, 1);
    v18 = v9;
    v11 = v17;
    v12 = v9;
    v13 = (void *)MEMORY[0x1D8232094](v16);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

    v15 = v22;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bundle", buf, 2u);
    }
  }

}

void __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, event, %@, error, %@", (uint8_t *)&v7, 0x20u);

    }
  }

}

uint64_t __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke_30(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_class(), "computeEventMetrics:", *(_QWORD *)(a1 + 40));
}

id __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke_2(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(*(void **)(a1 + 32), v2);
  return v2;
}

+ (id)computeEventMetrics:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

  }
  else
  {
    v9 = -1.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("eventDuration"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "densityScore");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("densityScore"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "scanDuration");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("scanDuration"));

  return v4;
}

- (void)cleanUpOngoingPeopleDensityBundle
{
  NSDate *v3;
  NSDate *bundleStartDate;
  RTPeopleDensity *ongoingPeopleDensityEvent;

  -[NSMutableArray removeAllObjects](self->_records, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  bundleStartDate = self->_bundleStartDate;
  self->_bundleStartDate = v3;

  ongoingPeopleDensityEvent = self->_ongoingPeopleDensityEvent;
  self->_ongoingPeopleDensityEvent = 0;

  -[NSMutableDictionary removeAllObjects](self->_addressToRssiValues, "removeAllObjects");
}

- (void)mergeWithAnotherDensityRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double maxBackstopDuration;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *records;
  void *v21;
  RTPeopleDensity *ongoingPeopleDensityEvent;
  RTPeopleDensity *v23;
  void *v24;
  void *v25;
  RTPeopleDensity *v26;
  NSDate *bundleStartDate;
  void *v28;
  void *v29;
  NSDate *v30;
  void *v31;
  void *v32;
  NSDate *v33;
  NSDate *v34;
  NSDate *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherRecord", buf, 2u);
    }
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;
  maxBackstopDuration = (double)self->_maxBackstopDuration;

  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8 >= maxBackstopDuration)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleStartDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = (uint64_t)v24;
      v52 = 2112;
      v53 = v25;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "dropping people density records for stale records, current time, %@, bundle start time, %@", buf, 0x16u);

    }
    goto LABEL_34;
  }
  if (v11)
  {
    objc_msgSend(v4, "records");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    objc_msgSend(v4, "ongoingPeopleDensityEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleStartDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addressToRssiValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v51 = v13;
    v52 = 2112;
    v53 = v15;
    v54 = 2112;
    v55 = v16;
    v56 = 2048;
    v57 = objc_msgSend(v17, "count");
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "merging density record: number of records, %lu, ongoing density event, %@, bundle start time, %@, number of RSSI records, %lu", buf, 0x2Au);

  }
  objc_msgSend(v4, "records");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    records = self->_records;
    objc_msgSend(v4, "records");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](records, "addObjectsFromArray:", v21);

  }
  ongoingPeopleDensityEvent = self->_ongoingPeopleDensityEvent;
  if (ongoingPeopleDensityEvent)
  {
    v23 = ongoingPeopleDensityEvent;
  }
  else
  {
    objc_msgSend(v4, "ongoingPeopleDensityEvent");
    v23 = (RTPeopleDensity *)objc_claimAutoreleasedReturnValue();
  }
  v26 = self->_ongoingPeopleDensityEvent;
  self->_ongoingPeopleDensityEvent = v23;

  bundleStartDate = self->_bundleStartDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDate isEqualToDate:](bundleStartDate, "isEqualToDate:", v28))
  {
    objc_msgSend(v4, "bundleStartDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "bundleStartDate");
      v30 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v31 = self->_bundleStartDate;
      self->_bundleStartDate = v30;
      goto LABEL_22;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "bundleStartDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v4, "bundleStartDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "earlierDate:", self->_bundleStartDate);
    v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v34 = self->_bundleStartDate;
    self->_bundleStartDate = v33;

  }
  else
  {
    v35 = self->_bundleStartDate;
    v32 = self->_bundleStartDate;
    self->_bundleStartDate = v35;
  }

LABEL_22:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v4, "addressToRssiValues", 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v36 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(v10);
        v40 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_addressToRssiValues, "objectForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_addressToRssiValues, "objectForKeyedSubscript:", v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v42)
            goto LABEL_32;
          objc_msgSend(v4, "addressToRssiValues");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", v40);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObjectsFromArray:", v44);

        }
        else
        {
          objc_msgSend(v4, "addressToRssiValues");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_addressToRssiValues, "setObject:forKeyedSubscript:", v43, v40);
        }

LABEL_32:
      }
      v37 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v37);
  }
LABEL_34:

}

- (void)updateObservationIntervalSeconds:(double)a3
{
  -[RTPeopleDensityRecordRunningRecentObservation setCurrentObservationIntervalSeconds:](self->_runningRecentBundle, "setCurrentObservationIntervalSeconds:", a3);
}

- (void)updateConfidenceThreshold:(float)a3
{
  -[RTPeopleDensityRecordRunningRecentObservation setCurrentConfidenceThreshold:](self->_runningRecentBundle, "setCurrentConfidenceThreshold:");
}

- (RTPeopleDensityRecord)initWithCoder:(id)a3
{
  id v4;
  RTPeopleDensityRecord *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *records;
  uint64_t v11;
  RTPeopleDensity *ongoingPeopleDensityEvent;
  uint64_t v13;
  NSDate *bundleStartDate;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *addressToRssiValues;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTPeopleDensityRecord;
  v5 = -[RTPeopleDensityRecord init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("DensityRecord"));
    v9 = objc_claimAutoreleasedReturnValue();
    records = v5->_records;
    v5->_records = (NSMutableArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OngoingPeopleDensityEvent"));
    v11 = objc_claimAutoreleasedReturnValue();
    ongoingPeopleDensityEvent = v5->_ongoingPeopleDensityEvent;
    v5->_ongoingPeopleDensityEvent = (RTPeopleDensity *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BundleStartDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    bundleStartDate = v5->_bundleStartDate;
    v5->_bundleStartDate = (NSDate *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("RSSIRecords"));
    v20 = objc_claimAutoreleasedReturnValue();
    addressToRssiValues = v5->_addressToRssiValues;
    v5->_addressToRssiValues = (NSMutableDictionary *)v20;

  }
  return v5;
}

- (NSDate)bundleStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)addressToRssiValues
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (RTPeopleDensityRecordRunningRecentObservation)runningRecentBundle
{
  return self->_runningRecentBundle;
}

- (void)setRunningRecentBundle:(id)a3
{
  objc_storeStrong((id *)&self->_runningRecentBundle, a3);
}

- (RTPeopleDensity)ongoingPeopleDensityEvent
{
  return self->_ongoingPeopleDensityEvent;
}

- (void)setOngoingPeopleDensityEvent:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingPeopleDensityEvent, a3);
}

- (unint64_t)maxBundleDuration
{
  return self->_maxBundleDuration;
}

- (void)setMaxBundleDuration:(unint64_t)a3
{
  self->_maxBundleDuration = a3;
}

- (unint64_t)maxBackstopDuration
{
  return self->_maxBackstopDuration;
}

- (void)setMaxBackstopDuration:(unint64_t)a3
{
  self->_maxBackstopDuration = a3;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTPeopleDensityStore)peopleDensityStore
{
  return self->_peopleDensityStore;
}

- (void)setPeopleDensityStore:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDensityStore, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (float)highDensityThreshold
{
  return self->_highDensityThreshold;
}

- (void)setHighDensityThreshold:(float)a3
{
  self->_highDensityThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_peopleDensityStore, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_ongoingPeopleDensityEvent, 0);
  objc_storeStrong((id *)&self->_runningRecentBundle, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_addressToRssiValues, 0);
  objc_storeStrong((id *)&self->_bundleStartDate, 0);
}

@end
