@implementation WelcomeModule

- (id)createViewController
{
  uint64_t v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  char *v7;
  _TtC8StocksUI13WelcomeModule *v8;
  void *v9;
  id result;
  uint64_t v11;

  v3 = sub_1DC403AC0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v4 + 104))(v7, *MEMORY[0x1E0DADEF0], v3, v5);
  v8 = self;
  sub_1DC4017EC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8StocksUI13WelcomeModule_resolver), *(_QWORD *)&v8->resolver[OBJC_IVAR____TtC8StocksUI13WelcomeModule_resolver + 16]);
  type metadata accessor for WelcomeViewController();
  swift_retain();
  v9 = (void *)sub_1DC4025E4();
  result = (id)swift_release();
  if (v9)
  {

    swift_release();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC8StocksUI13WelcomeModule)init
{
  _TtC8StocksUI13WelcomeModule *result;

  result = (_TtC8StocksUI13WelcomeModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI13WelcomeModule_resolver);
  swift_release();
}

@end
