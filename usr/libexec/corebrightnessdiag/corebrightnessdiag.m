os_log_t sub_100003564()
{
  os_log_t v0;

  v0 = os_log_create("com.apple.CoreBrightness", "default");
  qword_100008040 = (uint64_t)v0;
  if (!v0)
  {
    v0 = (os_log_t)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100003A6C();
    qword_100008040 = (uint64_t)&_os_log_default;
  }
  return v0;
}

uint64_t sub_1000035C8()
{
  return puts("corebrightnessdiag [nightshift] [sunschedule] [nightshift-internal] [status-info]");
}

void sub_1000035D4(int a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  int v11;

  v5 = a3;
  v6 = dispatch_queue_create("parseArgQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003678;
  block[3] = &unk_100004128;
  v11 = a1;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

intptr_t sub_100003678(uint64_t a1)
{
  const char *v2;
  const char *v3;
  const __CFString *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  const char *v17;
  const __CFString *v18;
  const char *v19;
  const char *v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  id v24;

  if (*(int *)(a1 + 48) >= 2)
  {
    v2 = *(const char **)(*(_QWORD *)(a1 + 40) + 8);
    if (strcmp(v2, "-h"))
    {
      if (strcmp(v2, "--help"))
      {
        v3 = "Night Shift Status";
        v4 = CFSTR("CBBlueReductionStatus");
        v5 = "%s \n";
        v6 = "sunschedule";
        v7 = "Night Shift Sunset/Sunrise";
        v8 = 1;
        while (1)
        {
          v9 = *(const char **)(*(_QWORD *)(a1 + 40) + 8 * v8);
          if (!strcmp(v9, "nightshift"))
          {
            puts(v3);
            v10 = objc_msgSend(*(id *)(a1 + 32), "copyPropertyForKey:", v4);
            v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description")));
            printf(v5, objc_msgSend(v11, "UTF8String"));

          }
          else
          {
            if (strcmp(v9, v6))
            {
              if (strcmp(v9, "nightshift-internal"))
              {
                if (!strcmp(v9, "status-info"))
                {
                  v16 = v5;
                  v17 = v6;
                  v18 = v4;
                  v19 = v3;
                  v20 = v7;
                  v21 = objc_msgSend(*(id *)(a1 + 32), "copyPropertyForKey:", CFSTR("StatusInfo"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/dev/stdout")));
                  v23 = objc_msgSend(v21, "writeToURL:atomically:", v22, 0);

                  if ((v23 & 1) == 0)
                  {
                    puts("Unable to dump a property list.");
                    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "description")));
                    puts((const char *)objc_msgSend(v24, "UTF8String"));

                  }
                  v7 = v20;
                  v3 = v19;
                  v4 = v18;
                  v6 = v17;
                  v5 = v16;
                }
                else
                {
                  printf("Unrecognized identifier %s\n", v9);
                }
                goto LABEL_13;
              }
              puts(v3);
              v12 = objc_msgSend(*(id *)(a1 + 32), "copyPropertyForKey:", v4);
              v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description")));
              printf(v5, objc_msgSend(v13, "UTF8String"));

            }
            puts(v7);
            v14 = objc_msgSend(*(id *)(a1 + 32), "copyPropertyForKey:", CFSTR("BlueLightSunSchedule"));
            v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description")));
            printf(v5, objc_msgSend(v15, "UTF8String"));

          }
LABEL_13:
          if (++v8 >= *(int *)(a1 + 48))
            return dispatch_semaphore_signal((dispatch_semaphore_t)qword_100008058);
        }
      }
    }
  }
  puts("corebrightnessdiag [nightshift] [sunschedule] [nightshift-internal] [status-info]");
  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_100008058);
}

void sub_100003930()
{
  NSLog(CFSTR("SIGINT handler - interrupting runloop."));
  byte_100008048 = 0;
}

uint64_t start(int a1, uint64_t a2)
{
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  unsigned int v11;
  BOOL v12;

  signal(2, (void (__cdecl *)(int))sub_100003930);
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)qword_100008058;
  qword_100008058 = (uint64_t)v4;

  v6 = objc_autoreleasePoolPush();
  v7 = objc_alloc_init((Class)BrightnessSystemClient);
  sub_1000035D4(a1, a2, v7);
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_100008058, 0xFFFFFFFFFFFFFFFFLL);
  do
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v9 = objc_alloc((Class)NSDate);
    v10 = objc_msgSend(v9, "initWithTimeIntervalSinceNow:", *(double *)&qword_100008050);
    v11 = objc_msgSend(v8, "runMode:beforeDate:", NSDefaultRunLoopMode, v10);

    if (v11)
      v12 = byte_100008048 == 0;
    else
      v12 = 1;
  }
  while (!v12);

  objc_autoreleasePoolPop(v6);
  return 0;
}

void sub_100003A6C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create CoreBrightness default log", v0, 2u);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_copyPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPropertyForKey:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_initWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimeIntervalSinceNow:");
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}
