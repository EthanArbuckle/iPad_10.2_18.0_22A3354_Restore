@implementation WFAnisetteRequest

- (NSString)description
{
  return (NSString *)sub_247CEC634(self, (uint64_t)a2, (void (*)(void))sub_247CEB8A8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  WFAnisetteRequest *v5;

  v4 = a3;
  v5 = self;
  sub_247CEB9A8(v4);

}

- (WFAnisetteRequest)initWithCoder:(id)a3
{
  return (WFAnisetteRequest *)sub_247CEBC50(a3);
}

- (WFAnisetteRequest)init
{
  WFAnisetteRequest *result;

  result = (WFAnisetteRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_247CED460();
}

@end
