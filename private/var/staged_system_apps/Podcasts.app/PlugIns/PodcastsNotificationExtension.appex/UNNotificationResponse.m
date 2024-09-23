@implementation UNNotificationResponse

- (int64_t)mt_actionType
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D534;
  v8[3] = &unk_100028F10;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[UNNotificationResponse actionIdentifier](self, "actionIdentifier"));
  v2 = v9;
  v3 = sub_10000D20C(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 0;

  return (int64_t)v6;
}

@end
