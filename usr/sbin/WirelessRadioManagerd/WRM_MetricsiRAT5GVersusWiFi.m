@implementation WRM_MetricsiRAT5GVersusWiFi

- (WRM_MetricsiRAT5GVersusWiFi)init
{
  WRM_MetricsiRAT5GVersusWiFi *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_MetricsiRAT5GVersusWiFi;
  result = -[WRM_MetricsiRAT5GVersusWiFi init](&v3, "init");
  if (result)
  {
    *(_QWORD *)&result->m5GVersusWiFiMetrics.total_nr_bandwidth = 0;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.radioFrequency = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.wifiRecommendationConfidence = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.highThermalTemperatureNotification = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.wifiWifiEstThoughtputConfidence = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.wifiWghtAVGRXPHYRATE = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.wifiRxRetry = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.wifiCca = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.cellRrcState = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.cellNrSNR = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.cellNrEstimatedThroughput = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.cellLteRSRQ = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.cellEstimatedBw = 0u;
    *(_OWORD *)&result->m5GVersusWiFiMetrics.timestamp = 0u;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_MetricsiRAT5GVersusWiFi;
  -[WRM_MetricsiRAT5GVersusWiFi dealloc](&v2, "dealloc");
}

@end
