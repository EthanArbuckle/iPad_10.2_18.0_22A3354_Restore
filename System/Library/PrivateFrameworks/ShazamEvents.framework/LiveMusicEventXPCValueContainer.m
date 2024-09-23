@implementation LiveMusicEventXPCValueContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC12ShazamEvents31LiveMusicEventXPCValueContainer)initWithCoder:(id)a3
{
  return (_TtC12ShazamEvents31LiveMusicEventXPCValueContainer *)sub_227950558((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_227951174);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12ShazamEvents31LiveMusicEventXPCValueContainer *v5;

  v4 = a3;
  v5 = self;
  sub_227950024(v4, (uint64_t)&OBJC_IVAR____TtC12ShazamEvents31LiveMusicEventXPCValueContainer_value, &qword_255904220, (void (*)(void))sub_227951F0C);

}

- (_TtC12ShazamEvents31LiveMusicEventXPCValueContainer)init
{
  _TtC12ShazamEvents31LiveMusicEventXPCValueContainer *result;

  result = (_TtC12ShazamEvents31LiveMusicEventXPCValueContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2279520BC((uint64_t)self + OBJC_IVAR____TtC12ShazamEvents31LiveMusicEventXPCValueContainer_value, &qword_255904220);
}

@end
