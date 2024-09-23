@implementation _SESwiftCBridge

+ (BOOL)checkEntitlement:(id)a3 forAuditToken:(id *)a4
{
  uint64_t v4;
  void *v5;
  char v6;
  char v7;

  v4 = sub_245DCD6C8();
  sub_245DCD4A8(v4, v5);
  v7 = v6;
  swift_bridgeObjectRelease();
  return v7 & 1;
}

+ (BOOL)checkEntitlementForCurrentProcess:(id)a3
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = sub_245DCD6C8();
  v5 = sub_245DCD5B4(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (_SESwiftCBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SwiftCBridge();
  return -[_SESwiftCBridge init](&v3, sel_init);
}

@end
