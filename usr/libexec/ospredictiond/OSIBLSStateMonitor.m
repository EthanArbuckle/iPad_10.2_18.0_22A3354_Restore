@implementation OSIBLSStateMonitor

- (BOOL)aodOffOrSuppressed
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"));
  v3 = objc_msgSend(v2, "backlightState") == 0;

  return v3;
}

@end
