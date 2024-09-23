@implementation MPAVRoute

- (NSArray)stu_routeDescriptions
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoute stu_routeDescription](self, "stu_routeDescription"));
  if (v4)
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoute stu_mirroringRouteDescription](self, "stu_mirroringRouteDescription"));
  if (v5)
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  v6 = -[NSMutableArray copy](v3, "copy");

  return (NSArray *)v6;
}

- (id)stu_routeDescriptionForIsMirroring:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoute stu_mirroringRouteDescription](self, "stu_mirroringRouteDescription"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoute stu_routeDescription](self, "stu_routeDescription"));
  return v3;
}

- (id)stu_routeDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoute routeUID](self, "routeUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoute stu_routeDescriptionWithUID:](self, "stu_routeDescriptionWithUID:", v3));

  return v4;
}

- (id)stu_mirroringRouteDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoute stu_mirroringRouteUID](self, "stu_mirroringRouteUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoute stu_routeDescriptionWithUID:](self, "stu_routeDescriptionWithUID:", v3));

  return v4;
}

- (id)stu_routeDescriptionWithUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoute routeName](self, "routeName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MPAVRoute stu_requiresPIN](self, "stu_requiresPIN")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[STUAirPlayRouteDictionaryUtilities routeDictionaryWithUID:name:requiresPIN:](STUAirPlayRouteDictionaryUtilities, "routeDictionaryWithUID:name:requiresPIN:", v4, v5, v6));

  return v7;
}

- (id)stu_mirroringRouteUID
{
  void *v3;
  void *v4;

  if (-[MPAVRoute supportsWirelessDisplay](self, "supportsWirelessDisplay"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPAVRoute routeUID](self, "routeUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[STUAirPlayRouteDictionaryUtilities mirroringRouteUIDForRouteUID:](STUAirPlayRouteDictionaryUtilities, "mirroringRouteUIDForRouteUID:", v3));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)stu_requiresPIN
{
  unsigned int v3;

  v3 = -[MPAVRoute requiresPassword](self, "requiresPassword");
  if (v3)
    LOBYTE(v3) = -[MPAVRoute passwordType](self, "passwordType") == (id)2;
  return v3;
}

@end
