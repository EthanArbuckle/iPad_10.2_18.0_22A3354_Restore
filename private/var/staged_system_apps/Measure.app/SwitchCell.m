@implementation SwitchCell

- (id)initWithStyle:(uint64_t)a3 reuseIdentifier:(NSString)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(a1);
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v9 = v8;
    a4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  v12.receiver = a1;
  v12.super_class = ObjectType;
  v10 = objc_msgSendSuper2(&v12, "initWithStyle:reuseIdentifier:", a3, a4);

  return v10;
}

- (id)initWithCoder:(uint64_t)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType(a1);
  return objc_msgSendSuper2(&v5, "initWithCoder:", a3);
}

@end
