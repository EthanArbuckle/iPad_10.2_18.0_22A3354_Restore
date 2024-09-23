@implementation CRTest_8185_Patch

- (CRTest_8185_Patch)init
{
  CRTest_8185_Patch *v2;
  CRTest_8185_Patch *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_8185_Patch;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("8185_Patch"));
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
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRTest_8185_Patch;
  if (!-[CRTest shouldRun:](&v10, "shouldRun:", v4))
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));

  if (!v5)
    goto LABEL_7;
  if (!-[CRTest supportPeCoNet](self, "supportPeCoNet"))
  {
LABEL_6:
    LOBYTE(v5) = 0;
    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
  if ((objc_msgSend(v6, "containsObject:", CFSTR("IPHONE COMP CAMERA")) & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
    if ((objc_msgSend(v8, "containsObject:", CFSTR("IPHONE COMP RCAM")) & 1) != 0)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partSPC"));
      LOBYTE(v5) = objc_msgSend(v9, "containsObject:", CFSTR("IPAD REAR CAMERA"));

    }
  }

LABEL_7:
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
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  NSMutableDictionary *v29;

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
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "patchItems"));
  if (v19)
  {
    v20 = (void *)v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "patchItems"));
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "patchItems"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v23, CFSTR("patchItems"));

    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest overrides](self, "overrides"));
    -[NSMutableDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", v25);

  }
  v28 = CFSTR("parameters");
  v29 = v8;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
  objc_msgSend(v7, "startTest:parameters:", v27, v26);

}

@end
