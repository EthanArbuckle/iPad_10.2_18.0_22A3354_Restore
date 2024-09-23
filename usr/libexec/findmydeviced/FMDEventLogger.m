@implementation FMDEventLogger

+ (id)facilityName
{
  return CFSTR("DefaultFacility");
}

+ (id)sharedLogger
{
  if (qword_100306548 != -1)
    dispatch_once(&qword_100306548, &stru_1002C2E18);
  return (id)qword_100306540;
}

- (FMDEventLogger)init
{
  FMDEventLogger *v2;
  void *v3;
  FMDEventLoggerFacilityOnDisk *v4;
  void *v5;
  FMDEventLoggerFacilityOnDiskStats *v6;
  void *v7;
  FMDEventLoggerFacilityFMIPServer *v8;
  void *v9;
  FMDEventLoggerFacilityDataPeek *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[4];
  _QWORD v15[4];

  v13.receiver = self;
  v13.super_class = (Class)FMDEventLogger;
  v2 = -[FMDEventLogger init](&v13, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerFacilityOnDisk facilityName](FMDEventLoggerFacilityOnDisk, "facilityName"));
    v14[0] = v3;
    v4 = objc_alloc_init(FMDEventLoggerFacilityOnDisk);
    v15[0] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerFacilityOnDiskStats facilityName](FMDEventLoggerFacilityOnDiskStats, "facilityName"));
    v14[1] = v5;
    v6 = objc_alloc_init(FMDEventLoggerFacilityOnDiskStats);
    v15[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerFacilityFMIPServer facilityName](FMDEventLoggerFacilityFMIPServer, "facilityName"));
    v14[2] = v7;
    v8 = objc_alloc_init(FMDEventLoggerFacilityFMIPServer);
    v15[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerFacilityDataPeek facilityName](FMDEventLoggerFacilityDataPeek, "facilityName"));
    v14[3] = v9;
    v10 = objc_alloc_init(FMDEventLoggerFacilityDataPeek);
    v15[3] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
    -[FMDEventLogger setFacilitiesDictionary:](v2, "setFacilitiesDictionary:", v11);

  }
  return v2;
}

- (void)reset
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FMDEventLogger facilitiesDictionary](self, "facilitiesDictionary"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &stru_1002C2E58);

}

- (void)logEvent:(id)a3 toFacilitiesNamed:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v7 = a3;
  v6 = a4;
  if (-[FMDEventLogger shouldLog](self, "shouldLog"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003FD14;
    v8[3] = &unk_1002C2E80;
    v8[4] = self;
    v9 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

- (void)logEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FMDEventLogger facilitiesDictionary](self, "facilitiesDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  -[FMDEventLogger logEvent:toFacilitiesNamed:](self, "logEvent:toFacilitiesNamed:", v4, v5);

}

- (id)loggedEvents
{
  return &__NSArray0__struct;
}

- (BOOL)shouldLog
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v3 = objc_msgSend(v2, "isInternalBuild");

  return v3;
}

- (NSDictionary)facilitiesDictionary
{
  return self->_facilitiesDictionary;
}

- (void)setFacilitiesDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_facilitiesDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facilitiesDictionary, 0);
}

@end
