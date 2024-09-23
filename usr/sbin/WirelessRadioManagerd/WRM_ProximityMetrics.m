@implementation WRM_ProximityMetrics

- (WRM_ProximityMetrics)init
{
  WRM_ProximityMetrics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_ProximityMetrics;
  result = -[WRM_ProximityMetrics init](&v3, "init");
  if (result)
  {
    *(_OWORD *)&result->mProximity.btRssi = 0u;
    *(_OWORD *)&result->mProximity.newLinkState = 0u;
    *(_OWORD *)&result->mProximity.ccAssertion = 0u;
    *(_OWORD *)&result->mProximity.timestamp = 0u;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_ProximityMetrics;
  -[WRM_ProximityMetrics dealloc](&v2, "dealloc");
}

@end
