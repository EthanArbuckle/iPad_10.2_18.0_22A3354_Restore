@implementation RCPlatform

+ (BOOL)isCatalyst
{
  return 0;
}

+ (BOOL)isIPad
{
  id v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3 == (id)1;
}

- (RCPlatform)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Platform();
  return -[RCPlatform init](&v3, "init");
}

@end
