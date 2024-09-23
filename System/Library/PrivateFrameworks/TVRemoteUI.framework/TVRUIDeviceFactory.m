@implementation TVRUIDeviceFactory

+ (id)deviceWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[TVRUICoreDevice _initWithDeviceIdentifier:]([TVRUICoreDevice alloc], "_initWithDeviceIdentifier:", v3);

  return v4;
}

@end
