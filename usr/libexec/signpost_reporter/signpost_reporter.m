void sub_10000250C(id a1, WRWorkflowEventTracker *a2)
{
  -[WRWorkflowEventTracker generateTelemetry](a2, "generateTelemetry");
}

void sub_100002598(id a1, WRWorkflowEventTracker *a2)
{
  -[WRWorkflowEventTracker generateTelemetry](a2, "generateTelemetry");
}

uint64_t sub_10000294C(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "handleSignpostInterval:", a2);
  return 1;
}

uint64_t sub_10000296C(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "handleSignpostIntervalBegin:", a2);
  return 1;
}

uint64_t sub_10000298C(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "handleSignpostEmitEvent:", a2);
  return 1;
}

uint64_t sub_1000029AC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleDeviceReboot");
  return 1;
}

double sub_1000029DC()
{
  if (qword_100015B40 != -1)
    dispatch_once(&qword_100015B40, &stru_1000104A0);
  return *(double *)&qword_100015B38;
}

void sub_100002A1C(id a1)
{
  double v1;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  v1 = 1.0;
  if (info.numer != info.denom)
    v1 = (double)info.numer / (double)info.denom;
  qword_100015B38 = *(_QWORD *)&v1;
}

uint64_t sub_100002A64(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("macOS")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("iPhoneOS")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("watchOS")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("tvOS")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("bridgeOS")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *sub_100002B14(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unknown");
  else
    return *(&off_1000104C0 + a1 - 1);
}

uint64_t sub_100002B3C()
{
  return 2;
}

uint64_t sub_100002B44()
{
  return 1;
}

void sub_100002B4C(void *a1)
{
  void *v1;
  NSObject *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  char v38[16];
  char v39[16];
  uint8_t buf[4];
  void *v41;

  if (a1)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "executablePathToStallAggregation"));
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectEnumerator"));

    v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (!v3)
      goto LABEL_39;
    v4 = v3;
    v5 = *(_QWORD *)v34;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(v2);
        v7 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "processExecutablePath"));

        if (!v8)
        {
          v12 = 0;
          if ((sub_100004818(0, v9) & 1) == 0)
            goto LABEL_31;
LABEL_24:
          v28 = sub_100003384();
          v15 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            sub_1000096F0((uint64_t)v39, (uint64_t)v7);
          v12 = 0;
          goto LABEL_30;
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "processExecutablePath"));
        v11 = sub_100004524(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

        if ((sub_100004818(v12, v13) & 1) == 0)
        {
          if (!v12)
            goto LABEL_31;
          v29 = sub_100003384();
          v15 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Skipping non-internal bundle ID %@.", buf, 0xCu);
          }
          goto LABEL_30;
        }
        if (!v12)
          goto LABEL_24;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "longCommitStats"));
        if (v14)
          goto LABEL_19;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "longTransactionLifetimeStats"));
        if (v14
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "longTransactionLifetimeStats"))) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "longResponsibleFrameLifetimeStats"))) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responsibleGlitchStats"))) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "glitchStats"))) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responsibleFirstFrameGlitchStats"))) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstFrameGlitchStats"))) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responsibleNonFirstFrameNonSkipGlitchStats"))) != 0)
        {
LABEL_19:

LABEL_20:
          v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v12, CFSTR("BundleID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "longCommitStats"));
          sub_10000304C(CFSTR("Commit"), v16, v15);

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "longTransactionLifetimeStats"));
          sub_10000304C(CFSTR("TransactionLifetime"), v17, v15);

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "longHIDLatencyStats"));
          sub_10000304C(CFSTR("HIDLatency"), v18, v15);

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "longResponsibleFrameLifetimeStats"));
          sub_10000304C(CFSTR("FrameLifetime"), v19, v15);

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responsibleGlitchStats"));
          sub_10000304C(CFSTR("GlitchLongPole"), v20, v15);

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "glitchStats"));
          sub_10000304C(CFSTR("GlitchContributor"), v21, v15);

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responsibleFirstFrameGlitchStats"));
          sub_10000304C(CFSTR("FirstFrameGlitchLongPole"), v22, v15);

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstFrameGlitchStats"));
          sub_10000304C(CFSTR("FirstFrameGlitchContributor"), v23, v15);

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responsibleNonFirstFrameNonSkipGlitchStats"));
          sub_10000304C(CFSTR("NonFirstFrameNonSkipGlitchLongPole"), v24, v15);

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responsibleNonFirstFrameNonSkipPerceivedGlitchStats"));
          sub_10000304C(CFSTR("NonFirstFrameNonSkipPerceivedGlitchLongPole"), v25, v15);

          v26 = sub_100003384();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            sub_100009740((uint64_t)v38, (uint64_t)v15);

          j__AnalyticsSendEvent(CFSTR("com.apple.performance.ca_stall_stats"), v15);
LABEL_30:

          goto LABEL_31;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responsibleNonFirstFrameNonSkipPerceivedGlitchStats"));

        if (v30)
          goto LABEL_20;
LABEL_31:

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v31 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v4 = v31;
      if (!v31)
        goto LABEL_39;
    }
  }
  v32 = sub_100003384();
  v2 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_1000096B0(v2);
LABEL_39:

}

void sub_10000304C(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  if (a2)
  {
    v5 = a3;
    v6 = a2;
    v7 = a1;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Count"), v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@TotalMs"), v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "intervalCount")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v12);

    v10 = (unint64_t)objc_msgSend(v6, "totalIntervalDurationNs");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10 / 0xF4240));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v8);

  }
}

void sub_10000317C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t sub_10000319C(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_1000031B0(uint64_t a1)
{
  uint64_t *v1;
  id v2;

  if (a1 == 2)
  {
    if (qword_100015B60 != -1)
      dispatch_once(&qword_100015B60, &stru_100010508);
    v1 = &qword_100015B58;
  }
  else
  {
    if (a1 != 1)
    {
      v2 = 0;
      return v2;
    }
    if (qword_100015B50 != -1)
      dispatch_once(&qword_100015B50, &stru_1000104E8);
    v1 = &qword_100015B48;
  }
  v2 = (id)*v1;
  return v2;
}

void sub_100003244(id a1)
{
  SRSubsystemCategoryNameFilter *v1;
  SRSubsystemCategoryNameFilter *v2;
  void *v3;
  id v4;

  v1 = [SRSubsystemCategoryNameFilter alloc];
  if (qword_100015B70 != -1)
    dispatch_once(&qword_100015B70, &stru_100010528);
  v4 = (id)qword_100015B68;
  v2 = -[SRSubsystemCategoryNameFilter initWithDictionaryArray:](v1, "initWithDictionaryArray:", v4);
  v3 = (void *)qword_100015B48;
  qword_100015B48 = (uint64_t)v2;

}

void sub_1000032CC(id a1)
{
  SRSubsystemCategoryNameFilter *v1;
  SRSubsystemCategoryNameFilter *v2;
  void *v3;
  id v4;

  v1 = [SRSubsystemCategoryNameFilter alloc];
  if (qword_100015B80 != -1)
    dispatch_once(&qword_100015B80, &stru_100010548);
  v4 = (id)qword_100015B78;
  v2 = -[SRSubsystemCategoryNameFilter initWithDictionaryArray:](v1, "initWithDictionaryArray:", v4);
  v3 = (void *)qword_100015B58;
  qword_100015B58 = (uint64_t)v2;

}

void sub_100003354(id a1)
{
  void *v1;

  v1 = (void *)qword_100015B68;
  qword_100015B68 = (uint64_t)&off_100012618;

}

void sub_10000336C(id a1)
{
  void *v1;

  v1 = (void *)qword_100015B78;
  qword_100015B78 = (uint64_t)&off_100012630;

}

id sub_100003384()
{
  if (qword_100015B88 != -1)
    dispatch_once(&qword_100015B88, &stru_100010568);
  return (id)qword_100015B90;
}

void sub_1000033C4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SignpostSupport", "signpost_reporter");
  v2 = (void *)qword_100015B90;
  qword_100015B90 = (uint64_t)v1;

}

void sub_100003EF4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

uint64_t sub_100003F08(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  void *v32;
  unsigned int v33;

  v3 = a1;
  v4 = v3;
  if (a2 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "string1Name"));
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("<workflowID>")) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subsystem"));
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.CoreIDV.telemetry"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("api"));

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
          if (qword_100015BB0 != -1)
            dispatch_once(&qword_100015BB0, &stru_1000105A8);
          v11 = (void *)qword_100015BA8;
LABEL_25:
          v29 = (uint64_t)objc_msgSend(v11, "containsObject:", v10);

          goto LABEL_26;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("requests"));

        if (v31)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
          if (qword_100015BC0 != -1)
            dispatch_once(&qword_100015BC0, &stru_1000105C8);
          v11 = (void *)qword_100015BB8;
          goto LABEL_25;
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
        v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("library"));

        if (v33)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
          if (qword_100015BD0 != -1)
            dispatch_once(&qword_100015BD0, &stru_1000105E8);
          v11 = (void *)qword_100015BC8;
          goto LABEL_25;
        }
      }
    }
    else
    {

    }
  }
  if (sub_100004150(v4))
  {
    v12 = sub_10000428C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_100009860(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    if (!sub_10000437C(v4))
    {
      v29 = 0;
      goto LABEL_26;
    }
    v21 = sub_10000428C();
    v13 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_100009890(v13, v22, v23, v24, v25, v26, v27, v28);
  }

  v29 = 1;
LABEL_26:

  return v29;
}

BOOL sub_100004150(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  _BOOL8 v9;

  v1 = a1;
  if (qword_100015BA0 != -1)
    dispatch_once(&qword_100015BA0, &stru_100010588);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "string1Name"));
  if (objc_msgSend(CFSTR("AppVersion"), "isEqualToString:", v2))
  {
    v3 = (void *)qword_100015B98;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "name"));
    if (objc_msgSend(v3, "containsObject:", v4))
    {
      v5 = off_100015A30;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "category"));
      if (-[__CFString isEqualToString:](v5, "isEqualToString:", v6))
      {
        v7 = off_100015A38;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "subsystem"));
        if (-[__CFString isEqualToString:](v7, "isEqualToString:", v8))
          v9 = objc_msgSend(v1, "durationMachContinuousTime") != 0;
        else
          v9 = 0;

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id sub_10000428C()
{
  if (qword_100015BD8 != -1)
    dispatch_once(&qword_100015BD8, &stru_100010608);
  return (id)qword_100015BE0;
}

id sub_1000042D0(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = sub_10000437C(a1);
  if ((_DWORD)v1)
  {
    v2 = sub_10000428C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_1000098C0(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return v1;
}

void sub_100004320(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", off_100015A40, off_100015A48, off_100015A50, off_100015A58, 0));
  v2 = (void *)qword_100015B98;
  qword_100015B98 = v1;

}

id sub_10000437C(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  id v8;

  v1 = a1;
  v2 = off_100015A70;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "name"));
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", v3))
  {
    v4 = off_100015A68;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "category"));
    if (-[__CFString isEqualToString:](v4, "isEqualToString:", v5))
    {
      v6 = off_100015A60;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "subsystem"));
      v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_100004444(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_100012648));
  v2 = (void *)qword_100015BA8;
  qword_100015BA8 = v1;

}

void sub_100004478(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_100012660));
  v2 = (void *)qword_100015BB8;
  qword_100015BB8 = v1;

}

void sub_1000044AC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_100012678));
  v2 = (void *)qword_100015BC8;
  qword_100015BC8 = v1;

}

void sub_1000044E0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SignpostSupport", "TelemetryStringAllowlistingExemption");
  v2 = (void *)qword_100015BE0;
  qword_100015BE0 = (uint64_t)v1;

}

void sub_100004510(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id sub_100004524(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;

  v1 = a1;
  v2 = v1;
  if (qword_100015BF0 != -1)
  {
    dispatch_once(&qword_100015BF0, &stru_100010628);
    if (v2)
      goto LABEL_3;
LABEL_26:
    v5 = 0;
    goto LABEL_27;
  }
  if (!v1)
    goto LABEL_26;
LABEL_3:
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100015BE8, "objectForKeyedSubscript:", v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

  if (v3 == v4)
  {
    v5 = 0;
  }
  else if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@."), v6));

    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByDeletingLastPathComponent"));
    if (v8)
    {
      v9 = 0;
      while ((objc_msgSend(v8, "isEqualToString:", &stru_100011260) & 1) == 0
           && (objc_msgSend(v8, "isEqualToString:", CFSTR("/")) & 1) == 0
           && v9 <= 0x63)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        if ((objc_msgSend(v10, "hasPrefix:", v7) & 1) != 0)
        {
          v8 = v8;

          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v8));
          v14 = v13;
          if (!v13)
            goto LABEL_23;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));

          if (!v15)
            goto LABEL_23;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
          objc_msgSend((id)qword_100015BE8, "setObject:forKeyedSubscript:", v16, v2);

          v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
          v17 = sub_100003384();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            sub_1000098F0((uint64_t)v5, (uint64_t)v2, v18);

          if (v5)
          {
            objc_msgSend((id)qword_100015BE8, "setObject:forKeyedSubscript:", v5, v2);
          }
          else
          {
LABEL_23:
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            objc_msgSend((id)qword_100015BE8, "setObject:forKeyedSubscript:", v19, v2);

            v5 = 0;
          }

          goto LABEL_15;
        }
        ++v9;
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByDeletingLastPathComponent"));

        v8 = (id)v11;
        if (!v11)
          break;
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend((id)qword_100015BE8, "setObject:forKeyedSubscript:", v12, v2);

    v5 = 0;
LABEL_15:

  }
LABEL_27:

  return v5;
}

void sub_1000047EC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v2 = (void *)qword_100015BE8;
  qword_100015BE8 = v1;

}

void *sub_100004818(void *a1, const char *a2)
{
  if (a1)
    return objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple."));
  return a1;
}

uint64_t sub_100004CD8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unsigned __int8 v27;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "attributes"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BundleIdOverride")));

  if (v3)
  {
    v4 = v1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subsystem"));
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.runningboard"));

    if (v6
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category")),
          v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("sp_telemetry")),
          v7,
          v8))
    {
      if (qword_100015C20 != -1)
        dispatch_once(&qword_100015C20, &stru_1000106A8);
      v9 = qword_100015C18;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      LOBYTE(v9) = objc_msgSend((id)v9, "containsObject:", v10);

      if ((v9 & 1) != 0)
        goto LABEL_17;
    }
    else
    {

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subsystem"));
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.spindump"));

    if ((v12 & 1) != 0)
    {
LABEL_17:
      v3 = 1;
      goto LABEL_28;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subsystem"));
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.SplashBoard")) & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Snapshot"));

      if ((v15 & 1) != 0)
        goto LABEL_17;
    }
    else
    {

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subsystem"));
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.SplashBoard")))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("Memory")) & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("OverMemoryLimit"));

        if ((v19 & 1) != 0)
          goto LABEL_17;
LABEL_20:
        v20 = v4;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("HangInterval")) & 1) != 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subsystem"));
          v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.hangtracer"));

          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "category"));
            v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("signpost_hang"));

            if ((v25 & 1) != 0
              || (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "category")),
                  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("always_on_hang")),
                  v26,
                  (v27 & 1) != 0))
            {
              v3 = 1;
LABEL_27:

              goto LABEL_28;
            }
          }
        }
        else
        {

        }
        v3 = 0;
        goto LABEL_27;
      }

    }
    goto LABEL_20;
  }
LABEL_28:

  return v3;
}

void start()
{
  void *v0;
  dispatch_queue_t v1;
  void *v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_source_t v5;
  void *v6;

  v0 = objc_autoreleasePoolPush();
  v1 = dispatch_queue_create("signpost_reporter processing queue", 0);
  v2 = (void *)qword_100015BF8;
  qword_100015BF8 = (uint64_t)v1;

  v3 = dispatch_queue_create("signpost_reporter CoreAnalytics reporting queue", 0);
  v4 = (void *)qword_100015C00;
  qword_100015C00 = (uint64_t)v3;

  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, (dispatch_queue_t)qword_100015BF8);
  v6 = (void *)qword_100015C08;
  qword_100015C08 = (uint64_t)v5;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100015C08, &stru_100010648);
  xpc_activity_register("com.apple.signpost.signpost_reporter_activity", XPC_ACTIVITY_CHECK_IN, &stru_100010688);
  dispatch_resume((dispatch_object_t)qword_100015C08);
  dispatch_main();
}

void sub_100005518(id a1)
{
  exit(0);
}

void sub_100005528(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  xpc_activity_state_t state;
  xpc_activity_state_t v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  dispatch_queue_t v13;
  dispatch_semaphore_t v14;
  id v15;
  SignpostReporterConfigObserverDelegate *v16;
  NSObject *v17;
  SignpostReporterConfigObserverDelegate *v18;
  dispatch_time_t v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  const __CFString *v24;
  id v25;
  NSObject *v26;
  void *v27;
  unsigned int v28;
  id v29;
  NSObject *v30;
  _BOOL4 v31;
  double v32;
  const __CFString *v33;
  id v34;
  id v35;
  SignpostReporterObjectFilter *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  NSObject *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  NSObject *v61;
  dispatch_source_t v62;
  void *v63;
  NSObject *v64;
  id v65;
  id v66;
  NSObject *v67;
  void *v68;
  unint64_t v69;
  float v70;
  NSObject *v71;
  id v72;
  id v73;
  SignpostReporterObjectFilter *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _BOOL4 v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  SignpostReporterObjectFilter *v85;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id val;
  id vala;
  OS_xpc_object *v93;
  id v94;
  _QWORD handler[4];
  OS_xpc_object *v96;
  _QWORD *v97;
  id v98;
  _QWORD v99[3];
  char v100;
  _QWORD v101[4];
  id v102;
  id v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  id v108;
  id v109;
  uint8_t v110[8];
  uint64_t v111;
  uint64_t (*v112)(uint64_t, void *);
  void *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  void **v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  _QWORD v127[4];
  SignpostReporterObjectFilter *v128;
  id v129;
  __CFString *v130;
  statfs buf;

  v2 = a2;
  v3 = (void *)os_transaction_create("com.apple.signpost.signpost_reporter_activity transaction");
  state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    if (xpc_activity_should_defer(v2) && xpc_activity_set_state(v2, 3))
    {
      v8 = sub_100003384();
      v7 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deferred signpost_reporter\n", (uint8_t *)&buf, 2u);
      }
      goto LABEL_13;
    }
    v93 = v2;
    if (os_variant_has_internal_diagnostics("com.apple.signpost"))
    {
      v10 = sub_100003384();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Reporting based on os_variant result", (uint8_t *)&buf, 2u);
      }

      v12 = 1;
    }
    else
    {
      v13 = dispatch_queue_create("signpost_reporter configuration observing queue", 0);
      v14 = dispatch_semaphore_create(0);
      v118 = 0;
      v119 = (uint64_t)&v118;
      v120 = 0x2020000000;
      LOBYTE(v121) = 0;
      v15 = objc_alloc_init((Class)AnalyticsConfigurationObserver);
      v16 = [SignpostReporterConfigObserverDelegate alloc];
      *(_QWORD *)&buf.f_bsize = _NSConcreteStackBlock;
      buf.f_blocks = 3221225472;
      buf.f_bfree = (uint64_t)sub_1000081EC;
      buf.f_bavail = (uint64_t)&unk_100010838;
      buf.f_ffree = (uint64_t)&v118;
      v17 = v14;
      buf.f_files = (uint64_t)v17;
      v18 = -[SignpostReporterConfigObserverDelegate initWithCallbackBlock:](v16, "initWithCallbackBlock:", &buf);
      objc_msgSend(v15, "setConfigurationObserverDelegate:queue:", v18, v13);
      objc_msgSend(v15, "startObservingConfigurationType:", CFSTR("com.apple.performance.signpost_reporter_tasking"));
      v19 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v17, v19))
      {
        v20 = sub_100003384();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v110 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Not reporting based on not being tasked-on by CoreAnalytics (Timeout waiting for config)", v110, 2u);
        }

        v12 = 0;
      }
      else
      {
        v12 = *(_BYTE *)(v119 + 24) != 0;
      }

      _Block_object_dispose(&v118, 8);
    }
    byte_100015C28 = v12;
    v22 = sub_100003384();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138412802;
      if (byte_100015C28)
        v24 = CFSTR("Enabled");
      else
        v24 = CFSTR("Disabled");
      *(_QWORD *)&buf.f_iosize = v24;
      WORD2(buf.f_blocks) = 2112;
      *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)CFSTR("Enabled");
      HIWORD(buf.f_bfree) = 2112;
      buf.f_bavail = (uint64_t)CFSTR("Enabled");
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "os_signpost CA Telemetry: %@, aggregation CA telemetry: %@, CAMetalLayer CA telemetry: %@", (uint8_t *)&buf, 0x20u);
    }

    if (sub_1000062E0())
    {
      v25 = sub_100003384();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Bailing due to cookie file", (uint8_t *)&buf, 2u);
      }

      sub_100006374();
      goto LABEL_62;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    if (sub_1000062E0())
    {

LABEL_62:
      goto LABEL_63;
    }
    v28 = objc_msgSend(v27, "createFileAtPath:contents:attributes:", CFSTR("/var/run/signpost_reporter_running"), 0, 0);
    v29 = sub_100003384();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (!v28)
    {
      if (v31)
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Could not create cookie file", (uint8_t *)&buf, 2u);
      }

      goto LABEL_62;
    }
    if (v31)
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Created cookie file", (uint8_t *)&buf, 2u);
    }

    v86 = mach_continuous_time();
    val = objc_alloc_init((Class)SignpostSupportObjectExtractor);
    if (!byte_100015C28)
    {
      v89 = 0;
      v85 = 0;
      v33 = 0;
      v34 = 0;
      v35 = +[SignpostWorkflowResponsiveness allWorkflows](SignpostWorkflowResponsiveness, "allWorkflows", 0);
LABEL_51:
      v47 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v48 = objc_msgSend(objc_alloc((Class)SignpostAggregationAccumulator), "initWithIncludeRawIntervals:", 0);
      v49 = objc_msgSend(objc_alloc((Class)SSCAMetalLayerClientSessionAccumulator), "initWithIncludeTimelines:", 0);
      v50 = sub_100003384();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 138412290;
        *(_QWORD *)&buf.f_iosize = v33;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Boot disk type: %@", (uint8_t *)&buf, 0xCu);
      }

      v118 = _NSConcreteStackBlock;
      v119 = 3221225472;
      v120 = (uint64_t)sub_100006778;
      v121 = &unk_100010720;
      v84 = v48;
      v122 = v84;
      v52 = v89;
      v123 = v52;
      v53 = v47;
      v124 = v53;
      v54 = v34;
      v126 = v54;
      v55 = v49;
      v125 = v55;
      objc_msgSend(val, "setIntervalCompletionProcessingBlock:", &v118);
      *(_QWORD *)v110 = _NSConcreteStackBlock;
      v111 = 3221225472;
      v112 = sub_1000068E4;
      v113 = &unk_100010748;
      v56 = v52;
      v114 = v56;
      v57 = v53;
      v115 = v57;
      v88 = v54;
      v117 = v88;
      v58 = v55;
      v116 = v58;
      objc_msgSend(val, "setEmitEventProcessingBlock:", v110);
      v106[0] = _NSConcreteStackBlock;
      v106[1] = 3221225472;
      v106[2] = sub_100006A20;
      v106[3] = &unk_100010770;
      v90 = v56;
      v107 = v90;
      v87 = v57;
      v108 = v87;
      v83 = v58;
      v109 = v83;
      objc_msgSend(val, "setDeviceRebootProcessingBlock:", v106);

      if (byte_100015C28)
      {
        v104[0] = _NSConcreteStackBlock;
        v104[1] = 3221225472;
        v104[2] = sub_100006B2C;
        v104[3] = &unk_100010798;
        v105 = v88;
        objc_msgSend(val, "setAnimationIntervalCompletionProcessingBlock:", v104);
        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472;
        v101[2] = sub_100006B4C;
        v101[3] = &unk_1000107C0;
        v102 = v90;
        v103 = v87;
        objc_msgSend(val, "setBeginEventProcessingBlock:", v101);
        objc_msgSend(val, "setBuildSkyLightAnimationCompositeIntervalTimelines:", 0);

      }
      v99[0] = 0;
      v99[1] = v99;
      v99[2] = 0x2020000000;
      v100 = 0;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -86400.0));
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v61 = dispatch_queue_create("signpost_reporter defer polling queue", 0);
      v62 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v61);
      v63 = (void *)qword_100015C10;
      qword_100015C10 = (uint64_t)v62;

      dispatch_source_set_timer((dispatch_source_t)qword_100015C10, 0, 0x9502F900uLL, 0x9502F900uLL);
      objc_initWeak((id *)&buf, val);
      v64 = qword_100015C10;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100006C58;
      handler[3] = &unk_1000107E8;
      v96 = v93;
      objc_copyWeak(&v98, (id *)&buf);
      v97 = v99;
      dispatch_source_set_event_handler(v64, handler);
      dispatch_resume((dispatch_object_t)qword_100015C10);
      objc_destroyWeak(&v98);

      objc_destroyWeak((id *)&buf);
      v94 = 0;
      LOBYTE(v64) = objc_msgSend(val, "processLogArchiveWithPath:startDate:endDate:errorOut:", 0, v59, v60, &v94);
      v65 = v94;
      if ((v64 & 1) == 0)
      {
        v66 = sub_100003384();
        v67 = objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "localizedDescription"));
          buf.f_bsize = 138412290;
          *(_QWORD *)&buf.f_iosize = v68;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Failed to process signpost data due to error: %@", (uint8_t *)&buf, 0xCu);

        }
      }
      v69 = mach_continuous_time() - v86;
      if (qword_100015C68 != -1)
        dispatch_once(&qword_100015C68, &stru_100010878);
      v70 = *(double *)&qword_100015C70 * (double)v69;
      v71 = qword_100015C00;
      *(_QWORD *)&buf.f_bsize = _NSConcreteStackBlock;
      buf.f_blocks = 3221225472;
      buf.f_bfree = (uint64_t)sub_100006D60;
      buf.f_bavail = (uint64_t)&unk_100010810;
      v72 = v84;
      buf.f_files = (uint64_t)v72;
      v73 = v83;
      buf.f_ffree = (uint64_t)v73;
      v74 = v85;
      buf.f_fsid = (fsid_t)v74;
      v75 = v90;
      *(_QWORD *)&buf.f_owner = v75;
      *(float *)&buf.f_mntonname[16] = v70;
      v76 = val;
      *(_QWORD *)&buf.f_mntonname[8] = v99;
      vala = v76;
      *(_QWORD *)&buf.f_flags = v76;
      *(_QWORD *)buf.f_fstypename = 0;
      v77 = v59;
      *(_QWORD *)&buf.f_fstypename[8] = v77;
      v78 = v60;
      *(_QWORD *)buf.f_mntonname = v78;
      dispatch_sync(v71, &buf);
      sub_100006374();

      _Block_object_dispose(v99, 8);
      goto LABEL_62;
    }
    if (sub_100002B44())
    {
      v89 = objc_alloc_init((Class)SignpostCAStallAggregationBuilder);
      LODWORD(v32) = dword_100015A28;
      objc_msgSend(v89, "setMaxDurationSec:", v32);
    }
    else
    {
      v89 = 0;
    }
    v36 = objc_alloc_init(SignpostReporterObjectFilter);
    bzero(&buf, 0x878uLL);
    if (statfs("/", &buf))
    {
      v37 = sub_100003384();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
LABEL_48:
        sub_100009AD4(v38, v39, v40, v41, v42, v43, v44, v45);
    }
    else
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", buf.f_fstypename, 4));
      v79 = sub_100003384();
      v38 = objc_claimAutoreleasedReturnValue(v79);
      v80 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
      if (v46)
      {
        if (v80)
          sub_100009B04((uint64_t)v46, v38);
        goto LABEL_50;
      }
      if (v80)
        goto LABEL_48;
    }
    v46 = 0;
LABEL_50:

    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = sub_10000644C;
    v127[3] = &unk_1000106F8;
    v85 = v36;
    v128 = v85;
    v82 = v46;
    v129 = v82;
    v130 = CFSTR("SSD");
    v34 = objc_retainBlock(v127);

    v33 = CFSTR("SSD");
    v35 = +[SignpostWorkflowResponsiveness allWorkflows](SignpostWorkflowResponsiveness, "allWorkflows", v82);
    goto LABEL_51;
  }
  v5 = state;
  if (state)
  {
    v9 = sub_100003384();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 134217984;
      *(_QWORD *)&buf.f_iosize = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unknown state %ld\n", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v6 = sub_100003384();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking in\n", (uint8_t *)&buf, 2u);
    }
  }
LABEL_13:

LABEL_63:
  xpc_transaction_exit_clean();

}

void sub_100006264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1000062AC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_100012690));
  v2 = (void *)qword_100015C18;
  qword_100015C18 = v1;

}

id sub_1000062E0()
{
  void *v0;
  id v1;
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = 0;
  v1 = objc_msgSend(v0, "fileExistsAtPath:isDirectory:", CFSTR("/var/run/signpost_reporter_running"), &v13);
  if ((_DWORD)v1)
    v2 = v13 == 0;
  else
    v2 = 1;
  if (!v2)
  {
    v3 = sub_100003384();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100009B78(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v1;
}

void sub_100006374()
{
  void *v0;
  unsigned int v1;
  id v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[8];
  id v7;

  if (sub_1000062E0())
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = 0;
    v1 = objc_msgSend(v0, "removeItemAtPath:error:", CFSTR("/var/run/signpost_reporter_running"), &v7);
    v2 = v7;
    v3 = sub_100003384();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = v4;
    if (v1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleared cookie file", v6, 2u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      sub_100009BA8(v2, v5);
    }

  }
}

void sub_10000644C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldReportSignpostObject:classificationOut:", v3, 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "coreAnalyticsPayload"));
    v5 = v4;
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 40);
      if (v6)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("BootPartitionFS"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("BootDiskType"));
      sub_10000656C();
      v7 = qword_100015C00;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100006668;
      v10[3] = &unk_1000106D0;
      v11 = v3;
      v12 = v5;
      dispatch_async(v7, v10);

      v8 = v11;
    }
    else
    {
      v9 = sub_100003384();
      v8 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_100009C60(v3, v8);
    }

  }
}

void sub_10000656C()
{
  double v0;
  unsigned int v1;
  id v2;
  NSObject *v3;

  if (qword_100015C30 != -1)
    dispatch_once(&qword_100015C30, &stru_100010858);
  if ((unint64_t)++qword_100015C50 >= 0xA)
  {
    v0 = *(double *)&qword_100015C38 * (double)(mach_continuous_time() - qword_100015C48);
    if (v0 < *(float *)&dword_100015C40)
    {
      v1 = (*(float *)&dword_100015C40 - v0);
      v2 = sub_100003384();
      v3 = objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        sub_100009D3C(v1, v3);

      usleep(v1);
      qword_100015C58 += v1;
      ++qword_100015C60;
    }
    qword_100015C50 = 0;
    qword_100015C48 = mach_continuous_time();
  }
}

void sub_100006668(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "subsystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
  v9[0] = CFSTR("sp");
  v9[1] = v2;
  v9[2] = v3;
  v9[3] = v4;
  v5 = v2;
  v6 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR("__")));
  AnalyticsSendEvent(v8, *(_QWORD *)(a1 + 40));

}

uint64_t sub_100006778(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subsystem"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Telemetry.PeriodicAggregations"));

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "handleInterval:", v3);
  if (byte_100015C28)
  {
    objc_msgSend(*(id *)(a1 + 40), "handleSignpostInterval:", v3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = *(id *)(a1 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "handleSignpostInterval:", v3, (_QWORD)v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 56), "processInterval:", v3, (_QWORD)v12);

  return 1;
}

uint64_t sub_1000068E4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a2;
  if (byte_100015C28)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSignpostEvent:", v3);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "handleSignpostEmitEvent:", v3, (_QWORD)v10);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 48), "processEvent:", v3, (_QWORD)v10);

  return 1;
}

uint64_t sub_100006A20(id *a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (byte_100015C28)
  {
    objc_msgSend(a1[4], "handleDeviceReboot");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = a1[5];
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "handleDeviceReboot", (_QWORD)v8);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
  objc_msgSend(a1[6], "processDeviceReboot", (_QWORD)v8);
  return 1;
}

uint64_t sub_100006B2C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t sub_100006B4C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "handleSignpostIntervalBegin:", v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "handleSignpostIntervalBegin:", v3, (_QWORD)v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return 1;
}

void sub_100006C58(uint64_t a1)
{
  _BOOL4 should_defer;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  id WeakRetained;
  id v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  uint8_t v11[2];
  uint8_t buf[16];

  should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  v3 = sub_100003384();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (should_defer)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trying to stop in-flight reporting work.", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "stopProcessing");

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v7 = sub_100003384();
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v8 = "Concluding processing due to deferral request";
      v9 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)v11 = 0;
    v8 = "Deferral not requested, continuing.";
    v9 = v11;
    goto LABEL_8;
  }

}

void sub_100006D60(uint64_t a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  __CFString *v40;
  __CFString *v41;
  uint64_t v42;
  id v43;
  __CFString *v44;
  _QWORD *v45;
  id v46;
  NSObject *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  __CFString *v54;
  uint64_t v55;
  void *k;
  uint64_t v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *m;
  uint64_t v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  void *n;
  uint64_t v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  uint64_t v91;
  void *ii;
  uint64_t v93;
  void *v94;
  id v95;
  NSObject *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  uint64_t v103;
  void *jj;
  uint64_t v105;
  void *v106;
  id v107;
  NSObject *v108;
  void *v109;
  const __CFString *v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  uint64_t v115;
  void *kk;
  uint64_t v117;
  void *v118;
  void *v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  NSObject *v131;
  void *v132;
  id v133;
  void *v134;
  id v135;
  void *v136;
  id v137;
  const char *v138;
  id v139;
  NSObject *v140;
  void *v141;
  id v142;
  NSObject *v143;
  float v144;
  const __CFString *v145;
  id v146;
  id v147;
  id v148;
  double v149;
  const __CFString *v150;
  const __CFString *v151;
  const __CFString *v152;
  void *v153;
  __CFString *v154;
  __CFString *v155;
  int v156;
  id v157;
  int v158;
  id v159;
  uint64_t v160;
  __CFString *v162;
  id v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _QWORD v188[5];
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t v192;
  uint8_t v193[4];
  uint64_t v194;
  uint8_t buf[4];
  const __CFString *v196;
  __int16 v197;
  const __CFString *v198;
  __int16 v199;
  const __CFString *v200;
  __int16 v201;
  double v202;
  __int16 v203;
  id v204;
  __int16 v205;
  id v206;
  __int16 v207;
  id v208;
  __int16 v209;
  id v210;
  __int16 v211;
  id v212;
  __int16 v213;
  id v214;
  __int16 v215;
  id v216;
  __int16 v217;
  double v218;
  __int16 v219;
  __CFString *v220;
  __int16 v221;
  __CFString *v222;
  __int16 v223;
  const char *v224;
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _QWORD v228[16];
  _OWORD v229[8];
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;

  v159 = *(id *)(a1 + 32);
  if (v159)
  {
    v1 = sub_100003384();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "signatureToAccumulatorEntry"));
      *(_DWORD *)buf = 134217984;
      v196 = (const __CFString *)objc_msgSend(v3, "count");
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Accumulated information on %llu aggregations", buf, 0xCu);

    }
    v232 = 0u;
    v233 = 0u;
    v230 = 0u;
    v231 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "signatureToAccumulatorEntry"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v230, buf, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v231;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v231 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accumulatedAggregation"));
          if ((objc_msgSend(v10, "telemetryEnabled") & 1) != 0)
          {
            v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_coreAnalyticsEventPayloadDictionary"));
            v12 = sub_100003384();
            v13 = objc_claimAutoreleasedReturnValue(v12);
            v14 = v13;
            if (v11)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aggregationSignature"));
                LODWORD(v229[0]) = 138412290;
                *(_QWORD *)((char *)v229 + 4) = v15;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Submitting CA event payload for %@", (uint8_t *)v229, 0xCu);

              }
              v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_coreAnalyticsEventName"));
              AnalyticsSendEvent(v14, v11);
            }
            else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              sub_100009DAC(v193, v10, &v194, v14);
            }

          }
          else
          {
            v16 = sub_100003384();
            v11 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aggregationSignature"));
              LODWORD(v229[0]) = 138412290;
              *(_QWORD *)((char *)v229 + 4) = v17;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ is not telemetry enabled", (uint8_t *)v229, 0xCu);

            }
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v230, buf, 16);
      }
      while (v6);
    }

  }
  v18 = *(id *)(a1 + 40);
  v19 = v18;
  if (v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coreAnalyticsEvents"));
    v21 = sub_100003384();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (const __CFString *)objc_msgSend(v20, "count");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "processingErrors"));
      v25 = (const __CFString *)objc_msgSend(v24, "count");
      *(_DWORD *)buf = 134218240;
      v196 = v23;
      v197 = 2048;
      v198 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Reporting information on %llu CAMetalLayer clients with %llu errors encountered", buf, 0x16u);

    }
    v232 = 0u;
    v233 = 0u;
    v230 = 0u;
    v231 = 0u;
    v26 = v20;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v230, buf, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v231;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v231 != v28)
            objc_enumerationMutation(v26);
          v30 = *(_QWORD *)(*((_QWORD *)&v230 + 1) + 8 * (_QWORD)j);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSCAMetalLayerClientSessionAccumulator coreAnalyticsEventName](SSCAMetalLayerClientSessionAccumulator, "coreAnalyticsEventName"));
          AnalyticsSendEvent(v31, v30);

        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v230, buf, 16);
      }
      while (v27);
    }

    v228[0] = CFSTR("ErrorCount");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "processingErrors"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "count")));
    *(_QWORD *)&v229[0] = v33;
    v228[1] = CFSTR("CAMetalLayerSessionCount");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "count")));
    *((_QWORD *)&v229[0] + 1) = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v229, v228, 2));

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[SSCAMetalLayerClientSessionAccumulator coreAnalyticsProcessingMetadataName](SSCAMetalLayerClientSessionAccumulator, "coreAnalyticsProcessingMetadataName"));
    AnalyticsSendEvent(v36, v35);

  }
  v38 = *(void **)(a1 + 48);
  v37 = *(void **)(a1 + 56);
  v39 = *(float *)(a1 + 104);
  v157 = objc_msgSend(*(id *)(a1 + 64), "processedEventCount");
  v156 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  v160 = *(_QWORD *)(a1 + 72);
  if (v160)
  {
    v158 = 0;
    v40 = CFSTR("log archive end");
    v41 = CFSTR("log archive begin");
  }
  else
  {
    v42 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(a1 + 80), 1, 2));
    if (*(_QWORD *)(a1 + 72))
    {
      v158 = 0;
      v40 = CFSTR("log archive end");
    }
    else
    {
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(a1 + 88), 1, 2));
      v158 = 1;
    }
    v41 = (__CFString *)v42;
  }
  v43 = v38;
  v163 = v37;
  v154 = v41;
  v162 = v41;
  v44 = v40;
  if (byte_100015C28)
  {
    v155 = v44;
    v189 = 0;
    v190 = &v189;
    v191 = 0x2020000000;
    v192 = 0;
    v188[0] = _NSConcreteStackBlock;
    v188[1] = 3221225472;
    v188[2] = sub_10000864C;
    v188[3] = &unk_1000108A0;
    v188[4] = &v189;
    v45 = objc_retainBlock(v188);
    v46 = sub_100003384();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "allInspectedSignpostObjectsAggregation"));
      v49 = (const __CFString *)objc_msgSend(v48, "totalCount");
      *(_DWORD *)buf = 134217984;
      v196 = v49;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "**************\nTotal signpost object count: %llu", buf, 0xCu);

    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "allInspectedSignpostObjectsAggregation"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "keysInDescendingCountOrder"));

    v190[3] = 0;
    v184 = 0u;
    v185 = 0u;
    v186 = 0u;
    v187 = 0u;
    v52 = v51;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v184, &v230, 16);
    v54 = v40;
    if (v53)
    {
      v55 = *(_QWORD *)v185;
      do
      {
        for (k = 0; k != v53; k = (char *)k + 1)
        {
          if (*(_QWORD *)v185 != v55)
            objc_enumerationMutation(v52);
          v57 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * (_QWORD)k);
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "allInspectedSignpostObjectsAggregation"));
          ((void (*)(_QWORD *, uint64_t, void *, const __CFString *))v45[2])(v45, v57, v58, CFSTR("AllInspected"));

        }
        v40 = v54;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v184, &v230, 16);
      }
      while (v53);
    }

    v59 = sub_100003384();
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryReportedAggregation"));
      v62 = (const __CFString *)objc_msgSend(v61, "totalCount");
      *(_DWORD *)buf = 134217984;
      v196 = v62;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "**************\nReported signpost object count: %llu", buf, 0xCu);

    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryReportedAggregation"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "keysInDescendingCountOrder"));

    v190[3] = 0;
    v180 = 0u;
    v181 = 0u;
    v182 = 0u;
    v183 = 0u;
    v65 = v64;
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v180, v229, 16);
    if (v66)
    {
      v67 = *(_QWORD *)v181;
      do
      {
        for (m = 0; m != v66; m = (char *)m + 1)
        {
          if (*(_QWORD *)v181 != v67)
            objc_enumerationMutation(v65);
          v69 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * (_QWORD)m);
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryReportedAggregation"));
          ((void (*)(_QWORD *, uint64_t, void *, const __CFString *))v45[2])(v45, v69, v70, CFSTR("Reported"));

        }
        v40 = v54;
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v180, v229, 16);
      }
      while (v66);
    }

    v71 = sub_100003384();
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryReportedEventsAggregation"));
      v74 = (const __CFString *)objc_msgSend(v73, "totalCount");
      *(_DWORD *)buf = 134217984;
      v196 = v74;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "**************\nReported signpost event count: %llu", buf, 0xCu);

    }
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryReportedEventsAggregation"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "keysInDescendingCountOrder"));

    v190[3] = 0;
    v176 = 0u;
    v177 = 0u;
    v178 = 0u;
    v179 = 0u;
    v77 = v76;
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v176, v228, 16);
    if (v78)
    {
      v79 = *(_QWORD *)v177;
      do
      {
        for (n = 0; n != v78; n = (char *)n + 1)
        {
          if (*(_QWORD *)v177 != v79)
            objc_enumerationMutation(v77);
          v81 = *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * (_QWORD)n);
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryReportedEventsAggregation"));
          ((void (*)(_QWORD *, uint64_t, void *, const __CFString *))v45[2])(v45, v81, v82, CFSTR("ReportedEvents"));

        }
        v40 = v54;
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v176, v228, 16);
      }
      while (v78);
    }

    v83 = sub_100003384();
    v84 = objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedFailedSCFilterAggregation"));
      v86 = (const __CFString *)objc_msgSend(v85, "totalCount");
      *(_DWORD *)buf = 134217984;
      v196 = v86;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "**************\nSubsystem/category filtered signpost object count: %llu", buf, 0xCu);

    }
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedFailedSCFilterAggregation"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "keysInDescendingCountOrder"));

    v190[3] = 0;
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v89 = v88;
    v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v172, v227, 16);
    if (v90)
    {
      v91 = *(_QWORD *)v173;
      do
      {
        for (ii = 0; ii != v90; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v173 != v91)
            objc_enumerationMutation(v89);
          v93 = *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * (_QWORD)ii);
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedFailedSCFilterAggregation"));
          ((void (*)(_QWORD *, uint64_t, void *, const __CFString *))v45[2])(v45, v93, v94, CFSTR("SubsystemCategoryFiltered"));

        }
        v40 = v54;
        v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v172, v227, 16);
      }
      while (v90);
    }

    v95 = sub_100003384();
    v96 = objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedDurationThresholdAggregation"));
      v98 = (const __CFString *)objc_msgSend(v97, "totalCount");
      *(_DWORD *)buf = 134217984;
      v196 = v98;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "**************\nDuration filtered signpost object count: %llu", buf, 0xCu);

    }
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedDurationThresholdAggregation"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "keysInDescendingCountOrder"));

    v190[3] = 0;
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v101 = v100;
    v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v168, v226, 16);
    if (v102)
    {
      v103 = *(_QWORD *)v169;
      do
      {
        for (jj = 0; jj != v102; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v169 != v103)
            objc_enumerationMutation(v101);
          v105 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)jj);
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedDurationThresholdAggregation"));
          ((void (*)(_QWORD *, uint64_t, void *, const __CFString *))v45[2])(v45, v105, v106, CFSTR("DurationThresholdFiltered"));

        }
        v40 = v54;
        v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v168, v226, 16);
      }
      while (v102);
    }

    v107 = sub_100003384();
    v108 = objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedFailedStringAllowlistAggregation"));
      v110 = (const __CFString *)objc_msgSend(v109, "totalCount");
      *(_DWORD *)buf = 134217984;
      v196 = v110;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "**************\nString allowlist filtered signpost object count: %llu", buf, 0xCu);

    }
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedFailedStringAllowlistAggregation"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "keysInDescendingCountOrder"));

    v190[3] = 0;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v113 = v112;
    v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v164, v225, 16);
    if (v114)
    {
      v115 = *(_QWORD *)v165;
      do
      {
        for (kk = 0; kk != v114; kk = (char *)kk + 1)
        {
          if (*(_QWORD *)v165 != v115)
            objc_enumerationMutation(v113);
          v117 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * (_QWORD)kk);
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedFailedStringAllowlistAggregation"));
          ((void (*)(_QWORD *, uint64_t, void *, const __CFString *))v45[2])(v45, v117, v118, CFSTR("StringWhitelistFiltered"));

        }
        v40 = v54;
        v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v164, v225, 16);
      }
      while (v114);
    }

    v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    *(float *)&v120 = v39;
    v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v120));
    objc_msgSend(v119, "setObject:forKeyedSubscript:", v121, CFSTR("ProcessingDurationInSeconds"));

    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v157));
    objc_msgSend(v119, "setObject:forKeyedSubscript:", v122, CFSTR("LogObjectsProcessed"));

    v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v43, "totalReportedAnimationCount")));
    objc_msgSend(v119, "setObject:forKeyedSubscript:", v123, CFSTR("AnimationsReported"));

    v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v43, "totalReportedIntervalCount")));
    objc_msgSend(v119, "setObject:forKeyedSubscript:", v124, CFSTR("IntervalsReported"));

    v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v43, "totalReportedEventCount")));
    objc_msgSend(v119, "setObject:forKeyedSubscript:", v125, CFSTR("EventsReported"));

    v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v43, "totalUnreportedAnimationCount")));
    objc_msgSend(v119, "setObject:forKeyedSubscript:", v126, CFSTR("AnimationsNotReported"));

    v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v43, "totalUnreportedIntervalCount")));
    objc_msgSend(v119, "setObject:forKeyedSubscript:", v127, CFSTR("IntervalsNotReported"));

    v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v43, "totalUnreportedEventCount")));
    objc_msgSend(v119, "setObject:forKeyedSubscript:", v128, CFSTR("EventsNotReported"));

    v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v156 != 0));
    objc_msgSend(v119, "setObject:forKeyedSubscript:", v129, CFSTR("WasInterrupted"));

    AnalyticsSendEvent(CFSTR("com.apple.performance.signpost_reporting_stats"), v119);
    v130 = sub_100003384();
    v131 = objc_claimAutoreleasedReturnValue(v130);
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      v152 = (const __CFString *)objc_msgSend(v43, "totalReportedEventCount");
      v151 = (const __CFString *)objc_msgSend(v43, "totalUnreportedEventCount");
      v150 = (const __CFString *)objc_msgSend(v43, "totalReportedIntervalCount");
      v149 = COERCE_DOUBLE(objc_msgSend(v43, "totalUnreportedIntervalCount"));
      v148 = objc_msgSend(v43, "totalReportedAnimationCount");
      v147 = objc_msgSend(v43, "totalUnreportedAnimationCount");
      v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedFailedSCFilterAggregation"));
      v146 = objc_msgSend(v153, "totalCount");
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedDurationThresholdAggregation"));
      v133 = objc_msgSend(v132, "totalCount");
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryNotReportedFailedStringAllowlistAggregation"));
      v135 = objc_msgSend(v134, "totalCount");
      v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "telemetryDisabledAggregation"));
      v137 = objc_msgSend(v136, "totalCount");
      *(_DWORD *)buf = 134221570;
      v138 = "";
      v196 = v152;
      v197 = 2048;
      if (v156)
        v138 = " (Interrupted by deferral)";
      v198 = v151;
      v199 = 2048;
      v200 = v150;
      v201 = 2048;
      v202 = v149;
      v203 = 2048;
      v204 = v148;
      v205 = 2048;
      v206 = v147;
      v207 = 2048;
      v208 = v146;
      v209 = 2048;
      v210 = v133;
      v211 = 2048;
      v212 = v135;
      v213 = 2048;
      v214 = v137;
      v215 = 2048;
      v216 = v157;
      v217 = 2048;
      v218 = v39;
      v219 = 2112;
      v220 = v162;
      v221 = 2112;
      v222 = v155;
      v223 = 2080;
      v224 = v138;
      _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "Done processing %llu reported and %llu unreported events, %llu reported and %llu unreported intervals and %llu reported and %llu unreported animations (%llu blocklisted, %llu too short, %llu allowlisted, %llu telemetry not enabled) from %llu log events in %.2fs between %@ and %@%s\n", buf, 0x98u);

      v40 = v54;
    }

    if (qword_100015C60)
    {
      v139 = sub_100003384();
      v140 = objc_claimAutoreleasedReturnValue(v139);
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v196 = (const __CFString *)qword_100015C60;
        v197 = 2048;
        v198 = (const __CFString *)qword_100015C58;
        _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "Throttled %llu times for a total of %llu usec", buf, 0x16u);
      }

    }
    if (v163)
    {
      v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "stallAggregationSnapshot"));
      sub_100002B4C(v141);

    }
    _Block_object_dispose(&v189, 8);
    v44 = v155;
  }

  if (v158)
  if (!v160)

  v142 = sub_100003384();
  v143 = objc_claimAutoreleasedReturnValue(v142);
  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
  {
    v144 = *(float *)(a1 + 104);
    if (byte_100015C28)
      v145 = CFSTR("Enabled");
    else
      v145 = CFSTR("Disabled");
    *(_DWORD *)buf = 138413058;
    v196 = v145;
    v197 = 2112;
    v198 = CFSTR("Enabled");
    v199 = 2112;
    v200 = CFSTR("Enabled");
    v201 = 2048;
    v202 = v144;
    _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "Processing for:\n\tos_signpost CA telemetry: %@\n\tAggregation CA telemetry: %@\n\tCAMetalLayer CA telemetry: %@ took %.2f seconds", buf, 0x2Au);
  }

}

void sub_100008130(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x240], 8);
  _Unwind_Resume(a1);
}

void sub_1000081EC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  char v16;
  id v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  id v25;
  int v26;
  const __CFString *v27;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = (__CFString *)v6;
  if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.performance.signpost_reporter_tasking")) & 1) != 0)
  {
    if (v7)
    {
      v9 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      {
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TaskedOn")));
        if (v10)
        {
          v11 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v12 = -[NSObject BOOLValue](v10, "BOOLValue");
            v13 = sub_100003384();
            v14 = objc_claimAutoreleasedReturnValue(v13);
            v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
            if (v12)
            {
              if (v15)
              {
                LOWORD(v26) = 0;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Reporting based on being tasked-on by CoreAnalytics", (uint8_t *)&v26, 2u);
              }
              v16 = 1;
              goto LABEL_28;
            }
            if (v15)
            {
              v26 = 138412290;
              v27 = CFSTR("TaskedOn");
              v24 = "Not reporting based on not being tasked-on by CoreAnalytics ('%@' is false)";
              goto LABEL_26;
            }
LABEL_27:
            v16 = 0;
LABEL_28:

            goto LABEL_19;
          }
          v25 = sub_100003384();
          v14 = objc_claimAutoreleasedReturnValue(v25);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          v26 = 138412290;
          v27 = CFSTR("TaskedOn");
          v24 = "Not reporting since not tasked-on by CoreAnalytics (Wrong value class for class for %@)";
        }
        else
        {
          v23 = sub_100003384();
          v14 = objc_claimAutoreleasedReturnValue(v23);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          v26 = 138412290;
          v27 = CFSTR("TaskedOn");
          v24 = "Not reporting since is not tasked-on by CoreAnalytics (nil value for %@ key)";
        }
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v26, 0xCu);
        goto LABEL_27;
      }
      v22 = sub_100003384();
      v10 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        v18 = "Not reporting based on not being tasked-on by CoreAnalytics (Non-NSDictionary configuration object)";
        goto LABEL_16;
      }
    }
    else
    {
      v21 = sub_100003384();
      v10 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        v18 = "Not reporting based on not being tasked-on by CoreAnalytics (nil configuration object)";
LABEL_16:
        v19 = v10;
        v20 = 2;
        goto LABEL_17;
      }
    }
  }
  else
  {
    v17 = sub_100003384();
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412290;
      v27 = v8;
      v18 = "Not reporting based on not being tasked-on by CoreAnalytics (unexpected type string: '%@')";
      v19 = v10;
      v20 = 12;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v26, v20);
    }
  }
  v16 = 0;
LABEL_19:

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v16;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000084E8(id a1)
{
  unint64_t v1;
  unint64_t v2;
  id v3;
  NSObject *v4;
  mach_timebase_info info;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  double v9;
  __int16 v10;
  int v11;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&qword_100015C38 = (double)v1 / (double)v2 / 1000.0;
  dword_100015C40 = 1207182336;
  v3 = sub_100003384();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v7 = 0x40FE848000000000;
    v8 = 2048;
    v9 = 125000.0 / *(double *)&qword_100015C38;
    v10 = 1024;
    v11 = 10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%f us, %f mach time units per quantum of %u reported events", buf, 0x1Cu);
  }

  qword_100015C48 = mach_continuous_time();
}

void sub_100008604(id a1)
{
  unint64_t v1;
  unint64_t v2;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&qword_100015C70 = (double)v1 * 0.000000001 / (double)v2;
}

void sub_10000864C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  _BYTE buf[24];
  id v32;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  sub_10000656C();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > 4uLL)
  {
    v24 = sub_100003384();
    v17 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aggregationDictionary"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v7));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v27, "unsignedLongLongValue");
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@:\t%llu (Count not reported)", buf, 0x16u);

    }
  }
  else
  {
    v30[0] = CFSTR("Subsystem");
    v10 = v7;
    v29 = v8;
    v11 = v8;
    v28 = v9;
    v12 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subsystem"));
    *(_QWORD *)buf = v13;
    v30[1] = CFSTR("Category");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "category"));
    *(_QWORD *)&buf[8] = v14;
    v30[2] = CFSTR("Count");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aggregationDictionary"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v10));
    v30[3] = CFSTR("Classification");
    *(_QWORD *)&buf[16] = v16;
    v32 = v12;
    v17 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v30, 4));

    AnalyticsSendEvent(CFSTR("com.apple.performance.signpost_counts"), v17);
    v18 = sub_100003384();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aggregationDictionary"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v10));
      v23 = objc_msgSend(v22, "unsignedLongLongValue");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v23;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@:\t%llu (Count reported to CoreAnalytics)", buf, 0x16u);

    }
    v9 = v28;
    v8 = v29;
  }

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void sub_100008978(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

int64_t sub_100008E24(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

void sub_1000096B0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Nil CA stall aggregation stats", v1, 2u);
}

void sub_1000096F0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)sub_10000319C(a1, a2), "processExecutablePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  sub_10000317C((void *)&_mh_execute_header, v6, v7, "Could not find bundle ID for %@. Skipping");

  sub_100003190();
}

void sub_100009740(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)sub_10000319C(a1, a2), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  sub_10000317C((void *)&_mh_execute_header, v6, v7, "CA Stall Aggregation:\n%@");

  sub_100003190();
}

void sub_100009790(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100003EF4((void *)&_mh_execute_header, a1, a3, "Tried to create a downsample entry with 0 downsample ratio", v3);
  sub_100003F00();
}

void sub_1000097C4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100003EF4((void *)&_mh_execute_header, a1, a3, "Missing required subsystem", v3);
  sub_100003F00();
}

void sub_1000097F8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100003EF4((void *)&_mh_execute_header, a1, a3, "Missing required cap", v3);
  sub_100003F00();
}

void sub_10000982C(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100003EF4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Missing required downsample ratio", a1);
}

void sub_100009860(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004510((void *)&_mh_execute_header, a1, a3, "String1 exempt from allowlisting for AppLaunch instrumentation", a5, a6, a7, a8, 0);
  sub_100003F00();
}

void sub_100009890(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004510((void *)&_mh_execute_header, a1, a3, "String1 exempt from allowlisting for UserInteraction instrumentation", a5, a6, a7, a8, 0);
  sub_100003F00();
}

void sub_1000098C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004510((void *)&_mh_execute_header, a1, a3, "String2 exempt from allowlisting for UserInteraction instrumentation", a5, a6, a7, a8, 0);
  sub_100003F00();
}

void sub_1000098F0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Found bundle ID: \"%@\" for path:\"%@\"", (uint8_t *)&v3, 0x16u);
}

void sub_100009974(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subsystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  sub_100008950();
  sub_100008978((void *)&_mh_execute_header, v5, v6, "%@/%@/%@: Overriding bundle ID on event to %@", v7, v8, v9, v10, v11);

  sub_10000898C();
}

void sub_100009A24(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subsystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  sub_100008950();
  sub_100008978((void *)&_mh_execute_header, v5, v6, "%@/%@/%@: Overriding bundle ID on interval to %@", v7, v8, v9, v10, v11);

  sub_10000898C();
}

void sub_100009AD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004510((void *)&_mh_execute_header, a1, a3, "Could not determine filesystem type", a5, a6, a7, a8, 0);
  sub_100003F00();
}

void sub_100009B04(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Filesystem for '/': %@", (uint8_t *)&v2, 0xCu);
}

void sub_100009B78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004510((void *)&_mh_execute_header, a1, a3, "Cookie file exists but is directory", a5, a6, a7, a8, 0);
  sub_100003F00();
}

void sub_100009BA8(void *a1, os_log_t log)
{
  __CFString *v4;
  int v5;
  __CFString *v6;

  if (a1)
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  else
    v4 = CFSTR("Unknown error");
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not clear cookie file: %@", (uint8_t *)&v5, 0xCu);
  if (a1)

}

void sub_100009C60(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subsystem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "category"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Failed to create payload for %@/%@%@", (uint8_t *)&v7, 0x20u);

}

void sub_100009D3C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Sleeping for %u us", (uint8_t *)v2, 8u);
  sub_100003F00();
}

void sub_100009DAC(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "_coreAnalyticsEventName"));
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Could not generate telemetry payload for %@", a1, 0xCu);

}

id objc_msgSend__coreAnalyticsEventName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_coreAnalyticsEventName");
}

id objc_msgSend__coreAnalyticsEventPayloadDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_coreAnalyticsEventPayloadDictionary");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_init");
}

id objc_msgSend__objectPassesStringFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_objectPassesStringFilter:");
}

id objc_msgSend_accumulatedAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accumulatedAggregation");
}

id objc_msgSend_addAllowlist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAllowlist:");
}

id objc_msgSend_addEntryWithSubsystem_category_name_cap_downsampleRatio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntryWithSubsystem:category:name:cap:downsampleRatio:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_aggregationDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregationDictionary");
}

id objc_msgSend_aggregationSignature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregationSignature");
}

id objc_msgSend_allInspectedSignpostObjectsAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allInspectedSignpostObjectsAggregation");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allWorkflows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allWorkflows");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowListForAllSignposts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowListForAllSignposts");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_beginEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginEvent");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_callbackBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callbackBlock");
}

id objc_msgSend_canGenerateCoreAnalyticsPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canGenerateCoreAnalyticsPayload");
}

id objc_msgSend_cap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cap");
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "category");
}

id objc_msgSend_childTiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childTiers");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_coreAnalyticsEventName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreAnalyticsEventName");
}

id objc_msgSend_coreAnalyticsEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreAnalyticsEvents");
}

id objc_msgSend_coreAnalyticsPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreAnalyticsPayload");
}

id objc_msgSend_coreAnalyticsProcessingMetadataName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreAnalyticsProcessingMetadataName");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_downsampleEntry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downsampleEntry");
}

id objc_msgSend_downsampleEntryForObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downsampleEntryForObject:");
}

id objc_msgSend_downsampleRatio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downsampleRatio");
}

id objc_msgSend_durationMachContinuousTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "durationMachContinuousTime");
}

id objc_msgSend_durationSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "durationSeconds");
}

id objc_msgSend_endEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endEvent");
}

id objc_msgSend_entryForQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryForQuery:");
}

id objc_msgSend_eventsReported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventsReported");
}

id objc_msgSend_eventsSeen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventsSeen");
}

id objc_msgSend_executablePathToStallAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executablePathToStallAggregation");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_filterTreeRoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterTreeRoot");
}

id objc_msgSend_firstFrameGlitchStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstFrameGlitchStats");
}

id objc_msgSend_glitchStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "glitchStats");
}

id objc_msgSend_glitchTimeRatio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "glitchTimeRatio");
}

id objc_msgSend_glitchTimeRatioMsPerS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "glitchTimeRatioMsPerS");
}

id objc_msgSend_handleDeviceReboot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDeviceReboot");
}

id objc_msgSend_handleInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleInterval:");
}

id objc_msgSend_handleSignpost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSignpost:");
}

id objc_msgSend_handleSignpostEmitEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSignpostEmitEvent:");
}

id objc_msgSend_handleSignpostEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSignpostEvent:");
}

id objc_msgSend_handleSignpostInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSignpostInterval:");
}

id objc_msgSend_handleSignpostIntervalBegin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSignpostIntervalBegin:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_incrementSubsystem_category_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incrementSubsystem:category:");
}

id objc_msgSend_incrementTotalForObject_classification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incrementTotalForObject:classification:");
}

id objc_msgSend_initForReadbackWithWorkflow_eventCompletionCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadbackWithWorkflow:eventCompletionCallback:");
}

id objc_msgSend_initWithCallbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCallbackBlock:");
}

id objc_msgSend_initWithCap_downsampleRatio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCap:downsampleRatio:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithDictionaryArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionaryArray:");
}

id objc_msgSend_initWithIncludeRawIntervals_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIncludeRawIntervals:");
}

id objc_msgSend_initWithIncludeTimelines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIncludeTimelines:");
}

id objc_msgSend_initWithSubsystem_category_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubsystem:category:");
}

id objc_msgSend_initWithSubsystem_category_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubsystem:category:name:");
}

id objc_msgSend_initWithWorkflowEventTracker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWorkflowEventTracker:");
}

id objc_msgSend_intervalCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intervalCount");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_keyForChildren_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyForChildren:");
}

id objc_msgSend_keysInDescendingCountOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysInDescendingCountOrder");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringFromDate:dateStyle:timeStyle:");
}

id objc_msgSend_longCommitStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longCommitStats");
}

id objc_msgSend_longHIDLatencyStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longHIDLatencyStats");
}

id objc_msgSend_longResponsibleFrameLifetimeStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longResponsibleFrameLifetimeStats");
}

id objc_msgSend_longTransactionLifetimeStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longTransactionLifetimeStats");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newChildInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newChildInstance");
}

id objc_msgSend_nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_number1Name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "number1Name");
}

id objc_msgSend_number1Value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "number1Value");
}

id objc_msgSend_number2Name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "number2Name");
}

id objc_msgSend_number2Value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "number2Value");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_passesSubsystem_category_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passesSubsystem:category:");
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platform");
}

id objc_msgSend_processDeviceReboot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processDeviceReboot");
}

id objc_msgSend_processEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processEvent:");
}

id objc_msgSend_processExecutablePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processExecutablePath");
}

id objc_msgSend_processImagePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processImagePath");
}

id objc_msgSend_processInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInterval:");
}

id objc_msgSend_processLogArchiveWithPath_startDate_endDate_errorOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processLogArchiveWithPath:startDate:endDate:errorOut:");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_processedEventCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processedEventCount");
}

id objc_msgSend_processingErrors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processingErrors");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_responsibleFirstFrameGlitchStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responsibleFirstFrameGlitchStats");
}

id objc_msgSend_responsibleGlitchStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responsibleGlitchStats");
}

id objc_msgSend_responsibleNonFirstFrameNonSkipGlitchStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responsibleNonFirstFrameNonSkipGlitchStats");
}

id objc_msgSend_responsibleNonFirstFrameNonSkipPerceivedGlitchStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responsibleNonFirstFrameNonSkipPerceivedGlitchStats");
}

id objc_msgSend_scnFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scnFilter");
}

id objc_msgSend_setAnimationIntervalCompletionProcessingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationIntervalCompletionProcessingBlock:");
}

id objc_msgSend_setBeginEventProcessingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBeginEventProcessingBlock:");
}

id objc_msgSend_setBuildSkyLightAnimationCompositeIntervalTimelines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuildSkyLightAnimationCompositeIntervalTimelines:");
}

id objc_msgSend_setCallbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCallbackBlock:");
}

id objc_msgSend_setCap_downsampleRatio_forQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCap:downsampleRatio:forQuery:");
}

id objc_msgSend_setChildTiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChildTiers:");
}

id objc_msgSend_setConfigurationObserverDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurationObserverDelegate:queue:");
}

id objc_msgSend_setDeviceRebootProcessingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceRebootProcessingBlock:");
}

id objc_msgSend_setDownsampleEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownsampleEntry:");
}

id objc_msgSend_setEmitEventProcessingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEmitEventProcessingBlock:");
}

id objc_msgSend_setEventsReported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventsReported:");
}

id objc_msgSend_setEventsSeen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventsSeen:");
}

id objc_msgSend_setIntervalCompletionProcessingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntervalCompletionProcessingBlock:");
}

id objc_msgSend_setMaxDurationSec_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxDurationSec:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setSubsystemCategoryFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubsystemCategoryFilter:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_shouldReportObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldReportObject:");
}

id objc_msgSend_shouldReportSignpostObject_classificationOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldReportSignpostObject:classificationOut:");
}

id objc_msgSend_shouldReportThisTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldReportThisTime");
}

id objc_msgSend_signatureToAccumulatorEntry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureToAccumulatorEntry");
}

id objc_msgSend_signpostInAllowList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signpostInAllowList:");
}

id objc_msgSend_signpostType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signpostType");
}

id objc_msgSend_stallAggregationSnapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stallAggregationSnapshot");
}

id objc_msgSend_startObservingConfigurationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startObservingConfigurationType:");
}

id objc_msgSend_stopProcessing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopProcessing");
}

id objc_msgSend_string1Name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string1Name");
}

id objc_msgSend_string1Value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string1Value");
}

id objc_msgSend_string2Name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string2Name");
}

id objc_msgSend_string2Value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string2Value");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subsystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subsystem");
}

id objc_msgSend_telemetryDisabledAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetryDisabledAggregation");
}

id objc_msgSend_telemetryEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetryEnabled");
}

id objc_msgSend_telemetryNotReportedClassNotSupportedAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetryNotReportedClassNotSupportedAggregation");
}

id objc_msgSend_telemetryNotReportedDurationThresholdAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetryNotReportedDurationThresholdAggregation");
}

id objc_msgSend_telemetryNotReportedFailedSCFilterAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetryNotReportedFailedSCFilterAggregation");
}

id objc_msgSend_telemetryNotReportedFailedStringAllowlistAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetryNotReportedFailedStringAllowlistAggregation");
}

id objc_msgSend_telemetryReportedAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetryReportedAggregation");
}

id objc_msgSend_telemetryReportedEventsAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetryReportedEventsAggregation");
}

id objc_msgSend_totalCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalCount");
}

id objc_msgSend_totalIntervalDurationNs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalIntervalDurationNs");
}

id objc_msgSend_totalReportedAnimationCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalReportedAnimationCount");
}

id objc_msgSend_totalReportedEventCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalReportedEventCount");
}

id objc_msgSend_totalReportedIntervalCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalReportedIntervalCount");
}

id objc_msgSend_totalUnreportedAnimationCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalUnreportedAnimationCount");
}

id objc_msgSend_totalUnreportedEventCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalUnreportedEventCount");
}

id objc_msgSend_totalUnreportedIntervalCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalUnreportedIntervalCount");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_workflow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflow");
}

id objc_msgSend_workflowEventTracker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowEventTracker");
}

id objc_msgSend_workflowWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowWithName:");
}
