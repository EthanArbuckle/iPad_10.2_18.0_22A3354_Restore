@implementation MediaStreamResolutionResult

+ (id)successWithResolvedMediaStream:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E9014();

  return v5;
}

+ (id)disambiguationWithMediaStreamsToDisambiguate:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for MediaStream();
  v3 = sub_2249ECE70();
  swift_getObjCClassMetadata();
  sub_2249E904C(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationRequiredWithMediaStreamToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2249E9128();

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  sub_2249E95E4();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  sub_2249E4D60();
  sub_2249ECE70();
  sub_2249E9620();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  sub_2249E9678();
}

- (MediaStreamResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  MediaStreamResolutionResult *result;

  v5 = sub_2249ECD68();
  MediaStreamResolutionResult.init(JSONDictionary:intent:)(v5, (uint64_t)a4);
  return result;
}

@end
