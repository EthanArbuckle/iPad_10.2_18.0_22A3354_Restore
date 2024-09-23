@implementation WFAnisetteResponse

- (NSString)description
{
  return (NSString *)sub_247CEC634(self, (uint64_t)a2, (void (*)(void))sub_247CEC68C);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  WFAnisetteResponse *v5;

  v4 = a3;
  v5 = self;
  sub_247CEC7B8(v4);

}

- (WFAnisetteResponse)initWithCoder:(id)a3
{
  return (WFAnisetteResponse *)sub_247CECA60(a3);
}

- (WFAnisetteResponse)init
{
  WFAnisetteResponse *result;

  result = (WFAnisetteResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_247CED460();
}

@end
