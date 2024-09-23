void *sub_100004174(int a1, uint64_t a2, _QWORD *a3, ssize_t *a4)
{
  void *v8;
  ssize_t v9;
  ssize_t v10;
  void *v11;
  void *v12;

  v8 = sub_10000440C(*(_QWORD *)(a2 + 96));
  v9 = read(a1, v8, *(_QWORD *)(a2 + 96));
  v10 = v9;
  if (v9 != *(_QWORD *)(a2 + 96))
  {
    if (v9)
    {
      if (v9 != -1 || (v9 = *__error(), (_DWORD)v9))
        _os_assumes_log(v9);
    }
    goto LABEL_8;
  }
  v11 = (void *)xpc_create_from_plist(v8, v9);
  v12 = v11;
  if (v11)
  {
    if (xpc_get_type(v11) != (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_release(v12);
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
    if (a3 && a4)
    {
      *a4 = v10;
      *a3 = v8;
      return v12;
    }
  }
LABEL_9:
  free(v8);
  return v12;
}

int *sub_100004258(int *result)
{
  uint64_t v1;

  if ((result & 0x80000000) == 0)
  {
    result = (int *)close((int)result);
    if ((_DWORD)result)
    {
      v1 = *__error();
      if ((_DWORD)v1)
        _os_assumes_log(v1);
      result = __error();
      if (*result == 9)
        sub_100005D24();
    }
  }
  return result;
}

void *sub_10000429C(const char *a1)
{
  return sub_1000042A8(a1, 0, 0);
}

void *sub_1000042A8(const char *a1, _QWORD *a2, ssize_t *a3)
{
  int *v5;
  int *v6;
  int v7;
  void *v8;
  stat v10;

  if (!a1)
    return 0;
  v5 = (int *)open(a1, 0);
  if ((_DWORD)v5 == -1)
    return 0;
  v6 = v5;
  memset(&v10, 0, sizeof(v10));
  v7 = fstat((int)v5, &v10);
  if (v7 | v10.st_uid || (v10.st_mode & 0x12) != 0)
    v8 = 0;
  else
    v8 = sub_100004174((int)v6, (uint64_t)&v10, a2, a3);
  sub_100004258(v6);
  return v8;
}

uint64_t sub_100004360()
{
  return _os_assert_log(0);
}

uint64_t xpc_support_relax_roleaccount_policy()
{
  if (qword_10000C030 != -1)
    dispatch_once(&qword_10000C030, &stru_1000083A0);
  return byte_10000C038;
}

void sub_1000043A8(id a1)
{
  void *v1;
  void *v2;

  v1 = sub_10000429C("/Library/Preferences/com.apple.security.xpc.plist");
  if (v1)
  {
    v2 = v1;
    if (xpc_dictionary_get_value(v1, "RestrictRoleAccountServices") == &_xpc_BOOL_false)
      byte_10000C038 = 1;
    xpc_release(v2);
  }
}

void *sub_10000440C(size_t size)
{
  void *v2;
  int v3;

  do
  {
    v2 = malloc_type_calloc(1uLL, size, 0x5C63E6C5uLL);
    if (v2)
      break;
    if (*__error() != 12)
    {
      v3 = *__error();
      if (v3)
        sub_100005D38(v3);
    }
  }
  while (sub_100005CB0());
  return v2;
}

void start(int a1, uint64_t a2)
{
  const char *v3;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  if (a1 == 2)
  {
    v3 = *(const char **)(a2 + 8);
    if (!strcmp(v3, "-launchd"))
    {
      sub_100004590();
      sub_100004628();
    }
    if (!strcmp(v3, "-boot"))
      sub_100004664();
    sub_100004590();
    v7 = sub_1000045E8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a2 + 8);
      v10 = 136446210;
      v11 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "invoked with unknown argument: %{public}s", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    sub_100004590();
    v5 = sub_1000045E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 67109120;
      LODWORD(v11) = a1;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "unexpected argument count, exiting: %d", (uint8_t *)&v10, 8u);
    }

  }
  exit(64);
}

uint64_t sub_100004590()
{
  uint64_t result;
  FILE *v1;
  const char *v2;

  result = isatty(1);
  if ((_DWORD)result)
  {
    v1 = __stdoutp;
    v2 = getprogname();
    fprintf(v1, "%s cannot be run directly.\n", v2);
    exit(78);
  }
  return result;
}

id sub_1000045E8()
{
  if (qword_10000C048 != -1)
    dispatch_once(&qword_10000C048, &stru_1000083E0);
  return (id)qword_10000C040;
}

void sub_100004628()
{
  _xpc_connection_s *mach_service;

  mach_service = xpc_connection_create_mach_service("com.apple.xpc.roleaccountd", 0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_100008420);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

void sub_100004664()
{
  FTS *v0;
  uint64_t v1;
  FTS *v2;
  FTSENT *v3;
  int *v4;
  FTSENT *v5;
  std::error_code *v6;
  int *v7;
  int *v8;
  char *v9[2];

  v9[0] = "/private/var/db/com.apple.xpc.roleaccountd.staging";
  v9[1] = 0;
  v0 = fts_open(v9, 0, 0);
  if (!v0)
  {
    v1 = *__error();
    if ((_DWORD)v1)
      _os_assumes_log(v1);
    exit(74);
  }
  v2 = v0;
  v3 = fts_read(v0);
  if (v3)
  {
    v5 = v3;
    do
    {
      if (v5->fts_level && v5->fts_info != 1)
      {
        if (lchflags(v5->fts_path, 0) == -1)
        {
          v7 = __error();
          _os_assumes_log(*v7);
        }
        if (remove((const std::__fs::filesystem::path *)v5->fts_path, v6) == -1)
        {
          v8 = __error();
          _os_assumes_log(*v8);
        }
      }
      v5 = fts_read(v2);
    }
    while (v5);
  }
  if (fts_close(v2) == -1)
  {
    v4 = __error();
    _os_assumes_log(*v4);
  }
  exit(0);
}

void sub_10000475C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("xpcroleaccountd", "default");
  v2 = (void *)qword_10000C040;
  qword_10000C040 = (uint64_t)v1;

}

void sub_10000478C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  char *v3;
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  pid_t pid;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _xpc_connection_s *v12;
  _QWORD handler[4];
  _xpc_connection_s *v14;
  uint8_t buf[4];
  char *v16;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    v6 = v2;
    pid = xpc_connection_get_pid(v6);
    v8 = (void *)xpc_connection_copy_entitlement_value(v6, "com.apple.private.xpc.is.xpcproxy");

    v9 = sub_1000045E8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v8 == &_xpc_BOOL_true)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = pid;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "pid[%d]: accepting incoming conncection", buf, 8u);
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000049A0;
      handler[3] = &unk_100008448;
      v12 = v6;
      v14 = v12;
      xpc_connection_set_event_handler(v12, handler);
      xpc_connection_activate(v12);

    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = pid;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "pid[%d]: refusing incoming connection - process doesn't have xpcproxy entitlements", buf, 8u);
      }

      xpc_connection_cancel(v6);
    }
  }
  else
  {
    v3 = xpc_copy_description(v2);
    v4 = sub_1000045E8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connection error: %s", buf, 0xCu);
    }

    free(v3);
  }

}

void sub_1000049A0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _xpc_connection_s *v6;
  pid_t pid;
  xpc_object_t reply;
  void *v9;
  id v10;
  const char *string;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t property;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  int *v26;
  id v27;
  NSObject *v28;
  int v29;
  char *v30;
  id v31;
  NSObject *v32;
  id v33;
  int v34;
  id v35;
  void *v36;
  int v37;
  int v38;
  id v39;
  NSObject *v40;
  const char *executable_path;
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  __darwin_ino64_t st_ino;
  int v48;
  const char *v49;
  id v50;
  NSObject *v51;
  _copyfile_state *v52;
  int v53;
  id v54;
  NSObject *v55;
  int v56;
  const char *v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  const char *path;
  CFStringRef v65;
  CFDictionaryRef v66;
  int v67;
  int v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  id v72;
  NSObject *v73;
  id v74;
  id v75;
  const __CFDictionary *Value;
  const __CFDictionary *v77;
  CFTypeID v78;
  const __CFBoolean *v79;
  uint64_t info_dictionary;
  uint64_t v81;
  void *v82;
  id v83;
  CFTypeID v84;
  id v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  NSObject *v96;
  std::error_code *v97;
  int v98;
  id v99;
  NSObject *v100;
  int v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  NSObject *v107;
  id v108;
  id v109;
  id v110;
  const __CFString *v111;
  CFDictionaryRef cf;
  void *v113;
  NSObject *v114;
  dev_t st_dev;
  id v116;
  char *from;
  char *froma;
  uint64_t v119;
  stat v120;
  std::__fs::filesystem::path __str[42];
  stat buf[7];
  _BYTE v123[12];
  uuid_t out;
  stat v125;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  pid = xpc_connection_get_pid(v6);
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      v9 = reply;
      v10 = v5;
      string = xpc_dictionary_get_string(v10, "Path");
      if (string)
      {
        v12 = string;
        if (xpc_dictionary_get_string(v10, "Token"))
        {
          v13 = sandbox_extension_consume();
          if (v13 == -1)
          {
            v31 = sub_1000045E8();
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              sub_100005E20();

            goto LABEL_18;
          }
          v14 = v13;
          v15 = (id)xpc_bundle_create(v12, 2);
          v16 = ((uint64_t (*)(void))xpc_bundle_get_property)();
          v119 = v14;
          if (v16)
          {
            from = (char *)v16;
            property = xpc_bundle_get_property(v15, 3);
            if (property)
            {
              v18 = (const char *)property;
              v19 = xpc_bundle_copy_info_dictionary(v15);
              v20 = v19;
              if (!v19
                || xpc_get_type(v19) != (xpc_type_t)&_xpc_type_dictionary
                || xpc_dictionary_get_string(v20, "CFBundleIdentifier"))
              {

                v37 = sub_10000584C("/private/var/db/com.apple.xpc.roleaccountd.staging");
                if (v37
                  || (v37 = sub_10000584C("/private/var/db/com.apple.xpc.roleaccountd.staging/exec")) != 0
                  || (v37 = sub_10000584C("/private/var/db/com.apple.xpc.roleaccountd.staging/tmp")) != 0)
                {
LABEL_38:
                  v36 = 0;
                  *__error() = v37;
                  goto LABEL_39;
                }
                bzero(__str, 0x400uLL);
                memset(buf, 0, 144);
                if (lstat(v18, buf))
                {
                  v45 = sub_1000045E8();
                  v46 = objc_claimAutoreleasedReturnValue(v45);
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                    sub_100006538();

                  v37 = *__error();
                  if (v37)
                    goto LABEL_38;
                }
                else
                {
                  st_ino = buf[0].st_ino;
                  st_dev = buf[0].st_dev;
                  v48 = xpc_support_relax_roleaccount_policy();
                  v49 = (const char *)&unk_100006FCF;
                  if (v48)
                    v49 = "-relaxed";
                  snprintf((char *)__str, 0x400uLL, "%s/%d.%lld%s.xpc", "/private/var/db/com.apple.xpc.roleaccountd.staging/exec", st_dev, st_ino, v49);
                }
                memset(&v120, 0, sizeof(v120));
                if (!lstat((const char *)__str, &v120))
                {
                  v57 = &v18[strlen(from) + 1];
                  v58 = sub_1000045E8();
                  v59 = objc_claimAutoreleasedReturnValue(v58);
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    buf[0].st_dev = 67109378;
                    *(_DWORD *)&buf[0].st_mode = pid;
                    LOWORD(buf[0].st_ino) = 2082;
                    *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 2) = (__darwin_ino64_t)__str;
                    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "pid[%d]: secured service bundle exists: [%{public}s]", (uint8_t *)buf, 0x12u);
                  }

                  bzero(buf, 0x400uLL);
                  snprintf((char *)buf, 0x400uLL, "%s/%s", (const char *)__str, v57);
                  v60 = sub_1000045E8();
                  v61 = objc_claimAutoreleasedReturnValue(v60);
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                  {
                    v125.st_dev = 67109378;
                    *(_DWORD *)&v125.st_mode = pid;
                    LOWORD(v125.st_ino) = 2080;
                    *(__darwin_ino64_t *)((char *)&v125.st_ino + 2) = (__darwin_ino64_t)buf;
                    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "pid[%d]: secured service bundle executable: %s", (uint8_t *)&v125, 0x12u);
                  }

                  memset(&v125, 0, sizeof(v125));
                  if (lstat((const char *)buf, &v125))
                  {
                    v62 = sub_1000045E8();
                    v63 = objc_claimAutoreleasedReturnValue(v62);
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                      sub_100006070();

                    v36 = 0;
                  }
                  else if (!v125.st_uid && (v125.st_mode & 0x40) != 0)
                  {
                    v36 = (void *)xpc_bundle_create(buf, 2);
                  }
                  else
                  {
                    v72 = sub_1000045E8();
                    v73 = objc_claimAutoreleasedReturnValue(v72);
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                      sub_100005FEC();

                    v36 = 0;
                    *__error() = 1;
                  }
LABEL_39:

                  v38 = *__error();
                  if (sandbox_extension_release(v119) == -1)
                  {
                    v39 = sub_1000045E8();
                    v40 = objc_claimAutoreleasedReturnValue(v39);
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                      sub_100005EAC();

                  }
                  *__error() = v38;
                  if (v36)
                  {
                    executable_path = (const char *)xpc_bundle_get_executable_path(v36);
                    v30 = sub_100005CCC(executable_path);

                    if (v30)
                    {
                      xpc_dictionary_set_string(v9, "Path", v30);
                      xpc_dictionary_set_uint64(v9, "Retval", 0);
                      v42 = sub_1000045E8();
                      v28 = objc_claimAutoreleasedReturnValue(v42);
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                      {
                        buf[0].st_dev = 67109378;
                        *(_DWORD *)&buf[0].st_mode = pid;
                        LOWORD(buf[0].st_ino) = 2082;
                        *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 2) = (__darwin_ino64_t)v30;
                        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "pid[%d]: successfully staged: %{public}s", (uint8_t *)buf, 0x12u);
                      }
LABEL_22:

                      xpc_connection_send_message(v6, v9);
                      free(v30);

                      goto LABEL_23;
                    }
LABEL_19:
                    v26 = __error();
                    xpc_dictionary_set_uint64(v9, "Retval", *v26);
                    v27 = sub_1000045E8();
                    v28 = objc_claimAutoreleasedReturnValue(v27);
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                    {
                      v29 = *__error();
                      buf[0].st_dev = 67109376;
                      *(_DWORD *)&buf[0].st_mode = pid;
                      LOWORD(buf[0].st_ino) = 1024;
                      *(_DWORD *)((char *)&buf[0].st_ino + 2) = v29;
                      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "pid[%d]: failed: %{errno}d", (uint8_t *)buf, 0xEu);
                    }
                    v30 = 0;
                    goto LABEL_22;
                  }
LABEL_18:

                  goto LABEL_19;
                }
                bzero(buf, 0x400uLL);
                memset(out, 0, sizeof(out));
                uuid_generate(out);
                memset(&v125, 0, 37);
                uuid_unparse(out, (char *)&v125);
                snprintf((char *)buf, 0x400uLL, "%s/%s", "/private/var/db/com.apple.xpc.roleaccountd.staging/tmp", (const char *)&v125);
                v50 = sub_1000045E8();
                v51 = objc_claimAutoreleasedReturnValue(v50);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v123 = 136315138;
                  *(_QWORD *)&v123[4] = buf;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "staging area for bundle: %s", v123, 0xCu);
                }

                v52 = copyfile_state_alloc();
                copyfile_state_set(v52, 6u, sub_100005A80);
                v53 = copyfile(from, (const char *)buf, v52, 0xC800Fu);
                copyfile_state_free(v52);
                if (v53)
                {
                  v54 = sub_1000045E8();
                  v55 = objc_claimAutoreleasedReturnValue(v54);
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                    sub_100006498(pid, v53, v55);

                  v56 = *__error();
                  if (v56)
                    v37 = v56;
                  else
                    v37 = 79;
                  goto LABEL_38;
                }
                v116 = (id)xpc_bundle_create(buf, 1);
                path = (const char *)xpc_bundle_get_path();
                *(_QWORD *)v123 = 0;
                v65 = CFStringCreateWithCString(0, path, 0x8000100u);
                if (v65)
                {
                  *(_QWORD *)&v125.st_dev = kMISValidationOptionAllowAdHocSigning;
                  v125.st_ino = kMISValidationOptionTrustCacheOnly;
                  *(_QWORD *)out = kCFBooleanTrue;
                  *(_QWORD *)&out[8] = kCFBooleanTrue;
                  v66 = CFDictionaryCreate(0, (const void **)&v125, (const void **)out, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                  if (v66)
                  {
                    v111 = v65;
                    cf = v66;
                    v67 = MISValidateSignatureAndCopyInfo(v65, v66, v123);
                    if (v67)
                    {
                      v68 = v67;
                      v69 = sub_1000045E8();
                      v70 = objc_claimAutoreleasedReturnValue(v69);
                      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                        sub_100006430(v68, v70, v71);
                    }
                    else
                    {
                      Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)v123, kMISValidationInfoEntitlements);
                      if (Value && (v77 = Value, v78 = CFGetTypeID(Value), v78 == CFDictionaryGetTypeID()))
                      {
                        v79 = (const __CFBoolean *)CFDictionaryGetValue(v77, CFSTR("com.apple.private.xpc.role-account"));
                        if (v79 && v79 == kCFBooleanTrue)
                        {
                          info_dictionary = xpc_bundle_get_info_dictionary(v116);
                          v113 = (void *)objc_claimAutoreleasedReturnValue(info_dictionary);
                          if (v113)
                          {
                            v81 = _CFXPCCreateCFObjectFromXPCObject(v113);
                            if (v81)
                            {
                              v82 = (void *)v81;
                              v65 = v111;
                              goto LABEL_103;
                            }
                            v110 = sub_1000045E8();
                            v70 = objc_claimAutoreleasedReturnValue(v110);
                            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                              sub_1000063D8();
                            goto LABEL_101;
                          }
                          v109 = sub_1000045E8();
                          v70 = objc_claimAutoreleasedReturnValue(v109);
                          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                            sub_1000063AC();
                        }
                        else
                        {
                          v104 = sub_1000045E8();
                          v70 = objc_claimAutoreleasedReturnValue(v104);
                          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                            sub_100006404();
                        }
                      }
                      else
                      {
                        v83 = sub_1000045E8();
                        v70 = objc_claimAutoreleasedReturnValue(v83);
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                          sub_100006380();
                      }
                    }
                    v113 = 0;
LABEL_101:
                    v65 = v111;
                    goto LABEL_102;
                  }
                  v75 = sub_1000045E8();
                  v70 = objc_claimAutoreleasedReturnValue(v75);
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                    sub_100006354();
                }
                else
                {
                  v74 = sub_1000045E8();
                  v70 = objc_claimAutoreleasedReturnValue(v74);
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                    sub_100006328();
                }
                cf = 0;
                v113 = 0;
LABEL_102:

                v82 = 0;
LABEL_103:
                if (*(_QWORD *)v123)
                  CFRelease(*(CFTypeRef *)v123);
                if (cf)
                  CFRelease(cf);
                if (v65)
                  CFRelease(v65);
                if (v82)
                {
                  v84 = CFGetTypeID(v82);
                  if (v84 != CFDictionaryGetTypeID())
                  {
                    v85 = sub_1000045E8();
                    v86 = objc_claimAutoreleasedReturnValue(v85);
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                      sub_1000062FC();

                    CFRelease(v82);
                    v82 = 0;
                  }
                }

                v87 = v116;
                if (v82)
                {
                  v88 = v82;
                  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("XPCService")));
                  if (v89
                    && (v90 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v89, v90) & 1) != 0))
                  {
                    v91 = v89;
                    v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("_RoleAccount")));
                    if (v92
                      && (v93 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v92, v93) & 1) != 0))
                    {
                      v114 = objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("ServiceType")));
                      if (!v114)
                        goto LABEL_122;
                      v94 = objc_opt_class(NSString);
                      if ((objc_opt_isKindOfClass(v114, v94) & 1) != 0)
                      {
                        if ((-[NSObject isEqualToString:](v114, "isEqualToString:", CFSTR("Application")) & 1) != 0)
                        {
LABEL_122:

                          v95 = sub_1000045E8();
                          v96 = objc_claimAutoreleasedReturnValue(v95);
                          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
                          {
                            v125.st_dev = 136315138;
                            *(_QWORD *)&v125.st_mode = __str;
                            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "moving staging area to secured destination: %s", (uint8_t *)&v125, 0xCu);
                          }

                          rename((const std::__fs::filesystem::path *)buf, __str, v97);
                          if (!v98)
                            goto LABEL_156;
                          if (*__error() == 66)
                          {
                            memset(&v125, 0, sizeof(v125));
                            if (!lstat(from, &v125) && (v125.st_mode & 0xF000) == 0x4000 && !v125.st_uid)
                            {
                              sub_100005A28((const char *)buf);
LABEL_156:
                              v36 = (void *)xpc_bundle_create(__str, 1);
                              goto LABEL_157;
                            }
                            v99 = sub_1000045E8();
                            v100 = objc_claimAutoreleasedReturnValue(v99);
                            if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                              sub_1000061A0();

                            v101 = 1;
                          }
                          else
                          {
                            v106 = sub_1000045E8();
                            v107 = objc_claimAutoreleasedReturnValue(v106);
                            if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                              sub_1000061CC();

                            v101 = *__error();
                            if (!v101)
                              goto LABEL_156;
                          }
                          sub_100005A28((const char *)buf);
                          v36 = 0;
                          *__error() = v101;
LABEL_157:
                          v87 = v116;
                          goto LABEL_137;
                        }
                        v108 = sub_1000045E8();
                        froma = (char *)objc_claimAutoreleasedReturnValue(v108);
                        if (os_log_type_enabled((os_log_t)froma, OS_LOG_TYPE_ERROR))
                          sub_10000623C();
                      }
                      else
                      {
                        v105 = sub_1000045E8();
                        froma = (char *)objc_claimAutoreleasedReturnValue(v105);
                        if (os_log_type_enabled((os_log_t)froma, OS_LOG_TYPE_ERROR))
                          sub_10000629C();
                      }

                    }
                    else
                    {
                      v103 = sub_1000045E8();
                      v114 = objc_claimAutoreleasedReturnValue(v103);
                      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                        sub_100006140();
                    }

                  }
                  else
                  {
                    v91 = v89;
                    v102 = sub_1000045E8();
                    v92 = objc_claimAutoreleasedReturnValue(v102);
                    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                      sub_1000060E0();
                  }

                  v87 = v116;
                }

                sub_100005A28((const char *)buf);
                v36 = 0;
                *__error() = 79;
LABEL_137:

                goto LABEL_39;
              }
              v43 = sub_1000045E8();
              v44 = objc_claimAutoreleasedReturnValue(v43);
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                sub_1000065A8();

              v34 = 109;
            }
            else
            {
              v35 = sub_1000045E8();
              v20 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                sub_100005F84();
              v34 = 2;
            }
          }
          else
          {
            v33 = sub_1000045E8();
            v20 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              sub_100005F1C();
            v34 = 2;
          }

          v36 = 0;
          *__error() = v34;
          goto LABEL_39;
        }
        v24 = sub_1000045E8();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_100005DB8();

      }
      else
      {
        v21 = sub_1000045E8();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_100005D50(pid, v22, v23);

      }
      *__error() = 22;
      goto LABEL_18;
    }
  }
LABEL_23:

}

uint64_t sub_10000584C(char *a1)
{
  int v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  char *v12;
  stat v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;

  if ((mkdir(a1, 0x1C0u) & 0x80000000) == 0)
    return 0;
  if (*__error() == 17)
  {
    memset(&v13, 0, sizeof(v13));
    v3 = lstat(a1, &v13);
    v4 = (v13.st_mode & 0xF000) != 0x4000 && v3 == 0;
    v5 = (v13.st_mode & 0xFFF) != 0x1C0 && v3 == 0;
    if (v13.st_uid)
      v6 = v3 == 0;
    else
      v6 = 0;
    if (v4 || v5 || v6)
    {
      v10 = sub_1000045E8();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = strrchr(a1, 47);
        *(_DWORD *)buf = 136315906;
        v15 = v12;
        v16 = 1024;
        v17 = v4;
        v18 = 1024;
        v19 = v5;
        v20 = 1024;
        v21 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "bad ownership/permissions on staging area (%s) (%d,%d,%d)", buf, 0x1Eu);
      }

      *__error() = 1;
      return *__error();
    }
    if ((v3 & 0x80000000) == 0)
      return 0;
    v7 = sub_1000045E8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100006610(a1, v8);
  }
  else
  {
    v9 = sub_1000045E8();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000668C(a1, v8);
  }

  return *__error();
}

void sub_100005A28(const char *a1)
{
  id v2;
  NSObject *v3;

  if (removefile(a1, 0, 1u))
  {
    v2 = sub_1000045E8();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_100006708((uint64_t)a1, v3);

  }
}

uint64_t sub_100005A80(int a1, int a2, int a3, int a4, char *a5)
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  id v11;
  id v12;
  stat v13;
  uint64_t v14;
  uint64_t v15;

  if (a2 != 2)
    return 0;
  v14 = v5;
  v15 = v6;
  memset(&v13, 0, sizeof(v13));
  if (lchown(a5, 0, 0))
  {
    v8 = sub_1000045E8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000681C();
LABEL_12:

    return 2;
  }
  if (lstat(a5, &v13))
  {
    v11 = sub_1000045E8();
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000067AC();
    goto LABEL_12;
  }
  if ((v13.st_mode & 0xF000) == 0xA000)
  {
    v12 = sub_1000045E8();
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100006780();
    goto LABEL_12;
  }
  return 0;
}

void sub_100005B7C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005B94(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_100005BA0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100005BCC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_100005BF0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005C00(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

int *sub_100005C5C()
{
  return __error();
}

int *sub_100005C8C()
{
  return __error();
}

char *sub_100005C94(char *a1)
{
  return strrchr(a1, 47);
}

uint64_t sub_100005CB0()
{
  sleep(1u);
  return 1;
}

char *sub_100005CCC(const char *a1)
{
  const char *i;
  char *result;
  int v3;

  for (i = a1; ; a1 = i)
  {
    result = strdup(a1);
    if (result)
      break;
    if (*__error() != 12)
    {
      v3 = *__error();
      if (v3)
        sub_10000688C(v3);
    }
    sub_100005CB0();
  }
  return result;
}

uint64_t sub_100005D1C(int a1)
{
  return _os_assert_log(a1);
}

void sub_100005D24()
{
  uint64_t v0;

  v0 = sub_100004360();
  _os_crash(v0);
  __break(1u);
}

void sub_100005D38(int a1)
{
  uint64_t v1;

  v1 = _os_assert_log(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_100005D50(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = a1;
  sub_100005BCC((void *)&_mh_execute_header, a2, a3, "pid[%d]: received incoming message with no path", (uint8_t *)v3);
  sub_100005BD8();
}

void sub_100005DB8()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100005BB4();
  sub_100005B94((void *)&_mh_execute_header, v0, (uint64_t)v0, "pid[%d]: received incoming message with no token for path[%{public}s]", v1);
  sub_100005B8C();
}

void sub_100005E20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100005C70();
  sub_100005C5C();
  sub_100005C00((void *)&_mh_execute_header, v0, v1, "pid[%d]: received invalid token[%d] for path[%{public}s]", v2, v3, v4, v5, 2u);
  sub_100005BE0();
}

void sub_100005EAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C70();
  sub_100005C5C();
  sub_100005C38();
  sub_100005C00((void *)&_mh_execute_header, v0, v1, "pid[%d]: unable to release sandbox extension for path[%s] with error[%d]", v2, v3, v4, v5, v6);
  sub_100005BE0();
}

void sub_100005F1C()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100005BB4();
  sub_100005B94((void *)&_mh_execute_header, v0, (uint64_t)v0, "pid[%d]: unable to resolve bundle root path[%{public}s]", v1);
  sub_100005B8C();
}

void sub_100005F84()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100005BB4();
  sub_100005B94((void *)&_mh_execute_header, v0, (uint64_t)v0, "pid[%d]: unable to resolve bundle executable path[%{public}s]", v1);
  sub_100005B8C();
}

void sub_100005FEC()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;

  sub_100005C80();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "bad ownership/permissions on existing RoleAccount executable (mode/uid): %u/%u", v2, 0xEu);
  sub_100005B8C();
}

void sub_100006070()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C8C();
  sub_100005C80();
  sub_100005BA0((void *)&_mh_execute_header, v0, v1, "stat(2) on existing RoleAccount executable failed: %{errno}d", v2, v3, v4, v5, v6);
  sub_100005B8C();
}

void sub_1000060E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005CA0();
  sub_100005BF0((void *)&_mh_execute_header, v0, v1, "[%{public}s]: XPCService dictionary is invalid", v2, v3, v4, v5, v6);
  sub_100005B8C();
}

void sub_100006140()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005CA0();
  sub_100005BF0((void *)&_mh_execute_header, v0, v1, "[%{public}s]: RoleAccount name is invalid", v2, v3, v4, v5, v6);
  sub_100005B8C();
}

void sub_1000061A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C14();
  sub_100005B7C((void *)&_mh_execute_header, v0, v1, "role account service exists but is not a root-owned directory.", v2, v3, v4, v5, v6);
  sub_100005BD8();
}

void sub_1000061CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C8C();
  sub_100005C80();
  sub_100005BA0((void *)&_mh_execute_header, v0, v1, "could not rename staged service: %{errno}d", v2, v3, v4, v5, v6);
  sub_100005B8C();
}

void sub_10000623C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005CA0();
  sub_100005BF0((void *)&_mh_execute_header, v0, v1, "[%{public}s]: RoleAccount service must have ServiceType Application", v2, v3, v4, v5, v6);
  sub_100005B8C();
}

void sub_10000629C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005CA0();
  sub_100005BF0((void *)&_mh_execute_header, v0, v1, "[%{public}s]: RoleAccount ServiceType must be a string", v2, v3, v4, v5, v6);
  sub_100005B8C();
}

void sub_1000062FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C14();
  sub_100005B7C((void *)&_mh_execute_header, v0, v1, "service Info.plist is invalid", v2, v3, v4, v5, v6);
  sub_100005BD8();
}

void sub_100006328()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C14();
  sub_100005B7C((void *)&_mh_execute_header, v0, v1, "could not create CFString!", v2, v3, v4, v5, v6);
  sub_100005BD8();
}

void sub_100006354()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C14();
  sub_100005B7C((void *)&_mh_execute_header, v0, v1, "could not create options dictionary!", v2, v3, v4, v5, v6);
  sub_100005BD8();
}

void sub_100006380()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C14();
  sub_100005B7C((void *)&_mh_execute_header, v0, v1, "invalid info for bundle", v2, v3, v4, v5, v6);
  sub_100005BD8();
}

void sub_1000063AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C14();
  sub_100005B7C((void *)&_mh_execute_header, v0, v1, "service has bogus Info.plist", v2, v3, v4, v5, v6);
  sub_100005BD8();
}

void sub_1000063D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C14();
  sub_100005B7C((void *)&_mh_execute_header, v0, v1, "could not retrieve Info.plist", v2, v3, v4, v5, v6);
  sub_100005BD8();
}

void sub_100006404()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C14();
  sub_100005B7C((void *)&_mh_execute_header, v0, v1, "service does not possess RoleAccount entitlement", v2, v3, v4, v5, v6);
  sub_100005BD8();
}

void sub_100006430(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = a1;
  sub_100005BCC((void *)&_mh_execute_header, a2, a3, "bundle code signature not valid: %d", (uint8_t *)v3);
  sub_100005BD8();
}

void sub_100006498(int a1, int a2, NSObject *a3)
{
  int v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;

  v6 = *sub_100005C5C();
  v7[0] = 67109632;
  v7[1] = a1;
  v8 = 1024;
  v9 = a2;
  v10 = 1024;
  v11 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "pid[%d]: copyfile(3) failed on service: %d, (errno %{errno}d)", (uint8_t *)v7, 0x14u);
  sub_100005BE0();
}

void sub_100006538()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C70();
  sub_100005C5C();
  sub_100005C38();
  sub_100005C00((void *)&_mh_execute_header, v0, v1, "pid[%d]: could not stat(2) RoleAccount executable: %s: %{errno}d", v2, v3, v4, v5, v6);
  sub_100005BE0();
}

void sub_1000065A8()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100005BB4();
  sub_100005B94((void *)&_mh_execute_header, v0, (uint64_t)v0, "pid[%d]: bundle has no CFBundleIdentifier at path[%{public}s]", v1);
  sub_100005B8C();
}

void sub_100006610(char *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_100005C94(a1);
  __error();
  sub_100005C20();
  sub_100005B94((void *)&_mh_execute_header, a2, v3, "staging area exists but is weird (%s): %{errno}d", v4);
  sub_100005C64();
}

void sub_10000668C(char *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_100005C94(a1);
  __error();
  sub_100005C20();
  sub_100005B94((void *)&_mh_execute_header, a2, v3, "could not create staging directory (%s): %{errno}d", v4);
  sub_100005C64();
}

void sub_100006708(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_100005C5C();
  sub_100005C20();
  sub_100005B94((void *)&_mh_execute_header, a2, v3, "could not remove staged service from tmppath %{public}s: %{errno}d", v4);
  sub_100005C64();
}

void sub_100006780()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C14();
  sub_100005B7C((void *)&_mh_execute_header, v0, v1, "encountered symbolic link during copy", v2, v3, v4, v5, v6);
  sub_100005BD8();
}

void sub_1000067AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C8C();
  sub_100005C80();
  sub_100005BA0((void *)&_mh_execute_header, v0, v1, "lstat(2) failed during copy: %{errno}d", v2, v3, v4, v5, v6);
  sub_100005B8C();
}

void sub_10000681C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005C8C();
  sub_100005C80();
  sub_100005BA0((void *)&_mh_execute_header, v0, v1, "chown(2) failed during copyfile(3): %{errno}d", v2, v3, v4, v5, v6);
  sub_100005B8C();
}

void sub_10000688C(int a1)
{
  uint64_t v1;
  const __CFAllocator *v2;
  const void **v3;
  const void **v4;
  CFIndex v5;
  const CFDictionaryKeyCallBacks *v6;
  const CFDictionaryValueCallBacks *v7;

  v1 = sub_100005D1C(a1);
  v2 = (const __CFAllocator *)_os_crash(v1);
  __break(1u);
  CFDictionaryCreate(v2, v3, v4, v5, v6, v7);
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}
