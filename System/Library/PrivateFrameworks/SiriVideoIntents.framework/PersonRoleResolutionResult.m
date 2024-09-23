@implementation PersonRoleResolutionResult

+ (id)successWithResolvedPersonRole:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static PersonRoleResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithPersonRoleToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static PersonRoleResolutionResult.confirmationRequired(with:)(a3);
}

- (PersonRoleResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;

  v5 = sub_21E9D84AC();
  return (PersonRoleResolutionResult *)PersonRoleResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end
