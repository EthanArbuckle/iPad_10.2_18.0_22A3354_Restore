@implementation BSUIVCStackManager

+ (void)present:(id)a3 :(BOOL)a4 :(id)a5
{
  uint64_t v7;
  id v8;

  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v8 = a3;
  _s11BookStoreUI14VCStackManagerC7presentyySo16UIViewControllerC_SbSDys11AnyHashableVypGtFZ_0(v8, a4, v7);

  swift_bridgeObjectRelease(v7);
}

- (BSUIVCStackManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VCStackManager();
  return -[BSUIVCStackManager init](&v3, "init");
}

@end
