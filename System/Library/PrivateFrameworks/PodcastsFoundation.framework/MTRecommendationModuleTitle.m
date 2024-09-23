@implementation MTRecommendationModuleTitle

- (NSString)stringForDisplay
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___MTRecommendationModuleTitle_stringForDisplay;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setStringForDisplay:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1A93F8040();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MTRecommendationModuleTitle_stringForDisplay);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (MTRecommendationModuleTitle)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___MTRecommendationModuleTitle_stringForDisplay);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[MTRecommendationModuleTitle init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
