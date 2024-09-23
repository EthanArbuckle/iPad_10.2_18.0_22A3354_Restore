@implementation DrivePreferences

- (DrivePreferences)initWithAvoidTolls:(BOOL)a3 avoidHighways:(BOOL)a4 ignoreLiveTraffic:(BOOL)a5 defaults:(id)a6
{
  DrivePreferences *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DrivePreferences;
  result = -[WatchSyncedPreferences initWithDefaults:](&v10, "initWithDefaults:", a6);
  if (result)
  {
    result->_avoidTolls = a3;
    result->_avoidHighways = a4;
    result->_ignoreLiveTraffic = a5;
  }
  return result;
}

- (DrivePreferences)initWithAutomobileOptions:(id)a3 defaults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  DrivePreferences *v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userPreferences"));
  v9 = objc_msgSend(v8, "avoidTolls");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userPreferences"));
  v11 = objc_msgSend(v10, "avoidHighways");
  v12 = objc_msgSend(v7, "trafficType");

  v13 = -[DrivePreferences initWithAvoidTolls:avoidHighways:ignoreLiveTraffic:defaults:](self, "initWithAvoidTolls:avoidHighways:ignoreLiveTraffic:defaults:", v9, v11, v12 != 3, v6);
  return v13;
}

- (DrivePreferences)initWithDefaults:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DrivePreferences;
  return -[WatchSyncedPreferences initWithDefaults:](&v4, "initWithDefaults:", a3);
}

- (DrivePreferences)initWithCopy:(id)a3
{
  _BYTE *v4;
  DrivePreferences *v5;
  DrivePreferences *v6;
  uint64_t v7;
  char isKindOfClass;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DrivePreferences;
  v5 = -[WatchSyncedPreferences initWithCopy:](&v10, "initWithCopy:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = objc_opt_class(v5);
    isKindOfClass = objc_opt_isKindOfClass(v4, v7);
    if (v4)
    {
      if ((isKindOfClass & 1) != 0)
      {
        v6->_avoidTolls = v4[24];
        v6->_avoidHighways = v4[25];
        v6->_ignoreLiveTraffic = v4[26];
      }
    }
  }

  return v6;
}

- (id)automobileOptions
{
  GEOAutomobileOptions *v3;
  uint64_t v4;
  void *v5;

  v3 = objc_opt_new(GEOAutomobileOptions);
  -[GEOAutomobileOptions setIncludeHistoricTravelTime:](v3, "setIncludeHistoricTravelTime:", 1);
  if (-[DrivePreferences ignoreLiveTraffic](self, "ignoreLiveTraffic"))
    v4 = 1;
  else
    v4 = 3;
  -[GEOAutomobileOptions setTrafficType:](v3, "setTrafficType:", v4);
  v5 = (void *)objc_opt_new(GEOUserPreferences);
  objc_msgSend(v5, "setAvoidTolls:", -[DrivePreferences avoidTolls](self, "avoidTolls"));
  objc_msgSend(v5, "setAvoidHighways:", -[DrivePreferences avoidHighways](self, "avoidHighways"));
  -[GEOAutomobileOptions setUserPreferences:](v3, "setUserPreferences:", v5);

  return v3;
}

- (BOOL)hasAnyNonStandardPreferences
{
  if (-[DrivePreferences avoidTolls](self, "avoidTolls"))
    return 1;
  else
    return -[DrivePreferences avoidHighways](self, "avoidHighways");
}

- (void)loadValuesFromDefaults
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[DrivePreferences setAvoidTolls:](self, "setAvoidTolls:", objc_msgSend(v3, "BOOLForKey:", CFSTR("MapsDefaultAvoidTollsKey")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[DrivePreferences setAvoidHighways:](self, "setAvoidHighways:", objc_msgSend(v4, "BOOLForKey:", CFSTR("MapsDefaultAvoidHighwaysKey")));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[DrivePreferences setIgnoreLiveTraffic:](self, "setIgnoreLiveTraffic:", objc_msgSend(v5, "BOOLForKey:", CFSTR("NavigationDirectionsIgnoreLiveTraffic")));

}

- (id)_keys
{
  return &off_101274118;
}

- (id)_values
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidTolls));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidHighways, v3));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ignoreLiveTraffic));
  v8[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));

  return v6;
}

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (void)setAvoidTolls:(BOOL)a3
{
  self->_avoidTolls = a3;
}

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (void)setAvoidHighways:(BOOL)a3
{
  self->_avoidHighways = a3;
}

- (BOOL)ignoreLiveTraffic
{
  return self->_ignoreLiveTraffic;
}

- (void)setIgnoreLiveTraffic:(BOOL)a3
{
  self->_ignoreLiveTraffic = a3;
}

@end
