@implementation HTTailspin

+ (void)initialize
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)qword_100060568;
  qword_100060568 = (uint64_t)v2;

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)qword_100060570;
  qword_100060570 = (uint64_t)v4;

}

+ (void)refreshAppGeneratedLogsCount
{
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = sub_100029A10;
  v7 = sub_100029A20;
  v8 = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100029A28;
  v2[3] = &unk_10004EB10;
  v2[4] = &v3;
  objc_msgSend((id)qword_100060568, "enumerateKeysAndObjectsUsingBlock:", v2);
  if (v4[5])
    objc_msgSend((id)qword_100060568, "removeObjectsForKeys:");
  _Block_object_dispose(&v3, 8);

}

+ (void)refreshPerPeriodSentryLogCount
{
  id v2;
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  if (dword_100060564 >= 1)
  {
    --dword_100060564;
    v2 = sub_100024FF4();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109376;
      v4[1] = dword_100060564 + 1;
      v5 = 1024;
      v6 = dword_100060564;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Per-period Sentry Generated Logs count decreased %u -> %u", (uint8_t *)v4, 0xEu);
    }

  }
}

+ (void)resetLogCountsForEPL
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Generated log counts will be reset for EPL", v4, 2u);
  }

  +[HTTailspin resetLogCountsForDailyRollover](HTTailspin, "resetLogCountsForDailyRollover");
  +[HTTailspin resetDailySentryTailspinCounts](HTTailspin, "resetDailySentryTailspinCounts");
  +[HTTailspin resetPerAppCounts](HTTailspin, "resetPerAppCounts");
  +[HTTailspin resetPerPeriodSentryTailspinCounts](HTTailspin, "resetPerPeriodSentryTailspinCounts");
}

+ (void)resetLogCountsForDailyRollover
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Generated log counts will be reset ", v4, 2u);
  }

  +[HTTailspin resetDailyGeneratedLogsCounts](HTTailspin, "resetDailyGeneratedLogsCounts");
  +[HTTailspin resetDailyActivationTailspinCounts](HTTailspin, "resetDailyActivationTailspinCounts");
  +[HTTailspin resetAppActivationTailspinCounts](HTTailspin, "resetAppActivationTailspinCounts");
}

+ (void)resetDailyGeneratedLogsCounts
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  int v12;
  int v13;
  __int16 v14;
  int v15;

  j__ADClientSetValueForScalarKey(CFSTR("com.apple.hangtracer.HTMicroHangLogsGeneratedAtDailyReset"), dword_100060548);
  j__ADClientSetValueForScalarKey(CFSTR("com.apple.hangtracer.HTShortLogsGeneratedAtDailyReset"), dword_10006054C);
  j__ADClientSetValueForScalarKey(CFSTR("com.apple.hangtracer.HTLogsGeneratedAtDailyReset"), dword_100060550);
  j__ADClientSetValueForScalarKey(CFSTR("com.apple.hangtracer.HTLongLogsGeneratedAtDailyReset"), dword_100060550);
  j__ADClientSetValueForScalarKey(CFSTR("com.apple.hangtracer.HTThirdPartyLogsGeneratedAtDailyReset"), dword_100060554);
  j__ADClientSetValueForScalarKey(CFSTR("com.apple.hangtracer.HTFenceLogsGeneratedAtDailyReset"), dword_100060558);
  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v12 = 67109376;
    v13 = dword_100060548;
    v14 = 1024;
    v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Hang Micro Hang Logs Daily Generated count reset from %i to %i", (uint8_t *)&v12, 0xEu);
  }

  v4 = sub_100024FF4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 67109376;
    v13 = dword_10006054C;
    v14 = 1024;
    v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Hang Short Logs Daily Generated count reset from %i to %i", (uint8_t *)&v12, 0xEu);
  }

  v6 = sub_100024FF4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 67109376;
    v13 = dword_100060550;
    v14 = 1024;
    v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Hang Long Logs Daily Generated count reset from %i to %i", (uint8_t *)&v12, 0xEu);
  }

  v8 = sub_100024FF4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12 = 67109376;
    v13 = dword_100060554;
    v14 = 1024;
    v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Hang Third Party Logs Daily Generated count reset from %i to %i", (uint8_t *)&v12, 0xEu);
  }

  v10 = sub_100024FF4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 67109376;
    v13 = dword_100060558;
    v14 = 1024;
    v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fence Hang Logs Daily Generated count reset from %i to %i", (uint8_t *)&v12, 0xEu);
  }

  dword_100060548 = 0;
  dword_10006054C = 0;
  dword_100060550 = 0;
  dword_100060554 = 0;
  dword_100060558 = 0;
}

+ (void)resetAppActivationTailspinCounts
{
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint8_t v6[16];

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "App activation tailspin count reset", v6, 2u);
  }

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)qword_100060570;
  qword_100060570 = (uint64_t)v4;

}

+ (void)resetDailyActivationTailspinCounts
{
  id v2;
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109376;
    v4[1] = dword_10006055C;
    v5 = 1024;
    v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Launch Logs Daily Generated count reset from %i to %i", (uint8_t *)v4, 0xEu);
  }

  dword_10006055C = 0;
}

+ (void)resetDailySentryTailspinCounts
{
  id v2;
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109376;
    v4[1] = dword_100060560;
    v5 = 1024;
    v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Sentry Tailspin count reset from %i to %i", (uint8_t *)v4, 0xEu);
  }

  dword_100060560 = 0;
}

+ (void)resetPerPeriodSentryTailspinCounts
{
  id v2;
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109376;
    v4[1] = dword_100060564;
    v5 = 1024;
    v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Per-period Sentry Tailspin count reset from %i to %i", (uint8_t *)v4, 0xEu);
  }

  dword_100060564 = 0;
}

+ (void)resetPerAppCounts
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Per-app activation and generated tailspin count reset", v4, 2u);
  }

  objc_msgSend((id)qword_100060568, "removeAllObjects");
  objc_msgSend((id)qword_100060570, "removeAllObjects");
}

+ (BOOL)hasAppExceededGeneratedLogsCountForDuration:(double)a3 procName:(id)a4 isFirstPartyApp:(BOOL)a5
{
  id v7;
  void *v8;
  double v9;
  BOOL v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v9 = (double)(unint64_t)objc_msgSend(v8, "runloopLongHangDurationThresholdMSec");

  if (v9 <= a3 && a5)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060568, "objectForKeyedSubscript:", v7));
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "unsignedIntValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v10 = v13 >= objc_msgSend(v14, "runLoopHangPerPeriodLogLimit");

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

+ (BOOL)hasExceededDailyLimit:(double)a3 isFirstPartyApp:(BOOL)a4
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  int v9;
  void *v10;
  signed int v11;
  id v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  int v16;
  void *v17;
  signed int v18;
  id v19;
  int v20;
  void *v21;
  signed int v22;
  id v23;
  int v24;
  void *v25;
  signed int v26;
  id v28;
  int v29;
  unsigned int v30;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v6 = (double)(unint64_t)objc_msgSend(v5, "runloopLongHangDurationThresholdMSec");

    if (v6 <= a3)
    {
      v20 = dword_100060550;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v22 = objc_msgSend(v21, "runLoopLongHangDailyLogLimit");

      if (v20 >= v22)
      {
        v23 = sub_100024FF4();
        v13 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
          v29 = 67109120;
          v30 = objc_msgSend(v14, "runLoopLongHangDailyLogLimit");
          v15 = "Device has hit the Daily Generated Long Log limit of %u. Not saving a report!";
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v8 = (double)(unint64_t)objc_msgSend(v7, "runloopHangDurationThresholdMSec");

      if (v8 <= a3)
      {
        v24 = dword_10006054C;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v26 = objc_msgSend(v25, "runLoopHangDailyLogLimit");

        if (v24 >= v26)
        {
          v28 = sub_100024FF4();
          v13 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
            v29 = 67109120;
            v30 = objc_msgSend(v14, "runLoopHangDailyLogLimit");
            v15 = "Device has hit the Daily Generated Short Log limit of %u. Not saving a report!";
            goto LABEL_17;
          }
          goto LABEL_18;
        }
      }
      else
      {
        v9 = dword_100060548;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v11 = objc_msgSend(v10, "runLoopMicroHangDailyLogLimit");

        if (v9 >= v11)
        {
          v12 = sub_100024FF4();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
            v29 = 67109120;
            v30 = objc_msgSend(v14, "runLoopMicroHangDailyLogLimit");
            v15 = "Device has hit the Daily Generated Micro Log limit of %u. Not saving a report!";
LABEL_17:
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v29, 8u);

            goto LABEL_18;
          }
          goto LABEL_18;
        }
      }
    }
    return 0;
  }
  v16 = dword_100060554;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs", a3));
  v18 = objc_msgSend(v17, "runloopHangThirdPartyDailyLogLimit");

  if (v16 < v18)
    return 0;
  v19 = sub_100024FF4();
  v13 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v29 = 67109120;
    v30 = objc_msgSend(v14, "runloopHangThirdPartyDailyLogLimit");
    v15 = "Device has hit the Daily Generated Third Party Log limit of %u. Not saving a report!";
    goto LABEL_17;
  }
LABEL_18:

  return 1;
}

+ (BOOL)hasExceededDailyFenceLogLimit
{
  int v2;
  void *v3;
  signed int v4;
  id v5;
  NSObject *v6;
  void *v7;
  _DWORD v9[2];

  v2 = dword_100060558;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v4 = objc_msgSend(v3, "fenceHangDailyLogLimit");

  if (v2 >= v4)
  {
    v5 = sub_100024FF4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v9[0] = 67109120;
      v9[1] = objc_msgSend(v7, "fenceHangDailyLogLimit");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device has hit the Daily Generated Fence Log limit of %u. Not saving a report!", (uint8_t *)v9, 8u);

    }
  }
  return v2 >= v4;
}

+ (void)incrementAppGeneratedLogsCountForDuration:(double)a3 procName:(id)a4 isFirstPartyApp:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  double v9;
  NSObject *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  int v22;
  id v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v9 = (double)(unint64_t)objc_msgSend(v8, "runloopLongHangDurationThresholdMSec");

  if (v9 > a3 || !v5)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100060568, "objectForKeyedSubscript:", v7));
    v14 = v11;
    if (v11)
      v12 = -[NSObject unsignedIntValue](v11, "unsignedIntValue");
    else
      v12 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v17 = objc_msgSend(v16, "runLoopHangPerPeriodLogLimit");

    if (v12 >= v17)
    {
      v21 = sub_100024FF4();
      v20 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v22 = 138412802;
        v23 = v7;
        v24 = 1024;
        v25 = v12;
        v26 = 1024;
        v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ Generated Log count: %u -> %u", (uint8_t *)&v22, 0x18u);
      }
    }
    else
    {
      v18 = sub_100024FF4();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v22 = 138412802;
        v23 = v7;
        v24 = 1024;
        v25 = v12;
        v26 = 1024;
        v27 = v12 + 1;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ Generated Log count: %u -> %u", (uint8_t *)&v22, 0x18u);
      }

      v20 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12 + 1));
      objc_msgSend((id)qword_100060568, "setObject:forKeyedSubscript:", v20, v7);
    }

  }
  else
  {
    v13 = sub_100024FF4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ Generated Log count: Long Hang does not count towards per-app generated log count", (uint8_t *)&v22, 0xCu);
    }
  }

}

+ (void)incrementDailyLogGenerationCountForDuration:(double)a3 isFirstPartyApp:(BOOL)a4
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  id v9;
  NSObject *v10;
  const char *v11;
  id v12;
  id v13;
  id v14;
  int v15;
  int v16;
  __int16 v17;
  int v18;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v6 = (double)(unint64_t)objc_msgSend(v5, "runloopLongHangDurationThresholdMSec");

    if (v6 <= a3)
    {
      ++dword_100060550;
      v13 = sub_100024FF4();
      v10 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v15 = 67109376;
        v16 = dword_100060550 - 1;
        v17 = 1024;
        v18 = dword_100060550;
        v11 = "Daily Generated Long Log count: %i -> %i";
        goto LABEL_12;
      }
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v8 = (double)(unint64_t)objc_msgSend(v7, "runloopHangDurationThresholdMSec");

      if (v8 <= a3)
      {
        ++dword_10006054C;
        v14 = sub_100024FF4();
        v10 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v15 = 67109376;
          v16 = dword_10006054C - 1;
          v17 = 1024;
          v18 = dword_10006054C;
          v11 = "Daily Generated Short Log count: %i -> %i";
          goto LABEL_12;
        }
      }
      else
      {
        ++dword_100060548;
        v9 = sub_100024FF4();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v15 = 67109376;
          v16 = dword_100060548 - 1;
          v17 = 1024;
          v18 = dword_100060548;
          v11 = "Daily Generated Micro Hang Log count: %i -> %i";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, 0xEu);
        }
      }
    }
  }
  else
  {
    ++dword_100060554;
    v12 = sub_100024FF4();
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = 67109376;
      v16 = dword_100060554 - 1;
      v17 = 1024;
      v18 = dword_100060554;
      v11 = "Daily Generated Third Party Log count: %i -> %i";
      goto LABEL_12;
    }
  }

}

+ (void)incrementDailyFenceLogGenerationCount
{
  id v2;
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  ++dword_100060558;
  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109376;
    v4[1] = dword_100060558 - 1;
    v5 = 1024;
    v6 = dword_100060558;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Daily Generated Fence Hang Log count: %i -> %i", (uint8_t *)v4, 0xEu);
  }

}

+ (void)notifyHTTailSpinResult:(BOOL)a3 failReason:(int64_t)a4 hangSubType:(int64_t)a5 htBugType:(int64_t)a6
{
  _BOOL8 v9;
  void *v10;
  __CFString *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  _QWORD v20[4];
  __CFString *v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  BOOL v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enablementPrefix"));

  if (!v11)
    v11 = &stru_10004F0D8;
  v12 = sub_100024FF4();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
    v16 = sub_100019D98(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = sub_100019D58(a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138413314;
    v27 = CFSTR("EnablementType");
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v15;
    v32 = 2112;
    v33 = v17;
    v34 = 2112;
    v35 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "com.apple.hangtracer.hang_capture_tailspinV3 %@: %@, capture_success: %@, failure_reason: %@, subtype: %@\n", buf, 0x34u);

  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002B104;
  v20[3] = &unk_10004EB38;
  v25 = v9;
  v21 = v11;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v14 = v11;
  AnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.hang_capture_tailspin_v3"), v20);

}

+ (BOOL)saveSentryTailspin:(id)a3 infoDict:(id)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 error:(id *)a7
{
  id v9;
  __CFString *v10;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  signed int v24;
  int v25;
  void *v26;
  signed int v27;
  id v28;
  NSObject *v29;
  void *v30;
  unsigned int v31;
  const __CFString *v32;
  void *v33;
  id v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  id v40;
  NSObject *v41;
  void *v42;
  unsigned __int8 v43;
  id v44;
  id v45;
  NSObject *v46;
  id v47;
  const __CFString *v48;
  uint64_t v49;
  id v50;
  id v52;
  NSObject *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  char *v58;
  void *v61;
  id v62;
  uint64_t v63;
  uint8_t buf[4];
  const __CFString *v65;
  __int16 v66;
  uint64_t v67;

  v9 = a4;
  v10 = off_10005F800;
  v11 = a3;
  v61 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
  v13 = objc_msgSend(v12, "isEqualToString:", off_10005F808);
  v14 = (void *)qword_100060530;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringFromDate:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@.%@"), v11, v16, CFSTR("tailspin")));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "/var/root/Library/Caches/hangtracerd/tmp"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@"), "/var/root/Library/Caches/hangtracerd/spool", v17));
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@"), "/var/root/Library/Caches/hangtracerd/tmp", v17)));
  v58 = (char *)objc_msgSend(v20, "UTF8String");
  v63 = 11;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  LOBYTE(v11) = objc_msgSend(v21, "htTailspinEnabled");

  if ((v11 & 1) == 0)
  {
    if (!a7)
      goto LABEL_32;
    v48 = CFSTR("Tailspin is not enabled");
    v49 = 1;
LABEL_31:
    v50 = sub_100018F40(v49, (uint64_t)v48);
    LOBYTE(v39) = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue(v50);
    goto LABEL_33;
  }
  if (!sub_100028648())
  {
    if (!a7)
      goto LABEL_32;
    v48 = CFSTR("Tailspin is not present");
    v49 = 2;
    goto LABEL_31;
  }
  v57 = v18;
  v22 = dword_100060560;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v24 = objc_msgSend(v23, "signpostMonitoringDailyLogLimit");

  if (v22 >= v24)
  {
    v18 = v57;
    if (a7)
    {
      v48 = CFSTR("Sentry has hit its daily tailspin limit");
LABEL_30:
      v49 = 4;
      goto LABEL_31;
    }
LABEL_32:
    LOBYTE(v39) = 0;
    goto LABEL_33;
  }
  v25 = dword_100060564;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v27 = objc_msgSend(v26, "signpostMonitoringPerPeriodLogLimit");

  if (v25 >= v27)
  {
    v18 = v57;
    if (a7)
    {
      v48 = CFSTR("Sentry has hit its per-period tailspin limit");
      goto LABEL_30;
    }
    goto LABEL_32;
  }
  v28 = sub_100024FF4();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v31 = objc_msgSend(v30, "shouldCollectOSSignposts");
    v32 = CFSTR("NO");
    if (v31)
      v32 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v65 = v32;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Collecting OS Signposts: %@", buf, 0xCu);

  }
  if (v13)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", off_10005F7E0));
    v13 = objc_msgSend(v33, "intValue");

  }
  v34 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v34, "addObject:", v61);
  v35 = (unint64_t)sub_1000274A0(0x7D0uLL);
  if (v35 >= a5)
    v35 = 0;
  v36 = a5 - v35;
  v37 = v34;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  LOBYTE(v56) = objc_msgSend(v38, "shouldCollectOSSignposts");
  LODWORD(v55) = v13;
  v39 = +[HTTailspin saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:](HTTailspin, "saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:", v17, v57, v37, v36, a6, CFSTR("Sentry"), v55, 3, v56, &v63);

  if (v39)
  {
    ++dword_100060560;
    ++dword_100060564;
    v40 = sub_100024FF4();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v65 = CFSTR("Sentry");
      v66 = 2112;
      v67 = (uint64_t)v19;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%@: Moving tailspin to spool: %@\n", buf, 0x16u);
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v62 = 0;
    v43 = objc_msgSend(v42, "moveItemAtPath:toPath:error:", v20, v19, &v62);
    v44 = v62;

    if ((v43 & 1) == 0)
    {
      v45 = sub_100024FF4();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v65 = CFSTR("Sentry");
        v66 = 2114;
        v67 = (uint64_t)v44;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to move tailspin to final path: %{public}@", buf, 0x16u);
      }

      if (a7)
      {
        v47 = sub_100018F40(3, (uint64_t)CFSTR("Failed to move tailspin to final path"));
        *a7 = (id)objc_claimAutoreleasedReturnValue(v47);
      }
      unlink(v58);
    }
  }
  else
  {
    v52 = sub_100024FF4();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v65 = CFSTR("Sentry");
      v66 = 2048;
      v67 = v63;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to save tailspin data to file, reason: %ld\n", buf, 0x16u);
    }

    unlink(v58);
    if (a7)
    {
      v54 = sub_100018F40(3, (uint64_t)CFSTR("Failed to save tailspin data for Sentry"));
      v44 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue(v54);
    }
    else
    {
      v44 = 0;
    }
  }

  v18 = v57;
LABEL_33:

  return v39;
}

+ (BOOL)saveActivationTailSpinWithType:(id)a3 reason:(id)a4 bundleID:(id)a5 pid:(int)a6 startTime:(unint64_t)a7 endTime:(unint64_t)a8 isThirdPartyDevSupportModeHang:(BOOL)a9
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  id v31;
  const char *v32;
  id v33;
  int v34;
  void *v35;
  signed int v36;
  id v37;
  _BOOL4 v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint8_t buf[4];
  _BYTE v58[10];
  unsigned int v59;
  _QWORD v60[10];
  _QWORD v61[10];

  v11 = *(_QWORD *)&a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  v19 = (unint64_t)(v18 * 1000.0);

  v20 = mach_absolute_time();
  v21 = (unint64_t)sub_1000273EC(v20);
  v22 = sub_1000274A0(a7 - v19 + v21);
  v23 = sub_1000274A0(a8 - v19 + v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  LODWORD(a7) = objc_msgSend(v24, "htTailspinEnabled");

  if (!(_DWORD)a7)
  {
    v31 = sub_100024FF4();
    v26 = objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v58 = v16;
    v32 = "HangTracer tailspin support is disabled, not saving a report for %@ activation!";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);
    goto LABEL_15;
  }
  if (!sub_100028648())
  {
    v33 = sub_100024FF4();
    v26 = objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v58 = v16;
    v32 = "Tried to save tailspin for %@ activation, but tailspin support is not present on this device!";
    goto LABEL_10;
  }
  if (sub_10002ACF4((uint64_t)v16))
  {
    v25 = sub_100024FF4();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v58 = v16;
      *(_WORD *)&v58[8] = 1024;
      v59 = objc_msgSend(v27, "slowAppActivationPerAppMaxLogLimit");
      v28 = "%@ is hit Generated Log limit of %u. Not saving a report!";
      v29 = v26;
      v30 = 18;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v34 = dword_10006055C;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v36 = objc_msgSend(v35, "slowAppActivationDailyLogLimit");

  if (v34 > v36)
  {
    v37 = sub_100024FF4();
    v26 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v58 = objc_msgSend(v27, "slowAppActivationDailyLogLimit");
      v28 = "Device has hit the Daily Generated Log limit of %u. Not saving a report!";
      v29 = v26;
      v30 = 8;
      goto LABEL_14;
    }
LABEL_15:
    LOBYTE(v38) = 0;
    goto LABEL_16;
  }
  v40 = (void *)qword_100060530;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringFromDate:", v41));
  v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@.%@"), v15, v16, v42, CFSTR("tailspin")));

  v60[0] = CFSTR("Reason");
  v60[1] = CFSTR("ServiceName");
  v61[0] = v15;
  v61[1] = v14;
  v61[2] = v16;
  v60[2] = CFSTR("ProcessPath");
  v60[3] = CFSTR("PID");
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
  v61[3] = v55;
  v60[4] = CFSTR("ThreadID");
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", 0));
  v61[4] = v54;
  v60[5] = CFSTR("StartTime");
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (unint64_t)v22));
  v61[5] = v53;
  v60[6] = CFSTR("EndTime");
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (unint64_t)v23));
  v61[6] = v52;
  v60[7] = CFSTR("DisplayData");
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessInfo displayStateArray](HTProcessInfo, "displayStateArray"));
  v61[7] = v43;
  v60[8] = CFSTR("NetworkState");
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[HTNetworkInfo networkStateForTailSpin](HTNetworkInfo, "networkStateForTailSpin"));
  v45 = v44;
  if (!v44)
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v61[8] = v45;
  v60[9] = CFSTR("IsThirdPartyDevSupportModeHang");
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a9));
  v61[9] = v46;
  v47 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 10));

  if (!v44)
  v56 = 11;
  v48 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v48, "addObject:", v47);
  v38 = +[HTTailspin saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:](HTTailspin, "saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:", v26, v48, (unint64_t)v22, (unint64_t)v23, v16, v11, 2, &v56);
  v49 = (void *)v47;
  if (v38)
  {
    ++dword_10006055C;
    v50 = sub_100024FF4();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v58 = dword_10006055C - 1;
      *(_WORD *)&v58[4] = 1024;
      *(_DWORD *)&v58[6] = dword_10006055C;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Daily Generated Launch Log count: %u -> %u", buf, 0xEu);
    }

    sub_10002AD70(v16);
  }

LABEL_16:
  return v38;
}

+ (BOOL)saveTailSpinForService:(id)a3 reason:(id)a4 processID:(int)a5 threadID:(unint64_t)a6 procName:(id)a7 procPath:(id)a8 startTime:(unint64_t)a9 endTime:(unint64_t)a10 blownFenceId:(unint64_t)a11 hangType:(int64_t)a12 userActionData:(id)a13 displayedInHUD:(BOOL)a14 isThirdPartyDevSupportModeHang:(BOOL)a15 failReason:(int64_t *)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  BOOL v47;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __CFString *v62;
  _QWORD v63[15];
  _QWORD v64[15];

  v20 = a3;
  v21 = a4;
  v22 = a7;
  v23 = a8;
  v24 = a13;
  v25 = (void *)qword_100060530;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringFromDate:", v26));
  v56 = v22;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@.%@"), v20, v22, v27, CFSTR("tailspin")));

  v52 = sub_100019E54(v20);
  v28 = objc_alloc_init((Class)NSUUID);
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v54 = v24;
  if (v24)
  {
    v30 = objc_alloc((Class)NSString);
    v31 = objc_retainAutorelease(v24);
    v32 = objc_msgSend(v30, "initWithBytesNoCopy:length:encoding:freeWhenDone:", objc_msgSend(v31, "bytes"), objc_msgSend(v31, "length"), 4, 0);

    v29 = v32;
  }
  if (!v29)
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v59 = v29;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "enablementPrefix"));

  v62 = (__CFString *)v34;
  if (!v34)
    v62 = &stru_10004F0D8;
  v63[0] = CFSTR("Reason");
  v63[1] = CFSTR("ServiceName");
  v57 = v21;
  v58 = v20;
  v64[0] = v21;
  v64[1] = v20;
  v55 = v23;
  v64[2] = v23;
  v63[2] = CFSTR("ProcessPath");
  v63[3] = CFSTR("PID");
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a5));
  v64[3] = v51;
  v63[4] = CFSTR("ThreadID");
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a6));
  v64[4] = v50;
  v63[5] = CFSTR("StartTime");
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a9));
  v64[5] = v49;
  v63[6] = CFSTR("EndTime");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a10));
  v64[6] = v35;
  v63[7] = CFSTR("HangType");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a12));
  v64[7] = v36;
  v63[8] = CFSTR("DisplayData");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessInfo displayStateArray](HTProcessInfo, "displayStateArray"));
  v64[8] = v37;
  v63[9] = CFSTR("NetworkState");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[HTNetworkInfo networkStateForTailSpin](HTNetworkInfo, "networkStateForTailSpin"));
  v39 = v38;
  if (!v38)
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v64[9] = v39;
  v64[10] = v60;
  v63[10] = CFSTR("HangUUID");
  v63[11] = CFSTR("UserAction");
  v64[11] = v59;
  v64[12] = v62;
  v63[12] = CFSTR("EnablementType");
  v63[13] = CFSTR("DisplayedInHUD");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a14));
  v64[13] = v40;
  v63[14] = CFSTR("IsThirdPartyDevSupportModeHang");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a15));
  v64[14] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 15));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v42));

  if (!v38)
  if (v52 == 1)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessInfo recentAppsDict](HTProcessInfo, "recentAppsDict"));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, CFSTR("RecentAppsDict"));

  }
  if (a12 == 5)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a11));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v45, CFSTR("CAFenceId"));

  }
  v46 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v46, "addObject:", v43);
  v47 = +[HTTailspin saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:](HTTailspin, "saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:", v53, v46, a9, a10, v56, a5, v52, a16);

  return v47;
}

+ (void)collectTailspinAndUpdateTelemtry
{
  unint64_t v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  _BOOL8 v6;
  NSObject *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _BOOL8 v14;
  id v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  int v21;
  int v22;
  double v23;
  uint64_t v24;
  id v25;
  int v26;
  unint64_t v27;

  v2 = +[HTHangInfo numberOfHangs](HTHangInfo, "numberOfHangs");
  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v5)
    {
      v26 = 134217984;
      v27 = +[HTHangInfo numberOfHangs](HTHangInfo, "numberOfHangs");
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Collecting tailspin for a sequence of %lu hang(s)\n", (uint8_t *)&v26, 0xCu);
    }

    v6 = +[HTTailspin saveTailspinForAllHangs](HTTailspin, "saveTailspinForAllHangs");
    v7 = objc_claimAutoreleasedReturnValue(+[HTHangInfo firstHang](HTHangInfo, "firstHang"));
    v4 = v7;
    if (v7)
    {
      v8 = sub_100019D88((uint64_t)-[NSObject hangSubType](v7, "hangSubType"));
      v9 = v8;
      if (v6)
      {
        if (v8)
        {
          +[HTTailspin incrementDailyFenceLogGenerationCount](HTTailspin, "incrementDailyFenceLogGenerationCount");
          +[HTHangInfo cleanupAllHangs](HTHangInfo, "cleanupAllHangs");
LABEL_14:
          v12 = -[NSObject failReason](v4, "failReason");
          v13 = -[NSObject hangSubType](v4, "hangSubType");
          v14 = v6;
          v15 = v12;
          v16 = 0;
LABEL_17:
          +[HTTailspin notifyHTTailSpinResult:failReason:hangSubType:htBugType:](HTTailspin, "notifyHTTailSpinResult:failReason:hangSubType:htBugType:", v14, v15, v13, v16);
          goto LABEL_18;
        }
        -[NSObject hangDurationMS](v4, "hangDurationMS");
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject processName](v4, "processName"));
        +[HTTailspin incrementAppGeneratedLogsCountForDuration:procName:isFirstPartyApp:](HTTailspin, "incrementAppGeneratedLogsCountForDuration:procName:isFirstPartyApp:", v19, -[NSObject isFirstPartyApp](v4, "isFirstPartyApp"), v18);

        -[NSObject hangDurationMS](v4, "hangDurationMS");
        +[HTTailspin incrementDailyLogGenerationCountForDuration:isFirstPartyApp:](HTTailspin, "incrementDailyLogGenerationCountForDuration:isFirstPartyApp:", -[NSObject isFirstPartyApp](v4, "isFirstPartyApp"), v20);
        +[HTHangInfo cleanupAllHangs](HTHangInfo, "cleanupAllHangs");
      }
      else
      {
        +[HTHangInfo cleanupAllHangs](HTHangInfo, "cleanupAllHangs");
        if (v9)
          goto LABEL_14;
      }
      v21 = -[NSObject isFirstPartyApp](v4, "isFirstPartyApp");
      v22 = -[NSObject isThirdPartyDevSupportModeHang](v4, "isThirdPartyDevSupportModeHang");
      -[NSObject hangDurationMS](v4, "hangDurationMS");
      v24 = sub_100019DBC(v21, v22, v23);
      v25 = -[NSObject failReason](v4, "failReason");
      v13 = -[NSObject hangSubType](v4, "hangSubType");
      v14 = v6;
      v15 = v25;
      v16 = v24;
      goto LABEL_17;
    }
    v10 = sub_100024FF4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No hangs found to update telemetry\n", (uint8_t *)&v26, 2u);
    }

  }
  else if (v5)
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "collectTailspinAndUpdateTelemtry: No hangs found, not collecting tailspin\n", (uint8_t *)&v26, 2u);
  }
LABEL_18:

}

+ (BOOL)saveTailspinForAllHangs
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned int v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[128];
  _BYTE v40[128];

  if (!+[HTHangInfo numberOfHangs](HTHangInfo, "numberOfHangs"))
    return 0;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[HTHangInfo firstHang](HTHangInfo, "firstHang"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "processName"));
  v28 = objc_msgSend(v2, "pid");
  v38 = 11;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serviceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "processName"));
  v5 = (void *)qword_100060530;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@.%@"), v3, v4, v7, CFSTR("tailspin")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serviceName"));
  v10 = sub_100019E54(v9);

  v11 = objc_alloc_init((Class)NSMutableArray);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[HTHangInfo allHangs](HTHangInfo, "allHangs"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "infoDict"));
        objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v14);
  }

  v18 = +[HTHangInfo hangSequenceStartTime](HTHangInfo, "hangSequenceStartTime");
  v19 = (unint64_t)sub_1000274A0(0x7D0uLL);
  if (v18 <= v19)
    v19 = 0;
  v20 = +[HTTailspin saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:](HTTailspin, "saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:", v8, v11, v18 - v19, +[HTHangInfo hangSequenceEndTime](HTHangInfo, "hangSequenceEndTime"), v29, v28, v10, &v38);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTHangInfo allHangs](HTHangInfo, "allHangs"));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      v25 = 0;
      v26 = v2;
      do
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        v2 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v25);

        objc_msgSend(v2, "setFailReason:", v38);
        v25 = (char *)v25 + 1;
        v26 = v2;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v23);
  }

  return v20;
}

+ (BOOL)saveTailSpinWithFileName:(id)a3 infoDictArray:(id)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 processString:(id)a7 pid:(int)a8 requestType:(int64_t)a9 failReason:(int64_t *)a10
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  _BOOL4 v20;
  const char *v21;
  id v22;
  NSObject *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  id v27;
  NSObject *v28;
  uint64_t v30;
  uint64_t v31;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "/var/root/Library/Caches/hangtracerd/tmp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@"), "/var/root/Library/Caches/hangtracerd/spool", v14));
  v17 = v12;
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@"), "/var/root/Library/Caches/hangtracerd/tmp", v14)));
  v19 = (const char *)objc_msgSend(v18, "UTF8String");
  LOBYTE(v31) = 0;
  LODWORD(v30) = a8;
  v20 = +[HTTailspin saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:](HTTailspin, "saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:", v14, v15, v13, a5, a6, v12, v30, a9, v31, a10);

  if (v20)
  {
    v21 = v19;
    v22 = sub_100024FF4();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v17;
      v38 = 2114;
      v39 = v16;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Moving tailspin to spool: %{public}@\n", buf, 0x16u);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v35 = 0;
    v25 = objc_msgSend(v24, "moveItemAtPath:toPath:error:", v18, v16, &v35);
    v26 = v35;

    if ((v25 & 1) == 0)
    {
      v27 = sub_100024FF4();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v37 = v17;
        v38 = 2114;
        v39 = v26;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to move tailspin to final path: %{public}@", buf, 0x16u);
      }

      *a10 = 13;
      unlink(v21);
    }
  }
  else
  {
    unlink(v19);
    v26 = 0;
  }

  return v20;
}

+ (BOOL)saveTailspinForForceQuitProcessID:(int)a3 procName:(id)a4 procPath:(id)a5 filePath:(id *)a6
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  _QWORD v42[4];
  _QWORD v43[4];

  v7 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)qword_100060530;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromDate:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ForceQuit-%@-%@.%@"), v8, v12, CFSTR("tailspin")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ForceQuit/"), v13));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v42[0] = CFSTR("Reason");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ForceQuit-%@"), v8));
  v43[0] = v15;
  v43[1] = v9;
  v32 = v9;
  v42[1] = CFSTR("ProcessPath");
  v42[2] = CFSTR("PID");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
  v43[2] = v16;
  v42[3] = CFSTR("NetworkState");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[HTNetworkInfo networkStateForTailSpin](HTNetworkInfo, "networkStateForTailSpin"));
  v18 = v17;
  if (!v17)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v43[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 4));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v19));

  if (!v17)
  v21 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v21, "addObject:", v20);
  v22 = objc_retainAutorelease(v14);
  *a6 = v22;
  v35 = 11;
  LOBYTE(v30) = 1;
  LODWORD(v29) = v7;
  if (!+[HTTailspin saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:](HTTailspin, "saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:", v13, CFSTR("/var/root/Library/Caches/hangtracerd/tmp"), v21, 0, 0, v8, v29, 4, v30, &v35))goto LABEL_10;
  v23 = 1;
  sub_100018FB8(CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ForceQuit/"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@"), "/var/root/Library/Caches/hangtracerd/tmp", v13));
  v34 = 0;
  objc_msgSend(v33, "moveItemAtPath:toPath:error:", v24, v22, &v34);
  v25 = v34;

  if (v25)
  {
    *a6 = 0;
    v26 = sub_100024FF4();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v37 = "/var/root/Library/Caches/hangtracerd/tmp";
      v38 = 2112;
      v39 = v13;
      v40 = 2112;
      v41 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "failed to move %s/%@: %@", buf, 0x20u);
    }

LABEL_10:
    v23 = 0;
    *a6 = 0;
  }

  return v23;
}

+ (BOOL)saveTailspinWithFileName:(id)a3 path:(id)a4 infoDictArray:(id)a5 startTime:(unint64_t)a6 endTime:(unint64_t)a7 processString:(id)a8 pid:(int)a9 requestType:(int64_t)a10 includeOSSignposts:(BOOL)a11 failReason:(int64_t *)a12
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  int *v29;
  char *v30;
  BOOL v31;
  id v32;
  NSObject *v33;
  double v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned int v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *i;
  void *v49;
  void *v50;
  unsigned __int8 v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  id v58;
  NSObject *v59;
  float v60;
  id v61;
  NSObject *v62;
  double v63;
  double v64;
  void *v65;
  id v66;
  NSObject *v67;
  id v69;
  id v70;
  unsigned int v71;
  uint64_t v72;
  id v73;
  double v76;
  void *v77;
  _QWORD v78[7];
  float v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  _BYTE v88[10];
  double v89;
  __int16 v90;
  double v91;
  __int16 v92;
  double v93;
  _BYTE v94[128];

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), a4, v15));
  v19 = sub_100024FF4();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v86 = (uint64_t)v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Attempting to save tailspin at %@", buf, 0xCu);
  }

  v21 = objc_retainAutorelease(v18);
  v22 = (const char *)objc_msgSend(v21, "cStringUsingEncoding:", 4);
  v23 = open_dprotected_np(v22, 514, 4, 0, 420);
  v24 = sub_100024FF4();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if ((v23 & 0x80000000) == 0)
  {
    if (v26)
    {
      *(_DWORD *)buf = 138412546;
      v86 = (uint64_t)v21;
      v87 = 1024;
      *(_DWORD *)v88 = v23;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Will request tailspin at: %@, fd: %i", buf, 0x12u);
    }

    v84 = 0;
    v27 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v16, 0, &v84));
    v76 = COERCE_DOUBLE(v84);
    v77 = (void *)v27;
    if (!v27)
    {
      v32 = sub_100024FF4();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      v34 = v76;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v86 = (uint64_t)v17;
        v87 = 2114;
        *(_QWORD *)v88 = v16;
        *(_WORD *)&v88[8] = 2114;
        v89 = v76;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to serialize Info Dict into JSON: %{public}@ - %{public}@\n", buf, 0x20u);
      }

      unlink(v22);
      close(v23);
      v31 = 0;
      *a12 = 7;
      goto LABEL_52;
    }
    v73 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v27, 4);
    if (v73)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v72 = (uint64_t)v17;
      if ((objc_msgSend(v28, "isInternal") & 1) != 0)
      {
        v71 = 0;
      }
      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v71 = objc_msgSend(v37, "shouldUploadToDiagPipe");

      }
      v70 = v15;

      v38 = sub_100024FF4();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v41 = objc_msgSend(v40, "isInternal") ^ 1;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v43 = objc_msgSend(v42, "shouldUploadToDiagPipe");
        *(_DWORD *)buf = 138544130;
        v86 = v72;
        v87 = 1024;
        *(_DWORD *)v88 = v71;
        *(_WORD *)&v88[4] = 1024;
        *(_DWORD *)&v88[6] = v41;
        LOWORD(v89) = 1024;
        *(_DWORD *)((char *)&v89 + 2) = v43;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%{public}@: Tailspin filepaths will be scrubbed: %{BOOL}d (Customer build: %{BOOL}d, DiagnosticPipeline upload enabled: %{BOOL}d)", buf, 0x1Eu);

      }
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v44 = v16;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
      if (v45)
      {
        v46 = v45;
        v69 = v21;
        v47 = *(_QWORD *)v81;
        while (2)
        {
          for (i = 0; i != v46; i = (char *)i + 1)
          {
            if (*(_QWORD *)v81 != v47)
              objc_enumerationMutation(v44);
            v49 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("isFirstPartyApp")));
            v51 = objc_msgSend(v50, "BOOLValue");

            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("IsThirdPartyDevSupportModeHang")));
            v53 = objc_msgSend(v52, "BOOLValue");

            if ((v51 & 1) != 0 || !v53)
            {
              v55 = sub_100024FF4();
              v56 = objc_claimAutoreleasedReturnValue(v55);
              v17 = (id)v72;
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                sub_10002F414(v72, v56);

              v54 = 1;
              v15 = v70;
              goto LABEL_35;
            }
          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
          if (v46)
            continue;
          break;
        }
        v54 = 0;
        v15 = v70;
        v17 = (id)v72;
LABEL_35:
        v21 = v69;
      }
      else
      {
        v54 = 0;
        v17 = (id)v72;
      }

      v57 = mach_absolute_time();
      if (!a7 || qword_100060528 <= a7)
      {
        sub_10000DAB4(a10, a6, a7, v57, 0);
        qword_100060528 = v57;
        v65 = v73;
        if ((sub_100028690(v23, a6, a7, (uint64_t)v73, a9, a11, v54, v71) & 1) != 0)
        {
          *a12 = 0;
          v31 = 1;
        }
        else
        {
          v66 = sub_100024FF4();
          v67 = objc_claimAutoreleasedReturnValue(v66);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "libtailspin: tailspin_dump_output_with_options_sync() failed to dump tailspin", buf, 2u);
          }

          v31 = 0;
          *a12 = 12;
        }
        v34 = v76;
        goto LABEL_51;
      }
      v58 = sub_100024FF4();
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v86 = (uint64_t)v17;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}@: Tailspin Request Denied because tailspin-buffer has been dumped since this hang ended -> it won't have any trace data for this hang\n", buf, 0xCu);
      }

      v60 = sub_1000273EC(qword_100060528 - a7);
      v61 = sub_100024FF4();
      v62 = objc_claimAutoreleasedReturnValue(v61);
      v34 = v76;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = sub_100027440(v57 - a7);
        v64 = sub_100027440(v57 - qword_100060528);
        *(_DWORD *)buf = 138544386;
        v86 = (uint64_t)v15;
        v87 = 2114;
        *(_QWORD *)v88 = v17;
        *(_WORD *)&v88[8] = 2048;
        v89 = (float)(v60 / 1000.0);
        v90 = 2048;
        v91 = v63;
        v92 = 2048;
        v93 = v64;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Tailspin Request Denied: tailspin-buffer will not contain relevant trace data for the time-range of this request due to recent tailspin-capture\n               Filename: %{public}@, Process: %{public}@, Time Between Recent Tailspin Capture and Hang EndTime: %f secs, Hang EndTime: %f secs ago, Recent Tailspin Capture: %f secs ago\n", buf, 0x34u);
      }

      *a12 = 9;
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_10002D7F8;
      v78[3] = &unk_10004EB58;
      v79 = v60;
      v78[4] = a10;
      v78[5] = v57;
      v78[6] = a7;
      AnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.tailspins.denied_request"), v78);
      sub_10000DAB4(a10, a6, a7, v57, 1);
      v31 = 0;
    }
    else
    {
      v35 = sub_100024FF4();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v86 = (uint64_t)v17;
        v87 = 2114;
        *(_QWORD *)v88 = v16;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to create UTF8 string from JSON: %{public}@\n", buf, 0x16u);
      }

      *a12 = 8;
      unlink(v22);
      v31 = 0;
      v34 = v76;
    }
    v65 = v73;
LABEL_51:
    close(v23);

LABEL_52:
    goto LABEL_53;
  }
  if (v26)
  {
    v29 = __error();
    *(double *)&v30 = COERCE_DOUBLE(strerror(*v29));
    *(_DWORD *)buf = 138543874;
    v86 = (uint64_t)v17;
    v87 = 2114;
    *(_QWORD *)v88 = v21;
    *(_WORD *)&v88[8] = 2080;
    v89 = *(double *)&v30;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not create file - won't take a tailspin: %{public}@ %s", buf, 0x20u);
  }

  v31 = 0;
  *a12 = 10;
LABEL_53:

  return v31;
}

@end
