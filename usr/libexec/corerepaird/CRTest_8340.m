@implementation CRTest_8340

- (CRTest_8340)init
{
  CRTest_8340 *v2;
  CRTest_8340 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_8340;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("8340"));
    -[CRTest setTestId:](v3, "setTestId:", &off_1000584E0);
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
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRTest_8340;
  if (!-[CRTest shouldRun:](&v9, "shouldRun:", v4))
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));

  if (v5)
  {
    if (-[CRTest supportHarvestPearl](self, "supportHarvestPearl"))
    {
LABEL_4:
      LOBYTE(v5) = 0;
      goto LABEL_5;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
    if ((objc_msgSend(v7, "containsObject:", CFSTR("IPHONE COMP FACEID")) & 1) != 0)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
      LOBYTE(v5) = objc_msgSend(v8, "containsObject:", CFSTR("IPAD FRONT CAMERA"));

    }
  }
LABEL_5:

  return (char)v5;
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
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rik"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rik"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, CFSTR("keyBlob"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));
    -[NSMutableDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", v12);

  }
  v15 = CFSTR("parameters");
  v16 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
  objc_msgSend(v7, "startTest:parameters:", v14, v13);

}

@end
