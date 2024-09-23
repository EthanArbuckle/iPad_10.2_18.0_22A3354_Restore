@implementation TPSUserGuideManager

+ (id)userGuides
{
  void *v2;

  _s10TipsDaemon16UserGuideManagerC10userGuidesSay0A4Core0cD0CGyFZ_0();
  sub_1DACA2CF8();
  v2 = (void *)sub_1DACA2E30();
  swift_bridgeObjectRelease();
  return v2;
}

- (TPSUserGuideManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[TPSUserGuideManager init](&v3, sel_init);
}

@end
