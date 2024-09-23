@implementation ICSimulateQuotaExceededActivity

- (ICNote)note
{
  return (ICNote *)*(id *)&self->ICActivity_opaque[OBJC_IVAR___ICSimulateQuotaExceededActivity_note];
}

- (ICSimulateQuotaExceededActivity)initWithNote:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(_QWORD *)&self->ICActivity_opaque[OBJC_IVAR___ICSimulateQuotaExceededActivity_note] = a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[ICSimulateQuotaExceededActivity init](&v8, "init");
}

- (NSString)activityTitle
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (UIImage)activityImage
{
  ICSimulateQuotaExceededActivity *v2;
  NSString v3;
  id v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v3);

  return (UIImage *)v4;
}

- (NSString)activityType
{
  ICSimulateQuotaExceededActivity *v2;
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
  void (*v7)(char, uint64_t, uint64_t);
  ICSimulateQuotaExceededActivity *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_100568CA8, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100206398;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_100328318();
  sub_100012C50((uint64_t)v7, v6);

}

- (ICSimulateQuotaExceededActivity)initWithPerformActivity:(id)a3
{
  ICSimulateQuotaExceededActivity *result;

  _Block_copy(a3);
  result = (ICSimulateQuotaExceededActivity *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.SimulateQuotaExceededActivity", 41, "init(performActivity:)", 22, 0);
  __break(1u);
  return result;
}

- (ICSimulateQuotaExceededActivity)init
{
  ICSimulateQuotaExceededActivity *result;

  result = (ICSimulateQuotaExceededActivity *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.SimulateQuotaExceededActivity", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
