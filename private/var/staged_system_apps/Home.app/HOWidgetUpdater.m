@implementation HOWidgetUpdater

- (_TtC7HomeApp15HOWidgetUpdater)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HOWidgetUpdater();
  return -[HOWidgetUpdater init](&v3, "init");
}

+ (uint64_t)updateAllWidgetsThatHaveTimelines
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  type metadata accessor for WidgetCenter(0);
  v0 = ((uint64_t (*)(void))static WidgetCenter.shared.getter)();
  dispatch thunk of WidgetCenter.reloadTimelines(ofKind:)(0xD000000000000026, 0x80000001000913F0);
  v1 = swift_release(v0);
  v2 = static WidgetCenter.shared.getter(v1);
  dispatch thunk of WidgetCenter.reloadTimelines(ofKind:)(0xD000000000000026, 0x8000000100091420);
  v3 = swift_release(v2);
  v4 = static WidgetCenter.shared.getter(v3);
  dispatch thunk of WidgetCenter.reloadTimelines(ofKind:)(0xD00000000000002ALL, 0x8000000100091450);
  v5 = swift_release(v4);
  v6 = static WidgetCenter.shared.getter(v5);
  dispatch thunk of WidgetCenter.reloadTimelines(ofKind:)(0xD000000000000014, 0x8000000100091480);
  v7 = swift_release(v6);
  v8 = static WidgetCenter.shared.getter(v7);
  dispatch thunk of WidgetCenter.reloadTimelines(ofKind:)(0xD000000000000015, 0x80000001000914A0);
  v9 = swift_release(v8);
  v10 = static WidgetCenter.shared.getter(v9);
  dispatch thunk of WidgetCenter.reloadTimelines(ofKind:)(0xD000000000000015, 0x80000001000914C0);
  return swift_release(v10);
}

@end
