@implementation REClockFaceMetricsSubmitter

- (BOOL)_runningInClockFace
{
  if (-[REClockFaceMetricsSubmitter _runningInClockFace]::onceToken != -1)
    dispatch_once(&-[REClockFaceMetricsSubmitter _runningInClockFace]::onceToken, &__block_literal_global_19_0);
  return -[REClockFaceMetricsSubmitter _runningInClockFace]::MetricsEnabled;
}

void __50__REClockFaceMetricsSubmitter__runningInClockFace__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  -[REClockFaceMetricsSubmitter _runningInClockFace]::MetricsEnabled = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.clockface"));

}

- (BOOL)_runningInTest
{
  Class v2;
  Class v3;

  v2 = NSClassFromString((NSString *)CFSTR("UIApplication"));
  if (v2 && (v3 = v2, (objc_opt_respondsToSelector() & 1) != 0))
    return -[objc_class isRunningTest](v3, "isRunningTest");
  else
    return 0;
}

- (BOOL)_shouldRecordMetrics
{
  _BOOL4 v3;

  v3 = -[REClockFaceMetricsSubmitter _runningInClockFace](self, "_runningInClockFace");
  if (v3)
    LOBYTE(v3) = !-[REClockFaceMetricsSubmitter _runningInTest](self, "_runningInTest");
  return v3;
}

- (void)recordTrainingMetrics:(id)a3 forInteraction:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[REClockFaceMetricsSubmitter _shouldRecordMetrics](self, "_shouldRecordMetrics")
    && objc_msgSend(v6, "isEqualToString:", CFSTR("tap")))
  {
    AnalyticsSendEvent();
  }

}

- (void)recordCallibrationCurveMetrics:(id)a3 forInteraction:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[REClockFaceMetricsSubmitter _shouldRecordMetrics](self, "_shouldRecordMetrics")
    && objc_msgSend(v6, "isEqualToString:", CFSTR("tap")))
  {
    AnalyticsSendEvent();
  }

}

@end
