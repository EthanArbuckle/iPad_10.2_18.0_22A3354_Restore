@implementation SignedDurationResolutionResult

+ (id)successWithResolvedSignedDuration:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E5BE0();

  return v5;
}

+ (id)disambiguationWithSignedDurationsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for SignedDuration();
  v3 = sub_2249ECE70();
  swift_getObjCClassMetadata();
  sub_2249E5C54(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithSignedDurationToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E5D88();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  sub_2249E5E08();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2249E4D60();
  sub_2249ECE70();
  sub_2249E5E44();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  sub_2249E5E9C();
}

- (SignedDurationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  SignedDurationResolutionResult *result;

  v5 = sub_2249ECD68();
  SignedDurationResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
