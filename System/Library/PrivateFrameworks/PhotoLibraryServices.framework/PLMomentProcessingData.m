@implementation PLMomentProcessingData

- (PLMomentProcessingData)initWithMoment:(id)a3
{
  id v4;
  PLMomentProcessingData *v5;
  uint64_t v6;
  NSString *pl_uuid;
  uint64_t v8;
  NSDate *pl_startDate;
  uint64_t v10;
  NSDate *pl_endDate;
  uint64_t v12;
  CLLocation *pl_location;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLMomentProcessingData;
  v5 = -[PLMomentProcessingData init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pl_uuid");
    v6 = objc_claimAutoreleasedReturnValue();
    pl_uuid = v5->_pl_uuid;
    v5->_pl_uuid = (NSString *)v6;

    objc_msgSend(v4, "pl_startDate");
    v8 = objc_claimAutoreleasedReturnValue();
    pl_startDate = v5->_pl_startDate;
    v5->_pl_startDate = (NSDate *)v8;

    objc_msgSend(v4, "pl_endDate");
    v10 = objc_claimAutoreleasedReturnValue();
    pl_endDate = v5->_pl_endDate;
    v5->_pl_endDate = (NSDate *)v10;

    v5->_pl_numberOfAssets = objc_msgSend(v4, "pl_numberOfAssets");
    objc_msgSend(v4, "pl_location");
    v12 = objc_claimAutoreleasedReturnValue();
    pl_location = v5->_pl_location;
    v5->_pl_location = (CLLocation *)v12;

    objc_msgSend(v4, "pl_coordinate");
    v5->_pl_coordinate.latitude = v14;
    v5->_pl_coordinate.longitude = v15;
    v5->_pl_originatorState = objc_msgSend(v4, "pl_originatorState");
    v5->_pl_locationType = objc_msgSend(v4, "pl_locationType");
  }

  return v5;
}

- (NSString)pl_uuid
{
  return self->_pl_uuid;
}

- (NSDate)pl_startDate
{
  return self->_pl_startDate;
}

- (NSDate)pl_endDate
{
  return self->_pl_endDate;
}

- (unint64_t)pl_numberOfAssets
{
  return self->_pl_numberOfAssets;
}

- (CLLocation)pl_location
{
  return self->_pl_location;
}

- (CLLocationCoordinate2D)pl_coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_pl_coordinate.latitude;
  longitude = self->_pl_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (signed)pl_originatorState
{
  return self->_pl_originatorState;
}

- (unsigned)pl_locationType
{
  return self->_pl_locationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pl_location, 0);
  objc_storeStrong((id *)&self->_pl_endDate, 0);
  objc_storeStrong((id *)&self->_pl_startDate, 0);
  objc_storeStrong((id *)&self->_pl_uuid, 0);
}

@end
