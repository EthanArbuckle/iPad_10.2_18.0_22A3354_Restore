@implementation DMDSetVoiceRoamingEnabledOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSetVoiceRoamingEnabledRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C31E0;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;

  v4 = objc_msgSend(a3, "enabled");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = MCStringForBool(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting voice roaming enabled: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  if ((v4 & 1) == 0)
    +[DMDCoreTelephonyUtilities setDataRoamingEnabled:](DMDCoreTelephonyUtilities, "setDataRoamingEnabled:", 0);
  +[DMDCoreTelephonyUtilities setVoiceRoamingEnabled:](DMDCoreTelephonyUtilities, "setVoiceRoamingEnabled:", v4);
  -[DMDSetVoiceRoamingEnabledOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

@end
