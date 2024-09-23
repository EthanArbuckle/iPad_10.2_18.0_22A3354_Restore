@implementation JSAOSLog

+ (void)logFault:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    sub_71730((uint64_t)v3, v5);

}

@end
