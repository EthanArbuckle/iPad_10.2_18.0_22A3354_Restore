@implementation CROutstandingWirelessVehicleApprovalAlert

- (id)alertTitle
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRMessagingVehicleAlert messagingVehicle](self, "messagingVehicle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "vehicleName"));

  if (v3)
  {
    v5 = CRLocalizedStringForKey(CFSTR("USE_CARPLAY_ALERT_TITLE_%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3));

  }
  else
  {
    v8 = CRLocalizedStringForKey(CFSTR("USE_CARPLAY_ALERT_TITLE_GENERIC"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (id)alertMessage
{
  return (id)CRLocalizedStringForKey(CFSTR("USE_CARPLAY_ALERT_MESSAGE_WIRELESS_IPHONE"), a2);
}

- (id)alertAcceptButtonTitle
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (-[CROutstandingWirelessVehicleApprovalAlert shouldEnableWiFi](self, "shouldEnableWiFi"))
  {
    v3 = CRLocalizedWiFiVariantKeyForKey(CFSTR("USE_CARPLAY_ALERT_ACCEPT_WIFI_ON"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v6 = CRLocalizedStringForKey(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  }
  else
  {
    v8 = CRLocalizedStringForKey(CFSTR("USE_CARPLAY_ALERT_ACCEPT"), v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  return v7;
}

- (id)alertDeclineButtonTitle
{
  return (id)CRLocalizedStringForKey(CFSTR("USE_CARPLAY_ALERT_CANCEL"), a2);
}

- (BOOL)presentAlertWithCompletion:(id)a3
{
  id v4;
  CRWiFiCarManager *v5;
  uint64_t v6;
  id v7;
  CRWiFiCarManager *v8;
  objc_super v10;
  _QWORD v11[4];
  CRWiFiCarManager *v12;
  id v13;
  char v14;

  v4 = a3;
  v5 = objc_alloc_init(CRWiFiCarManager);
  v6 = -[CRWiFiCarManager isPowered](v5, "isPowered") ^ 1;
  -[CROutstandingWirelessVehicleApprovalAlert setShouldEnableWiFi:](self, "setShouldEnableWiFi:", v6);
  v11[1] = 3221225472;
  v11[2] = sub_100035590;
  v11[3] = &unk_1000B6398;
  v14 = v6;
  v12 = v5;
  v13 = v4;
  v10.receiver = self;
  v10.super_class = (Class)CROutstandingWirelessVehicleApprovalAlert;
  v11[0] = _NSConcreteStackBlock;
  v7 = v4;
  v8 = v5;
  LOBYTE(self) = -[CRMessagingVehicleAlert presentAlertWithCompletion:](&v10, "presentAlertWithCompletion:", v11);

  return (char)self;
}

- (BOOL)shouldEnableWiFi
{
  return self->_shouldEnableWiFi;
}

- (void)setShouldEnableWiFi:(BOOL)a3
{
  self->_shouldEnableWiFi = a3;
}

@end
