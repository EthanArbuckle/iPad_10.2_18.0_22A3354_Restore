@implementation SMTRequestConjunctionInfo

+ (BOOL)supportsSecureCoding
{
  return static RequestConjunctionInfo.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static RequestConjunctionInfo.supportsSecureCoding.setter(a3);
}

- (SMTRequestConjunctionInfo)initWithCoder:(id)a3
{
  return (SMTRequestConjunctionInfo *)RequestConjunctionInfo.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SMTRequestConjunctionInfo *v5;

  v4 = a3;
  v5 = self;
  RequestConjunctionInfo.encode(with:)((NSCoder)v4);

}

- (NSString)debugDescription
{
  SMTRequestConjunctionInfo *v2;
  void *v3;

  v2 = self;
  RequestConjunctionInfo.debugDescription.getter();

  v3 = (void *)sub_2469F5790();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  SMTRequestConjunctionInfo *v4;
  SMTRequestConjunctionInfo *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2469F597C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = RequestConjunctionInfo.isEqual(_:)((uint64_t)v8);

  sub_24697B9DC((uint64_t)v8);
  return v6;
}

- (SMTRequestConjunctionInfo)init
{
  RequestConjunctionInfo.init()();
}

@end
