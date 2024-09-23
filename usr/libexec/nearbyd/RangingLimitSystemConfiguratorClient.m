@implementation RangingLimitSystemConfiguratorClient

- (void)didUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  _BOOL4 v5;
  NSObject *v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  uint64_t v14;

  v5 = a3;
  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromClass(a4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)v8;
    v10 = CFSTR("NO");
    if (v5)
      v10 = CFSTR("YES");
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#rlm,didUpdateResourceUsageLimitExceeded: %@, for: %@", (uint8_t *)&v11, 0x16u);

  }
}

@end
