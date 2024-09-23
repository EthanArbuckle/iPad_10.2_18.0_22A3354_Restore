@implementation ObservabilityXPCTimerActivity

- (_TtC16promotedcontentd29ObservabilityXPCTimerActivity)init
{
  id v3;
  _TtC16promotedcontentd29ObservabilityXPCTimerActivity *v4;
  id v5;
  id v6;
  objc_class *v7;
  char *v8;
  _TtC16promotedcontentd29ObservabilityXPCTimerActivity *v9;
  uint64_t ObjectType;
  objc_super v12;

  v3 = objc_allocWithZone((Class)type metadata accessor for ObservabilityXPCTimerActivityDelegate(0));
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  v6 = objc_msgSend(objc_allocWithZone((Class)APXPCActivity), "initWithDelegate:", v5);

  v7 = (objc_class *)type metadata accessor for ObservabilityXPCTimerActivity();
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[OBJC_IVAR____TtC16promotedcontentd29ObservabilityXPCTimerActivity_apXpcActivityDelegate] = v5;
  *(_QWORD *)&v8[OBJC_IVAR____TtC16promotedcontentd29ObservabilityXPCTimerActivity_apXpcActivity] = v6;
  v12.receiver = v8;
  v12.super_class = v7;
  v9 = -[ObservabilityXPCTimerActivity init](&v12, "init");
  ObjectType = swift_getObjectType(v4);
  swift_deallocPartialClassInstance(v4, ObjectType, 24, 7);
  return v9;
}

- (void)checkin
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC16promotedcontentd29ObservabilityXPCTimerActivity_apXpcActivity), "checkin");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16promotedcontentd29ObservabilityXPCTimerActivity_apXpcActivity));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16promotedcontentd29ObservabilityXPCTimerActivity_apXpcActivityDelegate));
}

@end
