@implementation LiveMusicVenueScheduleXPCValueContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer)initWithCoder:(id)a3
{
  return (_TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer *)sub_227950558((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_22795158C);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer *v5;

  v4 = a3;
  v5 = self;
  sub_227950024(v4, (uint64_t)&OBJC_IVAR____TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer_value, (uint64_t *)&unk_255905C30, (void (*)(void))sub_227951AF8);

}

- (_TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer)init
{
  _TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer *result;

  result = (_TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2279520BC((uint64_t)self + OBJC_IVAR____TtC12ShazamEvents39LiveMusicVenueScheduleXPCValueContainer_value, (uint64_t *)&unk_255905C30);
}

@end
