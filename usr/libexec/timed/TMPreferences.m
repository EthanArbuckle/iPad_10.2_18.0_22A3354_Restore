@implementation TMPreferences

- (BOOL)shouldAllowTimeTool
{
  return os_variant_allows_internal_security_policies("com.apple.timed", a2);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TMPreferences;
  -[TMPreferences dealloc](&v3, "dealloc");
}

- (TMPreferences)initWithDefaults:(id)a3
{
  TMPreferences *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TMPreferences;
  v4 = -[TMPreferences init](&v6, "init");
  if (v4)
  {
    _CFPreferencesSetFileProtectionClass(kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost, 0, 4);
    v4->_defaults = (NSUserDefaults *)a3;
    sub_100016790((id *)&v4->super.isa);
  }
  return v4;
}

- (TMPreferences)init
{
  return -[TMPreferences initWithDefaults:](self, "initWithDefaults:", +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
}

- (BOOL)isAppleTV
{
  const void *v2;
  const void *v3;
  BOOL v4;

  v2 = (const void *)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFEqual(v2, CFSTR("AppleTV")) != 0;
  CFRelease(v3);
  return v4;
}

- (BOOL)isMac
{
  return 0;
}

- (BOOL)supportsBasebandAPTimeSync
{
  const void *v2;
  const void *v3;

  v2 = (const void *)MGCopyAnswer(CFSTR("HXTqT3UXOKuTEklxz+wMAA"), 0);
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3 != 0;
}

- (BOOL)isWatch
{
  return objc_msgSend((id)MGCopyAnswer(CFSTR("DeviceClass"), 0), "isEqualToString:", CFSTR("Watch"));
}

- (void)setAccurateThresholds:(BOOL)a3
{
  id v3;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  unsigned int v10;
  double v11;
  NSDictionary *v12;
  NSObject *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  void *v17;

  v3 = (id)a3;
  v5 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("ForceAccurateTime"));
  if (v5)
  {
    v3 = objc_msgSend(v5, "BOOLValue");
    v6 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "disabled";
      if ((_DWORD)v3)
        v7 = "enabled";
      *(_DWORD *)buf = 136315138;
      v17 = (void *)v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Forcing accurate thresholds to be %s, from defaults.", buf, 0xCu);
    }
  }
  v8 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    v9 = "inaccurate";
    if ((_DWORD)v3)
      v9 = "accurate";
    *(_DWORD *)buf = 136315138;
    v17 = (void *)v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting thresholds to be %s", buf, 0xCu);
  }
  v14[0] = CFSTR("BBTimeWantedThreshold");
  if ((_DWORD)v3)
  {
    v10 = -[TMPreferences supportsBasebandAPTimeSync](self, "supportsBasebandAPTimeSync", v14[0]);
    v11 = INFINITY;
    if (v10)
      v11 = 0.048;
  }
  else
  {
    v11 = INFINITY;
  }
  v15[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11, v14[0]);
  v15[1] = &off_10002C228;
  v14[1] = CFSTR("NtpTimeWantedThreshold");
  v14[2] = CFSTR("CorrectTimeOnWake");
  v15[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3);
  v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v13 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Registering these thresholds: %@", buf, 0xCu);
  }
  -[NSUserDefaults registerDefaults:](self->_defaults, "registerDefaults:", v12);
}

- (id)description
{
  return -[NSDictionary description](-[NSUserDefaults dictionaryRepresentation](self->_defaults, "dictionaryRepresentation"), "description");
}

- (NSString)NTPServerPort
{
  return -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("NtpTimeServerPort"));
}

- (BOOL)shouldFetchOnWake
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("FetchTimeOnWake"));
}

- (BOOL)shouldCorrectOnWake
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("CorrectTimeOnWake"));
}

- (double)RTCMachSyncInterval
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("RTCMachSyncInterval"));
  return result;
}

- (double)RTCWakeUncertainty
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("RTCWakeUncertainty"));
  return result;
}

- (double)settimeofdayThreshold
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("SettimeofdayThreshold"));
  return result;
}

- (int64_t)commandHistorySizeKey
{
  return -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", CFSTR("CommandHistorySize"));
}

- (double)NTPSchedulingInterval
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("NtpSchedulingInterval"));
  return result;
}

- (double)NTPBurstRetryInterval
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("NtpBurstRetryInterval"));
  return result;
}

- (int64_t)NTPBurstRetryAttempts
{
  return -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", CFSTR("NtpBurstRetryAttempts"));
}

- (double)NTPUnsetSchedulingInterval
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("NtpUnsetSchedulingInterval"));
  return result;
}

- (BOOL)NTPUseServicePort
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("NtpUseServicePort"));
}

- (NSString)providerName
{
  return -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("TimeProvider"));
}

- (double)basebandWantedThreshold
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("BBTimeWantedThreshold"));
  return result;
}

- (double)NTPWantedThreshold
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("NtpTimeWantedThreshold"));
  return result;
}

- (int64_t)NTPServicePortMaxRetries
{
  return -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", CFSTR("NtpServicePortMaxRetries"));
}

- (BOOL)areTimeZonePopupsEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("TimeZonePopups"));
}

- (BOOL)shouldUseFilesystemTimestamp
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("UseFilesystemTimestamp"));
}

- (double)RTCFrequencyTolerance
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("RTCFrequencyTolerance"));
  return result;
}

- (double)RTCFrequencyNoiseDensity
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("RTCFrequencyNoiseDensity"));
  return result;
}

- (NSString)NTPServerAddress
{
  NSString *result;

  if (!os_variant_allows_internal_security_policies("com.apple.timed", a2)
    || (result = -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("NtpTimeServer"))) == 0)
  {
    if (self)
      return (NSString *)CFSTR("time.apple.com");
    else
      return 0;
  }
  return result;
}

- (BOOL)shouldClamp
{
  NSString *v3;
  const __CFString *v4;

  v3 = -[TMPreferences NTPServerAddress](self, "NTPServerAddress");
  if (self)
    v4 = CFSTR("time.apple.com");
  else
    v4 = 0;
  return -[NSString isEqualToString:](v3, "isEqualToString:", v4);
}

- (BOOL)shouldAlertWhenIslanded
{
  return os_variant_has_internal_ui("com.apple.timed", a2);
}

- (BOOL)shouldPowerAssertionsBeOptional
{
  return os_variant_is_darwinos("com.apple.timed", a2);
}

- (BOOL)isAutomaticTimeEnabled
{
  _BOOL4 v3;

  v3 = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("TMAutomaticTimeOnlyEnabled"));
  if (v3)
    LOBYTE(v3) = !-[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("DisableAutomaticTime"));
  return v3;
}

- (void)setAutomaticTimeEnabled:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", a3, CFSTR("TMAutomaticTimeOnlyEnabled"));
}

- (BOOL)isAutomaticTimeZoneEnabled
{
  _BOOL4 v3;

  v3 = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("TMAutomaticTimeZoneEnabled"));
  if (v3)
    LOBYTE(v3) = !-[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("DisableAutomaticTime"));
  return v3;
}

- (void)setAutomaticTimeZoneEnabled:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", a3, CFSTR("TMAutomaticTimeZoneEnabled"));
}

- (void)setNTPUseServicePort:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", a3, CFSTR("NtpUseServicePort"));
}

@end
