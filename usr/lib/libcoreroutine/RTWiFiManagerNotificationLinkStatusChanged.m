@implementation RTWiFiManagerNotificationLinkStatusChanged

- (RTWiFiManagerNotificationLinkStatusChanged)initWithLinkStatus:(unint64_t)a3 accessPoints:(id)a4
{
  id v6;
  RTWiFiManagerNotificationLinkStatusChanged *v7;
  RTWiFiManagerNotificationLinkStatusChanged *v8;
  uint64_t v9;
  NSArray *accessPoints;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTWiFiManagerNotificationLinkStatusChanged;
  v7 = -[RTNotification init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_linkStatus = a3;
    v9 = objc_msgSend(v6, "copy");
    accessPoints = v8->_accessPoints;
    v8->_accessPoints = (NSArray *)v9;

  }
  return v8;
}

- (unint64_t)linkStatus
{
  return self->_linkStatus;
}

- (NSArray)accessPoints
{
  return self->_accessPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoints, 0);
}

@end
