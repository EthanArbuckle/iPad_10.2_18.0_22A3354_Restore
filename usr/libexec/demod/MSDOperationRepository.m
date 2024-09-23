@implementation MSDOperationRepository

+ (id)createOperationFromIdentifier:(id)a3 withContext:(id)a4
{
  NSString *v5;
  id v6;
  objc_class *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v13;
  NSObject *v14;
  id v15;

  v5 = (NSString *)a3;
  v6 = a4;
  v7 = NSClassFromString(v5);
  if (!v7)
  {
    v15 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000C266C();
    goto LABEL_11;
  }
  v9 = [v7 alloc];
  if (!v9 || (v10 = objc_opt_class(MSDOperation, v8), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C26E0(v9, v14);

LABEL_11:
    v11 = 0;
    goto LABEL_5;
  }
  v9 = v9;
  v11 = -[NSObject initWithContext:](v9, "initWithContext:", v6);
LABEL_5:

  return v11;
}

@end
