@implementation LiveMusicScheduleXPCValueContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer)initWithCoder:(id)a3
{
  _TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer *v4;

  swift_getObjectType();
  v4 = (_TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer *)sub_227951400(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer *v5;

  v4 = a3;
  v5 = self;
  _s12ShazamEvents34LiveMusicScheduleXPCValueContainerC6encode4withySo7NSCoderC_tF_0(v4);

}

- (_TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer)init
{
  _TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer *result;

  result = (_TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_227951ACC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer_value), *(_QWORD *)&self->value[OBJC_IVAR____TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer_value], self->value[OBJC_IVAR____TtC12ShazamEvents34LiveMusicScheduleXPCValueContainer_value + 8]);
}

@end
