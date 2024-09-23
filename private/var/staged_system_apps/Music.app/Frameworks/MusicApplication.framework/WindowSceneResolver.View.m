@implementation WindowSceneResolver.View

- (_TtCV16MusicApplication19WindowSceneResolver4View)initWithCoder:(id)a3
{
  _TtCV16MusicApplication19WindowSceneResolver4View *result;

  result = (_TtCV16MusicApplication19WindowSceneResolver4View *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/WindowSceneResolver.swift", 42, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for WindowSceneResolver.View();
  v4 = a3;
  v5 = (char *)v12.receiver;
  -[WindowSceneResolver.View willMoveToWindow:](&v12, "willMoveToWindow:", v4);
  v6 = objc_msgSend(v4, "windowScene");
  v7 = *(_QWORD *)&v5[OBJC_IVAR____TtCV16MusicApplication19WindowSceneResolver4View__boundWindowScene + 16];
  v10 = *(_OWORD *)&v5[OBJC_IVAR____TtCV16MusicApplication19WindowSceneResolver4View__boundWindowScene];
  v11 = v7;
  v9 = v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_14F88E0);
  Binding.wrappedValue.setter(&v9, v8);

}

- (_TtCV16MusicApplication19WindowSceneResolver4View)initWithFrame:(CGRect)a3
{
  _TtCV16MusicApplication19WindowSceneResolver4View *result;

  result = (_TtCV16MusicApplication19WindowSceneResolver4View *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.View", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  id v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtCV16MusicApplication19WindowSceneResolver4View__boundWindowScene);
  v3 = *(id *)&self->_boundWindowScene[OBJC_IVAR____TtCV16MusicApplication19WindowSceneResolver4View__boundWindowScene
                                     + 8];
  swift_release(*(_QWORD *)&self->_boundWindowScene[OBJC_IVAR____TtCV16MusicApplication19WindowSceneResolver4View__boundWindowScene]);
  swift_release(v2);

}

@end
