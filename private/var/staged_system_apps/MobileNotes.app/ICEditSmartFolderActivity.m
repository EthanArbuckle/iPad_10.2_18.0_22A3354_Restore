@implementation ICEditSmartFolderActivity

- (UIViewController)presentingViewController
{
  return (UIViewController *)(id)swift_unknownObjectWeakLoadStrong(&self->ICActivity_opaque[OBJC_IVAR___ICEditSmartFolderActivity_presentingViewController]);
}

- (void)setPresentingViewController:(id)a3
{
  swift_unknownObjectWeakAssign(&self->ICActivity_opaque[OBJC_IVAR___ICEditSmartFolderActivity_presentingViewController], a3);
}

- (ICFolder)smartFolder
{
  return (ICFolder *)*(id *)&self->ICActivity_opaque[OBJC_IVAR___ICEditSmartFolderActivity_smartFolder];
}

- (ICEditSmartFolderActivity)initWithSmartFolder:(id)a3 presentingViewController:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v8 = swift_unknownObjectWeakInit(&self->ICActivity_opaque[OBJC_IVAR___ICEditSmartFolderActivity_presentingViewController], 0);
  *(_QWORD *)&self->ICActivity_opaque[OBJC_IVAR___ICEditSmartFolderActivity_smartFolder] = a3;
  swift_unknownObjectWeakAssign(v8, a4);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = a3;
  return -[ICEditSmartFolderActivity init](&v11, "init");
}

- (UIImage)activityImage
{
  ICEditSmartFolderActivity *v2;
  NSString v3;
  id v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v3);

  return (UIImage *)v4;
}

- (NSString)activityTitle
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_1003D3000();
  if (v2)
  {
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)activityType
{
  ICEditSmartFolderActivity *v2;
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
  void (*v7)(char);
  ICEditSmartFolderActivity *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_10056E5E0, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1003D3278;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1003D30D8();
  sub_100012C50((uint64_t)v7, v6);

}

- (ICEditSmartFolderActivity)initWithPerformActivity:(id)a3
{
  ICEditSmartFolderActivity *result;

  _Block_copy(a3);
  result = (ICEditSmartFolderActivity *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.EditSmartFolderActivity", 35, "init(performActivity:)", 22, 0);
  __break(1u);
  return result;
}

- (ICEditSmartFolderActivity)init
{
  ICEditSmartFolderActivity *result;

  result = (ICEditSmartFolderActivity *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.EditSmartFolderActivity", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->ICActivity_opaque[OBJC_IVAR___ICEditSmartFolderActivity_presentingViewController]);

}

@end
