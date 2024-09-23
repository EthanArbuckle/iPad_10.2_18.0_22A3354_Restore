@implementation PNPersonCurationWrapper

+ (id)fetchCuratedAssetsForPerson:(id)a3 options:(id)a4 useSummary:(BOOL)a5
{
  return +[PersonCuration fetchCuratedAssetsForPerson:options:useSummary:](_TtC18PhotosIntelligence14PersonCuration, "fetchCuratedAssetsForPerson:options:useSummary:", a3, a4, a5);
}

+ (id)fetchCuratedAssetsForSocialGroup:(id)a3 options:(id)a4 useSummary:(BOOL)a5 includeOthersInSocialGroupAssets:(BOOL)a6
{
  return +[PersonCuration fetchCuratedAssetsForSocialGroup:options:useSummary:includeOthersInSocialGroupAssets:](_TtC18PhotosIntelligence14PersonCuration, "fetchCuratedAssetsForSocialGroup:options:useSummary:includeOthersInSocialGroupAssets:", a3, a4, a5, a6);
}

@end
