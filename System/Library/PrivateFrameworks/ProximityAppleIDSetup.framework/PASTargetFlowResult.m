@implementation PASTargetFlowResult

- (int64_t)accountType
{
  PASTargetFlowResult *v2;
  int64_t v3;

  v2 = self;
  v3 = PASTargetFlowResultObjc.accountTypeObjc.getter();

  return v3;
}

- (FAFamilyMember)familyMember
{
  PASTargetFlowResult *v2;
  id v3;

  v2 = self;
  v3 = PASTargetFlowResultObjc.familyMember.getter();

  return (FAFamilyMember *)v3;
}

- (ACAccount)personalAccount
{
  PASTargetFlowResult *v2;
  id v3;

  v2 = self;
  v3 = PASTargetFlowResultObjc.personalAccount.getter();

  return (ACAccount *)v3;
}

- (NSDictionary)authResults
{
  PASTargetFlowResult *v2;
  id v3;

  v2 = self;
  v3 = PASTargetFlowResultObjc.authResults.getter();

  return (NSDictionary *)v3;
}

- (NSError)error
{
  return (NSError *)sub_21F6AD6A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PASTargetFlowResult_result, &qword_2554DED40);
}

- (NSString)description
{
  return (NSString *)sub_21F6AD8C4(self, (uint64_t)a2, (void (*)(void))PASTargetFlowResultObjc.description.getter);
}

- (PASTargetFlowResult)init
{
  PASTargetFlowResult *result;

  result = (PASTargetFlowResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21F6476AC((uint64_t)self + OBJC_IVAR___PASTargetFlowResult_result, &qword_2554DED40);
}

@end
