@implementation SEPackageDetails

- (_TtC9SEService16SEPackageDetails)init
{
  return (_TtC9SEService16SEPackageDetails *)sub_20A094014();
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2545C9D10;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2545C9D10 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9SEService16SEPackageDetails *v5;

  v4 = a3;
  v5 = self;
  SEPackageDetails.encode(with:)((NSCoder)v4);

}

- (_TtC9SEService16SEPackageDetails)initWithCoder:(id)a3
{
  return (_TtC9SEService16SEPackageDetails *)SEPackageDetails.init(coder:)(a3);
}

- (NSString)description
{
  _TtC9SEService16SEPackageDetails *v2;
  void *v3;

  v2 = self;
  SEPackageDetails.description.getter();

  v3 = (void *)sub_20A0E0800();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_20A080234(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService16SEPackageDetails_type), *(_QWORD *)&self->packageLoaded[OBJC_IVAR____TtC9SEService16SEPackageDetails_type]);
}

@end
