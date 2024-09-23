@implementation TrafficIncidentLayout

- (TrafficIncidentLayout)initWithLayoutFormConfig:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  TrafficIncidentLayout *v8;
  TrafficIncidentLayout *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TrafficIncidentLayout;
  v8 = -[TrafficIncidentLayout init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_layoutRequestLocation, a4);
    -[TrafficIncidentLayout _populateLayoutFields:](v9, "_populateLayoutFields:", v6);
  }

  return v9;
}

- (TrafficIncidentLayout)initWithCoder:(id)a3
{
  id v4;
  TrafficIncidentLayout *v5;
  id v6;
  uint64_t v7;
  NSArray *layoutItems;
  id v9;
  uint64_t v10;
  GEOLocation *layoutRequestLocation;
  id v12;
  uint64_t v13;
  NSDate *layoutRequestTime;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TrafficIncidentLayout;
  v5 = -[TrafficIncidentLayout init](&v16, "init");
  if (v5)
  {
    v5->_incidentReportingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("incidentReportingEnabled"));
    v6 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(TrafficIncidentLayoutItem), CFSTR("layoutItems"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    layoutItems = v5->_layoutItems;
    v5->_layoutItems = (NSArray *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOLocation), CFSTR("layoutRequestLocation"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    layoutRequestLocation = v5->_layoutRequestLocation;
    v5->_layoutRequestLocation = (GEOLocation *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("layoutRequestTime"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    layoutRequestTime = v5->_layoutRequestTime;
    v5->_layoutRequestTime = (NSDate *)v13;

    v5->_layoutTimeToLive = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layoutTimeToLive"));
    v5->_layoutFreshnessRadius = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layoutFreshnessRadius"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 incidentReportingEnabled;
  id v5;

  incidentReportingEnabled = self->_incidentReportingEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", incidentReportingEnabled, CFSTR("incidentReportingEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layoutItems, CFSTR("layoutItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layoutRequestLocation, CFSTR("layoutRequestLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layoutRequestTime, CFSTR("layoutRequestTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_layoutTimeToLive, CFSTR("layoutTimeToLive"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_layoutFreshnessRadius, CFSTR("layoutFreshnessRadius"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("incidentReportingEnabled=%d layoutItems:%@ layoutRequestLocation:%@ layoutRequestTime:%@ layoutTimeToLive:%ld"), self->_incidentReportingEnabled, self->_layoutItems, self->_layoutRequestLocation, self->_layoutRequestTime, self->_layoutTimeToLive);
}

- (void)_populateLayoutFields:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  TrafficIncidentLayoutItem *v14;
  NSArray *layoutItems;
  NSArray *v16;
  NSDate *v17;
  NSDate *layoutRequestTime;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutFields"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10), "name"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "incidentField"));

        if (objc_msgSend(v12, "hasDisplayIncidentOnMap"))
          v13 = (uint64_t)objc_msgSend(v12, "displayIncidentOnMap");
        else
          v13 = 1;
        v14 = -[TrafficIncidentLayoutItem initWithTrafficIncidentType:displayOnMap:]([TrafficIncidentLayoutItem alloc], "initWithTrafficIncidentType:displayOnMap:", objc_msgSend(v12, "trafficType"), v13);
        -[NSArray addObject:](v5, "addObject:", v14);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  layoutItems = self->_layoutItems;
  self->_layoutItems = v5;
  v16 = v5;

  self->_incidentReportingEnabled = objc_msgSend(v19, "enabled");
  self->_layoutTimeToLive = objc_msgSend(v19, "ttl");
  v17 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  layoutRequestTime = self->_layoutRequestTime;
  self->_layoutRequestTime = v17;

  self->_layoutFreshnessRadius = objc_msgSend(v19, "radius");
}

- (BOOL)isIncidentReportingEnabled
{
  return self->_incidentReportingEnabled;
}

- (BOOL)isIncidentTypeDisplayedOnMap:(int)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!-[NSArray count](self->_layoutItems, "count"))
    return 1;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_layoutItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "incidentType", (_QWORD)v13) == a3)
        {
          v11 = objc_msgSend(v10, "displayIncidentOnMap");
          goto LABEL_12;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)isIncidentTypeSupported:(int)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (!-[NSArray count](self->_layoutItems, "count"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_layoutItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "incidentType", (_QWORD)v12) == a3)
        {
          v10 = 1;
          goto LABEL_12;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)shouldInvalidateLayout
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentLocation"));
  LOBYTE(self) = -[TrafficIncidentLayout shouldInvalidateLayoutForLocation:](self, "shouldInvalidateLayoutForLocation:", v4);

  return (char)self;
}

- (BOOL)shouldInvalidateLayoutForLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  id v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  id v26;
  _DWORD v28[2];
  __int16 v29;
  TrafficIncidentLayout *v30;

  v4 = a3;
  if (self->_layoutRequestLocation)
  {
    -[NSDate timeIntervalSinceNow](self->_layoutRequestTime, "timeIntervalSinceNow");
    v6 = v5;
    -[NSDate timeIntervalSinceNow](self->_layoutRequestTime, "timeIntervalSinceNow");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
    objc_msgSend(v9, "coordinate");
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOLocation latLng](self->_layoutRequestLocation, "latLng"));
    v15 = objc_msgSend(v14, "coordinate");
    v18 = GEOCalculateDistance(v15, v11, v13, v16, v17);

    if (v18 >= (double)self->_layoutFreshnessRadius)
    {
      v20 = 1;
    }
    else
    {
      v19 = -v8;
      if (v6 >= 0.0)
        v19 = v8;
      v20 = v19 > (double)self->_layoutTimeToLive;
    }
    v26 = sub_1004327DC();
    v22 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v28[0] = 67109378;
      v28[1] = v20;
      v29 = 2112;
      v30 = self;
      v23 = "TrafficIncidentLayout: shouldInvalidateLayout %d for %@";
      v24 = v22;
      v25 = 18;
      goto LABEL_11;
    }
  }
  else
  {
    v21 = sub_1004327DC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    LOBYTE(v20) = 1;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28[0]) = 0;
      v23 = "TrafficIncidentLayout: Initial fetching";
      v24 = v22;
      v25 = 2;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, v23, (uint8_t *)v28, v25);
    }
  }

  return v20;
}

- (NSArray)layoutItems
{
  return self->_layoutItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutRequestTime, 0);
  objc_storeStrong((id *)&self->_layoutRequestLocation, 0);
  objc_storeStrong((id *)&self->_layoutItems, 0);
}

@end
