@implementation WiFiSystemHealth

- (unint64_t)getComponentStatusWithError:(id *)a3
{
  const void *v3;
  int HardwareFailure;

  v3 = (const void *)WiFiManagerClientCreate();
  HardwareFailure = WiFiManagerClientGetHardwareFailure();
  if (v3)
    CFRelease(v3);
  if (HardwareFailure == 2)
    return 2;
  else
    return HardwareFailure == 1;
}

@end
