@implementation NSNull

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull objectType](NSNull, "objectType"));
  v18 = 0;
  objc_msgSend(v5, "encodeObject:forKey:error:", v6, v7, &v18);

  v8 = v18;
  if (v8)
  {
    v9 = sub_10005303C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100227108((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);

    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v8 == 0;
}

- (NSNull)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSNull *v21;
  NSNull *v22;
  id v24;

  v6 = a3;
  v8 = objc_opt_class(NSNull, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull objectType](NSNull, "objectType"));
  v24 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeObjectOfClass:forKey:error:", v8, v9, &v24));

  v11 = v24;
  if (!v11)
  {
    if (v10)
    {
      self = -[NSNull init](self, "init");
      v21 = self;
      goto LABEL_9;
    }
LABEL_8:
    v21 = 0;
    goto LABEL_9;
  }
  v12 = sub_10005303C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_100227170((uint64_t)v10, v13, v14, v15, v16, v17, v18, v19);

  if (!a4)
    goto LABEL_8;
  v20 = objc_retainAutorelease(v11);
  v21 = 0;
  *a4 = v20;
LABEL_9:
  v22 = v21;

  return v22;
}

+ (id)objectType
{
  return CFSTR("FM.null");
}

+ (id)objectTypeKey
{
  return CFSTR("nullType");
}

@end
