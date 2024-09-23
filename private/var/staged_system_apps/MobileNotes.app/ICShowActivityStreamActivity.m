@implementation ICShowActivityStreamActivity

- (ICCloudSyncingObject)object
{
  return (ICCloudSyncingObject *)*(id *)&self->ICActivity_opaque[OBJC_IVAR___ICShowActivityStreamActivity_object];
}

- (ICShowActivityStreamActivity)initWithObject:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_unknownObjectWeakInit(&self->ICActivity_opaque[OBJC_IVAR___ICShowActivityStreamActivity_viewControllerManager], 0);
  *(_QWORD *)&self->ICActivity_opaque[OBJC_IVAR___ICShowActivityStreamActivity_object] = a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[ICShowActivityStreamActivity init](&v8, "init");
}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)(id)swift_unknownObjectWeakLoadStrong(&self->ICActivity_opaque[OBJC_IVAR___ICShowActivityStreamActivity_viewControllerManager]);
}

- (void)setViewControllerManager:(id)a3
{
  swift_unknownObjectWeakAssign(&self->ICActivity_opaque[OBJC_IVAR___ICShowActivityStreamActivity_viewControllerManager], a3);
}

- (NSString)activityTitle
{
  ICShowActivityStreamActivity *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10034109C();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (UIImage)activityImage
{
  ICShowActivityStreamActivity *v2;
  NSString v3;
  id v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v3);

  return (UIImage *)v4;
}

- (NSString)activityType
{
  ICShowActivityStreamActivity *v2;
  NSString v3;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();

  return (NSString *)v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  ICShowActivityStreamActivity *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_100569F48, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = (void (*)(uint64_t, uint64_t, uint64_t))sub_100206398;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_100341394(v7, v6);
  sub_100012C50((uint64_t)v7, v6);

}

- (ICShowActivityStreamActivity)initWithPerformActivity:(id)a3
{
  ICShowActivityStreamActivity *result;

  _Block_copy(a3);
  result = (ICShowActivityStreamActivity *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ShowActivityStreamActivity", 38, "init(performActivity:)", 22, 0);
  __break(1u);
  return result;
}

- (ICShowActivityStreamActivity)init
{
  ICShowActivityStreamActivity *result;

  result = (ICShowActivityStreamActivity *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ShowActivityStreamActivity", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy(&self->ICActivity_opaque[OBJC_IVAR___ICShowActivityStreamActivity_viewControllerManager]);
}

@end
