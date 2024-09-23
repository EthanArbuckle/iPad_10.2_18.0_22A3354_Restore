@implementation CRTest_9006

- (CRTest_9006)init
{
  CRTest_9006 *v2;
  CRTest_9006 *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRTest_9006;
  v2 = -[CRTest init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRTest setName:](v2, "setName:", CFSTR("9006"));
    -[CRTest setTestId:](v3, "setTestId:", &off_1000584B0);
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

- (void)update:(id)a3 testIndex:(int64_t)a4 testResult:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  objc_super v25;

  v8 = a3;
  if (!v8 || !a5)
    goto LABEL_11;
  v25.receiver = self;
  v25.super_class = (Class)CRTest_9006;
  -[CRTest update:testIndex:testResult:](&v25, "update:testIndex:testResult:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("preflightPartSPC")));
  if (!v10)
    goto LABEL_6;
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("preflightPartSPC")));
  v14 = objc_opt_class(NSArray);
  isKindOfClass = objc_opt_isKindOfClass(v13, v14);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("preflightPartSPC")));
    objc_msgSend(v8, "setPartSPC:", v16);

LABEL_6:
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("preflightRIK")));
  if (!v18)
  {
LABEL_10:

    goto LABEL_11;
  }
  v19 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("preflightRIK")));
  v22 = objc_opt_class(NSString);
  v23 = objc_opt_isKindOfClass(v21, v22);

  if ((v23 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest resultData](self, "resultData"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("preflightRIK")));
    objc_msgSend(v8, "setRik:", v24);

    goto LABEL_10;
  }
LABEL_11:

}

@end
