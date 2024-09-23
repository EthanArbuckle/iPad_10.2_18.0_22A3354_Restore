@implementation REMCDAlarmLocationTrigger

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMAlarmLocationTrigger cdEntityName](REMAlarmLocationTrigger, "cdEntityName");
}

- (id)modelObject
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init((Class)REMStructuredLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarmLocationTrigger title](self, "title"));
  objc_msgSend(v3, "setTitle:", v4);

  -[REMCDAlarmLocationTrigger latitude](self, "latitude");
  objc_msgSend(v3, "setLatitude:");
  -[REMCDAlarmLocationTrigger longitude](self, "longitude");
  objc_msgSend(v3, "setLongitude:");
  -[REMCDAlarmLocationTrigger radius](self, "radius");
  objc_msgSend(v3, "setRadius:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarmLocationTrigger referenceFrameString](self, "referenceFrameString"));
  objc_msgSend(v3, "setReferenceFrameString:", v5);

  v6 = objc_msgSend(objc_alloc((Class)REMAlarmLocationTrigger), "initWithStructuredLocation:proximity:", v3, (int)-[REMCDAlarmLocationTrigger proximity](self, "proximity"));
  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAlarmLocationTrigger"));
}

@end
