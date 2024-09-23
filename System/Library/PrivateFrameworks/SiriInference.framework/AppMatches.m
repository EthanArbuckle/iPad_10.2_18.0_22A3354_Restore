@implementation AppMatches

- (NSString)description
{
  AppMatches *v2;
  void *v3;

  v2 = self;
  sub_1C0070CB8();

  v3 = (void *)sub_1C0303E8C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)recommendation
{
  return AppMatches.recommendation.getter();
}

- (NSArray)bundleIds
{
  void *v2;

  AppMatches.bundleIds.getter();
  v2 = (void *)sub_1C0304120();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (id)copyWithZone:(void *)a3
{
  AppMatches *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1C0178654(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1C03049FC();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return static AppMatches.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static AppMatches.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AppMatches *v5;

  v4 = a3;
  v5 = self;
  sub_1C0178824(v4);

}

- (AppMatches)initWithCoder:(id)a3
{
  return (AppMatches *)AppMatches.init(coder:)(a3);
}

- (AppMatches)init
{
  AppMatches.init()();
}

@end
