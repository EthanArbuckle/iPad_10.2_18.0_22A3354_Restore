@implementation ICClearActivityCachesActivity

- (ICNote)note
{
  return (ICNote *)*(id *)&self->ICActivity_opaque[OBJC_IVAR___ICClearActivityCachesActivity_note];
}

- (ICClearActivityCachesActivity)initWithNote:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(_QWORD *)&self->ICActivity_opaque[OBJC_IVAR___ICClearActivityCachesActivity_note] = a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[ICClearActivityCachesActivity init](&v8, "init");
}

- (UIImage)activityImage
{
  ICClearActivityCachesActivity *v2;
  NSString v3;
  id v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v3);

  return (UIImage *)v4;
}

- (NSString)activityTitle
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSString)activityType
{
  ICClearActivityCachesActivity *v2;
  NSString v3;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();

  return (NSString *)v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSString v7;
  id v8;
  ICClearActivityCachesActivity *v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_10055F248, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_100206398;
  }
  else
  {
    v5 = 0;
  }
  v6 = *(void **)&self->ICActivity_opaque[OBJC_IVAR___ICClearActivityCachesActivity_note];
  v9 = self;
  objc_msgSend(v6, "clearReplicaIDsToNotesVersion");
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v6, "updateChangeCountWithReason:", v7);

  v8 = objc_msgSend(v6, "managedObjectContext");
  objc_msgSend(v8, "ic_save");

  -[ICClearActivityCachesActivity activityDidFinish:](v9, "activityDidFinish:", 1);
  sub_100012C50((uint64_t)v4, v5);

}

- (ICClearActivityCachesActivity)initWithPerformActivity:(id)a3
{
  ICClearActivityCachesActivity *result;

  _Block_copy(a3);
  result = (ICClearActivityCachesActivity *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ClearActivityCachesActivity", 39, "init(performActivity:)", 22, 0);
  __break(1u);
  return result;
}

- (ICClearActivityCachesActivity)init
{
  ICClearActivityCachesActivity *result;

  result = (ICClearActivityCachesActivity *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ClearActivityCachesActivity", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
