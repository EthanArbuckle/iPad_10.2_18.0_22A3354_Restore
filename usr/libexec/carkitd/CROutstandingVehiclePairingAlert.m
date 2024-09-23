@implementation CROutstandingVehiclePairingAlert

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
    v5 = CRLocalizedStringForKey(CFSTR("PAIRING_CARPLAY_ALERT_TITLE_%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3));

  }
  else
  {
    v8 = CRLocalizedStringForKey(CFSTR("PAIRING_CARPLAY_ALERT_TITLE_GENERIC"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (id)alertMessage
{
  uint64_t v2;
  const __CFString *v3;

  if (-[CROutstandingVehiclePairingAlert shouldEnableBluetooth](self, "shouldEnableBluetooth"))
    v3 = CFSTR("PAIRING_CARPLAY_ALERT_MESSAGE_IPHONE_BT_ON");
  else
    v3 = CFSTR("PAIRING_CARPLAY_ALERT_MESSAGE_IPHONE");
  return (id)CRLocalizedStringForKey(v3, v2);
}

- (id)alertAcceptButtonTitle
{
  return (id)CRLocalizedStringForKey(CFSTR("PAIRING_CARPLAY_ALERT_ACCEPT"), a2);
}

- (id)alertDeclineButtonTitle
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = -[CROutstandingVehiclePairingAlert declineType](self, "declineType");
  if (v2 > 2)
  {
    v5 = 0;
  }
  else
  {
    v4 = CRLocalizedStringForKey(off_1000B63E0[v2], v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  return v5;
}

- (BOOL)shouldEnableBluetooth
{
  return self->_shouldEnableBluetooth;
}

- (void)setShouldEnableBluetooth:(BOOL)a3
{
  self->_shouldEnableBluetooth = a3;
}

- (unint64_t)declineType
{
  return self->_declineType;
}

- (void)setDeclineType:(unint64_t)a3
{
  self->_declineType = a3;
}

@end
