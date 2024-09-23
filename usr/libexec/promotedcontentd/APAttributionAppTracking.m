@implementation APAttributionAppTracking

+ (BOOL)appTrackingStatus:(id *)a3
{
  id v4;
  unsigned int v5;
  __int128 v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  _BYTE v13[32];

  v4 = objc_alloc_init((Class)ADTrackingTransparency);
  v5 = objc_msgSend(v4, "crossAppTrackingAllowedSwitchEnabled");
  v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v13 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v13[16] = v6;
  v7 = +[APAttributionAppTracking isAppTrackingAuthorizedByUser:](APAttributionAppTracking, "isAppTrackingAuthorizedByUser:", v13);
  v8 = APLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = CFSTR("NO");
    if (v5)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    if (v7)
      v10 = CFSTR("YES");
    *(_DWORD *)v13 = 138543618;
    *(_QWORD *)&v13[4] = v11;
    *(_WORD *)&v13[12] = 2114;
    *(_QWORD *)&v13[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "isATTSwitchedEnabled (%{public}@), isAppAuthorizedByUser (%{public}@)", v13, 0x16u);
  }

  return v5 & v7;
}

+ (BOOL)isAppTrackingAuthorizedByUser:(id *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  return TCCAccessPreflightWithAuditToken(kTCCServiceUserTracking, v5, 0) == 0;
}

@end
