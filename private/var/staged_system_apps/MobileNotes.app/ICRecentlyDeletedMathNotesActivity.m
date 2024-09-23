@implementation ICRecentlyDeletedMathNotesActivity

- (ICRecentlyDeletedMathNotesActivity)initWithViewControllerManager:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = swift_unknownObjectWeakInit(&self->ICActivity_opaque[OBJC_IVAR___ICRecentlyDeletedMathNotesActivity_viewControllerManager], 0);
  swift_unknownObjectWeakAssign(v6, a3);
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[ICRecentlyDeletedMathNotesActivity init](&v8, "init");
}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)(id)swift_unknownObjectWeakLoadStrong(&self->ICActivity_opaque[OBJC_IVAR___ICRecentlyDeletedMathNotesActivity_viewControllerManager]);
}

- (void)setViewControllerManager:(id)a3
{
  swift_unknownObjectWeakAssign(&self->ICActivity_opaque[OBJC_IVAR___ICRecentlyDeletedMathNotesActivity_viewControllerManager], a3);
}

- (NSString)activityTitle
{
  void *v3;
  ICRecentlyDeletedMathNotesActivity *v4;
  id v5;
  NSString v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v3 = (void *)objc_opt_self(NSBundle);
  v4 = self;
  v5 = objc_msgSend(v3, "mainBundle");
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v5, "localizedStringForKey:value:table:", v6, 0, 0);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v9 = v8;

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return (NSString *)v10;
}

- (UIImage)activityImage
{
  ICRecentlyDeletedMathNotesActivity *v2;
  NSString v3;
  id v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v3);

  return (UIImage *)v4;
}

- (NSString)activityType
{
  ICRecentlyDeletedMathNotesActivity *v2;
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
  ICRecentlyDeletedMathNotesActivity *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_10056E478, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = (void (*)(uint64_t, uint64_t, uint64_t))sub_10023B9A0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1003D0E04(v7);
  sub_100012C50((uint64_t)v7, v6);

}

- (id)menuWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(char, uint64_t, uint64_t);
  ICRecentlyDeletedMathNotesActivity *v8;
  id v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_10056E428, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100206398;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  v9 = sub_1003D0A88(v7, v6);
  sub_100012C50((uint64_t)v7, v6);

  return v9;
}

- (ICRecentlyDeletedMathNotesActivity)initWithPerformActivity:(id)a3
{
  ICRecentlyDeletedMathNotesActivity *result;

  _Block_copy(a3);
  result = (ICRecentlyDeletedMathNotesActivity *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.RecentlyDeletedMathNotesActivity", 44, "init(performActivity:)", 22, 0);
  __break(1u);
  return result;
}

- (ICRecentlyDeletedMathNotesActivity)init
{
  ICRecentlyDeletedMathNotesActivity *result;

  result = (ICRecentlyDeletedMathNotesActivity *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.RecentlyDeletedMathNotesActivity", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->ICActivity_opaque[OBJC_IVAR___ICRecentlyDeletedMathNotesActivity_viewControllerManager]);
}

@end
