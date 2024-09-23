@implementation PNLocationCuration

+ (id)requiredFetchPropertySets
{
  void *v2;

  static LocationCuration.requiredFetchPropertySets()();
  v2 = (void *)sub_243F85108();
  swift_bridgeObjectRelease();
  return v2;
}

+ (int64_t)fetchLimit
{
  return 1000;
}

+ (id)representativeAssetsForMapDisplayFromAssets:(id)a3
{
  char *v4;
  void *v5;

  swift_getObjCClassMetadata();
  v4 = (char *)a3;
  static LocationCuration.representativeAssetsForMapDisplay(from:)(v4);

  sub_243D04234();
  v5 = (void *)sub_243F85108();
  swift_bridgeObjectRelease();
  return v5;
}

- (PNLocationCuration)init
{
  return (PNLocationCuration *)LocationCuration.init()();
}

@end
