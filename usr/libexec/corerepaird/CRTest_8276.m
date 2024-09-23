@implementation CRTest_8276

- (CRTest_8276)init
{
  CRTest_8276 *v2;
  CRTest_8276 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_8276;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("8276"));
    -[CRTest setTestId:](v3, "setTestId:", &off_1000585B8);
    if (os_variant_has_internal_content("com.apple.corerepaird"))
    {
      v4 = objc_msgSend(objc_alloc((Class)CRUserDefaults), "initWithSuiteName:", CFSTR("com.apple.corerepaird.test"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest name](v3, "name"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryForKey:", v5));
      -[CRTest setOverrides:](v3, "setOverrides:", v6);

    }
  }
  return v3;
}

- (BOOL)shouldRun:(id)a3
{
  id v4;
  void *v5;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRTest_8276;
  if (!-[CRTest shouldRun:](&v10, "shouldRun:", v4))
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));

  if (v5)
  {
    if (-[CRTest supportPeCoNet](self, "supportPeCoNet"))
    {
LABEL_4:
      LOBYTE(v5) = 0;
      goto LABEL_5;
    }
    if (-[CRTest supportLiDAR](self, "supportLiDAR"))
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
      LOBYTE(v5) = -[NSObject containsObject:](v7, "containsObject:", CFSTR("IPHONE COMP CAMERA"));
    }
    else
    {
      v8 = handleForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "LiDAR not supported", v9, 2u);
      }
      LOBYTE(v5) = 0;
    }

  }
LABEL_5:

  return (char)v5;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  NSMutableDictionary *v10;

  v5 = a3;
  v6 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_1000585D0, CFSTR("sessionTimeOut"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100058570, CFSTR("sceneErrorTimeOut"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100058588, CFSTR("userNotMovingTimeout"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100058760, CFSTR("noMovementAttitudeChangeMinThreshold"));
  v9 = CFSTR("parameters");
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
  objc_msgSend(v5, "startTest:parameters:", v8, v7);

}

- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  objc_super v17;

  v8 = a3;
  if (v8 && a5)
  {
    v17.receiver = self;
    v17.super_class = (Class)CRTest_8276;
    -[CRTest update:testIndex:testResult:](&v17, "update:testIndex:testResult:", v8, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PrCL")));
    if (!v10)
    {
LABEL_6:

      goto LABEL_7;
    }
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PrCL")));
    v14 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v13, v14);

    if ((isKindOfClass & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PrCL")));
      objc_msgSend(v8, "setPrCL:", v16);

      goto LABEL_6;
    }
  }
LABEL_7:

}

@end
