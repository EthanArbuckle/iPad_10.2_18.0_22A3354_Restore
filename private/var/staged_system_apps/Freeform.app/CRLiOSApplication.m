@implementation CRLiOSApplication

+ (_TtC8Freeform17CRLiOSApplication)sharedApplication
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v3 = type metadata accessor for CRLiOSApplication();
  return (_TtC8Freeform17CRLiOSApplication *)(id)swift_dynamicCastClassUnconditional(v2, v3, 0, 0, 0);
}

- (id)_extendLaunchTest
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->kCRLExtendedLaunchTestName[OBJC_IVAR____TtC8Freeform17CRLiOSApplication_kCRLExtendedLaunchTestName];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

- (_TtC8Freeform17CRLiOSApplication)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Freeform17CRLiOSApplication_kCRLExtendedLaunchTestName);
  *v2 = 0xD000000000000011;
  v2[1] = 0x8000000100FC1530;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CRLiOSApplication();
  return -[CRLiOSApplication init](&v4, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->kCRLExtendedLaunchTestName[OBJC_IVAR____TtC8Freeform17CRLiOSApplication_kCRLExtendedLaunchTestName]);
}

@end
