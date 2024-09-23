@implementation _UIApplicationIntelligenceSupport

+ (_UIApplicationIntelligenceSupport)sharedInstance
{
  if (qword_1ECD75A48 != -1)
    swift_once();
  return (_UIApplicationIntelligenceSupport *)(id)qword_1ECD75A80;
}

+ (Class)remoteContextWrapperClass
{
  sub_186506E8C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_UIApplicationIntelligenceSupport)init
{
  return (_UIApplicationIntelligenceSupport *)sub_18575260C();
}

- (void).cxx_destruct
{
  swift_release();
}

- (int64_t)applicationState
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____UIApplicationIntelligenceSupport_applicationState);
}

- (void)setApplicationState:(int64_t)a3
{
  _UIApplicationIntelligenceSupport *v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIApplicationIntelligenceSupport_applicationState) = (Class)a3;
  sub_186507198();
  v4 = self;
  sub_186507180();
  sub_185752CB4();
  sub_186507174();

  swift_release();
}

- (void)connectedScenesUpdated
{
  _UIApplicationIntelligenceSupport *v3;

  sub_186507198();
  v3 = self;
  sub_186507180();
  sub_185752CB4();
  sub_186507174();

  swift_release();
}

+ (void)collectRemoteContent:(id)a3 inVisibleRect:(CGRect)a4 withRemoteContextWrapper:(id)a5
{
  sub_185752C24(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, (uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a5, (void (*)(id, uint64_t, double, double, double, double))sub_185755568);
}

+ (void)collectRemoteContentForRootViews:(id)a3 withRemoteContextWrapper:(id)a4
{
  unint64_t v5;

  sub_1851F9080(0, (unint64_t *)&qword_1EDD82CE0);
  v5 = sub_186507654();
  swift_unknownObjectRetain();
  sub_1857556C0(v5, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)collectRemoteContentForWindowHostingScene:(id)a3 inVisibleRect:(CGRect)a4 withRemoteContextWrapper:(id)a5
{
  sub_185752C24(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, (uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a5, (void (*)(id, uint64_t, double, double, double, double))sub_185755A78);
}

@end
