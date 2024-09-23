@implementation FMDSecureLocationInfo

- (FMDSecureLocationInfo)initWithLocation:(id)a3 motion:(id)a4 publishReason:(int64_t)a5
{
  id v9;
  id v10;
  FMDSecureLocationInfo *v11;
  FMDSecureLocationInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FMDSecureLocationInfo;
  v11 = -[FMDSecureLocationInfo init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_locationInfo, a3);
    objc_storeStrong((id *)&v12->_motionInfo, a4);
    v12->_publishReason = a5;
  }

  return v12;
}

+ (id)stringFromPublishReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return CFSTR("unknown");
  else
    return off_1002C3E48[a3 - 1];
}

- (id)convertToSecureLocationObject
{
  id v3;
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

  v3 = objc_alloc_init((Class)SPSecureLocation);
  objc_msgSend(v3, "setFindMyId:", &stru_1002CD590);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable latitude](self->_locationInfo, "latitude"));
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v3, "setLatitude:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable longitude](self->_locationInfo, "longitude"));
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v3, "setLongitude:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable horizontalAccuracy](self->_locationInfo, "horizontalAccuracy"));
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v3, "setHorizontalAccuracy:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable verticalAccuracy](self->_locationInfo, "verticalAccuracy"));
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v3, "setVerticalAccuracy:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable speed](self->_locationInfo, "speed"));
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v3, "setSpeed:");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable course](self->_locationInfo, "course"));
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v3, "setCourse:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable floor](self->_locationInfo, "floor"));
  objc_msgSend(v3, "setFloor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable timestamp](self->_locationInfo, "timestamp"));
  if (v11)
  {
    objc_msgSend(v3, "setTimestamp:", v11);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v3, "setTimestamp:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationInfo motionInfo](self, "motionInfo"));
  objc_msgSend(v3, "setMotionActivityState:", -[FMDSecureLocationInfo _spMotionStateFrom:](self, "_spMotionStateFrom:", objc_msgSend(v13, "activityState")));

  objc_msgSend(v3, "setPublishReason:", -[FMDSecureLocationInfo _spPublishReasonFrom:](self, "_spPublishReasonFrom:", -[FMDSecureLocationInfo publishReason](self, "publishReason")));
  return v3;
}

- (BOOL)isLocationValid
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable latitude](self->_locationInfo, "latitude"));
  objc_msgSend(v3, "doubleValue");
  if (v4 == 0.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMGeoLocatable longitude](self->_locationInfo, "longitude"));
    objc_msgSend(v5, "doubleValue");
    v7 = v6 != 0.0;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (int64_t)_spMotionStateFrom:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 5)
    return 0;
  else
    return a3;
}

- (int64_t)_spPublishReasonFrom:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xC)
    return 0;
  else
    return a3;
}

- (FMGeoLocatable)locationInfo
{
  return self->_locationInfo;
}

- (void)setLocationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_locationInfo, a3);
}

- (FMDDeviceMotion)motionInfo
{
  return self->_motionInfo;
}

- (void)setMotionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_motionInfo, a3);
}

- (int64_t)publishReason
{
  return self->_publishReason;
}

- (void)setPublishReason:(int64_t)a3
{
  self->_publishReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionInfo, 0);
  objc_storeStrong((id *)&self->_locationInfo, 0);
}

@end
