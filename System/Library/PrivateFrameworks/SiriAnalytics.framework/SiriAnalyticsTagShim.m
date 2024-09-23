@implementation SiriAnalyticsTagShim

- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  SiriAnalyticsTagShim *result;

  TagShim.init(conditionType:start:end:)(*(uint64_t *)&a3, a4, a5);
  return result;
}

- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 start:(unint64_t)a4
{
  SiriAnalyticsTagShim *result;

  TagShim.init(conditionType:start:)(*(uint64_t *)&a3, a4);
  return result;
}

- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 end:(unint64_t)a4
{
  SiriAnalyticsTagShim *result;

  TagShim.init(conditionType:end:)(*(uint64_t *)&a3, a4);
  return result;
}

- (SiriAnalyticsTagShim)initWithConditionTypeAffectingEntireClock:(int)a3
{
  return (SiriAnalyticsTagShim *)TagShim.init(conditionTypeAffectingEntireClock:)(*(uint64_t *)&a3);
}

- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 componentId:(id)a4 componentName:(int)a5 joined:(BOOL)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v9 = sub_1A0307334();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A030731C();
  return (SiriAnalyticsTagShim *)TagShim.init(conditionType:componentId:componentName:joined:)(a3, (uint64_t)v11, a5, a6);
}

- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 requestId:(id)a4 joined:(BOOL)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  SiriAnalyticsTagShim *result;
  uint64_t v11;

  v6 = *(_QWORD *)&a3;
  v7 = sub_1A0307334();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A030731C();
  TagShim.init(conditionType:requestId:joined:)(v6, (uint64_t)v9, a5);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return static TagShim.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static TagShim.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriAnalyticsTagShim *v5;

  v4 = a3;
  v5 = self;
  sub_1A02EE810(v4);

}

- (SiriAnalyticsTagShim)initWithCoder:(id)a3
{
  return (SiriAnalyticsTagShim *)TagShim.init(coder:)(a3);
}

- (NSString)description
{
  SiriAnalyticsTagShim *v2;
  void *v3;

  v2 = self;
  sub_1A02EF064();

  v3 = (void *)sub_1A03077A8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (SiriAnalyticsTagShim)init
{
  TagShim.init()();
}

- (void).cxx_destruct
{
  sub_1A0278A7C((uint64_t)self + OBJC_IVAR___SiriAnalyticsTagShim_identifier, &qword_1ED07BC80);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SiriAnalyticsTagShim_underlying);
}

@end
