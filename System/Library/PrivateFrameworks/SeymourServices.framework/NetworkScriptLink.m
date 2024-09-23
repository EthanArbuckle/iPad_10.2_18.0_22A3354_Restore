@implementation NetworkScriptLink

- (_TtC15SeymourServices17NetworkScriptLink)init
{
  _TtC15SeymourServices17NetworkScriptLink *result;

  result = (_TtC15SeymourServices17NetworkScriptLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC15SeymourServices17NetworkScriptLink__shrinkJsFootprintEnabled;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8C9588);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SeymourServices17NetworkScriptLink_scriptConfiguration));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices17NetworkScriptLink_dispatchService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices17NetworkScriptLink_fileStore);
  sub_1CEAFEEDC((uint64_t)self + OBJC_IVAR____TtC15SeymourServices17NetworkScriptLink_state);
}

@end
