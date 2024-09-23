@implementation WiFiCloudAssetsClient

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034144;
  block[3] = &unk_10022EA38;
  block[4] = a1;
  if (qword_10026D548 != -1)
    dispatch_once(&qword_10026D548, block);
  return (id)qword_10026D540;
}

- (void)runAssetQuery
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000341C4;
  v2[3] = &unk_10022EA88;
  v2[4] = self;
  +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:](WCAFetchWiFiBehaviorParameters, "fetchWiFiBehaviorWithCompletion:", v2);
}

- (void)initializeWithManager:(__WiFiManager *)a3 queue:(id)a4
{
  id v6;

  v6 = a4;
  -[WiFiCloudAssetsClient setWifiManager:](self, "setWifiManager:", a3);
  -[WiFiCloudAssetsClient setQueue:](self, "setQueue:", v6);

}

- (BOOL)isWiFiHealthMonitorDisabled
{
  return self->_isWiFiHealthMonitorDisabled;
}

- (void)setIsWiFiHealthMonitorDisabled:(BOOL)a3
{
  self->_isWiFiHealthMonitorDisabled = a3;
}

- (__WiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManager *)a3
{
  self->_wifiManager = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
