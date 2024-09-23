@implementation FRNotificationAutoEnableHelper

- (FRNotificationAutoEnableHelper)initWithFeldsparContext:(id)a3
{
  id v5;
  FRNotificationAutoEnableHelper *v6;
  FRNotificationAutoEnableHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FRNotificationAutoEnableHelper;
  v6 = -[FRNotificationAutoEnableHelper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_feldsparContext, a3);

  return v7;
}

- (void)autoEnableNotificationsForPreSubscribedChannels
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002F49C;
  v2[3] = &unk_1000DA4B0;
  v2[4] = self;
  -[FRNotificationAutoEnableHelper _fetchPreSubscribedChannelsWithCompletion:](self, "_fetchPreSubscribedChannelsWithCompletion:", v2);
}

- (void)_fetchPreSubscribedChannelsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationAutoEnableHelper feldsparContext](self, "feldsparContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloudContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkReachability"));

  if ((objc_msgSend(v7, "isCloudKitReachable") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationAutoEnableHelper feldsparContext](self, "feldsparContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appConfigurationManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002F73C;
    v12[3] = &unk_1000DA500;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v10, "fetchAppConfigurationIfNeededWithCompletion:", v12);

  }
  else
  {
    v11 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
      sub_10007AB58(v11);
  }

}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (void)setFeldsparContext:(id)a3
{
  objc_storeStrong((id *)&self->_feldsparContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end
