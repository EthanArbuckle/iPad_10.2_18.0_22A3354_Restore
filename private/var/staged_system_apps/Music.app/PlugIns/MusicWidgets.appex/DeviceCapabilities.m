@implementation DeviceCapabilities

+ (BOOL)hasWAPICapability
{
  id v2;
  void *v3;
  char wapiCapability;

  v2 = (id)MobileGestalt_get_current_device(a1, a2);
  if (v2)
  {
    v3 = v2;
    wapiCapability = MobileGestalt_get_wapiCapability();

    LOBYTE(v2) = wapiCapability;
  }
  else
  {
    __break(1u);
  }
  return (char)v2;
}

- (DeviceCapabilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[DeviceCapabilities init](&v3, "init");
}

@end
