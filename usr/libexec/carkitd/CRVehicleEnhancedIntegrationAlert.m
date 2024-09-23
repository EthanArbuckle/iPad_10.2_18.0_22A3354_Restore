@implementation CRVehicleEnhancedIntegrationAlert

- (id)lockscreenMessage
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = CRLocalizedStringForKey(CFSTR("ENHANCED_INTEGRATION_ALERT_TITLE_%@"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRMessagingVehicleAlert messagingVehicle](self, "messagingVehicle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6));

  return v7;
}

- (id)alertTitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = CRLocalizedStringForKey(CFSTR("ENHANCED_INTEGRATION_ALERT_TITLE_%@"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRMessagingVehicleAlert messagingVehicle](self, "messagingVehicle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6));

  return v7;
}

- (id)alertMessage
{
  return (id)CRLocalizedStringForKey(CFSTR("ENHANCED_INTEGRATION_ALERT_MESSAGE"), a2);
}

- (id)alertAcceptButtonTitle
{
  return (id)CRLocalizedStringForKey(CFSTR("ENHANCED_INTEGRATION_ALERT_ACCEPT"), a2);
}

- (id)alertDeclineButtonTitle
{
  return (id)CRLocalizedStringForKey(CFSTR("ENHANCED_INTEGRATION_ALERT_CANCEL"), a2);
}

@end
