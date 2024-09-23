@implementation ResultContext

- (NSString)description
{
  return (NSString *)sub_19A962970(self, (uint64_t)a2, (void (*)(void))ResultContext.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_19A962970(self, (uint64_t)a2, (void (*)(void))ResultContext.debugDescription.getter);
}

- (_TtC8TipsCore13ResultContext)init
{
  _TtC8TipsCore13ResultContext *result;

  result = (_TtC8TipsCore13ResultContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_19A96692C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData), *(_QWORD *)&self->resultId[OBJC_IVAR____TtC8TipsCore13ResultContext_contextData]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8TipsCore13ResultContext *v5;

  v4 = a3;
  v5 = self;
  ResultContext.encode(with:)((NSCoder)v4);

}

- (_TtC8TipsCore13ResultContext)initWithCoder:(id)a3
{
  return (_TtC8TipsCore13ResultContext *)ResultContext.init(coder:)(a3);
}

@end
