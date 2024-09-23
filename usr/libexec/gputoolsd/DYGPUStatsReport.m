@implementation DYGPUStatsReport

- (DYGPUStatsReport)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYGPUStatsReport;
  return -[DYGPUStatsReport init](&v3, "init");
}

- (void)dealloc
{
  __IOReportSubscriptionCF *powerSubscription;
  objc_super v4;

  -[DYGPUStatsReport stopCollectingStats](self, "stopCollectingStats");
  powerSubscription = self->_powerSubscription;
  if (powerSubscription)
  {
    CFRelease(powerSubscription);
    self->_powerSubscription = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DYGPUStatsReport;
  -[DYGPUStatsReport dealloc](&v4, "dealloc");
}

- (void)setup
{
  NSMutableDictionary *v3;
  NSMutableDictionary *powerAllChannels;
  __IOReportSubscriptionCF *v5;
  NSMutableDictionary *powerSubbedChannels;
  NSMutableDictionary *v7;
  _QWORD v8[6];

  v3 = (NSMutableDictionary *)IOReportCopyChannelsInCategories(2, 0, 0);
  powerAllChannels = self->_powerAllChannels;
  self->_powerAllChannels = v3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006214;
  v8[3] = &unk_10000C7C8;
  v8[4] = CFSTR("GPU Stats");
  v8[5] = CFSTR("GPU Performance States");
  if ((IOReportPrune(v3, v8) & 1) == 0)
  {
    v7 = 0;
    v5 = (__IOReportSubscriptionCF *)IOReportCreateSubscription(0, v3, &v7, 0, 0);
    powerSubbedChannels = self->_powerSubbedChannels;
    self->_powerSubbedChannels = v7;
    self->_powerSubscription = v5;

  }
}

- (void)startCollectingStats
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *timer;
  _QWORD v9[5];

  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("reporting_queue", v4);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006318;
  v9[3] = &unk_10000C698;
  v9[4] = self;
  v6 = sub_100005FF4(1, v5, v9);
  v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v6);
  timer = self->_timer;
  self->_timer = v7;

}

- (void)stopCollectingStats
{
  OS_dispatch_source *timer;
  OS_dispatch_source *v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel((dispatch_source_t)timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (NSDictionary)lastStatsReport
{
  return (NSDictionary *)self->_lastStatsReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_lastStatsReport, 0);
  objc_storeStrong((id *)&self->_lastPowerSamples, 0);
  objc_storeStrong((id *)&self->_powerSubbedChannels, 0);
  objc_storeStrong((id *)&self->_powerAllChannels, 0);
}

@end
