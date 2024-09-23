void start()
{
  id v0;
  NSObject *v1;
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  NSObject *v4;
  _xpc_connection_s *mach_service;
  uint8_t v6[16];

  v0 = sub_100003368();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Starting up", v6, 2u);
  }

  global_queue = dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v3);

  dispatch_source_set_event_handler(v4, &stru_100004278);
  dispatch_resume(v4);
  xpc_track_activity();
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.assertion_agent", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000042B8);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

void sub_1000024E0(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_100003368();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Got SIGTERM, exiting now.", v3, 2u);
  }

  exit(0);
}

void sub_10000253C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  char *v3;
  char *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  _xpc_connection_s *v8;
  _xpc_connection_s *v9;
  _QWORD handler[4];
  _xpc_connection_s *v11;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    v8 = v2;
    xpc_connection_set_target_queue(v8, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100002630;
    handler[3] = &unk_1000042E0;
    v11 = v8;
    v9 = v8;
    xpc_connection_set_event_handler(v9, handler);
    xpc_connection_resume(v9);

  }
  else
  {
    v3 = xpc_copy_description(v2);
    if (v3)
    {
      v4 = v3;
      v5 = sub_100003368();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        sub_1000034F4((uint64_t)v4, v6, v7);

      free(v4);
    }
  }

}

void sub_100002630(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __int32_t v6;
  __int32_t v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  __CFDictionary *v13;
  __CFDictionary *Mutable;
  __int32_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  const void *v20;
  uint64_t v21;
  CFTypeID v22;
  uint64_t v23;
  __int32_t v24;
  CFTypeID v25;
  const void *v26;
  const void *v27;
  CFTypeID v28;
  const void *v29;
  const void *v30;
  CFTypeID v31;
  id v32;
  NSObject *v33;
  const __CFString *v34;
  const __CFString *v35;
  CFTypeID v36;
  const __CFString *v37;
  const __CFString *v38;
  CFTypeID v39;
  CFTypeID v40;
  IOReturn v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  id v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  const void *v50;
  id v51;
  const void *v52;
  id v53;
  NSObject *v54;
  const char *v55;
  const char *v56;
  uint8_t *p_buf;
  NSObject *v58;
  uint32_t v59;
  id v60;
  NSObject *v61;
  const char *v62;
  const char *v63;
  uint8_t *v64;
  id v65;
  const char *v66;
  id v67;
  NSObject *v68;
  uint32_t v69;
  id v70;
  const char *v71;
  id v72;
  const char *v73;
  id v74;
  id v75;
  CFMutableDictionaryRef v76;
  CFMutableDictionaryRef v77;
  int v78;
  int v79;
  id v80;
  NSObject *v81;
  int socket;
  int v83;
  int v84;
  int v85;
  id v86;
  int *v87;
  char *v88;
  id v89;
  uint64_t v90;
  id v91;
  NSObject *v92;
  id v93;
  id v94;
  int v95;
  uint64_t v96;
  const __CFString *v97;
  CFDictionaryRef theDict;
  uint64_t v99;
  void *value;
  timeval v101;
  fd_set v102;
  CFTimeInterval valuePtr;
  IOPMAssertionID AssertionID;
  CFTypeRef cf;
  char v106[10];
  uint8_t v107[4];
  _BYTE v108[10];
  const char *v109;
  __int16 v110;
  const __CFString *v111;
  __int16 v112;
  uint64_t v113;
  fd_set buf;

  v3 = a2;
  if (v3 == &_xpc_error_connection_invalid)
    goto LABEL_59;
  v4 = (void *)os_transaction_create("com.apple.mobile.assertion_agent");
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  v5 = objc_autoreleasePoolPush();
  v99 = 0;
  value = 0;
  theDict = 0;
  v6 = lockdown_copy_checkin_info(v3, &value);
  if (!v6)
  {
    Mutable = CFDictionaryCreateMutable(0, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
      v45 = sub_100003368();
      v9 = objc_claimAutoreleasedReturnValue(v45);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
      LOWORD(buf.fds_bits[0]) = 0;
      v10 = "Could not create dictionary.";
      v11 = v9;
      v12 = 2;
      goto LABEL_5;
    }
    v13 = Mutable;
    CFDictionaryAddValue(Mutable, kLockdownCheckinConnectionInfoKey, value);
    v15 = secure_lockdown_checkin(&v99, v13, &theDict);
    if (theDict)
    {
      v16 = v99;
      v17 = sub_100003368();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v19 = v18;
      if (!v15 && v16)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          sub_10000360C(&theDict, v19);

        v20 = CFDictionaryGetValue(theDict, kLockdownCheckinClientNameKey);
        if (v20)
        {
          v21 = (uint64_t)v20;
          v22 = CFGetTypeID(v20);
          if (v22 == CFStringGetTypeID())
          {
            v23 = v99;
            cf = 0;
            AssertionID = 0;
            v24 = lockdown_receive_message(v99, &cf);
            if (v24 || !cf || (v25 = CFGetTypeID(cf), v25 != CFDictionaryGetTypeID()))
            {
              v53 = sub_100003368();
              v54 = objc_claimAutoreleasedReturnValue(v53);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                v55 = "Object was the wrong type";
                if (!cf)
                  v55 = "Object was NULL";
                buf.fds_bits[0] = 67109378;
                buf.fds_bits[1] = v24;
                LOWORD(buf.fds_bits[2]) = 2080;
                *(_QWORD *)((char *)&buf.fds_bits[2] + 2) = v55;
                v56 = "lockdown_receive_message() failed: %d (%s).";
                p_buf = (uint8_t *)&buf;
                v58 = v54;
                v59 = 18;
                goto LABEL_64;
              }
LABEL_65:

LABEL_91:
              if (AssertionID)
                IOPMAssertionRelease(AssertionID);
              if (cf)
                CFRelease(cf);
              goto LABEL_50;
            }
            v26 = CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("CommandKey"));
            v27 = v26;
            if (!v26 || (v28 = CFGetTypeID(v26), v28 != CFStringGetTypeID()))
            {
              sub_1000033D8(v23, CFSTR("InvalidRequest"));
              v60 = sub_100003368();
              v61 = objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                v62 = "Object was the wrong type";
                if (!v27)
                  v62 = "Object was NULL";
                buf.fds_bits[0] = 138412546;
                *(_QWORD *)&buf.fds_bits[1] = v21;
                LOWORD(buf.fds_bits[3]) = 2080;
                *(_QWORD *)((char *)&buf.fds_bits[3] + 2) = v62;
                v63 = "Incoming message from %@ is missing command. (%s)";
                v64 = (uint8_t *)&buf;
                goto LABEL_88;
              }
              goto LABEL_90;
            }
            if (CFEqual(v27, CFSTR("CommandCreateAssertion")))
            {
              valuePtr = 0.0;
              v101.tv_sec = 0;
              *(_QWORD *)&v101.tv_usec = 0;
              memset(&buf, 0, sizeof(buf));
              memset(&v102, 0, sizeof(v102));
              v29 = CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("AssertionTypeKey"));
              v30 = v29;
              if (v29 && (v31 = CFGetTypeID(v29), v31 == CFStringGetTypeID()))
              {
                if (!CFEqual(v30, CFSTR("AMDPowerAssertionTypeWirelessSync")))
                {
                  if (!CFEqual(v30, CFSTR("PreventUserIdleSystemSleep")) && !CFEqual(v30, CFSTR("PreventSystemSleep")))
                  {
                    sub_1000033D8(v23, CFSTR("InvalidRequest"));
                    v75 = sub_100003368();
                    v61 = objc_claimAutoreleasedReturnValue(v75);
                    if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_90;
                    *(_DWORD *)v107 = 138412290;
                    *(_QWORD *)v108 = v21;
                    v63 = "ASSERTION_TYPE_KEY from %@ is not one of the recognized types.";
                    goto LABEL_97;
                  }
                  v32 = sub_100003368();
                  v33 = objc_claimAutoreleasedReturnValue(v32);
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v107 = 138412802;
                    *(_QWORD *)v108 = v21;
                    *(_WORD *)&v108[8] = 2112;
                    v109 = (const char *)v30;
                    v110 = 2112;
                    v111 = CFSTR("PreventUserIdleSystemSleep");
                    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Workaround 11510010 for %@, ignoring %@ forcing %@.", v107, 0x20u);
                  }

                }
                v34 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("AssertionNameKey"));
                v35 = v34;
                if (v34 && (v36 = CFGetTypeID(v34), v36 == CFStringGetTypeID()))
                {
                  v37 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("AssertionDetailKey"));
                  v38 = v37;
                  if (v37 && (v39 = CFGetTypeID(v37), v39 != CFStringGetTypeID()))
                  {
                    sub_1000033D8(v23, CFSTR("InvalidRequest"));
                    v74 = sub_100003368();
                    v61 = objc_claimAutoreleasedReturnValue(v74);
                    if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_90;
                    *(_DWORD *)v107 = 138412546;
                    *(_QWORD *)v108 = v21;
                    *(_WORD *)&v108[8] = 2080;
                    v109 = "Object was the wrong type";
                    v63 = "ASSERTION_DETAILS_KEY from %@ is invalid (%s).";
                  }
                  else
                  {
                    v97 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("AssertionTimeoutKey"));
                    if (v97)
                    {
                      v40 = CFGetTypeID(v97);
                      if (v40 == CFNumberGetTypeID())
                      {
                        if (CFNumberGetValue((CFNumberRef)v97, kCFNumberDoubleType, &valuePtr))
                        {
                          v41 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), v35, v38, 0, 0, valuePtr, CFSTR("TimeoutActionTurnOff"), &AssertionID);
                          v42 = sub_100003368();
                          v43 = objc_claimAutoreleasedReturnValue(v42);
                          v44 = v43;
                          if (v41)
                          {
                            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)v107 = 138412546;
                              *(_QWORD *)v108 = v21;
                              *(_WORD *)&v108[8] = 1024;
                              LODWORD(v109) = v41;
                              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "IOPMAssertionCreateWithDescription() for %@ failed: 0x%x.", v107, 0x12u);
                            }

                            sub_1000033D8(v23, CFSTR("IOKitError"));
                            goto LABEL_91;
                          }
                          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)v107 = 138413058;
                            *(_QWORD *)v108 = CFSTR("PreventUserIdleSystemSleep");
                            *(_WORD *)&v108[8] = 2112;
                            v109 = (const char *)v35;
                            v110 = 2112;
                            v111 = v97;
                            v112 = 2112;
                            v113 = v21;
                            _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Creating assertion %@ %@ %@ for %@.", v107, 0x2Au);
                          }

                          v76 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                          if (v76)
                          {
                            v77 = v76;
                            v78 = lockdown_send_message(v23, v76, 200);
                            if (v78)
                            {
                              v79 = v78;
                              v80 = sub_100003368();
                              v81 = objc_claimAutoreleasedReturnValue(v80);
                              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)v107 = 67109120;
                                *(_DWORD *)v108 = v79;
                                _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "lockdown_send_message() failed: %d", v107, 8u);
                              }

                            }
                            CFRelease(v77);
                          }
                          socket = lockdown_get_socket(v23);
                          if (socket == -1)
                          {
                            v89 = sub_100003368();
                            v61 = objc_claimAutoreleasedReturnValue(v89);
                            if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                              goto LABEL_90;
                            *(_DWORD *)v107 = 138412290;
                            *(_QWORD *)v108 = v21;
                            v63 = "lockdown_get_socket() for %@ returned -1.";
                            goto LABEL_97;
                          }
                          v83 = socket;
                          if (__darwin_check_fd_set_overflow(socket, &buf, 0))
                            *(__int32_t *)((char *)buf.fds_bits + (((unint64_t)v83 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v83;
                          if (__darwin_check_fd_set_overflow(v83, &v102, 0))
                            *(__int32_t *)((char *)v102.fds_bits + (((unint64_t)v83 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v83;
                          v101.tv_sec = (uint64_t)valuePtr;
                          v101.tv_usec = (int)((valuePtr - (double)(uint64_t)valuePtr) / 1000.0 / 1000.0);
                          *__error() = 0;
                          v84 = select(v83 + 1, &buf, 0, &v102, &v101);
                          if (v84 != 1)
                          {
                            v85 = v84;
                            if (!v84)
                            {
                              v93 = sub_100003368();
                              v54 = objc_claimAutoreleasedReturnValue(v93);
                              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                                sub_100003560(v54);
                              goto LABEL_65;
                            }
                            if (v84 == -1)
                            {
                              v86 = sub_100003368();
                              v61 = objc_claimAutoreleasedReturnValue(v86);
                              if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                                goto LABEL_90;
                              v87 = __error();
                              v88 = strerror(*v87);
                              *(_DWORD *)v107 = 138412546;
                              *(_QWORD *)v108 = v21;
                              *(_WORD *)&v108[8] = 2080;
                              v109 = v88;
                              v63 = "select() for %@ failed: %s.";
                              goto LABEL_87;
                            }
                            v94 = sub_100003368();
                            v54 = objc_claimAutoreleasedReturnValue(v94);
                            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                            {
                              v95 = *__error();
                              *(_DWORD *)v107 = 67109376;
                              *(_DWORD *)v108 = v85;
                              *(_WORD *)&v108[4] = 1024;
                              *(_DWORD *)&v108[6] = v95;
                              v56 = "select() returned unexpectedly returned %d (errno:%d).";
                              p_buf = v107;
                              v58 = v54;
                              v59 = 14;
LABEL_64:
                              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, v56, p_buf, v59);
                              goto LABEL_65;
                            }
                            goto LABEL_65;
                          }
                          v90 = lockdown_recv(v23, v106, 10);
                          v91 = sub_100003368();
                          v92 = objc_claimAutoreleasedReturnValue(v91);
                          v61 = v92;
                          if (!v90)
                          {
                            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
                              sub_1000035A0(v21, v61, v96);
                            goto LABEL_90;
                          }
                          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)v107 = 134217984;
                            *(_QWORD *)v108 = v90;
                            v63 = "Read %ld bytes but expected none.";
LABEL_97:
                            v64 = v107;
                            goto LABEL_76;
                          }
LABEL_90:

                          goto LABEL_91;
                        }
                      }
                    }
                    sub_1000033D8(v23, CFSTR("InvalidRequest"));
                    v72 = sub_100003368();
                    v61 = objc_claimAutoreleasedReturnValue(v72);
                    if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_90;
                    v73 = "Object was the wrong type";
                    if (!v97)
                      v73 = "Object was NULL";
                    *(_DWORD *)v107 = 138412546;
                    *(_QWORD *)v108 = v21;
                    *(_WORD *)&v108[8] = 2080;
                    v109 = v73;
                    v63 = "ASSERTION_TIMEOUT_KEY from %@ is invalid (%s).";
                  }
                }
                else
                {
                  sub_1000033D8(v23, CFSTR("InvalidRequest"));
                  v70 = sub_100003368();
                  v61 = objc_claimAutoreleasedReturnValue(v70);
                  if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_90;
                  v71 = "Object was the wrong type";
                  if (!v35)
                    v71 = "Object was NULL";
                  *(_DWORD *)v107 = 138412546;
                  *(_QWORD *)v108 = v21;
                  *(_WORD *)&v108[8] = 2080;
                  v109 = v71;
                  v63 = "ASSERTION_NAME_KEY from %@ is invalid (%s).";
                }
              }
              else
              {
                sub_1000033D8(v23, CFSTR("InvalidRequest"));
                v65 = sub_100003368();
                v61 = objc_claimAutoreleasedReturnValue(v65);
                if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_90;
                v66 = "Object was the wrong type";
                if (!v30)
                  v66 = "Object was NULL";
                *(_DWORD *)v107 = 138412546;
                *(_QWORD *)v108 = v21;
                *(_WORD *)&v108[8] = 2080;
                v109 = v66;
                v63 = "ASSERTION_TYPE_KEY from %@ is invalid (%s).";
              }
LABEL_87:
              v64 = v107;
LABEL_88:
              v68 = v61;
              v69 = 22;
              goto LABEL_89;
            }
            sub_1000033D8(v23, CFSTR("InvalidRequest"));
            v67 = sub_100003368();
            v61 = objc_claimAutoreleasedReturnValue(v67);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              buf.fds_bits[0] = 138412290;
              *(_QWORD *)&buf.fds_bits[1] = v21;
              v63 = "received unknown request from %@.";
              v64 = (uint8_t *)&buf;
LABEL_76:
              v68 = v61;
              v69 = 12;
LABEL_89:
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, v63, v64, v69);
              goto LABEL_90;
            }
            goto LABEL_90;
          }
        }
        v51 = sub_100003368();
        v19 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v52 = CFDictionaryGetValue(theDict, kLockdownCheckinPath);
          buf.fds_bits[0] = 138412290;
          *(_QWORD *)&buf.fds_bits[1] = v52;
          v47 = "Check in client name was bad at path '%@'.";
          v48 = v19;
          v49 = 12;
          goto LABEL_48;
        }
LABEL_49:

        goto LABEL_50;
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      v50 = CFDictionaryGetValue(theDict, kLockdownCheckinPath);
      buf.fds_bits[0] = 138412546;
      *(_QWORD *)&buf.fds_bits[1] = v50;
      LOWORD(buf.fds_bits[3]) = 1024;
      *(__int32_t *)((char *)&buf.fds_bits[3] + 2) = v15;
      v47 = "Unable to check in with lockdown at path '%@': %d";
      v48 = v19;
      v49 = 18;
    }
    else
    {
      v46 = sub_100003368();
      v19 = objc_claimAutoreleasedReturnValue(v46);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      buf.fds_bits[0] = 67109120;
      buf.fds_bits[1] = v15;
      v47 = "Lockdown checkin did not provide connection info: %d";
      v48 = v19;
      v49 = 8;
    }
LABEL_48:
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v47, (uint8_t *)&buf, v49);
    goto LABEL_49;
  }
  v7 = v6;
  v8 = sub_100003368();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    buf.fds_bits[0] = 67109120;
    buf.fds_bits[1] = v7;
    v10 = "Unable to copy lockdown checkin info: %d";
    v11 = v9;
    v12 = 8;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&buf, v12);
  }
LABEL_6:

  v13 = 0;
LABEL_50:
  if (theDict)
    CFRelease(theDict);
  if (v13)
    CFRelease(v13);
  if (v99)
    lockdown_disconnect();
  if (value)
    CFRelease(value);
  objc_autoreleasePoolPop(v5);

LABEL_59:
}

id sub_100003368()
{
  if (qword_100008008 != -1)
    dispatch_once(&qword_100008008, &stru_100004300);
  return (id)qword_100008000;
}

void sub_1000033A8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.mobile.assertion_agent", "main");
  v2 = (void *)qword_100008000;
  qword_100008000 = (uint64_t)v1;

}

void sub_1000033D8(uint64_t a1, const void *a2)
{
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  int v5;
  int v6;
  id v7;
  NSObject *v8;
  const void *v9;
  void *keys;
  uint8_t buf[4];
  int v12;

  v9 = a2;
  keys = CFSTR("ErrorKey");
  if (a1)
  {
    if (a2)
    {
      v3 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, &v9, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v3)
      {
        v4 = v3;
        v5 = lockdown_send_message(a1, v3, 200);
        if (v5)
        {
          v6 = v5;
          v7 = sub_100003368();
          v8 = objc_claimAutoreleasedReturnValue(v7);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v12 = v6;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lockdown_send_message() failed: %d", buf, 8u);
          }

        }
        CFRelease(v4);
      }
    }
  }
}

void sub_1000034E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1000034F4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 136315138;
  v4 = a1;
  sub_1000034E8((void *)&_mh_execute_header, a2, a3, "Got a '%s'. Returning", (uint8_t *)&v3);
}

void sub_100003560(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "select() timed out.", v1, 2u);
}

void sub_1000035A0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_1000034E8((void *)&_mh_execute_header, a2, a3, "Connection closed for client %@.", (uint8_t *)&v3);
}

void sub_10000360C(CFDictionaryRef *a1, NSObject *a2)
{
  const void *Value;
  uint64_t v4;
  int v5;
  const void *v6;

  Value = CFDictionaryGetValue(*a1, kLockdownCheckinPath);
  v5 = 138412290;
  v6 = Value;
  sub_1000034E8((void *)&_mh_execute_header, a2, v4, "Checked in at path '%@'", (uint8_t *)&v5);
}
