@implementation BAContentSubType

+ (BAContentSubType)unknown
{
  objc_class *v2;
  _BYTE *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for BridgedContentSubType();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___BAContentSubType_subTypeEnum] = 0;
  v5.receiver = v3;
  v5.super_class = v2;
  return (BAContentSubType *)objc_msgSendSuper2(&v5, "init");
}

+ (BAContentSubType)rmt
{
  objc_class *v2;
  _BYTE *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for BridgedContentSubType();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___BAContentSubType_subTypeEnum] = 1;
  v5.receiver = v3;
  v5.super_class = v2;
  return (BAContentSubType *)objc_msgSendSuper2(&v5, "init");
}

+ (BAContentSubType)fixedLayout
{
  objc_class *v2;
  _BYTE *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for BridgedContentSubType();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___BAContentSubType_subTypeEnum] = 2;
  v5.receiver = v3;
  v5.super_class = v2;
  return (BAContentSubType *)objc_msgSendSuper2(&v5, "init");
}

+ (BAContentSubType)traditional
{
  objc_class *v2;
  _BYTE *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for BridgedContentSubType();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___BAContentSubType_subTypeEnum] = 3;
  v5.receiver = v3;
  v5.super_class = v2;
  return (BAContentSubType *)objc_msgSendSuper2(&v5, "init");
}

- (BAContentSubType)init
{
  BAContentSubType *result;

  result = (BAContentSubType *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedContentSubType", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
