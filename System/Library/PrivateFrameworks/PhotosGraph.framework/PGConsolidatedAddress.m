@implementation PGConsolidatedAddress

- (PGConsolidatedAddress)initWithAddressNode:(id)a3 addressEdgesSortedByTime:(id)a4 centerCoordinates:(CLLocationCoordinate2D)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v10;
  id v11;
  PGConsolidatedAddress *v12;
  PGConsolidatedAddress *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  NSDate *startDate;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *timeLocationIdentifier;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PGConsolidatedAddress;
  v12 = -[PGConsolidatedAddress init](&v38, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_addressNode, a3);
    objc_storeStrong((id *)&v13->_addressEdgesSortedByTime, a4);
    v13->_centerCoordinates.latitude = latitude;
    v13->_centerCoordinates.longitude = longitude;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
      v18 = 1.79769313e308;
      v19 = -1.79769313e308;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v21, "timestampUTCStart");
          v23 = v22;
          objc_msgSend(v21, "timestampUTCEnd");
          if (v18 > v23)
            v18 = v23;
          if (v19 < v24)
            v19 = v24;
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v16);
    }
    else
    {
      v18 = 1.79769313e308;
      v19 = -1.79769313e308;
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v18);
    startDate = v13->_startDate;
    v13->_startDate = (NSDate *)v25;

    v13->_duration = v19 - v18;
    objc_msgSend(v14, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sourceNode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v28, "localIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@-%f-%f"), v30, *(_QWORD *)&latitude, *(_QWORD *)&longitude);
    v31 = objc_claimAutoreleasedReturnValue();
    timeLocationIdentifier = v13->_timeLocationIdentifier;
    v13->_timeLocationIdentifier = (NSString *)v31;

  }
  return v13;
}

- (CLLocationCoordinate2D)coordinates
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_centerCoordinates.latitude;
  longitude = self->_centerCoordinates.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (NSDate)endDate
{
  return -[NSDate dateByAddingTimeInterval:](self->_startDate, "dateByAddingTimeInterval:", self->_duration);
}

- (NSDate)expandedStartDate
{
  return -[NSDate dateByAddingTimeInterval:](self->_startDate, "dateByAddingTimeInterval:", -1800.0);
}

- (NSDate)expandedEndDate
{
  return -[NSDate dateByAddingTimeInterval:](self->_startDate, "dateByAddingTimeInterval:", self->_duration + 1800.0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *timeLocationIdentifier;
  NSDate *startDate;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PGConsolidatedAddress;
  -[PGConsolidatedAddress description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  timeLocationIdentifier = self->_timeLocationIdentifier;
  startDate = self->_startDate;
  -[PGConsolidatedAddress endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.8f, %.8f}"), *(_QWORD *)&self->_centerCoordinates.latitude, *(_QWORD *)&self->_centerCoordinates.longitude);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ identifier %@, startDate %@, endDate %@, coordinates %@"), v4, timeLocationIdentifier, startDate, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_timeLocationIdentifier, "hash");
  return -[NSDate hash](self->_startDate, "hash") ^ v3 ^ (unint64_t)self->_duration;
}

- (BOOL)isEqual:(id)a3
{
  PGConsolidatedAddress *v4;
  PGConsolidatedAddress *v5;
  NSString *timeLocationIdentifier;
  void *v7;
  NSDate *startDate;
  void *v9;
  double duration;
  double v11;
  BOOL v12;

  v4 = (PGConsolidatedAddress *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      timeLocationIdentifier = self->_timeLocationIdentifier;
      -[PGConsolidatedAddress timeLocationIdentifier](v5, "timeLocationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](timeLocationIdentifier, "isEqual:", v7))
      {
        startDate = self->_startDate;
        -[PGConsolidatedAddress startDate](v5, "startDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSDate isEqual:](startDate, "isEqual:", v9))
        {
          duration = self->_duration;
          -[PGConsolidatedAddress duration](v5, "duration");
          v12 = duration == v11;
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

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (PGGraphAddressNode)addressNode
{
  return self->_addressNode;
}

- (NSArray)addressEdgesSortedByTime
{
  return self->_addressEdgesSortedByTime;
}

- (CLLocationCoordinate2D)centerCoordinates
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_centerCoordinates.latitude;
  longitude = self->_centerCoordinates.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)timeLocationIdentifier
{
  return self->_timeLocationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLocationIdentifier, 0);
  objc_storeStrong((id *)&self->_expandedEndDate, 0);
  objc_storeStrong((id *)&self->_expandedStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_addressEdgesSortedByTime, 0);
  objc_storeStrong((id *)&self->_addressNode, 0);
}

@end
