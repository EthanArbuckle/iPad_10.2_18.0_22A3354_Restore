@implementation PFFairPlayRolloutController

- (BOOL)isEnabled
{
  return _s18PodcastsFoundation25FairPlayRolloutControllerC9isEnabledSbyF_0() & 1;
}

+ (PFFairPlayRolloutController)sharedInstance
{
  if (qword_1ED2A7888 != -1)
    swift_once();
  return (PFFairPlayRolloutController *)(id)qword_1ED2A7878;
}

- (PFFairPlayRolloutController)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFFairPlayRolloutController____lazy_storage___internalQueue) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[PFFairPlayRolloutController init](&v5, sel_init);
}

- (void)didRollbackStatusChangeWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  PFFairPlayRolloutController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  FairPlayRolloutController.didRollbackStatusChange(completion:)((uint64_t)sub_1A90D8000, v5);

  swift_release();
}

- (void).cxx_destruct
{

}

@end
