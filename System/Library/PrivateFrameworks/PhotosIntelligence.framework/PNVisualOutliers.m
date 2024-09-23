@implementation PNVisualOutliers

+ (id)requiredFetchPropertySets
{
  void *v2;

  static VisualOutliers.requiredFetchPropertySets()();
  v2 = (void *)sub_243F85108();
  swift_bridgeObjectRelease();
  return v2;
}

+ (id)assetsDistancesSummary:(id)a3 inAssets:(id)a4 withinThresholdType:(int64_t)a5
{
  unint64_t v7;
  id v8;
  void *v9;

  sub_243C67FD8(0, (unint64_t *)&qword_2543D29B0);
  v7 = sub_243F85120();
  v8 = a3;
  static VisualOutliers.assetsDistancesSummary(for:in:with:)(v8, v7, a5);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_243F84CC4();
  swift_bridgeObjectRelease();
  return v9;
}

+ (BOOL)isAsset:(id)a3 similarToAnyAssets:(id)a4 withinThresholdType:(int64_t)a5
{
  uint64_t v7;
  id v8;

  sub_243C67FD8(0, (unint64_t *)&qword_2543D29B0);
  v7 = sub_243F85120();
  v8 = a3;
  LOBYTE(a5) = static VisualOutliers.isSimilarToAnyAssetInAssets(for:in:with:)(v8, v7, a5);

  swift_bridgeObjectRelease();
  return a5 & 1;
}

+ (id)outlierScoresForAssets:(id)a3
{
  unint64_t v3;
  void *v4;

  sub_243C67FD8(0, (unint64_t *)&qword_2543D29B0);
  v3 = sub_243F85120();
  static VisualOutliers.outlierScoresForAssets(assets:)(v3);
  swift_bridgeObjectRelease();
  sub_243C67FD8(0, (unint64_t *)&qword_2543DA130);
  v4 = (void *)sub_243F84CC4();
  swift_bridgeObjectRelease();
  return v4;
}

- (PNVisualOutliers)init
{
  return (PNVisualOutliers *)VisualOutliers.init()();
}

@end
