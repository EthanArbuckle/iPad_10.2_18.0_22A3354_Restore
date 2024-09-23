@implementation TrustAnalytics

+ (id)logger
{
  id v3;
  void *v4;
  objc_super v6;

  if (sub_100015138())
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___TrustAnalytics;
    v3 = objc_msgSendSuper2(&v6, "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)databasePath
{
  return +[SFAnalytics defaultAnalyticsDatabasePath:](SFAnalytics, "defaultAnalyticsDatabasePath:", CFSTR("trust_analytics"));
}

- (void)logHardError:(id)a3 withEventName:(id)a4 withAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  TrustAnalytics *v16;

  v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100051700;
  v12[3] = &unk_100079468;
  v13 = a4;
  v14 = v8;
  v15 = a5;
  v16 = self;
  v9 = v15;
  v10 = v8;
  v11 = v13;
  sub_100017240(v12);

}

@end
