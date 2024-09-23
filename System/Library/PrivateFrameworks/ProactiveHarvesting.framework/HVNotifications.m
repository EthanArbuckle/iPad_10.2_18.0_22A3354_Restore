@implementation HVNotifications

+ (void)_postNotificationWithName:(uint64_t)a1
{
  uint32_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v3 = notify_post(a2);
  hv_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = a2;
      _os_log_error_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_ERROR, "HVNotifications: failed to post %s", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = a2;
    _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_DEFAULT, "HVNotifications: posted %s", (uint8_t *)&v6, 0xCu);
  }

}

@end
