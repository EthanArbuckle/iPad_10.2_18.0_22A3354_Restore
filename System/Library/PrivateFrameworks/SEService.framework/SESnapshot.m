@implementation SESnapshot

- (NSString)description
{
  return (NSString *)sub_20A09BD6C(self, (uint64_t)a2, (void (*)(void))SESnapshot.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_20A09BD6C(self, (uint64_t)a2, (void (*)(void))SESnapshot.debugDescription.getter);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2545CA140;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2545CA140 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9SEService10SESnapshot *v5;

  v4 = a3;
  v5 = self;
  SESnapshot.encode(with:)((NSCoder)v4);

}

- (_TtC9SEService10SESnapshot)initWithCoder:(id)a3
{
  return (_TtC9SEService10SESnapshot *)SESnapshot.init(coder:)(a3);
}

- (_TtC9SEService10SESnapshot)init
{
  _TtC9SEService10SESnapshot *result;

  result = (_TtC9SEService10SESnapshot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SEService10SESnapshot_uuid;
  v4 = sub_20A0E06D4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20A0801F8((uint64_t)self + OBJC_IVAR____TtC9SEService10SESnapshot_memoryCalculator, &qword_2545CA1C0);

}

@end
