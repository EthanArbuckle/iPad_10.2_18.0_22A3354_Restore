@implementation CKRecordZoneNotification

- (void)setCkksPushTracingEnabled:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = &__kCFBooleanTrue;
  else
    v3 = &__kCFBooleanFalse;
  objc_setAssociatedObject(self, "ckksPushTracingEnabled", v3, (void *)0x301);
}

- (BOOL)ckksPushTracingEnabled
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, "ckksPushTracingEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setCkksPushTracingUUID:(id)a3
{
  objc_setAssociatedObject(self, "ckksPushTracingUUID", a3, (void *)0x301);
}

- (NSString)ckksPushTracingUUID
{
  return (NSString *)objc_getAssociatedObject(self, "ckksPushTracingUUID");
}

- (void)setCkksPushReceivedDate:(id)a3
{
  objc_setAssociatedObject(self, "ckksPushReceivedDate", a3, (void *)0x301);
}

- (NSDate)ckksPushReceivedDate
{
  return (NSDate *)objc_getAssociatedObject(self, "ckksPushReceivedDate");
}

@end
