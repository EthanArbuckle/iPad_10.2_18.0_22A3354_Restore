@implementation AVExternalDevice(WiFiKit)

+ (BOOL)isCarPlaySessionActive
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x24BDB2550], "currentCarPlayExternalDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  v2 = v0 && objc_msgSend(v0, "transportType") == 3;

  return v2;
}

@end
