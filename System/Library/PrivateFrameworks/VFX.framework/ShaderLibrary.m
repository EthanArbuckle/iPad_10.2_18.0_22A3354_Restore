@implementation ShaderLibrary

- (void)dealloc
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[ShaderLibrary dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC3VFX13ShaderLibrary_libraryURL;
  v4 = sub_1B2228110();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC3VFX13ShaderLibrary)init
{
  _TtC3VFX13ShaderLibrary *result;

  result = (_TtC3VFX13ShaderLibrary *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
