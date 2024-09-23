@implementation RWIProtocolSecurityConnection

- (void)setProtocol:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityConnection;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("protocol"));
}

- (NSString)protocol
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityConnection;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("protocol"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setCipher:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityConnection;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("cipher"));
}

- (NSString)cipher
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityConnection;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("cipher"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
