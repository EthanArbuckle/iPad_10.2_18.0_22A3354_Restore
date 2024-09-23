@implementation CRTest_8264

- (CRTest_8264)init
{
  CRTest_8264 *v2;
  CRTest_8264 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_8264;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("8264"));
    -[CRTest setTestId:](v3, "setTestId:", &off_100058618);
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
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8264;
  if (-[CRTest shouldRun:](&v8, "shouldRun:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
      LOBYTE(v5) = objc_msgSend(v6, "containsObject:", CFSTR("IPHONE COMP BATTERY"));

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
  void *v9;
  void *v10;
  const __CFString *v11;
  NSMutableDictionary *v12;

  v5 = a3;
  v6 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("needRequestURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));
    -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v8);

  }
  v11 = CFSTR("parameters");
  v12 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
  objc_msgSend(v5, "startTest:parameters:", v10, v9);

}

@end
