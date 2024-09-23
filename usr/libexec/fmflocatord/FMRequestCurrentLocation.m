@implementation FMRequestCurrentLocation

- (void)deinitializeRequest
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMRequestCurrentLocation;
  -[FMRequest deinitializeRequest](&v3, "deinitializeRequest");
  -[FMRequestCurrentLocation setLocation:](self, "setLocation:", 0);
  -[FMRequestCurrentLocation setLocateCommand:](self, "setLocateCommand:", 0);
}

- (FMRequestCurrentLocation)initWithProvider:(id)a3 location:(id)a4 finalLocation:(BOOL)a5 locateCommand:(id)a6 reason:(int64_t)a7 accuracyChange:(double)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  FMRequestCurrentLocation *v16;
  FMRequestCurrentLocation *v17;
  objc_super v19;

  v11 = a5;
  v14 = a4;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)FMRequestCurrentLocation;
  v16 = -[FMRequest initWithProvider:](&v19, "initWithProvider:", a3);
  v17 = v16;
  if (v16)
  {
    -[FMRequestCurrentLocation setLocation:](v16, "setLocation:", v14);
    -[FMRequestCurrentLocation setFinalLocation:](v17, "setFinalLocation:", v11);
    -[FMRequestCurrentLocation setLocateCommand:](v17, "setLocateCommand:", v15);
    -[FMRequestCurrentLocation setPublishReason:](v17, "setPublishReason:", a7);
    -[FMRequestCurrentLocation setAccuracyChange:](v17, "setAccuracyChange:", a8);
  }

  return v17;
}

- (id)requestUrl
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "formattedURLForTemplate:", CFSTR("${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/currentLocation")));

  return v3;
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)FMRequestCurrentLocation;
  v3 = -[FMRequest requestBody](&v19, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_10005AF38, CFSTR("statusCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestCurrentLocation location](self, "location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMRequestCurrentLocation serializedFormOfLocation:](FMRequestCurrentLocation, "serializedFormOfLocation:", v5));
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMRequestCurrentLocation finalLocation](self, "finalLocation")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("locationFinished"));

  if (-[FMRequestCurrentLocation publishReason](self, "publishReason"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMRequestCurrentLocation publishReason](self, "publishReason")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("reason"));

  }
  -[FMRequestCurrentLocation accuracyChange](self, "accuracyChange");
  -[FMRequestCurrentLocation accuracyChange](self, "accuracyChange");
  if (fabs(v9) != INFINITY)
  {
    -[FMRequestCurrentLocation accuracyChange](self, "accuracyChange");
    if (v10 > 0.0)
    {
      -[FMRequestCurrentLocation accuracyChange](self, "accuracyChange");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("accuracyChange"));

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "standardDeviceContext"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestCurrentLocation locateCommand](self, "locateCommand"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("id")));

  objc_msgSend(v13, "fm_safelyMapKey:toObject:", CFSTR("cmdId"), v15);
  if (v13)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("deviceContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "locationDeviceInfo"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("deviceInfo"));

  return v4;
}

+ (id)serializedFormOfLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValueForServer"));

  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("timestamp"));
  objc_msgSend(v3, "coordinate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("latitude"));

  objc_msgSend(v3, "coordinate");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("longitude"));

  objc_msgSend(v3, "horizontalAccuracy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("horizontalAccuracy"));

  objc_msgSend(v3, "verticalAccuracy");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("vertAcc"));

  objc_msgSend(v3, "altitude");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("alt"));

  objc_msgSend(v3, "speed");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("speed"));

  objc_msgSend(v3, "course");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("course"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "floor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "level")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("floorLevel"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CommonUtil stringForLocationType:](CommonUtil, "stringForLocationType:", objc_msgSend(v3, "type")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("positionType"));

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
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestCurrentLocation location](self, "location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestCurrentLocation locateCommand](self, "locateCommand"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locationValidityDuration")));
  objc_msgSend(v6, "doubleValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (objc_msgSend(v8, "compare:", v7) == (id)1)
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)FMRequestCurrentLocation;
    v9 = -[FMRequest canRequestBeRetriedNow](&v11, "canRequestBeRetriedNow");
  }

  return v9;
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v9 = objc_opt_class(self, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
      v12 = v10 == v11;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CLLocation)location
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

- (NSDictionary)locateCommand
{
  return self->_locateCommand;
}

- (void)setLocateCommand:(id)a3
{
  objc_storeStrong((id *)&self->_locateCommand, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locateCommand, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
