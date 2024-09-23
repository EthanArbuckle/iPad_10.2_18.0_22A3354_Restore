@implementation REMCDAlarmVehicleTrigger

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMAlarmVehicleTrigger cdEntityName](REMAlarmVehicleTrigger, "cdEntityName");
}

- (id)modelObject
{
  return objc_msgSend(objc_alloc((Class)REMAlarmVehicleTrigger), "initWithEvent:", (int)-[REMCDAlarmVehicleTrigger event](self, "event"));
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAlarmVehicleTrigger"));
}

@end
