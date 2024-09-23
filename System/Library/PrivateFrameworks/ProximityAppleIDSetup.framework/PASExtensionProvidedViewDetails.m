@implementation PASExtensionProvidedViewDetails

- (_TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails)init
{
  _TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *result;

  result = (_TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *)sub_21F7165FC();
  __break(1u);
  return result;
}

- (NSString)description
{
  _TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *v2;
  void *v3;

  v2 = self;
  PASExtensionProvidedViewDetails.description.getter();

  v3 = (void *)sub_21F7160E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *v4;
  _TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_21F716458();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = PASExtensionProvidedViewDetails.isEqual(_:)((uint64_t)v8);

  sub_21F649B5C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *v2;
  int64_t v3;

  v2 = self;
  v3 = PASExtensionProvidedViewDetails.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static PASExtensionProvidedViewDetails.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static PASExtensionProvidedViewDetails.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *v5;

  v4 = a3;
  v5 = self;
  PASExtensionProvidedViewDetails.encode(with:)((NSCoder)v4);

}

- (_TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails)initWithCoder:(id)a3
{
  id v3;
  _TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *v4;

  v3 = a3;
  v4 = (_TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *)sub_21F6F25DC();

  return v4;
}

- (void).cxx_destruct
{
  sub_21F6F25A0();
}

@end
