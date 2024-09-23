@implementation CRReconnectionEnableWiFiAlert

- (CRReconnectionEnableWiFiAlert)initWithVehicle:(id)a3
{
  id v4;
  CRReconnectionEnableWiFiAlert *v5;
  CRReconnectionEnableWiFiAlert *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRReconnectionEnableWiFiAlert;
  v5 = -[CRReconnectionEnableWiFiAlert init](&v8, "init");
  v6 = v5;
  if (v5)
    -[CRReconnectionEnableWiFiAlert setVehicle:](v5, "setVehicle:", v4);

  return v6;
}

- (id)lockscreenMessage
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = CRLocalizedWiFiVariantKeyForKey(CFSTR("RECONNECT_OFF_ALERT_TITLE_WIFI"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = CRLocalizedStringForKey(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)alertTitle
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = CRLocalizedWiFiVariantKeyForKey(CFSTR("RECONNECT_OFF_ALERT_TITLE_WIFI"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = CRLocalizedStringForKey(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)alertMessage
{
  return 0;
}

- (id)alertAcceptButtonTitle
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = CRLocalizedWiFiVariantKeyForKey(CFSTR("RECONNECT_OFF_ALERT_ACCEPT_WIFI"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = CRLocalizedStringForKey(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)alertDeclineButtonTitle
{
  return (id)CRLocalizedStringForKey(CFSTR("RECONNECT_OFF_ALERT_CANCEL"), a2);
}

- (BOOL)presentAlertWithCompletion:(id)a3
{
  id v4;
  objc_super v6;
  _QWORD v7[4];
  id v8;

  v7[1] = 3221225472;
  v7[2] = sub_100035924;
  v7[3] = &unk_1000B63C0;
  v8 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRReconnectionEnableWiFiAlert;
  v7[0] = _NSConcreteStackBlock;
  v4 = v8;
  LOBYTE(self) = -[CRAlert presentAlertWithCompletion:](&v6, "presentAlertWithCompletion:", v7);

  return (char)self;
}

- (CRVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(id)a3
{
  objc_storeStrong((id *)&self->_vehicle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
