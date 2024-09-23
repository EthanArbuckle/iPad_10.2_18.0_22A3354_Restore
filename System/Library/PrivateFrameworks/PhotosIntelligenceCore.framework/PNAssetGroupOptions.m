@implementation PNAssetGroupOptions

- (BOOL)groupByDifferentOrientation
{
  char v2;

  PNAssetGroupOptions.groupByDifferentOrientation.getter();
  return v2 & 1;
}

- (void)setGroupByDifferentOrientation:(BOOL)a3
{
  PNAssetGroupOptions.groupByDifferentOrientation.setter(a3);
}

- (BOOL)groupBySharedLibraryParticipationState
{
  char v2;

  PNAssetGroupOptions.groupBySharedLibraryParticipationState.getter();
  return v2 & 1;
}

- (void)setGroupBySharedLibraryParticipationState:(BOOL)a3
{
  PNAssetGroupOptions.groupBySharedLibraryParticipationState.setter(a3);
}

- (double)comparableCurationScoreThreshold
{
  return PNAssetGroupOptions.comparableCurationScoreThreshold.getter();
}

- (void)setComparableCurationScoreThreshold:(double)a3
{
  PNAssetGroupOptions.comparableCurationScoreThreshold.setter(a3);
}

- (int)distanceThreshold
{
  int result;

  PNAssetGroupOptions.distanceThreshold.getter();
  return result;
}

- (void)setDistanceThreshold:(int)a3
{
  PNAssetGroupOptions.distanceThreshold.setter(a3);
}

- (int)distanceFromFirstThreshold
{
  int result;

  PNAssetGroupOptions.distanceFromFirstThreshold.getter();
  return result;
}

- (void)setDistanceFromFirstThreshold:(int)a3
{
  PNAssetGroupOptions.distanceFromFirstThreshold.setter(a3);
}

- (int)distanceIfAdjustedDiffersThreshold
{
  int result;

  PNAssetGroupOptions.distanceIfAdjustedDiffersThreshold.getter();
  return result;
}

- (void)setDistanceIfAdjustedDiffersThreshold:(int)a3
{
  PNAssetGroupOptions.distanceIfAdjustedDiffersThreshold.setter(a3);
}

- (PNAssetGroupOptions)init
{
  return (PNAssetGroupOptions *)PNAssetGroupOptions.init()();
}

@end
