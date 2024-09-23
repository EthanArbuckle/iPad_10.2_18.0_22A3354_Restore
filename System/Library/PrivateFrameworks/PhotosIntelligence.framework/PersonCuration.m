@implementation PersonCuration

+ (id)fetchCuratedAssetsForPerson:(id)a3 options:(id)a4 useSummary:(BOOL)a5
{
  id v8;
  id v9;
  id v10;

  swift_getObjCClassMetadata();
  v8 = a3;
  v9 = a4;
  v10 = static PersonCuration.fetchCuratedAssets(for:options:useSummary:)(v8, a4, a5);

  return v10;
}

+ (id)fetchCuratedAssetsForSocialGroup:(id)a3 options:(id)a4 useSummary:(BOOL)a5 includeOthersInSocialGroupAssets:(BOOL)a6
{
  id v10;
  id v11;
  id v12;

  swift_getObjCClassMetadata();
  v10 = a3;
  v11 = a4;
  v12 = static PersonCuration.fetchCuratedAssets(for:options:useSummary:includeOthersInSocialGroupAssets:)(v10, a4, a5, a6);

  return v12;
}

- (_TtC18PhotosIntelligence14PersonCuration)init
{
  return (_TtC18PhotosIntelligence14PersonCuration *)PersonCuration.init()();
}

@end
