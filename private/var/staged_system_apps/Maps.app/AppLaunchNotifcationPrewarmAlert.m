@implementation AppLaunchNotifcationPrewarmAlert

- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3
{
  id v4;
  id completionBlock;
  void *v6;
  _QWORD v7[5];

  v4 = objc_msgSend(a3, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v4;

  if (!qword_1014D2550)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10043A64C;
    v7[3] = &unk_1011B4AF0;
    v7[4] = self;
    objc_msgSend(v6, "getNotificationSettingsWithCompletionHandler:", v7);

  }
}

- (void)_presentAlertUIWithStatus:(int64_t)a3 repeatPrompt:(BOOL)a4
{
  PushNotificationPrompt *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10043A960;
  v8[3] = &unk_1011AC860;
  v8[4] = self;
  v4 = -[PushNotificationPrompt initWithReason:authorizationStatus:completion:]([PushNotificationPrompt alloc], "initWithReason:authorizationStatus:completion:", a4, a3, v8);
  v5 = (void *)qword_1014D2550;
  qword_1014D2550 = (uint64_t)v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
  objc_msgSend(v7, "_maps_topMostPresentViewController:animated:completion:", qword_1014D2550, 1, 0);

}

- (void)_alertDidFinishProcessing
{
  id completionBlock;
  id v4;
  void (**v5)(void);

  completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    v5 = (void (**)(void))objc_retainBlock(completionBlock);
    v4 = self->_completionBlock;
    self->_completionBlock = 0;

    v5[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
