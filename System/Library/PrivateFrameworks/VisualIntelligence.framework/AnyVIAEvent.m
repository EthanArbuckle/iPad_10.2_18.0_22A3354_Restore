@implementation AnyVIAEvent

- (NSString)originatingApplication
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC18VisualIntelligence11AnyVIAEvent *v7;
  void *v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18VisualIntelligence11AnyVIAEvent_event);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  v6(v4, v5);

  v8 = (void *)sub_1D49225F8();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (unint64_t)queryID
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC18VisualIntelligence11AnyVIAEvent *v7;
  unint64_t v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18VisualIntelligence11AnyVIAEvent_event);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = self;
  v8 = v6(v4, v5);

  return v8;
}

- (id)feedback
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC18VisualIntelligence11AnyVIAEvent *v7;
  void *v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18VisualIntelligence11AnyVIAEvent_event);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
  v7 = self;
  v8 = (void *)v6(v4, v5);

  return v8;
}

- (BOOL)shouldReportDirectly
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC18VisualIntelligence11AnyVIAEvent *v7;
  char v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18VisualIntelligence11AnyVIAEvent_event);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  v7 = self;
  v8 = v6(v4, v5);

  return v8 & 1;
}

- (_TtC18VisualIntelligence11AnyVIAEvent)init
{
  _TtC18VisualIntelligence11AnyVIAEvent *result;

  result = (_TtC18VisualIntelligence11AnyVIAEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18VisualIntelligence11AnyVIAEvent_event);
}

@end
