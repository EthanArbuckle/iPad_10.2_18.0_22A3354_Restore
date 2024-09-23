@implementation CKRecordSystemFieldsTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(CKRecord, a2);
}

- (id)transformedValue:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  v5 = objc_opt_class(CKRecord, v4);
  v6 = REMDynamicCast(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    objc_msgSend(v7, "encodeSystemFieldsWithCoder:", v8);
    objc_msgSend(v8, "finishEncoding");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encodedData"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  id v13;
  id v15;

  v3 = a3;
  v5 = objc_opt_class(NSData, v4);
  v6 = REMDynamicCast(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v15 = 0;
    v8 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v7, &v15);
    v9 = v15;
    v10 = v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 0;
    if (v11)
    {
      v13 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithCoder:", v8);
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        sub_10067E820((uint64_t)v10, v12);

      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
