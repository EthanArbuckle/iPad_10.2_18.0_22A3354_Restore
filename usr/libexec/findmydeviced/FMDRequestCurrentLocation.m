@implementation FMDRequestCurrentLocation

- (FMDRequestCurrentLocation)initWithAccount:(id)a3 location:(id)a4 finalLocation:(BOOL)a5 reason:(int64_t)a6 accuracyChange:(double)a7 cacheValidityDuration:(double)a8
{
  _BOOL8 v11;
  id v14;
  FMDRequestCurrentLocation *v15;
  FMDRequestCurrentLocation *v16;
  objc_super v18;

  v11 = a5;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FMDRequestCurrentLocation;
  v15 = -[FMDRequest initWithAccount:](&v18, "initWithAccount:", a3);
  v16 = v15;
  if (v15)
  {
    -[FMDRequestCurrentLocation setLocation:](v15, "setLocation:", v14);
    -[FMDRequestCurrentLocation setFinalLocation:](v16, "setFinalLocation:", v11);
    -[FMDRequestCurrentLocation setPublishReason:](v16, "setPublishReason:", a6);
    -[FMDRequestCurrentLocation setAccuracyChange:](v16, "setAccuracyChange:", a7);
    -[FMDRequestCurrentLocation setCacheValidityDuration:](v16, "setCacheValidityDuration:", a8);
  }

  return v16;
}

- (id)urlTemplateType
{
  return CFSTR("currentLocation");
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FMDRequestCurrentLocation;
  v3 = -[FMDRequest requestBody](&v13, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", qword_1003049F0));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("statusCode"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestCurrentLocation location](self, "location"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryValue"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDRequestCurrentLocation finalLocation](self, "finalLocation")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("locationFinished"));

  if (-[FMDRequestCurrentLocation publishReason](self, "publishReason"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDRequestCurrentLocation publishReason](self, "publishReason")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("reason"));

  }
  -[FMDRequestCurrentLocation accuracyChange](self, "accuracyChange");
  if (v10 != 0.0)
  {
    -[FMDRequestCurrentLocation accuracyChange](self, "accuracyChange");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("accuracyChange"));

  }
  return v4;
}

- (int64_t)maxTimerBasedNetworkRetries
{
  return 10;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return 10;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return 10;
}

- (BOOL)canRequestBeRetriedNow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestCurrentLocation location](self, "location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeStamp"));
  -[FMDRequestCurrentLocation cacheValidityDuration](self, "cacheValidityDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (objc_msgSend(v6, "compare:", v5) == (id)1)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)FMDRequestCurrentLocation;
    v7 = -[FMDRequest canRequestBeRetriedNow](&v9, "canRequestBeRetriedNow");
  }

  return v7;
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  LOBYTE(self) = objc_opt_isKindOfClass(v4, v6);

  return self & 1;
}

- (FMDLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)finalLocation
{
  return self->_finalLocation;
}

- (void)setFinalLocation:(BOOL)a3
{
  self->_finalLocation = a3;
}

- (int64_t)publishReason
{
  return self->_publishReason;
}

- (void)setPublishReason:(int64_t)a3
{
  self->_publishReason = a3;
}

- (double)accuracyChange
{
  return self->_accuracyChange;
}

- (void)setAccuracyChange:(double)a3
{
  self->_accuracyChange = a3;
}

- (double)cacheValidityDuration
{
  return self->_cacheValidityDuration;
}

- (void)setCacheValidityDuration:(double)a3
{
  self->_cacheValidityDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
