@implementation WFAutomationNotificationContentViewController

- (void)loadView
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  -[WFAutomationNotificationContentViewController setView:](self, "setView:", v3);

}

- (void)didReceiveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIView *contentView;
  void *v26;
  unsigned int v27;
  void *v28;
  id v29;
  NSMutableArray *v30;
  void *v31;
  NSMutableArray *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  UIView *v36;
  void *v37;
  void *v38;
  UIView *v39;
  uint64_t WFTriggerNotificationsLogObject;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  NSMutableArray *v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "categoryIdentifier"));
  v8 = objc_msgSend(v7, "isEqualToString:", WFNotificationTriggerPromptCategory);

  if (v8)
  {
    v9 = (UIView *)objc_alloc_init((Class)WFAutomationNotificationContentView);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFAutomationNotificationContentViewController view](self, "view"));
    objc_msgSend(v10, "bounds");
    -[UIView setFrame:](v9, "setFrame:");

    -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFAutomationNotificationContentViewController view](self, "view"));
    objc_msgSend(v11, "addSubview:", v9);

    -[UIView updateUIFromNotification:](v9, "updateUIFromNotification:", v4);
LABEL_5:
    contentView = self->_contentView;
    self->_contentView = v9;

    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "categoryIdentifier"));
  v15 = objc_msgSend(v14, "isEqualToString:", WFNotificationTriggerNotifyBackgroundCategory);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "content"));
  v18 = v17;
  if (v15)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
    -[WFAutomationNotificationContentViewController estimatedSizeForNotificationUserInfo:](self, "estimatedSizeForNotificationUserInfo:", v19);
    -[WFAutomationNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    v9 = (UIView *)objc_alloc_init((Class)WFAutomationNotificationListContentView);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WFAutomationNotificationContentViewController view](self, "view"));
    objc_msgSend(v20, "bounds");
    -[UIView setFrame:](v9, "setFrame:");

    -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[WFAutomationNotificationContentViewController view](self, "view"));
    objc_msgSend(v21, "addSubview:", v9);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "content"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userInfo"));
    -[UIView updateUIFromNotificationUserInfo:](v9, "updateUIFromNotificationUserInfo:", v24);

    -[UIView preferredSize](v9, "preferredSize");
    -[WFAutomationNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    goto LABEL_5;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "categoryIdentifier"));
  v27 = objc_msgSend(v26, "isEqualToString:", WFNotificationAutomationsEnabledCategory);

  if (v27)
  {
    +[WFInitialization initializeProcessWithDatabase:](WFInitialization, "initializeProcessWithDatabase:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase"));
    v29 = objc_msgSend(objc_alloc((Class)WFTriggerManager), "initWithDatabase:", v28);
    v30 = objc_opt_new(NSMutableArray);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allConfiguredTriggers"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000033B8;
    v45[3] = &unk_100004148;
    v46 = v30;
    v32 = v30;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v45);

    v33 = (void *)os_transaction_create("com.apple.shortcuts.automation-notification");
    v34 = WFTriggerIDsToDisableNotificationUserInfoFromTriggers(v32, v28);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[WFAutomationNotificationContentViewController estimatedSizeForNotificationUserInfo:](self, "estimatedSizeForNotificationUserInfo:", v35);
    -[WFAutomationNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    v36 = (UIView *)objc_alloc_init((Class)WFAutomationNotificationListContentView);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[WFAutomationNotificationContentViewController view](self, "view"));
    objc_msgSend(v37, "bounds");
    -[UIView setFrame:](v36, "setFrame:");

    -[UIView setAutoresizingMask:](v36, "setAutoresizingMask:", 18);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[WFAutomationNotificationContentViewController view](self, "view"));
    objc_msgSend(v38, "addSubview:", v36);

    -[UIView updateUIFromNotificationUserInfo:](v36, "updateUIFromNotificationUserInfo:", v35);
    -[UIView preferredSize](v36, "preferredSize");
    -[WFAutomationNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    v39 = self->_contentView;
    self->_contentView = v36;

  }
  else
  {
    WFTriggerNotificationsLogObject = getWFTriggerNotificationsLogObject();
    v41 = objc_claimAutoreleasedReturnValue(WFTriggerNotificationsLogObject);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "content"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "categoryIdentifier"));
      *(_DWORD *)buf = 136315394;
      v48 = "-[WFAutomationNotificationContentViewController didReceiveNotification:]";
      v49 = 2112;
      v50 = v44;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "%s Notification content did not match any known category identifier: %@", buf, 0x16u);

    }
  }
LABEL_6:

}

- (CGSize)estimatedSizeForNotificationUserInfo:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFAutomationNotificationContentViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v8 = WFTriggerIDsToDisableFromNotificationUserInfo(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (double)(unint64_t)(110 * (_QWORD)objc_msgSend(v9, "count"));
  v11 = v7;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
