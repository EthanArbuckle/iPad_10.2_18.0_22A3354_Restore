@implementation BCUserAgent

+ (id)clientUserAgentWithOverrideVersion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));

  }
  v7 = objc_alloc((Class)AMSUserAgent);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess"));
  v9 = objc_msgSend(v7, "initWithProcessInfo:", v8);

  objc_msgSend(v9, "setClientName:", CFSTR("iBooks"));
  objc_msgSend(v9, "setClientVersion:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "compile"));

  return v10;
}

+ (void)_getSystemVersionMajor:(int *)a3 minor:(int *)a4 bugfix:(int *)a5
{
  if (qword_3112A8 == -1)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_3112A8, &stru_2918C8);
  if (a3)
LABEL_3:
    *a3 = dword_30A138;
LABEL_4:
  if (a4)
    *a4 = dword_30A13C;
  if (a5)
    *a5 = dword_3112A0;
}

+ (id)_macOSXVersionString
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_118A3C;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_3112B8 != -1)
    dispatch_once(&qword_3112B8, block);
  return (id)qword_3112B0;
}

+ (id)_userVisibleWebKitVersionString
{
  if (qword_3112C8 != -1)
    dispatch_once(&qword_3112C8, &stru_2918E8);
  return (id)qword_3112C0;
}

+ (id)_macOSXBuildString
{
  if (qword_3112D8 != -1)
    dispatch_once(&qword_3112D8, &stru_291908);
  return (id)qword_3112D0;
}

+ (id)audibleUserAgent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));

  v5 = objc_msgSend((id)objc_opt_class(a1), "_macOSXVersionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend((id)objc_opt_class(a1), "_userVisibleWebKitVersionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend((id)objc_opt_class(a1), "_macOSXBuildString");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Books/%@ (Macintosh; OS X %@; %@) AppleWebKit/%@"),
                    v4,
                    v6,
                    v10,
                    v8));

  return v11;
}

@end
