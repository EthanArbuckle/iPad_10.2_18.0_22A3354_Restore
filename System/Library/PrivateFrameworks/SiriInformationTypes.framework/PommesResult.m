@implementation PommesResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch12PommesResult)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch12PommesResult *)PommesResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21SiriInformationSearch12PommesResult *v5;

  v4 = a3;
  v5 = self;
  PommesResult.encode(with:)((NSCoder)v4);

}

- (_TtC21SiriInformationSearch12PommesResult)init
{
  _TtC21SiriInformationSearch12PommesResult *result;

  result = (_TtC21SiriInformationSearch12PommesResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata), *(_QWORD *)&self->resultId[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata]);
}

@end
