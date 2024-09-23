@implementation CRTest_9010

- (CRTest_9010)init
{
  CRTest_9010 *v2;
  CRTest_9010 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_9010;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("9010"));
    -[CRTest setTestId:](v3, "setTestId:", &off_100058630);
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
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides", a3));

  if (!v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enabled")));

  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = objc_msgSend(v6, "BOOLValue");
  else
    v8 = 1;

  return v8;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  NSMutableDictionary *v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastTestStatusCode"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastTestStatusCode"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, CFSTR("testStatusCode"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastRunTestId"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastRunTestId"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, CFSTR("testIdentifer"));

  }
  v15 = CFSTR("parameters");
  v16 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
  objc_msgSend(v7, "startTest:parameters:", v14, v13);

}

- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a3;
  if (v8 && a5)
  {
    v15 = v8;
    v9 = a5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statusCode"));
    -[CRTest setStatusCode:](self, "setStatusCode:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    -[CRTest setResultData:](self, "setResultData:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest statusCode](self, "statusCode"));
    LODWORD(v11) = objc_msgSend(v12, "isEqual:", &off_100058648);

    if ((_DWORD)v11)
    {
      objc_msgSend(v15, "setDoRetry:", 1);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
      objc_msgSend(v15, "setLastRunTestId:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest statusCode](self, "statusCode"));
      objc_msgSend(v15, "setLastTestStatusCode:", v14);

      objc_msgSend(v15, "setLastRunTestIndex:", a4);
    }
    v8 = v15;
  }

}

@end
