@implementation CRTest_8185_Update

- (CRTest_8185_Update)init
{
  CRTest_8185_Update *v2;
  CRTest_8185_Update *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_8185_Update;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("8185_Update"));
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
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRTest_8185_Update;
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
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  NSMutableDictionary *v27;
  const __CFString *v28;
  void *v29;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("enableStagedSeal"));
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
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "PrCL"));

  if (v19)
  {
    v28 = CFSTR("PrCL");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "PrCL"));
    v29 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v21, CFSTR("updateProperties"));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));
    -[NSMutableDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", v23);

  }
  v26 = CFSTR("parameters");
  v27 = v8;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
  objc_msgSend(v7, "startTest:parameters:", v25, v24);

}

@end
