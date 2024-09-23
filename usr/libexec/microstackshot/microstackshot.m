void start()
{
  xpc_activity_register("com.apple.systemstats.microstackshot_periodic", XPC_ACTIVITY_CHECK_IN, &stru_1000041E8);
  dispatch_main();
}

void sub_100001BD0(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  _QWORD block[4];
  OS_xpc_object *v4;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001C40;
  block[3] = &unk_100004210;
  v4 = a2;
  v2 = v4;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100001C40(uint64_t a1)
{
  xpc_activity_t *v1;
  uint64_t v2;
  uint64_t v3;
  xpc_activity_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  xpc_activity_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  os_log_type_t v28;
  uint32_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t buf[8];
  const char *v59;
  const char *v60;
  char *v61;
  const char *v62;
  char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  char v68[16];
  char __str[16];

  v1 = (xpc_activity_t *)(a1 + 32);
  if (!xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32)))
  {
    v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v6)
      sub_100002990(v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Activity fired in RUN", buf, 2u);
  }
  v56 = 0;
  v57 = 0;
  v2 = sub_100002384(&v57, &v56);
  if (v2)
  {
    v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100002B68();
    v4 = *v1;
    v5 = v3;
    goto LABEL_11;
  }
  if (!xpc_activity_should_defer(*v1))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("last_attempt_progress")));
    v17 = (uint64_t)objc_msgSend(v16, "unsignedIntValue");

    if ((_DWORD)v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_100002AFC(v17, v18, v19, v20, v21, v22, v23, v24);
    if (systemstats_persistence_is_allowed())
    {
      snprintf(__str, 0x10uLL, "%ld", v57);
      v25 = snprintf(v68, 0x10uLL, "%ld", v56);
      if ((v17 & 1) != 0)
      {
        v30 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v30)
          sub_100002AC8(v30, v31, v32, v33, v34, v35, v36, v37);
      }
      else
      {
        v26 = systemstats_cpu_hotspot_report_allowed_by_tasking(v25);
        if ((_DWORD)v26 && DiagnosticLogSubmissionEnabled(v26))
        {
          *(_QWORD *)buf = "/usr/sbin/spindump";
          v59 = "-system_stats";
          v60 = "-microstackshots_starttime";
          v61 = __str;
          v62 = "-microstackshots_endtime";
          v63 = v68;
          v64 = "-system_stats_signature";
          v65 = "com.apple.SystemStats.Daily";
          v66 = 0;
          sub_1000026E0((char *const *)buf);
          v17 = v17 | 1;
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CPU microstackshot reports disallowed.", buf, 2u);
        }
      }
      if (xpc_activity_should_defer(*v1))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v17;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Activity should defer at progress %#x", buf, 8u);
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17));
        objc_msgSend(v38, "setObject:forKey:", v39, CFSTR("last_attempt_progress"));

        if (!xpc_activity_set_state(*v1, 3) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          goto LABEL_18;
        return;
      }
      if ((v17 & 2) != 0)
      {
        v41 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v41)
          sub_100002A94(v41, v42, v43, v44, v45, v46, v47, v48);
      }
      else
      {
        v40 = systemstats_io_hotspot_report_allowed_by_tasking();
        if ((_DWORD)v40 && DiagnosticLogSubmissionEnabled(v40))
        {
          *(_QWORD *)buf = "/usr/sbin/spindump";
          v59 = "-system_stats";
          v60 = "-microstackshots_starttime";
          v61 = __str;
          v62 = "-microstackshots_endtime";
          v63 = v68;
          v64 = "-microstackshots_io";
          v65 = "-system_stats_signature";
          v66 = "com.apple.SystemStats.Daily.IO";
          v67 = 0;
          sub_1000026E0((char *const *)buf);
          LODWORD(v17) = v17 | 2;
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "I/O microstackshot reports disallowed.", buf, 2u);
        }
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        goto LABEL_50;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v17;
      v27 = "Completed all work with progress %#x";
      v28 = OS_LOG_TYPE_INFO;
      v29 = 8;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_50:
        v49 = v56;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          sub_100002A2C();
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v49));
        objc_msgSend(v50, "setObject:forKey:", v51, CFSTR("last_processed_snapshot_timestamp"));

        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v53 = objc_alloc((Class)NSString);
        sub_10000285C();
        v54 = objc_msgSend(v53, "initWithUTF8String:", &byte_100008058);
        objc_msgSend(v52, "setObject:forKey:", v54, CFSTR("last_processed_snapshot_build"));

        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v55, "removeObjectForKey:", CFSTR("last_attempt_progress"));

LABEL_10:
        v14 = *v1;
        v5 = sub_100002384(0, 0);
        v4 = v14;
LABEL_11:
        sub_100002254(v4, v5);
        return;
      }
      *(_WORD *)buf = 0;
      v27 = "Persistence is currently disallowed based on tasking defaults. No microstackshots available for hotspot reports.";
      v28 = OS_LOG_TYPE_DEFAULT;
      v29 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v28, v27, buf, v29);
    goto LABEL_50;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Activity should defer before doing anything", buf, 2u);
  }
  if (!xpc_activity_set_state(*v1, 3) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
LABEL_18:
    sub_1000029C4(v1);
}

void sub_100002254(void *a1, uint64_t a2)
{
  _xpc_activity_s *v3;
  xpc_object_t v4;
  time_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;

  v3 = a1;
  v4 = xpc_activity_copy_criteria(v3);
  if (v4)
  {
    v5 = time(0);
    if (a2 <= v5)
      v6 = 0;
    else
      v6 = a2 - v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v7 = 134218496;
      v8 = a2;
      v9 = 2048;
      v10 = v6;
      v11 = 1024;
      v12 = 28800;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Setting activity to run at %ld (%ld+%d)", (uint8_t *)&v7, 0x1Cu);
    }
    xpc_dictionary_set_uint64(v4, XPC_ACTIVITY_DELAY, v6);
    xpc_dictionary_set_uint64(v4, XPC_ACTIVITY_GRACE_PERIOD, 0x7080uLL);
    xpc_activity_set_criteria(v3, v4);
  }
  else
  {
    _os_assumes_log();
  }

}

uint64_t sub_100002384(uint64_t *a1, uint64_t *a2)
{
  time_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  tm *v16;
  _BOOL4 v17;
  uint64_t v19;
  size_t v20;
  _BYTE buf[12];
  __int16 v22;
  uint64_t v23;

  v4 = time(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("last_processed_snapshot_build")));

  v7 = objc_alloc((Class)NSString);
  sub_10000285C();
  v8 = objc_msgSend(v7, "initWithUTF8String:", &byte_100008058);
  if ((objc_msgSend(v8, "isEqualToString:", v6) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("last_processed_snapshot_timestamp")));
    v11 = objc_msgSend(v10, "longValue");

    if (v11)
    {
      if ((uint64_t)v11 >= v4 - 259200)
        v12 = (uint64_t)v11;
      else
        v12 = v4 - 86400;
      v19 = v12;
      v13 = v12 + 86400;
      if (a1 && a2)
      {
        if (v12 + 82800 < v4 && v13 > v4)
          v13 = v4;
        if (v13 > v4)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            sub_100002D9C();
          goto LABEL_39;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v12;
          v22 = 2048;
          v23 = v13;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "This is subsequent report, generating report for 24 hour period %ld -> %ld", buf, 0x16u);
        }
        *a1 = v12;
LABEL_38:
        *a2 = v13;
        v13 = 0;
        goto LABEL_39;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_100002D34();
      goto LABEL_39;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    v22 = 2112;
    v23 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Builds don't match, ignoring saved start time, if any. (%@ -> %@)", buf, 0x16u);
  }
  v15 = qword_100008078;
  if (!qword_100008078)
  {
    *(_QWORD *)buf = 0x1500000001;
    v20 = 16;
    if (sysctl((int *)buf, 2u, &qword_100008078, &v20, 0, 0) == -1)
      sub_100002BA8();
    v15 = qword_100008078;
    if (!qword_100008078)
      sub_100002BC4();
  }
  if (v15 < v4 - 259200)
    v15 = v4 - 86400;
  v19 = v15;
  v16 = localtime(&v19);
  v16->tm_min = 0;
  v16->tm_hour = 0;
  v13 = mktime(v16) + 86400;
  if (a1 && a2)
  {
    v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v13 <= v4)
    {
      if (v17)
        sub_100002CAC(&v19, v13);
      *a1 = v19;
      goto LABEL_38;
    }
    if (v17)
      sub_100002C44();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100002BDC();
  }
LABEL_39:

  return v13;
}

void sub_1000026E0(char *const *a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  posix_spawnattr_t v14;
  pid_t v15;

  v15 = 0;
  v14 = 0;
  v2 = posix_spawnattr_init(&v14);
  if (v2)
    sub_10000300C(v2);
  v3 = posix_spawnattr_setjetsam_ext(&v14, 0, 10, 80, 80);
  if (v3)
    sub_10000300C(v3);
  v4 = posix_spawn(&v15, "/usr/sbin/spindump", 0, &v14, a1, environ);
  posix_spawnattr_destroy(&v14);
  if (!v4)
  {
    v13 = 0;
    v5 = 1000001;
    while (--v5)
    {
      if (waitpid(v15, &v13, 0) != -1 || *__error() != 4)
        goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100002FCC();
LABEL_12:
    if ((v13 & 0xFF7F) != 0)
    {
      if ((v13 & 0x7F) != 0)
      {
        if ((v13 & 0x7F) == 0x7F)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100002F58();
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100002E74();
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100002EE8();
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_100002E04((uint64_t)&v15, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

void sub_10000285C()
{
  size_t v0;
  int v1[2];

  if (!byte_100008058)
  {
    *(_QWORD *)v1 = 0x4100000001;
    v0 = 32;
    if (sysctl(v1, 2u, &byte_100008058, &v0, 0, 0) == -1)
      sub_100002BA8();
    if (!byte_100008058)
      sub_100002BC4();
  }
}

void sub_100002900(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100002938(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void sub_100002948(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100002964(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_100002974(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

xpc_activity_state_t sub_100002984@<X0>(xpc_activity_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 8) = a2;
  return xpc_activity_get_state(*a1);
}

void sub_100002990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002948((void *)&_mh_execute_header, &_os_log_default, a3, "Activity fired in CHECK_IN", a5, a6, a7, a8, 0);
  sub_100002930();
}

void sub_1000029C4(xpc_activity_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002984(a1, __stack_chk_guard);
  sub_100002958();
  sub_100002964((void *)&_mh_execute_header, &_os_log_default, v1, "Unable to defer with state %#lx", v2, v3, v4, v5, v6);
  sub_100002910();
}

void sub_100002A2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100002958();
  sub_100002900((void *)&_mh_execute_header, &_os_log_default, v0, "Saving report start time: %ld", v1, v2, v3, v4, v5);
  sub_100002910();
}

void sub_100002A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002948((void *)&_mh_execute_header, &_os_log_default, a3, "Already generated disk writes microstackshot report", a5, a6, a7, a8, 0);
  sub_100002930();
}

void sub_100002AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002948((void *)&_mh_execute_header, &_os_log_default, a3, "Already generated CPU microstackshot report", a5, a6, a7, a8, 0);
  sub_100002930();
}

void sub_100002AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002974((void *)&_mh_execute_header, &_os_log_default, a3, "Already have some progress: %#x", a5, a6, a7, a8, 0);
  sub_100002930();
}

void sub_100002B68()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Activity fired too early", v0, 2u);
  sub_100002930();
}

void sub_100002BA8()
{
  int *v0;
  uint64_t v1;

  v0 = __error();
  v1 = _os_assert_log(*v0);
  _os_crash(v1);
  __break(1u);
}

void sub_100002BC4()
{
  uint64_t v0;

  v0 = _os_assert_log(0);
  _os_crash(v0);
  __break(1u);
}

void sub_100002BDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100002958();
  sub_100002900((void *)&_mh_execute_header, &_os_log_default, v0, "Will be ready to generate the first report after %ld", v1, v2, v3, v4, v5);
  sub_100002910();
}

void sub_100002C44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100002958();
  sub_100002900((void *)&_mh_execute_header, &_os_log_default, v0, "Not ready to generate first report, waiting until %ld", v1, v2, v3, v4, v5);
  sub_100002910();
}

void sub_100002CAC(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v2 = *a1;
  v3 = 134218240;
  v4 = v2;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "This is first report, generating report from boot (%ld) to midnight (%ld)", (uint8_t *)&v3, 0x16u);
  sub_100002910();
}

void sub_100002D34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100002958();
  sub_100002900((void *)&_mh_execute_header, &_os_log_default, v0, "Will be ready to generate a subsequent report at %ld", v1, v2, v3, v4, v5);
  sub_100002910();
}

void sub_100002D9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100002958();
  sub_100002900((void *)&_mh_execute_header, &_os_log_default, v0, "Not ready to generate subsequent report, waiting until %ld", v1, v2, v3, v4, v5);
  sub_100002910();
}

void sub_100002E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002974((void *)&_mh_execute_header, &_os_log_default, a3, "spindump[%d] exited succesfully.", a5, a6, a7, a8, 0);
  sub_100002930();
}

void sub_100002E74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100002918();
  sub_100002938((void *)&_mh_execute_header, &_os_log_default, v0, "spindump[%d] died with signal %d.", v1, v2, v3, v4, v5);
  sub_100002910();
}

void sub_100002EE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100002918();
  sub_100002938((void *)&_mh_execute_header, &_os_log_default, v0, "spindump[%d] exited with return value %d.", v1, v2, v3, v4, v5);
  sub_100002910();
}

void sub_100002F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100002918();
  sub_100002938((void *)&_mh_execute_header, &_os_log_default, v0, "spindump[%d] stoppedby signal %d.", v1, v2, v3, v4, v5);
  sub_100002910();
}

void sub_100002FCC()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "spindump never returned", v0, 2u);
  sub_100002930();
}

void sub_10000300C(int a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = _os_assert_log(a1);
  v2 = _os_crash(v1);
  __break(1u);
  DiagnosticLogSubmissionEnabled(v2);
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}
