@implementation RWIProtocolDOMStorageStorageId

- (RWIProtocolDOMStorageStorageId)initWithSecurityOrigin:(id)a3 isLocalStorage:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RWIProtocolDOMStorageStorageId *v7;
  RWIProtocolDOMStorageStorageId *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolDOMStorageStorageId;
  v7 = -[RWIProtocolJSONObject init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("securityOrigin"));
    -[RWIProtocolDOMStorageStorageId setSecurityOrigin:](v7, "setSecurityOrigin:", v6);
    -[RWIProtocolDOMStorageStorageId setIsLocalStorage:](v7, "setIsLocalStorage:", v4);
    v8 = v7;
  }

  return v7;
}

- (void)setSecurityOrigin:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStorageStorageId;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("securityOrigin"));
}

- (NSString)securityOrigin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStorageStorageId;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("securityOrigin"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setIsLocalStorage:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStorageStorageId;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isLocalStorage"));
}

- (BOOL)isLocalStorage
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStorageStorageId;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isLocalStorage"));
}

@end
