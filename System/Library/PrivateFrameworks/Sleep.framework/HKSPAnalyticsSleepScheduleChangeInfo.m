@implementation HKSPAnalyticsSleepScheduleChangeInfo

- (HKSPAnalyticsSleepScheduleChangeInfo)initWithApplication:(unint64_t)a3 activePairedWatchProductType:(id)a4 isSleepTrackingEnabled:(BOOL)a5
{
  id v9;
  HKSPAnalyticsSleepScheduleChangeInfo *v10;
  HKSPAnalyticsSleepScheduleChangeInfo *v11;
  HKSPAnalyticsSleepScheduleChangeInfo *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKSPAnalyticsSleepScheduleChangeInfo;
  v10 = -[HKSPAnalyticsSleepScheduleChangeInfo init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_application = a3;
    objc_storeStrong((id *)&v10->_activePairedWatchProductType, a4);
    v11->_isSleepTrackingEnabled = a5;
    v12 = v11;
  }

  return v11;
}

- (id)applicationPayloadValue
{
  unint64_t v2;

  v2 = -[HKSPAnalyticsSleepScheduleChangeInfo application](self, "application");
  if (v2 - 1 > 3)
    return CFSTR("unknown");
  else
    return off_1E4E3ADC8[v2 - 1];
}

- (unint64_t)application
{
  return self->_application;
}

- (NSString)activePairedWatchProductType
{
  return self->_activePairedWatchProductType;
}

- (BOOL)isSleepTrackingEnabled
{
  return self->_isSleepTrackingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePairedWatchProductType, 0);
}

@end
