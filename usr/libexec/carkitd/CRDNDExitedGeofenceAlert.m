@implementation CRDNDExitedGeofenceAlert

- (id)title
{
  return CFSTR("[Internal] Geofence exited");
}

- (id)message
{
  return CFSTR("Exited geofence");
}

+ (id)actions
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CARDNDDiagnosticsService TTRURLforEvent:](CARDNDDiagnosticsService, "TTRURLforEvent:", 3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRBulletin CARActionWithURL:title:](CRBulletin, "CARActionWithURL:title:", v2, CFSTR("[Internal] File Radar")));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

@end
