@implementation CyclePreferences

- (CyclePreferences)initWithAvoidHills:(BOOL)a3 avoidBusyRoads:(BOOL)a4 ebike:(BOOL)a5 defaults:(id)a6
{
  CyclePreferences *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CyclePreferences;
  result = -[WatchSyncedPreferences initWithDefaults:](&v10, "initWithDefaults:", a6);
  if (result)
  {
    result->_avoidHills = a3;
    result->_avoidBusyRoads = a4;
    result->_ebike = a5;
  }
  return result;
}

- (CyclePreferences)initWithCyclingOptions:(id)a3 defaults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CyclePreferences *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cyclingUserPreferences"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cyclingVehicleSpecifications"));

  v10 = -[CyclePreferences initWithAvoidHills:avoidBusyRoads:ebike:defaults:](self, "initWithAvoidHills:avoidBusyRoads:ebike:defaults:", objc_msgSend(v8, "avoidHills"), objc_msgSend(v8, "avoidBusyRoads"), objc_msgSend(v9, "isEbike"), v6);
  return v10;
}

- (CyclePreferences)initWithDefaults:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CyclePreferences;
  return -[WatchSyncedPreferences initWithDefaults:](&v4, "initWithDefaults:", a3);
}

- (CyclePreferences)initWithCopy:(id)a3
{
  _BYTE *v4;
  CyclePreferences *v5;
  uint64_t v6;
  CyclePreferences *v7;
  uint64_t v8;
  char isKindOfClass;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CyclePreferences;
  v5 = -[WatchSyncedPreferences initWithCopy:](&v11, "initWithCopy:", v4);
  v7 = v5;
  if (v5)
  {
    v8 = objc_opt_class(v5, v6);
    isKindOfClass = objc_opt_isKindOfClass(v4, v8);
    if (v4)
    {
      if ((isKindOfClass & 1) != 0)
      {
        v7->_avoidHills = v4[24];
        v7->_avoidBusyRoads = v4[25];
        v7->_ebike = v4[26];
      }
    }
  }

  return v7;
}

- (id)cyclingOptions
{
  GEOCyclingUserPreferences *v3;
  id v4;
  GEOCyclingOptions *v5;

  v3 = objc_opt_new(GEOCyclingUserPreferences);
  -[GEOCyclingUserPreferences setAvoidHills:](v3, "setAvoidHills:", -[CyclePreferences avoidHills](self, "avoidHills"));
  -[GEOCyclingUserPreferences setAvoidBusyRoads:](v3, "setAvoidBusyRoads:", -[CyclePreferences avoidBusyRoads](self, "avoidBusyRoads"));
  v4 = objc_alloc_init((Class)GEOCyclingVehicleSpecifications);
  objc_msgSend(v4, "setIsEbike:", -[CyclePreferences ebike](self, "ebike"));
  v5 = objc_opt_new(GEOCyclingOptions);
  -[GEOCyclingOptions setCyclingUserPreferences:](v5, "setCyclingUserPreferences:", v3);
  -[GEOCyclingOptions setCyclingVehicleSpecifications:](v5, "setCyclingVehicleSpecifications:", v4);

  return v5;
}

- (BOOL)hasAnyNonStandardPreferences
{
  if (-[CyclePreferences avoidHills](self, "avoidHills"))
    return 1;
  else
    return -[CyclePreferences avoidBusyRoads](self, "avoidBusyRoads");
}

- (void)loadValuesFromDefaults
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[CyclePreferences setAvoidHills:](self, "setAvoidHills:", objc_msgSend(v3, "BOOLForKey:", CFSTR("MapsDefaultAvoidHillsKey")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[CyclePreferences setAvoidBusyRoads:](self, "setAvoidBusyRoads:", objc_msgSend(v4, "BOOLForKey:", CFSTR("MapsDefaultAvoidBusyRoadsKey")));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[CyclePreferences setEbike:](self, "setEbike:", objc_msgSend(v5, "BOOLForKey:", CFSTR("MapsDefaultUseEbikeKey")));

}

- (id)_keys
{
  return &off_101273170;
}

- (id)_values
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidHills));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidBusyRoads, v3));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ebike));
  v8[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));

  return v6;
}

- (BOOL)avoidHills
{
  return self->_avoidHills;
}

- (void)setAvoidHills:(BOOL)a3
{
  self->_avoidHills = a3;
}

- (BOOL)avoidBusyRoads
{
  return self->_avoidBusyRoads;
}

- (void)setAvoidBusyRoads:(BOOL)a3
{
  self->_avoidBusyRoads = a3;
}

- (BOOL)ebike
{
  return self->_ebike;
}

- (void)setEbike:(BOOL)a3
{
  self->_ebike = a3;
}

@end
