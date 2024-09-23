@implementation AVVCContextSettings(debugDescription)

- (id)debugDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("[Context = %ld]"), objc_msgSend(a1, "activationMode"));
  objc_msgSend(a1, "activationDeviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("[DeviceId = %@]"), v3);

  objc_msgSend(v2, "appendFormat:", CFSTR("[Announced = %d]"), objc_msgSend(a1, "announceCallsEnabled"));
  return v2;
}

@end
