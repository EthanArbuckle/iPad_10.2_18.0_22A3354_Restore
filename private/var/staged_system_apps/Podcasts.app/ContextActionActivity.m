@implementation ContextActionActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC8Podcasts21ContextActionActivity *v7;
  uint64_t v8;
  void *v9;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem);
  v4 = *(_QWORD *)&self->contextActionItem[OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem];
  ObjectType = swift_getObjectType(v3, a2);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 48);
  v7 = self;
  swift_unknownObjectRetain(v3);
  v8 = v6(ObjectType, v4);
  swift_unknownObjectRelease(v3);
  if (v8 == 48)
    v9 = 0;
  else
    v9 = (void *)ContextActionType.activityType.getter(v8);

  return (NSString *)v9;
}

- (NSString)activityTitle
{
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  _TtC8Podcasts21ContextActionActivity *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem);
  v4 = *(_QWORD *)&self->contextActionItem[OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem];
  ObjectType = swift_getObjectType(v3, a2);
  v6 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
  v7 = self;
  swift_unknownObjectRetain(v3);
  v6(ObjectType, v4);
  v9 = v8;

  swift_unknownObjectRelease(v3);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return (NSString *)v10;
}

- (UIImage)activityImage
{
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  _TtC8Podcasts21ContextActionActivity *v6;
  id v7;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem);
  v4 = *(_QWORD *)&self->contextActionItem[OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem];
  ObjectType = swift_getObjectType(v3, a2);
  v6 = self;
  swift_unknownObjectRetain(v3);
  v7 = sub_100206914(ObjectType, v4);

  swift_unknownObjectRelease(v3);
  return (UIImage *)v7;
}

- (id)_systemImageName
{
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  _TtC8Podcasts21ContextActionActivity *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem);
  v4 = *(_QWORD *)&self->contextActionItem[OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem];
  ObjectType = swift_getObjectType(v3, a2);
  v6 = *(void (**)(uint64_t, uint64_t))(v4 + 32);
  v7 = self;
  swift_unknownObjectRetain(v3);
  v6(ObjectType, v4);
  v9 = v8;

  swift_unknownObjectRelease(v3);
  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC8Podcasts21ContextActionActivity *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8Podcasts21ContextActionActivity_performHandler);
  v3 = *(_QWORD *)&self->contextActionItem[OBJC_IVAR____TtC8Podcasts21ContextActionActivity_performHandler];
  v5 = self;
  v4 = swift_retain(v3);
  v2(v4);
  swift_release(v3);
  -[ContextActionActivity activityDidFinish:](v5, "activityDidFinish:", 1);

}

- (_TtC8Podcasts21ContextActionActivity)init
{
  _TtC8Podcasts21ContextActionActivity *result;

  result = (_TtC8Podcasts21ContextActionActivity *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.ContextActionActivity", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem));
  swift_release(*(_QWORD *)&self->contextActionItem[OBJC_IVAR____TtC8Podcasts21ContextActionActivity_performHandler]);
}

@end
