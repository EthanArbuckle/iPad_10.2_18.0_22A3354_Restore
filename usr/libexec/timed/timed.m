uint64_t sub_100004E60(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

NSDictionary *sub_100004E7C(_QWORD *a1)
{
  void *v1;
  id v2;
  _QWORD v4[5];

  if (!a1)
    return 0;
  v1 = (void *)a1[2];
  objc_msgSend(objc_msgSend(a1, "clock"), "coarseMonotonicTime");
  v2 = objc_msgSend(objc_msgSend(v1, "timeAtRtc:"), "dictionary");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000767C;
  v4[3] = &unk_100028BA0;
  v4[4] = v2;
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.referenceTime"), v4);
  if (!v2)
    return +[NSDictionary dictionary](NSDictionary, "dictionary");
  return (NSDictionary *)v2;
}

void sub_100004F1C(uint64_t a1, xpc_object_t object)
{
  xpc_connection_t *v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  pid_t v9;
  int v10;
  int v11;
  NSObject *v12;
  xpc_connection_t v13;
  NSObject *v14;
  pid_t pid;
  NSObject *v16;
  _QWORD v17[6];
  _BYTE buf[32];
  uint8_t v19[16];
  __int128 v20;

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      v14 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      {
        pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        *(_DWORD *)v19 = 67109120;
        *(_DWORD *)&v19[4] = pid;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Client disconnected: %d", v19, 8u);
      }
      sub_100008AF4();
    }
    else if (object == &_xpc_error_termination_imminent)
    {
      v16 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Termination imminent!", v19, 2u);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001AA48();
    }
  }
  else
  {
    *(_OWORD *)v19 = 0u;
    v20 = 0u;
    v5 = *(_QWORD *)(a1 + 32);
    v4 = (xpc_connection_t *)(a1 + 32);
    xpc_connection_get_audit_token(v5, v19);
    v6 = objc_alloc_init((Class)NSAutoreleasePool);
    v7 = (void *)_CFXPCCreateCFObjectFromXPCObject(object);
    v8 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
    {
      v9 = xpc_connection_get_pid(*v4);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v9;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Client %d issued command: %@", buf, 0x12u);
    }
    v10 = objc_msgSend((id)qword_1000335E0, "shouldAllowTimeTool");
    *(_OWORD *)buf = *(_OWORD *)v19;
    *(_OWORD *)&buf[16] = v20;
    v11 = sub_100005208(v7, buf, v10);
    v12 = qword_100033718;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEBUG))
        sub_10001AAA8(v12);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100006254;
      v17[3] = &unk_1000287F0;
      v13 = *v4;
      v17[4] = object;
      v17[5] = v13;
      objc_msgSend((id)qword_1000335D8, "executeCommand:withHandler:", v7, v17);
    }
    else if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
    {
      sub_10001AB28(v4, v12);
    }

    objc_msgSend(v6, "drain");
  }
}

uint64_t sub_100005208(void *a1, _OWORD *a2, int a3)
{
  id v6;
  __int128 v8;
  __int128 v9;
  id v10;
  __int128 v11;
  __int128 v12;
  const __CFString *v13;
  CFTypeRef v14;
  const void *v15;
  CFTypeID v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  audit_token_t atoken;
  audit_token_t euidp;
  CFRange v28;

  v6 = objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("TMCommand"));
  if (qword_1000336F0 != -1)
    dispatch_once(&qword_1000336F0, &stru_100028FB0);
  if ((objc_msgSend((id)qword_1000336E8, "containsObject:", v6) & 1) != 0)
    return 1;
  v8 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v8;
  if ((sub_10000543C(CFSTR("com.apple.timed"), &atoken) & 1) == 0)
  {
    v9 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v9;
    euidp.val[0] = 0;
    audit_token_to_au32(&atoken, 0, euidp.val, 0, 0, 0, 0, 0, 0);
    if (euidp.val[0])
      return 0;
  }
  v10 = objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("TMSource"));
  v11 = a2[1];
  *(_OWORD *)euidp.val = *a2;
  *(_OWORD *)&euidp.val[4] = v11;
  if (a3)
  {
    v12 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v12;
    if ((sub_10000543C(CFSTR("com.apple.private.timetool"), &atoken) & 1) != 0)
      return 1;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetAuthenticatedSourceTime")))
  {
    atoken = euidp;
    v13 = CFSTR("com.apple.private.timed.sources");
  }
  else
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetSourceTime")) & 1) == 0
      && !objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetSourceTimeZone")))
    {
      return 1;
    }
    atoken = euidp;
    v13 = CFSTR("com.apple.timed.sources");
  }
  v14 = sub_1000054F8(v13, &atoken);
  v15 = v14;
  if (v14)
  {
    v16 = CFGetTypeID(v14);
    if (v16 != CFArrayGetTypeID())
    {
      v18 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
        sub_10001BD38(v18, v19, v20, v21, v22, v23, v24, v25);
      CFRelease(v15);
      return 0;
    }
    v28.length = CFArrayGetCount((CFArrayRef)v15);
    v28.location = 0;
    v17 = CFArrayContainsValue((CFArrayRef)v15, v28, v10);
    CFRelease(v15);
    if (v17)
      return 1;
  }
  return 0;
}

uint64_t sub_10000543C(const __CFString *a1, _OWORD *a2)
{
  __int128 v3;
  CFTypeRef v4;
  const void *v5;
  CFTypeID v6;
  uint64_t v7;
  NSObject *v8;
  _OWORD v10[2];

  v3 = a2[1];
  v10[0] = *a2;
  v10[1] = v3;
  v4 = sub_1000054F8(a1, v10);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFGetTypeID(v4);
  if (v6 == CFBooleanGetTypeID() && CFEqual(v5, kCFBooleanTrue))
  {
    v7 = 1;
  }
  else
  {
    v8 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
      sub_10001BD6C((uint64_t)a1, v8);
    v7 = 0;
  }
  CFRelease(v5);
  return v7;
}

CFTypeRef sub_1000054F8(const __CFString *a1, _OWORD *a2)
{
  __int128 v3;
  __SecTask *v4;
  __SecTask *v5;
  CFTypeRef v6;
  CFErrorRef v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFErrorRef error;
  audit_token_t token;

  v3 = a2[1];
  *(_OWORD *)token.val = *a2;
  *(_OWORD *)&token.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v4)
  {
    v5 = v4;
    error = 0;
    v6 = SecTaskCopyValueForEntitlement(v4, a1, &error);
    v7 = error;
    if (error)
    {
      v8 = qword_100033718;
      if (!os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT)
        || (token.val[0] = 138412290,
            *(_QWORD *)&token.val[1] = v7,
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SecTaskCopyValueForEntitlement failed with error: %@", (uint8_t *)&token, 0xCu), (v7 = error) != 0))
      {
        CFRelease(v7);
      }
    }
    CFRelease(v5);
  }
  else
  {
    v9 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
      sub_10001BDE0(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  return v6;
}

void sub_100005638(NSDictionary *a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSNumber *v11;
  const __CFString *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  Class isa;
  NSDictionary *v22;
  NSNumber **v23;
  const __CFString **v24;
  id v25;
  unsigned int v26;
  NSObject *v27;
  Class v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[5];
  _QWORD v44[5];
  char v45;
  _QWORD v46[5];
  char v47;
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  double v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  const __CFString *v62;
  id v63;
  const __CFString *v64;
  NSNumber *v65;

  if (!a1)
    return;
  v6 = objc_msgSend(a2, "objectForKey:", CFSTR("TMCommand"));
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetManualTime")))
  {
    sub_10000D6D8(a1, a2);
LABEL_18:
    sub_10000CFD4(a1);
    return;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetAuthenticatedSourceTime")))
  {
    sub_10000D908((uint64_t)a1, (uint64_t)a2);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetSourceTime")))
  {
    -[NSDictionary setSourceTime:](a1, "setSourceTime:", a2);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetSourceAvailable")))
  {
    -[NSDictionary setSourceAvailable:](a1, "setSourceAvailable:", a2);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetSourceUnavailable")))
  {
    -[NSDictionary setSourceUnavailable:](a1, "setSourceUnavailable:", a2);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetSourceTimeZone")))
  {
    -[NSDictionary setSourceTimeZone:](a1, "setSourceTimeZone:", a2);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetAutomaticTimeEnabled")))
  {
    v7 = objc_msgSend(objc_msgSend(a2, "objectForKey:", CFSTR("TMAutomaticTimeEnabled")), "BOOLValue");
    v8 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMSource"));
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
      *(_DWORD *)buf = 138413058;
      v49 = CFSTR("auto_time");
      v50 = 2112;
      v51 = *(double *)&v9;
      v52 = 2048;
      v53 = v10;
      v54 = 1024;
      LODWORD(v55) = (_DWORD)v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,enabled,%d", buf, 0x26u);
    }
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10000DA20;
    v46[3] = &unk_100028C58;
    v47 = (char)v7;
    v46[4] = a2;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.setAutomaticTimeEnabledCommand"), v46);
    -[NSDictionary setAutomaticTimeEnabled:](a1, "setAutomaticTimeEnabled:", v7);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMIsAutomaticTimeEnabled")))
  {
    v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSDictionary isAutomaticTimeEnabled](a1, "isAutomaticTimeEnabled"));
    v12 = CFSTR("TMAutomaticTimeEnabled");
LABEL_22:
    v13 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v11, v12);
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetAutomaticTimeZoneEnabled")))
  {
    v15 = objc_msgSend(objc_msgSend(a2, "objectForKey:", CFSTR("TMAutomaticTimeZoneEnabled")), "BOOLValue");
    v16 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMSource"));
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
      *(_DWORD *)buf = 138413058;
      v49 = CFSTR("auto_tz");
      v50 = 2112;
      v51 = *(double *)&v17;
      v52 = 2048;
      v53 = v18;
      v54 = 1024;
      LODWORD(v55) = (_DWORD)v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,enabled,%d", buf, 0x26u);
    }
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10000DB24;
    v44[3] = &unk_100028C58;
    v45 = (char)v15;
    v44[4] = a2;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.setAutomaticTimeZoneEnabledCommand"), v44);
    -[NSDictionary setAutomaticTimeZoneEnabled:](a1, "setAutomaticTimeZoneEnabled:", v15);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMIsAutomaticTimeZoneEnabled")))
  {
    v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSDictionary isAutomaticTimeZoneEnabled](a1, "isAutomaticTimeZoneEnabled"));
    v12 = CFSTR("TMAutomaticTimeZoneEnabled");
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMIsTimeZoneConfirmed")))
  {
    v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[objc_class currentTimeZone](a1[1].super.isa, "currentTimeZone") != 0);
    v12 = CFSTR("TMTimeZoneConfirmed");
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMConfirmTimeZone")))
  {
    sub_10000DC4C(a1, a2);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMGetBAFinderTime")))
  {
    v14 = sub_100004E7C(a1);
    v19 = qword_100033718;
    if (!os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v49 = (const __CFString *)v14;
    v20 = "Returning BA finder time to client: %@";
    goto LABEL_42;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("TMGetReferenceTime")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMGetTrustedInterval")))
    {
      isa = a1[3].super.isa;
      objc_msgSend(-[NSDictionary clock](a1, "clock"), "coarseMonotonicTime");
      v22 = (NSDictionary *)objc_msgSend(-[objc_class timeAtRtc:](isa, "timeAtRtc:"), "dictionary");
      if (v22)
        v14 = v22;
      else
        v14 = (NSDictionary *)&__NSDictionary0__struct;
      goto LABEL_25;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMGetRTCResetCount")))
    {
      v64 = CFSTR("TMRTCResetCount");
      v65 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[NSDictionary rtcResetCount](a1, "rtcResetCount"));
      v23 = &v65;
      v24 = &v64;
    }
    else
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMIsBBTimeActive")))
      {
        v13 = sub_10000DD98(a1);
        goto LABEL_23;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMProvideBBTime")))
      {
        sub_10000DE28((id *)&a1->super.isa, a2);
        goto LABEL_18;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMProvideCellularTimeZone")))
      {
        sub_10000B314(a1, (uint64_t)"provideNetworkTimeZone:", (uint64_t)a2);
        goto LABEL_18;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetupTime")))
      {
        sub_10000E11C(a1, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
        return;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMSetupTimeZone")))
      {
        sub_10000E340(a1, a2, a3);
        return;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMFetchNTP")))
      {
        -[objc_class fetchTime](a1[4].super.isa, "fetchTime");
        return;
      }
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("TMGetComputedTimeZone")))
      {
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMResetToFirstLaunch")))
        {
          sub_10000E740((id *)&a1->super.isa, a2);
          return;
        }
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("TMResetTimeZone")))
        {
          -[NSDictionary resetTimeZone:](a1, "resetTimeZone:", a2);
          goto LABEL_18;
        }
        v26 = objc_msgSend(v6, "isEqualToString:", CFSTR("TMSystemWillWake"));
        v27 = qword_100033718;
        if (v26)
        {
          if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "System will wake", buf, 2u);
          }
          v28 = a1[2].super.isa;
          -[objc_class RTCWakeUncertainty](a1[7].super.isa, "RTCWakeUncertainty");
          -[objc_class inflateHistoricalDataBy:](v28, "inflateHistoricalDataBy:");
          if (-[objc_class shouldCorrectOnWake](a1[7].super.isa, "shouldCorrectOnWake")
            && -[objc_class shouldFetchOnWake](a1[7].super.isa, "shouldFetchOnWake")
            && os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
          {
            sub_10001B784();
          }
          if (-[objc_class shouldCorrectOnWake](a1[7].super.isa, "shouldCorrectOnWake"))
            -[NSDictionary testAndApplySystemTime](a1, "testAndApplySystemTime");
          if (-[objc_class shouldFetchOnWake](a1[7].super.isa, "shouldFetchOnWake"))
          {
            v30 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00);
            v31 = *(double *)&qword_1000332D0;
            if (*(double *)&qword_1000332D0 > v30)
            {
              v32 = qword_100033718;
              if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "CLOCK_MONOTONIC_RAW has stepped backward since last NTP fetch", buf, 2u);
                v31 = *(double *)&qword_1000332D0;
              }
            }
            if (v31 <= 0.0 || v31 >= v30 || (v29 = v30 - v31, v30 - v31 >= 900.0))
            {
              qword_1000332D0 = *(_QWORD *)&v30;
              -[objc_class fetchTime](a1[4].super.isa, "fetchTime", v29);
            }
            else
            {
              v33 = qword_100033718;
              if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                v49 = *(const __CFString **)&v31;
                v50 = 2048;
                v51 = v30;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Throttling power management triggered NTP fetch attempt lastFetch: %f currentTime: %f", buf, 0x16u);
              }
            }
          }
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10000E95C;
          v43[3] = &unk_100028C80;
          v43[4] = a1;
          objc_msgSend(-[NSDictionary clock](a1, "clock"), "montonicTimeForMachTime:toQueue:withCompletionHandler:", mach_absolute_time(), -[NSDictionary workloop](a1, "workloop"), v43);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
            sub_10001B7B0();
          v34 = qword_100033720;
          if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
          {
            v35 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMSource"));
            objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
            v37 = v36;
            objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMRTCConversionTimeError")), "doubleValue");
            v39 = v38;
            objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMCurrentTime")), "doubleValue");
            v41 = v40;
            objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMTimeError")), "doubleValue");
            *(_DWORD *)buf = 138413826;
            v49 = CFSTR("unknown");
            v50 = 2112;
            v51 = *(double *)&v35;
            v52 = 2048;
            v53 = v37;
            v54 = 2048;
            v55 = v39;
            v56 = 2048;
            v57 = v41;
            v58 = 2048;
            v59 = v42;
            v60 = 2048;
            v61 = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMMachTime")), "unsignedLongLongValue");
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu", buf, 0x48u);
          }
        }
        return;
      }
      v25 = objc_msgSend(-[NSDictionary computedTimeZone](a1, "computedTimeZone"), "olsonName");
      if (!v25)
      {
        v14 = (NSDictionary *)&__NSDictionary0__struct;
        goto LABEL_25;
      }
      v62 = CFSTR("TMTimeZone");
      v63 = v25;
      v23 = (NSNumber **)&v63;
      v24 = &v62;
    }
    v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
LABEL_23:
    v14 = v13;
    goto LABEL_24;
  }
  v14 = sub_100004E7C(a1);
  v19 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v49 = (const __CFString *)v14;
    v20 = "Returning reference time to client: %@";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
  }
LABEL_24:
  if (v14)
LABEL_25:
    (*(void (**)(uint64_t, NSDictionary *))(a3 + 16))(a3, v14);
}

void sub_100006254(uint64_t a1, uint64_t a2)
{
  xpc_object_t reply;
  void *v5;
  char *v6;
  _QWORD applier[5];

  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEBUG))
    sub_10001AC14();
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  v5 = (void *)_CFXPCCreateXPCObjectFromCFObject(a2);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_100004E60;
  applier[3] = &unk_1000287C8;
  applier[4] = reply;
  xpc_dictionary_apply(v5, applier);
  xpc_release(v5);
  v6 = xpc_copy_description(reply);
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEBUG))
  {
    sub_10001ABB0();
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v6)
LABEL_5:
    free(v6);
LABEL_6:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  xpc_release(reply);
}

id sub_10000656C(id result, uint64_t a2)
{
  if (result)
  {
    if (qword_1000336B0 != -1)
      dispatch_once(&qword_1000336B0, &stru_100028C08);
    return objc_msgSend(objc_msgSend((id)qword_1000336B8, "objectForKeyedSubscript:", a2), "BOOLValue");
  }
  return result;
}

double sub_10000678C(uint64_t *a1, double *a2)
{
  size_t v4;
  int v5;
  int *v6;
  int v7;
  char *v8;
  double v9;
  double v10;
  size_t v13;
  _BYTE buf[12];
  __int16 v15;
  int v16;
  unint64_t v17;
  uint64_t v18;

  if (qword_100033610 != -1)
    dispatch_once(&qword_100033610, &stru_100028A28);
  if (byte_100033618)
  {
    if (qword_100033678 != -1)
      dispatch_once(&qword_100033678, &stru_100028A68);
    v4 = 16;
    if (!a1)
      v4 = 8;
    v13 = v4;
    v5 = 3;
    while (sysctl((int *)&unk_100033668, qword_100033670, &v17, &v13, 0, 0))
    {
      v6 = __error();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v7 = *v6;
        v8 = strerror(v7);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v8;
        v15 = 1024;
        v16 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CoreTime: Could not get kern.monotonicclock_usecs: %s(%d)\n", buf, 0x12u);
      }
      if (!--v5)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10001AE6C();
          if (a1)
LABEL_26:
            *a1 = 0;
        }
        else if (a1)
        {
          goto LABEL_26;
        }
        v9 = -1.0;
        if (a2)
          *a2 = -1.0;
        return v9;
      }
    }
    v10 = (double)v17;
    if (a2)
      *a2 = 0.0005;
    v9 = v10 / 1000000.0;
    if (v13 != 16)
    {
      v18 = mach_absolute_time();
      v9 = v9 + *(double *)&qword_100033680;
      if (a2)
        *a2 = *(double *)&qword_100033680 + *a2;
    }
    if (a1)
      *a1 = v18;
  }
  else
  {
    *(_QWORD *)buf = 0;
    v17 = 0;
    mach_get_times(buf, &v17, 0);
    if (a1)
      *a1 = *(_QWORD *)buf;
    return TMConvertTicksToSeconds(v17);
  }
  return v9;
}

double sub_100006A10()
{
  if (qword_100033628 != -1)
    dispatch_once(&qword_100033628, &stru_100028A48);
  return *(double *)&qword_100033620;
}

double TMConvertTicksToSeconds(unint64_t a1)
{
  double v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v7;

  v2 = *(double *)&qword_1000336A8;
  if (*(double *)&qword_1000336A8 == 0.0)
  {
    v7 = 0;
    sub_10000A5B0((uint32_t *)&v7 + 1, (uint32_t *)&v7);
    v3 = 1000000000;
    v4 = HIDWORD(v7);
    do
    {
      v5 = v4;
      v4 = v3;
      v3 = v5 % v3;
    }
    while (v3);
    v2 = (double)(HIDWORD(v7) / v4) / (double)(v7 * (unint64_t)(0x3B9ACA00 / v4));
    *(double *)&qword_1000336A8 = v2;
  }
  return v2 * (double)a1;
}

double sub_100006AF0(unint64_t a1, unint64_t a2)
{
  if (a2 <= a1)
    return TMConvertTicksToSeconds(a1 - a2);
  else
    return TMConvertTicksToSeconds(a2 - a1);
}

TMTimeSynthesizerStates *sub_100006D88(uint64_t a1, double a2)
{
  TMTimeSynthesizerStates *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (!a1 || !*(_BYTE *)(a1 + 120))
    return 0;
  v4 = objc_alloc_init(TMTimeSynthesizerStates);
  v5 = a2 - *(double *)(a1 + 8);
  -[TMTimeSynthesizerStates setRtc:](v4, "setRtc:", a2);
  -[TMTimeSynthesizerStates setUtc:](v4, "setUtc:", *(double *)(a1 + 16) + *(double *)(a1 + 24) * v5);
  -[TMTimeSynthesizerStates setRateSf:](v4, "setRateSf:", *(double *)(a1 + 24));
  if (v5 >= 0.0)
    v6 = v5;
  else
    v6 = -v5;
  v7 = *(double *)(a1 + 88);
  v8 = v6 * v6 * v7 * 0.5;
  v9 = v6 * v7;
  -[TMTimeSynthesizerStates setUtc_var:](v4, "setUtc_var:", v6 * (v6 * v6) * v7 / 3.0+ *(double *)(a1 + 48)+ (*(double *)(a1 + 64) + *(double *)(a1 + 64)) * v6+ *(double *)(a1 + 56) * (v6 * v6));
  -[TMTimeSynthesizerStates setUtc_sf_cov:](v4, "setUtc_sf_cov:", v8 + *(double *)(a1 + 64) + *(double *)(a1 + 56) * v6);
  -[TMTimeSynthesizerStates setSf_var:](v4, "setSf_var:", v9 + *(double *)(a1 + 56));
  return v4;
}

uint64_t sub_1000073F4(void *a1, void *a2)
{
  uint64_t v2;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;

  v2 = (uint64_t)a1;
  if (a1)
  {
    v4 = objc_msgSend(a1, "lastQualityTime");
    if (v4)
    {
      objc_msgSend(a2, "utc_s");
      v6 = v5;
      objc_msgSend(v4, "utc_s");
      v8 = vabdd_f64(v6, v7);
      v9 = *(double *)(v2 + 96);
      objc_msgSend(v4, "utcUnc_s");
      v11 = v10 + v8 * v9;
      objc_msgSend(a2, "rtc_s");
      v13 = v12;
      objc_msgSend(v4, "rtc_s");
      v15 = v13 - v14;
      objc_msgSend(a2, "utc_s");
      v17 = v16;
      objc_msgSend(v4, "utc_s");
      if (vabdd_f64(v15, v17 - v18) <= v11 * 5.0)
      {
        v2 = 1;
LABEL_9:

        return v2;
      }
      v19 = qword_100033720;
      if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(v2 + 128);
        objc_msgSend(a2, "rtc_s");
        v22 = v21;
        objc_msgSend(a2, "utc_s");
        v24 = v23;
        objc_msgSend(a2, "utcUnc_s");
        v26 = v25;
        objc_msgSend(v4, "rtc_s");
        v28 = v27;
        objc_msgSend(v4, "utc_s");
        v30 = v29;
        objc_msgSend(v4, "utcUnc_s");
        v33 = 138414082;
        v34 = v20;
        v35 = 2048;
        v36 = v22;
        v37 = 2048;
        v38 = v24;
        v39 = 2048;
        v40 = v26;
        v41 = 2048;
        v42 = v28;
        v43 = 2048;
        v44 = v30;
        v45 = 2048;
        v46 = v31;
        v47 = 2112;
        v48 = objc_msgSend(v4, "source");
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@,BadReliability,rtc,%.6lf,utc,%.6lf,unc,%.6lf,Rtc,%.6lf,Utc,%.6lf,Unc,%.6lf,Src,%@", (uint8_t *)&v33, 0x52u);
      }
      objc_msgSend((id)v2, "displayLastQualityTime");
    }
    v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

uint64_t sub_10000767C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void sub_100007684()
{
  NSDictionary *v0;
  id v1;
  _QWORD v2[4];
  _QWORD v3[4];

  v2[0] = kCFUserNotificationAlertHeaderKey;
  v2[1] = kCFUserNotificationAlertMessageKey;
  v3[0] = CFSTR("timed problem detected");
  v3[1] = CFSTR("You have encountered a rare issue that is currently being investigated");
  v2[2] = kCFUserNotificationDefaultButtonTitleKey;
  v2[3] = kCFUserNotificationAlternateButtonTitleKey;
  v3[2] = CFSTR("File a radar");
  v3[3] = CFSTR("Dismiss");
  v0 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v1 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v1, "setObject:forKeyedSubscript:", CFSTR("timed is islanded"), CFSTR("Title"));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", CFSTR("CoreTime | All"), CFSTR("ComponentName"));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", CFSTR("1.0"), CFSTR("ComponentVersion"));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", CFSTR("1332142"), CFSTR("ComponentID"));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", CFSTR("Other Bug"), CFSTR("Classification"));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", CFSTR("I Didn't Try"), CFSTR("Reproducibility"));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", CFSTR("Island"), CFSTR("Description"));
  sub_10000780C((CFDictionaryRef)v0, v1);
}

void sub_10000780C(CFDictionaryRef dictionary, void *a2)
{
  __CFUserNotification *v3;
  CFOptionFlags responseFlags;

  v3 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, dictionary);
  responseFlags = 0;
  CFUserNotificationReceiveResponse(v3, 0.0, &responseFlags);
  if ((responseFlags & 3) != 0)
  {
    if (!v3)
      return;
  }
  else
  {
    sub_100007884(a2);
    if (!v3)
      return;
  }
  CFRelease(v3);
}

void sub_100007884(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v2 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithString:", CFSTR("tap-to-radar://new"));
  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a1);
        objc_msgSend(v3, "addObject:", +[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), objc_msgSend(a1, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7))));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_msgSend(v2, "setQueryItems:", v3);
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "openURL:configuration:completionHandler:", objc_msgSend(v2, "URL"), 0, 0);

}

void sub_100008AC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008AD8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100008AF4()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Client exited", v1, 2u);
  }
}

void sub_100008B58(_xpc_connection_s *a1)
{
  _QWORD v2[6];
  _QWORD v3[3];
  char v4;

  xpc_connection_set_target_queue(a1, (dispatch_queue_t)objc_msgSend((id)qword_1000335D8, "workloop"));
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  v4 = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100004F1C;
  v2[3] = &unk_100028818;
  v2[4] = a1;
  v2[5] = v3;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_resume(a1);
  _Block_object_dispose(v3, 8);
}

void sub_100008BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void start()
{
  TMMonotonicClock *v0;
  xpc_connection_t mach_service;
  NSString *v2;
  NSObject *v3;
  id v4;
  NSDirectoryEnumerator *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSObject *v11;
  NSString *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSObject *v15;
  unsigned int v16;
  xpc_connection_t v17;
  TMMonotonicClock *v18;
  id v19;
  NSMutableDictionary *v20;
  _QWORD block[8];
  uint8_t buf[4];
  _QWORD v23[3];
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v19 = objc_alloc_init((Class)NSAutoreleasePool);
  sub_1000136E0();
  qword_1000335E0 = -[TMPreferences initWithDefaults:]([TMPreferences alloc], "initWithDefaults:", +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v0 = [TMMonotonicClock alloc];
  objc_msgSend((id)qword_1000335E0, "RTCMachSyncInterval");
  v18 = -[TMMonotonicClock initWithSyncInterval:](v0, "initWithSyncInterval:");
  qword_1000335E8 = (uint64_t)dispatch_workloop_create("com.apple.timed.workloop");
  mach_service = xpc_connection_create_mach_service("com.apple.timed.xpc", (dispatch_queue_t)qword_1000335E8, 1uLL);
  if ((objc_msgSend((id)qword_1000335E0, "shouldCorrectOnWake") & 1) != 0
    || objc_msgSend((id)qword_1000335E0, "shouldFetchOnWake"))
  {
    sub_1000129CC((uint64_t (*)(_QWORD))sub_10000900C, qword_1000335E8);
  }
  xpc_set_event_stream_handler("com.apple.systemconfiguration", (dispatch_queue_t)qword_1000335E8, &stru_100028858);
  xpc_connection_enable_termination_imminent_event(mach_service);
  v2 = -[NSBundle pathForResource:ofType:](+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/CoreTime.framework")), "pathForResource:ofType:", CFSTR("TimeZoneRules"), CFSTR("plist"));
  v20 = +[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v2);
  if (!v20)
  {
    v3 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23[0] = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "rules plist not found: %@!\n", buf, 0xCu);
    }
    v20 = (NSMutableDictionary *)+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  }
  v17 = mach_service;
  v4 = objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CoreTime.framework"), "stringByAppendingPathComponent:", CFSTR("TimeSources"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = -[NSFileManager enumeratorAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "enumeratorAtPath:", v4);
  v6 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v10, "pathExtension"), "isEqualToString:", CFSTR("bundle")))
        {
          v11 = qword_100033718;
          if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23[0] = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Loading source rules: %@", buf, 0xCu);
          }
          v12 = -[NSBundle pathForResource:ofType:](+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", objc_msgSend(v4, "stringByAppendingPathComponent:", v10)), "pathForResource:ofType:", CFSTR("TimeZoneRules"), CFSTR("plist"));
          if (v12)
          {
            v13 = +[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v12);
            if (v13)
            {
              v14 = v13;
              v15 = qword_100033718;
              if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
              {
                v16 = -[NSMutableDictionary count](v14, "count");
                *(_DWORD *)buf = 67109378;
                LODWORD(v23[0]) = v16;
                WORD2(v23[0]) = 2112;
                *(_QWORD *)((char *)v23 + 6) = CFSTR("TimeZoneRules");
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Loaded %d rules from '%@'", buf, 0x12u);
              }
              -[NSMutableDictionary addEntriesFromDictionary:](v20, "addEntriesFromDictionary:", v14);
            }
          }
        }
      }
      v7 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v7);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009024;
  block[3] = &unk_1000288A8;
  block[4] = v20;
  block[5] = v18;
  block[6] = v4;
  block[7] = v17;
  dispatch_async_and_wait((dispatch_queue_t)qword_1000335E8, block);
  objc_msgSend(v19, "drain");
  while (1)
    -[NSRunLoop run](+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"), "run");
}

void sub_10000900C()
{
  dispatch_async((dispatch_queue_t)qword_1000335E8, &stru_1000288E8);
}

void sub_100009024(uint64_t a1)
{
  TMDaemonCore *v2;
  NSDirectoryEnumerator *v3;
  id v4;
  __int128 v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  unsigned int v11;
  NSObject *v12;
  NSString *v13;
  id v14;
  id v15;
  NSString *v16;
  void *v17;
  _xpc_connection_s *v18;
  NSObject *v19;
  __int128 v20;
  uint8_t v21[8];
  _QWORD handler[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 buf;
  uint64_t v28;
  char v29;
  _BYTE v30[128];

  v2 = [TMDaemonCore alloc];
  qword_1000335D8 = -[TMDaemonCore initWithTimeZoneRules:monotonicClock:preferences:workloop:](v2, "initWithTimeZoneRules:monotonicClock:preferences:workloop:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), qword_1000335E0, qword_1000335E8);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = -[NSFileManager enumeratorAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "enumeratorAtPath:", *(_QWORD *)(a1 + 48));
  v4 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v24;
    *(_QWORD *)&v5 = 138412290;
    v20 = v5;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v8, "pathExtension", v20), "isEqualToString:", CFSTR("bundle")))
        {
          v9 = qword_100033718;
          if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = v20;
            *(_QWORD *)((char *)&buf + 4) = v8;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Loading time source: %@", (uint8_t *)&buf, 0xCu);
          }
          v10 = -[NSBundle principalClass](+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v8)), "principalClass");
          v11 = -[objc_class instancesRespondToSelector:](v10, "instancesRespondToSelector:", "initWithClock:daemonCore:");
          v12 = qword_100033718;
          if (v11)
          {
            if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
            {
              v13 = NSStringFromClass(v10);
              LODWORD(buf) = v20;
              *(_QWORD *)((char *)&buf + 4) = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Loading plugin via [%@ -initWithClock:daemonCore:]", (uint8_t *)&buf, 0xCu);
            }
            v14 = [v10 alloc];
            v15 = objc_msgSend(v14, "initWithClock:daemonCore:", *(_QWORD *)(a1 + 40), qword_1000335D8);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
            {
              v16 = NSStringFromClass(v10);
              LODWORD(buf) = v20;
              *(_QWORD *)((char *)&buf + 4) = v16;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loading plugin via [%@ -init]", (uint8_t *)&buf, 0xCu);
            }
            v15 = objc_alloc_init(v10);
          }
          v17 = v15;
          if (v15)
          {
            objc_msgSend((id)qword_1000335D8, "addPlugin:", v15);

          }
        }
      }
      v4 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v4);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x2020000000;
  v29 = 0;
  v18 = *(_xpc_connection_s **)(a1 + 56);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000093B0;
  handler[3] = &unk_100028880;
  handler[4] = &buf;
  xpc_connection_set_event_handler(v18, handler);
  v19 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Starting XPC listener", v21, 2u);
  }
  xpc_connection_resume(*(xpc_connection_t *)(a1 + 56));
  objc_msgSend((id)qword_1000335D8, "testAndApplySystemTime");
  objc_msgSend((id)qword_1000335D8, "checkActiveTimeSourceRequired");
  _Block_object_dispose(&buf, 8);
}

void sub_100009390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000093B0(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];

  type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      v7 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Listener connection went invalid. Exiting.", (uint8_t *)v8, 2u);
      }
      exit(0);
    }
    if (object == &_xpc_error_termination_imminent)
    {
      v6 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Termination is imminent!", (uint8_t *)v8, 2u);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      objc_msgSend((id)qword_1000335D8, "handleShutdown");
    }
    else
    {
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001AA48();
    }
  }
  else
  {
    v5 = qword_100033718;
    if (type == (xpc_type_t)&_xpc_type_connection)
    {
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      {
        v8[0] = 67109120;
        v8[1] = xpc_connection_get_pid((xpc_connection_t)object);
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "New connection from PID: %d", (uint8_t *)v8, 8u);
      }
      sub_100008B58((_xpc_connection_s *)object);
    }
    else if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
    {
      sub_10001AC78(v5);
    }
  }
}

void sub_1000095BC(id a1)
{
  const __CFString *v1;
  const __CFString *v2;

  v1 = CFSTR("TMCommand");
  v2 = CFSTR("TMSystemWillWake");
  objc_msgSend((id)qword_1000335D8, "executeCommand:withHandler:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v2, &v1, 1), 0);
}

void sub_10000964C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

__CFString *sub_100009658(unint64_t a1)
{
  __CFString **v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 >= 0x1C)
  {
    v3 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001ACB8(a1, v3, v4, v5, v6, v7, v8, v9);
    v2 = off_100029188;
  }
  else
  {
    v2 = off_100028AA8[a1];
  }
  return *v2;
}

uint64_t sub_1000096C4(uint64_t a1)
{
  id v2;

  if (qword_1000335F8 != -1)
    dispatch_once(&qword_1000335F8, &stru_1000289E8);
  v2 = objc_msgSend((id)qword_1000335F0, "objectForKeyedSubscript:", a1);
  if (v2)
    return (uint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  else
    return 27;
}

void sub_10000972C(id a1)
{
  _QWORD v1[28];
  _QWORD v2[28];

  v1[0] = CFSTR("NITZ");
  v1[1] = CFSTR("CDMA");
  v2[0] = &off_10002C260;
  v2[1] = &off_10002C278;
  v1[2] = CFSTR("GPS");
  v1[3] = CFSTR("LocationServer");
  v2[2] = &off_10002C290;
  v2[3] = &off_10002C2A8;
  v1[4] = CFSTR("HarvestServer");
  v1[5] = CFSTR("NTP");
  v2[4] = &off_10002C2C0;
  v2[5] = &off_10002C2D8;
  v1[6] = CFSTR("NTPLowConfidence");
  v1[7] = CFSTR("NTPPacket");
  v2[6] = &off_10002C2F0;
  v2[7] = &off_10002C308;
  v1[8] = CFSTR("MobileLockdown");
  v1[9] = CFSTR("iTunesStoreServer");
  v2[8] = &off_10002C320;
  v2[9] = &off_10002C338;
  v1[10] = CFSTR("Location");
  v1[11] = CFSTR("Computed");
  v2[10] = &off_10002C350;
  v2[11] = &off_10002C368;
  v1[12] = CFSTR("LocationAndNetwork");
  v1[13] = CFSTR("TimeSourceGnssValidPos");
  v2[12] = &off_10002C380;
  v2[13] = &off_10002C398;
  v1[14] = CFSTR("TimeSourceGnss");
  v1[15] = CFSTR("TimeSourceBBTimeTransfer");
  v2[14] = &off_10002C3B0;
  v2[15] = &off_10002C3C8;
  v1[16] = CFSTR("TimeSourceBBTimeTagging");
  v1[17] = CFSTR("TimeSourceUnknown");
  v2[16] = &off_10002C3E0;
  v2[17] = &off_10002C3F8;
  v1[18] = CFSTR("TMLSSourceComputed");
  v1[19] = CFSTR("TMLSSourceComputedReliable");
  v2[18] = &off_10002C410;
  v2[19] = &off_10002C428;
  v1[20] = CFSTR("TMLSSourceUser");
  v1[21] = CFSTR("TMLSSourceDevice");
  v2[20] = &off_10002C440;
  v2[21] = &off_10002C458;
  v1[22] = CFSTR("FilesystemTimestamp");
  v1[23] = CFSTR("AirPlaySendingDeviceTime");
  v2[22] = &off_10002C470;
  v2[23] = &off_10002C488;
  v1[24] = CFSTR("ProxBuddy");
  v1[25] = CFSTR("APNS");
  v2[24] = &off_10002C4A0;
  v2[25] = &off_10002C4B8;
  v1[26] = CFSTR("Accessory");
  v1[27] = CFSTR("Unknown");
  v2[26] = &off_10002C4D0;
  v2[27] = &off_10002C4E8;
  qword_1000335F0 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v2, v1, 28);
}

uint64_t sub_100009A3C(uint64_t a1)
{
  id v2;

  if (qword_100033608 != -1)
    dispatch_once(&qword_100033608, &stru_100028A08);
  v2 = objc_msgSend((id)qword_100033600, "objectForKeyedSubscript:", a1);
  if (v2)
    return (uint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  else
    return 23;
}

void sub_100009AA0(id a1)
{
  _QWORD v1[24];
  _QWORD v2[24];

  v1[0] = CFSTR("TMSetSourceTime");
  v1[1] = CFSTR("TMSetSourceAvailable");
  v2[0] = &off_10002C500;
  v2[1] = &off_10002C518;
  v1[2] = CFSTR("TMSetSourceUnavailable");
  v1[3] = CFSTR("TMSetSourceTimeZone");
  v2[2] = &off_10002C530;
  v2[3] = &off_10002C548;
  v1[4] = CFSTR("TMSetAutomaticTimeEnabled");
  v1[5] = CFSTR("TMIsAutomaticTimeEnabled");
  v2[4] = &off_10002C560;
  v2[5] = &off_10002C578;
  v1[6] = CFSTR("TMSetAutomaticTimeZoneEnabled");
  v1[7] = CFSTR("TMIsAutomaticTimeZoneEnabled");
  v2[6] = &off_10002C590;
  v2[7] = &off_10002C5A8;
  v1[8] = CFSTR("TMIsTimeZoneConfirmed");
  v1[9] = CFSTR("TMConfirmTimeZone");
  v2[8] = &off_10002C5C0;
  v2[9] = &off_10002C5D8;
  v1[10] = CFSTR("TMGetReferenceTime");
  v1[11] = CFSTR("TMSetReferenceUnreliable");
  v2[10] = &off_10002C5F0;
  v2[11] = &off_10002C608;
  v1[12] = CFSTR("TMIsLocationTimeZoneActive");
  v1[13] = CFSTR("TMIsBBTimeActive");
  v2[12] = &off_10002C620;
  v2[13] = &off_10002C638;
  v1[14] = CFSTR("TMProvideBBTime");
  v1[15] = CFSTR("TMReceiveNtpPacket");
  v2[14] = &off_10002C650;
  v2[15] = &off_10002C668;
  v1[16] = CFSTR("TMSetupTime");
  v1[17] = CFSTR("TMSetupTimeZone");
  v2[16] = &off_10002C680;
  v2[17] = &off_10002C698;
  v1[18] = CFSTR("TMProvideCellularTimeZone");
  v1[19] = CFSTR("TMResetTimeZone");
  v2[18] = &off_10002C6B0;
  v2[19] = &off_10002C6C8;
  v1[20] = CFSTR("TMSystemWillWake");
  v1[21] = CFSTR("TMFetchNTP");
  v2[20] = &off_10002C6E0;
  v2[21] = &off_10002C6F8;
  v1[22] = CFSTR("TMResetToFirstLaunch");
  v1[23] = CFSTR("TMUnknown");
  v2[22] = &off_10002C710;
  v2[23] = &off_10002C728;
  qword_100033600 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v2, v1, 24);
}

uint64_t sub_100009CF0()
{
  if (qword_100033610 != -1)
    dispatch_once(&qword_100033610, &stru_100028A28);
  return byte_100033618;
}

void sub_100009D30(id a1)
{
  size_t v1;
  int v2[8];

  v1 = 8;
  byte_100033618 = sysctlnametomib("kern.monotonicclock_usecs", v2, &v1) == 0;
}

void sub_100009DA0(id a1)
{
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  u_int v9[2];
  size_t v10;
  unint64_t v11;
  int v12[8];

  v10 = 8;
  v11 = 0;
  *(_QWORD *)v9 = 8;
  if (sysctlnametomib("kern.monotonicclock_rate_usecs", v12, (size_t *)v9))
  {
    v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1)
      sub_10001AD90(v1, v2, v3, v4, v5, v6, v7, v8);
  }
  else if (sysctl(v12, v9[0], &v11, &v10, 0, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001AD1C();
  }
  else
  {
    *(double *)&qword_100033620 = (double)v11 / 1000000.0;
  }
}

double sub_100009E7C()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  size_t v11;
  unint64_t v12;

  if (qword_100033610 != -1)
    dispatch_once(&qword_100033610, &stru_100028A28);
  if (!byte_100033618)
  {
    v9 = mach_continuous_time();
    return TMConvertTicksToSeconds(v9);
  }
  v12 = 0;
  if ((byte_100033630 & 1) != 0)
    goto LABEL_12;
  if (!sysctlnametomib("kern.monotonicclock_usecs", dword_100033634, (size_t *)&dword_1000332C8))
  {
    if (qword_100033628 != -1)
      dispatch_once(&qword_100033628, &stru_100028A48);
    *(double *)&qword_100033658 = *(double *)&qword_100033620 * 0.5;
    qword_100033660 = 0x412E848000000000;
    byte_100033630 = 1;
LABEL_12:
    v11 = 8;
    if (!sysctl(dword_100033634, dword_1000332C8, &v12, &v11, 0, 0))
      return (double)v12 / *(double *)&qword_100033660 + *(double *)&qword_100033658;
    v8 = -1.0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001ADC4();
    return v8;
  }
  v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  v8 = -1.0;
  if (v0)
    sub_10001AE38(v0, v1, v2, v3, v4, v5, v6, v7);
  return v8;
}

void sub_10000A00C(id a1)
{
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  qword_100033670 = 2;
  if (sysctlnametomib("kern.monotonicclock_usecs", (int *)&unk_100033668, (size_t *)&qword_100033670))
  {
    v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1)
      sub_10001AEE8(v1, v2, v3, v4, v5, v6, v7, v8);
    qword_100033670 = 0;
  }
  if (qword_100033628 != -1)
    dispatch_once(&qword_100033628, &stru_100028A48);
  *(double *)&qword_100033680 = *(double *)&qword_100033620 * 0.5;
}

unint64_t sub_10000A0A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  if (qword_100033610 != -1)
    dispatch_once(&qword_100033610, &stru_100028A28);
  if (!byte_100033618)
  {
    v15 = 0;
    v16 = 0;
    v14 = 0;
    mach_get_times(0, &v16, &v14);
    v10 = v15 + 1000000000 * v14;
    return v10 - sub_10000A248(v16);
  }
  if (a1 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10001B018(a1, v2, v3, v4, v5, v6, v7, v8);
  v14 = a1 / 1000;
  if (qword_100033698 != -1)
    dispatch_once(&qword_100033698, &stru_100028A88);
  v16 = 0;
  v13 = 8;
  if ((unint64_t)(a1 + 999) >= 0x7CF)
    v9 = &v14;
  else
    v9 = 0;
  if (sysctl((int *)&unk_100033688, qword_100033690, &v16, (size_t *)&v13, v9, 8 * ((unint64_t)(a1 + 999) > 0x7CE)))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001AFA4();
  }
  else
  {
    v12 = v13;
    if (v13 == 8)
      return 1000 * v16;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001AF1C(v12);
  }
  return 0;
}

unint64_t sub_10000A248(unint64_t a1)
{
  unsigned int v2;
  unint64_t v3;
  uint8_t v5[16];

  v2 = dword_1000336A0;
  if (!dword_1000336A0)
  {
    sub_10000A5B0((uint32_t *)&dword_1000336A0, (uint32_t *)&dword_1000336A4);
    v2 = dword_1000336A0;
    if (!dword_1000336A0)
      sub_10001B084();
    if (!dword_1000336A4)
      sub_10001B0AC();
  }
  if (is_mul_ok(v2, a1))
  {
    v3 = v2 * a1 / dword_1000336A4;
    if ((v3 & 0x8000000000000000) != 0)
      panic("TMConvertTicksToNanoTime not possible due to signed overflow");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Overflow during TMConvertTicksToNanoTime conversion, falling back to reciprocal ratio", v5, 2u);
      v2 = dword_1000336A0;
    }
    return a1 / (dword_1000336A4 / v2);
  }
  return v3;
}

void sub_10000A340(id a1)
{
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  qword_100033690 = 2;
  if (sysctlnametomib("kern.monotoniclock_offset_usecs", (int *)&unk_100033688, (size_t *)&qword_100033690))
  {
    v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1)
      sub_10001B0D4(v1, v2, v3, v4, v5, v6, v7, v8);
    qword_100033690 = 0;
  }
}

BOOL sub_10000A39C(double a1)
{
  BOOL v2;

  if (a1 >= -1.0 && a1 <= 1.0)
    return 0;
  v2 = -1.0 - kCFAbsoluteTimeIntervalSince1970 > a1 || 1.0 - kCFAbsoluteTimeIntervalSince1970 < a1;
  if (!v2 || a1 >= -6.31456128e10 && a1 <= -6.31456128e10)
    return 0;
  if (1.0 - kCFAbsoluteTimeIntervalSince1904 < a1)
    return 1;
  return -1.0 - kCFAbsoluteTimeIntervalSince1904 > a1;
}

BOOL sub_10000A430(int a1)
{
  return (a1 + 960) < 0x781;
}

BOOL sub_10000A440(unsigned int a1)
{
  return a1 < 0x3E8;
}

CFTimeInterval sub_10000A44C(uint64_t *a1, long double a2)
{
  CFTimeInterval result;

  sub_10000A4A8((uint64_t)a1, a2);
  result = kCFAbsoluteTimeIntervalSince1970 + (double)*a1;
  *a1 = (uint64_t)result;
  return result;
}

uint64_t sub_10000A4A8(uint64_t a1, long double a2)
{
  double v3;
  uint64_t result;
  BOOL v5;
  BOOL v6;
  double __y;

  __y = 0.0;
  v3 = modf(a2, &__y);
  result = 0;
  if (fabs(__y) != INFINITY)
  {
    if (__y < 9.22337204e18)
    {
      v6 = __y == -9.22337204e18;
      v5 = __y >= -9.22337204e18;
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    if (!v6 && v5)
    {
      *(_QWORD *)a1 = (uint64_t)__y;
      *(_DWORD *)(a1 + 8) = (int)(v3 * 1000000.0);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double sub_10000A53C(uint64_t a1, int a2)
{
  return (double)a2 / 1000000.0 + (double)(a1 - (uint64_t)kCFAbsoluteTimeIntervalSince1970);
}

double sub_10000A56C(double a1, double a2)
{
  if (a2 < 0.0)
    a2 = -a2;
  return a1 + a2 * 0.00002;
}

uint64_t sub_10000A588(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (!(_DWORD)a2)
    return a1;
  do
  {
    v2 = a2;
    a2 = a1 % a2;
    LODWORD(a1) = v2;
  }
  while ((_DWORD)a2);
  return v2;
}

uint64_t sub_10000A5B0(uint32_t *a1, uint32_t *a2)
{
  uint64_t result;
  uint32_t denom;
  uint32_t v6;
  uint32_t numer;
  uint32_t v8;
  mach_timebase_info info;

  info = 0;
  result = mach_timebase_info(&info);
  if ((_DWORD)result)
    sub_10001B108();
  denom = info.denom;
  if (info.denom)
  {
    v6 = info.denom;
    numer = info.numer;
    do
    {
      v8 = v6;
      v6 = numer % v6;
      numer = v8;
    }
    while (v6);
  }
  else
  {
    v8 = info.numer;
  }
  *a1 = info.numer / v8;
  *a2 = denom / v8;
  return result;
}

double sub_10000A628(unint64_t a1, unint64_t a2)
{
  if (a2 >= a1)
    return TMConvertTicksToSeconds(a2 - a1);
  else
    return -TMConvertTicksToSeconds(a1 - a2);
}

void sub_10000A654(__CFNotificationCenter *a1, const __CFString *a2, const void *a3, CFNotificationSuspensionBehavior a4, void *aBlock)
{
  void *v9;
  void *v10;

  v9 = _Block_copy(aBlock);
  v10 = _Block_copy(v9);
  CFNotificationCenterAddObserver(a1, v10, (CFNotificationCallback)sub_10000A6AC, a2, a3, a4);
}

void sub_10000A6AC(__CFNotificationCenter *a1, uint64_t (**a2)(_QWORD, _QWORD), const __CFString *a3, const void *a4)
{
  if ((((uint64_t (**)(_QWORD, __CFNotificationCenter *))a2)[2](a2, a1) & 1) == 0)
  {
    CFNotificationCenterRemoveObserver(a1, a2, a3, a4);
    _Block_release(a2);
  }
}

void sub_10000A718(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A740(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

char *sub_10000A764(int *a1)
{
  return strerror(*a1);
}

int *sub_10000A76C()
{
  return __error();
}

int *sub_10000A774()
{
  return __error();
}

id *sub_10000A77C(id *result)
{
  id *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result[16], "emptyPath:", CFSTR("/var/db/timed/com.apple.timed.plist"));
    objc_msgSend(v1[2], "reset");
    result = (id *)objc_msgSend(v1[3], "reset");
    if ((unint64_t)v1[14] <= 9)
      v1[14] = 0;
  }
  return result;
}

void sub_10000A7D0(id *a1, void *a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint8_t *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[2];
  __int16 v13;

  if (a1)
  {
    v6 = objc_msgSend(a2, "code");
    if (v6 == (id)3)
    {
      v9 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "soft reset due to rtc rollback", v11, 2u);
      }
      sub_10000A77C(a1);
      objc_msgSend(a1, "rtcDidReset");
      objc_msgSend(a1, "setSourceTime:", objc_msgSend(a3, "dictionary"));
    }
    else
    {
      if (v6 == (id)5)
      {
        v7 = qword_100033718;
        if (!os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
        {
LABEL_14:
          objc_msgSend(a1, "setAccessoryUnc_s:", 1.79769313e308);
          return;
        }
        *(_WORD *)buf = 0;
        v8 = buf;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "reset accessory uncertainty", v8, 2u);
        goto LABEL_14;
      }
      if (v6 == (id)4)
      {
        if (!objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", CFSTR("Accessory")))
          return;
        v7 = qword_100033718;
        if (!os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
          goto LABEL_14;
        v13 = 0;
        v8 = (uint8_t *)&v13;
        goto LABEL_13;
      }
      v10 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001B130(a2, v10);
    }
  }
}

void sub_10000A96C(id *a1, void *a2, void *a3)
{
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (a1)
  {
    if (objc_msgSend(a2, "code") == (id)6)
    {
      if (objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", CFSTR("Accessory")))
      {
        v6 = qword_100033718;
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "accessory input rejected by secure filter", buf, 2u);
          v6 = qword_100033718;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "resetting secure filter, time filter, purging cache", v8, 2u);
        }
        sub_10000A77C(a1);
        objc_msgSend(a1, "setSourceTime:", objc_msgSend(a3, "dictionary"));
      }
    }
    else
    {
      v7 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001B1A4(a2, v7);
    }
  }
}

NSDictionary *sub_10000AB2C(uint64_t a1)
{
  const __CFString *v2;
  NSNumber *v3;

  v2 = CFSTR("rtcResetCount");
  v3 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 140));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1);
}

uint64_t sub_10000B0C8(uint64_t result)
{
  uint64_t v1;
  size_t v2;
  uuid_t uu;
  char in[16];
  _BYTE v5[21];

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 104);
    if (!result)
    {
      *(_OWORD *)in = 0u;
      memset(v5, 0, sizeof(v5));
      v2 = 37;
      if (!sysctlbyname("kern.bootsessionuuid", in, &v2, 0, 0))
      {
        if (v2 != 37)
          sub_10001B250();
        memset(uu, 0, sizeof(uu));
        if (!uuid_parse(in, uu))
        {
          *(_QWORD *)(v1 + 104) = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", uu);
          if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEBUG))
            sub_10001B218();
        }
      }
      return *(_QWORD *)(v1 + 104);
    }
  }
  return result;
}

void sub_10000B1C0(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("TMTimeZoneConfirmedNotification"), 0, 0, 0);
  }
}

_QWORD *sub_10000B1F4(_QWORD *result)
{
  _QWORD *v1;
  int v2;
  void *v3;

  if (result)
  {
    v1 = result;
    v2 = *((unsigned __int8 *)result + 40);
    v3 = (void *)result[7];
    if (v2)
      objc_msgSend(v3, "NTPSchedulingInterval");
    else
      objc_msgSend(v3, "NTPUnsetSchedulingInterval");
    return objc_msgSend((id)v1[4], "setSchedulingInterval:");
  }
  return result;
}

_QWORD *sub_10000B314(_QWORD *result, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (result)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (void *)result[6];
    result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
          if ((objc_opt_respondsToSelector(v9, a2) & 1) != 0)
            objc_msgSend(v9, "performSelector:withObject:", a2, a3);
          v8 = (_QWORD *)((char *)v8 + 1);
        }
        while (v6 != v8);
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v6 = result;
      }
      while (result);
    }
  }
  return result;
}

void *sub_10000B460(void *a1, const char *a2)
{
  if (a1)
    return objc_msgSend(a1, "isAutomaticTimeEnabled");
  return a1;
}

BOOL sub_10000B46C(_BOOL8 result, uint64_t a2, double a3)
{
  uint64_t v5;
  int v6;
  int *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSDate *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  timeval v15;
  uint8_t buf[4];
  __darwin_time_t tv_sec;
  __int16 v18;
  uint64_t tv_usec;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;

  if (result)
  {
    v5 = result;
    v15.tv_sec = 0;
    *(_QWORD *)&v15.tv_usec = 0;
    sub_10000A44C(&v15.tv_sec, a3);
    if (!v6)
    {
      v10 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001B278(a2, v10, v11, a3);
      objc_msgSend(*(id *)(v5 + 16), "reset");
      return 0;
    }
    if (settimeofday(&v15, 0))
    {
      v7 = __error();
      v8 = qword_100033718;
      result = os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      v9 = *v7;
      *(_DWORD *)buf = 134218754;
      tv_sec = v15.tv_sec;
      v18 = 2048;
      tv_usec = v15.tv_usec;
      v20 = 1024;
      v21 = v9;
      v22 = 2080;
      v23 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "settimeofday(%lld.%.6lld) failed %{darwin.errno}d; cannot set system time from %s",
        buf,
        0x26u);
      return 0;
    }
    v12 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3);
      *(_DWORD *)buf = 138412546;
      tv_sec = (__darwin_time_t)v13;
      v18 = 2080;
      tv_usec = a2;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting system time to %@ from %s", buf, 0x16u);
    }
    objc_msgSend(*(id *)(v5 + 128), "touchPath:tv:", CFSTR("/var/db/timed/com.apple.timed.plist"), &v15);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SignificantTimeChangeNotification"), 0, 0, 0);
    return 1;
  }
  return result;
}

void sub_10000B66C(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SignificantTimeChangeNotification"), 0, 0, 0);
  }
}

BOOL sub_10000B6A0(double a1, double a2, double a3)
{
  long double v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  timex v16;
  double __y;
  __int16 v18;
  uint64_t offset;
  __int16 v20;
  uint64_t freq;
  __int16 v22;
  uint64_t maxerror;

  objc_opt_self();
  memset(&v16, 0, sizeof(v16));
  if (a1 >= 9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a1);
  if (a1 <= -9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a1);
  __y = 0.0;
  v6 = modf(a1, &__y);
  v7 = llround(v6 * 1000000000.0) + 1000000000 * (uint64_t)__y;
  v16.offset = v7;
  v16.status = 129;
  if (a2 == 1.0)
  {
    v8 = 0;
    v9 = 8213;
  }
  else
  {
    v8 = vcvtd_n_s64_f64((a2 + -1.0) * 1000000.0, 0x10uLL);
    v16.freq = v8;
    v9 = 8215;
  }
  v16.modes = v9;
  v16.maxerror = (uint64_t)(a3 * 1000000.0);
  v10 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    __y = COERCE_DOUBLE(__PAIR64__(v9, 67109888));
    v18 = 2048;
    offset = v7;
    v20 = 2048;
    freq = v8;
    v22 = 2048;
    maxerror = (uint64_t)(a3 * 1000000.0);
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "cmd,ntp_adjtime:in,modes,%x,offset_us,%ld,freq_scaled,%ld,maxerror_us,%ld", (uint8_t *)&__y, 0x26u);
  }
  v11 = ntp_adjtime(&v16);
  if (v11)
  {
    v12 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001B2EC(v11, v12, v13, a1);
  }
  else
  {
    v14 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      __y = COERCE_DOUBLE(__PAIR64__(v16.modes, 67109888));
      v18 = 2048;
      offset = v16.offset;
      v20 = 2048;
      freq = v16.freq;
      v22 = 2048;
      maxerror = v16.maxerror;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "cmd,ntp_adjtime:out,modes,%x,offset_us,%ld,freq_scaled,%ld,maxerror_us,%ld", (uint8_t *)&__y, 0x26u);
    }
  }
  return v11 == 0;
}

id sub_10000B9A0(id result)
{
  void *v1;

  if (result)
  {
    v1 = result;
    -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TMSystemTimeChanged"), result, &__NSDictionary0__struct);
    return objc_msgSend(v1, "testAndApplySystemTime");
  }
  return result;
}

void sub_10000BA28(id *a1, int a2)
{
  int v3;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  CFAbsoluteTime Current;
  id v12;
  NSObject *v13;
  _QWORD v14[11];
  int v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;

  if (a1)
  {
    v3 = a2 - 1;
    if (a2 >= 1)
    {
      v5 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v17 = a2;
        v18 = 1024;
        v19 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "testAndApplySystemTime,previousCount,%d,retrySystemTimeCount,%d", buf, 0xEu);
      }
      v6 = objc_msgSend(a1, "timeProvider");
      objc_msgSend(objc_msgSend(a1, "clock"), "coarseMonotonicTime");
      v7 = objc_msgSend(v6, "timeAtRtc:");
      if (v7)
      {
        v8 = v7;
        if (objc_msgSend(a1[3], "isRunning")
          && objc_msgSend(a1[7], "shouldClamp")
          && v6 == a1[2]
          && (objc_msgSend(a1[3], "intersects:", v8) & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
            sub_10001B360();
          objc_msgSend(a1[2], "reset");
        }
        else
        {
          v9 = os_transaction_create("_testAndApplySystemTime");
          v10 = objc_msgSend(objc_msgSend(a1, "clock"), "machTime");
          Current = CFAbsoluteTimeGetCurrent();
          v12 = objc_msgSend(objc_msgSend(a1, "clock"), "machTime");
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_10000BC80;
          v14[3] = &unk_100028BE8;
          v14[4] = v8;
          v14[5] = a1;
          *(CFAbsoluteTime *)&v14[7] = Current;
          v14[8] = sub_100006AF0((unint64_t)v10, (unint64_t)v12);
          v14[9] = v10;
          v14[10] = v12;
          v15 = a2;
          v14[6] = v9;
          objc_msgSend(objc_msgSend(a1, "clock"), "montonicTimeForMachTime:toQueue:withCompletionHandler:", v10, objc_msgSend(a1, "workloop"), v14);
        }
      }
      else
      {
        v13 = qword_100033718;
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No time to use for system time", buf, 2u);
        }
      }
    }
  }
}

void sub_10000BC80(uint64_t a1, long double a2, double a3)
{
  id *v6;
  double v7;
  long double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  NSObject *v35;
  unint64_t v36;
  NSObject *v37;
  NSDate *v38;
  id v39;
  IOReturn v40;
  int v41;
  NSObject *v42;
  double v43;
  char v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *i;
  void *v54;
  double v55;
  NSObject *v56;
  NSObject *v57;
  unint64_t v58;
  uint64_t v59;
  int v60;
  double v61;
  _QWORD v62[10];
  BOOL v63;
  char v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  IOPMAssertionID AssertionID;
  _BYTE __y[12];
  __int16 v71;
  int64_t v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  double v76;
  __int16 v77;
  long double v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  double v84;
  __int16 v85;
  int v86;
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];

  v6 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "propagatedTimeAtRTC:");
  v8 = v7;
  if (v7 >= 9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&v7);
  if (v8 <= -9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&v8);
  *(_QWORD *)__y = 0;
  v9 = modf(v8, (long double *)__y);
  v10 = *(double *)__y;
  if (a2 >= 9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a2);
  if (a2 <= -9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a2);
  *(_QWORD *)__y = 0;
  v11 = modf(a2, (long double *)__y);
  v12 = *(double *)__y;
  *(_QWORD *)__y = 0;
  v13 = modf(978307200.0, (long double *)__y);
  if (a2 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001B4E4();
LABEL_29:
    sub_10000BA28(*(_QWORD *)(a1 + 40), (*(_DWORD *)(a1 + 88) - 1));
    goto LABEL_30;
  }
  v61 = a2;
  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    v15 = v13;
    v16 = a3;
    v17 = *(double *)__y;
    if (objc_msgSend(v14, "isAutomaticTimeEnabled"))
    {
      v18 = (uint64_t)v10 - (uint64_t)v12 + (uint64_t)v17;
      v19 = llround(v9 * 1000000000.0) - llround(v11 * 1000000000.0) + llround(v15 * 1000000000.0);
      v20 = *(double *)(a1 + 64);
      v21 = v8 - *(double *)(a1 + 56);
      if (v21 >= 0.0)
        v22 = v8 - *(double *)(a1 + 56);
      else
        v22 = -v21;
      v23 = *(double *)(*(_QWORD *)(a1 + 40) + 64);
      v24 = v20 > 0.00416666667;
      if (v20 > fabs(v21 * 0.5))
        goto LABEL_16;
      if (v22 <= v23)
      {
        objc_msgSend(*v6, "sf");
        v47 = v46;
        objc_msgSend(*v6, "utcUnc_s");
        if (sub_10000B6A0(v21, v47, v48))
        {
          v60 = v24;
          v26 = 1;
          objc_msgSend(*(id *)(a1 + 40), "setSystemTimeSet:", 1);
          v68 = 0u;
          v66 = 0u;
          v67 = 0u;
          v65 = 0u;
          v49 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
          if (v50)
          {
            v51 = v50;
            v58 = v19;
            v59 = v18;
            v52 = *(_QWORD *)v66;
            do
            {
              for (i = 0; i != v51; i = (char *)i + 1)
              {
                if (*(_QWORD *)v66 != v52)
                  objc_enumerationMutation(v49);
                v54 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
                if ((objc_opt_respondsToSelector(v54, "didSetTime:withUncertainty:fromSource:lastInput:") & 1) != 0)
                {
                  objc_msgSend(*(id *)(a1 + 32), "utcUnc_s");
                  objc_msgSend(v54, "didSetTime:withUncertainty:fromSource:lastInput:", objc_msgSend(*(id *)(a1 + 32), "source"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "lastInputSource"), (double)v8, v55);
                }
              }
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
            }
            while (v51);
            v26 = 1;
            v19 = v58;
            v18 = v59;
          }
LABEL_20:
          objc_msgSend(*v6, "propagatedUncertaintyAtRTC:", v61);
          v28 = v27;
          v29 = qword_100033720;
          if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
          {
            v30 = CFSTR("adjtime");
            v31 = *(_QWORD *)(a1 + 72);
            v32 = *(_QWORD *)(a1 + 80);
            if (v22 > v23)
              v30 = CFSTR("settimeofday");
            *(_DWORD *)__y = 138414594;
            *(_QWORD *)&__y[4] = CFSTR("apply");
            v71 = 2112;
            v72 = (int64_t)v30;
            v73 = 2048;
            v74 = *(const char **)&v61;
            v75 = 2048;
            v76 = v16;
            v77 = 2048;
            v78 = v8;
            v79 = 2048;
            v80 = v28;
            v81 = 2048;
            v82 = v31;
            v83 = 2048;
            v84 = v21;
            v85 = 1024;
            v86 = v26;
            v87 = 2048;
            v88 = v32;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu,adjust,%.9f,success,%d,after_m,%llu", __y, 0x62u);
          }
          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472;
          v62[2] = sub_10000C5BC;
          v62[3] = &unk_100028BC0;
          v63 = v22 > v23;
          *(double *)&v62[4] = v61;
          *(long double *)&v62[5] = v8;
          v62[6] = v28;
          v33 = *(_QWORD *)(a1 + 80);
          v62[7] = *(_QWORD *)(a1 + 72);
          *(double *)&v62[8] = v21;
          v64 = v26;
          v62[9] = v33;
          AnalyticsSendEventLazy(CFSTR("com.apple.timed.applyTime"), v62);
          v34 = sub_10000A0A8(v19 + 1000000000 * v18);
          v35 = qword_100033720;
          if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
          {
            v36 = sub_10000A0A8(0);
            *(_DWORD *)__y = 134218752;
            *(_QWORD *)&__y[4] = v19 + 1000000000 * v18;
            v71 = 2048;
            v72 = v34;
            v73 = 2048;
            v74 = (const char *)v36;
            v75 = 1024;
            LODWORD(v76) = v34 > 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "cmd,rtc_offset,set,%lld,was,%lld,now,%lld,success,%d", __y, 0x26u);
            if ((v60 & 1) == 0)
              goto LABEL_30;
          }
          else if (!v60)
          {
            goto LABEL_30;
          }
          goto LABEL_29;
        }
        goto LABEL_16;
      }
      AssertionID = 0;
      v40 = IOPMAssertionCreateWithDescription(CFSTR("NoIdleSleepAssertion"), CFSTR("com.apple.timed.settimeofday"), 0, 0, 0, 62.0, CFSTR("TimeoutActionTurnOff"), &AssertionID);
      if (v40)
      {
        v41 = v40;
        v42 = qword_100033718;
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
          sub_10001B40C(v41, v42);
        if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "shouldPowerAssertionsBeOptional"))
        {
          v57 = qword_100033718;
          if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__y = 0;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Failed to take power assertion, not calling settimeofday", __y, 2u);
          }
          goto LABEL_16;
        }
      }
      if (!objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "clock"), "isMachTimeValid:", *(_QWORD *)(a1 + 72)))
      {
        v56 = qword_100033718;
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__y = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Slept while computing time, not calling settimeofday", __y, 2u);
        }
        IOPMAssertionRelease(AssertionID);
        goto LABEL_16;
      }
      v43 = v8
          + sub_100006AF0(*(_QWORD *)(a1 + 72), (unint64_t)objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "clock"), "machTime"));
      v44 = sub_10000B46C(*(_QWORD *)(a1 + 40), (uint64_t)objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "source"), "UTF8String"), v43);
      if ((objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "clock"), "isMachTimeValid:", *(_QWORD *)(a1 + 72)) & 1) == 0&& (v45 = qword_100033718, os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR)))
      {
        if ((sub_10001B3C0(v45, &AssertionID, v44) & 1) != 0)
          goto LABEL_42;
      }
      else
      {
        IOPMAssertionRelease(AssertionID);
        if ((v44 & 1) != 0)
        {
LABEL_42:
          v26 = 1;
LABEL_19:
          v60 = 1;
          goto LABEL_20;
        }
      }
LABEL_16:
      v25 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__y = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to update time", __y, 2u);
      }
      v26 = 0;
      goto LABEL_19;
    }
  }
  v37 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    v38 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)v8);
    v39 = objc_msgSend(objc_msgSend(*v6, "source"), "UTF8String");
    *(_DWORD *)__y = 138412802;
    *(_QWORD *)&__y[4] = v38;
    v71 = 2080;
    v72 = (int64_t)v39;
    v73 = 2080;
    v74 = "should not set system time";
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Not setting system time to %@ from %s because %s\n", __y, 0x20u);
  }
LABEL_30:

}

NSDictionary *sub_10000C5BC(uint64_t a1)
{
  _QWORD v3[8];
  _QWORD v4[8];

  v3[0] = CFSTR("settimeofday");
  v4[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  v3[1] = CFSTR("rtc_s");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 32));
  v3[2] = CFSTR("t_s");
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40));
  v3[3] = CFSTR("unc_s");
  v4[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 48));
  v3[4] = CFSTR("mach");
  v4[4] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v3[5] = CFSTR("adjust");
  v4[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 64));
  v3[6] = CFSTR("didSet");
  v4[6] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 81));
  v3[7] = CFSTR("after_mach");
  v4[7] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 8);
}

void *sub_10000C83C(void *a1, const char *a2)
{
  if (a1)
    return objc_msgSend(a1, "isAutomaticTimeZoneEnabled");
  return a1;
}

id *sub_10000C848(id *result)
{
  if (result)
    return (id *)objc_msgSend(result[7], "areTimeZonePopupsEnabled");
  return result;
}

BOOL sub_10000C858(id *a1, void *a2)
{
  const __CFTimeZone *v4;
  const __CFString *v5;
  const __CFString *v6;
  CFTimeZoneRef v7;
  const __CFTimeZone *v8;
  CFAbsoluteTime Current;
  double v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  _BOOL8 v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v19;
  const __CFTimeZone *v20;
  const __CFString *Name;
  NSObject *v22;
  NSObject *v23;
  char *v24;
  __CFNotificationCenter *LocalCenter;
  uint8_t v26[4];
  uint8_t *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  double v31;
  __int16 v32;
  const __CFString *v33;

  if (!a1)
    return 0;
  if (!a2)
  {
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001B510();
    return 0;
  }
  v4 = CFTimeZoneCopySystem();
  v5 = (id)(id)CFTimeZoneGetName(v4);
  if (v4)
    CFRelease(v4);
  v6 = a2;
  v7 = CFTimeZoneCreateWithName(kCFAllocatorDefault, v6, 0);
  if (!v7)
  {
    v17 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
    {
      sub_10001B53C(a2, v17);
      if (!v6)
        return 0;
    }
    else if (!v6)
    {
      return 0;
    }
    CFRelease(v6);
    return 0;
  }
  v8 = v7;
  Current = CFAbsoluteTimeGetCurrent();
  v10 = CFTimeZoneGetSecondsFromGMT(v8, Current) / 3600.0;
  CFRelease(v8);
  if (objc_msgSend(a1[7], "areTimeZonePopupsEnabled"))
    CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, CFSTR("Time Zone Change"), (CFStringRef)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("timed set your time zone to %@ (GMT%+.2f) was %@.\n"), a2, *(_QWORD *)&v10, v5), 0);
  v11 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v29 = objc_msgSend(a2, "UTF8String");
    v30 = 2048;
    v31 = v10;
    v32 = 2112;
    v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting time zone to %s (GMT%+.2f) was %@\n", buf, 0x20u);
  }
  bzero(buf, 0x400uLL);
  readlink("/var/db/timezone/localtime", (char *)buf, 0x3FFuLL);
  v12 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v26 = 136315138;
    v27 = buf;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Before set, localtime symlink points to %s", v26, 0xCu);
  }
  v13 = tzlink(objc_msgSend(a2, "UTF8String"));
  v14 = v13 == 0;
  if (v13)
  {
    v15 = v13;
    v16 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
    {
      sub_10001B624(a2, v15, v16);
      if (!v6)
        return v14;
      goto LABEL_15;
    }
    if (v6)
LABEL_15:
      CFRelease(v6);
  }
  else
  {
    CFTimeZoneResetSystem();
    setenv("TZ", ":", 1);
    tzset();
    bzero(buf, 0x400uLL);
    readlink("/var/db/timezone/localtime", (char *)buf, 0x3FFuLL);
    v19 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136315138;
      v27 = buf;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "After set, localtime symlink points to %s", v26, 0xCu);
    }
    v20 = CFTimeZoneCopySystem();
    Name = CFTimeZoneGetName(v20);
    v22 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 138412290;
      v27 = (uint8_t *)Name;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CF's name for the zone is %@", v26, 0xCu);
    }
    if (v20)
    {
      if (CFStringCompare(Name, v6, 0) && os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001B5B0();
      CFRelease(v20);
    }
    if (v6)
      CFRelease(v6);
    v23 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136315138;
      v27 = (uint8_t *)tzname[0];
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "tzname[0] is %s", v26, 0xCu);
      v23 = qword_100033718;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = tzname[1];
      *(_DWORD *)v26 = 136315138;
      v27 = (uint8_t *)v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "tzname[1] is %s", v26, 0xCu);
    }
    objc_msgSend(a1, "setSystemTimeZoneSet:", 1);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, CFSTR("TimeZoneChangeNotification"), 0, 0, 0);
  }
  return v14;
}

BOOL sub_10000CD3C(uint64_t a1, __CFString *a2)
{
  _BOOL8 v2;
  CFTimeZoneRef v4;
  CFTimeZoneRef v5;
  CFTimeZoneRef v6;
  NSObject *v7;
  int v9;
  id v10;

  v2 = 0;
  if (a1 && a2)
  {
    CFTimeZoneResetSystem();
    v4 = CFTimeZoneCopySystem();
    v5 = CFTimeZoneCreateWithName(kCFAllocatorDefault, a2, 0);
    if (v5)
    {
      v6 = v5;
      v2 = CFEqual(v5, v4) != 0;
      CFRelease(v6);
    }
    else
    {
      v7 = qword_100033718;
      v2 = 0;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315138;
        v10 = -[__CFString UTF8String](a2, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No entry in system for time zone %s\n", (uint8_t *)&v9, 0xCu);
        v2 = 0;
      }
    }
    if (v4)
      CFRelease(v4);
  }
  return v2;
}

void sub_10000CE58(id *a1, __CFString *a2)
{
  NSObject *v4;
  int v5;
  __CFString *v6;

  if (a1 && objc_msgSend(a1, "isAutomaticTimeZoneEnabled"))
  {
    if (sub_10000CD3C((uint64_t)a1, a2) && (objc_msgSend(a1, "isSystemTimeZoneSet") & 1) != 0)
    {
      v4 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 138412290;
        v6 = a2;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not setting time zone to %@ because time zone is unchanged\n", (uint8_t *)&v5, 0xCu);
      }
    }
    else
    {
      sub_10000C858(a1, a2);
    }
  }
}

id sub_10000CFD4(id result)
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = (uint64_t)result;
    -[NSUserDefaults synchronize](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "synchronize");
    objc_msgSend(objc_msgSend((id)v1, "clock"), "coarseMonotonicTime");
    *(_QWORD *)(v1 + 120) = v2;
    objc_msgSend(*(id *)(v1 + 128), "setLastRtcTime:");
    objc_msgSend(*(id *)(v1 + 128), "setBootUUID:", sub_10000B0C8(v1));
    objc_msgSend(*(id *)(v1 + 128), "setRtcResetCount:", objc_msgSend((id)v1, "rtcResetCount"));
    objc_msgSend((id)v1, "accessoryUnc_s");
    objc_msgSend(*(id *)(v1 + 128), "setAccessoryUnc_s:");
    objc_msgSend(*(id *)(v1 + 128), "setSystemTimeSet:", objc_msgSend((id)v1, "isSystemTimeSet"));
    objc_msgSend(*(id *)(v1 + 32), "lastFetchAttempt");
    objc_msgSend(*(id *)(v1 + 128), "setLastNTPFetchAttempt:");
    objc_msgSend(*(id *)(v1 + 128), "setSTF:", objc_msgSend(*(id *)(v1 + 24), "dataRepresentation"));
    objc_msgSend(*(id *)(v1 + 128), "setTDTF:", objc_msgSend(*(id *)(v1 + 16), "dataRepresentation"));
    objc_msgSend(*(id *)(v1 + 128), "setSystemTimeSet:", *(unsigned __int8 *)(v1 + 40));
    return objc_msgSend(*(id *)(v1 + 128), "savePath:", CFSTR("/var/db/timed/com.apple.timed.plist"));
  }
  return result;
}

void sub_10000D0C0(id a1)
{
  _QWORD v1[6];
  _QWORD v2[6];

  v1[0] = CFSTR("TMSetSourceTime");
  v1[1] = CFSTR("TMSetSourceAvailable");
  v2[0] = &__kCFBooleanTrue;
  v2[1] = &__kCFBooleanTrue;
  v1[2] = CFSTR("TMSetSourceUnavailable");
  v1[3] = CFSTR("TMSetSourceTimeZone");
  v2[2] = &__kCFBooleanTrue;
  v2[3] = &__kCFBooleanTrue;
  v1[4] = CFSTR("TMProvideCellularTimeZone");
  v1[5] = CFSTR("TMProvideBBTime");
  v2[4] = &__kCFBooleanTrue;
  v2[5] = &__kCFBooleanTrue;
  qword_1000336B8 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v2, v1, 6);
}

void sub_10000D178(uint64_t a1, double a2, double a3)
{
  id v6;
  id v7;
  double v8;
  id v9;
  NSDictionary *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD v32[5];
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;

  if (!*(_BYTE *)(a1 + 56))
  {
    v10 = *(NSDictionary **)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
LABEL_9:
    sub_100005638(v10, v12, v11);
    return;
  }
  if (a2 > 0.0)
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2), CFSTR("TMRtcTime"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), CFSTR("TMRTCConversionTimeError"));
    v7 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TMTimeError"));
    if (v7)
    {
      objc_msgSend(v7, "doubleValue");
      objc_msgSend(v6, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8 + a3), CFSTR("TMTimeError"));
    }
    v9 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TMNanoTimeError"));
    if (v9)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)objc_msgSend(v9, "longLongValue") + (uint64_t)(a3 * 1000000000.0)), CFSTR("TMNanoTimeError"));
    v10 = *(NSDictionary **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = v6;
    goto LABEL_9;
  }
  v13 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
    sub_10001B810(a1, v13, v14, v15, v16, v17, v18, v19);
  v20 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("TMSource"));
    objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
    v23 = v22;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("TMRTCConversionTimeError")), "doubleValue");
    v25 = v24;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("TMCurrentTime")), "doubleValue");
    v27 = v26;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("TMTimeError")), "doubleValue");
    v29 = v28;
    v30 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("TMMachTime")), "unsignedLongLongValue");
    v31 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("TMCommand"));
    *(_DWORD *)buf = 138414082;
    v34 = CFSTR("DROP");
    v35 = 2112;
    v36 = v21;
    v37 = 2048;
    v38 = v23;
    v39 = 2048;
    v40 = v25;
    v41 = 2048;
    v42 = v27;
    v43 = 2048;
    v44 = v29;
    v45 = 2048;
    v46 = v30;
    v47 = 2112;
    v48 = v31;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu,cmd,%@", buf, 0x52u);
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000D510;
  v32[3] = &unk_100028BA0;
  v32[4] = *(_QWORD *)(a1 + 40);
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.droppedCommand"), v32);
}

NSDictionary *sub_10000D510(uint64_t a1)
{
  _QWORD v3[6];
  _QWORD v4[6];

  v3[0] = CFSTR("cmd");
  v4[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_100009A3C((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMCommand"))));
  v3[1] = CFSTR("src");
  v4[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[2] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[3] = CFSTR("t_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMCurrentTime")), "doubleValue");
  v4[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[4] = CFSTR("unc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMTimeError")), "doubleValue");
  v4[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[5] = CFSTR("mach");
  v4[5] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMMachTime")), "unsignedLongLongValue"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
}

void sub_10000D6D8(_QWORD *a1, void *a2)
{
  unsigned int v4;
  NSObject *v5;
  long double v6;
  double v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  timeval buf;

  if (a1)
  {
    v4 = objc_msgSend(a1, "isAutomaticTimeEnabled");
    v5 = qword_100033718;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001B878();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.tv_sec) = 138412290;
        *(__darwin_time_t *)((char *)&buf.tv_sec + 4) = (__darwin_time_t)a2;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting manual time with dictionary %@", (uint8_t *)&buf, 0xCu);
      }
      buf.tv_sec = 0;
      *(_QWORD *)&buf.tv_usec = 0;
      objc_msgSend(objc_msgSend(a2, "objectForKey:", CFSTR("TMCurrentTime")), "doubleValue");
      v7 = v6;
      sub_10000A44C(&buf.tv_sec, v6);
      if ((v8 & 1) != 0)
      {
        if (settimeofday(&buf, 0))
        {
          v9 = qword_100033718;
          if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
            sub_10001B8A4(&buf.tv_sec, v9, v10);
        }
        else
        {
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v11 = (void *)a1[6];
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v19;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(_QWORD *)v19 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
                if ((objc_opt_respondsToSelector(v16, "didSetManualTime:") & 1) != 0)
                  objc_msgSend(v16, "didSetManualTime:", v7);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            }
            while (v13);
          }
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SignificantTimeChangeNotification"), 0, 0, 1u);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      {
        sub_10001B920();
      }
    }
  }
}

void sub_10000D908(uint64_t a1, uint64_t a2)
{
  TMTime *v4;
  void *v5;
  unsigned int v6;
  TMTimeSynthesizer *v7;
  TMTimeSynthesizer *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  if (!a1)
    return;
  v4 = +[TMTime timeWithDictionary:](TMTime, "timeWithDictionary:", a2);
  v5 = *(void **)(a1 + 24);
  if (!v5)
  {
    v8 = [TMTimeSynthesizer alloc];
    objc_msgSend(*(id *)(a1 + 56), "RTCFrequencyTolerance");
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 56), "RTCFrequencyNoiseDensity");
    v7 = -[TMTimeSynthesizer initWithClockAccuracy:noiseDensity:name:](v8, "initWithClockAccuracy:noiseDensity:name:", CFSTR("STF"), v10, v11);
    *(_QWORD *)(a1 + 24) = v7;
    goto LABEL_7;
  }
  v6 = objc_msgSend(v5, "isRunning");
  v7 = *(TMTimeSynthesizer **)(a1 + 24);
  if (!v6)
  {
LABEL_7:
    v12 = 0;
    -[TMTimeSynthesizer update:withError:](v7, "update:withError:", v4, &v12);
    if (v12)
      sub_10000A96C((id *)a1, v12, v4);
    objc_msgSend((id)a1, "setSourceTime:", a2);
    return;
  }
  if (-[TMTimeSynthesizer intersects:](v7, "intersects:", v4))
  {
    v7 = *(TMTimeSynthesizer **)(a1 + 24);
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
    sub_10001B94C();
}

NSDictionary *sub_10000DA20(uint64_t a1)
{
  _QWORD v3[3];
  _QWORD v4[3];

  v3[0] = CFSTR("BOOL");
  v4[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3[1] = CFSTR("src");
  v4[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[2] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
}

NSDictionary *sub_10000DB24(uint64_t a1)
{
  _QWORD v3[3];
  _QWORD v4[3];

  v3[0] = CFSTR("BOOL");
  v4[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3[1] = CFSTR("src");
  v4[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[2] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
}

BOOL sub_10000DC28(_BOOL8 result)
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "currentTimeZone") != 0;
  return result;
}

id sub_10000DC4C(id result, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const __CFString *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  uint64_t v13;

  if (result)
  {
    v3 = result;
    v4 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMSource"));
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
      *(_DWORD *)buf = 138412802;
      v9 = CFSTR("confirm_tz");
      v10 = 2112;
      v11 = v5;
      v12 = 2048;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000FEF4;
    v7[3] = &unk_100028BA0;
    v7[4] = a2;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.confirmTimeZoneCommand"), v7);
    return objc_msgSend(v3, "resetTimeZone:", a2);
  }
  return result;
}

NSDictionary *sub_10000DD98(NSDictionary *result)
{
  const __CFString *v1;
  NSNumber *v2;

  if (result)
  {
    v1 = CFSTR("TMBBTimeActive");
    v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSDictionary requiresActiveBBTime](result, "requiresActiveBBTime"));
    return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v2, &v1, 1);
  }
  return result;
}

id *sub_10000DE28(id *result, void *a2)
{
  id *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  TMTime *v13;
  _QWORD v14[5];
  _BYTE buf[12];
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  if (result)
  {
    v3 = result;
    v4 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMSource"));
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
      v7 = v6;
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMRTCConversionTimeError")), "doubleValue");
      v9 = v8;
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMCurrentTime")), "doubleValue");
      v11 = v10;
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMTimeError")), "doubleValue");
      *(_DWORD *)buf = 138414850;
      *(_QWORD *)&buf[4] = CFSTR("BB");
      v16 = 2112;
      v17 = v5;
      v18 = 2048;
      v19 = v7;
      v20 = 2048;
      v21 = v9;
      v22 = 2048;
      v23 = v11;
      v24 = 2048;
      v25 = v12;
      v26 = 2048;
      v27 = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMMachTime")), "unsignedLongLongValue");
      v28 = 2048;
      v29 = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMAbsoluteNanoTime")), "longLongValue");
      v30 = 2048;
      v31 = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMNanoTimeError")), "longLongValue");
      v32 = 2048;
      v33 = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMMachTime")), "unsignedLongLongValue");
      v34 = 2048;
      v35 = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMMachTimeAfter")), "unsignedLongLongValue");
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu,t_ns,%lld,unc_ns,%lld,before_m,%llu,after_m,%llu", buf, 0x70u);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100010834;
    v14[3] = &unk_100028BA0;
    v14[4] = a2;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.BBTimeCommand"), v14);
    v13 = +[TMTime timeWithDictionary:](TMTime, "timeWithDictionary:", a2);
    *(_QWORD *)buf = 0;
    objc_msgSend(v3[2], "update:withError:", v13, buf);
    if (*(_QWORD *)buf)
      sub_10000A7D0(v3, *(void **)buf, v13);
    -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TMSystemTimeChanged"), v3, &__NSDictionary0__struct);
    objc_msgSend(v3, "testAndApplySystemTime");
    return (id *)objc_msgSend(v3, "checkActiveTimeSourceRequired");
  }
  return result;
}

id sub_10000E11C(id result, void *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;

  if (result)
  {
    v5 = result;
    v6 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received setup time request.\n", buf, 2u);
    }
    v7 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMSource"));
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
      *(_DWORD *)buf = 138412802;
      v13 = CFSTR("setup_time");
      v14 = 2112;
      v15 = v8;
      v16 = 2048;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100010B10;
    v11[3] = &unk_100028BA0;
    v11[4] = a2;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.setupTimeCommand"), v11);
    if (objc_msgSend(v5, "isSystemTimeSet"))
    {
      v10 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TMSetupTime: time already set.", buf, 2u);
      }
      return (id)((uint64_t (**)(_QWORD, NSDictionary *))a3)[2](a3, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("TMSetupSuccessful")));
    }
    else
    {
      return sub_10000EBFC(v5, a3);
    }
  }
  return result;
}

void sub_10000E340(void *a1, void *a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;
  dispatch_time_t v13;
  __CFNotificationCenter *v14;
  _QWORD block[9];
  _QWORD v16[7];
  _QWORD aBlock[6];
  _QWORD v18[8];
  _QWORD v19[3];
  char v20;
  _QWORD v21[3];
  char v22;
  _QWORD v23[5];
  _BYTE buf[24];
  uint64_t v25;

  if (a1)
  {
    v6 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received setup timezone request.\n", buf, 2u);
    }
    v7 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMSource"));
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = CFSTR("setup_tz");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2048;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100010BF8;
    v23[3] = &unk_100028BA0;
    v23[4] = a2;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.setupTimeZoneCommand"), v23);
    if (objc_msgSend(a1, "isSystemTimeZoneSet"))
    {
      v10 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TMSetupTimeZone: timezone already set.", buf, 2u);
      }
      (*(void (**)(uint64_t, NSDictionary *))(a3 + 16))(a3, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("TMSetupSuccessful")));
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v25) = 0;
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      v22 = 0;
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x2020000000;
      v20 = 0;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100010CE0;
      v18[3] = &unk_100028E60;
      v18[6] = buf;
      v18[7] = v21;
      v18[4] = a3;
      v18[5] = v19;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 3221225472;
      aBlock[2] = sub_100010E58;
      aBlock[3] = &unk_100028E88;
      aBlock[4] = v18;
      aBlock[5] = buf;
      sub_10000A654(DarwinNotifyCenter, CFSTR("AutomaticTimeZoneUpdateFailed"), 0, (CFNotificationSuspensionBehavior)0, aBlock);
      LocalCenter = CFNotificationCenterGetLocalCenter();
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100010E88;
      v16[3] = &unk_100028EB0;
      v16[4] = v18;
      v16[5] = v21;
      v16[6] = v19;
      sub_10000A654(LocalCenter, CFSTR("TimeZoneChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately, v16);
      v13 = dispatch_time(0, 20000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100010ED4;
      block[3] = &unk_100028ED8;
      block[6] = v19;
      block[7] = v21;
      block[8] = buf;
      block[4] = a1;
      block[5] = v18;
      dispatch_after(v13, (dispatch_queue_t)objc_msgSend(a1, "workloop"), block);
      v14 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v14, CFSTR("AutomaticTimeZoneUpdateNeeded"), 0, 0, 1u);
      _Block_object_dispose(v19, 8);
      _Block_object_dispose(v21, 8);
      _Block_object_dispose(buf, 8);
    }
  }
}

void sub_10000E704(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id *sub_10000E740(id *result, void *a2)
{
  id *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;

  if (result)
  {
    v3 = result;
    v4 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting timed.\n", buf, 2u);
    }
    v5 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMSource"));
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
      *(_DWORD *)buf = 138412802;
      v12 = CFSTR("reset");
      v13 = 2112;
      v14 = v6;
      v15 = 2048;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100010FEC;
    v10[3] = &unk_100028BA0;
    v10[4] = a2;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.resetToFirstLaunch"), v10);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("TimedResetNotification"), 0, 0, 0);
    xpc_activity_unregister("com.apple.timed.check-active");
    objc_msgSend(v3[16], "emptyPath:", CFSTR("/var/db/timed/com.apple.timed.plist"));
    objc_msgSend(v3, "setSystemTimeZoneSet:", 0);
    v9 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Reset complete.", buf, 2u);
    }
    exit(0);
  }
  return result;
}

_QWORD *sub_10000E95C(_QWORD *result, double a2, double a3)
{
  uint64_t v3;
  _QWORD *v5;
  NSObject *v6;
  TMMonotonicClock *v7;
  TMMonotonicClock *v8;
  uint8_t v9[16];

  v3 = result[4];
  if (*(_BYTE *)(v3 + 40) && *(double *)(v3 + 120) > a2 + a3)
  {
    v5 = result;
    v6 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "RTC has walked backwards during sleep, resetting synthesizer", v9, 2u);
      v3 = v5[4];
    }
    objc_msgSend((id)v3, "rtcDidReset");
    v7 = [TMMonotonicClock alloc];
    objc_msgSend(*(id *)(v5[4] + 56), "RTCMachSyncInterval");
    v8 = -[TMMonotonicClock initWithSyncInterval:](v7, "initWithSyncInterval:");
    objc_msgSend((id)v5[4], "setClock:", v8);

    sub_10000A77C((id *)v5[4]);
    *(double *)(v5[4] + 120) = a2;
    return objc_msgSend(*(id *)(v5[4] + 32), "fetchTime");
  }
  return result;
}

void sub_10000EB4C(id a1, NSDictionary *a2)
{
  NSObject *v3;
  int v4;
  id v5;

  v3 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = -[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", CFSTR("TMSetupSuccessful"));
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Did setup time after automatic time enabled: %@", (uint8_t *)&v4, 0xCu);
  }
}

id sub_10000EBFC(id result, void *aBlock)
{
  uint64_t v2;
  void *v3;

  if (result)
  {
    v2 = (uint64_t)result;
    if (aBlock)
    {
      v3 = _Block_copy(aBlock);
      objc_msgSend(*(id *)(v2 + 72), "addObject:", v3);

    }
    return objc_msgSend(*(id *)(v2 + 32), "fetchTime");
  }
  return result;
}

void sub_10000EDDC(uint64_t a1)
{
  NSObject *v1;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v3[16];

  if (a1)
  {
    v1 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Sending TMLocationTimeZoneActiveNotification", v3, 2u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("TMLocationTimeZoneActive"), 0, 0, 0);
  }
}

void sub_10000EE64(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  if (a2)
  {
    v4 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got a response when none expected.\nMessage: %@.\nResponse: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_10000EF8C(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  NSTimeZone *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  NSInteger v18;
  const __CFString *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  double Current;
  double v24;
  void *v25;
  NSObject *v26;
  double v27;
  NSObject *v28;
  const char *v29;
  double v30;
  double v31;
  NSObject *v32;
  xpc_object_t v33;
  _QWORD v34[5];
  _QWORD v35[7];
  _QWORD v36[8];
  _QWORD v37[8];
  uint8_t buf[4];
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "basebandWantedThreshold");
  v3 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "NTPWantedThreshold");
  v5 = v4;
  v6 = objc_msgSend(*(id *)(a1 + 32), "timeProvider");
  objc_msgSend(v6, "rtcWhenBeyondUncertainty:", v3);
  v8 = v7;
  objc_msgSend(v6, "rtcWhenBeyondUncertainty:", v5);
  v10 = v9;
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "clock"), "coarseMonotonicTime");
  v12 = v11;
  v13 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    v39 = v12;
    v40 = 2048;
    v41 = v3;
    v42 = 2048;
    v43 = v5;
    v44 = 2048;
    v45 = v8;
    v46 = 2048;
    v47 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "cmd,checkActiveTimeSourceRequired,rtc_s,%f,bb_want_unc_s,%f,want_unc_s,%f,bb_want_rtc_s,%f,want_rtc_s,%f", buf, 0x34u);
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10000F4CC;
  v37[3] = &unk_100028D10;
  *(double *)&v37[5] = v12;
  *(double *)&v37[6] = v8;
  *(double *)&v37[7] = v10;
  v37[4] = *(_QWORD *)(a1 + 32);
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.checkActiveTimeSourceRequired"), v37);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendStateAnalytics");
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isAutomaticTimeZoneEnabled") & 1) == 0)
  {
    v14 = +[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone");
    v15 = -[NSTimeZone name](v14, "name");
    v16 = CFSTR("Unresolved");
    if (v15)
      v17 = v15;
    else
      v17 = CFSTR("Unresolved");
    v18 = -[NSTimeZone secondsFromGMT](v14, "secondsFromGMT");
    v19 = (const __CFString *)objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "currentTimeZone"), "olsonName");
    if (v19)
      v16 = v19;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000F620;
    v36[3] = &unk_100028D38;
    v36[4] = v17;
    v36[5] = v16;
    v36[6] = v18;
    v36[7] = -[NSTimeZone secondsFromGMT](+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v16), "secondsFromGMT");
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.tzChange"), v36);
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isAutomaticTimeEnabled") & 1) == 0)
  {
    v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "synthesizedTimeAtLastRTC");
    objc_msgSend(v20, "utc_s");
    v22 = v21;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10000F6F0;
    v35[3] = &unk_100028D60;
    v35[5] = CFAbsoluteTimeGetCurrent();
    v35[6] = v22;
    v35[4] = v20;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.ManualTime"), v35);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v24 = v10 - v12;
  if (v10 - v12 < 0.0)
    v24 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setWantedTime:", v24 + Current);
  v25 = *(void **)(a1 + 32);
  if (v8 < v12 + 300.0)
  {
    objc_msgSend(v25, "setRequiresActiveBBTime:", 1);
    if (*(double *)(*(_QWORD *)(a1 + 32) + 80) > -2.0)
    {
      v26 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Unscheduling proactive time check", buf, 2u);
      }
      xpc_activity_unregister("com.apple.timed.check-active");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0xC000000000000000;
    }
    return;
  }
  objc_msgSend(v25, "setRequiresActiveBBTime:", 0);
  v27 = fabs(v8);
  if (v27 >= INFINITY && v27 <= INFINITY)
  {
    v28 = qword_100033718;
    if (!os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v29 = "Proactive time is not necessary, dropping job with infinite start time";
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, v29, buf, 2u);
    return;
  }
  v30 = v8 - *(double *)(*(_QWORD *)(a1 + 32) + 80);
  if (v30 < 0.0)
    v30 = -v30;
  if (v30 < 300.0)
  {
    v28 = qword_100033718;
    if (!os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v29 = "Not rescheduling proactive time check";
    goto LABEL_28;
  }
  v31 = v8 - v12;
  v32 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v39 = v31;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Scheduling proactive time check after %f seconds", buf, 0xCu);
  }
  v33 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v33, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v33, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_int64(v33, XPC_ACTIVITY_DELAY, (uint64_t)v31);
  xpc_dictionary_set_int64(v33, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_activity_unregister("com.apple.timed.check-active");
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000F7E0;
  v34[3] = &unk_100028D88;
  v34[4] = *(_QWORD *)(a1 + 32);
  xpc_activity_register("com.apple.timed.check-active", v33, v34);
  xpc_release(v33);
  *(double *)(*(_QWORD *)(a1 + 32) + 80) = v8;
}

NSDictionary *sub_10000F4CC(uint64_t a1)
{
  double v2;
  double v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v5[0] = CFSTR("rtc_s");
  v6[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40));
  v5[1] = CFSTR("bb_want_rtc_s");
  v2 = *(double *)(a1 + 48);
  if (fabs(v2) == INFINITY)
    v2 = 0.0;
  v6[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v2);
  v5[2] = CFSTR("want_rtc_s");
  v3 = *(double *)(a1 + 56);
  if (v3 == -INFINITY)
    v3 = 0.0;
  v6[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v3);
  v5[3] = CFSTR("manual_time");
  v6[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isAutomaticTimeEnabled") ^ 1);
  v5[4] = CFSTR("manual_time_zone");
  v6[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isAutomaticTimeZoneEnabled") ^ 1);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
}

NSDictionary *sub_10000F620(uint64_t a1)
{
  _QWORD v3[4];
  __int128 v4;
  NSNumber *v5;
  NSNumber *v6;

  v3[0] = CFSTR("setTimeZone");
  v3[1] = CFSTR("computedTimeZone");
  v4 = *(_OWORD *)(a1 + 32);
  v5 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", *(_QWORD *)(a1 + 48) - *(_QWORD *)(a1 + 56), CFSTR("setTimeZone"), CFSTR("computedTimeZone"), CFSTR("computedManualTZOffsetSec"));
  v3[3] = CFSTR("timeZoneDisagreement");
  v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, v3, 4);
}

NSDictionary *sub_10000F6F0(uint64_t a1)
{
  _QWORD v3[4];
  _QWORD v4[4];

  v3[0] = CFSTR("manualUTC");
  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40));
  v3[1] = CFSTR("computedUTC");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 48));
  v3[2] = CFSTR("computedUncertainty");
  objc_msgSend(*(id *)(a1 + 32), "utcUnc_s");
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[3] = CFSTR("difference");
  v4[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40) - *(double *)(a1 + 48));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
}

void sub_10000F7E0(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  NSObject *v4;
  uint8_t v5[16];

  state = xpc_activity_get_state(activity);
  v4 = qword_100033718;
  if (state == 2)
  {
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Handling proactive time check", v5, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "checkActiveTimeSourceRequired");
  }
  else if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
  {
    sub_10001B9AC();
  }
}

void sub_10000F8F4(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  NSDate *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  TMTime *v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _BYTE buf[12];
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;

  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("TMCurrentTime")), "doubleValue");
  v3 = v2;
  v4 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v3);
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("TMTimeError")), "doubleValue");
    v7 = v6;
    v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("TMSource"));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v5;
    v28 = 2048;
    v29 = v7;
    v30 = 2112;
    v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received time %@±%.2f from \"%@\"\n", buf, 0x20u);
  }
  v9 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"));
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
    v12 = v11;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRTCConversionTimeError")), "doubleValue");
    v14 = v13;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMCurrentTime")), "doubleValue");
    v16 = v15;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMTimeError")), "doubleValue");
    v18 = v17;
    v19 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMMachTime")), "unsignedLongLongValue");
    *(_DWORD *)buf = 138413826;
    *(_QWORD *)&buf[4] = CFSTR("T");
    v28 = 2112;
    v29 = v10;
    v30 = 2048;
    v31 = v12;
    v32 = 2048;
    v33 = v14;
    v34 = 2048;
    v35 = v16;
    v36 = 2048;
    v37 = v18;
    v38 = 2048;
    v39 = v19;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu", buf, 0x48u);
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000FD54;
  v26[3] = &unk_100028BA0;
  v26[4] = *(_QWORD *)(a1 + 32);
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.timeCommand"), v26);
  if (sub_10000A39C(v3))
  {
    v20 = +[TMTime timeWithDictionary:](TMTime, "timeWithDictionary:", *(_QWORD *)(a1 + 32));
    v21 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "isRunning");
    v22 = *(_QWORD *)(a1 + 40);
    if (!v21 || (v23 = objc_msgSend(*(id *)(v22 + 56), "shouldClamp"), v22 = *(_QWORD *)(a1 + 40), !v23))
    {
LABEL_11:
      *(_QWORD *)buf = 0;
      objc_msgSend(*(id *)(v22 + 16), "update:withError:", v20, buf);
      if (*(_QWORD *)buf)
        sub_10000A7D0(*(id **)(a1 + 40), *(void **)buf, v20);
      v24 = *(void **)(a1 + 40);
      if (v24)
      {
        -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TMSystemTimeChanged"), v24, &__NSDictionary0__struct);
        objc_msgSend(v24, "testAndApplySystemTime");
        v25 = *(void **)(a1 + 40);
      }
      else
      {
        v25 = 0;
      }
      objc_msgSend(v25, "checkActiveTimeSourceRequired");
      return;
    }
    if ((objc_msgSend(*(id *)(v22 + 24), "intersects:", v20) & 1) != 0)
    {
      v22 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v22 + 112) <= 9uLL)
      {
        *(_QWORD *)(v22 + 112) = 0;
        v22 = *(_QWORD *)(a1 + 40);
      }
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001BA38();
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "shouldAlertWhenIslanded"))
    {
      if (++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) == 10)
      {
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
          sub_10001BA0C();
        AnalyticsSendEventLazy(CFSTR("com.apple.timed.islandAlert"), &stru_100028DF0);
        sub_100007684();
      }
    }
    sub_10000A96C(*(id **)(a1 + 40), +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kTimedErrorDomain"), 6, 0), v20);
  }
  else if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
  {
    sub_10001BA98();
  }
}

NSDictionary *sub_10000FD54(uint64_t a1)
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[0] = CFSTR("src");
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[1] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[2] = CFSTR("t_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMCurrentTime")), "doubleValue");
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[3] = CFSTR("unc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMTimeError")), "doubleValue");
  v4[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[4] = CFSTR("mach");
  v4[4] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMMachTime")), "unsignedLongLongValue"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
}

NSDictionary *__cdecl sub_10000FEE8(id a1)
{
  return (NSDictionary *)&off_10002C818;
}

NSDictionary *sub_10000FEF4(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("src");
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[1] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

NSDictionary *sub_1000101A4(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("src");
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[1] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

NSDictionary *sub_100010454(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("src");
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[1] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

NSDictionary *sub_100010794(uint64_t a1)
{
  const __CFString *v2;
  NSString *v3;

  v2 = CFSTR("src");
  v3 = +[NSString stringWithString:](NSString, "stringWithString:", objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource")));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1);
}

NSDictionary *sub_100010834(uint64_t a1)
{
  _QWORD v3[6];
  _QWORD v4[6];

  v3[0] = CFSTR("t_ns");
  v4[0] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMAbsoluteNanoTime")), "longLongValue"));
  v3[1] = CFSTR("unc_ns");
  v4[1] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMNanoTimeError")), "longLongValue"));
  v3[2] = CFSTR("before_mach");
  v4[2] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMMachTime")), "unsignedLongLongValue"));
  v3[3] = CFSTR("after_mach");
  v4[3] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMMachTimeAfter")), "unsignedLongLongValue"));
  v3[4] = CFSTR("src");
  v4[4] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[5] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
}

NSDictionary *sub_100010A90(uint64_t a1)
{
  const __CFString *v2;
  NSNumber *v3;

  v2 = CFSTR("required");
  v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1);
}

NSDictionary *sub_100010B10(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("src");
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[1] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

NSDictionary *sub_100010BF8(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("src");
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[1] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

void sub_100010CE0(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    return;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
LABEL_9:
      v2 = 0;
      goto LABEL_10;
    }
LABEL_7:
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001BAC4();
    goto LABEL_9;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    goto LABEL_7;
  v2 = 1;
LABEL_10:
  (*(void (**)(_QWORD, NSDictionary *))(a1[4] + 16))(a1[4], +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v2), CFSTR("TMSetupSuccessful")));
  v3 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "failed";
    if ((_DWORD)v2)
      v4 = "succeeded";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TMSetupTimeZone: %s.", (uint8_t *)&v5, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
}

uint64_t sub_100010E58(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

BOOL sub_100010E88(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  (*(void (**)(void))(a1[4] + 16))();
  return *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) == 0;
}

uint64_t sub_100010ED4(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    v2 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "TMSetupTimeZone: timed out.", v4, 2u);
    }
    if (objc_msgSend(*(id *)(v1 + 32), "isSystemTimeZoneSet"))
      v3 = *(_QWORD *)(v1 + 56);
    else
      v3 = *(_QWORD *)(v1 + 64);
    *(_BYTE *)(*(_QWORD *)(v3 + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

id *sub_100010FDC(uint64_t a1)
{
  return sub_10000E740(*(id **)(a1 + 32), &__NSDictionary0__struct);
}

NSDictionary *sub_100010FEC(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("src");
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v3[1] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

NSDictionary *sub_100011240(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD v7[3];

  v6[0] = CFSTR("reason");
  v2 = *(_QWORD *)(a1 + 32);
  if (qword_1000336C8 != -1)
    dispatch_once(&qword_1000336C8, &stru_100028F20);
  v3 = objc_msgSend((id)qword_1000336C0, "objectForKeyedSubscript:", v2);
  if (v3)
    v4 = (uint64_t)objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 2;
  v7[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4);
  v6[1] = CFSTR("src");
  v7[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("TMSource"))));
  v6[2] = CFSTR("rtc_s");
  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v7[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
}

void sub_10001168C(id a1)
{
  _QWORD v1[3];
  _QWORD v2[3];

  v1[0] = CFSTR("AutomaticTimeZoneEnabled");
  v1[1] = CFSTR("AirplaneMode");
  v2[0] = &off_10002C758;
  v2[1] = &off_10002C770;
  v1[2] = CFSTR("Unknown");
  v2[2] = &off_10002C788;
  qword_1000336C0 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v2, v1, 3);
}

void sub_100011734(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10001174C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_100011758(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_100011768(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id *sub_100011774(id *result, id *a2)
{
  id *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id *v7;

  if (result)
  {
    v3 = result;
    v4 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
    }
    v5 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TZ,fetch,src,%@", (uint8_t *)&v6, 0xCu);
    }
    return (id *)objc_msgSend(v3[5], "timeZoneManager:shouldFetch:", v3, a2);
  }
  return result;
}

id *sub_100011880(id *result, id *a2)
{
  id *v3;
  NSObject *v4;
  NSObject *v5;
  id *v6;
  id v7;
  NSObject *v8;
  id *v9;
  _QWORD v10[8];
  uint8_t buf[4];
  id *v12;

  if (result)
  {
    v3 = result;
    v4 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v5 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TZ,recompute,src,%@", buf, 0xCu);
    }
    v6 = (id *)sub_100011AF0((uint64_t)v3);
    v7 = objc_msgSend(v3[1], "objectForKeyedSubscript:", a2);
    if (!v7)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", "recomputeDueToSource:", v3, CFSTR("TMTimeZoneManager.m"), 39, CFSTR("Cannot recompute based on source \"%@\", when there is no recorded input for it."), a2);
    if (objc_msgSend(v6, "isEqualToString:", a2))
    {
      objc_msgSend(v3, "setCurrentTimeZone:", v7);
      v8 = qword_100033720;
      if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (id *)objc_msgSend(v7, "olsonName");
        *(_DWORD *)buf = 138412290;
        v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TZ,computed,result,%@", buf, 0xCu);
      }
      return (id *)objc_msgSend(v3[5], "timeZoneManager:didComputeResult:", v3, v7);
    }
    else
    {
      result = (id *)objc_msgSend(v7, "hasSameOlsonNameAs:", objc_msgSend(v3[1], "objectForKeyedSubscript:", v6));
      if ((result & 1) == 0)
      {
        if (v6 && objc_msgSend(v3[1], "objectForKeyedSubscript:", v6))
        {
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          v10[2] = sub_100011C38;
          v10[3] = &unk_100028F48;
          v10[4] = a2;
          v10[5] = v7;
          v10[6] = v6;
          v10[7] = v3;
          AnalyticsSendEventLazy(CFSTR("com.apple.timed.tzInputDisagreeWithHighestSource"), v10);
        }
        objc_msgSend(v3, "setCurrentTimeZone:", 0);
        return sub_100011774(v3, v6);
      }
    }
  }
  return result;
}

uint64_t sub_100011AF0(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(a1 + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v3)
  {
LABEL_10:
    v8 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TZ,starved", v10, 2u);
    }
    return 0;
  }
  v4 = v3;
  v5 = *(_QWORD *)v12;
LABEL_4:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v5)
      objc_enumerationMutation(v2);
    v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
    if ((objc_msgSend(*(id *)(a1 + 16), "containsObject:", v7) & 1) != 0)
      return v7;
    if (v4 == (id)++v6)
    {
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
}

NSDictionary *sub_100011C38(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v3 = a1[4];
  v2 = (void *)a1[5];
  v9[0] = v3;
  v8[0] = CFSTR("culprit_src");
  v8[1] = CFSTR("culprit_tz");
  v4 = objc_msgSend(v2, "olsonName");
  v5 = a1[6];
  v6 = a1[7];
  v9[1] = v4;
  v9[2] = v5;
  v8[2] = CFSTR("highest_src");
  v8[3] = CFSTR("highest_tz");
  v9[3] = objc_msgSend(objc_msgSend(*(id *)(v6 + 8), "objectForKeyedSubscript:"), "olsonName");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
}

id sub_100011FCC(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", a1), "objectForKeyedSubscript:", CFSTR("Order")), "compare:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", a2), "objectForKeyedSubscript:", CFSTR("Order")));
}

uint64_t sub_1000129A0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void sub_1000129CC(uint64_t (*a1)(_QWORD), NSObject *a2)
{
  NSObject *v3;

  if (!a1)
    sub_10001BC30();
  if (off_1000336D0)
    sub_10001BC98();
  off_1000336D0 = a1;
  dword_1000336E4 = IORegisterForSystemPower(0, (IONotificationPortRef *)&qword_1000336D8, (IOServiceInterestCallback)sub_100012A68, &dword_1000336E0);
  if (dword_1000336E4)
  {
    v3 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEBUG))
      sub_10001BC58(v3);
    IONotificationPortSetDispatchQueue((IONotificationPortRef)qword_1000336D8, a2);
  }
}

uint64_t sub_100012A68(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t result;
  unsigned int v9;
  unint64_t v10;
  _QWORD v11[4];
  int v12;
  uint8_t buf[4];
  int v14;

  v6 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEBUG))
    sub_10001BCC0(a3, v6);
  v7 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = a3 & 0xFFF;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,PmCallback,msg,0x%03x", buf, 8u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012BC8;
  v11[3] = &unk_100028F90;
  v12 = a3;
  result = AnalyticsSendEventLazy(CFSTR("com.apple.timed.PMCallback"), v11);
  HIDWORD(v10) = a3;
  LODWORD(v10) = a3 + 536870288;
  v9 = v10 >> 4;
  if (v9 == 11)
    return off_1000336D0(result);
  if (v9 <= 1)
    return IOAllowPowerChange(dword_1000336E4, a4);
  return result;
}

NSDictionary *sub_100012BC8(uint64_t a1)
{
  _QWORD v2[2];
  _QWORD v3[2];

  v2[0] = CFSTR("msg");
  v3[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_DWORD *)(a1 + 32) & 0xFFF);
  v2[1] = CFSTR("mach");
  v3[1] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", mach_absolute_time());
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
}

void sub_100012C7C(id a1)
{
  qword_1000336E8 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", CFSTR("TMIsAutomaticTimeEnabled"), CFSTR("TMIsAutomaticTimeZoneEnabled"), 0);
}

void sub_1000130B0(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  NSObject *v7;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  NSObject *v12;
  _QWORD block[7];
  _QWORD v14[6];
  double v15;
  uint64_t v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  uint64_t v22;

  v2 = objc_autoreleasePoolPush();
  v15 = 0.0;
  v16 = 0;
  v3 = sub_10000A628(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 56));
  if (v3 > 0.0
    && (v4 = *(_QWORD *)(a1 + 32), v3 < *(double *)(v4 + 56))
    && objc_msgSend((id)v4, "isMachTimeValid:", *(_QWORD *)(v4 + 32)))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(v5 + 32);
    v15 = *(double *)(v5 + 40);
    v6 = *(double *)(v5 + 24);
  }
  else
  {
    v6 = sub_10000678C(&v16, &v15);
    v7 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v18 = v6;
      v19 = 2048;
      v20 = v15;
      v21 = 2048;
      v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,SYNC,rtc_s,%.9f,unc_s,%.9f,mach,%llu", buf, 0x20u);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000132E0;
    v14[3] = &unk_1000291B0;
    *(double *)&v14[4] = v6;
    v14[5] = v16;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.monotonicTimeForMachTime"), v14);
    *(double *)(*(_QWORD *)(a1 + 32) + 24) = v6;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v16;
    *(double *)(*(_QWORD *)(a1 + 32) + 40) = v15;
  }
  v8 = -1.0;
  if (v6 >= 0.0)
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "isMachTimeValid:", *(_QWORD *)(a1 + 56));
    v9 = -1.0;
    if (v10)
    {
      v11 = sub_10000A628(*(_QWORD *)(a1 + 56), v16);
      v8 = v6 - v11;
      v9 = v15 + fabs(v11) * 0.00002;
    }
  }
  else
  {
    v9 = -1.0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001338C;
  block[3] = &unk_1000291D8;
  v12 = *(NSObject **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 48);
  *(double *)&block[5] = v8;
  *(double *)&block[6] = v9;
  dispatch_async(v12, block);
  objc_autoreleasePoolPop(v2);
}

NSDictionary *sub_1000132E0(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("rtc_s");
  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 32));
  v3[1] = CFSTR("mach");
  v4[1] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

void sub_10001338C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100013550(id a1)
{
  NSObject *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10[16];

  qword_100033700 = 2;
  if (sysctlnametomib("machdep.wake_abstime", (int *)&unk_1000336F8, (size_t *)&qword_100033700))
  {
    v1 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Could not get mib for machdep.wake_abstime, falling back to kern.wake_abs_time.", v10, 2u);
    }
    if (sysctlnametomib("kern.wake_abs_time", (int *)&unk_1000336F8, (size_t *)&qword_100033700))
    {
      v2 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001BE48(v2, v3, v4, v5, v6, v7, v8, v9);
      qword_100033700 = 0;
    }
  }
}

NSDictionary *sub_100013624(uint64_t a1)
{
  const __CFString *v2;
  NSNumber *v3;

  v2 = CFSTR("mach");
  v3 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1);
}

uint64_t sub_1000136E0()
{
  NSObject *v0;
  pid_t v1;
  NSDictionary *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];

  qword_100033718 = (uint64_t)os_log_create("com.apple.timed", "text");
  v0 = os_log_create("com.apple.timed", "data");
  qword_100033720 = (uint64_t)v0;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "332";
    v19 = 2080;
    v20 = &unk_1000216D9;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "cmd,build,version,%s,git,%s", buf, 0x16u);
    v0 = qword_100033720;
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = getpid();
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v1;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "cmd,process,pid,%d", buf, 8u);
  }
  v2 = -[NSUserDefaults persistentDomainForName:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "persistentDomainForName:", CFSTR("com.apple.timed"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = -[NSDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = qword_100033720;
        if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v9 = -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v8);
          *(_DWORD *)buf = 138412802;
          v18 = CFSTR("com.apple.timed");
          v19 = 2112;
          v20 = v8;
          v21 = 2112;
          v22 = v9;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,default,d,\"%@\",k,\"%@\",v,\"%@\"", buf, 0x20u);
        }
      }
      v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
    }
    while (v4);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000139D4;
  v12[3] = &unk_100028BA0;
  v12[4] = v2;
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.startupDefaults"), v12);
  v10 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "cmd,start", buf, 2u);
  }
  return AnalyticsSendEventLazy(CFSTR("com.apple.timed.start"), &stru_100029288);
}

uint64_t sub_1000139D4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

NSDictionary *__cdecl sub_1000139DC(id a1)
{
  _QWORD v2[2];
  _QWORD v3[2];

  v2[0] = CFSTR("pid");
  v2[1] = CFSTR("mach");
  v3[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid());
  v3[1] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", mach_absolute_time());
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
}

void sub_1000140E4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100014104(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
    sub_10001BE7C();
  JUMPOUT(0x100014060);
}

void sub_1000141B0(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  const void *v5;
  NSObject *v6;
  void *v7;
  const __SCNetworkReachability *v8;
  SCNetworkReachabilityFlags v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  SCNetworkReachabilityFlags v13;
  SCNetworkReachabilityFlags flags;
  SCNetworkReachabilityContext buf;

  if (!a1)
    return;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v2 = *(void **)(a1 + 80);
  objc_sync_enter(v2);
  if (objc_msgSend((id)a1, "reachabilityTransaction"))
  {
    v3 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "We are already waiting on the network", (uint8_t *)&buf, 2u);
    }
    objc_sync_exit(v2);
    return;
  }
  *(_QWORD *)(a1 + 96) = os_transaction_create("waitForNetworkBeyondWantedThreshold");
  objc_sync_exit(v2);
  v4 = objc_msgSend(*(id *)(a1 + 64), "NTPServerAddress");
  if (*(_QWORD *)(a1 + 8))
  {
    if ((objc_msgSend(*(id *)(a1 + 104), "isEqualToString:", v4) & 1) != 0)
      goto LABEL_16;
    v5 = *(const void **)(a1 + 8);
  }
  else
  {
    v5 = 0;
  }
  v6 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 104);
    LODWORD(buf.version) = 134218242;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v5;
    WORD2(buf.info) = 2112;
    *(void **)((char *)&buf.info + 6) = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating new reachability target. target:%p _address:%@", (uint8_t *)&buf, 0x16u);
    v5 = *(const void **)(a1 + 8);
  }
  if (v5)
    CFRelease(v5);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 8) = SCNetworkReachabilityCreateWithName(0, (const char *)objc_msgSend(v4, "UTF8String"));
  objc_msgSend((id)a1, "setAddress:", v4);
LABEL_16:
  v8 = *(const __SCNetworkReachability **)(a1 + 8);
  if (v8)
  {
    flags = 0;
    if (SCNetworkReachabilityGetFlags(v8, &flags))
    {
      v9 = flags;
      v10 = qword_100033718;
      if ((flags & 6) == 2)
      {
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf.version) = 67109120;
          HIDWORD(buf.version) = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Current reachability flags are %u. So, I'm going to try for NTP now!", (uint8_t *)&buf, 8u);
          v9 = flags;
        }
        v11 = *(NSObject **)(a1 + 24);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100014574;
        v12[3] = &unk_100029320;
        v12[4] = a1;
        v13 = v9;
        dispatch_async(v11, v12);
        return;
      }
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.version) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "We want time and don't have network! Keeping timed alive until network comes up, since we are beyond our wanted threshold.", (uint8_t *)&buf, 2u);
      }
      buf.version = 0;
      buf.info = (void *)a1;
      buf.retain = (const void *(__cdecl *)(const void *))&CFRetain;
      buf.release = (void (__cdecl *)(const void *))sub_100014568;
      buf.copyDescription = 0;
      if (SCNetworkReachabilitySetCallback(*(SCNetworkReachabilityRef *)(a1 + 8), (SCNetworkReachabilityCallBack)sub_100014580, &buf))
      {
        if (SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(a1 + 8), *(dispatch_queue_t *)(a1 + 24)))
        {
          return;
        }
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
          sub_10001C104();
      }
      else if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      {
        sub_10001C090();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
    {
      sub_10001C01C();
    }
    objc_msgSend((id)a1, "setReachabilityTransaction:", 0);
    return;
  }
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
    sub_10001BFAC();
  objc_msgSend((id)a1, "setReachabilityTransaction:", 0);
}

void sub_10001454C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014568(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

void sub_100014574(uint64_t a1)
{
  sub_100014580(a1, *(_DWORD *)(a1 + 40), *(void **)(a1 + 32));
}

void sub_100014580(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  int v8;
  uint8_t buf[4];
  int v10;

  v5 = objc_opt_class(TMBackgroundNtpSource);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0)
    sub_10001C178();
  v6 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reachability changed to flags:%u", buf, 8u);
  }
  if ((a2 & 6) == 2)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100015CA0;
    v7[3] = &unk_100028F90;
    v8 = a2;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.proactiveNTPTime"), v7);
    sub_1000149B4(a3);
  }
}

void sub_1000146A0(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  _QWORD block[7];

  if (a1)
  {
    v4 = os_transaction_create("_executeNTPJob");
    xpc_retain(a2);
    v5 = *(NSObject **)(a1 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001472C;
    block[3] = &unk_100029348;
    block[4] = a2;
    block[5] = a1;
    block[6] = v4;
    dispatch_async(v5, block);
  }
}

void sub_10001472C(uint64_t a1)
{
  xpc_activity_state_t state;
  xpc_activity_state_t v3;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v13;
  xpc_activity_state_t v14;

  state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  v3 = state;
  if (state == 5 || state == 2)
  {
    v5 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "NTP job satisfied, state: %lu", (uint8_t *)&v13, 0xCu);
    }
    if ((objc_msgSend(*(id *)(a1 + 40), "isFetchingTime") & 1) == 0)
    {
      sub_1000141B0(*(_QWORD *)(a1 + 40));
      goto LABEL_15;
    }
    v6 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      v7 = "Already fetching NTP.";
      v8 = v6;
      v9 = OS_LOG_TYPE_INFO;
      v10 = 2;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    v11 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v3;
      v7 = "Received unknown job status %lu";
      v8 = v11;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 12;
      goto LABEL_13;
    }
  }
LABEL_15:

  xpc_release(*(xpc_object_t *)(a1 + 32));
}

unint64_t sub_10001492C()
{
  unsigned int v0;
  uint64_t v1;
  unint64_t v2;
  timespec v4;

  v4.tv_sec = 0;
  v4.tv_nsec = 0;
  clock_gettime(_CLOCK_UPTIME_RAW, &v4);
  v4.tv_sec += 2208988800;
  v0 = sntp_datestamp_from_timespec(v4.tv_sec, v4.tv_nsec);
  v2 = sntp_timestamp_from_datestamp(v0, v1);
  return (dword_100033710 + v2) | ((unint64_t)(dword_100033714 + HIDWORD(v2)) << 32);
}

double sub_100014990(unsigned int a1)
{
  return (double)(unsigned __int16)a1 * 0.0000152587891 + (double)HIWORD(a1);
}

id sub_1000149B4(id result)
{
  id *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  uint64_t v13;
  __objc2_class **p_superclass;
  __objc2_class **v15;
  __int128 v16;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  double v33;
  NSString *v34;
  NSObject *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  unsigned int v43;
  const char *v44;
  int v45;
  int *v46;
  char *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  const char *v60;
  id v61;
  unint64_t v62;
  int v63;
  int v64;
  _QWORD v65[10];
  int v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int v72;
  char v73;
  char v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  IOPMAssertionID AssertionID;
  __int128 v81;
  uint8_t buf[4];
  _BYTE v83[22];
  uint64_t v84;
  _BYTE v85[10];
  __int16 v86;
  _BYTE v87[10];
  double v88;
  _BYTE v89[6];
  _BYTE v90[10];
  __int16 v91;
  int v92;
  __int16 v93;
  int v94;
  __int16 v95;
  int v96;
  char v97[46];

  if (result)
  {
    v1 = (id *)result;
    dispatch_assert_queue_V2(*((dispatch_queue_t *)result + 3));
    result = objc_msgSend(v1, "isFetchingTime");
    if ((result & 1) == 0)
    {
      objc_msgSend(v1, "setFetchingTime:", 1);
      objc_msgSend(objc_msgSend(v1, "clock"), "coarseMonotonicTime");
      objc_msgSend(v1, "setLastFetchAttempt:");
      v61 = objc_msgSend(objc_msgSend(v1, "clock"), "machTime");
      v2 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Fetching NTP time.", buf, 2u);
      }
      v81 = xmmword_100020040;
      AssertionID = 0;
      v3 = IOPMAssertionCreateWithDescription(CFSTR("NoIdleSleepAssertion"), CFSTR("com.apple.timed.ntp"), 0, 0, 0, 110.0, CFSTR("TimeoutActionTurnOff"), &AssertionID);
      if (!(_DWORD)v3)
        goto LABEL_9;
      v4 = v3;
      v5 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001C2C8(v4, v5, v6, v7, v8, v9, v10, v11);
      if ((objc_msgSend(v1[8], "shouldPowerAssertionsBeOptional") & 1) == 0)
      {
        return objc_msgSend(v1, "setReachabilityTransaction:", 0);
      }
      else
      {
LABEL_9:
        v64 = objc_msgSend(v1[8], "NTPUseServicePort");
        v60 = (const char *)objc_msgSend(objc_msgSend(v1[8], "NTPServerAddress"), "UTF8String");
        v63 = objc_msgSend(objc_msgSend(v1[8], "NTPServerPort"), "intValue");
        v12 = malloc_type_calloc(3uLL, 0x50uLL, 0x10000404247E4FDuLL);
        v13 = 0;
        p_superclass = TMDaemonCore.superclass;
        v15 = TMDaemonCore.superclass;
        *(_QWORD *)&v16 = 67109378;
        v58 = v16;
        v59 = (uint64_t)v1;
        while (1)
        {
          *((_DWORD *)p_superclass + 452) = arc4random();
          *((_DWORD *)v15 + 453) = arc4random();
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v75 = 0u;
          sntp_client_unicast(v60, v13, v63, (timeval *)&v81, (uint64_t (*)(void))sub_10001492C, v64, (uint64_t)&v75);
          if ((_DWORD)v75)
          {
            v17 = qword_100033718;
            if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
            {
              v45 = *__error();
              v46 = __error();
              v47 = strerror(*v46);
              *(_DWORD *)buf = v58;
              *(_DWORD *)v83 = v45;
              *(_WORD *)&v83[4] = 2080;
              *(_QWORD *)&v83[6] = v47;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "errno is %d %s", buf, 0x12u);
            }
          }
          v18 = *((_DWORD *)p_superclass + 452);
          v19 = *((_DWORD *)v15 + 453);
          DWORD1(v75) -= v18;
          DWORD2(v75) -= v19;
          HIDWORD(v76) -= v18;
          LODWORD(v77) = v77 - v19;
          v20 = mach_absolute_time();
          v21 = objc_msgSend(objc_msgSend(v1, "clock"), "isMachTimeValid:", v61);
          v22 = sntp_calc_delay((uint64_t)&v75);
          v24 = sntp_datestamp_to_double(v22, v23);
          v25 = sntp_calc_mean((uint64_t)&v75);
          v27 = sntp_datestamp_to_timeval(v25, v26);
          v29 = v28;
          v62 = v62 & 0xFFFFFFFF00000000 | HIDWORD(v77);
          v30 = sntp_timestamp_from_shortstamp(SHIDWORD(v77));
          v31 = sntp_timestamp_to_datestamp(v30);
          v33 = sntp_datestamp_to_double(v31, v32);
          sntp_exchange_ntop(v97, 0x2Eu, (uint64_t)&v75);
          v34 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v97);
          v35 = qword_100033720;
          if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67112448;
            *(_DWORD *)v83 = v75;
            *(_WORD *)&v83[4] = 1024;
            *(_DWORD *)&v83[6] = DWORD1(v75);
            *(_WORD *)&v83[10] = 1024;
            *(_DWORD *)&v83[12] = DWORD2(v75);
            *(_WORD *)&v83[16] = 1024;
            *(_DWORD *)&v83[18] = HIDWORD(v75);
            LOWORD(v84) = 1024;
            *(_DWORD *)((char *)&v84 + 2) = v76;
            HIWORD(v84) = 1024;
            *(_DWORD *)v85 = DWORD1(v76);
            *(_WORD *)&v85[4] = 1024;
            *(_DWORD *)&v85[6] = DWORD2(v76);
            v86 = 1024;
            *(_DWORD *)v87 = HIDWORD(v76);
            *(_WORD *)&v87[4] = 1024;
            *(_DWORD *)&v87[6] = v77;
            LOWORD(v88) = 1024;
            *(_DWORD *)((char *)&v88 + 2) = BYTE4(v77) >> 6;
            HIWORD(v88) = 1024;
            *(_DWORD *)v89 = WORD4(v77);
            *(_WORD *)&v89[4] = 1024;
            *(_DWORD *)v90 = WORD5(v77);
            *(_WORD *)&v90[4] = 1024;
            *(_DWORD *)&v90[6] = WORD6(v77);
            v91 = 1024;
            v92 = HIWORD(v77);
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "cmd,ntpPacket,result,%d,t1,%x.%x,t2,%x.%x,t3,%x.%x,t4,%x.%x,leap,%02x,delay,%02hx.%02hx,dispersion,%02hx.%02hx,", buf, 0x56u);
            v35 = qword_100033720;
          }
          v36 = v27 - 2208988800;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67111938;
            *(_DWORD *)v83 = v13;
            *(_WORD *)&v83[4] = 1024;
            *(_DWORD *)&v83[6] = v75;
            *(_WORD *)&v83[10] = 2048;
            *(_QWORD *)&v83[12] = v20;
            *(_WORD *)&v83[20] = 2048;
            v84 = v36;
            *(_WORD *)v85 = 2048;
            *(_QWORD *)&v85[2] = (int)v29;
            v86 = 2048;
            *(double *)v87 = v24;
            *(_WORD *)&v87[8] = 2048;
            v88 = v33;
            *(_WORD *)v89 = 1024;
            *(_DWORD *)&v89[2] = 1;
            *(_WORD *)v90 = 2080;
            *(_QWORD *)&v90[2] = v97;
            v91 = 1024;
            v92 = v63;
            v93 = 1024;
            v94 = v21 ^ 1;
            v95 = 1024;
            v96 = v64;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "cmd,fetchTime,num,%d,result,%d,mach,%llu,tv_sec,%lld,tv_usec,%lld,delay,%lf,dispersion,%lf,more,%d,ip,%s,port,%d,slept,%d,use_service_port,%d", buf, 0x62u);
          }
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472;
          v65[2] = sub_100015190;
          v65[3] = &unk_100029370;
          v69 = v77;
          v70 = v78;
          v71 = v79;
          v67 = v75;
          v68 = v76;
          v65[6] = v36;
          v65[7] = v29;
          *(double *)&v65[8] = v24;
          *(double *)&v65[9] = v33;
          v65[4] = v34;
          v65[5] = v20;
          v66 = v13;
          v72 = v63;
          v73 = v21 ^ 1;
          v74 = v64;
          AnalyticsSendEventLazy(CFSTR("com.apple.timed.SNTP"), v65);
          if ((v21 & 1) == 0)
            break;
          v37 = v76;
          v38 = v78;
          v39 = v79;
          v12[2] = v77;
          v12[3] = v38;
          v12[4] = v39;
          *v12 = v75;
          v12[1] = v37;
          v1 = (id *)v59;
          p_superclass = (__objc2_class **)(TMDaemonCore + 8);
          v15 = (__objc2_class **)(TMDaemonCore + 8);
          if (v75 > 0xA || ((1 << v75) & 0x507) == 0)
          {
            v40 = *(_QWORD *)(v59 + 88);
            *(_QWORD *)(v59 + 88) = v40 + 1;
            if (v40 >= (uint64_t)objc_msgSend(*(id *)(v59 + 64), "NTPServicePortMaxRetries", v58))
            {
              v41 = qword_100033718;
              if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
              {
                v42 = *(_QWORD *)(v59 + 88);
                v43 = objc_msgSend(*(id *)(v59 + 64), "NTPUseServicePort");
                *(_DWORD *)buf = 134218242;
                v44 = "high";
                if (v43)
                  v44 = "low";
                *(_QWORD *)v83 = v42;
                *(_WORD *)&v83[8] = 2080;
                *(_QWORD *)&v83[10] = v44;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "NTP failed %lld times, switching off of %s source port.", buf, 0x16u);
              }
              *(_QWORD *)(v59 + 88) = 0;
              objc_msgSend(*(id *)(v59 + 64), "setNTPUseServicePort:", objc_msgSend(*(id *)(v59 + 64), "NTPUseServicePort") ^ 1);
            }
          }
          ++v13;
          v12 += 5;
          if (v13 == 3)
            return objc_msgSend(objc_msgSend(v1, "clock", v58), "montonicTimeForMachTime:toQueue:withCompletionHandler:");
        }
        v48 = qword_100033718;
        v1 = (id *)v59;
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
          sub_10001C28C(v48);
        objc_msgSend((id)v59, "setFetchingTime:", 0, v58);
        v49 = IOPMAssertionRelease(AssertionID);
        if ((_DWORD)v49)
        {
          v50 = v49;
          v51 = qword_100033718;
          if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
            sub_10001C228(v50, v51, v52, v53, v54, v55, v56, v57);
        }
        sub_100015348(v59);
        return objc_msgSend(objc_msgSend(v1, "clock", v58), "montonicTimeForMachTime:toQueue:withCompletionHandler:");
      }
    }
  }
  return result;
}

NSDictionary *sub_100015190(uint64_t a1)
{
  NSNumber *v2;
  uint64_t v3;
  _QWORD v5[12];
  _QWORD v6[12];

  v5[0] = CFSTR("num");
  v6[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v5[1] = CFSTR("result");
  v6[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
  v5[2] = CFSTR("mach");
  v6[2] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v5[3] = CFSTR("tv_sec");
  v6[3] = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", *(_QWORD *)(a1 + 48));
  v5[4] = CFSTR("tv_usec");
  v6[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v5[5] = CFSTR("delay");
  v6[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 64));
  v5[6] = CFSTR("dispersion");
  v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 72));
  v3 = *(_QWORD *)(a1 + 32);
  v6[6] = v2;
  v6[7] = v3;
  v5[7] = CFSTR("ip");
  v5[8] = CFSTR("port");
  v6[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 164));
  v5[9] = CFSTR("slept");
  v6[9] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 168));
  v5[10] = CFSTR("use_service_port");
  v6[10] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 169));
  v5[11] = CFSTR("ipv6");
  v6[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_DWORD *)(a1 + 160) == 30);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 12);
}

void sub_100015348(uint64_t a1)
{
  uint64_t v2;
  double v3;
  dispatch_time_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD block[6];

  if (a1)
  {
    if ((uint64_t)objc_msgSend((id)a1, "burstRetryCount") < 1)
    {
      v6 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Done bursting", v7, 2u);
        v6 = qword_100033718;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Finishing transaction after unsuccessful exchange", v7, 2u);
      }
      objc_msgSend((id)a1, "setReachabilityTransaction:", 0);
      objc_msgSend(*(id *)(a1 + 72), "checkActiveTimeSourceRequired");
    }
    else
    {
      objc_msgSend((id)a1, "setBurstRetryCount:", (char *)objc_msgSend((id)a1, "burstRetryCount") - 1);
      v2 = os_transaction_create("TMBackgroundNtpSource retry");
      objc_msgSend(*(id *)(a1 + 64), "NTPBurstRetryInterval");
      v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
      v5 = *(NSObject **)(a1 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100015744;
      block[3] = &unk_100028E18;
      block[4] = a1;
      block[5] = v2;
      dispatch_after(v4, v5, block);
    }
  }
}

void sub_10001549C(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[8];
  _QWORD v31[6];
  _QWORD v32[6];

  v6 = mach_absolute_time();
  v7 = sntp_clock_select(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 56));
  if (a2 <= 0.0 || v7 == 0)
  {
    sub_100015348(*(_QWORD *)(a1 + 32));
  }
  else
  {
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 48);
    if (v6 <= v10)
      sub_10001C32C();
    v11 = sub_100006AF0(v10, v6) + a2;
    v12 = sntp_calc_error(v9);
    v14 = sntp_datestamp_to_double(v12, v13);
    v15 = sntp_calc_delay(v9);
    v17 = v14 + sntp_datestamp_to_double(v15, v16) + a3;
    v18 = sntp_calc_mean(v9);
    v31[0] = CFSTR("TMCommand");
    v31[1] = CFSTR("TMSource");
    v32[0] = CFSTR("TMSetSourceTime");
    v32[1] = CFSTR("NTP");
    v31[2] = CFSTR("TMCurrentTime");
    v32[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sntp_datestamp_to_double(v18, v19) - (kCFAbsoluteTimeIntervalSince1970 + 2208988800.0));
    v31[3] = CFSTR("TMTimeError");
    v32[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17);
    v31[4] = CFSTR("TMMachTime");
    v32[4] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v6);
    v31[5] = CFSTR("TMRtcTime");
    v32[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setSourceTime:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 6));
    objc_msgSend(*(id *)(a1 + 32), "setBurstRetryCount:", 0);
    SCNetworkReachabilitySetCallback(*(SCNetworkReachabilityRef *)(*(_QWORD *)(a1 + 32) + 8), 0, 0);
    SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(*(_QWORD *)(a1 + 32) + 8), 0);
    v20 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Finishing transaction after successful exchange", v30, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setReachabilityTransaction:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setFetchingTime:", 0);
  free(*(void **)(a1 + 40));
  v21 = IOPMAssertionRelease(*(_DWORD *)(a1 + 60));
  if ((_DWORD)v21)
  {
    v22 = v21;
    v23 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001C228(v22, v23, v24, v25, v26, v27, v28, v29);
  }
}

void sub_100015744(uint64_t a1)
{
  sub_1000149B4(*(_QWORD *)(a1 + 32));

}

double sub_100015B78(void *a1)
{
  double v1;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v1 = 0.0;
  if (a1)
  {
    objc_msgSend(a1, "lastFetchAttempt");
    if (v3 >= 0.1)
    {
      objc_msgSend(objc_msgSend(a1, "clock"), "coarseMonotonicTime");
      v5 = v4;
      objc_msgSend(a1, "lastFetchAttempt");
      v7 = v5 - v6;
      objc_msgSend(a1, "schedulingInterval");
      v9 = v8 - v7;
      if (v9 >= 0.0)
        return v9;
      else
        return 0.0;
    }
  }
  return v1;
}

void sub_100015BF0(uint64_t a1)
{
  sub_1000141B0(*(_QWORD *)(a1 + 32));
}

void sub_100015BF8(uint64_t a1, void *a2)
{
  sub_1000146A0(*(_QWORD *)(a1 + 32), a2);
}

NSDictionary *sub_100015CA0(uint64_t a1)
{
  const __CFString *v2;
  NSNumber *v3;

  v2 = CFSTR("networkReachabilityFlags");
  v3 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1);
}

void sub_100015D20(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100015D34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

NSDictionary *sub_1000165BC(uint64_t a1)
{
  double v2;
  _QWORD v4[4];
  _QWORD v5[4];

  v4[0] = CFSTR("clamp_difference");
  v2 = *(double *)(a1 + 40);
  if (v2 >= 0.0)
    v2 = *(double *)(a1 + 48);
  v5[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", fabs(v2));
  v4[1] = CFSTR("src");
  v5[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4(*(_QWORD *)(a1 + 32)));
  v4[2] = CFSTR("input_unc");
  v5[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 56));
  v4[3] = CFSTR("estimate_unc");
  v5[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 64));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
}

id *sub_100016790(id *result)
{
  id *v1;
  id v2;
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  unsigned int v9;
  double v10;
  uint64_t v11;
  unsigned int v12;
  double v13;
  int v14;
  double v15;
  uint64_t v16;
  unsigned int v17;
  double v18;
  unsigned int v19;
  double v20;
  _QWORD v21[18];
  _QWORD v22[18];
  uint8_t buf[4];
  id v24;

  if (!result)
    return result;
  v1 = result;
  v2 = objc_msgSend(result[1], "objectForKey:", CFSTR("TMAutomaticTimeEnabled"));
  if (v2)
  {
    v3 = v2;
    v4 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating old coupled value (%@)\n", buf, 0xCu);
    }
    v5 = objc_msgSend(v1[1], "objectForKey:", CFSTR("TMAutomaticTimeZoneEnabled"));
    v6 = objc_msgSend(v1[1], "objectForKey:", CFSTR("TMAutomaticTimeOnlyEnabled"));
    if (v5)
    {
      v7 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Time zone key present (%@), not migrating\n", buf, 0xCu);
      }
      if (v6)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(v1[1], "setObject:forKey:", v3, CFSTR("TMAutomaticTimeZoneEnabled"));
      if (v6)
      {
LABEL_9:
        v8 = qword_100033718;
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
          sub_10001C354((uint64_t)v6, v8);
        goto LABEL_13;
      }
    }
    objc_msgSend(v1[1], "setObject:forKey:", v3, CFSTR("TMAutomaticTimeOnlyEnabled"));
LABEL_13:
    objc_msgSend(v1[1], "removeObjectForKey:", CFSTR("TMAutomaticTimeEnabled"));
    objc_msgSend(v1[1], "synchronize");
  }
  v22[0] = &__kCFBooleanTrue;
  v22[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v1, "isAppleTV", CFSTR("TMAutomaticTimeOnlyEnabled"), CFSTR("TMAutomaticTimeZoneEnabled")) ^ 1);
  v21[2] = CFSTR("NtpSchedulingInterval");
  v9 = objc_msgSend(v1, "isAppleTV");
  v10 = 900.0;
  if (v9)
    v10 = 10.0;
  v22[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10);
  v21[3] = CFSTR("NtpBurstRetryAttempts");
  if (objc_msgSend(v1, "isAppleTV"))
    v11 = 0;
  else
    v11 = 3;
  v22[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11);
  v22[4] = &off_10002C238;
  v21[4] = CFSTR("NtpBurstRetryInterval");
  v21[5] = CFSTR("NtpUnsetSchedulingInterval");
  v12 = objc_msgSend(v1, "isAppleTV");
  v13 = 300.0;
  if (v12)
    v13 = 10.0;
  v22[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13);
  v22[6] = &__kCFBooleanTrue;
  v21[6] = CFSTR("NtpUseServicePort");
  v21[7] = CFSTR("NtpServicePortMaxRetries");
  v22[7] = &off_10002C7A0;
  v22[8] = CFSTR("123");
  v21[8] = CFSTR("NtpTimeServerPort");
  v21[9] = CFSTR("FetchTimeOnWake");
  v22[9] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v1, "isMac"));
  v21[10] = CFSTR("UseFilesystemTimestamp");
  v22[10] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", sub_100009CF0());
  v22[11] = &off_10002C228;
  v21[11] = CFSTR("SettimeofdayThreshold");
  v21[12] = CFSTR("TimeProvider");
  v22[12] = CFSTR("Filtered");
  v21[13] = CFSTR("RTCWakeUncertainty");
  v14 = sub_100009CF0();
  v15 = 0.5;
  if (v14)
    v15 = 0.0;
  v22[13] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15);
  v21[14] = CFSTR("CommandHistorySize");
  if (os_variant_has_internal_diagnostics("com.apple.timed"))
    v16 = 1500;
  else
    v16 = 0;
  v22[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16);
  v21[15] = CFSTR("RTCMachSyncInterval");
  v22[15] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_100006A10() * 5.0);
  v21[16] = CFSTR("RTCFrequencyTolerance");
  v17 = objc_msgSend(v1, "isWatch");
  v18 = 0.00003;
  if (v17)
    v18 = 0.000008;
  v22[16] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18);
  v21[17] = CFSTR("RTCFrequencyNoiseDensity");
  v19 = objc_msgSend(v1, "isWatch");
  v20 = 2.78e-14;
  if (v19)
    v20 = 2.78e-16;
  v22[17] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20);
  objc_msgSend(v1[1], "registerDefaults:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 18));
  return (id *)objc_msgSend(v1, "setAccurateThresholds:", objc_msgSend(v1, "shouldUseAccurateThresholdsByDefault"));
}

const __CFString *sub_100016F5C(uint64_t a1)
{
  if (a1)
    return CFSTR("time.apple.com");
  else
    return 0;
}

uint64_t sub_1000172B0(uint64_t a1, void *a2)
{
  objc_opt_self();
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("TimeSourceGnssValidPos")) & 1) != 0
    || (objc_msgSend(a2, "isEqualToString:", CFSTR("GPS")) & 1) != 0
    || (objc_msgSend(a2, "isEqualToString:", CFSTR("TimeSourceGnss")) & 1) != 0
    || (objc_msgSend(a2, "isEqualToString:", CFSTR("NTP")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return (uint64_t)objc_msgSend(a2, "isEqualToString:", CFSTR("TMLSSourceComputedReliable"));
  }
}

id sub_100017698(id result, void *a2)
{
  void *v3;

  if (result)
  {
    v3 = result;
    result = (id)sub_1000172B0((uint64_t)TMTimeSynthesizer, objc_msgSend(a2, "source"));
    if ((_DWORD)result)
      return objc_msgSend(v3, "setLastQualityTime:", a2);
  }
  return result;
}

_QWORD *sub_1000177E0(_QWORD *result, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  long double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  int v30;
  _QWORD v31[5];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  double v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  long double v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  double v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  double v63;
  __int16 v64;
  int v65;

  if (result)
  {
    v3 = result;
    result[9] = 0;
    objc_msgSend(a2, "rtc_s");
    *((_QWORD *)v3 + 1) = v4;
    objc_msgSend(a2, "utc_s");
    *((_QWORD *)v3 + 2) = v5;
    objc_msgSend(a2, "utcUnc_s");
    v7 = v6;
    objc_msgSend(a2, "utcUnc_s");
    *((double *)v3 + 6) = v7 * v8;
    v9 = *((double *)v3 + 12);
    if (v9 < 0.00001)
      *((_QWORD *)v3 + 3) = 0x3FF0000000000000;
    *((double *)v3 + 7) = v9 * v9;
    *((_QWORD *)v3 + 8) = 0;
    *((_BYTE *)v3 + 120) = 1;
    *((_DWORD *)v3 + 26) = 1;
    objc_msgSend(v3, "setLastInputSource:", objc_msgSend(a2, "source"));
    v10 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *((_QWORD *)v3 + 16);
      v12 = *((_QWORD *)v3 + 1);
      v13 = *((_QWORD *)v3 + 2);
      v14 = sqrt(*((double *)v3 + 6));
      v15 = *((_QWORD *)v3 + 3);
      v16 = sqrt(*((double *)v3 + 7));
      v17 = sqrt(*((double *)v3 + 8));
      v18 = log10(*((long double *)v3 + 11));
      objc_msgSend(a2, "rtc_s");
      v20 = v19;
      objc_msgSend(a2, "utc_s");
      v22 = v21;
      objc_msgSend(a2, "utcUnc_s");
      v24 = v23;
      v25 = objc_msgSend(a2, "source");
      v26 = *((_QWORD *)v3 + 2);
      v27 = *((_QWORD *)v3 + 3);
      v28 = *((double *)v3 + 7);
      v29 = sqrt(*((double *)v3 + 6));
      v30 = *((_DWORD *)v3 + 26);
      *(_DWORD *)buf = 138416386;
      v33 = v11;
      v34 = 2048;
      v35 = v12;
      v36 = 2048;
      v37 = v13;
      v38 = 2048;
      v39 = v14;
      v40 = 2048;
      v41 = v15;
      v42 = 2048;
      v43 = v16;
      v44 = 2048;
      v45 = v17;
      v46 = 2048;
      v47 = v18;
      v48 = 2048;
      v49 = v20;
      v50 = 2048;
      v51 = v22;
      v52 = 2048;
      v53 = v24;
      v54 = 2112;
      v55 = v25;
      v56 = 2048;
      v57 = v26;
      v58 = 2048;
      v59 = v29;
      v60 = 2048;
      v61 = v27;
      v62 = 2048;
      v63 = sqrt(v28);
      v64 = 1024;
      v65 = v30;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@,SynthesizedClock,rtc,%.6lf,utc,%.6lf,utcUnc,%.6lf,sf,%.8lf,sfUnc,%.8lf,utcSfCov,%.8lf,logNoise,%.6lf,timeRtc,%.6lf,timeUtc,%.6lf,timeUnc,%.6lf,timeSource,%@,predUtc,%.6lf,predUtcUnc,%.6lf,predSf,%.8lf,predSfUnc,%.8lf,measNumber,%d", buf, 0xA8u);
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100017AC4;
    v31[3] = &unk_100028BA0;
    v31[4] = v3;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.TDTFStartWithQuality"), v31);
    objc_msgSend(v3, "setLastQualityTime:", 0);
    if (sub_1000172B0((uint64_t)TMTimeSynthesizer, objc_msgSend(a2, "source")))
      objc_msgSend(v3, "setLastQualityTime:", a2);
    return objc_msgSend(v3, "displayLastQualityTime");
  }
  return result;
}

NSDictionary *sub_100017AC4(uint64_t a1)
{
  _QWORD v3[6];
  _QWORD v4[6];

  v3[0] = CFSTR("_rtc");
  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 8));
  v3[1] = CFSTR("_utc");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 16));
  v3[2] = CFSTR("_utc_var");
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 48));
  v3[3] = CFSTR("_rateSf");
  v4[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 24));
  v3[4] = CFSTR("_sf_var");
  v4[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 56));
  v3[5] = CFSTR("_utc_sf_cov");
  v4[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 64));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
}

uint64_t sub_100017BF0(uint64_t result)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  double v13;
  __int16 v14;
  uint64_t v15;

  if (result)
  {
    v1 = result;
    v2 = *(double *)(result + 24);
    v3 = *(_QWORD *)(result + 56);
    if (*(double *)(result + 96) >= 0.000015)
    {
      v4 = 0x3FF0001F75104D55;
      if (v2 <= 1.00003)
      {
        v4 = 0x3FEFFF822BBECAACLL;
        if (v2 >= 0.99994)
          return result;
        v5 = 0x3E2EEC7BD512B572;
      }
      else
      {
        v5 = 0x3E0EEC7BD512B572;
      }
    }
    else
    {
      v4 = 0x3FF0000DA1A93294;
      if (v2 <= 1.000013)
      {
        v4 = 0x3FEFFFEB074A771DLL;
        if (v2 >= 0.99999)
          return result;
        v5 = 0x3DDB7CDFD9D7BDBCLL;
      }
      else
      {
        v5 = 0x3DE73A28AC8E9F0ALL;
      }
    }
    *(_QWORD *)(result + 24) = v4;
    *(_QWORD *)(result + 56) = v5;
    v6 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001C3C8(v6, v2);
    v7 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(v1 + 128);
      *(_DWORD *)buf = 138412802;
      v11 = v8;
      v12 = 2048;
      v13 = v2;
      v14 = 2048;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@,clamped,_rateSf,%f,_sf_var,%f", buf, 0x20u);
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100017DB0;
    v9[3] = &unk_1000291B0;
    *(double *)&v9[4] = v2;
    v9[5] = v3;
    return AnalyticsSendEventLazy(CFSTR("com.apple.timed.TDTFClamped"), v9);
  }
  return result;
}

NSDictionary *sub_100017DB0(uint64_t a1)
{
  NSNumber *v2;
  _QWORD v4[2];
  _QWORD v5[2];

  v4[0] = CFSTR("_rateSf");
  v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 32));
  v4[1] = CFSTR("_sf_var");
  v5[0] = v2;
  v5[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
}

NSDictionary *sub_100018A68(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("_rtc");
  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 8));
  v3[1] = CFSTR("rtc_s");
  objc_msgSend(*(id *)(a1 + 40), "rtc_s");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

NSDictionary *sub_100018B1C(uint64_t a1)
{
  NSNumber *v2;
  uint64_t v3;
  _QWORD v5[9];
  _QWORD v6[9];

  v5[0] = CFSTR("rtc_s");
  objc_msgSend(*(id *)(a1 + 32), "rtc");
  v6[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[1] = CFSTR("t_s");
  objc_msgSend(*(id *)(a1 + 32), "utc");
  v6[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[2] = CFSTR("rateSf");
  objc_msgSend(*(id *)(a1 + 32), "rateSf");
  v6[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[3] = CFSTR("utc_var");
  objc_msgSend(*(id *)(a1 + 32), "utc_var");
  v6[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[4] = CFSTR("sf_var");
  objc_msgSend(*(id *)(a1 + 32), "sf_var");
  v6[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[5] = CFSTR("utc_sf_cov");
  objc_msgSend(*(id *)(a1 + 32), "utc_sf_cov");
  v6[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[6] = CFSTR("src");
  v6[6] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 40), "source")));
  v5[7] = CFSTR("input_unc");
  objc_msgSend(*(id *)(a1 + 40), "utcUnc_s");
  v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[8] = CFSTR("_name");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 128);
  v6[7] = v2;
  v6[8] = v3;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 9);
}

NSDictionary *sub_100018CD8(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[4];
  _QWORD v5[4];

  v2 = *(_QWORD *)(a1 + 32);
  v5[0] = *(_QWORD *)(v2 + 128);
  v4[0] = CFSTR("_name");
  v4[1] = CFSTR("_rejects");
  v5[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(v2 + 72));
  v4[2] = CFSTR("innv");
  v5[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 48));
  v4[3] = CFSTR("src");
  v5[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 40), "source")));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
}

NSDictionary *sub_100018DC0(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("rtc_s");
  objc_msgSend(*(id *)(a1 + 32), "rtc");
  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[1] = CFSTR("t_s");
  objc_msgSend(*(id *)(a1 + 32), "utc");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

NSDictionary *sub_100018E84(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("rtc_s");
  objc_msgSend(*(id *)(a1 + 32), "rtc");
  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[1] = CFSTR("t_s");
  objc_msgSend(*(id *)(a1 + 32), "utc");
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
}

NSDictionary *sub_100018F48(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[8];
  _QWORD v5[8];

  v2 = *(_QWORD *)(a1 + 32);
  v5[0] = *(_QWORD *)(v2 + 128);
  v4[0] = CFSTR("_name");
  v4[1] = CFSTR("_rtc");
  v5[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v2 + 8));
  v4[2] = CFSTR("_utc");
  v5[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 16));
  v4[3] = CFSTR("_utc_unc");
  v5[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sqrt(*(double *)(*(_QWORD *)(a1 + 32) + 48)));
  v4[4] = CFSTR("_rateSf");
  v5[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 24));
  v4[5] = CFSTR("_sf_var");
  v5[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 56));
  v4[6] = CFSTR("_utc_sf_cov");
  v5[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 64));
  v4[7] = CFSTR("src");
  v5[7] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_1000096C4((uint64_t)objc_msgSend(*(id *)(a1 + 40), "source")));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 8);
}

uint64_t sntp_shortstamp_hton(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t sntp_shortstamp_ntoh(unsigned int a1)
{
  return __rev16(a1);
}

unint64_t sntp_timestamp_hton(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_ntoh(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_from_shortstamp(int a1)
{
  return (unsigned __int16)a1 | ((unint64_t)HIWORD(a1) << 48);
}

uint64_t sntp_timestamp_to_shortstamp(uint64_t a1)
{
  return HIDWORD(a1) & 0xFFFF0000 | (unsigned __int16)a1;
}

uint64_t sntp_timestamp_to_datestamp(uint64_t result)
{
  return result;
}

unint64_t sntp_timestamp_from_datestamp(unsigned int a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFF00000000 | a1;
}

uint64_t sntp_datestamp_to_nsec(unint64_t a1, unint64_t a2)
{
  return 1000000000 * a1
       + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
       + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64);
}

uint64_t sntp_datestamp_subsecs_to_nsec(unint64_t a1)
{
  uint64_t v1;

  v1 = (a1 * (unsigned __int128)0x3B9ACA00uLL) >> 64;
  if (1000000000 * a1 < 0x8000000000000000)
    return v1;
  else
    return (v1 + 1);
}

uint64_t sntp_datestamp_to_timespec(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
                 + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64))
       / 1000000000;
}

uint64_t sntp_datestamp_from_timespec(uint64_t a1, uint64_t a2)
{
  __udivti3(499999744, a2, 1000000000, 0);
  return a1;
}

uint64_t sntp_datestamp_to_timeval(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
                 + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64))
       / 1000000000;
}

double sntp_datestamp_to_double(uint64_t a1, unint64_t a2)
{
  return (double)a2 * 5.42101086e-20 + (double)a1;
}

double sntp_datestamp_from_double(double a1)
{
  return a1 - (double)(uint64_t)a1;
}

uint64_t sntp_calc_offset(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned __int128 v14;

  v2 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 4));
  v4 = v3;
  v5 = -v2;
  v6 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 12));
  v8 = v7;
  v9 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 20));
  v11 = v10;
  v12 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 28));
  v14 = __PAIR128__(v5 - (v4 != 0) + __CFADD__(-v4, v8) + v6 + (unint64_t)__CFADD__(v8 - v4, v11) + v9, v8 - v4 + v11)- v13;
  return (__CFADD__((_QWORD)v14, (unint64_t)(*((_QWORD *)&v14 + 1) - v12) >> 63) + *((_QWORD *)&v14 + 1) - v12) >> 1;
}

uint64_t sntp_calc_delay(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v2 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 4));
  v4 = v3;
  v5 = -v2;
  v6 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 12));
  v8 = v7;
  v9 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 20));
  v11 = v10;
  v12 = -v9;
  v13 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 28));
  return v13
       + ((__PAIR128__(v5 - (v4 != 0) + (unint64_t)__CFADD__(-v4, v8) + v6, v8 - v4) - v11 + __PAIR128__(v12, v14)) >> 64);
}

uint64_t sntp_calc_mean(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 12));
  v4 = v3;
  v5 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 20));
  if (__CFADD__(v4, v6))
    v7 = v2 + 1;
  else
    v7 = v2;
  return (uint64_t)((__PAIR128__(v7, v4 + v6) + __PAIR128__(v5, (v2 + (unint64_t)__CFADD__(v4, v6) + v5) >> 63)) >> 64) >> 1;
}

uint64_t sntp_calc_error(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v10;

  v2 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 40));
  v3 = sntp_timestamp_to_datestamp(v2);
  v5 = v4;
  v6 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 44));
  v7 = sntp_timestamp_to_datestamp(v6);
  if (__CFADD__(v5, v3 >> 63))
    v9 = v3 + 1;
  else
    v9 = v3;
  *((_QWORD *)&v10 + 1) = v9;
  *(_QWORD *)&v10 = v5 + (v3 >> 63);
  return ((v10 >> 1) + __PAIR128__(v7, v8)) >> 64;
}

unint64_t sntp_clock_select(unint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _DWORD *v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unsigned int v36;
  unint64_t v37;

  if (!a2)
    return 0;
  v2 = a1;
  v3 = 0;
  v4 = a1 + 80 * a2;
  v5 = a1;
  do
  {
    if (!*(_DWORD *)v5 && *(_BYTE *)(v5 + 37))
      ++v3;
    v5 += 80;
  }
  while (v5 < v4);
  result = 0;
  v7 = 0;
  v8 = 0;
  v31 = v3 >> 1;
  do
  {
    if (!*(_DWORD *)v2 && *(_BYTE *)(v2 + 37))
    {
      v32 = v8;
      v33 = v7;
      v34 = result;
      v9 = sntp_calc_delay(v2);
      v10 = (_DWORD *)(v2 + 80);
      v37 = v11;
      if (v2 + 80 >= v4)
      {
        v36 = 1;
        v35 = v2;
      }
      else
      {
        v36 = 1;
        v35 = v2;
        do
        {
          if (!*v10)
          {
            v12 = sntp_calc_offset(v2);
            v14 = v13;
            v15 = sntp_calc_offset((uint64_t)v10);
            v17 = v16;
            v18 = sntp_calc_delay(v2);
            v20 = v19;
            v21 = sntp_calc_delay((uint64_t)v10);
            if ((__int128)(__PAIR128__(v18, v20) + __PAIR128__(v12, v14)) >= (__int128)(__PAIR128__(v15, v17)
                                                                                       - __PAIR128__(v21, v22))
              && (__int128)(__PAIR128__(v21, v22) + __PAIR128__(v15, v17)) >= (__int128)(__PAIR128__(v12, v14)
                                                                                       - __PAIR128__(v18, v20)))
            {
              ++v36;
              v23 = sntp_calc_delay((uint64_t)v10);
              v25 = v37;
              v26 = (_DWORD *)v35;
              if ((__int128)__PAIR128__(v23, v24) < (__int128)__PAIR128__(v9, v37))
                v26 = v10;
              v35 = (unint64_t)v26;
              if ((__int128)__PAIR128__(v23, v24) < (__int128)__PAIR128__(v9, v37))
              {
                v9 = v23;
                v25 = v24;
              }
              v37 = v25;
            }
          }
          v10 += 20;
        }
        while ((unint64_t)v10 < v4);
      }
      v8 = v32;
      v7 = v33;
      v27 = v37;
      result = v34;
      v28 = v35;
      v29 = (__int128)__PAIR128__(v9, v37) < (__int128)__PAIR128__(v32, v33) || v34 == 0;
      if (v29)
        v30 = v9;
      else
        v30 = v32;
      if (!v29)
      {
        v27 = v33;
        v28 = v34;
      }
      if (v36 > v31)
      {
        v7 = v27;
        v8 = v30;
        result = v28;
      }
    }
    v2 += 80;
  }
  while (v2 < v4);
  return result;
}

unint64_t sntp_packet_hton@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  __int128 v5;
  uint64_t v6;

  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  v5 = *a1;
  v6 = *((_QWORD *)a1 + 2);
  sntp_header_hton((int *)&v5, a2);
  *(_QWORD *)(a2 + 24) = sntp_timestamp_hton(*((_QWORD *)a1 + 3));
  *(_QWORD *)(a2 + 32) = sntp_timestamp_hton(*((_QWORD *)a1 + 4));
  result = sntp_timestamp_hton(*((_QWORD *)a1 + 5));
  *(_QWORD *)(a2 + 40) = result;
  return result;
}

unint64_t sntp_packet_ntoh@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  __int128 v5;
  uint64_t v6;

  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  v5 = *a1;
  v6 = *((_QWORD *)a1 + 2);
  sntp_header_ntoh((int *)&v5, a2);
  *(_QWORD *)(a2 + 24) = sntp_timestamp_ntoh(*((_QWORD *)a1 + 3));
  *(_QWORD *)(a2 + 32) = sntp_timestamp_ntoh(*((_QWORD *)a1 + 4));
  result = sntp_timestamp_ntoh(*((_QWORD *)a1 + 5));
  *(_QWORD *)(a2 + 40) = result;
  return result;
}

const char *sntp_exchange_ntop(char *a1, socklen_t a2, uint64_t a3)
{
  return inet_ntop(*(_DWORD *)(a3 + 76), (const void *)(a3 + 60), a1, a2);
}

uint64_t sntp_print_timestamp(int a1, const char *a2, unint64_t a3)
{
  int v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v6 = HIDWORD(a3);
  v7 = sntp_timestamp_to_datestamp(a3);
  v9 = sntp_datestamp_to_timespec(v7, v8);
  return printf("%*s: %08X.%08X (%ld.%09lu)\n", a1, a2, v3, v6, v9, v10);
}

uint64_t sntp_print_shortstamp(int a1, const char *a2, int a3)
{
  int v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double v10;

  v5 = HIWORD(a3);
  v6 = (unsigned __int16)a3;
  v7 = sntp_timestamp_from_shortstamp(a3);
  v8 = sntp_timestamp_to_datestamp(v7);
  v10 = sntp_datestamp_to_double(v8, v9);
  return printf("%*s: %04X.%04X (%.9lf)\n", a1, a2, v6, v5, v10);
}

uint64_t sntp_print_datestamp(int a1, const char *a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  double v7;

  v5 = *a3;
  v6 = a3[1];
  v7 = sntp_datestamp_to_double(*a3, v6);
  return printf("%*s: %016llX.%016llX (%.9lf)\n", a1, a2, v5, v6, v7);
}

uint64_t sntp_print_header(int a1, unsigned __int8 *a2)
{
  char *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  __uint32_t v8;
  uint64_t v9;
  __uint32_t v10;
  uint64_t v11;
  __uint32_t v12;
  unsigned int v13;
  uint64_t v14;
  __uint32_t v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  int v19;
  int v20;
  float v21;
  char __str[16];

  v6 = *((_DWORD *)a2 + 3);
  v4 = (char *)(a2 + 12);
  v5 = v6;
  if (*(v4 - 11) > 1u)
  {
    inet_ntop(2, v4, __str, 0x10u);
  }
  else
  {
    v7 = bswap32(v5);
    if (v7 > 0x7Fu)
      v8 = __maskrune(v7, 0x40000uLL);
    else
      v8 = _DefaultRuneLocale.__runetype[v7] & 0x40000;
    if (v8)
      v9 = v7;
    else
      v9 = 32;
    if (BYTE1(v7) > 0x7Fu)
      v10 = __maskrune(BYTE1(v7), 0x40000uLL);
    else
      v10 = _DefaultRuneLocale.__runetype[BYTE1(v7)] & 0x40000;
    if (v10)
      v11 = BYTE1(v7);
    else
      v11 = 32;
    if (BYTE2(v7) > 0x7Fu)
      v12 = __maskrune(BYTE2(v7), 0x40000uLL);
    else
      v12 = _DefaultRuneLocale.__runetype[BYTE2(v7)] & 0x40000;
    v13 = HIBYTE(v7);
    if (v12)
      v14 = BYTE2(v7);
    else
      v14 = 32;
    if ((v7 & 0x80000000) != 0)
      v15 = __maskrune(HIBYTE(v7), 0x40000uLL);
    else
      v15 = _DefaultRuneLocale.__runetype[v13] & 0x40000;
    if (v15)
      v16 = v13;
    else
      v16 = 32;
    snprintf(__str, 7uLL, "\"%c%c%c%c\"", v9, v11, v14, v16);
  }
  v17 = *a2;
  v18 = a2[1];
  v19 = a2[2];
  v20 = (char)a2[3];
  v21 = sntp_precision_decode(v20);
  printf("%*s: %02X (li:%d vn:%d mode:%d)\n%*s: %02X (%u)\n%*s: %02X (%u)\n%*s: %02X (%e)\n", a1, "header", v17, v17 >> 6, (v17 >> 3) & 7, v17 & 7, a1, "stratum", v18, v18, a1, "poll", v19, 1 << v19, a1, "precision", v20, v21);
  sntp_print_shortstamp(a1, "delay", *((_DWORD *)a2 + 1));
  sntp_print_shortstamp(a1, "dispersion", *((_DWORD *)a2 + 2));
  printf("%*s: %08X (%s)\n", a1, "ref", *((_DWORD *)a2 + 3), __str);
  return sntp_print_timestamp(a1, "t_ref", *((_QWORD *)a2 + 2));
}

uint64_t sntp_print_exchange(unsigned int *a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  char v19[16];
  uint64_t v20;

  printf("sntp_exchange {\n%14s: %d (%s)\n", "result", *a1, (&off_100029500)[*a1]);
  *(_OWORD *)v19 = *(_OWORD *)(a1 + 9);
  v20 = *(_QWORD *)(a1 + 13);
  sntp_print_header(14, (unsigned __int8 *)v19);
  sntp_print_timestamp(14, "t1", *(_QWORD *)(a1 + 1));
  sntp_print_timestamp(14, "t2", *(_QWORD *)(a1 + 3));
  sntp_print_timestamp(14, "t3", *(_QWORD *)(a1 + 5));
  sntp_print_timestamp(14, "t4", *(_QWORD *)(a1 + 7));
  v2 = sntp_calc_offset((uint64_t)a1);
  v4 = v3;
  v5 = sntp_datestamp_to_double(v2, v3);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "offset", v2, v4, v5);
  v6 = sntp_calc_delay((uint64_t)a1);
  v8 = v7;
  v9 = sntp_datestamp_to_double(v6, v7);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "delay", v6, v8, v9);
  v10 = sntp_calc_mean((uint64_t)a1);
  v12 = v11;
  v13 = sntp_datestamp_to_double(v10, v11);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "mean", v10, v12, v13);
  v14 = sntp_calc_error((uint64_t)a1);
  v16 = v15;
  v17 = sntp_datestamp_to_double(v14, v15);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "error", v14, v16, v17);
  inet_ntop(a1[19], a1 + 15, v19, 0x2Eu);
  printf("%14s: %s\n", "addr", v19);
  return puts("}");
}

uint64_t sntp_print_packet(__int128 *a1)
{
  __int128 v3;
  uint64_t v4;

  puts("sntp_packet {");
  v3 = *a1;
  v4 = *((_QWORD *)a1 + 2);
  sntp_print_header(14, (unsigned __int8 *)&v3);
  sntp_print_timestamp(14, "t_orig", *((_QWORD *)a1 + 3));
  sntp_print_timestamp(14, "t_rx", *((_QWORD *)a1 + 4));
  sntp_print_timestamp(14, "t_tx", *((_QWORD *)a1 + 5));
  return puts("}");
}

unint64_t sntp_header_hton@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4;
  int v5;
  int v6;
  unsigned int v7;
  unint64_t result;

  v5 = *a1;
  v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_hton(v4);
  v6 = sntp_shortstamp_hton(a1[2]);
  v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  result = sntp_timestamp_hton(*((_QWORD *)a1 + 2));
  *(_QWORD *)(a2 + 16) = result;
  return result;
}

unint64_t sntp_header_ntoh@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4;
  int v5;
  int v6;
  unsigned int v7;
  unint64_t result;

  v5 = *a1;
  v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_ntoh(v4);
  v6 = sntp_shortstamp_ntoh(a1[2]);
  v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  result = sntp_timestamp_ntoh(*((_QWORD *)a1 + 2));
  *(_QWORD *)(a2 + 16) = result;
  return result;
}

void *sntp_header_mmap(const char *a1, uint64_t a2, int a3)
{
  int v6;
  int v7;
  mode_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  int v13;
  void *v14;
  _DWORD __buf[4];
  unint64_t v17;

  v6 = open(a1, 2);
  if (v6 < 0)
  {
    if (*__error() != 2 || (v8 = umask(0), v7 = open(a1, 514, 436), umask(v8), v7 < 0))
    {
      warn("open");
      return 0;
    }
    v9 = *(_DWORD *)(a2 + 8);
    v10 = *(_DWORD *)(a2 + 12);
    v11 = *(_QWORD *)(a2 + 16);
    v12 = *(_DWORD *)(a2 + 4);
    __buf[0] = *(_DWORD *)a2;
    __buf[1] = sntp_shortstamp_hton(v12);
    __buf[2] = sntp_shortstamp_hton(v9);
    __buf[3] = bswap32(v10);
    v17 = sntp_timestamp_hton(v11);
    if (write(v7, __buf, 0x18uLL) != 24)
    {
      warn("write");
      return 0;
    }
  }
  else
  {
    v7 = v6;
    if (ftruncate(v6, 24))
    {
      warn("ftruncate");
      return 0;
    }
  }
  if (a3)
    v13 = 3;
  else
    v13 = 1;
  v14 = mmap(0, 0x18uLL, v13, 1, v7, 0);
  if (v14 == (void *)-1)
  {
    warn("mmap");
    v14 = 0;
  }
  if (close(v7))
    warn("close");
  return v14;
}

void sntp_header_unmap(void *a1)
{
  if (munmap(a1, 0x18uLL))
    warn("munmap");
}

float sntp_precision_decode(int a1)
{
  float result;

  LODWORD(result) = (a1 << 23) + 1065353216;
  return result;
}

unint64_t sntp_server_respond@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t result;

  v8 = a3();
  *(_OWORD *)a4 = *(_OWORD *)a2;
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a4 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a4 + 24) = v9;
  *(_QWORD *)(a4 + 32) = sntp_timestamp_hton(v8);
  v10 = a3();
  result = sntp_timestamp_hton(v10);
  *(_QWORD *)(a4 + 40) = result;
  if (__ROR8__(v10, 32) < __ROR8__(v8, 32))
  {
    *(_BYTE *)(a4 + 1) = 0;
    *(_DWORD *)(a4 + 12) = 1398031696;
  }
  return result;
}

uint64_t sntp_server_exchange@<X0>(sockaddr *a1@<X1>, socklen_t *a2@<X2>, int a3@<W0>, __int128 *a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t a6@<X8>)
{
  uint64_t result;
  socklen_t v13;
  int sa_family;
  socklen_t v15;
  unint64_t v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[3];
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_OWORD *)(a6 + 16) = 0u;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)a6 = 0u;
  if (!a5)
    sub_10001A768();
  v23 = 0uLL;
  v24 = 0uLL;
  v22 = 0uLL;
  result = recvfrom(a3, &v22, 0x30uLL, 64, a1, a2);
  if (result == 48)
  {
    if (a1 && a2)
    {
      v13 = *a2;
      sa_family = a1->sa_family;
      *(_DWORD *)(a6 + 76) = sa_family;
      if (v13 == 16 && sa_family == 2)
      {
        *(_DWORD *)(a6 + 60) = *(_DWORD *)&a1->sa_data[2];
      }
      else if (v13 == 28 && sa_family == 30)
      {
        *(sockaddr *)(a6 + 60) = *(sockaddr *)&a1->sa_data[6];
      }
    }
    v21 = 0u;
    v19[0] = v22;
    v19[1] = v23;
    v19[2] = v24;
    memset(v20, 0, sizeof(v20));
    v17 = *a4;
    v18 = *((_QWORD *)a4 + 2);
    sntp_server_respond((uint64_t)v19, (uint64_t)&v17, a5, (uint64_t)v20);
    if (a2)
      v15 = *a2;
    else
      v15 = 0;
    if (sendto(a3, v20, 0x30uLL, 0, a1, v15) != 48)
      *(_DWORD *)a6 = 5;
    *(_OWORD *)(a6 + 36) = v22;
    v16 = *((_QWORD *)&v24 + 1);
    *(_QWORD *)(a6 + 52) = v23;
    *(_QWORD *)(a6 + 4) = sntp_timestamp_ntoh(v16);
    *(_QWORD *)(a6 + 12) = sntp_timestamp_ntoh(v21);
    result = sntp_timestamp_ntoh(*((unint64_t *)&v21 + 1));
    *(_QWORD *)(a6 + 20) = result;
  }
  else
  {
    *(_DWORD *)a6 = 7;
  }
  return result;
}

__n128 sntp_client_exchange@<Q0>(int a1@<W0>, timeval *a2@<X3>, uint64_t (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  __n128 result;
  int v9;
  __int128 v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  __int128 v16;
  fd_set v17;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;

  v19 = 0u;
  v20 = 0u;
  memset(v18, 0, sizeof(v18));
  memset(&v17, 0, sizeof(v17));
  if (__darwin_check_fd_set_overflow(a1, &v17, 0))
    *(__int32_t *)((char *)v17.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  v16 = 0u;
  memset(v15, 0, sizeof(v15));
  LOBYTE(v15[0]) = 35;
  if (a3)
  {
    *(_QWORD *)((char *)v18 + 4) = a3();
    *((_QWORD *)&v16 + 1) = sntp_timestamp_hton(*(unint64_t *)((char *)v18 + 4));
  }
  if (send(a1, v15, 0x30uLL, 0) != 48)
  {
    v9 = 5;
LABEL_17:
    LODWORD(v18[0]) = v9;
    v10 = v19;
    *(_OWORD *)(a4 + 32) = v18[2];
    *(_OWORD *)(a4 + 48) = v10;
    *(_OWORD *)(a4 + 64) = v20;
    result = (__n128)v18[1];
    *(_OWORD *)a4 = v18[0];
    *(__n128 *)(a4 + 16) = result;
    return result;
  }
  if (a2 && (a2->tv_sec || a2->tv_usec) && select(a1 + 1, &v17, 0, &v17, a2) != 1)
  {
    v9 = 6;
    goto LABEL_17;
  }
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  if (recv(a1, &v12, 0x30uLL, 0) != 48)
  {
    v9 = 7;
    goto LABEL_17;
  }
  if (a3)
    *(_QWORD *)((char *)&v18[1] + 12) = a3();
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  sntp_client_process_response((unsigned __int8 *)v11, (unint64_t *)((char *)v18 + 4), (_OWORD *)((char *)&v18[1] + 12), a4);
  return result;
}

unint64_t sntp_client_process_response@<X0>(unsigned __int8 *a1@<X0>, unint64_t *a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  unint64_t result;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  __int128 v16[3];
  _OWORD v17[3];

  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  if (a2)
  {
    v8 = *a2;
    *(_QWORD *)(a4 + 4) = *a2;
    v9 = HIDWORD(v8);
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  LODWORD(v9) = 0;
  LODWORD(v8) = 0;
  if (a3)
LABEL_3:
    *(_QWORD *)(a4 + 28) = *a3;
LABEL_4:
  v10 = *((_OWORD *)a1 + 1);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v10;
  v16[2] = *((_OWORD *)a1 + 2);
  result = sntp_packet_ntoh(v16, (uint64_t)v17);
  v12 = v17[1];
  *(_OWORD *)a1 = v17[0];
  *((_OWORD *)a1 + 1) = v12;
  *((_OWORD *)a1 + 2) = v17[2];
  *(_OWORD *)(a4 + 36) = *(_OWORD *)a1;
  *(_QWORD *)(a4 + 52) = *((_QWORD *)a1 + 2);
  v13 = *((_QWORD *)a1 + 4);
  v14 = *((_QWORD *)a1 + 5);
  *(_QWORD *)(a4 + 12) = v13;
  *(_QWORD *)(a4 + 20) = v14;
  if (*a1 <= 0xBFu)
  {
    if (a1[1])
    {
      if (__ROR8__(v14, 32) >= __ROR8__(v13, 32))
      {
        if (a2)
        {
          if (*((_DWORD *)a1 + 6) != (_DWORD)v8 || *((_DWORD *)a1 + 7) != (_DWORD)v9)
          {
            v15 = 10;
            goto LABEL_19;
          }
          if (a3)
          {
            result = sntp_calc_delay(a4);
            if ((result & 0x8000000000000000) != 0)
            {
              v15 = 11;
              goto LABEL_19;
            }
          }
        }
        v15 = 0;
      }
      else
      {
        v15 = 12;
      }
    }
    else
    {
      v15 = 8;
    }
  }
  else
  {
    v15 = 9;
  }
LABEL_19:
  *(_DWORD *)a4 = v15;
  return result;
}

void sntp_client_unicast(const char *a1@<X0>, unsigned int a2@<W1>, int a3@<W2>, timeval *a4@<X3>, uint64_t (*a5)(void)@<X4>, int a6@<W5>, uint64_t a7@<X8>)
{
  int v13;
  addrinfo *v14;
  sockaddr *ai_addr;
  socklen_t ai_addrlen;
  int ai_family;
  int sa_family;
  int v21;
  int v22;
  sockaddr *v23;
  socklen_t v24;
  int v25;
  int v26;
  sockaddr v27[2];
  addrinfo *v28;
  char __str[6];
  uint64_t v30;
  uint64_t v31;

  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)a7 = 0u;
  snprintf(__str, 6uLL, "%u", a3);
  v28 = 0;
  if (getaddrinfo(a1, __str, 0, &v28))
  {
    *(_DWORD *)a7 = 1;
    return;
  }
  if (!v28)
    sub_10001A790();
  if (a2)
  {
    v13 = 0;
    v14 = v28;
    while (1)
    {
      v14 = v14->ai_next;
      if (!v14)
        break;
      if (++v13 >= a2)
        goto LABEL_10;
    }
  }
  v14 = v28;
LABEL_10:
  ai_addr = v14->ai_addr;
  ai_addrlen = v14->ai_addrlen;
  ai_family = v14->ai_family;
  sa_family = ai_addr->sa_family;
  *(_DWORD *)(a7 + 76) = sa_family;
  if (ai_addrlen == 16 && sa_family == 2)
  {
    *(_DWORD *)(a7 + 60) = *(_DWORD *)&ai_addr->sa_data[2];
  }
  else if (ai_addrlen == 28 && sa_family == 30)
  {
    *(sockaddr *)(a7 + 60) = *(sockaddr *)&ai_addr->sa_data[6];
  }
  v21 = socket(ai_family, 2, 17);
  if (v21)
  {
    v22 = v21;
    if (!a6)
      goto LABEL_29;
    v30 = 0;
    v31 = 0;
    memset(v27, 0, 28);
    if (ai_family == 2)
    {
      v30 = 2063598080;
      v31 = 0;
      v23 = (sockaddr *)&v30;
      v24 = 16;
    }
    else
    {
      memset(&v27[0].sa_data[2], 0, 24);
      *(sockaddr *)&v27[0].sa_data[6] = (sockaddr)in6addr_any;
      *(_DWORD *)&v27[0].sa_len = 2063605276;
      v23 = v27;
      v24 = 28;
    }
    if (bind(v21, v23, v24))
    {
      v25 = 3;
    }
    else
    {
LABEL_29:
      if (!connect(v22, ai_addr, ai_addrlen))
      {
        sntp_client_exchange(v22, a4, a5, a7);
        v26 = ai_addr->sa_family;
        *(_DWORD *)(a7 + 76) = v26;
        if (ai_addrlen == 16 && v26 == 2)
        {
          *(_DWORD *)(a7 + 60) = *(_DWORD *)&ai_addr->sa_data[2];
        }
        else if (ai_addrlen == 28 && v26 == 30)
        {
          *(sockaddr *)(a7 + 60) = *(sockaddr *)&ai_addr->sa_data[6];
        }
        goto LABEL_32;
      }
      v25 = 4;
    }
    *(_DWORD *)a7 = v25;
LABEL_32:
    close(v22);
    goto LABEL_33;
  }
  *(_DWORD *)a7 = 2;
LABEL_33:
  freeaddrinfo(v28);
}

void sub_10001A768()
{
  __assert_rtn("sntp_server_exchange", "net.c", 74, "clockfunc");
}

void sub_10001A790()
{
  __assert_rtn("sntp_client_unicast", "net.c", 247, "addresses");
}

void sub_10001A7B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AD8((void *)&_mh_execute_header, v0, v1, "Cache path is: %@", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001A818()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AC0((void *)&_mh_execute_header, v0, v1, "Failed to touch the cache plist at %s.", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001A878(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008AC0((void *)&_mh_execute_header, a2, a3, "unable to delete cache: %@", a5, a6, a7, a8, 2u);
  sub_100008AD0();
}

void sub_10001A8E0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get cache URL", v1, 2u);
}

void sub_10001A920()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AD8((void *)&_mh_execute_header, v0, v1, "Cache url is: %@", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001A980(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008AC0((void *)&_mh_execute_header, a2, a3, "Failed to cache state with error %@!", a5, a6, a7, a8, 2u);
  sub_100008AD0();
}

void sub_10001A9E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AC0((void *)&_mh_execute_header, v0, v1, "Failed to cache state: %@", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001AA48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AC0((void *)&_mh_execute_header, v0, v1, "Unexpected error: %s", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001AAA8(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[24];

  dispatch_queue_get_label(0);
  sub_100008AE8();
  sub_10000964C((void *)&_mh_execute_header, a1, v2, "Will execute command on queue: %s", v3);
}

void sub_10001AB28(xpc_connection_t *a1, NSObject *a2)
{
  pid_t pid;
  _DWORD v4[2];

  pid = xpc_connection_get_pid(*a1);
  v4[0] = 67109120;
  v4[1] = pid;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Client lacks authorization, pid: %d", (uint8_t *)v4, 8u);
  sub_100008AD0();
}

void sub_10001ABB0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008AE8();
  sub_10000964C((void *)&_mh_execute_header, v0, v1, "Reply: %s", v2);
  sub_100008AD0();
}

void sub_10001AC14()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008AE8();
  sub_10000964C((void *)&_mh_execute_header, v0, v1, "Returning result to client: %@", v2);
  sub_100008AD0();
}

void sub_10001AC78(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Should not message ourselves", v1, 2u);
}

void sub_10001ACB8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008AC0((void *)&_mh_execute_header, a2, a3, "Converting from unknown TMSrc: %lld", a5, a6, a7, a8, 0);
  sub_100008AD0();
}

void sub_10001AD1C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A774();
  v0 = sub_10000A76C();
  sub_10000A764(v0);
  sub_10000A728();
  sub_10000A740((void *)&_mh_execute_header, &_os_log_default, v1, "CoreTime: Error occurred %d %s\n", v2, v3, v4, v5, v6);
  sub_10000A750();
}

void sub_10001AD90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A718((void *)&_mh_execute_header, &_os_log_default, a3, "CoreTime: error occurred, no mib to monotonicclock_rate_usecs conversion\n", a5, a6, a7, a8, 0);
  sub_10000A75C();
}

void sub_10001ADC4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A774();
  v0 = sub_10000A76C();
  sub_10000A764(v0);
  sub_10000A728();
  sub_10000A740((void *)&_mh_execute_header, &_os_log_default, v1, "Error occurred %d %s\n", v2, v3, v4, v5, v6);
  sub_10000A750();
}

void sub_10001AE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A718((void *)&_mh_execute_header, &_os_log_default, a3, "CoreTime: error occurred, no mib to monotonicclock_usecs conversion\n", a5, a6, a7, a8, 0);
  sub_10000A75C();
}

void sub_10001AE6C()
{
  _DWORD v0[2];

  v0[0] = 67109120;
  v0[1] = 3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CoreTime: ERROR: Could not get kern.monotonicclock_usecs after %d attempts\n", (uint8_t *)v0, 8u);
  sub_10000A75C();
}

void sub_10001AEE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A718((void *)&_mh_execute_header, &_os_log_default, a3, "CoreTime: ERROR: Could not get mib for kern.monotonicclock_usecs\n", a5, a6, a7, a8, 0);
  sub_10000A75C();
}

void sub_10001AF1C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  __int16 v3;
  uint64_t v4;

  v1 = 134218240;
  v2 = 8;
  v3 = 2048;
  v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CoreTime: ERROR: Expected %lld bytes from kern.monotoniclock_offset_usecs but got %lld\n", (uint8_t *)&v1, 0x16u);
  sub_100008AD0();
}

void sub_10001AFA4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A774();
  v0 = sub_10000A76C();
  sub_10000A764(v0);
  sub_10000A728();
  sub_10000A740((void *)&_mh_execute_header, &_os_log_default, v1, "CoreTime: ERROR: Could not get/set kern.monotoniclock_offset_usecs %d %s\n", v2, v3, v4, v5, v6);
  sub_10000A750();
}

void sub_10001B018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008AC0((void *)&_mh_execute_header, &_os_log_default, a3, "Applying unlikely time offset: %lld", a5, a6, a7, a8, 0);
  sub_100008AD0();
}

void sub_10001B084()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 515, "numer != 0");
}

void sub_10001B0AC()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 516, "denom != 0");
}

void sub_10001B0D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A718((void *)&_mh_execute_header, &_os_log_default, a3, "CoreTime: ERROR: Could not get mib for kern.monotoniclock_offset_usecs\n", a5, a6, a7, a8, 0);
  sub_10000A75C();
}

void sub_10001B108()
{
  __assert_rtn("TMGetMachTimebase", "TMUtilities.m", 494, "timebaseResult == KERN_SUCCESS");
}

void sub_10001B130(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "code");
  sub_100008AE8();
  sub_100011734((void *)&_mh_execute_header, a2, v3, "TDTF unhandled synthesizer error: %ld", v4);
  sub_10000A750();
}

void sub_10001B1A4(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "code");
  sub_100008AE8();
  sub_100011734((void *)&_mh_execute_header, a2, v3, "STF unhandled synthesizer error: %ld", v4);
  sub_10000A750();
}

void sub_10001B218()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100011740();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Successfully loaded bootUUID", v1, 2u);
  sub_10000A75C();
}

void sub_10001B250()
{
  __assert_rtn("-[TMDaemonCore bootUUID]", "TMDaemonCore.m", 755, "len == sizeof(uuidString)");
}

void sub_10001B278(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  int v4;
  double v5;
  __int16 v6;
  uint64_t v7;

  v4 = 134218242;
  v5 = a4;
  v6 = 2080;
  v7 = a1;
  sub_100011768((void *)&_mh_execute_header, a2, a3, "TMCFAbsoluteTimeToTimeval(%f) failed: cannot set system time from %s", (uint8_t *)&v4);
  sub_100008AD0();
}

void sub_10001B2EC(int a1, NSObject *a2, uint64_t a3, double a4)
{
  int v4;
  double v5;
  __int16 v6;
  int v7;

  v4 = 134218240;
  v5 = a4;
  v6 = 1024;
  v7 = a1;
  sub_10001174C((void *)&_mh_execute_header, a2, a3, "ntp_adjtime(%lf) failed %d; cannot set system time",
    (uint8_t *)&v4);
  sub_100008AD0();
}

void sub_10001B360()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AC0((void *)&_mh_execute_header, v0, v1, "Synthesizer produced an output outside the clamp. Bailing out of _testAndApplySystemTime, and resetting filter: %@", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

uint64_t sub_10001B3C0(uint64_t a1, IOPMAssertionID *a2, char a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v12;

  sub_100011740();
  sub_10000A718((void *)&_mh_execute_header, v5, v6, "System slept while calling settimeofday", v7, v8, v9, v10, v12);
  IOPMAssertionRelease(*a2);
  return a3 & 1;
}

void sub_10001B40C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "_testAndApplySystemTime IOPMAssertionCreate failed with return code %d", (uint8_t *)v2, 8u);
  sub_10000A75C();
}

void sub_10001B47C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008AC0((void *)&_mh_execute_header, a2, a3, "Failed to propagate system time: %@", a5, a6, a7, a8, 2u);
  sub_100008AD0();
}

void sub_10001B4E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011740();
  sub_10000A718((void *)&_mh_execute_header, v0, v1, "Failed to convert mach to RTC", v2, v3, v4, v5, v6);
  sub_10000A75C();
}

void sub_10001B510()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011740();
  sub_10000A718((void *)&_mh_execute_header, v0, v1, "Can't set time zone to nil!\n", v2, v3, v4, v5, v6);
  sub_10000A75C();
}

void sub_10001B53C(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "UTF8String");
  sub_100008AE8();
  sub_100011734((void *)&_mh_execute_header, a2, v3, "No time zone exists with name %s!\n", v4);
  sub_10000A750();
}

void sub_10001B5B0()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100008AE8();
  v3 = 2112;
  v4 = v0;
  sub_100011768((void *)&_mh_execute_header, v1, (uint64_t)v1, "CFTimeZoneCopySystem returned %@ after attempting to set %@", v2);
  sub_100008AD0();
}

void sub_10001B624(void *a1, int a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;

  objc_msgSend(a1, "UTF8String");
  sub_100008AE8();
  v7 = 1024;
  v8 = a2;
  sub_10001174C((void *)&_mh_execute_header, a3, v5, "Couldn't set time zone to %s: %{darwin.errno}d\n", v6);
  sub_10000A750();
}

void sub_10001B6A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AC0((void *)&_mh_execute_header, v0, v1, "Command included both mach and RTC time: %@", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001B708(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("TMCommand"));
  sub_100008AE8();
  sub_100011734((void *)&_mh_execute_header, a2, v3, "Command '%@' included mach time when not expected, forcing conversion", v4);
  sub_10000A750();
}

void sub_10001B784()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011740();
  sub_100011758((void *)&_mh_execute_header, v0, v1, "Both CorrectOnWake and FetchOnWake are enabled. This is probably a misconfiguration, but I'll do it anyways.", v2, v3, v4, v5, v6);
  sub_10000A75C();
}

void sub_10001B7B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AC0((void *)&_mh_execute_header, v0, v1, "Received unknown command: %@\n", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001B810(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008AC0((void *)&_mh_execute_header, a2, a3, "Message could not be time tagged; dropping: %@",
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_100008AD0();
}

void sub_10001B878()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011740();
  sub_10000A718((void *)&_mh_execute_header, v0, v1, "Someone called TMSetManualTime while automatic time was enabled, discarding.", v2, v3, v4, v5, v6);
  sub_10000A75C();
}

void sub_10001B8A4(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;

  v3 = *a1;
  v4 = *((_DWORD *)a1 + 2);
  v5 = 134218240;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  sub_10001174C((void *)&_mh_execute_header, a2, a3, "TMSetManualTime failed to settimeofday. tv = {%ld, %d}", (uint8_t *)&v5);
  sub_100008AD0();
}

void sub_10001B920()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011740();
  sub_10000A718((void *)&_mh_execute_header, v0, v1, "Unable to convert CFAbsoluteTime to timeval", v2, v3, v4, v5, v6);
  sub_10000A75C();
}

void sub_10001B94C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AC0((void *)&_mh_execute_header, v0, v1, "Recieved authenticated time that does not match current clamp, discarding: %@", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001B9AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AC0((void *)&_mh_execute_header, v0, v1, "Error requesting proactive time check job with status %lu", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001BA0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011740();
  sub_100011758((void *)&_mh_execute_header, v0, v1, "Throwing up island alert!", v2, v3, v4, v5, v6);
  sub_10000A75C();
}

void sub_10001BA38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AC0((void *)&_mh_execute_header, v0, v1, "Time disagrees with clamp, discarding: %@", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001BA98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011740();
  sub_10000A718((void *)&_mh_execute_header, v0, v1, "Time is invalid!", v2, v3, v4, v5, v6);
  sub_10000A75C();
}

void sub_10001BAC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100011740();
  sub_10000A718((void *)&_mh_execute_header, v0, v1, "We can't both fail and succeed!", v2, v3, v4, v5, v6);
  sub_10000A75C();
}

void sub_10001BAF0()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100008AE8();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "No provider found for '%@'", v1, 0xCu);
  sub_100008AD0();
}

void sub_10001BB5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008AE8();
  sub_100008AC0((void *)&_mh_execute_header, v0, v1, "Re-adding provider for key %@", v2, v3, v4, v5, v6);
  sub_100008AD0();
}

void sub_10001BBBC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Source %@ gave an input without marking itself as available!", (uint8_t *)&v2, 0xCu);
}

void sub_10001BC30()
{
  __assert_rtn("TMRegisterForWakeCallback", "TMSleepWake.m", 108, "c");
}

void sub_10001BC58(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "IO Connection established, scheduling", v1, 2u);
}

void sub_10001BC98()
{
  __assert_rtn("TMRegisterForWakeCallback", "TMSleepWake.m", 109, "!callback");
}

void sub_10001BCC0(__int16 a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1 & 0xFFF;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "System power message: 0x%03x", (uint8_t *)v2, 8u);
}

void sub_10001BD38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011758((void *)&_mh_execute_header, a1, a3, "Source entitlments must be an array of sources", a5, a6, a7, a8, 0);
}

void sub_10001BD6C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%@ entitlement must be a true BOOLean", (uint8_t *)&v2, 0xCu);
}

void sub_10001BDE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011758((void *)&_mh_execute_header, a1, a3, "SecTask lookup failure", a5, a6, a7, a8, 0);
}

void sub_10001BE14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A718((void *)&_mh_execute_header, a1, a3, "Could not get machdep.wake_abstime", a5, a6, a7, a8, 0);
}

void sub_10001BE48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A718((void *)&_mh_execute_header, a1, a3, "Could not get mib for kern.wake_abs_time, either. Wake determination will not be available.", a5, a6, a7, a8, 0);
}

void sub_10001BE7C()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Expected to decode object of class TMTimeSynthesizer", v1, 2u);
  }
  objc_end_catch();
  sub_100008AD0();
}

void sub_10001BEE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008AC0((void *)&_mh_execute_header, a2, a3, "Unable to create NSKeyedUnarchiver for data: %@", a5, a6, a7, a8, 2u);
  sub_100008AD0();
}

void sub_10001BF48(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008AC0((void *)&_mh_execute_header, a2, a3, "Failed to serialize synthesizer: %@", a5, a6, a7, a8, 2u);
  sub_100008AD0();
}

void sub_10001BFAC()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100008AE8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not create SCNetworkReachability object for NTP server %@", v1, 0xCu);
}

void sub_10001C01C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = SCError();
  SCErrorString(v0);
  sub_100008AE8();
  sub_100015D20((void *)&_mh_execute_header, v1, v2, "Could not determine current network reachability flags, not going to try and keep us awake: %s", v3, v4, v5, v6, v7);
  sub_10000A750();
}

void sub_10001C090()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = SCError();
  SCErrorString(v0);
  sub_100008AE8();
  sub_100015D20((void *)&_mh_execute_header, v1, v2, "Could not SCNetworkReachabilitySetCallback: %s", v3, v4, v5, v6, v7);
  sub_10000A750();
}

void sub_10001C104()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = SCError();
  SCErrorString(v0);
  sub_100008AE8();
  sub_100015D20((void *)&_mh_execute_header, v1, v2, "Could not SCNetworkReachabilitySetDispatchQueue to schedule reachability notification: %s", v3, v4, v5, v6, v7);
  sub_10000A750();
}

void sub_10001C178()
{
  __assert_rtn("_networkReachabilityCallback", "TMBackgroundNtpSource.m", 53, "[self isKindOfClass:[TMBackgroundNtpSource class]]");
}

void sub_10001C1A0(unsigned __int8 a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a2;
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "setFetchingTime:%d called when _fetchingTime=%d", (uint8_t *)v3, 0xEu);
}

void sub_10001C228(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100015D34((void *)&_mh_execute_header, a2, a3, "IOPMAssertionRelease failed with return code %d", a5, a6, a7, a8, 0);
  sub_10000A75C();
}

void sub_10001C28C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Slept during NTP request", v1, 2u);
  sub_10000A75C();
}

void sub_10001C2C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100015D34((void *)&_mh_execute_header, a2, a3, "IOPMAssertionCreate failed with return code %d", a5, a6, a7, a8, 0);
  sub_10000A75C();
}

void sub_10001C32C()
{
  __assert_rtn("-[TMBackgroundNtpSource _fetchTime]_block_invoke", "TMBackgroundNtpSource.m", 341, "machResult > kMachStart");
}

void sub_10001C354(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Time key present (%@), not migrating\n", (uint8_t *)&v2, 0xCu);
}

void sub_10001C3C8(os_log_t log, double a2)
{
  int v2;
  double v3;

  v2 = 134217984;
  v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "rateSf clamped: %f", (uint8_t *)&v2, 0xCu);
}

void sub_10001C440(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Time input isSynthesized, suspect feedback loop", v1, 2u);
}

id objc_msgSend_NTPBurstRetryAttempts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NTPBurstRetryAttempts");
}

id objc_msgSend_NTPBurstRetryInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NTPBurstRetryInterval");
}

id objc_msgSend_NTPSchedulingInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NTPSchedulingInterval");
}

id objc_msgSend_NTPServerAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NTPServerAddress");
}

id objc_msgSend_NTPServerPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NTPServerPort");
}

id objc_msgSend_NTPServicePortMaxRetries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NTPServicePortMaxRetries");
}

id objc_msgSend_NTPUnsetSchedulingInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NTPUnsetSchedulingInterval");
}

id objc_msgSend_NTPUseServicePort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NTPUseServicePort");
}

id objc_msgSend_NTPWantedThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NTPWantedThreshold");
}

id objc_msgSend_RTCFrequencyNoiseDensity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "RTCFrequencyNoiseDensity");
}

id objc_msgSend_RTCFrequencyTolerance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "RTCFrequencyTolerance");
}

id objc_msgSend_RTCMachSyncInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "RTCMachSyncInterval");
}

id objc_msgSend_RTCWakeUncertainty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "RTCWakeUncertainty");
}

id objc_msgSend_STF(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "STF");
}

id objc_msgSend_TDTF(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "TDTF");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_accessoryUnc_s(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryUnc_s");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addPlugin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPlugin:");
}

id objc_msgSend_addTimeProvider_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimeProvider:forKey:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areTimeZonePopupsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areTimeZonePopupsEnabled");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_basebandWantedThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "basebandWantedThreshold");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bootUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bootUUID");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_burstRetryCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "burstRetryCount");
}

id objc_msgSend_checkActiveTimeSourceRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkActiveTimeSourceRequired");
}

id objc_msgSend_clock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clock");
}

id objc_msgSend_coarseMonotonicTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coarseMonotonicTime");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_computedTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computedTimeZone");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTimeZone");
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataRepresentation");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didSetManualTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSetManualTime:");
}

id objc_msgSend_didSetTime_withUncertainty_fromSource_lastInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSetTime:withUncertainty:fromSource:lastInput:");
}

id objc_msgSend_displayLastQualityTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayLastQualityTime");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drain");
}

id objc_msgSend_emptyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emptyPath:");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_executeCommand_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeCommand:withHandler:");
}

id objc_msgSend_fetchTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchTime");
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileModificationDate");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filesystemTimestampOfPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filesystemTimestampOfPath:");
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishDecoding");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleShutdown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleShutdown");
}

id objc_msgSend_hasSameOlsonNameAs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSameOlsonNameAs:");
}

id objc_msgSend_hostUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostUUID");
}

id objc_msgSend_inflateHistoricalDataBy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inflateHistoricalDataBy:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initFileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClock_daemonCore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClock:daemonCore:");
}

id objc_msgSend_initWithClockAccuracy_noiseDensity_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClockAccuracy:noiseDensity:name:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDefaults:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_clock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:clock:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithOlsonName_fromSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOlsonName:fromSource:");
}

id objc_msgSend_initWithPath_clock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:clock:");
}

id objc_msgSend_initWithRules_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRules:delegate:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSyncInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSyncInterval:");
}

id objc_msgSend_initWithTimeZoneRules_monotonicClock_preferences_workloop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimeZoneRules:monotonicClock:preferences:workloop:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUtc_ns_utcUnc_s_rtc_ns_sf_sfUnc_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:");
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instancesRespondToSelector:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_intersects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersects:");
}

id objc_msgSend_isAppleTV(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleTV");
}

id objc_msgSend_isAutomaticTimeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomaticTimeEnabled");
}

id objc_msgSend_isAutomaticTimeZoneEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomaticTimeZoneEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFetchingTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFetchingTime");
}

id objc_msgSend_isMac(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMac");
}

id objc_msgSend_isMachTimeValid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMachTimeValid:");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isSourceAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSourceAvailable:");
}

id objc_msgSend_isSynthesized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSynthesized");
}

id objc_msgSend_isSystemTimeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemTimeSet");
}

id objc_msgSend_isSystemTimeZoneSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemTimeZoneSet");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isWatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWatch");
}

id objc_msgSend_lastFetchAttempt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastFetchAttempt");
}

id objc_msgSend_lastInputSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastInputSource");
}

id objc_msgSend_lastNTPFetchAttempt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastNTPFetchAttempt");
}

id objc_msgSend_lastQualityTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastQualityTime");
}

id objc_msgSend_lastRtcTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRtcTime");
}

id objc_msgSend_lastWake(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastWake");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_machTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machTime");
}

id objc_msgSend_montonicTimeForMachTime_toQueue_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "montonicTimeForMachTime:toQueue:withCompletionHandler:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newSynthesizerFromDataRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newSynthesizerFromDataRepresentation:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_olsonName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "olsonName");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "principalClass");
}

id objc_msgSend_propagatedTimeAtRTC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propagatedTimeAtRTC:");
}

id objc_msgSend_propagatedUncertaintyAtRTC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propagatedUncertaintyAtRTC:");
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerName");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_rateSf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rateSf");
}

id objc_msgSend_reachabilityTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reachabilityTransaction");
}

id objc_msgSend_readValidCache_clock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readValidCache:clock:");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_reliability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reliability");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_requiresActiveBBTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresActiveBBTime");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_reset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset:");
}

id objc_msgSend_resetTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetTimeZone:");
}

id objc_msgSend_rtc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rtc");
}

id objc_msgSend_rtcDidReset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rtcDidReset");
}

id objc_msgSend_rtcReset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rtcReset");
}

id objc_msgSend_rtcResetCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rtcResetCount");
}

id objc_msgSend_rtcWhenBeyondUncertainty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rtcWhenBeyondUncertainty:");
}

id objc_msgSend_rtc_ns(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rtc_ns");
}

id objc_msgSend_rtc_s(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rtc_s");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_schedulingInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schedulingInterval");
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsFromGMT");
}

id objc_msgSend_sendStateAnalytics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendStateAnalytics");
}

id objc_msgSend_setAccessoryUnc_s_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryUnc_s:");
}

id objc_msgSend_setAccurateThresholds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccurateThresholds:");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setAutomaticTimeEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomaticTimeEnabled:");
}

id objc_msgSend_setAutomaticTimeZoneEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomaticTimeZoneEnabled:");
}

id objc_msgSend_setBootUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBootUUID:");
}

id objc_msgSend_setBurstRetryCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBurstRetryCount:");
}

id objc_msgSend_setClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClock:");
}

id objc_msgSend_setCurrentTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentTimeZone:");
}

id objc_msgSend_setDaemonCore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDaemonCore:");
}

id objc_msgSend_setFetchingTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchingTime:");
}

id objc_msgSend_setHostUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostUUID:");
}

id objc_msgSend_setLastFetchAttempt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastFetchAttempt:");
}

id objc_msgSend_setLastInputSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastInputSource:");
}

id objc_msgSend_setLastNTPFetchAttempt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastNTPFetchAttempt:");
}

id objc_msgSend_setLastQualityTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastQualityTime:");
}

id objc_msgSend_setLastRtcTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastRtcTime:");
}

id objc_msgSend_setNTPUseServicePort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNTPUseServicePort:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOlsonName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOlsonName:");
}

id objc_msgSend_setPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferences:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRateSf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRateSf:");
}

id objc_msgSend_setReachabilityTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReachabilityTransaction:");
}

id objc_msgSend_setReliability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReliability:");
}

id objc_msgSend_setRequiresActiveBBTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresActiveBBTime:");
}

id objc_msgSend_setRtc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRtc:");
}

id objc_msgSend_setRtcResetCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRtcResetCount:");
}

id objc_msgSend_setRtc_s_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRtc_s:");
}

id objc_msgSend_setRunning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunning:");
}

id objc_msgSend_setSTF_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSTF:");
}

id objc_msgSend_setSf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSf:");
}

id objc_msgSend_setSfUnc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSfUnc:");
}

id objc_msgSend_setSf_var_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSf_var:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSourceAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceAvailable:");
}

id objc_msgSend_setSourceTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceTime:");
}

id objc_msgSend_setSourceTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceTimeZone:");
}

id objc_msgSend_setSourceUnavailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceUnavailable:");
}

id objc_msgSend_setSynthesized_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSynthesized:");
}

id objc_msgSend_setSystemTimeSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemTimeSet:");
}

id objc_msgSend_setSystemTimeZoneSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemTimeZoneSet:");
}

id objc_msgSend_setTDTF_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTDTF:");
}

id objc_msgSend_setUtc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUtc:");
}

id objc_msgSend_setUtcUnc_s_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUtcUnc_s:");
}

id objc_msgSend_setUtc_s_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUtc_s:");
}

id objc_msgSend_setUtc_sf_cov_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUtc_sf_cov:");
}

id objc_msgSend_setUtc_var_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUtc_var:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWantedTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantedTime:");
}

id objc_msgSend_settimeofdayThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settimeofdayThreshold");
}

id objc_msgSend_sf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sf");
}

id objc_msgSend_sfUnc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sfUnc");
}

id objc_msgSend_sf_var(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sf_var");
}

id objc_msgSend_shouldAlertWhenIslanded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAlertWhenIslanded");
}

id objc_msgSend_shouldAllowTimeTool(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAllowTimeTool");
}

id objc_msgSend_shouldClamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldClamp");
}

id objc_msgSend_shouldCorrectOnWake(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldCorrectOnWake");
}

id objc_msgSend_shouldFetchOnWake(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldFetchOnWake");
}

id objc_msgSend_shouldPowerAssertionsBeOptional(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPowerAssertionsBeOptional");
}

id objc_msgSend_shouldUseAccurateThresholdsByDefault(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUseAccurateThresholdsByDefault");
}

id objc_msgSend_shouldUseFilesystemTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUseFilesystemTimestamp");
}

id objc_msgSend_sortedArrayUsingFunction_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingFunction:context:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "source");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_supportsBasebandAPTimeSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBasebandAPTimeSync");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_synthesizedTimeAtLastRTC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synthesizedTimeAtLastRTC");
}

id objc_msgSend_systemTimeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemTimeSet");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_testAndApplySystemTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAndApplySystemTime");
}

id objc_msgSend_timeAtRtc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeAtRtc:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeProvider");
}

id objc_msgSend_timeWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeWithDictionary:");
}

id objc_msgSend_timeZoneManager_didComputeResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneManager:didComputeResult:");
}

id objc_msgSend_timeZoneManager_didReset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneManager:didReset:");
}

id objc_msgSend_timeZoneManager_shouldFetch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneManager:shouldFetch:");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_touchPath_tv_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchPath:tv:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_update_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "update:withError:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_utc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utc");
}

id objc_msgSend_utcUnc_s(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utcUnc_s");
}

id objc_msgSend_utc_ns(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utc_ns");
}

id objc_msgSend_utc_s(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utc_s");
}

id objc_msgSend_utc_sf_cov(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utc_sf_cov");
}

id objc_msgSend_utc_var(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utc_var");
}

id objc_msgSend_workQ(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workQ");
}

id objc_msgSend_workloop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workloop");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
