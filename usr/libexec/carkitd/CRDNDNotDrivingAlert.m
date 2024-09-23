@implementation CRDNDNotDrivingAlert

- (id)title
{
  return CFSTR("[Internal] Not Driving");
}

- (id)message
{
  return CFSTR("What happened?");
}

+ (id)actions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRBulletin CARActionWithTitle:](CRBulletin, "CARActionWithTitle:", CFSTR("I'm a Passenger")));
  v9[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRBulletin CARActionWithTitle:](CRBulletin, "CARActionWithTitle:", CFSTR("I've Pulled Over")));
  v9[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CARDNDDiagnosticsService TTRURLforEvent:](CARDNDDiagnosticsService, "TTRURLforEvent:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRBulletin CARActionWithURL:title:](CRBulletin, "CARActionWithURL:title:", v4, CFSTR("Incorrect Detection (File Radar)")));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRBulletin CARActionWithTitle:](CRBulletin, "CARActionWithTitle:", CFSTR("Other")));
  v9[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 4));

  return v7;
}

@end
