@implementation TTRSharedWithYouProvider

- (_TtC15RemindersUICore24TTRSharedWithYouProvider)init
{
  _TtC15RemindersUICore24TTRSharedWithYouProvider *result;

  result = (_TtC15RemindersUICore24TTRSharedWithYouProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRSharedWithYouProvider_invocationQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRSharedWithYouProvider_backgroundQueue));
  swift_bridgeObjectRelease();
  sub_1B41E1CB4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15RemindersUICore24TTRSharedWithYouProvider_customFetchShareForSharedList));
  swift_release();
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  uint64_t v4;
  _TtC15RemindersUICore24TTRSharedWithYouProvider *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;

  v4 = qword_1EF097BF0;
  v10 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_1B49058F4();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EF09BB90);
  v7 = sub_1B49058E8();
  v8 = sub_1B49073A0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B41C2000, v7, v8, "SharedWithYou: Highlights did change", v9, 2u);
    MEMORY[0x1B5E3D7E0](v9, -1, -1);
  }

}

@end
