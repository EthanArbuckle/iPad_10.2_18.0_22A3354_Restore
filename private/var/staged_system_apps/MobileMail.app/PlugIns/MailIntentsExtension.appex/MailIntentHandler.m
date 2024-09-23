@implementation MailIntentHandler

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000543C;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012358 != -1)
    dispatch_once(&qword_100012358, block);
  return (OS_os_log *)(id)qword_100012350;
}

- (id)handlerForIntent:(id)a3
{
  id v3;
  uint64_t v4;
  __objc2_class **v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  v4 = objc_opt_class(MSSendMailIntent);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = &off_10000C200;
  }
  else
  {
    v6 = objc_opt_class(MSGetMailIntent);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      v5 = off_10000C118;
    }
    else
    {
      v7 = objc_opt_class(MFGetMailboxIntent);
      if ((objc_opt_isKindOfClass(v3, v7) & 1) == 0)
      {
        v8 = 0;
        goto LABEL_8;
      }
      v5 = &off_10000C120;
    }
  }
  v8 = objc_alloc_init(*v5);
LABEL_8:

  return v8;
}

@end
