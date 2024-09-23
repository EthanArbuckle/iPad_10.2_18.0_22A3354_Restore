@implementation GEOComposedRoute

- (unint64_t)mapType
{
  if (-[GEOComposedRoute transportType](self, "transportType") == 1)
    return 104;
  else
    return 0;
}

- (id)nextWaypoint
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 > 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute waypoints](self, "waypoints"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self, "destination"));
  }
  return v5;
}

@end
