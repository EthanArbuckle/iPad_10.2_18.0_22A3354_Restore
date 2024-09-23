@implementation PNLocationCurationWrapper

+ (id)requiredFetchPropertySets
{
  return +[PNLocationCuration requiredFetchPropertySets](PNLocationCuration, "requiredFetchPropertySets");
}

+ (unint64_t)fetchLimit
{
  return +[PNLocationCuration fetchLimit](PNLocationCuration, "fetchLimit");
}

+ (id)representativeAssetsForMapDisplayFromAssets:(id)a3
{
  return +[PNLocationCuration representativeAssetsForMapDisplayFromAssets:](PNLocationCuration, "representativeAssetsForMapDisplayFromAssets:", a3);
}

@end
