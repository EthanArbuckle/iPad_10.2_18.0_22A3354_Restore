@implementation WRM_LTECoexMetrics

- (WRM_LTECoexMetrics)init
{
  WRM_LTECoexMetrics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_LTECoexMetrics;
  result = -[WRM_LTECoexMetrics init](&v3, "init");
  if (result)
  {
    *(_DWORD *)&result->mAntSelPolicyStats.IsCoexBand = 0;
    *(_QWORD *)&result->mAntSelPolicyStats.IssueBand = 0;
    *(_OWORD *)&result->mULCACoexStats.ULCAHasCoexBand = 0u;
    *(_OWORD *)&result->mULCACoexStats.ULCAPrimaryCarrierDLBW = 0u;
    result->mULCACoexStats.ULCACriticalCarrierDLBW = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_LTECoexMetrics;
  -[WRM_LTECoexMetrics dealloc](&v2, "dealloc");
}

@end
