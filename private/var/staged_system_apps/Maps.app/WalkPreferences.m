@implementation WalkPreferences

- (WalkPreferences)initWithAvoidHills:(BOOL)a3 avoidBusyRoads:(BOOL)a4 avoidStairs:(BOOL)a5 defaults:(id)a6
{
  WalkPreferences *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WalkPreferences;
  result = -[WatchSyncedPreferences initWithDefaults:](&v10, "initWithDefaults:", a6);
  if (result)
  {
    result->_avoidHills = a3;
    result->_avoidBusyRoads = a4;
    result->_avoidStairs = a5;
  }
  return result;
}

- (WalkPreferences)initWithWalkingOptions:(id)a3 defaults:(id)a4
{
  id v6;
  void *v7;
  WalkPreferences *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "walkingUserPreferences"));
  v8 = -[WalkPreferences initWithAvoidHills:avoidBusyRoads:avoidStairs:defaults:](self, "initWithAvoidHills:avoidBusyRoads:avoidStairs:defaults:", objc_msgSend(v7, "avoidHills"), objc_msgSend(v7, "avoidBusyRoads"), objc_msgSend(v7, "avoidStairs"), v6);

  return v8;
}

- (WalkPreferences)initWithDefaults:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WalkPreferences;
  return -[WatchSyncedPreferences initWithDefaults:](&v4, "initWithDefaults:", a3);
}

- (WalkPreferences)initWithCopy:(id)a3
{
  _BYTE *v4;
  WalkPreferences *v5;
  WalkPreferences *v6;
  uint64_t v7;
  char isKindOfClass;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WalkPreferences;
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
        v6->_avoidHills = v4[24];
        v6->_avoidBusyRoads = v4[25];
        v6->_avoidStairs = v4[26];
      }
    }
  }

  return v6;
}

- (id)walkingOptions
{
  void *v3;
  GEOWalkingOptions *v4;

  v3 = (void *)objc_opt_new(GEOWalkingUserPreferences);
  objc_msgSend(v3, "setAvoidHills:", -[WalkPreferences avoidHills](self, "avoidHills"));
  objc_msgSend(v3, "setAvoidBusyRoads:", -[WalkPreferences avoidBusyRoads](self, "avoidBusyRoads"));
  objc_msgSend(v3, "setAvoidStairs:", -[WalkPreferences avoidStairs](self, "avoidStairs"));
  v4 = objc_opt_new(GEOWalkingOptions);
  -[GEOWalkingOptions setWalkingUserPreferences:](v4, "setWalkingUserPreferences:", v3);

  return v4;
}

- (BOOL)hasAnyNonStandardPreferences
{
  if (-[WalkPreferences avoidHills](self, "avoidHills") || -[WalkPreferences avoidBusyRoads](self, "avoidBusyRoads"))
    return 1;
  else
    return -[WalkPreferences avoidStairs](self, "avoidStairs");
}

- (void)loadValuesFromDefaults
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[WalkPreferences setAvoidHills:](self, "setAvoidHills:", objc_msgSend(v3, "BOOLForKey:", CFSTR("MapsDefaultWalkingAvoidHillsKey")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[WalkPreferences setAvoidBusyRoads:](self, "setAvoidBusyRoads:", objc_msgSend(v4, "BOOLForKey:", CFSTR("MapsDefaultWalkingAvoidBusyRoadsKey")));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  -[WalkPreferences setAvoidStairs:](self, "setAvoidStairs:", objc_msgSend(v5, "BOOLForKey:", CFSTR("MapsDefaultWalkingAvoidStairsKey")));

}

- (id)_keys
{
  return &off_1012742E0;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidStairs));
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

- (BOOL)avoidStairs
{
  return self->_avoidStairs;
}

- (void)setAvoidStairs:(BOOL)a3
{
  self->_avoidStairs = a3;
}

@end
