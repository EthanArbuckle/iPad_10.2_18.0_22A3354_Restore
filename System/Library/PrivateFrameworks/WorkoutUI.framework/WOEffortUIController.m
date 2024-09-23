@implementation WOEffortUIController

+ (id)makeHostingControllerWithShouldEmbedInNavStack:(BOOL)a3 startingEffort:(id)a4 cancel:(id)a5 completion:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;

  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v13 = a4;
  v14 = (void *)_s9WorkoutUI18EffortUIControllerC21makeHostingController21shouldEmbedInNavStack08startingC06cancel10completionSo06UIViewG0CSb_So10HKQuantityCSgyycyALctFZ_0(a3, a4, (uint64_t)sub_24A747820, v11, (uint64_t)sub_24A6E8D44, v12);

  swift_release();
  swift_release();
  return v14;
}

- (WOEffortUIController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EffortUIController();
  return -[WOEffortUIController init](&v3, sel_init);
}

@end
