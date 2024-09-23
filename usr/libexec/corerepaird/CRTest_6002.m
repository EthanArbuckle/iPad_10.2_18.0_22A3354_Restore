@implementation CRTest_6002

- (CRTest_6002)init
{
  CRTest_6002 *v2;
  CRTest_6002 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_6002;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("6002"));
    -[CRTest setTestId:](v3, "setTestId:", &off_100058540);
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
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v11[16];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRTest_6002;
  if (-[CRTest shouldRun:](&v12, "shouldRun:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));

    if (v5)
    {
      if (!-[CRTest supportPeCoNet](self, "supportPeCoNet"))
      {
        v8 = handleForCategory(0);
        v6 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PeCoNet not supported", v11, 2u);
        }
        LOBYTE(v5) = 0;
        goto LABEL_13;
      }
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
      if ((-[NSObject containsObject:](v6, "containsObject:", CFSTR("IPHONE COMP CAMERA")) & 1) == 0)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
        if (!objc_msgSend(v7, "containsObject:", CFSTR("IPHONE COMP RCAM")))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
          LOBYTE(v5) = objc_msgSend(v9, "containsObject:", CFSTR("IPAD REAR CAMERA"));

          goto LABEL_13;
        }

      }
      LOBYTE(v5) = 1;
LABEL_13:

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

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
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100058558, CFSTR("sessionTimeOut"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100058570, CFSTR("sceneErrorTimeOut"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100058588, CFSTR("userNotMovingTimeout"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100058750, CFSTR("noMovementAttitudeChangeMinThreshold"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_1000585A0, CFSTR("sceneErrorWarningThreshold"));
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
  void *v17;
  objc_super v18;

  v8 = a3;
  if (v8 && a5)
  {
    v18.receiver = self;
    v18.super_class = (Class)CRTest_6002;
    -[CRTest update:testIndex:testResult:](&v18, "update:testIndex:testResult:", v8, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("patchItem")));
    if (!v10)
    {
LABEL_6:

      goto LABEL_7;
    }
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("patchItem")));
    v14 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v13, v14);

    if ((isKindOfClass & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "patchItems"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("patchItem")));
      objc_msgSend(v9, "addObject:", v17);

      goto LABEL_6;
    }
  }
LABEL_7:

}

@end
