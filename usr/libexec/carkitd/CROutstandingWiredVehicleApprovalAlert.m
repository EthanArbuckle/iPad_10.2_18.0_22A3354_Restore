@implementation CROutstandingWiredVehicleApprovalAlert

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
    v5 = CRLocalizedStringForKey(CFSTR("REMEMBER_CARPLAY_ALERT_TITLE_%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3));

  }
  else
  {
    v8 = CRLocalizedStringForKey(CFSTR("REMEMBER_CARPLAY_ALERT_TITLE_GENERIC"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (id)alertMessage
{
  return (id)CRLocalizedStringForKey(CFSTR("REMEMBER_CARPLAY_ALERT_MESSAGE_IPHONE"), a2);
}

- (id)alertAcceptButtonTitle
{
  return (id)CRLocalizedStringForKey(CFSTR("REMEMBER_CARPLAY_ALERT_ACCEPT"), a2);
}

- (id)alertDeclineButtonTitle
{
  return (id)CRLocalizedStringForKey(CFSTR("REMEMBER_CARPLAY_ALERT_CANCEL"), a2);
}

@end
