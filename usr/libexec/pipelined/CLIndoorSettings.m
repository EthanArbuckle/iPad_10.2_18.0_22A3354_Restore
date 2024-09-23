@implementation CLIndoorSettings

- (CLIndoorSettings)init
{
  return -[CLIndoorSettings initWithSettings:](self, "initWithSettings:", &__NSDictionary0__struct);
}

+ (id)settingToSet:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;

  v3 = a3;
  if (!v3)
    goto LABEL_15;
  v4 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
LABEL_9:
    v7 = (id)v5;
    goto LABEL_16;
  }
  v6 = objc_opt_class(NSSet);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    v8 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0
      || (v9 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v3, v9) & 1) != 0))
    {
      v5 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v3));
      goto LABEL_9;
    }
    if (qword_100417EE8 != -1)
      dispatch_once(&qword_100417EE8, &stru_1003EE7D8);
    v10 = (id)qword_100417EF0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
      v13 = 138543362;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Cannot cast %{public}@ to a set", (uint8_t *)&v13, 0xCu);

    }
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = v3;
LABEL_16:

  return v7;
}

- (CLIndoorSettings)initWithSettings:(id)a3
{
  id v4;
  CLIndoorSettings *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSString *indoorAvailabilityTilesServerUrl;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  CLGpsPosition *v50;
  void *v51;
  BOOL v52;
  void *v53;
  unint64_t v54;
  CLGpsPosition *v55;
  CLGpsPosition *fakeLastFix;
  void *v57;
  void *v58;
  double v59;
  CLIndoorSettings *v60;
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
  char v72[20];
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  objc_super v77;
  uint8_t buf[4];
  NSString *v79;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)CLIndoorSettings;
  v5 = -[CLIndoorSettings init](&v77, "init");
  if (!v5)
    goto LABEL_53;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_1004181C8));
  v65 = v6;
  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 1;
  v5->_pipelinedEnabled = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_1004181D0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorSettings settingToSet:](CLIndoorSettings, "settingToSet:", v8));
  -[CLIndoorSettings setDisabledVenues:](v5, "setDisabledVenues:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_1004181D8));
  v64 = v10;
  if (v10)
    objc_msgSend(v10, "doubleValue");
  else
    v11 = 10.0;
  -[CLIndoorSettings setDebounceInterval:](v5, "setDebounceInterval:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_1004181E0));
  v63 = v12;
  if (v12)
    objc_msgSend(v12, "doubleValue");
  else
    v13 = 5.0;
  -[CLIndoorSettings setErrorBackoffDuration:](v5, "setErrorBackoffDuration:", (uint64_t)(v13 * 1000000000.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418240));
  v62 = v14;
  if (v14)
    v15 = (int)objc_msgSend(v14, "intValue");
  else
    v15 = 86400;
  v5->_tilePrefetchActivityInterval.__rep_ = v15;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418248));
  if (v71)
  {
    v5->_tilePrefetchPredictionActivityCycleAllowance.m_storage = objc_msgSend(v71, "unsignedIntValue");
    v5->_tilePrefetchPredictionActivityCycleAllowance.m_initialized = 1;
  }
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_1004181E8));
  if (v70)
  {
    objc_msgSend(v70, "doubleValue");
    -[CLIndoorSettings setTilePrefetchRadius:](v5, "setTilePrefetchRadius:", 1, v16);
  }
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_1004181F0));
  if (v69)
  {
    objc_msgSend(v69, "doubleValue");
    -[CLIndoorSettings setTilePrefetchMaxCount:](v5, "setTilePrefetchMaxCount:", 1, (unint64_t)v17);
  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_1004181F8));
  if (v68)
  {
    objc_msgSend(v68, "doubleValue");
    -[CLIndoorSettings setPrefetchClusterMergeRadius:](v5, "setPrefetchClusterMergeRadius:", 1, v18);
  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418200));
  if (v67)
  {
    objc_msgSend(v67, "doubleValue");
    -[CLIndoorSettings setTilePrefetchRadius:](v5, "setTilePrefetchRadius:", 1, v19);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418208));
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "doubleValue");
    -[CLIndoorSettings setTilePrefetchMaxCount:](v5, "setTilePrefetchMaxCount:", 1, (unint64_t)v22);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418210));
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "doubleValue");
    -[CLIndoorSettings setPrefetchClusterMergeRadius:](v5, "setPrefetchClusterMergeRadius:", 1, v25);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418218));
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "doubleValue");
    -[CLIndoorSettings setRegionalTilePrefetchRadius:](v5, "setRegionalTilePrefetchRadius:", 1, v28);
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418220));
  if (v21)
  {
    objc_msgSend(v66, "doubleValue");
    -[CLIndoorSettings setRegionalTilePrefetchMaxCount:](v5, "setRegionalTilePrefetchMaxCount:", 1, (unint64_t)v29);
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418228));
  v31 = v30;
  if (v30)
  {
    objc_msgSend(v30, "doubleValue");
    -[CLIndoorSettings setRegionalPrefetchClusterMergeRadius:](v5, "setRegionalPrefetchClusterMergeRadius:", 1, v32);
  }
  v5->_tilePrefetchRelevancyWindow.__rep_ = 604800;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_1004181C0));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "defaultForKey:defaultValue:", CFSTR("CLPipelineAvailabilityServer"), CFSTR("https://cl4.apple.com/2/m2/a.1/")));

  if (v33)
    v36 = v33;
  else
    v36 = v35;
  -[CLIndoorSettings setIndoorAvailabilityTilesServerUrl:](v5, "setIndoorAvailabilityTilesServerUrl:", v36);
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE7D8);
    v37 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      goto LABEL_40;
    goto LABEL_39;
  }
  v37 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_39:
    indoorAvailabilityTilesServerUrl = v5->_indoorAvailabilityTilesServerUrl;
    *(_DWORD *)buf = 138477827;
    v79 = indoorAvailabilityTilesServerUrl;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "indoorAvailabilityTilesServerUrl = %{private}@", buf, 0xCu);
  }
LABEL_40:
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418230));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorSettings settingToSet:](CLIndoorSettings, "settingToSet:", v39));
  -[CLIndoorSettings setForcedVenues:](v5, "setForcedVenues:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418238));
  v42 = v41;
  if (v41)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("lat")));
    objc_msgSend(v43, "doubleValue");
    v75 = v44;

    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("lon")));
    objc_msgSend((id)v45, "doubleValue");
    v76 = v46;

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("horizontalAccuracy")));
    LOBYTE(v45) = v47 == 0;

    if ((v45 & 1) != 0)
    {
      v73 = 0x4049000000000000;
    }
    else
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("horizontalAccuracy")));
      objc_msgSend(v48, "doubleValue");
      v73 = v49;

    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("lifespan")));
    v52 = v51 == 0;

    if (v52)
    {
      v74 = 0xBFF0000000000000;
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("lifespan")));
      objc_msgSend(v53, "doubleValue");
      v74 = v54;

    }
    v55 = -[CLGpsPosition initWithLocation:andPrivateLocation:]([CLGpsPosition alloc], "initWithLocation:andPrivateLocation:", v72, buf);
    fakeLastFix = v5->_fakeLastFix;
    v5->_fakeLastFix = v55;

  }
  else
  {
    v50 = v5->_fakeLastFix;
    v5->_fakeLastFix = 0;

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100418250));
  v58 = v57;
  if (v57)
    objc_msgSend(v57, "doubleValue");
  else
    v59 = 250.0;
  -[CLIndoorSettings setVenueGroupDistance:](v5, "setVenueGroupDistance:", v59);
  v60 = v5;

LABEL_53:
  return v5;
}

- (const)tilePrefetchRadius
{
  return &self->_tilePrefetchRadius;
}

- (const)tilePrefetchMaxCount
{
  return &self->_tilePrefetchMaxCount;
}

- (const)prefetchClusterMergeRadius
{
  return &self->_prefetchClusterMergeRadius;
}

- (BOOL)pipelinedEnabled
{
  return self->_pipelinedEnabled;
}

- (void)setPipelinedEnabled:(BOOL)a3
{
  self->_pipelinedEnabled = a3;
}

- (NSSet)disabledVenues
{
  return self->_disabledVenues;
}

- (void)setDisabledVenues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)debounceInterval
{
  return *(double *)(a1 + 24);
}

- (uint64_t)setDebounceInterval:(uint64_t)result
{
  *(double *)(result + 24) = a2;
  return result;
}

- (duration<long)errorBackoffDuration
{
  return self->_errorBackoffDuration;
}

- (void)setErrorBackoffDuration:(duration<long)long
{
  self->_errorBackoffDuration = a3;
}

- (duration<long)tilePrefetchActivityInterval
{
  return self->_tilePrefetchActivityInterval;
}

- (void)setTilePrefetchActivityInterval:(duration<long)long
{
  self->_tilePrefetchActivityInterval = a3;
}

- (optional<unsigned)tilePrefetchPredictionActivityCycleAllowance
{
  return self->_tilePrefetchPredictionActivityCycleAllowance;
}

- (void)setTilePrefetchPredictionActivityCycleAllowance:(optional<unsigned int>)a3
{
  self->_tilePrefetchPredictionActivityCycleAllowance = a3;
}

- (void)setTilePrefetchRadius:(optional<double>)a3
{
  self->_tilePrefetchRadius = a3;
}

- (void)setTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_tilePrefetchMaxCount = a3;
}

- (void)setPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_prefetchClusterMergeRadius = a3;
}

- (optional<double>)indoorTilePrefetchRadius
{
  double m_storage;
  uint64_t v3;
  optional<double> result;

  m_storage = self->_indoorTilePrefetchRadius.m_storage;
  v3 = *(_QWORD *)&self->_indoorTilePrefetchRadius.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorTilePrefetchRadius:(optional<double>)a3
{
  self->_indoorTilePrefetchRadius = a3;
}

- (optional<unsigned)indoorTilePrefetchMaxCount
{
  unint64_t m_storage;
  uint64_t v3;
  optional<unsigned long> result;

  m_storage = self->_indoorTilePrefetchMaxCount.m_storage;
  v3 = *(_QWORD *)&self->_indoorTilePrefetchMaxCount.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_indoorTilePrefetchMaxCount = a3;
}

- (optional<double>)indoorPrefetchClusterMergeRadius
{
  double m_storage;
  uint64_t v3;
  optional<double> result;

  m_storage = self->_indoorPrefetchClusterMergeRadius.m_storage;
  v3 = *(_QWORD *)&self->_indoorPrefetchClusterMergeRadius.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setIndoorPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_indoorPrefetchClusterMergeRadius = a3;
}

- (optional<double>)regionalTilePrefetchRadius
{
  double m_storage;
  uint64_t v3;
  optional<double> result;

  m_storage = self->_regionalTilePrefetchRadius.m_storage;
  v3 = *(_QWORD *)&self->_regionalTilePrefetchRadius.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalTilePrefetchRadius:(optional<double>)a3
{
  self->_regionalTilePrefetchRadius = a3;
}

- (optional<unsigned)regionalTilePrefetchMaxCount
{
  unint64_t m_storage;
  uint64_t v3;
  optional<unsigned long> result;

  m_storage = self->_regionalTilePrefetchMaxCount.m_storage;
  v3 = *(_QWORD *)&self->_regionalTilePrefetchMaxCount.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalTilePrefetchMaxCount:(optional<unsigned long>)a3
{
  self->_regionalTilePrefetchMaxCount = a3;
}

- (optional<double>)regionalPrefetchClusterMergeRadius
{
  double m_storage;
  uint64_t v3;
  optional<double> result;

  m_storage = self->_regionalPrefetchClusterMergeRadius.m_storage;
  v3 = *(_QWORD *)&self->_regionalPrefetchClusterMergeRadius.m_initialized;
  result.m_storage = m_storage;
  result.m_initialized = v3;
  return result;
}

- (void)setRegionalPrefetchClusterMergeRadius:(optional<double>)a3
{
  self->_regionalPrefetchClusterMergeRadius = a3;
}

- (duration<long)tilePrefetchRelevancyWindow
{
  return self->_tilePrefetchRelevancyWindow;
}

- (void)setTilePrefetchRelevancyWindow:(duration<long)long
{
  self->_tilePrefetchRelevancyWindow = a3;
}

- (NSString)indoorAvailabilityTilesServerUrl
{
  return self->_indoorAvailabilityTilesServerUrl;
}

- (void)setIndoorAvailabilityTilesServerUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)forcedVenues
{
  return self->_forcedVenues;
}

- (void)setForcedVenues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CLGpsPosition)fakeLastFix
{
  return self->_fakeLastFix;
}

- (void)setFakeLastFix:(id)a3
{
  objc_storeStrong((id *)&self->_fakeLastFix, a3);
}

- (double)venueGroupDistance
{
  return self->_venueGroupDistance;
}

- (void)setVenueGroupDistance:(double)a3
{
  self->_venueGroupDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeLastFix, 0);
  objc_storeStrong((id *)&self->_forcedVenues, 0);
  objc_storeStrong((id *)&self->_indoorAvailabilityTilesServerUrl, 0);
  objc_storeStrong((id *)&self->_disabledVenues, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 48) = 0;
  *((_BYTE *)self + 96) = 0;
  *((_BYTE *)self + 112) = 0;
  *((_BYTE *)self + 128) = 0;
  *((_BYTE *)self + 144) = 0;
  *((_BYTE *)self + 160) = 0;
  *((_BYTE *)self + 176) = 0;
  *((_BYTE *)self + 192) = 0;
  *((_BYTE *)self + 208) = 0;
  *((_BYTE *)self + 224) = 0;
  return self;
}

@end
