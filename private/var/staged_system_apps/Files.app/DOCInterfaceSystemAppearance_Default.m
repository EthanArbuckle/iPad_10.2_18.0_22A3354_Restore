@implementation DOCInterfaceSystemAppearance_Default

- (id)ellipsisMenuItemImageName
{
  uint64_t v1;
  NSString v2;

  v1 = *(_QWORD *)(a1 + 24);
  swift_bridgeObjectRetain(v1);
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v1);
  return v2;
}

- (id)ellipsisMenuItemSmallImageName
{
  uint64_t v1;
  NSString v2;

  v1 = *(_QWORD *)(a1 + 40);
  swift_bridgeObjectRetain(v1);
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v1);
  return v2;
}

@end
