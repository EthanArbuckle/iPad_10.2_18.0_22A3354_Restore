@implementation CRTest_8259

- (CRTest_8259)init
{
  CRTest_8259 *v2;
  CRTest_8259 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_8259;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("8259"));
    -[CRTest setTestId:](v3, "setTestId:", &off_100058480);
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

- (void)run:(id)a3 withContext:(id)a4
{
  id v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSMutableDictionary *v12;

  v5 = a3;
  v6 = objc_opt_new(NSMutableDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));
    -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v8);

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_1000583F0, CFSTR("endpointURLs"));
  }
  v11 = CFSTR("parameters");
  v12 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
  objc_msgSend(v5, "startTest:parameters:", v10, v9);

}

- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statusCode"));
    v12 = objc_msgSend(v11, "isEqual:", &off_100058468);

    if ((v12 & 1) == 0)
      objc_msgSend(v10, "setStatusCode:", &off_100058498);
    v13.receiver = self;
    v13.super_class = (Class)CRTest_8259;
    -[CRTest update:testIndex:testResult:](&v13, "update:testIndex:testResult:", v8, a4, v10);
  }

}

@end
