@implementation DMDSetPersonalHotspotEnabledOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSetPersonalHotspotEnabledRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C31C8;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = objc_msgSend(a3, "enabled");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = MCStringForBool(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting Personal Hotspot enabled: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPersonalHotspotManager sharedManager](DMDPersonalHotspotManager, "sharedManager"));
  objc_msgSend(v7, "setEnabled:", v4);

  -[DMDSetPersonalHotspotEnabledOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

@end
