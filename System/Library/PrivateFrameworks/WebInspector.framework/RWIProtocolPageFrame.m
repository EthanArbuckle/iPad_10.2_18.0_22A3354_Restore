@implementation RWIProtocolPageFrame

- (RWIProtocolPageFrame)initWithIdentifier:(id)a3 loaderId:(id)a4 url:(id)a5 securityOrigin:(id)a6 mimeType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RWIProtocolPageFrame *v17;
  RWIProtocolPageFrame *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RWIProtocolPageFrame;
  v17 = -[RWIProtocolJSONObject init](&v20, sel_init);
  if (v17)
  {
    if (!v12)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("identifier"));
    if (!v13)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("loaderId"));
    if (!v14)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("url"));
    if (!v15)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("securityOrigin"));
    if (!v16)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("mimeType"));
    -[RWIProtocolPageFrame setIdentifier:](v17, "setIdentifier:", v12);
    -[RWIProtocolPageFrame setLoaderId:](v17, "setLoaderId:", v13);
    -[RWIProtocolPageFrame setUrl:](v17, "setUrl:", v14);
    -[RWIProtocolPageFrame setSecurityOrigin:](v17, "setSecurityOrigin:", v15);
    -[RWIProtocolPageFrame setMimeType:](v17, "setMimeType:", v16);
    v18 = v17;
  }

  return v17;
}

- (void)setIdentifier:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("id"));
}

- (NSString)identifier
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("id"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setParentId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("parentId"));
}

- (NSString)parentId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("parentId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLoaderId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("loaderId"));
}

- (NSString)loaderId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("loaderId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("name"));
}

- (NSString)name
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("name"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setUrl:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("url"));
}

- (NSString)url
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("url"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSecurityOrigin:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("securityOrigin"));
}

- (NSString)securityOrigin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("securityOrigin"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setMimeType:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("mimeType"));
}

- (NSString)mimeType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("mimeType"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
