@implementation UNNotificationContent(UserNotificationsCore)

- (uint64_t)unc_willNotifyUser
{
  _BOOL8 v2;
  void *v3;
  void *v4;

  if ((objc_msgSend(a1, "unc_willAlertUser") & 1) != 0)
    return 1;
  objc_msgSend(a1, "badge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(a1, "sound");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4 != 0;

  }
  return v2;
}

- (BOOL)unc_willAlertUser
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "body");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "subtitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(a1, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "length") != 0;

    }
  }

  return v3;
}

@end
