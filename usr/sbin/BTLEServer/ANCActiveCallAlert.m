@implementation ANCActiveCallAlert

- (ANCActiveCallAlert)initWithCall:(id)a3 callCenter:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ANCActiveCallAlert;
  return -[ANCCallAlert initWithCall:callCenter:categoryID:](&v5, "initWithCall:callCenter:categoryID:", a3, a4, 12);
}

- (id)message
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ACTIVE_CALL"), CFSTR("Active Call"), 0));

  return v3;
}

- (BOOL)hasPositiveAction
{
  return 0;
}

- (BOOL)hasNegativeAction
{
  return 1;
}

- (id)negativeActionLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("END_CALL"), CFSTR("End Call"), 0));

  return v3;
}

- (BOOL)performPositiveAction
{
  return 0;
}

- (BOOL)performNegativeAction
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCCallAlert callCenter](self, "callCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ANCCallAlert call](self, "call"));
  objc_msgSend(v3, "disconnectCall:", v4);

  return 1;
}

@end
