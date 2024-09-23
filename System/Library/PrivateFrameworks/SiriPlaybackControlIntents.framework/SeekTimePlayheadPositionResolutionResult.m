@implementation SeekTimePlayheadPositionResolutionResult

- (SeekTimePlayheadPositionResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5;
  SeekTimePlayheadPositionResolutionResult *result;

  v5 = sub_2249ECD68();
  SeekTimePlayheadPositionResolutionResult.init(JSONDictionary:intent:)(v5, a4);
  return result;
}

@end
