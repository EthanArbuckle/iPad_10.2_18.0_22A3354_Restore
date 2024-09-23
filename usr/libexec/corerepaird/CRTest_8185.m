@implementation CRTest_8185

- (CRTest_8185)init
{
  CRTest_8185 *v2;
  CRTest_8185 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_8185;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("8185"));
    -[CRTest setTestId:](v3, "setTestId:", &off_1000584F8);
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
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRTest_8185;
  if (-[CRTest shouldRun:](&v8, "shouldRun:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)run:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  NSMutableDictionary *v24;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("skipStageEAN"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, CFSTR("KGBSerialNumber"));

  }
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "partSPC"));
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "partSPC"));
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "partSPC"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(",")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v16, CFSTR("partSPC"));

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rik"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rik"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v18, CFSTR("keyBlob"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));
    -[NSMutableDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", v20);

  }
  v23 = CFSTR("parameters");
  v24 = v8;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
  objc_msgSend(v7, "startTest:parameters:", v22, v21);

}

@end
