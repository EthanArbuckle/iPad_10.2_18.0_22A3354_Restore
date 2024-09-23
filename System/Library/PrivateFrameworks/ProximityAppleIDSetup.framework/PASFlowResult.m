@implementation PASFlowResult

- (int64_t)accountType
{
  return 2;
}

- (FAFamilyMember)familyMember
{
  return (FAFamilyMember *)0;
}

- (ACAccount)personalAccount
{
  return (ACAccount *)0;
}

- (NSDictionary)authResults
{
  return (NSDictionary *)0;
}

- (NSError)error
{
  return (NSError *)0;
}

- (PASFlowResult)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PASFlowResultObjc();
  return -[PASFlowResult init](&v3, sel_init);
}

@end
