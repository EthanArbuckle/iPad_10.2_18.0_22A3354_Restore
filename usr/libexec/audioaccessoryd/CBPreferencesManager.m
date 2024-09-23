@implementation CBPreferencesManager

+ (id)readUserPreference:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

+ (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  __CFString *v12;

  v5 = a5;
  v7 = (__CFString *)a3;
  v8 = a4;
  v9 = qword_100218BD8;
  if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] prefName %@\n", (uint8_t *)&v11, 0xCu);
  }
  CFPreferencesSetValue(v7, v8, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v5 && !CFPreferencesSynchronize(CFSTR("com.apple.cloudpaird"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    v10 = qword_100218BD8;
    if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] syncs returns false\n", (uint8_t *)&v11, 2u);
    }
  }

}

+ (void)removeuserPreference:(id)a3 sync:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  __CFString *v9;

  v4 = a4;
  v5 = (__CFString *)a3;
  v6 = qword_100218BD8;
  if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[removeuserPreference] prefName %@\n", (uint8_t *)&v8, 0xCu);
  }
  CFPreferencesSetValue(v5, 0, CFSTR("com.apple.cloudpaird"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v4 && !CFPreferencesSynchronize(CFSTR("com.apple.cloudpaird"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    v7 = qword_100218BD8;
    if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[removeuserPreference] psyncs returns false\n", (uint8_t *)&v8, 2u);
    }
  }

}

+ (id)deviceName
{
  return (id)MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
}

+ (BOOL)isRunningInRecovery
{
  return 0;
}

+ (BOOL)isDeviceClass:(id)a3
{
  id v3;
  void *v4;
  const void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)MGGetStringAnswer(CFSTR("DeviceClass"));
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isEqualToString:", v3);
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
