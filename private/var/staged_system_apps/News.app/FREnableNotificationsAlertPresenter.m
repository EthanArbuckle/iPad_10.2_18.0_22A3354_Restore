@implementation FREnableNotificationsAlertPresenter

- (void)presentEnableNotificationsAlertWithEnableNotificationsContext:(int64_t)a3 channelID:(id)a4 channelName:(id)a5 window:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007FB90();
    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007FAC8();
LABEL_6:
  if (!-[FREnableNotificationsAlertPresenter isPresenting](self, "isPresenting"))
  {
    -[FREnableNotificationsAlertPresenter setPresenting:](self, "setPresenting:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rootViewController"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100055560;
    v17[3] = &unk_1000DCE70;
    v17[4] = self;
    v18 = v15;
    FRShowEnableNotificationsAlert(v16, a3, v12, v13, v17);

  }
}

- (UIWindow)window
{
  return self->_window;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
