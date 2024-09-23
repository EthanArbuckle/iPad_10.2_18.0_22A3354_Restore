@implementation CHMoveModeNotificationResponseCoordinator

+ (BOOL)shouldHandleNotificationCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FCNotificationRequestConstants moveModeNotificationCategory](FCNotificationRequestConstants, "moveModeNotificationCategory"));
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FCNotificationRequestConstants moveModeChangeModeNotificationCategory](FCNotificationRequestConstants, "moveModeChangeModeNotificationCategory"));
    if ((objc_msgSend(v3, "isEqualToString:", v6) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[FCNotificationRequestConstants moveModeChangeGoalsNotificationCategory](FCNotificationRequestConstants, "moveModeChangeGoalsNotificationCategory"));
      v5 = objc_msgSend(v3, "isEqualToString:", v7);

    }
  }

  return v5;
}

+ (void)handleNotificationResponse:(id)a3 presentingNavigationController:(id)a4 healthStore:(id)a5 formattingManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D4178;
  v15[3] = &unk_100779C68;
  v16 = v9;
  v17 = a5;
  v18 = a6;
  v19 = v10;
  v11 = v10;
  v12 = v18;
  v13 = v17;
  v14 = v9;
  objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 0, v15);

}

@end
