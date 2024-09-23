@implementation REMCDAlarmTimeIntervalTrigger

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAlarmTimeIntervalTrigger"));
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMAlarmTimeIntervalTrigger cdEntityName](REMAlarmTimeIntervalTrigger, "cdEntityName");
}

- (BOOL)isTemporal
{
  return 1;
}

- (id)modelObject
{
  id v3;

  v3 = objc_alloc((Class)REMAlarmTimeIntervalTrigger);
  -[REMCDAlarmTimeIntervalTrigger timeInterval](self, "timeInterval");
  return objc_msgSend(v3, "initWithTimeInterval:");
}

- (double)generateNonce
{
  REMCDAlarmTimeIntervalTrigger *v2;
  double v3;

  v2 = self;
  v3 = REMCDAlarmTimeIntervalTrigger.generateNonce()();

  return v3;
}

@end
