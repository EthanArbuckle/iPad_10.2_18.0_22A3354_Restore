@implementation WRM_MetricsiRATDataRecommendation

- (WRM_MetricsiRATDataRecommendation)init
{
  WRM_MetricsiRATDataRecommendation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_MetricsiRATDataRecommendation;
  result = -[WRM_MetricsiRATDataRecommendation init](&v3, "init");
  if (result)
  {
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.packetLifetimeVIBE = 0u;
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.decisionVO = 0u;
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.wifiTxPhyRate = 0u;
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.wifiEstimatedBandwitdh = 0u;
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.bcnPer = 0u;
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.wifiRssi = 0u;
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.ratType = 0u;
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.dataAppStatus = 0u;
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.motionState = 0u;
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.voiceLinkPref = 0u;
    *(_OWORD *)&result->mDataLinkPreferenceMetrics.timestamp = 0u;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_MetricsiRATDataRecommendation;
  -[WRM_MetricsiRATDataRecommendation dealloc](&v2, "dealloc");
}

@end
