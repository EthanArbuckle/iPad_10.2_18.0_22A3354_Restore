@implementation NSArray

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  id v28;

  v6 = a3;
  v8 = objc_msgSend((id)objc_opt_class(NSArray, v7), "objectType");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v28 = 0;
  objc_msgSend(v6, "encodeObjects:forKey:error:", self, v9, &v28);
  v10 = v28;

  v12 = objc_msgSend((id)objc_opt_class(self, v11), "objectType");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15 = objc_msgSend((id)objc_opt_class(NSArray, v14), "objectTypeKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v27 = v10;
  objc_msgSend(v6, "encodeObject:forKey:error:", v13, v16, &v27);

  v17 = v27;
  if (v17)
  {
    v18 = sub_10005303C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1002253E4((uint64_t)v17, v19, v20, v21, v22, v23, v24, v25);

    if (a4)
      *a4 = objc_retainAutorelease(v17);
  }

  return v17 == 0;
}

- (NSArray)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v4;
  NSMutableArray *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  NSArray *v21;
  id v25;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  for (i = 0; ; ++i)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &OBJC_PROTOCOL___FMDCodable));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FM.object.%ld"), i));
    v25 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfProtocols:forKey:error:", v7, v8, &v25));
    v10 = v25;

    if (v10 || v9 == 0)
      break;
    -[NSMutableArray addObject:](v5, "addObject:", v9);

  }
  if (v10)
  {
    v12 = sub_10005303C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v20 = self;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10022544C((uint64_t)v10, v13, v14, v15, v16, v17, v18, v19);

    v21 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    v20 = -[NSArray initWithArray:](self, "initWithArray:", v5);
    v21 = v20;
  }

  return v21;
}

+ (id)objectType
{
  return CFSTR("FM.array");
}

+ (id)objectTypeKey
{
  return CFSTR("arrayType");
}

@end
