@implementation ANCMissedCallAlert

- (ANCMissedCallAlert)initWithRecentCall:(id)a3 manager:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  ANCMissedCallAlert *v12;
  ANCMissedCallAlert *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ANCMissedCallAlert;
  v12 = -[ANCAlert initWithCategoryID:](&v15, "initWithCategoryID:", 2);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recentCall, a3);
    objc_storeStrong((id *)&v13->_manager, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (id)appIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init((Class)TUCallProviderManager);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert recentCall](self, "recentCall"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerForRecentCall:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCAlert _appIdentifierForTUCallProvider:](self, "_appIdentifierForTUCallProvider:", v5));
  return v6;
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert recentCall](self, "recentCall"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "callerNameForDisplay"));

  return v3;
}

- (id)subtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert recentCall](self, "recentCall"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "callerIdLabel"));

  return v3;
}

- (id)message
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MISSED_CALL"), CFSTR("Missed Call"), 0));

  return v3;
}

- (id)date
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert recentCall](self, "recentCall"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "date"));

  return v3;
}

- (BOOL)hasPositiveAction
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert recentCall](self, "recentCall"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "callerId"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasNegativeAction
{
  return 1;
}

- (id)positiveActionLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DIAL"), CFSTR("Dial"), 0));

  return v3;
}

- (id)negativeActionLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CLEAR"), CFSTR("Clear"), 0));

  return v3;
}

- (BOOL)performPositiveAction
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert recentCall](self, "recentCall"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callerId"));

  if (!v4)
    return 0;
  v5 = objc_alloc_init((Class)TUCallProviderManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert recentCall](self, "recentCall"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "providerForRecentCall:", v6));

  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithProvider:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert recentCall](self, "recentCall"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "callerId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v10));
    objc_msgSend(v8, "setHandle:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert queue](self, "queue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter callCenterWithQueue:](TUCallCenter, "callCenterWithQueue:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dialWithRequest:", v8));
    v15 = v14 != 0;

  }
  else
  {
    v16 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_FAULT))
      sub_100071F18(v16, self);
    v15 = 0;
  }

  return v15;
}

- (BOOL)performNegativeAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert recentCall](self, "recentCall"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uniqueId == %@"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCMissedCallAlert manager](self, "manager"));
  objc_msgSend(v6, "markAllCallsAsReadWithPredicate:", v5);

  return 1;
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (void)setRecentCall:(id)a3
{
  objc_storeStrong((id *)&self->_recentCall, a3);
}

- (CHManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
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
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_recentCall, 0);
}

@end
