@implementation CRTest_8268

- (CRTest_8268)init
{
  CRTest_8268 *v2;
  CRTest_8268 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_8268;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("8268"));
    -[CRTest setTestId:](v3, "setTestId:", &off_1000585E8);
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
  unsigned __int8 v7;
  BOOL v8;
  void *v9;
  unsigned int v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRTest_8268;
  if (!-[CRTest shouldRun:](&v12, "shouldRun:", v4))
    goto LABEL_9;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));

  if (!v5)
    goto LABEL_9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("MPU"));

  if ((v7 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
    if (objc_msgSend(v9, "containsObject:", CFSTR("IPHONE COMP DISPLAY")))
    {
      v10 = -[CRTest hasMesa](self, "hasMesa");

      if (v10)
      {
        v8 = -[CRTest hasMesaDelta](self, "hasMesaDelta");
        goto LABEL_10;
      }
    }
    else
    {

    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v8 = 1;
LABEL_10:

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
