@implementation CRTest_8343

- (CRTest_8343)init
{
  CRTest_8343 *v2;
  CRTest_8343 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_8343;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("8343"));
    -[CRTest setTestId:](v3, "setTestId:", &off_100058510);
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
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRTest_8343;
  if (-[CRTest shouldRun:](&v10, "shouldRun:", v4)
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC")), v5, v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
    if ((objc_msgSend(v6, "containsObject:", CFSTR("IPHONE COMP FACEID")) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
      v7 = objc_msgSend(v8, "containsObject:", CFSTR("IPAD FRONT CAMERA"));

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
