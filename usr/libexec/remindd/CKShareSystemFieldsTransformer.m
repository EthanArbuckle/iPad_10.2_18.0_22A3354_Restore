@implementation CKShareSystemFieldsTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(CKShare, a2);
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;

  if (a3)
  {
    v3 = a3;
    v9 = 0;
    v4 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v3, &v9);

    v5 = v9;
    if (v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        sub_10067E8D4((uint64_t)v5, v6);

    }
    v7 = objc_msgSend(objc_alloc((Class)CKShare), "initWithCoder:", v4);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
