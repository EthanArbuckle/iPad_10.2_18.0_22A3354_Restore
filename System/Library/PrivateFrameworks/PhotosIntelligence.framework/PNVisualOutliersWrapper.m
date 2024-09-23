@implementation PNVisualOutliersWrapper

+ (id)requiredFetchPropertySets
{
  return +[PNVisualOutliers requiredFetchPropertySets](PNVisualOutliers, "requiredFetchPropertySets");
}

+ (id)assetsDistancesSummary:(id)a3 inAssets:(id)a4 withinThresholdType:(int64_t)a5
{
  return +[PNVisualOutliers assetsDistancesSummary:inAssets:withinThresholdType:](PNVisualOutliers, "assetsDistancesSummary:inAssets:withinThresholdType:", a3, a4, a5);
}

+ (BOOL)isAsset:(id)a3 similarToAnyAssets:(id)a4 withinThresholdType:(int64_t)a5
{
  return +[PNVisualOutliers isAsset:similarToAnyAssets:withinThresholdType:](PNVisualOutliers, "isAsset:similarToAnyAssets:withinThresholdType:", a3, a4, a5);
}

+ (id)outlierScoresForAssets:(id)a3
{
  return +[PNVisualOutliers outlierScoresForAssets:](PNVisualOutliers, "outlierScoresForAssets:", a3);
}

@end
