@implementation NotificationHandlingTask

+ (id)taskForData:(id)a3 type:(id)a4 recordIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  __objc2_class *v10;
  id v11;
  id v12;
  NSObject *v13;
  int v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
    goto LABEL_14;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("MapsPushNotifcationTypePushToPhone")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("MapsPushNotifcationTypeProblemResolved")))
    {
      v10 = _RAPHandlingTask;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("MapsPushNotificationTypeAnnouncement")))
    {
      v10 = _AnnounceHandlingTask;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("MapsPushNotificationTypeSharedTrip")))
    {
      v10 = _SharedTripHandlingTask;
      goto LABEL_10;
    }
    v12 = sub_100431A4C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Notification type unknown %@", (uint8_t *)&v15, 0xCu);
    }

LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  v10 = _PushToPhoneHandlingTask;
LABEL_10:
  v11 = objc_msgSend([v10 alloc], "initWithData:recordIdentifier:", v7, v9);
LABEL_15:

  return v11;
}

- (NotificationHandlingTask)initWithData:(id)a3 recordIdentifier:(id)a4
{
  id v6;
  NotificationHandlingTask *v7;
  NotificationHandlingTask *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NotificationHandlingTask;
  v7 = -[NotificationHandlingTask init](&v10, "init");
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_recordIdentifier, a4);

  return v8;
}

- (void)_clearBulletin
{
  id v3;

  if (self->_recordIdentifier)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
    objc_msgSend(v3, "clearBulletinWithRecordID:", self->_recordIdentifier);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
}

@end
