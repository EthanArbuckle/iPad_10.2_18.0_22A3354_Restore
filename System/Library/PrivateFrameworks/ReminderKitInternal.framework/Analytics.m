@implementation Analytics

+ (void)postEventWithName:(id)a3 payload:(id)a4 error:(id)a5 performAutoBugCaptureOnError:(BOOL)a6
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;

  v8 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v10 = v9;
  sub_1A444AA40(0, (unint64_t *)&qword_1ED2439F0);
  v11 = sub_1A4690708();
  v12 = a5;
  sub_1A45B4244(v8, v10, v11, 0, 1, a5, a6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (_TtC19ReminderKitInternal9Analytics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Analytics();
  return -[Analytics init](&v3, sel_init);
}

@end
