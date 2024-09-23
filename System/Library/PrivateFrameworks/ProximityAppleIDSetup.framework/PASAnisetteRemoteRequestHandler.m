@implementation PASAnisetteRemoteRequestHandler

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC21ProximityAppleIDSetup31PASAnisetteRemoteRequestHandler *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_2554DA718;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_21F715F3C();
  __swift_project_value_buffer(v6, (uint64_t)static PASLogger.common);
  v7 = sub_21F715F24();
  v8 = sub_21F716350();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21F63C000, v7, v8, "PASAnisetteRemoteRequestHandler deinit", v9, 2u);
    MEMORY[0x2207CC514](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  -[PASAnisetteRemoteRequestHandler dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC21ProximityAppleIDSetup31PASAnisetteRemoteRequestHandler_messageSessionProvider);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC21ProximityAppleIDSetup31PASAnisetteRemoteRequestHandler_anisetteController);
}

- (_TtC21ProximityAppleIDSetup31PASAnisetteRemoteRequestHandler)init
{
  _TtC21ProximityAppleIDSetup31PASAnisetteRemoteRequestHandler *result;

  result = (_TtC21ProximityAppleIDSetup31PASAnisetteRemoteRequestHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
