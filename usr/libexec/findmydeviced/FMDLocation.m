@implementation FMDLocation

- (FMDLocation)initWithLocation:(id)a3 eventType:(int64_t)a4 positionType:(unsigned __int8)a5
{
  id v9;
  FMDLocation *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialQueue;
  uint64_t v13;
  NSDate *timeStamp;
  FMDVolatileMetaDataRecord *v15;
  FMDVolatileMetaDataRecord *metaDataRecord;
  objc_super v18;

  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMDLocation;
  v10 = -[FMDLocation init](&v18, "init");
  if (v10)
  {
    v11 = dispatch_queue_create("FMDLocationQueue", 0);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    timeStamp = v10->_timeStamp;
    v10->_timeStamp = (NSDate *)v13;

    objc_storeStrong((id *)&v10->_location, a3);
    v10->_eventType = a4;
    v10->_positionType = a5;
    v15 = (FMDVolatileMetaDataRecord *)objc_alloc_init((Class)FMDVolatileMetaDataRecord);
    metaDataRecord = v10->_metaDataRecord;
    v10->_metaDataRecord = v15;

  }
  return v10;
}

- (FMDLocation)initWithCoder:(id)a3
{
  id v4;
  FMDLocation *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  NSDate *timeStamp;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  FMDVolatileMetaDataRecord *metaDataRecord;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FMDLocation;
  v5 = -[FMDLocation init](&v29, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("FMDLocationQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    v9 = objc_opt_class(NSDate, v8);
    v10 = NSStringFromSelector("timeStamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v11));
    timeStamp = v5->_timeStamp;
    v5->_timeStamp = (NSDate *)v12;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CLLocationFMGeoLocatableAdapter, v14), CFSTR("geoLocation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (objc_msgSend(v16, "conformsToProtocol:", &OBJC_PROTOCOL___FMGeoLocatable))
      objc_storeStrong((id *)&v5->_location, v16);
    v18 = objc_opt_class(NSNumber, v17);
    v19 = NSStringFromSelector("eventType");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v20));
    v5->_eventType = (int64_t)objc_msgSend(v21, "integerValue");

    v23 = objc_opt_class(FMDVolatileMetaDataRecord, v22);
    v24 = NSStringFromSelector("metaDataRecord");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v25));
    metaDataRecord = v5->_metaDataRecord;
    v5->_metaDataRecord = (FMDVolatileMetaDataRecord *)v26;

  }
  return v5;
}

- (FMDLocation)initWithDictionary:(id)a3
{
  id v4;
  FMDLocation *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  double v20;
  CLLocationDegrees v21;
  CLLocationDegrees v22;
  CLLocationCoordinate2D v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  CLLocationFMGeoLocatableAdapter *v36;
  void *v37;
  FMDVolatileMetaDataRecord *v38;
  FMDVolatileMetaDataRecord *metaDataRecord;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_super v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)FMDLocation;
  v5 = -[FMDLocation init](&v54, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("FMDLocationQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationTimestamp")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate fm_dateFromEpoch:](NSDate, "fm_dateFromEpoch:", objc_msgSend(v53, "integerValue")));
    -[FMDLocation setTimeStamp:](v5, "setTimeStamp:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType")));
    -[FMDLocation setEventType:](v5, "setEventType:", (int)objc_msgSend(v9, "intValue"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationTypeEnum")));
    -[FMDLocation setPositionType:](v5, "setPositionType:", objc_msgSend(v10, "intValue"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latitude")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longitude")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alt")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("horizontalAccuracy")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vertAcc")));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speed")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("course")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationTimestamp")));
    v18 = objc_msgSend(v17, "integerValue");

    v19 = objc_alloc((Class)CLLocation);
    v52 = v11;
    objc_msgSend(v11, "doubleValue");
    v21 = v20;
    v51 = v12;
    objc_msgSend(v12, "doubleValue");
    v23 = CLLocationCoordinate2DMake(v21, v22);
    objc_msgSend(v13, "doubleValue");
    v25 = v24;
    v50 = v14;
    objc_msgSend(v14, "doubleValue");
    v27 = v26;
    objc_msgSend(v15, "doubleValue");
    v29 = v28;
    objc_msgSend(v16, "doubleValue");
    v31 = v30;
    objc_msgSend(v49, "doubleValue");
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate fm_dateFromEpoch:](NSDate, "fm_dateFromEpoch:", v18));
    v35 = objc_msgSend(v19, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v34, v23.latitude, v23.longitude, v25, v27, v29, v31, v33);

    v36 = -[CLLocationFMGeoLocatableAdapter initWithLocation:]([CLLocationFMGeoLocatableAdapter alloc], "initWithLocation:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("positionTypeEnum")));
    -[CLLocationFMGeoLocatableAdapter setLocationType:](v36, "setLocationType:", (int)objc_msgSend(v37, "intValue"));

    -[FMDLocation setLocation:](v5, "setLocation:", v36);
    v38 = (FMDVolatileMetaDataRecord *)objc_alloc_init((Class)FMDVolatileMetaDataRecord);
    metaDataRecord = v5->_metaDataRecord;
    v5->_metaDataRecord = v38;

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceInfo")));
    if (v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocation metaDataRecord](v5, "metaDataRecord"));
      v57 = CFSTR("deviceInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceInfo")));
      v58 = v42;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
      objc_msgSend(v41, "appendMetaData:", v43);

    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kFMDTrackedLocationsStoreTrackFMDBatteryInfo")));

    if (v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocation metaDataRecord](v5, "metaDataRecord"));
      v55 = CFSTR("kFMDTrackedLocationsStoreTrackFMDBatteryInfo");
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kFMDTrackedLocationsStoreTrackFMDBatteryInfo")));
      v56 = v46;
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
      objc_msgSend(v45, "appendMetaData:", v47);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timeStamp;
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;

  timeStamp = self->_timeStamp;
  v5 = a3;
  v6 = NSStringFromSelector("timeStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "encodeObject:forKey:", timeStamp, v7);

  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("geoLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_eventType));
  v9 = NSStringFromSelector("eventType");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v5, "encodeObject:forKey:", v8, v10);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[FMDLocation metaDataRecord](self, "metaDataRecord"));
  v11 = NSStringFromSelector("metaDataRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v5, "encodeObject:forKey:", v13, v12);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDVolatileMetaDataRecord)metaDataRecord
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000580C4;
  v10 = sub_1000580D4;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000580DC;
  v5[3] = &unk_1002C11C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (FMDVolatileMetaDataRecord *)v3;
}

- (NSDictionary)dictionaryValue
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate stringValueForServer](self->_timeStamp, "stringValueForServer"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v4, CFSTR("timestamp"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[NSDate fm_epoch](self->_timeStamp, "fm_epoch")));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v5, CFSTR("locationTimestamp"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_eventType));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v6, CFSTR("eventType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable latitude](self->_location, "latitude"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v7, CFSTR("latitude"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable longitude](self->_location, "longitude"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v8, CFSTR("longitude"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable horizontalAccuracy](self->_location, "horizontalAccuracy"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v9, CFSTR("horizontalAccuracy"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable verticalAccuracy](self->_location, "verticalAccuracy"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v10, CFSTR("vertAcc"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable speed](self->_location, "speed"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v11, CFSTR("speed"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable course](self->_location, "course"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v12, CFSTR("course"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocation location](self, "location"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v13, "locationType")));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v14, CFSTR("positionTypeEnum"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocation location](self, "location"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocation stringForLocationType:](self, "stringForLocationType:", objc_msgSend(v15, "locationType")));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v16, CFSTR("positionType"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[FMDLocation positionType](self, "positionType")));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v17, CFSTR("locationTypeEnum"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocation _trackedLocationTypeAsString:](self, "_trackedLocationTypeAsString:", -[FMDLocation positionType](self, "positionType")));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v18, CFSTR("locationType"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable altitude](self->_location, "altitude"));
  -[NSMutableDictionary fm_safeSetObject:forKey:](v3, "fm_safeSetObject:forKey:", v19, CFSTR("alt"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocation metaDataRecord](self, "metaDataRecord"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dictionaryValue"));
  -[NSMutableDictionary setValuesForKeysWithDictionary:](v3, "setValuesForKeysWithDictionary:", v21);

  return (NSDictionary *)v3;
}

- (id)stringForLocationType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9)
    return CFSTR("Unknown");
  else
    return off_1002C35A8[a3 - 1];
}

- (id)_trackedLocationTypeAsString:(unsigned __int8)a3
{
  if ((a3 + 1) > 4u)
    return &stru_1002CD590;
  else
    return off_1002C35F8[(char)(a3 + 1)];
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_timeStamp, a3);
}

- (FMGeoLocatable)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (unsigned)positionType
{
  return self->_positionType;
}

- (void)setPositionType:(unsigned __int8)a3
{
  self->_positionType = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_metaDataRecord, 0);
}

@end
