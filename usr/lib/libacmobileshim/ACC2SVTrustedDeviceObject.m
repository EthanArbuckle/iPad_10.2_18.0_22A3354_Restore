@implementation ACC2SVTrustedDeviceObject

- (ACC2SVTrustedDeviceObject)initWithDictionary:(id)a3
{
  ACC2SVTrustedDeviceObject *v4;
  void *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ACC2SVTrustedDeviceObject;
  v4 = -[ACC2SVTrustedDeviceObject init](&v8, sel_init);
  if (v4)
  {
    -[ACC2SVTrustedDeviceObject setDeviceID:](v4, "setDeviceID:", objc_msgSend(a3, "objectForKey:", CFSTR("di")));
    -[ACC2SVTrustedDeviceObject setDeviceType:](v4, "setDeviceType:", objc_msgSend(a3, "objectForKey:", CFSTR("dk")));
    -[ACC2SVTrustedDeviceObject setDeviceClass:](v4, "setDeviceClass:", objc_msgSend(a3, "objectForKey:", CFSTR("ds")));
    -[ACC2SVTrustedDeviceObject setDeviceDescription:](v4, "setDeviceDescription:", objc_msgSend(a3, "objectForKey:", CFSTR("dd")));
    -[ACC2SVTrustedDeviceObject setDeviceModel:](v4, "setDeviceModel:", objc_msgSend(a3, "objectForKey:", CFSTR("dm")));
    -[ACC2SVTrustedDeviceObject setDeviceModelName:](v4, "setDeviceModelName:", objc_msgSend(a3, "objectForKey:", CFSTR("dn")));
    -[ACC2SVTrustedDeviceObject setDeviceColor:](v4, "setDeviceColor:", objc_msgSend(a3, "objectForKey:", CFSTR("dc")));
    v5 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("du")), "doubleValue");
    -[ACC2SVTrustedDeviceObject setLastUseDate:](v4, "setLastUseDate:", objc_msgSend(v5, "dateWithTimeIntervalSince1970:", v6 / 1000.0));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[ACC2SVTrustedDeviceObject setDeviceID:](self, "setDeviceID:", 0);
  -[ACC2SVTrustedDeviceObject setDeviceType:](self, "setDeviceType:", 0);
  -[ACC2SVTrustedDeviceObject setDeviceClass:](self, "setDeviceClass:", 0);
  -[ACC2SVTrustedDeviceObject setDeviceDescription:](self, "setDeviceDescription:", 0);
  -[ACC2SVTrustedDeviceObject setDeviceModel:](self, "setDeviceModel:", 0);
  -[ACC2SVTrustedDeviceObject setDeviceModelName:](self, "setDeviceModelName:", 0);
  -[ACC2SVTrustedDeviceObject setDeviceColor:](self, "setDeviceColor:", 0);
  -[ACC2SVTrustedDeviceObject setDeviceIcon:](self, "setDeviceIcon:", 0);
  -[ACC2SVTrustedDeviceObject setLastUseDate:](self, "setLastUseDate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACC2SVTrustedDeviceObject;
  -[ACC2SVTrustedDeviceObject dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Description: %@, Type:%@, Class: %@, Model:%@, Color:%@"), -[ACC2SVTrustedDeviceObject deviceDescription](self, "deviceDescription"), -[ACC2SVTrustedDeviceObject deviceType](self, "deviceType"), -[ACC2SVTrustedDeviceObject deviceClass](self, "deviceClass"), -[ACC2SVTrustedDeviceObject deviceModel](self, "deviceModel"), -[ACC2SVTrustedDeviceObject deviceColor](self, "deviceColor"));
}

- (BOOL)isSMSDevice
{
  return -[NSString isEqualToString:](-[ACC2SVTrustedDeviceObject deviceType](self, "deviceType"), "isEqualToString:", CFSTR("S"));
}

- (BOOL)isTOTPDevice
{
  return -[NSString isEqualToString:](-[ACC2SVTrustedDeviceObject deviceType](self, "deviceType"), "isEqualToString:", CFSTR("T"));
}

- (NSString)deviceDisplayDescription
{
  NSString *v3;
  uint64_t v4;

  v3 = -[ACC2SVTrustedDeviceObject deviceDescription](self, "deviceDescription");
  if (!-[ACC2SVTrustedDeviceObject isSMSDevice](self, "isSMSDevice"))
    return v3;
  v4 = -[NSString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Phone number ending in "), &stru_24FCE58F0);
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Number ending in %@")), v4);
}

- (NSString)imageURL
{
  void *v3;
  double v4;
  const __CFString *v5;
  double v6;

  if (!-[NSString length](-[ACC2SVTrustedDeviceObject deviceClass](self, "deviceClass"), "length")
    || !-[NSString length](-[ACC2SVTrustedDeviceObject deviceModel](self, "deviceModel"), "length"))
  {
    return 0;
  }
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("https://statici.icloud.com/fmipmobile/deviceImages-4.0/"));
  objc_msgSend(v3, "appendString:", -[ACC2SVTrustedDeviceObject deviceClass](self, "deviceClass"));
  objc_msgSend(v3, "appendString:", CFSTR("/"));
  objc_msgSend(v3, "appendString:", -[ACC2SVTrustedDeviceObject deviceModel](self, "deviceModel"));
  if (-[NSString length](-[ACC2SVTrustedDeviceObject deviceColor](self, "deviceColor"), "length"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("-"));
    objc_msgSend(v3, "appendString:", -[ACC2SVTrustedDeviceObject deviceColor](self, "deviceColor"));
  }
  objc_msgSend(v3, "appendString:", CFSTR("/"));
  -[ACC2SVTrustedDeviceObject scale](self, "scale");
  if (v4 <= 2.00999999)
  {
    -[ACC2SVTrustedDeviceObject scale](self, "scale");
    v5 = &stru_24FCE58F0;
    if (v6 > 1.00999999)
      v5 = CFSTR("__2x");
  }
  else
  {
    v5 = CFSTR("__3x");
  }
  objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("online-sourcelist%@.png"), v5));
  return (NSString *)v3;
}

- (double)scale
{
  double result;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  return result;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)deviceDescription
{
  return self->_deviceDescription;
}

- (void)setDeviceDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)deviceModelName
{
  return self->_deviceModelName;
}

- (void)setDeviceModelName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSData)deviceIcon
{
  return self->_deviceIcon;
}

- (void)setDeviceIcon:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSDate)lastUseDate
{
  return self->_lastUseDate;
}

- (void)setLastUseDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
