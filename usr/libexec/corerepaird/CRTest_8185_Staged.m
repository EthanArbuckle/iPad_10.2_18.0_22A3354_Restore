@implementation CRTest_8185_Staged

- (CRTest_8185_Staged)init
{
  CRTest_8185_Staged *v2;
  CRTest_8185_Staged *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_8185_Staged;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("8185_Staged"));
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
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  unsigned __int8 v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRTest_8185_Staged;
  if (!-[CRTest shouldRun:](&v18, "shouldRun:", v4))
    goto LABEL_14;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));

  if (!v5)
    goto LABEL_14;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("IPHONE COMP FACEID"));

  if ((v7 & 1) != 0)
    goto LABEL_12;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("IPAD FRONT CAMERA"));

  if ((v9 & 1) != 0)
    goto LABEL_12;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("IPHONE COMP BATTERY"));

  if ((v11 & 1) != 0)
    goto LABEL_12;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
  if ((objc_msgSend(v12, "containsObject:", CFSTR("IPHONE COMP CAMERA")) & 1) != 0)
    goto LABEL_9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
  if (objc_msgSend(v13, "containsObject:", CFSTR("IPHONE COMP RCAM")))
  {

LABEL_9:
    goto LABEL_10;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
  v16 = objc_msgSend(v15, "containsObject:", CFSTR("IPAD REAR CAMERA"));

  if ((v16 & 1) == 0)
  {
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
LABEL_10:
  if (!-[CRTest supportLiDAR](self, "supportLiDAR") && !-[CRTest supportPeCoNet](self, "supportPeCoNet"))
    goto LABEL_14;
LABEL_12:
  v14 = 1;
LABEL_15:

  return v14;
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
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("enableStagedSeal"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ignoreStagedData"));
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
