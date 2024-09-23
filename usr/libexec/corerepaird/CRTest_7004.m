@implementation CRTest_7004

- (CRTest_7004)init
{
  CRTest_7004 *v2;
  CRTest_7004 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_7004;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("7004"));
    -[CRTest setTestId:](v3, "setTestId:", &off_100058528);
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
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRTest_7004;
  if (!-[CRTest shouldRun:](&v9, "shouldRun:", v4))
    goto LABEL_7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));

  if (!v5)
    goto LABEL_10;
  if (!-[CRTest supportLiDAR](self, "supportLiDAR") && !-[CRTest supportPeCoNet](self, "supportPeCoNet"))
  {
LABEL_7:
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
  if ((objc_msgSend(v6, "containsObject:", CFSTR("IPHONE COMP CAMERA")) & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
    LOBYTE(v5) = objc_msgSend(v7, "containsObject:", CFSTR("IPHONE COMP RCAM"));

  }
LABEL_10:

  return (char)v5;
}

@end
