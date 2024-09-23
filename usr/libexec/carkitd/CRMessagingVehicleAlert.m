@implementation CRMessagingVehicleAlert

- (CRMessagingVehicleAlert)initWithMessagingVehicle:(id)a3
{
  id v5;
  CRMessagingVehicleAlert *v6;
  CRMessagingVehicleAlert *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRMessagingVehicleAlert;
  v6 = -[CRMessagingVehicleAlert init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messagingVehicle, a3);

  return v7;
}

- (id)lockscreenMessage
{
  return (id)CRLocalizedStringForKey(CFSTR("CARPLAY_LOCKSCREEN_MESSAGE_IPHONE"), a2);
}

- (BOOL)presentAlertWithCompletion:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRMessagingVehicleAlert messagingVehicle](self, "messagingVehicle"));

  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)CRMessagingVehicleAlert;
    v6 = -[CRAlert presentAlertWithCompletion:](&v8, "presentAlertWithCompletion:", v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CRMessagingServiceVehicleRepresenting)messagingVehicle
{
  return self->_messagingVehicle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingVehicle, 0);
}

@end
