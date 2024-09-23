@implementation MTRecommendationModuleAttributes

- (MTRecommendationModuleTitle)title
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MTRecommendationModuleAttributes_title);
  swift_beginAccess();
  return (MTRecommendationModuleTitle *)*v2;
}

- (void)setTitle:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MTRecommendationModuleAttributes_title);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (MTRecommendationModuleAttributes)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTRecommendationModuleAttributes_title) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTRecommendationModuleAttributes_resourceTypes) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[MTRecommendationModuleAttributes init](&v5, sel_init);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
