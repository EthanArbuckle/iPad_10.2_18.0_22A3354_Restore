@implementation UIApplication

- (NSString)_extendLaunchTest
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  UIApplication *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  uint64_t v13;

  v3 = type metadata accessor for PPTExtendedLaunchType(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PPTConfig(0);
  v7 = self;
  v8 = static PPTConfig.extendedLaunchTestType.getter();
  PPTExtendedLaunchType.rawValue.getter(v8);
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return (NSString *)v11;
}

- (void)observeExtendedLaunchTestCompletion
{
  UIApplication *v2;

  v2 = self;
  UIApplication.observeExtendedLaunchTestCompletion()();

}

- (void)onExtendedLaunchCompleted
{
  UIApplication *v2;

  v2 = self;
  sub_10001E3A4();

}

@end
