@implementation PASSourceFlowResult

- (int64_t)accountType
{
  PASSourceFlowResult *v2;
  int64_t v3;

  v2 = self;
  v3 = PASSourceFlowResultObjc.accountTypeObjc.getter();

  return v3;
}

- (FAFamilyMember)familyMember
{
  PASSourceFlowResult *v2;
  id v3;

  v2 = self;
  v3 = PASSourceFlowResultObjc.familyMember.getter();

  return (FAFamilyMember *)v3;
}

- (ACAccount)personalAccount
{
  PASSourceFlowResult *v2;
  id v3;

  v2 = self;
  v3 = PASSourceFlowResultObjc.personalAccount.getter();

  return (ACAccount *)v3;
}

- (NSDictionary)authResults
{
  PASSourceFlowResult *v2;
  id v3;

  v2 = self;
  v3 = PASSourceFlowResultObjc.authResults.getter();

  return (NSDictionary *)v3;
}

- (NSError)error
{
  return (NSError *)sub_21F6AD6A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PASSourceFlowResult_result, (uint64_t *)&unk_2554DB8E0);
}

- (NSString)description
{
  return (NSString *)sub_21F6AD8C4(self, (uint64_t)a2, (void (*)(void))PASSourceFlowResultObjc.description.getter);
}

- (PASSourceFlowResult)init
{
  PASSourceFlowResult *result;

  result = (PASSourceFlowResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21F6476AC((uint64_t)self + OBJC_IVAR___PASSourceFlowResult_result, (uint64_t *)&unk_2554DB8E0);
}

@end
