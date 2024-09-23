@implementation RAPRecordManagerTrafficIncidentReportSaver

+ (id)sharedInstance
{
  if (qword_1014D2E60 != -1)
    dispatch_once(&qword_1014D2E60, &stru_1011C0528);
  return (id)qword_1014D2E58;
}

- (RAPRecordManagerTrafficIncidentReportSaver)init
{
  RAPRecordManagerTrafficIncidentReportSaver *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPRecordManagerTrafficIncidentReportSaver;
  v2 = -[RAPRecordManagerTrafficIncidentReportSaver init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
    objc_msgSend(v3, "addObserver:", v2);

  }
  return v2;
}

+ (int64_t)creationPreference
{
  return 1;
}

- (void)incidentsStorageManagerDidAddReport:(id)a3
{
  +[RAPRecordManager addTrafficIncidentReport:completion:](RAPRecordManager, "addTrafficIncidentReport:completion:", a3, &stru_1011C0548);
}

@end
