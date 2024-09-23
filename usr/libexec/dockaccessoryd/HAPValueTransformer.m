@implementation HAPValueTransformer

+ (Class)expectedClassForFormat:(unint64_t)a3
{
  uint64_t v3;

  if (a3 - 1 > 0xE)
    return (Class)0;
  v3 = objc_opt_class(*off_100236A28[a3 - 1], a2);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v3);
}

+ (Class)expectedTransformedClassForFormat:(unint64_t)a3
{
  return +[HAPValueTransformer expectedClassForFormat:](HAPValueTransformer, "expectedClassForFormat:", a3);
}

- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  NSErrorUserInfoKey v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;

  v9 = a3;
  if (v9
    && (v10 = objc_msgSend((id)objc_opt_class(self, v8), "expectedClassForFormat:", a4),
        (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value class, %@, is not of the expected class %@"), objc_opt_class(v9, v11), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v16 = sub_10007CCE4(0, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = sub_10007CD2C(0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPValueTransformer] %@", buf, 0x16u);

    }
    if (a5)
    {
      v22 = NSLocalizedDescriptionKey;
      v23 = v14;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6756, v20));

    }
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  NSErrorUserInfoKey v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;

  v9 = a3;
  if (v9
    && (v10 = objc_msgSend((id)objc_opt_class(self, v8), "expectedTransformedClassForFormat:", a4),
        (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value class, %@, is not of the expected class %@"), objc_opt_class(v9, v11), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v16 = sub_10007CCE4(0, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = sub_10007CD2C(0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPValueTransformer] %@", buf, 0x16u);

    }
    if (a5)
    {
      v22 = NSLocalizedDescriptionKey;
      v23 = v14;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6756, v20));

    }
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

@end
