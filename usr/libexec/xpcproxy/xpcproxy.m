int64_t sub_100001EA0(uint64_t a1, xpc_object_t xdict, xpc_object_t *a3, int a4, uint64_t a5)
{
  uint64_t v10;
  int64_t int64;
  uint64_t v13;
  const char *string;
  xpc_object_t v15;
  uint64_t v16;
  uint64_t uint64;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  xpc_object_t xdicta;
  __int128 v24;
  __int128 v25;

  if (_os_alloc_once_table[2] == -1)
    v10 = _os_alloc_once_table[3];
  else
    v10 = _os_alloc_once(&_os_alloc_once_table[2], 216, 0);
  if (*(_BYTE *)v10 || *(_BYTE *)(v10 + 4))
    return 141;
  xdicta = 0;
  if (!*(_BYTE *)(v10 + 41))
    xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
  v13 = 2;
  if (!*(_BYTE *)(v10 + 88))
    v13 = 6;
  int64 = _xpc_pipe_interface_routine(*(_QWORD *)(v10 + 24), a1, xdict, &xdicta, v13 | a5);
  if (xdicta)
  {
    string = xpc_dictionary_get_string(xdicta, "xpc-fault");
    if (string)
      sub_100005764(string);
  }
  v15 = xdicta;
  if ((_DWORD)int64 || (int64 = xpc_dictionary_get_int64(xdicta, "error"), v15 = xdicta, (_DWORD)int64))
  {
    if (v15)
      xpc_release(v15);
  }
  else
  {
    if (_os_alloc_once_table[2] == -1)
      v16 = _os_alloc_once_table[3];
    else
      v16 = _os_alloc_once(&_os_alloc_once_table[2], 216, 0);
    if (!*(_BYTE *)(v16 + 88))
    {
      v24 = 0u;
      v25 = 0u;
      xpc_dictionary_get_audit_token(v15, &v24);
      if (DWORD1(v25) != 1)
        sub_1000060E4(SDWORD1(v25));
      if (DWORD1(v24))
        sub_1000060CC();
      if (a4)
      {
        uint64 = xpc_dictionary_get_uint64(v15, "req_pid");
        v18 = xpc_dictionary_get_uint64(v15, "rec_execcnt");
        if (uint64 >> 31 || (v19 = v18, v18 >> 31))
          sub_10000607C();
        v20 = sub_100004F70();
        v21 = *(_DWORD *)(v20 + 20);
        if (!v21 || (v22 = *(_DWORD *)(v20 + 28)) == 0)
          sub_100006048();
        if (v21 != (_DWORD)uint64)
          sub_1000060B4();
        if (v22 != v19)
          sub_10000609C();
      }
    }
    int64 = 0;
    *a3 = xdicta;
  }
  return int64;
}

uint64_t sub_1000020B0(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t type;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  unsigned int v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  unsigned int v21;
  void *v22;
  uid_t v23;
  passwd *v24;
  void *v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  _xpc_connection_s *mach_service;
  xpc_object_t v30;
  uint64_t v31;
  void *v32;
  uint64_t property;
  const char *v34;
  char *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  rlim_t v42;
  rlim_t v43;
  int v44;
  char v45;
  char v46;
  gid_t pw_gid;
  unsigned int v48;
  uint64_t v49;
  BOOL v50;
  passwd *v51;
  void *v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  unsigned int v61;
  const char *v62;
  unsigned int v63;
  const char *v64;
  int *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int (__cdecl **v72)(pid_t *, const char *, const posix_spawn_file_actions_t *, const posix_spawnattr_t *, char *const [], char *const []);
  int v73;
  uint64_t v74;
  xpc_object_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  xpc_object_t v79;
  uint64_t v80;
  uint64_t v81;
  int *v82;
  uint64_t v83;
  uint64_t v84;
  int *v85;
  uint64_t v86;
  uint64_t v87;
  group *v88;
  void *v89;
  int *v90;
  uint64_t v91;
  uint64_t v92;
  int *v93;
  uint64_t v94;
  uint64_t v95;
  int *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t result;
  char v104;
  uint64_t v105;
  void *v106;
  posix_spawnattr_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  rlimit v113;

  bzero(&v107, 0x4A8uLL);
  type = (uint64_t)_xpc_spawnattr_unpack_string(a1, a2, *(_DWORD *)(a1 + 4));
  if (!type)
  {
    v11 = "Unable to unpack program";
    v12 = 22;
    v13 = 742;
    goto LABEL_87;
  }
  v14 = (const char *)type;
  if ((*(_BYTE *)(a1 + 237) & 1) != 0)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.xpc.roleaccountd", 0, 2uLL);
    xpc_connection_set_event_handler(mach_service, &stru_1000087A8);
    xpc_connection_activate(mach_service);
    v30 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v30, "Path", v14);
    v31 = xpc_bundle_create(v14, 2);
    if (v31)
    {
      v32 = (void *)v31;
      property = xpc_bundle_get_property(v31, 2);
      if (property)
      {
        v34 = (const char *)sandbox_extension_issue_file("com.apple.app-sandbox.read", property, 0);
        if (v34)
        {
          v35 = (char *)v34;
          xpc_dictionary_set_string(v30, "Token", v34);
          free(v35);
        }
      }
      xpc_release(v32);
    }
    type = (uint64_t)xpc_connection_send_message_with_reply_sync(mach_service, v30);
    if (!type)
    {
      v11 = "setup_role_account no reply";
      v12 = 140;
      v13 = 629;
      goto LABEL_87;
    }
    v36 = (void *)type;
    xpc_connection_cancel(mach_service);
    type = (uint64_t)xpc_get_type(v36);
    if ((_UNKNOWN *)type == &_xpc_type_error)
    {
      v11 = "setup_role_account reply is error";
      v12 = 22;
      v13 = 634;
      goto LABEL_87;
    }
    type = (uint64_t)xpc_dictionary_get_value(v36, "Retval");
    if (!type)
    {
      v11 = "setup_role_account missing RETVAL_KEY";
      v12 = 153;
      v13 = 638;
      goto LABEL_87;
    }
    type = xpc_dictionary_get_uint64(v36, "Retval");
    if (type)
    {
      v11 = "setup_role_account failed";
      v12 = type;
      v13 = 643;
      goto LABEL_87;
    }
    type = (uint64_t)xpc_dictionary_get_string(v36, "Path");
    if (!type)
    {
      v11 = "setup_role_account missing PATH_KEY";
      v12 = 2;
      v13 = 648;
      goto LABEL_87;
    }
    type = (uint64_t)sub_10000569C((const char *)type);
    v14 = (const char *)type;
    if (!type)
    {
      v11 = "Unable to setup_role_account";
      v12 = 1;
      v13 = 748;
      goto LABEL_87;
    }
  }
  v106 = a3;
  v15 = a4;
  v16 = sub_100003E90((uint64_t)&v107, (uint64_t)v14);
  v19 = *(unsigned int *)(a1 + 208);
  if ((_DWORD)v19)
  {
    if (v19 > a2)
      sub_10000401C(v16, 22, 0, 0x29Au, 0, "Insufficient rlimit: %u > %zd", v9, v10, *(_DWORD *)(a1 + 208));
    v38 = *(unsigned int *)(a1 + 204);
    if (20 * v38 > a2)
      sub_10000401C(v16, 22, 0, 0x29Eu, 0, "Too many rlimits: %d", v9, v10, *(_DWORD *)(a1 + 204));
    if ((_DWORD)v38)
    {
      v40 = 0;
      v41 = a1 + v19 + 240;
      do
      {
        v42 = *(_QWORD *)v41;
        v43 = *(_QWORD *)(v41 + 8);
        v44 = *(unsigned __int16 *)(v41 + 16);
        v45 = *(_BYTE *)(v41 + 18);
        v46 = *(_BYTE *)(v41 + 19);
        v113.rlim_cur = 0;
        v113.rlim_max = 0;
        if (getrlimit(v44, &v113) == -1)
        {
          v85 = __error();
          sub_10000401C((uint64_t)v85, *v85, 0, 0x2ADu, 0, "getrlimit(%d)", v86, v87, v44);
        }
        if ((v45 & 1) != 0)
          v113.rlim_max = v43;
        if ((v46 & 1) != 0)
          v113.rlim_cur = v42;
        setrlimit(v44, &v113);
        v41 += 20;
        ++v40;
      }
      while (v40 < *(unsigned int *)(a1 + 204));
    }
  }
  v20 = *(_DWORD *)(a1 + 236);
  if ((v20 & 0x100) != 0)
  {
    v37 = 0;
    v22 = v15;
    v25 = v106;
    goto LABEL_61;
  }
  v21 = *(_DWORD *)(a1 + 40);
  v22 = v15;
  if ((v20 & 0x80000) != 0 && !v21)
  {
    v23 = *(_DWORD *)(a1 + 48);
    *__error() = 0;
    v24 = getpwuid(v23);
    v25 = v106;
    if (!v24)
    {
      v26 = __error();
      if (!*v26)
        sub_10000401C((uint64_t)v26, 114, 0, 0xABu, 0, "getpwuid(%d)", v27, v28, v23);
      v82 = __error();
      sub_10000401C((uint64_t)v82, *v82, 0, 0xADu, 0, "getpwuid(%d)", v83, v84, v23);
    }
    v37 = (uint64_t)v24;
    LODWORD(v109) = *(_DWORD *)(a1 + 48);
    pw_gid = v24->pw_gid;
LABEL_42:
    HIDWORD(v109) = pw_gid;
    goto LABEL_61;
  }
  v25 = v106;
  if (v21)
  {
    type = (uint64_t)_xpc_spawnattr_unpack_string(a1, a2, v21);
    v39 = type;
    if (!type)
    {
      v11 = "Unable to unpack username";
      v12 = 22;
      v13 = 281;
      goto LABEL_87;
    }
  }
  else
  {
    v39 = 0;
  }
  v48 = *(_DWORD *)(a1 + 44);
  if (v48)
  {
    type = (uint64_t)_xpc_spawnattr_unpack_string(a1, a2, v48);
    v49 = type;
    if (!type)
    {
      v11 = "Unable to unpack group";
      v12 = 22;
      v13 = 289;
      goto LABEL_87;
    }
  }
  else
  {
    v49 = 0;
  }
  if (v49)
    v50 = v39 == 0;
  else
    v50 = 0;
  if (v50)
    v39 = (uint64_t)"root";
  if (v49 | v39)
  {
    *__error() = 0;
    v51 = getpwnam((const char *)v39);
    if (!v51)
    {
      if (!*__error())
      {
        v52 = sub_100005F5C(a1, (const char *)v39, 0);
        v53 = __error();
        sub_10000401C((uint64_t)v53, 114, *v53, 0xD6u, (uint64_t)v52, "getpwnam(%s)", v54, v55, v39);
      }
      v93 = __error();
      sub_10000401C((uint64_t)v93, *v93, 0, 0xD8u, 0, "getpwnam(%s)", v94, v95, v39);
    }
    v37 = (uint64_t)v51;
    v109 = *(_QWORD *)&v51->pw_uid;
    if (v49)
    {
      *__error() = 0;
      v88 = getgrnam((const char *)v49);
      if (!v88)
      {
        if (!*__error())
        {
          v89 = sub_100005F5C(a1, 0, (const char *)v49);
          v90 = __error();
          sub_10000401C((uint64_t)v90, 114, *v90, 0xF8u, (uint64_t)v89, "getgrnam(%s)", v91, v92, v49);
        }
        v96 = __error();
        sub_10000401C((uint64_t)v96, *v96, 0, 0xFAu, 0, "getgrnam(%s)", v97, v98, v49);
      }
      pw_gid = v88->gr_gid;
      goto LABEL_42;
    }
  }
  else
  {
    v37 = 0;
  }
LABEL_61:
  sub_100003174((uint64_t)&v107, a1, a2, v37, v17, v18, v9, v10);
  sub_100002E80(&v107, a1, a2, v25, v56, v57, v58, v59);
  sub_100003020((uint64_t)&v107, v22);
  v60 = sub_100002D20((uint64_t)&v107, a1, a2, 0, 0);
  if (v60)
  {
    v99 = _os_assert_log(v60);
    v69 = _os_crash(v99);
    __break(1u);
    goto LABEL_100;
  }
  v61 = *(_DWORD *)(a1 + 104);
  if (v61)
  {
    v62 = _xpc_spawnattr_unpack_string(a1, a2, v61);
    sub_100005D78(v62);
  }
  if ((*(_BYTE *)(a1 + 237) & 0x20) != 0)
    umask(*(_WORD *)(a1 + 52));
  v63 = *(_DWORD *)(a1 + 64);
  if (v63)
  {
    v64 = _xpc_spawnattr_unpack_string(a1, a2, v63);
    if (chdir(v64) == -1)
    {
      v65 = __error();
      sub_10000401C((uint64_t)v65, *v65, 0, 0x3B1u, 0, "Unable to set current working directory. path = %s", v66, v67, (char)v64);
    }
  }
  v68 = *(_DWORD *)(a1 + 236);
  if ((v68 & 4) != 0)
  {
    v69 = setiopolicy_np(0, 0, 3);
    if (!v69)
    {
      v68 = *(_DWORD *)(a1 + 236);
      goto LABEL_72;
    }
LABEL_100:
    v100 = _os_assert_log(v69);
    v70 = _os_crash(v100);
    __break(1u);
LABEL_101:
    v101 = _os_assert_log(v70);
    v71 = _os_crash(v101);
    __break(1u);
    goto LABEL_102;
  }
LABEL_72:
  if ((v68 & 8) != 0)
  {
    v70 = setiopolicy_np(0, 2, 3);
    if (v70)
      goto LABEL_101;
  }
  if (*(_DWORD *)(a1 + 112) != 1792 || (v71 = posix_spawnattr_setprocesstype_np(&v107, 1792)) == 0)
  {
    pthread_setname_np(byte_10000C080);
    if ((*(_DWORD *)(a1 + 236) & 0x800) != 0)
      v72 = &posix_spawnp;
    else
      v72 = &_posix_spawn;
    sub_100002910(&v107, 64, 0);
    sub_100002CEC(570425384);
    type = ((uint64_t (*)(_QWORD, char *, uint64_t *, posix_spawnattr_t *, uint64_t, uint64_t))v72)(0, v110, &v108, &v107, v111, v112);
    v73 = type;
    if (type <= 0x14 && ((1 << type) & 0x102004) != 0)
    {
      type = (uint64_t)v110;
      if (*v110 == 47)
      {
        type = access(v110, 1);
        if ((_DWORD)type == -1)
        {
          v74 = *__error();
          v75 = sub_100005EE4(a1, v110, 0);
          v76 = (char)v110;
          v105 = xpc_strerror(v74);
          sub_10000401C(v105, 111, v73, 0x440u, (uint64_t)v75, "access(%s, X_OK) failed with errno %d - %s", v77, v78, v76);
        }
      }
    }
    else if ((_DWORD)type == 86)
    {
      v79 = sub_100005EE4(a1, v110, 1);
      sub_10000401C((uint64_t)v79, 111, 86, 0x424u, (uint64_t)v79, "posix_spawn(%s) EBADARCH", v80, v81, (char)v110);
    }
    v11 = "posix_spawn(%s)";
    v104 = (char)v110;
    v12 = v73;
    v13 = 1094;
LABEL_87:
    sub_10000401C(type, v12, 0, v13, 0, v11, v9, v10, v104);
  }
LABEL_102:
  v102 = _os_assert_log(v71);
  result = _os_crash(v102);
  __break(1u);
  return result;
}

const char *_xpc_spawnattr_unpack_string(uint64_t a1, unint64_t a2, unsigned int a3)
{
  const char *v3;

  if (a2 <= a3)
    return 0;
  v3 = (const char *)(a1 + a3 + 240);
  if (strnlen(v3, a2 - a3) + 1 <= a2 - a3)
    return v3;
  else
    return 0;
}

uint64_t sub_100002910(posix_spawnattr_t *a1, __int16 a2, __int16 a3)
{
  int v6;
  uint64_t result;
  __int16 v8;

  v8 = 0;
  v6 = posix_spawnattr_getflags(a1, &v8);
  if (v6)
    sub_100006068(v6);
  v8 = v8 & ~a3 | a2;
  result = posix_spawnattr_setflags(a1, v8);
  if ((_DWORD)result)
    sub_100006068(result);
  return result;
}

uint64_t start(int a1, uint64_t a2)
{
  uint64_t v4;
  _opaque_pthread_t *v5;
  uint64_t v6;
  int64_t v7;
  FILE *v8;
  const char *v9;
  uint64_t v10;
  xpc_object_t v11;
  pid_t v12;
  uint64_t data;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  const char *v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int *v23;
  uint64_t v24;
  uint64_t result;
  char v26;
  size_t length;
  xpc_object_t xdict;

  sub_100002CEC(570425380);
  if (_os_alloc_once_table[2] == -1)
    v4 = _os_alloc_once_table[3];
  else
    v4 = _os_alloc_once(&_os_alloc_once_table[2], 216, 0);
  if (setenv("PATH", "/usr/bin:/bin:/usr/sbin:/sbin", 1) != -1)
  {
    if (getppid() != 1 && (sub_100004188() & 1) == 0)
    {
      v8 = __stdoutp;
      v9 = getprogname();
      fprintf(v8, "%s cannot be run directly.\n", v9);
      exit(78);
    }
    if (a1 <= 1)
LABEL_7:
      exit(66);
    v5 = pthread_self();
    pthread_getname_np(v5, byte_10000C080, 0x80uLL);
    pthread_setname_np(*(const char **)(a2 + 8));
    qword_10000C078 = *(_QWORD *)(a2 + 8);
    sub_100003F78(0);
    if ((*(_BYTE *)(v4 + 9) & 2) != 0)
    {
      byte_10000C100 = 1;
      if (a1 <= 2)
        sub_100005B0C(22);
      v6 = sub_100005B48(*(const char **)(a2 + 8), *(const char **)(a2 + 16));
    }
    else
    {
      v6 = *(unsigned int *)(v4 + 20);
      if ((v6 + 1) < 2)
        goto LABEL_18;
      if (a1 >= 3)
      {
        v7 = (int)strtol(*(const char **)(a2 + 16), 0, 0);
        v6 = *(unsigned int *)(v4 + 20);
        goto LABEL_17;
      }
    }
    v7 = 0;
LABEL_17:
    v10 = xpc_pipe_create_from_port(v6, 0);
    v11 = xpc_dictionary_create(0, 0, 0);
    v12 = getpid();
    xpc_dictionary_set_int64(v11, "pid", v12);
    xpc_dictionary_set_BOOL(v11, "configurable", 1);
    xpc_dictionary_set_int64(v11, "hostpid", v7);
    data = xpc_pipe_simpleroutine(v10, v11);
    if ((_DWORD)data)
    {
      v17 = "controller died";
      v18 = data;
      v19 = 1250;
      goto LABEL_28;
    }
LABEL_18:
    v16 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v16, "self", 1);
    sub_100002CEC(570425372);
    xdict = 0;
    if (_xpc_service_routine(700, v16, &xdict))
      goto LABEL_7;
    sub_100002CEC(570425376);
    length = 0;
    data = (uint64_t)xpc_dictionary_get_data(xdict, "blob", &length);
    if (data)
    {
      if (length <= 0xEF)
        sub_10000401C(data, 22, 0, 0x503u, 0, "Insufficient spawnattr length: %zu < %lu", v14, v15, length);
      v20 = data;
      data = (uint64_t)xpc_dictionary_get_value(xdict, "ports");
      if (data
        && (v21 = (void *)data, data = (uint64_t)xpc_get_type((xpc_object_t)data), (_UNKNOWN *)data == &_xpc_type_array)
        && (data = xpc_array_get_count(v21)) != 0)
      {
        data = (uint64_t)xpc_dictionary_get_value(xdict, "fds");
        if (data)
        {
          v22 = (void *)data;
          data = (uint64_t)xpc_get_type((xpc_object_t)data);
          if ((_UNKNOWN *)data == &_xpc_type_array)
          {
            data = xpc_array_get_count(v22);
            if ((data & 1) == 0)
              data = sub_1000020B0(v20, length - 240, v21, v22);
          }
        }
        v17 = "fds invalid";
        v18 = 22;
        v19 = 1299;
      }
      else
      {
        v17 = "Special ports invalid";
        v18 = 22;
        v19 = 1291;
      }
    }
    else
    {
      v17 = "No spawn attr blob";
      v18 = 22;
      v19 = 1273;
    }
LABEL_28:
    sub_10000401C(data, v18, 0, v19, 0, v17, v14, v15, v26);
  }
  v23 = __error();
  v24 = _os_assert_log(*v23);
  result = _os_crash(v24);
  __break(1u);
  return result;
}

uint64_t sub_100002CEC(uint64_t a1)
{
  uint64_t v2;

  v2 = getpid();
  return kdebug_trace(a1, v2, 0, 0, 0);
}

uint64_t sub_100002D20(uint64_t a1, uint64_t a2, unint64_t a3, const void *a4, size_t a5)
{
  size_t v8;
  const void *v9;
  BOOL v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  size_t length;
  void *v17;
  size_t bytes;
  uint64_t v19;
  void *v20;
  uint64_t result;
  const char *v22;
  uint64_t v23;
  unsigned int v24;
  char v25;

  v8 = *(unsigned int *)(a2 + 12);
  if ((_DWORD)v8)
    v9 = (const void *)_xpc_spawnattr_unpack_bytes(a2, a3, *(_DWORD *)(a2 + 8), v8);
  else
    v9 = 0;
  if ((_DWORD)v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  v11 = !v10;
  if (a4 && a5)
  {
    if (v11)
    {
      v12 = (void *)sub_10000474C((uint64_t)a4, a5, (uint64_t)v9, v8);
      if (v12)
      {
        v15 = v12;
        length = xpc_data_get_length(v12);
        *(_QWORD *)(a1 + 1176) = length;
        v17 = sub_100003D90(length);
        *(_QWORD *)(a1 + 1168) = v17;
        bytes = xpc_data_get_bytes(v15, v17, 0, *(_QWORD *)(a1 + 1176));
        v19 = *(_QWORD *)(a1 + 1176);
        xpc_release(v15);
        if (bytes == v19)
        {
          v20 = *(void **)(a1 + 1168);
          a5 = *(_QWORD *)(a1 + 1176);
          goto LABEL_19;
        }
        v22 = "Unable to copy merged spawn constraints";
        v23 = a1;
        v24 = 938;
      }
      else
      {
        v22 = "Unable to merge spawn constraints";
        v23 = a1;
        v24 = 933;
      }
      sub_10000401C(v23, 22, 0, v24, 0, v22, v13, v14, v25);
    }
    v20 = sub_10000566C(a4, a5);
    *(_QWORD *)(a1 + 1168) = v20;
    *(_QWORD *)(a1 + 1176) = a5;
  }
  else
  {
    if (!v11)
      return 0;
    v20 = sub_10000566C(v9, v8);
    *(_QWORD *)(a1 + 1168) = v20;
    *(_QWORD *)(a1 + 1176) = v8;
    a5 = v8;
  }
LABEL_19:
  result = amfi_launch_constraint_set_spawnattr(a1, v20, a5);
  if ((_DWORD)result)
    sub_100006068(result);
  return result;
}

uint64_t sub_100002E80(posix_spawnattr_t *a1, uint64_t a2, uint64_t a3, xpc_object_t xarray, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  unint64_t v12;
  char v14;
  size_t v15;
  uint64_t v16;
  xpc_object_t value;
  mach_port_t right;
  uint64_t v19;
  uint64_t v20;
  mach_port_t v21;
  int v22;
  int v23;
  int v24;
  const char *v26;
  uint64_t v27;
  unsigned int v28;
  char v29;
  uint64_t v30;
  int v31;

  v8 = *(unsigned int *)(a2 + 220);
  if ((_DWORD)v8)
  {
    v11 = *(unsigned int *)(a2 + 216);
    v12 = 4 * v8;
    if (v12 > a3 - v11)
      sub_10000401C((uint64_t)a1, 22, 0, 0x31Du, 0, "No space for special ports: %zu > (%zu - %d)", a7, a8, v12);
    v14 = 0;
    v15 = 0;
    v16 = a2 + v11 + 240;
    while (1)
    {
      value = xpc_array_get_value(xarray, v15);
      right = xpc_mach_send_get_right(value);
      v21 = right;
      if (right - 1 >= 0xFFFFFFFE)
        break;
      v22 = *(_DWORD *)(v16 + 4 * v15);
      if ((v22 - 128) > 2)
      {
        if (v22 == 4)
        {
          if ((*(_BYTE *)(a2 + 239) & 4) != 0)
            v21 = 0;
          else
            v21 = right;
        }
        v24 = posix_spawnattr_setspecialport_np(a1, v21, v22);
        if (v24)
          sub_100006068(v24);
      }
      else
      {
        v31 = 0;
        v30 = 0;
        if ((v22 - 129) <= 1)
        {
          if ((v14 & 1) != 0)
          {
            v26 = "Already registered ports";
            v27 = (uint64_t)a1;
            v28 = 820;
LABEL_19:
            sub_10000401C(v27, 22, 0, v28, 0, v26, v19, v20, v29);
          }
          LODWORD(v30) = right;
          v14 = 1;
          v23 = posix_spawnattr_set_registered_ports_np(a1, &v30, 1);
          if (v23)
            sub_100006068(v23);
        }
      }
      if (++v15 >= *(unsigned int *)(a2 + 220))
        return 0;
    }
    v29 = v15;
    v26 = "Invalid special port[%zd]: %d";
    v27 = (uint64_t)a1;
    v28 = 806;
    goto LABEL_19;
  }
  return 0;
}

size_t sub_100003020(uint64_t a1, xpc_object_t xarray)
{
  size_t result;
  size_t v5;
  xpc_object_t value;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  xpc_object_t v10;
  uint64_t port;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  unsigned int v17;
  char v18;

  result = xpc_array_get_count(xarray);
  if (result)
  {
    v5 = 0;
    do
    {
      value = xpc_array_get_value(xarray, v5 + 1);
      if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_int64)
      {
        v15 = "setup_fds bad int type";
        v16 = a1;
        v17 = 864;
        goto LABEL_13;
      }
      v9 = xpc_int64_get_value(value);
      if ((v9 & 0x80000000) != 0 || getdtablesize() <= (int)v9)
      {
        getdtablesize();
        sub_10000401C(a1, 9, 0, 0x364u, 0, "setup_fds bad dest: %d table: %d", v13, v14, v9);
      }
      v10 = xpc_array_get_value(xarray, v5);
      if (xpc_get_type(v10) != (xpc_type_t)&_xpc_type_fd)
      {
        v15 = "setup_fds bad fd type";
        v16 = a1;
        v17 = 873;
LABEL_13:
        sub_10000401C(v16, 9, 0, v17, 0, v15, v7, v8, v18);
      }
      port = _xpc_fd_get_port(v10);
      v12 = posix_spawn_file_actions_add_fileportdup2_np(a1 + 8, port, v9);
      if (v12)
        sub_100006068(v12);
      v5 += 2;
    }
    while (v5 < xpc_array_get_count(xarray));
    return 0;
  }
  return result;
}

uint64_t sub_100003174(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v12;
  unsigned int v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  int v17;
  int v18;
  int v19;
  cpu_type_t *v20;
  cpu_type_t *v21;
  qos_class_t v22;
  int v23;
  int v24;
  int v25;
  const char *v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  unsigned int v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  unsigned int v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  int v55;
  const char *v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  const char *v60;
  int v61;
  uint64_t v62;
  const char **v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  const char **v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  int v112;
  unsigned int v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  xpc_object_t v120;
  uint64_t v121;
  unint64_t v122;
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  BOOL v127;
  char *v128;
  unsigned int v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  unsigned int v135;
  unsigned int v136;
  const char *v137;
  char *v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  int v143;
  unsigned int v144;
  const char *v145;
  char *v146;
  int v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  int v151;
  unsigned int v152;
  const char *v153;
  char *v154;
  int v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  int v159;
  int v161;
  int v162;
  const char *v163;
  const char *v164;
  const char *v165;
  char __str[1024];

  v8 = a1;
  if (!*(_QWORD *)(a1 + 1136))
  {
    v26 = "Missing program";
    v27 = 22;
    v28 = 580;
    goto LABEL_25;
  }
  v12 = *(unsigned __int8 *)(a2 + 108);
  v13 = *(_DWORD *)(a2 + 236);
  if (setsid() == -1)
    sub_100006108();
  if (v12)
    v14 = 16512;
  else
    v14 = 0x4000;
  v15 = *(_DWORD *)(a2 + 236);
  if (MEMORY[0xFFFFF4084])
    v16 = (v15 >> 6) & 0x100;
  else
    v16 = 0;
  v17 = *(_DWORD *)(a2 + 236);
  if ((v15 & 0x8000) != 0)
  {
    v18 = posix_spawnattr_disable_ptr_auth_a_keys_np(v8, 0);
    if (v18)
      sub_100006068(v18);
    v17 = *(_DWORD *)(a2 + 236);
  }
  if ((v17 & 0x40000) != 0)
  {
    v19 = posix_spawnattr_set_use_sec_transition_shims_np(v8, 1);
    if (v19)
      sub_100006068(v19);
    v17 = *(_DWORD *)(a2 + 236);
  }
  sub_100002910((posix_spawnattr_t *)v8, (v13 >> 8) & 0x200 | v14 | v16 | (v15 >> 22 << 15) | HIWORD(v17) & 0x800, 0);
  v20 = (cpu_type_t *)_xpc_spawnattr_binprefs_unpack(a2, a3);
  if (v20)
  {
    v21 = v20;
    xpc_binprefs_set_psattr(v20, (posix_spawnattr_t *)v8);
    free(v21);
  }
  v22 = *(_DWORD *)(a2 + 200);
  if (v22)
  {
    v23 = posix_spawnattr_set_qos_class_np((posix_spawnattr_t *)v8, v22);
    if (v23)
      sub_100006068(v23);
  }
  v24 = *(_DWORD *)(a2 + 236);
  if ((v24 & 0x200000) != 0)
  {
    if (*(_BYTE *)(a2 + 228) != 100 || *(_DWORD *)(a2 + 224))
    {
      v29 = posix_spawnattr_setcpumonitor(v8);
      if (v29)
        sub_100006068(v29);
    }
  }
  else if ((v24 & 2) != 0)
  {
    v30 = posix_spawnattr_setcpumonitor_default(v8);
    if (v30)
      sub_100006068(v30);
  }
  else if ((v24 & 1) == 0)
  {
    v25 = posix_spawnattr_setcpumonitor_default(v8);
    if (v25)
      sub_100006068(v25);
  }
  v31 = posix_spawnattr_setjetsam_ext(v8, *(__int16 *)(a2 + 120), *(unsigned int *)(a2 + 124), *(unsigned int *)(a2 + 128), *(unsigned int *)(a2 + 132));
  if (v31)
    sub_100006068(v31);
  v32 = posix_spawnattr_set_threadlimit_ext(v8, *(unsigned int *)(a2 + 136));
  if (v32)
    sub_100006068(v32);
  v33 = posix_spawnattr_set_max_addr_np(v8, *(_QWORD *)(a2 + 140));
  if (v33)
    sub_100006068(v33);
  v34 = posix_spawnattr_set_portlimits_ext(v8, *(unsigned int *)(a2 + 148), *(unsigned int *)(a2 + 152));
  if (v34)
    sub_100006068(v34);
  v35 = posix_spawnattr_set_filedesclimit_ext(v8, *(unsigned int *)(a2 + 156), *(unsigned int *)(a2 + 160));
  if (v35)
    sub_100006068(v35);
  v36 = posix_spawnattr_set_kqworklooplimit_ext(v8, *(unsigned int *)(a2 + 164), *(unsigned int *)(a2 + 168));
  if (v36)
    sub_100006068(v36);
  if ((*(_BYTE *)(a2 + 239) & 2) != 0)
  {
    v37 = posix_spawnattr_set_max_addr_np(v8, -1);
    if (v37)
      sub_100006068(v37);
  }
  v38 = posix_spawnattr_set_crash_behavior_np(v8, *(unsigned __int8 *)(a2 + 176));
  if (v38)
    sub_100006068(v38);
  v39 = posix_spawnattr_set_crash_behavior_deadline_np(v8, *(_QWORD *)(a2 + 180), 0);
  if (v39)
    sub_100006068(v39);
  v40 = posix_spawnattr_set_launch_type_np(v8, *(unsigned __int8 *)(a2 + 196));
  if (v40)
    sub_100006068(v40);
  v41 = posix_spawnattr_set_crash_count_np(v8, *(unsigned int *)(a2 + 188), *(unsigned int *)(a2 + 192));
  if (v41)
    sub_100006068(v41);
  v42 = posix_spawnattr_set_darwin_role_np(v8, *(unsigned int *)(a2 + 116));
  if (v42)
    sub_100006068(v42);
  v43 = *(unsigned __int8 *)(a2 + 229);
  if (v43 == 1)
  {
    v45 = posix_spawnattr_setdataless_iopolicy_np(v8, 1);
    if (v45)
      sub_100006068(v45);
  }
  else if (v43 == 2)
  {
    v44 = posix_spawnattr_setdataless_iopolicy_np(v8, 2);
    if (v44)
      sub_100006068(v44);
  }
  v46 = *(_DWORD *)(a2 + 80);
  if (!v46)
  {
    v51 = *(_DWORD *)(a2 + 84);
    if (!v51)
      goto LABEL_64;
    v50 = 0;
    goto LABEL_55;
  }
  v47 = _xpc_spawnattr_unpack_string(a2, a3, v46);
  if (!v47)
  {
    v56 = "Unable to unpack container_id";
    v57 = v8;
    v58 = 126;
    goto LABEL_63;
  }
  v50 = v47;
  v51 = *(_DWORD *)(a2 + 84);
  if (v51)
  {
LABEL_55:
    v53 = _xpc_spawnattr_unpack_string(a2, a3, v51);
    if (v53)
    {
      v54 = v53;
      v52 = v8 + 16;
      sandbox_spawnattrs_init(v8 + 16);
      if (sandbox_spawnattrs_setprofilename(v8 + 16, v54) == -1)
        sub_100006108();
      if (!v50)
        goto LABEL_59;
      goto LABEL_58;
    }
    v56 = "Unable to unpack sandbox profile";
    v57 = v8;
    v58 = 135;
LABEL_63:
    sub_10000401C(v57, 22, 0, v58, 0, v56, v48, v49, v162);
  }
  v52 = v8 + 16;
  sandbox_spawnattrs_init(v8 + 16);
LABEL_58:
  if (sandbox_spawnattrs_setcontainer(v52, v50) == -1)
    sub_100006108();
LABEL_59:
  v55 = posix_spawnattr_setmacpolicyinfo_np(v8, "Sandbox", v52, 1104);
  if (v55)
    sub_100006068(v55);
LABEL_64:
  v59 = *(_DWORD *)(a2 + 88);
  if (v59)
  {
    v60 = _xpc_spawnattr_unpack_string(a2, a3, v59);
    v61 = posix_spawnattr_set_subsystem_root_path_np(v8, v60);
    if (v61)
      sub_100006068(v61);
  }
  v62 = *(unsigned int *)(a2 + 16);
  if ((_DWORD)v62)
  {
    v63 = (const char **)sub_100003D90(8 * v62 + 8);
    *(_QWORD *)(v8 + 1144) = v63;
    if (!_xpc_spawnattr_unpack_strings(a2, a3, *(_DWORD *)(a2 + 20), v63, *(unsigned int *)(a2 + 16)))
    {
      v79 = "Unable to unpack argv";
      v80 = v8;
      v81 = 537;
      goto LABEL_76;
    }
    v66 = (_QWORD *)(*(_QWORD *)(v8 + 1144) + 8 * *(unsigned int *)(a2 + 16));
  }
  else
  {
    v67 = sub_100003D90(0x10uLL);
    *(_QWORD *)(v8 + 1144) = v67;
    *v67 = *(_QWORD *)(v8 + 1136);
    v66 = v67 + 1;
  }
  *v66 = 0;
  v68 = (const char **)sub_100003D90(8 * *(unsigned int *)(a2 + 24) + 56);
  *(_QWORD *)(v8 + 1160) = v68;
  v72 = *(unsigned int *)(a2 + 24);
  if ((_DWORD)v72)
  {
    if (_xpc_spawnattr_unpack_strings(a2, a3, *(_DWORD *)(a2 + 28), v68, v72))
    {
      *(_QWORD *)(v8 + 1152) = *(unsigned int *)(a2 + 24);
      goto LABEL_73;
    }
    v79 = "Unable to unpack environment";
    v80 = v8;
    v81 = 565;
LABEL_76:
    sub_10000401C(v80, 22, 0, v81, 0, v79, v64, v65, v162);
  }
LABEL_73:
  sub_100003D2C((_QWORD *)v8, "XXXXXXXX%s=%llx", v69, v70, v72, v71, v64, v65, (char)"XPC_FLAGS");
  if (*(_DWORD *)(v8 + 1128) != -101)
  {
    if (!a4)
    {
      v110 = "Unable to setup identify";
      v111 = v8;
      v112 = 22;
      v113 = 354;
      goto LABEL_92;
    }
    *(_QWORD *)(v8 + 1120) = sub_100003D2C((_QWORD *)v8, "XXXXXXXX%s=%s", v73, v74, v75, v76, v77, v78, (char)"LOGNAME")
                           + 8;
    sub_100003D2C((_QWORD *)v8, "XXXXXXXX%s=%s", v82, v83, v84, v85, v86, v87, (char)"USER");
    sub_100003D2C((_QWORD *)v8, "XXXXXXXX%s=%s", v88, v89, v90, v91, v92, v93, (char)"HOME");
    sub_100003D2C((_QWORD *)v8, "XXXXXXXX%s=%s", v94, v95, v96, v97, v98, v99, (char)"SHELL");
    v106 = *(_DWORD *)(v8 + 1128);
    if (v106 >= 0x1F5 && v106 != -2)
      sub_100003D2C((_QWORD *)v8, "XXXXXXXX%s=%s/tmp", v100, v101, v102, v103, v104, v105, (char)"TMPDIR");
    if (setlogin(*(const char **)(v8 + 1120)))
    {
      v107 = *__error();
      sub_10000401C(v8, v107, 0, 0x17Au, 0, "setlogin(%s)", v108, v109, *(_QWORD *)(v8 + 1120));
    }
    if (setgid(*(_DWORD *)(v8 + 1132)))
    {
      v114 = *__error();
      sub_10000401C(v8, v114, 0, 0x181u, 0, "setgid(%d)", v115, v116, *(_DWORD *)(v8 + 1132));
    }
    if ((*(_BYTE *)(a2 + 237) & 0x10) == 0)
    {
      v117 = initgroups(*(const char **)(v8 + 1120), *(_DWORD *)(v8 + 1132));
      if (v117)
        sub_10000401C(v8, v117, 0, 0x18Bu, 0, "initgroups(%s, %d)", v118, v119, *(_QWORD *)(v8 + 1120));
    }
    if (setuid(*(_DWORD *)(v8 + 1128)))
    {
      v112 = *__error();
      v162 = *(_DWORD *)(v8 + 1128);
      v110 = "setuid(%d)";
      v111 = v8;
      v113 = 400;
LABEL_92:
      sub_10000401C(v111, v112, 0, v113, 0, v110, v77, v78, v162);
    }
  }
  v120 = xpc_dictionary_create(0, 0, 0);
  if (*(_QWORD *)(v8 + 1152))
  {
    v121 = 0;
    v122 = 0;
    do
    {
      v123 = *(char **)(*(_QWORD *)(v8 + 1160) + 8 * v122);
      v124 = strchr(v123, 61);
      if (v124)
        v127 = v124 == v123;
      else
        v127 = 1;
      if (v127)
        sub_10000401C(v8, 22, 0, 0x1D0u, 0, "Invalid environment[%zd]: %s", v125, v126, v122);
      v128 = sub_100003CD4(v123, v124 - v123);
      if (!xpc_dictionary_get_value(v120, v128))
      {
        xpc_dictionary_set_BOOL(v120, v128, 1);
        *(_QWORD *)(*(_QWORD *)(v8 + 1160) + 8 * v121++) = v123;
      }
      free(v128);
      ++v122;
    }
    while (v122 < *(_QWORD *)(v8 + 1152));
  }
  else
  {
    v121 = 0;
  }
  xpc_release(v120);
  *(_QWORD *)(v8 + 1152) = v121;
  *(_QWORD *)(*(_QWORD *)(v8 + 1160) + 8 * v121) = 0;
  v129 = *(_DWORD *)(a2 + 64);
  if (v129)
  {
    v132 = _xpc_spawnattr_unpack_string(a2, a3, v129);
    if (!v132)
    {
      v133 = "Unable to unpack cwd";
      v134 = v8;
      v135 = 224;
      goto LABEL_138;
    }
  }
  else
  {
    v132 = "/";
  }
  v136 = *(_DWORD *)(a2 + 68);
  if (v136)
  {
    v137 = _xpc_spawnattr_unpack_string(a2, a3, v136);
    if (!v137)
    {
      v133 = "Unable to unpack stdin";
      v134 = v8;
      v135 = 241;
      goto LABEL_138;
    }
    v138 = (char *)v137;
    bzero(__str, 0x400uLL);
    if (*v138 != 47)
    {
      v163 = v138;
      v138 = __str;
      snprintf(__str, 0x400uLL, "%s/%s", v132, v163);
    }
    v139 = sub_100005A50(v138);
    if (v139)
      sub_10000401C(v8, v139, 0, 0xFDu, 0, "Unable to create stdin directory (%s)", v140, v141, (char)v138);
    v143 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 0, v138, 131584, 0x1B6u);
    if (v143)
      sub_100006068(v143);
  }
  else
  {
    v142 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 0, "/dev/null", 0x20000, 0x1B6u);
    if (v142)
      sub_100006068(v142);
  }
  v144 = *(_DWORD *)(a2 + 72);
  if (v144)
  {
    v145 = _xpc_spawnattr_unpack_string(a2, a3, v144);
    if (!v145)
    {
      v133 = "Unable to unpack stdout";
      v134 = v8;
      v135 = 268;
      goto LABEL_138;
    }
    v146 = (char *)v145;
    bzero(__str, 0x400uLL);
    if (*v146 != 47)
    {
      v164 = v146;
      v146 = __str;
      snprintf(__str, 0x400uLL, "%s/%s", v132, v164);
    }
    v147 = sub_100005A50(v146);
    if (v147)
      sub_10000401C(v8, v147, 0, 0x118u, 0, "Unable to create stdout directory (%s)", v148, v149, (char)v146);
    v151 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 1, v146, 131594, 0x1B6u);
    if (v151)
      sub_100006068(v151);
  }
  else
  {
    v150 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 1, "/dev/null", 131074, 0x1B6u);
    if (v150)
      sub_100006068(v150);
  }
  v152 = *(_DWORD *)(a2 + 76);
  if (v152)
  {
    v153 = _xpc_spawnattr_unpack_string(a2, a3, v152);
    if (v153)
    {
      v154 = (char *)v153;
      bzero(__str, 0x400uLL);
      if (*v154 != 47)
      {
        v165 = v154;
        v154 = __str;
        snprintf(__str, 0x400uLL, "%s/%s", v132, v165);
      }
      v155 = sub_100005A50(v154);
      if (v155)
        sub_10000401C(v8, v155, 0, 0x133u, 0, "Unable to create stderr directory (%s)", v156, v157, (char)v154);
      v161 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 2, v154, 131594, 0x1B6u);
      if (v161)
        sub_100006068(v161);
      goto LABEL_139;
    }
    v133 = "Unable to unpack stderr";
    v134 = v8;
    v135 = 295;
LABEL_138:
    sub_10000401C(v134, 22, 0, v135, 0, v133, v130, v131, v162);
  }
  v158 = posix_spawn_file_actions_addopen((posix_spawn_file_actions_t *)(v8 + 8), 2, "/dev/null", 131074, 0x1B6u);
  if (v158)
    sub_100006068(v158);
LABEL_139:
  if ((*(_BYTE *)(a2 + 238) & 1) != 0)
  {
    v159 = *(_DWORD *)(v8 + 1128);
    if (!v159 || v159 == -101)
    {
      v26 = "extensions cannot run as root";
      a1 = v8;
      v27 = 1;
      v28 = 769;
LABEL_25:
      sub_10000401C(a1, v27, 0, v28, 0, v26, a7, a8, v162);
    }
  }
  return 0;
}

char *sub_100003CD4(const char *a1, size_t a2)
{
  size_t v2;
  const char *v3;
  char *result;
  int v5;

  v2 = a2;
  v3 = a1;
  while (1)
  {
    result = strndup(a1, a2);
    if (result)
      break;
    if (*__error() != 12)
    {
      v5 = *__error();
      if (v5)
        sub_100006068(v5);
    }
    sub_100005650();
    a1 = v3;
    a2 = v2;
  }
  return result;
}

char *sub_100003D2C(_QWORD *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;
  char *result;
  uint64_t v12;
  uint64_t v13;
  char *v14[2];

  v14[0] = 0;
  v14[1] = &a9;
  vasprintf(v14, a2, &a9);
  v10 = v14[0];
  *(_QWORD *)v14[0] = a1[148];
  a1[148] = v10;
  result = v10 + 8;
  v12 = a1[145];
  v13 = a1[144];
  a1[144] = v13 + 1;
  *(_QWORD *)(v12 + 8 * v13) = result;
  return result;
}

void *sub_100003D90(size_t size)
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
        sub_100006030(v3);
    }
  }
  while (sub_100005650());
  return v2;
}

const char *_xpc_spawnattr_unpack_strings(uint64_t a1, unint64_t a2, unsigned int a3, const char **a4, uint64_t a5)
{
  uint64_t v5;
  unsigned int v7;
  uint64_t v9;
  const char **i;
  const char *v11;
  size_t v12;

  if (a3 >= a2)
    return 0;
  v5 = a5;
  if (!a5)
    return *a4;
  v7 = a3;
  v9 = a1 + 240;
  for (i = a4; ; ++i)
  {
    v11 = (const char *)(v9 + v7);
    v12 = strnlen(v11, a2 - v7);
    if (v12 + 1 > a2 - v7)
      break;
    v7 += v12 + 1;
    *i = v11;
    if (!--v5)
      return *a4;
  }
  return 0;
}

uint64_t sub_100003E90(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t result;

  bzero((void *)a1, 0x4A8uLL);
  *(_QWORD *)(a1 + 1128) = 0x6400000064;
  v4 = posix_spawnattr_init((posix_spawnattr_t *)a1);
  if (v4)
    sub_100006068(v4);
  result = posix_spawn_file_actions_init((posix_spawn_file_actions_t *)(a1 + 8));
  if ((_DWORD)result)
    sub_100006068(result);
  *(_QWORD *)(a1 + 1136) = a2;
  return result;
}

uint64_t _xpc_spawnattr_binprefs_unpack(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int *v7;

  v2 = *(unsigned int *)(a1 + 32);
  if (!(_DWORD)v2 || a2 - (unint64_t)*(unsigned int *)(a1 + 36) < 8 * v2)
    return 0;
  xpc_binprefs_alloc();
  v4 = v5;
  if (*(_DWORD *)(a1 + 32))
  {
    v6 = 0;
    v7 = (int *)(*(unsigned int *)(a1 + 36) + a1 + 244);
    do
    {
      xpc_binprefs_add(v4, *(v7 - 1), *v7);
      ++v6;
      v7 += 2;
    }
    while (v6 < *(unsigned int *)(a1 + 32));
  }
  return v4;
}

int64_t _xpc_service_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return sub_100001EA0(a1, a2, a3, 0, 0);
}

void *sub_100003F78(int a1)
{
  void *result;

  if (a1)
  {
    if (dlopen("/usr/lib/system/libsystem_notify.dylib", 1))
      notify_set_options(0x8000000);
    if (!dlopen("/usr/lib/system/libsystem_info.dylib", 1))
    {
LABEL_8:
      result = dlopen("/usr/lib/system/libsystem_trace.dylib", 1);
      if (!result)
        return result;
      return (void *)os_trace_set_mode(256);
    }
  }
  else
  {
    notify_set_options(0x8000000);
  }
  si_search_module_set_flags("mdns", 1);
  si_search_module_set_flags("ds", 1);
  if (a1)
    goto LABEL_8;
  return (void *)os_trace_set_mode(256);
}

void sub_10000401C(uint64_t a1, int a2, int a3, unsigned int a4, uint64_t a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  xpc_object_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  xpc_object_t v19[2];
  char *string[2];

  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v15, "self", 1);
  xpc_dictionary_set_int64(v15, "code", a2);
  xpc_dictionary_set_int64(v15, "subcode", a3);
  xpc_dictionary_set_uint64(v15, "line", a4);
  xpc_dictionary_set_BOOL(v15, "setup-event", a5 != 0);
  string[0] = 0;
  string[1] = &a9;
  vasprintf(string, a6, &a9);
  v16 = 0;
  if (string[0])
  {
    xpc_dictionary_set_string(v15, "string", string[0]);
    v16 = string[0];
  }
  free(v16);
  string[0] = 0;
  v17 = dyld_image_header_containing_address(v9);
  v18 = v17;
  if (v17)
  {
    v19[0] = 0;
    v19[1] = 0;
    _dyld_get_image_uuid(v17, v19);
    xpc_dictionary_set_uuid(v15, "uuid", (const unsigned __int8 *)v19);
  }
  xpc_dictionary_set_uint64(v15, "pc", v9 - v18);
  v19[0] = 0;
  _xpc_service_routine(701, v15, v19);
  if (a5)
    xpc_set_event("com.apple.launchd.helper", qword_10000C078, a5);
  exit(78);
}

uint64_t sub_100004188()
{
  if (qword_10000C070 != -1)
    dispatch_once(&qword_10000C070, &stru_100008620);
  return byte_10000C068;
}

void sub_1000041C8(id a1)
{
  pid_t v1;

  v1 = getpid();
  byte_10000C068 = sub_1000041E8(v1);
}

uint64_t sub_1000041E8(int a1)
{
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;

  v3 = 0u;
  v4 = 0u;
  memset(v2, 0, sizeof(v2));
  if (!sub_100005FF4(a1, v2))
    return (v3 >> 1) & 1;
  _os_assumes_log(0);
  return 0;
}

uint64_t sub_10000426C()
{
  return qword_10000C030;
}

uint64_t sub_100004278(void *a1)
{
  size_t count;
  size_t v3;
  size_t i;
  xpc_object_t value;
  xpc_object_t v6;
  const char *string_ptr;
  const char *v8;
  uint64_t v9;
  _QWORD applier[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  xpc_object_t empty;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  empty = 0;
  empty = xpc_array_create_empty();
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 0x40000000;
  applier[2] = sub_1000043EC;
  applier[3] = &unk_100008648;
  applier[4] = &v12;
  xpc_dictionary_apply(a1, applier);
  count = xpc_array_get_count((xpc_object_t)v13[3]);
  do
  {
    if (count < 2)
      break;
    v3 = 0;
    for (i = 1; i != count; ++i)
    {
      value = xpc_array_get_value((xpc_object_t)v13[3], i - 1);
      v6 = xpc_array_get_value((xpc_object_t)v13[3], i);
      string_ptr = xpc_string_get_string_ptr(value);
      v8 = xpc_string_get_string_ptr(v6);
      if (strcmp(string_ptr, v8) >= 1)
      {
        xpc_retain(value);
        xpc_array_set_value((xpc_object_t)v13[3], i - 1, v6);
        xpc_array_set_value((xpc_object_t)v13[3], i, value);
        xpc_release(value);
        v3 = i;
      }
    }
    count = v3;
  }
  while (v3);
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t sub_1000043EC(uint64_t a1, char *string)
{
  xpc_array_set_string(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL, string);
  return 1;
}

xpc_object_t sub_100004418(int64_t a1, int64_t a2, xpc_object_t object)
{
  xpc_object_t empty;

  if (object && xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
    return 0;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "vers", a1);
  xpc_dictionary_set_int64(empty, "comp", 1);
  xpc_dictionary_set_int64(empty, "ccat", a2);
  if (object)
    xpc_dictionary_set_value(empty, "reqs", object);
  return empty;
}

size_t sub_1000044C4(void *a1)
{
  xpc_object_t empty;
  xpc_object_t v3;
  size_t result;
  void **v5;
  size_t count;
  char *v7;
  size_t v8;
  size_t v9;
  void **v10;
  size_t length[5];
  char v12;

  if (xpc_get_type(a1) != (xpc_type_t)&_xpc_type_dictionary)
    return 0;
  empty = xpc_array_create_empty();
  if (sub_1000048E0(a1, empty))
  {
    xpc_release(empty);
    return 0;
  }
  if (!empty)
    return 0;
  result = xpc_array_get_count(empty);
  if (!(result >> 59))
  {
    v5 = (void **)sub_100003D90(32 * result);
    length[0] = (size_t)_NSConcreteStackBlock;
    length[1] = 0x40000000;
    length[2] = (size_t)sub_100004F3C;
    length[3] = (size_t)&unk_1000086B8;
    length[4] = (size_t)v5;
    xpc_array_apply(empty, length);
    count = xpc_array_get_count(empty);
    length[0] = 0;
    v3 = 0;
    if (CESizeSerialization(v5, count, length) == kCENoError)
    {
      v7 = (char *)sub_100003D90(length[0]);
      v12 = 1;
      if (CESerializeWithOptions(&unk_1000086D8, &v12, v5, count, v7, &v7[length[0]]) == kCENoError)
        v3 = xpc_data_create(v7, length[0]);
      else
        v3 = 0;
      free(v7);
    }
    v8 = xpc_array_get_count(empty);
    if (v8)
    {
      v9 = v8;
      v10 = v5 + 1;
      do
      {
        if (*(v10 - 1) == (void *)3)
          free(*v10);
        v10 += 4;
        --v9;
      }
      while (v9);
    }
    free(v5);
    xpc_release(empty);
    return (size_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000467C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;
  __int128 v13;
  uint64_t v14;

  v13 = 0uLL;
  v14 = 0;
  v12 = 1;
  v2 = CEValidateWithOptions(&unk_1000086D8, &v12, &v13, a1, a1 + a2);
  result = 0;
  if (v2 == kCENoError)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = v13;
    *(_QWORD *)&v5 = v14;
    if (CEAcquireUnmanagedContext(&unk_1000086D8, &v4, &v8) == kCENoError)
    {
      v4 = v8;
      v5 = v9;
      v6 = v10;
      v7 = v11;
      return sub_100005080(&v4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

size_t sub_10000474C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  xpc_object_t v6;
  void *v7;
  xpc_object_t v8;
  void *v9;
  size_t v10;
  xpc_object_t empty;
  xpc_object_t v12;
  xpc_object_t v13;
  __int128 v15;

  *((_QWORD *)&v15 + 1) = 0;
  v6 = sub_10000486C(a1, a2, (int64_t *)&v15 + 1);
  if (!v6)
    return 0;
  v7 = v6;
  *(_QWORD *)&v15 = 0;
  v8 = sub_10000486C(a3, a4, (int64_t *)&v15);
  if (v8)
  {
    v9 = v8;
    if (v15 == 0)
    {
      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(empty, "$and", v9);
      v12 = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(v12, "$and", v7);
      xpc_dictionary_set_value(v12, "$or", empty);
      xpc_release(empty);
      v13 = sub_100004418(1, 0, v12);
      xpc_release(v12);
      v10 = sub_1000044C4(v13);
      xpc_release(v13);
    }
    else
    {
      v10 = 0;
    }
    xpc_release(v7);
  }
  else
  {
    v10 = 0;
    v9 = v7;
  }
  xpc_release(v9);
  return v10;
}

xpc_object_t sub_10000486C(uint64_t a1, uint64_t a2, int64_t *a3)
{
  void *v4;
  void *v5;
  xpc_object_t value;
  xpc_object_t v7;

  v4 = (void *)sub_10000467C(a1, a2);
  if (!v4)
    return 0;
  v5 = v4;
  value = xpc_dictionary_get_value(v4, "reqs");
  v7 = value;
  if (value)
    xpc_retain(value);
  *a3 = xpc_dictionary_get_int64(v5, "ccat");
  xpc_release(v5);
  return v7;
}

uint64_t sub_1000048E0(void *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  _QWORD applier[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t bytes;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 4;
  v4 = (void *)sub_100004278(a1);
  v14 = 0;
  v15 = 0;
  bytes = 7;
  v13 = 0;
  xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 0x40000000;
  applier[2] = sub_1000049E0;
  applier[3] = &unk_100008670;
  applier[5] = a2;
  applier[6] = a1;
  applier[4] = &v8;
  xpc_array_apply(v4, applier);
  xpc_release(v4);
  v5 = *((unsigned int *)v9 + 6);
  if (!(_DWORD)v5)
  {
    v14 = 0;
    v15 = 0;
    bytes = 8;
    v13 = 0;
    xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
    v5 = *((unsigned int *)v9 + 6);
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t sub_1000049E0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  const char *string_ptr;
  void *v7;
  const char *v8;
  xpc_object_t value;
  uint64_t shared_cache_range;
  uint64_t v11;
  void *v12;
  uint64_t result;
  const char *v14;
  const char *v15;
  uint64_t v16;
  _QWORD v17[4];
  uint64_t v18;
  uint64_t v19;
  uint64_t bytes;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *(void **)(a1 + 40);
  v22 = 0;
  v23 = 0;
  bytes = 5;
  v21 = 0;
  xpc_array_set_data(v5, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
  string_ptr = xpc_string_get_string_ptr(a3);
  v17[3] = 0;
  v17[0] = 3;
  v17[1] = sub_10000569C(string_ptr);
  v17[2] = xpc_string_get_length(a3);
  xpc_array_set_data(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v17, 0x20uLL);
  v7 = *(void **)(a1 + 48);
  v8 = xpc_string_get_string_ptr(a3);
  value = xpc_dictionary_get_value(v7, v8);
  if (value)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sub_100004C14(value, *(void **)(a1 + 40));
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      bytes = 0;
      v21 = 0;
      v18 = 0;
      v19 = 0;
      if ((_dyld_get_image_uuid(&_mh_execute_header, &bytes) & 1) == 0)
      {
        bytes = 0;
        v21 = 0;
      }
      if ((_dyld_get_shared_cache_uuid(&v18) & 1) != 0)
      {
        v16 = 0;
        shared_cache_range = _dyld_get_shared_cache_range(&v16);
      }
      else
      {
        shared_cache_range = 0;
        v18 = 0;
        v19 = 0;
      }
      v14 = xpc_string_get_string_ptr(a3);
      _os_log_simple(&_mh_execute_header, &bytes, &v18, shared_cache_range, 16, 0, "failed to serialized value for key: %s", v14);
      return 0;
    }
    else
    {
      v12 = *(void **)(a1 + 40);
      v22 = 0;
      v23 = 0;
      bytes = 6;
      v21 = 0;
      xpc_array_set_data(v12, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
      return 1;
    }
  }
  else
  {
    bytes = 0;
    v21 = 0;
    v18 = 0;
    v19 = 0;
    if ((_dyld_get_image_uuid(&_mh_execute_header, &bytes) & 1) == 0)
    {
      bytes = 0;
      v21 = 0;
    }
    if ((_dyld_get_shared_cache_uuid(&v18) & 1) != 0)
    {
      v16 = 0;
      v11 = _dyld_get_shared_cache_range(&v16);
    }
    else
    {
      v11 = 0;
      v18 = 0;
      v19 = 0;
    }
    v15 = xpc_string_get_string_ptr(a3);
    _os_log_simple(&_mh_execute_header, &bytes, &v18, v11, 16, 0, "no value for key: %s", v15);
    result = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
  }
  return result;
}

uint64_t sub_100004C14(void *a1, void *a2)
{
  xpc_type_t type;
  const _xpc_type_s *v5;
  uint64_t shared_cache_range;
  size_t length;
  uint64_t v8;
  const char *name;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t bytes;
  int64_t string_ptr;
  BOOL (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  uint64_t *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  type = xpc_get_type(a1);
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    v18 = 0;
    bytes = 2;
    string_ptr = (int64_t)xpc_string_get_string_ptr(a1);
    length = xpc_string_get_length(a1);
LABEL_12:
    v17 = (BOOL (*)(uint64_t, uint64_t, uint64_t))length;
LABEL_16:
    LOBYTE(v18) = 0;
    xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
    return 0;
  }
  v5 = type;
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    bytes = 4;
    v18 = 0;
    string_ptr = xpc_int64_get_value(a1);
LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    bytes = 1;
    v18 = 0;
    string_ptr = xpc_BOOL_get_value(a1);
    goto LABEL_15;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    v18 = 0;
    bytes = 9;
    string_ptr = (int64_t)xpc_data_get_bytes_ptr(a1);
    length = xpc_data_get_length(a1);
    goto LABEL_12;
  }
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (type == (xpc_type_t)&_xpc_type_array)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2000000000;
      v14 = 4;
      v17 = 0;
      v18 = 0;
      bytes = 5;
      string_ptr = 0;
      xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
      bytes = (uint64_t)_NSConcreteStackBlock;
      string_ptr = 0x40000000;
      v17 = sub_100004EF4;
      v18 = &unk_100008698;
      v19 = &v11;
      v20 = a2;
      xpc_array_apply(a1, &bytes);
      v8 = *((unsigned int *)v12 + 6);
      if (!(_DWORD)v8)
      {
        v23 = 0;
        v24 = 0;
        v21 = 6;
        v22 = 0;
        xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &v21, 0x20uLL);
        v8 = *((unsigned int *)v12 + 6);
      }
      _Block_object_dispose(&v11, 8);
    }
    else
    {
      bytes = 0;
      string_ptr = 0;
      v21 = 0;
      v22 = 0;
      if ((_dyld_get_image_uuid(&_mh_execute_header, &bytes) & 1) == 0)
      {
        bytes = 0;
        string_ptr = 0;
      }
      if ((_dyld_get_shared_cache_uuid(&v21) & 1) != 0)
      {
        v11 = 0;
        shared_cache_range = _dyld_get_shared_cache_range(&v11);
      }
      else
      {
        shared_cache_range = 0;
        v21 = 0;
        v22 = 0;
      }
      name = xpc_type_get_name(v5);
      _os_log_simple(&_mh_execute_header, &bytes, &v21, shared_cache_range, 16, 0, "unsupported type: %s", name);
      return 1;
    }
    return v8;
  }
  return sub_1000048E0(a1, a2);
}

BOOL sub_100004EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sub_100004C14(a3, *(_QWORD *)(a1 + 40));
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t sub_100004F3C(uint64_t a1, uint64_t a2, xpc_object_t xdata)
{
  _OWORD *v3;
  _OWORD *bytes_ptr;
  __int128 v5;

  v3 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 32 * a2);
  bytes_ptr = xpc_data_get_bytes_ptr(xdata);
  v5 = bytes_ptr[1];
  *v3 = *bytes_ptr;
  v3[1] = v5;
  return 1;
}

uint64_t sub_100004F70()
{
  uint64_t v0;

  if (*((_QWORD *)&_os_alloc_once_table + 2) == -1)
    v0 = *((_QWORD *)&_os_alloc_once_table + 3);
  else
    v0 = _os_alloc_once((char *)&_os_alloc_once_table + 16, 216, 0);
  if (*(_BYTE *)(v0 + 41))
  {
    if (*(_QWORD *)(v0 + 48) != -1)
      dispatch_once_f((dispatch_once_t *)(v0 + 48), (void *)(v0 + 56), (dispatch_function_t)sub_100004FF4);
  }
  else
  {
    sub_100004FF4((task_info_t)(v0 + 56));
  }
  return v0 + 56;
}

uint64_t sub_100004FF4(task_info_t task_info_out)
{
  integer_t v2;
  uint64_t result;
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  if (task_info(mach_task_self_, 0xFu, task_info_out, &task_info_outCnt))
    sub_100006048();
  v2 = task_info_out[5];
  result = getpid();
  if (v2 != (_DWORD)result || !task_info_out[7])
    sub_100006048();
  return result;
}

uint64_t _xpc_spawnattr_unpack_bytes(uint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4;

  if (a2 - a3 >= a4)
    v4 = a1 + a3 + 240;
  else
    v4 = 0;
  if (a2 <= a3)
    return 0;
  else
    return v4;
}

uint64_t sub_100005080(__int128 *a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v2 = a1[1];
  v5 = *a1;
  v6 = v2;
  v7 = a1[2];
  v8 = *((_QWORD *)a1 + 6);
  if (!der_vm_context_is_valid(&v5))
    return 0;
  v3 = a1[1];
  v5 = *a1;
  v6 = v3;
  v7 = a1[2];
  v8 = *((_QWORD *)a1 + 6);
  return sub_1000050F0((uint64_t *)&v5);
}

uint64_t sub_1000050F0(uint64_t *a1)
{
  uint64_t v2;
  __int128 v3;
  xpc_object_t empty;
  uint64_t v5;
  __int128 v6;
  int64_t v7;
  xpc_object_t no_copy;
  __int128 v9;
  void *v10;
  __int128 v11;
  char v12;
  __int128 v13;
  const void *v14;
  size_t v15;
  uint64_t result;
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v2 = *a1;
  v3 = *((_OWORD *)a1 + 1);
  v22 = *(_OWORD *)a1;
  v23 = v3;
  v24 = *((_OWORD *)a1 + 2);
  v25 = a1[6];
  switch(der_vm_CEType_from_context(&v22, 0))
  {
    case 1u:
      v18 = *(_OWORD *)a1;
      v19 = *((_OWORD *)a1 + 1);
      v20 = *((_OWORD *)a1 + 2);
      v21 = a1[6];
      empty = xpc_dictionary_create_empty();
      goto LABEL_4;
    case 2u:
      v18 = *(_OWORD *)a1;
      v19 = *((_OWORD *)a1 + 1);
      v20 = *((_OWORD *)a1 + 2);
      v21 = a1[6];
      empty = xpc_array_create_empty();
LABEL_4:
      v5 = (uint64_t)empty;
      v22 = v18;
      v23 = v19;
      v24 = v20;
      v25 = v21;
      der_vm_iterate(&v22, empty, sub_10000529C);
      goto LABEL_10;
    case 3u:
      v6 = *((_OWORD *)a1 + 1);
      v22 = *(_OWORD *)a1;
      v23 = v6;
      v24 = *((_OWORD *)a1 + 2);
      v25 = a1[6];
      v7 = der_vm_integer_from_context(&v22);
      no_copy = xpc_int64_create(v7);
      goto LABEL_9;
    case 4u:
      v9 = *((_OWORD *)a1 + 1);
      v22 = *(_OWORD *)a1;
      v23 = v9;
      v24 = *((_OWORD *)a1 + 2);
      v25 = a1[6];
      v10 = sub_10000555C((uint64_t)&v22);
      no_copy = (xpc_object_t)xpc_string_create_no_copy(v10);
      goto LABEL_9;
    case 5u:
      v11 = *((_OWORD *)a1 + 1);
      v22 = *(_OWORD *)a1;
      v23 = v11;
      v24 = *((_OWORD *)a1 + 2);
      v25 = a1[6];
      v12 = der_vm_BOOL_from_context(&v22);
      no_copy = xpc_BOOL_create(v12);
      goto LABEL_9;
    case 6u:
      v13 = *((_OWORD *)a1 + 1);
      v22 = *(_OWORD *)a1;
      v23 = v13;
      v24 = *((_OWORD *)a1 + 2);
      v25 = a1[6];
      v14 = (const void *)der_vm_data_from_context(&v22);
      no_copy = xpc_data_create(v14, v15);
LABEL_9:
      v5 = (uint64_t)no_copy;
LABEL_10:
      result = v5;
      break;
    default:
      v17 = (uint64_t *)(*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_objectForActiveContext", "CoreEntitlements: unknown DER type");
      result = sub_10000529C(v17);
      break;
  }
  return result;
}

uint64_t sub_10000529C(uint64_t *a1)
{
  uint64_t v2;
  int v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  char *v9;
  xpc_object_t empty;
  __int128 v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v18[3];
  uint64_t v19;
  _OWORD v20[3];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _OWORD v26[16];

  v2 = *a1;
  v3 = *((_DWORD *)a1 + 29);
  if (v3 == 2)
  {
    if (*((_DWORD *)a1 + 28) == 1)
    {
      v7 = (void *)a1[15];
      v14 = *(_OWORD *)(a1 + 7);
      v15 = *(_OWORD *)(a1 + 9);
      v16 = *(_OWORD *)(a1 + 11);
      v17 = a1[13];
      v25 = 0;
      v23 = 0u;
      v24 = 0u;
      v22 = 0u;
      memset((char *)v26 + 8, 0, 248);
      v8 = *(_OWORD *)(a1 + 9);
      v20[0] = *(_OWORD *)(a1 + 7);
      v20[1] = v8;
      v20[2] = *(_OWORD *)(a1 + 11);
      v21 = a1[13];
      *(_QWORD *)&v26[0] = 2;
      der_vm_execute(&v22, v20, v26);
      v26[0] = v22;
      v26[1] = v23;
      v26[2] = v24;
      *(_QWORD *)&v26[3] = v25;
      v9 = (char *)sub_10000555C((uint64_t)v26);
      v18[0] = v14;
      v18[1] = v15;
      v18[2] = v16;
      v19 = v17;
      v26[0] = xmmword_1000069B0;
      memset(&v26[1], 0, 240);
      der_vm_execute(v20, v18, v26);
      empty = (xpc_object_t)sub_1000050F0(v20);
      xpc_dictionary_set_value(v7, v9, empty);
      free(v9);
    }
    else
    {
      empty = xpc_array_create_empty();
      v11 = *(_OWORD *)(a1 + 9);
      v26[0] = *(_OWORD *)(a1 + 7);
      v26[1] = v11;
      v26[2] = *(_OWORD *)(a1 + 11);
      *(_QWORD *)&v26[3] = a1[13];
      if (der_vm_iterate(v26, empty, sub_10000529C) != kCENoError)
      {
        v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: Couldn't iterate over DER entitlements\n");
        return (uint64_t)sub_10000555C(v13);
      }
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, empty);
    }
    v6 = empty;
    goto LABEL_10;
  }
  if (v3)
  {
    if (*((_DWORD *)a1 + 28) == 2)
    {
      v4 = *(_OWORD *)(a1 + 9);
      v26[0] = *(_OWORD *)(a1 + 7);
      v26[1] = v4;
      v26[2] = *(_OWORD *)(a1 + 11);
      *(_QWORD *)&v26[3] = a1[13];
      v5 = (void *)sub_1000050F0(v26);
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, v5);
      v6 = v5;
LABEL_10:
      xpc_release(v6);
      return 1;
    }
    v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: not a sequence");
  }
  else
  {
    v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: unknown DER type");
  }
  return (uint64_t)sub_10000555C(v13);
}

void *sub_10000555C(uint64_t a1)
{
  __int128 v1;
  const void *v2;
  size_t v3;
  size_t v4;
  void *v5;
  _OWORD v7[3];
  uint64_t v8;

  v1 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v1;
  v7[2] = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v2 = (const void *)der_vm_string_from_context(v7);
  v4 = v3;
  v5 = sub_100003D90(v3 + 1);
  memcpy(v5, v2, v4);
  return v5;
}

void *sub_1000055C8(int a1, size_t size)
{
  return malloc_type_malloc(size, 0x78220757uLL);
}

void sub_1000055D8(int a1, void *a2)
{
  free(a2);
}

void sub_1000055E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsyslog(7, a2, &a9);
}

void sub_10000560C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsyslog(2, a2, &a9);
  qword_10000C030 = (uint64_t)"Data corruption: CoreEntitlements has aborted due to an unrecoverable error";
  __break(1u);
}

uint64_t sub_100005650()
{
  sleep(1u);
  return 1;
}

void *sub_10000566C(const void *a1, size_t size)
{
  void *v4;

  v4 = sub_100003D90(size);
  return memcpy(v4, a1, size);
}

char *sub_10000569C(const char *a1)
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
        sub_100006068(v3);
    }
    sub_100005650();
  }
  return result;
}

char *sub_1000056EC(char *a1, ...)
{
  char *result;
  int v3;
  char *v4;
  va_list va;

  va_start(va, a1);
  v4 = 0;
  while (1)
  {
    vasprintf(&v4, a1, va);
    result = v4;
    if (v4)
      break;
    if (*__error() != 12)
    {
      v3 = *__error();
      if (v3)
        sub_100006068(v3);
    }
    sub_100005650();
  }
  return result;
}

uint64_t sub_10000575C(int a1)
{
  return _os_assert_log(a1);
}

uint64_t sub_100005764(const char *a1)
{
  uint64_t shared_cache_range;
  int v3;
  char **v4;
  char **v5;
  uint64_t v6;
  const char **v7;
  uint64_t v8;
  const char *v9;
  uint64_t result;
  uint64_t v11;
  int v12;
  int *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  if ((_dyld_get_image_uuid(&_mh_execute_header, &v18) & 1) == 0)
  {
    v18 = 0;
    v19 = 0;
  }
  if ((_dyld_get_shared_cache_uuid(&v20) & 1) != 0)
  {
    v16 = 0;
    shared_cache_range = _dyld_get_shared_cache_range(&v16);
  }
  else
  {
    shared_cache_range = 0;
    v20 = 0;
    v21 = 0;
  }
  _os_log_simple(&_mh_execute_header, &v18, &v20, shared_cache_range, 16, 0, "%s (backtrace follows)", a1);
  bzero(&v18, 0x400uLL);
  v3 = backtrace(&v18, 128);
  v4 = backtrace_symbols(&v18, v3);
  if (v4)
  {
    v5 = v4;
    if (v3 >= 1)
    {
      v6 = v3;
      v7 = (const char **)v4;
      do
      {
        if (!*v7)
          break;
        v20 = 0;
        v21 = 0;
        v16 = 0;
        v17 = 0;
        if ((_dyld_get_image_uuid(&_mh_execute_header, &v20) & 1) == 0)
        {
          v20 = 0;
          v21 = 0;
        }
        if ((_dyld_get_shared_cache_uuid(&v16) & 1) != 0)
        {
          v15 = 0;
          v8 = _dyld_get_shared_cache_range(&v15);
        }
        else
        {
          v8 = 0;
          v16 = 0;
          v17 = 0;
        }
        v9 = *v7++;
        _os_log_simple(&_mh_execute_header, &v20, &v16, v8, 16, 0, "%s", v9);
        --v6;
      }
      while (v6);
    }
    free(v5);
  }
  result = os_fault_with_payload(7, 9, 0, 0, a1, 0);
  if ((_DWORD)result)
  {
    v20 = 0;
    v21 = 0;
    v16 = 0;
    v17 = 0;
    if ((_dyld_get_image_uuid(&_mh_execute_header, &v20) & 1) == 0)
    {
      v20 = 0;
      v21 = 0;
    }
    if ((_dyld_get_shared_cache_uuid(&v16) & 1) != 0)
    {
      v15 = 0;
      v11 = _dyld_get_shared_cache_range(&v15);
    }
    else
    {
      v11 = 0;
      v16 = 0;
      v17 = 0;
    }
    v12 = *__error();
    v13 = __error();
    v14 = (const char *)xpc_strerror(*v13);
    return _os_log_simple(&_mh_execute_header, &v20, &v16, v11, 16, 0, "Unable to generate a fault: %d - %s", v12, v14);
  }
  return result;
}

double xpc_binprefs_alloc()
{
  _OWORD *v0;
  double result;

  v0 = sub_100003D90(0x24uLL);
  result = 0.0;
  *v0 = 0u;
  v0[1] = 0u;
  *((_DWORD *)v0 + 8) = 0;
  return result;
}

uint64_t xpc_binprefs_add(uint64_t result, int a2, int a3)
{
  uint64_t v3;

  v3 = *(unsigned int *)(result + 32);
  if (v3 >= 4)
    return _os_assumes_log(0);
  *(_DWORD *)(result + 4 * v3) = a2;
  *(_DWORD *)(result + 4 * (*(_DWORD *)(result + 32))++ + 16) = a3;
  return result;
}

uint64_t xpc_binprefs_set_psattr(cpu_type_t *a1, posix_spawnattr_t *a2)
{
  uint64_t result;

  result = posix_spawnattr_setarchpref_np(a2, a1[8], a1, a1 + 4, 0);
  if ((_DWORD)result)
    sub_100006030(result);
  return result;
}

uint64_t sub_100005A50(char *a1)
{
  char *v2;
  char *v3;
  char v4;
  uint64_t result;

  v2 = strrchr(a1, 47);
  if (!v2)
    return 22;
  v3 = v2;
  v4 = *v2;
  *v2 = 0;
  LODWORD(result) = mkpath_np(a1, 0x1F6u);
  if ((_DWORD)result == 17)
    result = 0;
  else
    result = result;
  *v3 = v4;
  return result;
}

uint64_t sub_100005AAC(int *a1)
{
  return _os_assert_log(*a1);
}

uint64_t sub_100005AB4(const char *a1)
{
  fprintf(__stderrp, "%s: could not exec: %s\n", (const char *)qword_10000C078, a1);
  if (byte_10000C100 == 1)
    sub_100005FDC();
  return 1;
}

void sub_100005B0C(int a1)
{
  char __str[16];
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v3 = 0u;
  v4 = 0u;
  *(_OWORD *)__str = 0u;
  v2 = 0u;
  snprintf(__str, 0x40uLL, "Could not create shell: code %d", a1);
  pthread_setname_np(__str);
  sub_100005FDC();
}

uint64_t sub_100005B48(const char *a1, const char *a2)
{
  _QWORD *v4;
  uint64_t v5;
  int v6;
  size_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  pid_t v28;
  char *__envp[2];
  __int128 v30;
  uint64_t v31;
  char *__argv[2];
  posix_spawn_file_actions_t v33;
  posix_spawnattr_t v34;

  v4 = _os_alloc_once_table;
  if (_os_alloc_once_table[2] != -1)
    goto LABEL_20;
  v5 = _os_alloc_once_table[3];
  do
  {
    while (revoke("/dev/console") == -1)
    {
      v16 = __error();
      v17 = _os_assert_log(*v16);
      _os_crash(v17);
      __break(1u);
LABEL_20:
      v5 = _os_alloc_once(v4 + 2, 216, 0);
    }
    v6 = open(a1, 2);
    if (login_tty(v6) == -1)
    {
      close(v6);
      v6 = -1;
    }
  }
  while (v6 == -1);
  if (a2)
  {
    v7 = strlen(a2);
    if (write(v6, a2, v7) == -1)
      goto LABEL_27;
  }
  v34 = 0;
  v8 = posix_spawnattr_init(&v34);
  if (v8)
  {
    v18 = _os_assert_log(v8);
    v9 = _os_crash(v18);
    __break(1u);
    goto LABEL_22;
  }
  v9 = posix_spawnattr_setflags(&v34, 16448);
  if (v9)
  {
LABEL_22:
    v19 = _os_assert_log(v9);
    v10 = _os_crash(v19);
    __break(1u);
    goto LABEL_23;
  }
  v33 = 0;
  v10 = posix_spawn_file_actions_init(&v33);
  if (v10)
  {
LABEL_23:
    v20 = _os_assert_log(v10);
    v11 = _os_crash(v20);
    __break(1u);
    goto LABEL_24;
  }
  v11 = posix_spawn_file_actions_addinherit_np(&v33, 0);
  if (v11)
  {
LABEL_24:
    v21 = _os_assert_log(v11);
    v12 = _os_crash(v21);
    __break(1u);
    goto LABEL_25;
  }
  v12 = posix_spawn_file_actions_addinherit_np(&v33, 1);
  if (v12)
  {
LABEL_25:
    v22 = _os_assert_log(v12);
    v13 = _os_crash(v22);
    __break(1u);
    goto LABEL_26;
  }
  v13 = posix_spawn_file_actions_addinherit_np(&v33, 2);
  if (v13)
  {
LABEL_26:
    v23 = _os_assert_log(v13);
    _os_crash(v23);
    __break(1u);
LABEL_27:
    v24 = __error();
    v25 = _os_assert_log(*v24);
    v14 = _os_crash(v25);
    __break(1u);
    goto LABEL_28;
  }
  *(_OWORD *)__argv = off_100008750;
  *(_OWORD *)__envp = *(_OWORD *)off_100008760;
  v30 = *(_OWORD *)off_100008770;
  v31 = 0;
  if ((*(_BYTE *)(v5 + 9) & 1) == 0)
    goto LABEL_18;
  v14 = posix_spawnattr_setspecialport_np(&v34, *(_DWORD *)(v5 + 16), 4);
  if (!v14)
  {
    *((_QWORD *)&v30 + 1) = 0;
LABEL_18:
    pthread_setname_np(byte_10000C080);
    v28 = 0;
    v15 = posix_spawn(&v28, "/bin/sh", &v33, &v34, __argv, __envp);
    sub_100005B0C(v15);
  }
LABEL_28:
  v26 = _os_assert_log(v14);
  result = _os_crash(v26);
  __break(1u);
  return result;
}

uint64_t sub_100005D78(const char *a1)
{
  uint64_t shared_cache_range;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v13 = 0;
  v14 = 0;
  v11 = 0;
  v12 = 0;
  if ((_dyld_get_image_uuid(&_mh_execute_header, &v13) & 1) == 0)
  {
    v13 = 0;
    v14 = 0;
  }
  if ((_dyld_get_shared_cache_uuid(&v11) & 1) != 0)
  {
    v10 = 0;
    shared_cache_range = _dyld_get_shared_cache_range(&v10);
  }
  else
  {
    shared_cache_range = 0;
    v11 = 0;
    v12 = 0;
  }
  v3 = _os_log_simple(&_mh_execute_header, &v13, &v11, shared_cache_range, 0, 0, "calling cryptex_trampoline_upgrade_wait() for %s", a1);
  v4 = cryptex_trampoline_upgrade_wait_options_create(v3);
  cryptex_trampoline_upgrade_wait_options_set_cryptex_name(v4, a1);
  v5 = cryptex_trampoline_upgrade_wait(v4);
  if ((_DWORD)v5)
  {
    v6 = v5;
    v13 = 0;
    v14 = 0;
    v11 = 0;
    v12 = 0;
    if ((_dyld_get_image_uuid(&_mh_execute_header, &v13) & 1) == 0)
    {
      v13 = 0;
      v14 = 0;
    }
    if ((_dyld_get_shared_cache_uuid(&v11) & 1) != 0)
    {
      v10 = 0;
      v7 = _dyld_get_shared_cache_range(&v10);
    }
    else
    {
      v7 = 0;
      v11 = 0;
      v12 = 0;
    }
    v8 = (const char *)xpc_strerror(v6);
    _os_log_simple(&_mh_execute_header, &v13, &v11, v7, 16, 0, "cryptex_trampoline_upgrade_wait() failed with error %d - %s", v6, v8);
  }
  return cryptex_trampoline_upgrade_wait_options_destroy(v4);
}

xpc_object_t sub_100005EE4(uint64_t a1, const char *a2, BOOL a3)
{
  xpc_object_t v5;

  if ((*(_BYTE *)(a1 + 236) & 0x80) != 0)
    return 0;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "Executable", a2);
  xpc_dictionary_set_BOOL(v5, "SkipImmediatePoll", a3);
  return v5;
}

void *sub_100005F5C(uint64_t a1, const char *a2, const char *a3)
{
  xpc_object_t v5;
  void *v6;

  if ((*(_BYTE *)(a1 + 236) & 0x80) != 0)
    return 0;
  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  if (a2)
    xpc_dictionary_set_string(v5, "UserName", a2);
  if (a3)
    xpc_dictionary_set_string(v6, "GroupName", a3);
  return v6;
}

void sub_100005FDC()
{
  mach_port_t v0;

  v0 = mach_host_self();
  host_reboot(v0, 4096);
  __break(1u);
}

uint64_t sub_100005FF4(int a1, void *buffer)
{
  if (proc_pidinfo(a1, 13, 1uLL, buffer, 64) == 64)
    return 0;
  else
    return *__error();
}

void sub_100006030(int a1)
{
  uint64_t v1;

  v1 = _os_assert_log(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_100006048()
{
  qword_10000C030 = (uint64_t)"Configuration error: failed to fetch our own audit token";
  __break(1u);
}

void sub_100006068(int a1)
{
  uint64_t v1;

  v1 = sub_10000575C(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_10000607C()
{
  qword_10000C030 = (uint64_t)"Configuration error: unreasonably large PID or execcnt";
  __break(1u);
}

void sub_10000609C()
{
  _os_crash("request originated from a different execcnt");
  __break(1u);
}

void sub_1000060B4()
{
  _os_crash("request originated from a different PID");
  __break(1u);
}

void sub_1000060CC()
{
  _os_crash("euid of PID 1 must be 0");
  __break(1u);
}

void sub_1000060E4(int a1)
{
  char *v1;

  v1 = sub_1000056EC("bootstrap port must lead to PID 1 [actual pid = %d]", a1);
  _os_crash(v1);
  __break(1u);
}

void sub_100006108()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = __error();
  v1 = sub_100005AAC(v0);
  v2 = _os_crash(v1);
  __break(1u);
  CEAcquireUnmanagedContext(v2, v3, v4);
}
