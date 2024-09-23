uint64_t sub_1000018E4(uint64_t a1, int *a2, unsigned int a3, uint64_t a4, _DWORD *a5)
{
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v11;
  int v12;
  int v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;

  if (a3 <= 7)
  {
    *a5 = 107;
    v6 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v15 = 136315138;
      v16 = "nlc_simulate";
      v7 = "%s: message too small";
      v8 = v6;
      v9 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v15, v9);
      return 5;
    }
    return 5;
  }
  if (*a2 != 21)
  {
    *a5 = 108;
    v11 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v12 = *a2;
      v15 = 136315650;
      v16 = "nlc_simulate";
      v17 = 1024;
      v18 = v12;
      v19 = 1024;
      v20 = 21;
      v7 = "%s: incompatible version %d, should be %d";
      v8 = v11;
      v9 = 24;
      goto LABEL_9;
    }
    return 5;
  }
  if (a2[1])
  {
    *a5 = 107;
    return 5;
  }
  v14 = sub_100002E88(a2);
  *a5 = v14;
  if (v14 == 1)
    return 0;
  else
    return 5;
}

uint64_t sub_100001A5C(uint64_t a1, int *a2, unsigned int a3, uint64_t a4, _DWORD *a5)
{
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v11;
  uint64_t result;
  NSObject *v13;
  int v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;

  if (a3 <= 7)
  {
    *a5 = 107;
    v6 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "nlc_stop_simulation";
      v7 = "%s: message too small";
      v8 = v6;
      v9 = 12;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v16, v9);
      return 5;
    }
    return 5;
  }
  if (*a2 != 21)
  {
    *a5 = 108;
    v13 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v14 = *a2;
      v16 = 136315650;
      v17 = "nlc_stop_simulation";
      v18 = 1024;
      v19 = v14;
      v20 = 1024;
      v21 = 21;
      v7 = "%s: incompatible version %d, should be %d";
      v8 = v13;
      v9 = 24;
      goto LABEL_13;
    }
    return 5;
  }
  if (a2[1] != 1)
  {
    *a5 = 107;
LABEL_11:
    v15 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v7 = "Error stopping simulation";
      v8 = v15;
      v9 = 2;
      goto LABEL_13;
    }
    return 5;
  }
  v11 = sub_100002D90();
  result = 0;
  *a5 = v11;
  if (v11 != 1)
    goto LABEL_11;
  return result;
}

uint64_t sub_100001C1C(uint64_t a1, int *a2, unsigned int a3, _OWORD *a4, _DWORD *a5, uint64_t a6, _DWORD *a7)
{
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t result;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;

  if (a3 > 7)
  {
    if (*a2 == 21)
    {
      if (a2[1] == 2)
      {
        *a5 = 208;
        a4[11] = 0u;
        a4[12] = 0u;
        a4[9] = 0u;
        a4[10] = 0u;
        a4[7] = 0u;
        a4[8] = 0u;
        a4[5] = 0u;
        a4[6] = 0u;
        a4[3] = 0u;
        a4[4] = 0u;
        a4[1] = 0u;
        a4[2] = 0u;
        *a4 = 0u;
        *(_QWORD *)a4 = 0x200000015;
        sub_100003010((uint64_t)a4);
        result = 0;
        *a7 = 1;
        return result;
      }
      *a7 = 107;
      v16 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        v9 = "Error get simulation status";
        v10 = v16;
        v11 = 2;
        goto LABEL_11;
      }
    }
    else
    {
      *a7 = 108;
      v14 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        v15 = *a2;
        v17 = 136315650;
        v18 = "nlc_get_status";
        v19 = 1024;
        v20 = v15;
        v21 = 1024;
        v22 = 21;
        v9 = "%s: incompatible version %d, should be %d";
        v10 = v14;
        v11 = 24;
        goto LABEL_11;
      }
    }
  }
  else
  {
    *a7 = 107;
    v8 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v17 = 136315138;
      v18 = "nlc_get_status";
      v9 = "%s: message too small";
      v10 = v8;
      v11 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v17, v11);
    }
  }
  return 5;
}

double sub_100001E08()
{
  double result;

  result = 0.0;
  xmmword_10000C04C = 0u;
  unk_10000C05C = 0u;
  xmmword_10000C02C = 0u;
  unk_10000C03C = 0u;
  xmmword_10000C01C = 0u;
  return result;
}

uint64_t sub_100001E24(int a1, _DWORD *a2)
{
  uint64_t v3;
  int *v4;
  int v5;
  _DWORD *v7;
  _DWORD *v8;
  int v9;

  v3 = 0;
  v4 = (int *)&xmmword_10000C01C + 1;
  while (1)
  {
    v5 = *v4;
    v4 += 2;
    if (!v5)
      break;
    if (++v3 == 10)
    {
      if (dword_10000C070)
        return 106;
      v3 = 10;
      break;
    }
  }
  v7 = (_DWORD *)&xmmword_10000C01C + 2 * v3;
  *v7 = a1;
  v8 = v7 + 1;
  do
  {
    v9 = random();
    *a2 = v9;
    *v8 = v9;
  }
  while (!v9);
  ++dword_10000C06C;
  return 1;
}

uint64_t sub_100001EB0(int a1, int a2)
{
  uint64_t v2;

  v2 = 0;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v2 + 4) != a2 || *(_DWORD *)((char *)&xmmword_10000C01C + v2) != a1)
  {
    v2 += 8;
    if (v2 == 80)
      return 103;
  }
  return 1;
}

uint64_t sub_100001EF4(int a1, int a2)
{
  uint64_t v2;

  v2 = 0;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v2) != a1 || *(_DWORD *)((char *)&xmmword_10000C01C + v2 + 4) != a2)
  {
    v2 += 8;
    if (v2 == 80)
      return 103;
  }
  *(_QWORD *)((char *)&xmmword_10000C01C + v2) = 0;
  --dword_10000C06C;
  return 1;
}

uint64_t sub_100001F4C(uint64_t a1, mach_port_name_t *a2, _DWORD *a3, int *a4, _OWORD *a5)
{
  __int128 v8;
  __SecTask *v9;
  CFTypeRef v10;
  CFTypeID v11;
  int Value;
  NSObject *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  uint64_t v18;
  NSObject *v19;
  uint64_t inserted;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  CFErrorRef v26;
  mach_port_t previous;
  audit_token_t token;

  previous = 0;
  v8 = a5[1];
  *(_OWORD *)token.val = *a5;
  *(_OWORD *)&token.val[4] = v8;
  v26 = 0;
  v9 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  v10 = SecTaskCopyValueForEntitlement(v9, CFSTR("com.apple.private.nlcd-control"), &v26);
  CFRelease(v9);
  if (!v10)
    goto LABEL_9;
  v11 = CFGetTypeID(v10);
  if (v11 != CFBooleanGetTypeID())
  {
    CFRelease(v10);
    goto LABEL_9;
  }
  Value = CFBooleanGetValue((CFBooleanRef)v10);
  CFRelease(v10);
  if (!Value)
  {
LABEL_9:
    v16 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Process not entitled for this action", (uint8_t *)&token, 2u);
    }
    v15 = 0;
    v14 = 5;
    goto LABEL_12;
  }
  if (dword_10000C06C >= 11)
  {
    v13 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No more connections available to nlcd", (uint8_t *)&token, 2u);
    }
    v14 = 5;
    v15 = 106;
    goto LABEL_12;
  }
  v18 = mach_port_allocate(mach_task_self_, 1u, a2);
  if ((_DWORD)v18)
  {
    v14 = v18;
    v19 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Unable to allocate port for client", (uint8_t *)&token, 2u);
    }
    goto LABEL_24;
  }
  inserted = mach_port_insert_right(mach_task_self_, *a2, *a2, 0x14u);
  if ((_DWORD)inserted)
  {
    v14 = inserted;
    v21 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      v22 = "Insert right failed on client port";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&token, 2u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  v23 = mach_port_move_member(mach_task_self_, *a2, dword_10000C080);
  if ((_DWORD)v23)
  {
    v14 = v23;
    v21 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      v22 = "Unable to add client port to portset";
      goto LABEL_22;
    }
LABEL_23:
    mach_port_destroy(mach_task_self_, *a2);
LABEL_24:
    v15 = 105;
    goto LABEL_12;
  }
  if (mach_port_request_notification(mach_task_self_, *a2, 70, 1u, *a2, 0x15u, &previous))
  {
    v24 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Unable to register for notifications on client port", (uint8_t *)&token, 2u);
    }
    mach_port_destroy(mach_task_self_, *a2);
    v14 = 5;
    goto LABEL_24;
  }
  if (sub_100001E24(*a2, a3) == 1)
  {
    v14 = 0;
    v15 = 1;
  }
  else
  {
    v25 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Unable to create session for client", (uint8_t *)&token, 2u);
    }
    mach_port_destroy(mach_task_self_, *a2);
    v14 = 5;
    v15 = 102;
  }
LABEL_12:
  *a4 = v15;
  return v14;
}

uint64_t sub_1000022E4(int a1, int a2, int *a3)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint8_t v9[16];

  v4 = 0;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v4 + 4) != a2 || *(_DWORD *)((char *)&xmmword_10000C01C + v4) != a1)
  {
    v4 += 8;
    if (v4 == 80)
    {
LABEL_10:
      v6 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unable to disconnect", v9, 2u);
      }
      v7 = 103;
      goto LABEL_13;
    }
  }
  v5 = 0;
  while (*(_DWORD *)((char *)&xmmword_10000C01C + v5) != a1 || *(_DWORD *)((char *)&xmmword_10000C01C + v5 + 4) != a2)
  {
    v5 += 8;
    if (v5 == 80)
      goto LABEL_10;
  }
  *(_QWORD *)((char *)&xmmword_10000C01C + v5) = 0;
  --dword_10000C06C;
  v7 = 1;
LABEL_13:
  *a3 = v7;
  return 0;
}

uint64_t sub_1000023D8()
{
  unsigned int v0;
  uint64_t v1;
  unint64_t v2;
  char *v3;
  int v4;
  socklen_t v7;
  void *v8;

  v8 = 0;
  v7 = 0;
  if ((sub_100002490(&v8, &v7) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v0 = 40268;
LABEL_3:
  v1 = v0 + 1;
  v2 = v7;
  v3 = (char *)v8;
  if (v7 >= 0x160)
  {
    while (*(_QWORD *)v3 == 0x4000)
    {
      if ((_DWORD)v1 == *((_DWORD *)v3 + 2))
      {
        if (v0++ >= 0xFFFF)
          break;
        goto LABEL_3;
      }
      v4 = 184 * *((_DWORD *)v3 + 67) + 352;
      v3 += v4;
      v2 -= v4;
      if (v2 < 0x160)
        break;
    }
  }
  if (v8)
    free(v8);
  return v1;
}

uint64_t sub_100002490(_QWORD *a1, socklen_t *a2)
{
  void *v4;
  socklen_t v5;
  socklen_t v6;
  int v7;
  void *v8;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  int v15;
  socklen_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;

  v4 = 0;
  v5 = 1024;
  v16 = 1024;
  do
  {
    v6 = v16;
    if (v16 < v5)
      goto LABEL_7;
    v7 = 2 * v5;
    v5 = 2 * v5 + 200;
    v16 = v7 + 200;
    v8 = malloc_type_realloc(v4, (v7 + 200), 0x1F393A34uLL);
    if (!v8)
    {
      v10 = off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        return 0xFFFFFFFFLL;
      *(_DWORD *)buf = 136315138;
      v18 = "get_dummynet_rules";
      v11 = "%s: realloc\n";
      v12 = v10;
      v13 = 12;
      goto LABEL_12;
    }
    v4 = v8;
  }
  while ((sub_100002764(64, v8, &v16) & 0x80000000) == 0);
  if (*__error() == 55)
  {
    v16 = 0;
    free(v4);
    v4 = 0;
    v6 = v16;
LABEL_7:
    *a1 = v4;
    *a2 = v6;
    return 1;
  }
  free(v4);
  v14 = off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    v15 = *__error();
    *(_DWORD *)buf = 136315394;
    v18 = "get_dummynet_rules";
    v19 = 1024;
    v20 = v15;
    v11 = "%s: IP_DUMMYNET_GET failed (%d)\n";
    v12 = v14;
    v13 = 18;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
  }
  return 0xFFFFFFFFLL;
}

void sub_100002644(int a1)
{
  NSObject *v2;
  int v3;
  socklen_t v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  _OWORD v11[22];

  memset(v11, 0, sizeof(v11));
  DWORD2(v11[0]) = a1;
  v4 = 352;
  if (sub_100002764(61, v11, &v4))
  {
    v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v3 = *__error();
      *(_DWORD *)buf = 136315650;
      v6 = "delete_pipe";
      v7 = 1024;
      v8 = a1;
      v9 = 1024;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: IP_DUMMYNET_DEL(pipe %d) failed (%d)\n", buf, 0x18u);
    }
  }
}

uint64_t sub_100002764(int a1, void *a2, socklen_t *a3)
{
  int v6;
  NSObject *v8;
  int v9;
  const char *v10;

  v6 = dword_10000C000;
  if (dword_10000C000 == -1)
  {
    v6 = socket(2, 3, 255);
    dword_10000C000 = v6;
    if ((v6 & 0x80000000) == 0)
    {
LABEL_3:
      if (a1 == 64)
        return getsockopt(v6, 0, 64, a2, a3);
      else
        return setsockopt(v6, 0, a1, a2, *a3);
    }
  }
  else if ((dword_10000C000 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  v8 = off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "do_cmd";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: socket unavailable\n", (uint8_t *)&v9, 0xCu);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000028CC(int a1, float *a2)
{
  float v2;
  double v3;
  double v4;
  float v5;
  int v6;
  int v7;
  NSObject *v9;
  socklen_t v10;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v2 = a2[2];
  DWORD2(v12) = a1;
  if (v2 != 0.0)
  {
    v3 = v2;
    if (v2 < 0.0)
      v3 = 0.0;
    if (v2 <= 1.0)
      v4 = v3;
    else
      v4 = 1.0;
    HIDWORD(v24) = (int)(v4 * 2147483650.0);
  }
  v5 = *a2;
  if (!*(_DWORD *)a2)
    goto LABEL_15;
  *((float *)&v12 + 3) = *a2;
  v6 = *((_DWORD *)a2 + 1);
  if (v6)
  {
    if (v6 != 1)
      goto LABEL_14;
    v7 = 1000000;
  }
  else
  {
    v7 = 1000;
  }
  LODWORD(v5) *= v7;
  *((float *)&v12 + 3) = v5;
LABEL_14:
  if ((LODWORD(v5) & 0x80000000) == 0)
  {
LABEL_15:
    if (*((_DWORD *)a2 + 3))
      *(float *)&v13 = a2[3];
    if (*((_DWORD *)a2 + 4))
    {
      *((float *)&v24 + 2) = a2[4];
      if (*((_DWORD *)a2 + 5) == 1)
        WORD1(v23) = 8;
    }
    v10 = 352;
    if (sub_100002764(60, &v12, &v10))
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  v9 = off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "config_pipe";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: bandwidth too large\n", (uint8_t *)&v10, 0xCu);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100002A70(int a1, uint64_t a2)
{
  void *v4;
  socklen_t v5;
  char *v6;
  char *v7;
  int v8;
  int v9;
  float v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  socklen_t v16;
  void *v17;

  v17 = 0;
  v16 = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)(a2 + 32) = 0;
  if ((sub_100002490(&v17, &v16) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v4 = v17;
  v5 = v16;
  v6 = (char *)v17;
  do
  {
    if (v5 < 0x160 || (v7 = v6, *(_QWORD *)v6 != 0x4000))
    {
      v11 = 0;
      if (!v17)
        return v11;
      goto LABEL_15;
    }
    v8 = 184 * *((_DWORD *)v6 + 67) + 352;
    v6 += v8;
    v5 -= v8;
  }
  while (*((_DWORD *)v7 + 2) != a1);
  v9 = *((_DWORD *)v7 + 51);
  if (v9)
  {
    if (v9 == 0x7FFFFFFF)
      v10 = 1.0;
    else
      v10 = (double)v9 / 2147483650.0;
  }
  else
  {
    v10 = 0.0;
  }
  v12 = *((_DWORD *)v7 + 4);
  v13 = *((_DWORD *)v7 + 3) / 1000;
  *(float *)(a2 + 8) = v10;
  *(_DWORD *)a2 = v13;
  *(_DWORD *)(a2 + 4) = 0;
  v14 = *((_DWORD *)v7 + 50);
  *(_DWORD *)(a2 + 12) = v12;
  *(_DWORD *)(a2 + 16) = v14;
  *(_DWORD *)(a2 + 20) = (*((unsigned __int16 *)v7 + 89) >> 3) & 1;
  v11 = 1;
  if (v4)
LABEL_15:
    free(v4);
  return v11;
}

BOOL sub_100002B9C()
{
  int v0;
  int v1;
  _BOOL8 result;
  size_t v3;
  int v4;
  uint8_t buf[4];
  int v6;

  v4 = 0;
  v3 = 4;
  v0 = sysctlbyname("net.link.generic.system.enable_netagent", &v4, &v3, 0, 0);
  if (v0)
  {
    v1 = v0;
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100006A60(v1);
      return 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "enable_netagent = 0x%x\n", buf, 8u);
    }
    return v4 == 1;
  }
  return result;
}

void sub_100002C98(int a1)
{
  int v2;
  int v3;
  int v4;
  uint8_t buf[4];
  int v6;

  v4 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v6 = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "set enable_netagent %d", buf, 8u);
  }
  v2 = sysctlbyname("net.link.generic.system.enable_netagent", 0, 0, &v4, 4uLL);
  if (v2)
  {
    v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100006B00(&v4, v3);
  }
}

void sub_100002D80()
{
  sub_100002C98(0);
}

void sub_100002D88()
{
  sub_100002C98(1);
}

uint64_t sub_100002D90()
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v1 = 136315650;
    v2 = "kc_stop_simulation";
    v3 = 1024;
    v4 = dword_10000C070;
    v5 = 1024;
    v6 = sub_100003048();
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: kc_was_netagent_disabled %d netem_is_simulation_on() %d", (uint8_t *)&v1, 0x18u);
  }
  if (sub_100003048())
    return sub_10000387C();
  if ((_BYTE)dword_10000C070)
  {
    sub_100002C98(1);
    LOBYTE(dword_10000C070) = 0;
  }
  return sub_10000601C();
}

uint64_t sub_100002E88(_DWORD *a1)
{
  _BOOL4 v2;
  _BOOL4 v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "kc_start_simulation";
    v7 = 1024;
    v8 = dword_10000C070;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: kc_was_netagent_disabled %d", (uint8_t *)&v5, 0x12u);
  }
  v2 = sub_100003054(a1);
  v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (!v2)
  {
    if (v3)
    {
      LOWORD(v5) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "simulation using packetfilter", (uint8_t *)&v5, 2u);
    }
    if (sub_100002B9C())
    {
      sub_100002C98(0);
      LOBYTE(dword_10000C070) = 1;
    }
    return sub_1000061C0((uint64_t)a1);
  }
  if (v3)
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "simulation using NetEm", (uint8_t *)&v5, 2u);
  }
  result = sub_1000032D0((uint64_t)a1);
  if ((_DWORD)result != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100006B8C();
    return sub_1000061C0((uint64_t)a1);
  }
  return result;
}

uint64_t sub_100003010(uint64_t a1)
{
  if (sub_100003048())
    return sub_100003964(a1);
  else
    return sub_100005308(a1);
}

uint64_t sub_100003048()
{
  return BYTE1(dword_10000C070);
}

BOOL sub_100003054(_DWORD *a1)
{
  int v2;
  _BOOL8 result;
  const char *v4;
  _BOOL4 v5;
  size_t v6;
  int v7;
  uint8_t buf[4];
  int v9;

  v7 = 0;
  v6 = 4;
  v2 = sysctlbyname("net.link.generic.system.if_attach_nx", &v7, &v6, 0, 0);
  result = 0;
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "if_attach_nx = 0x%x\n", buf, 8u);
    }
    if ((~v7 & 7) != 0)
      return 0;
    if (a1[2])
    {
      result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (!result)
        return result;
      *(_WORD *)buf = 0;
      v4 = "NetEm doesn't support secondary condition";
      goto LABEL_20;
    }
    if (!a1[29])
    {
      result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (!result)
        return result;
      *(_WORD *)buf = 0;
      v4 = "NetEm doesn't support loopback";
      goto LABEL_20;
    }
    if (a1[28] || a1[40] || a1[42] || a1[41] || a1[49] || a1[50] || a1[51])
    {
      result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (!result)
        return result;
      *(_WORD *)buf = 0;
      v4 = "NetEm doesn't support family/proto/port config";
      goto LABEL_20;
    }
    if (a1[38] || a1[39] || a1[47] || a1[48])
    {
      result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (result)
      {
        *(_WORD *)buf = 0;
        v4 = "NetEm doesn't support qsize config";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v4, buf, 2u);
        return 0;
      }
    }
    else
    {
      v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      result = 1;
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "use NetEm simulation", buf, 2u);
        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_1000032D0(uint64_t a1)
{
  unint64_t v1;
  int v2;
  unsigned int v3;
  float v4;
  unint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  float v10;
  uint64_t result;
  _OWORD v12[7];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  memset(v12, 0, sizeof(v12));
  LODWORD(v13) = 1;
  v1 = *(unsigned int *)(a1 + 172);
  if ((_DWORD)v1)
  {
    v2 = *(_DWORD *)(a1 + 176);
    if (v2 == 1)
    {
      v3 = 1000000;
    }
    else
    {
      if (v2)
        goto LABEL_8;
      v3 = 1000;
    }
    v1 = v1 * (unint64_t)v3;
  }
  else
  {
    v1 = -1;
  }
LABEL_8:
  *((_QWORD *)&v13 + 1) = v1;
  v4 = *(float *)(a1 + 180) * 100000.0;
  LODWORD(v14) = *(_DWORD *)(a1 + 184);
  LODWORD(v15) = v4;
  LODWORD(v17) = 1;
  v5 = *(unsigned int *)(a1 + 136);
  if ((_DWORD)v5)
  {
    v6 = *(_DWORD *)(a1 + 140);
    if (v6 == 1)
    {
      v7 = 1000000;
    }
    else
    {
      if (v6)
        goto LABEL_15;
      v7 = 1000;
    }
    v5 = v5 * (unint64_t)v7;
  }
  else
  {
    v5 = -1;
  }
LABEL_15:
  *((_QWORD *)&v17 + 1) = v5;
  v9 = *(unsigned __int8 *)(a1 + 120);
  v8 = a1 + 120;
  v10 = *(float *)(v8 + 24) * 100000.0;
  LODWORD(v18) = *(_DWORD *)(v8 + 28);
  LODWORD(v19) = v10;
  if (v9)
  {
    if (sub_10000342C(v8, (uint64_t)v12))
      return 0;
  }
  else if (sub_1000036F8((uint64_t)v12, 1))
  {
    return 0;
  }
  result = 1;
  BYTE1(dword_10000C070) = 1;
  return result;
}

uint64_t sub_10000342C(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  const char *v7;
  os_log_type_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  char *v18;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  v24 = 0u;
  v25 = 0u;
  if (a1)
  {
    *__error() = 0;
    v4 = socket(2, 2, 0);
    if ((v4 & 0x80000000) == 0)
    {
      v5 = v4;
      __strlcpy_chk(&v24, a1, 16, 16);
      if (ioctl(v5, 0xC02069D8uLL, &v24) < 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v17 = __error();
          v18 = strerror(*v17);
          *(_DWORD *)buf = 136315394;
          v21 = (uint64_t)v18;
          v22 = 2080;
          v23 = a1;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ioctl get no traffic shaping error %s on %s", buf, 0x16u);
        }
      }
      else if ((_DWORD)v25)
      {
        v6 = 0;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v21 = a1;
          v7 = "no traffic shaping on %s";
          v8 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_25;
        }
        goto LABEL_27;
      }
      __strlcpy_chk(a2, a1, 16, 16);
      if ((ioctl(v5, 0xC0F06991uLL, a2) & 0x80000000) == 0 || *__error() == 2 || *__error() == 6 || *__error() == 19)
      {
        if (*__error() == 6)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100006C04();
        }
        else
        {
          if (*__error() != 19)
          {
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
LABEL_26:
              v6 = 0;
              goto LABEL_27;
            }
            *(_DWORD *)buf = 136315138;
            v21 = a1;
            v7 = "set interface link parameters on %s";
            v8 = OS_LOG_TYPE_INFO;
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v8, v7, buf, 0xCu);
            goto LABEL_26;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100006C6C();
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100006CD4(a1);
      }
      v6 = 0xFFFFFFFFLL;
LABEL_27:
      close(v5);
      return v6;
    }
    v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9)
      sub_100006BD0(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000036F8(uint64_t a1, char a2)
{
  ifaddrs *v5;
  const char *v6;
  const char *ifa_name;
  ifaddrs *v8;
  ifaddrs *v9;
  float v10;
  uint64_t v11;
  float v12;
  uint64_t v13;

  v9 = 0;
  if (getifaddrs(&v9))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100006DF0();
    return 0xFFFFFFFFLL;
  }
  v5 = v9;
  if (v9)
  {
    v6 = 0;
    while (1)
    {
      if ((v5->ifa_flags & 1) != 0)
      {
        ifa_name = v5->ifa_name;
        if (!v6 || strcmp(v6, v5->ifa_name))
        {
          if ((sub_100003CAC(ifa_name) & 1) != 0)
          {
            if (sub_10000342C((uint64_t)v5->ifa_name, a1))
            {
              v6 = ifa_name;
              if ((a2 & 1) != 0)
                return 0xFFFFFFFFLL;
              goto LABEL_19;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            sub_100006DB0(&v10, (uint64_t *)&v5->ifa_name, &v11);
          }
          v6 = ifa_name;
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        sub_100006D70(&v12, (uint64_t)v5, &v13);
      }
LABEL_19:
      v5 = v5->ifa_next;
      if (!v5)
      {
        v8 = v9;
        goto LABEL_22;
      }
    }
  }
  v8 = 0;
LABEL_22:
  freeifaddrs(v8);
  return 0;
}

uint64_t sub_10000387C()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v9[16];
  _OWORD v10[15];

  memset(v10, 0, sizeof(v10));
  if (sub_1000036F8((uint64_t)v10, 0))
  {
    v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v0)
      sub_100006E64(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "netem simulation stop", v9, 2u);
  }
  BYTE1(dword_10000C070) = 0;
  return 1;
}

uint64_t sub_100003964(uint64_t a1)
{
  int v2;
  int v3;
  ifaddrs *v4;
  char **p_ifa_name;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v15;
  uint8_t v16;
  char v17[15];
  ifaddrs *v18;
  _OWORD *v19;
  _OWORD v20[7];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  char *v30;
  float v31;
  uint64_t v32;
  float v33;
  uint64_t v34;

  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  memset(v20, 0, sizeof(v20));
  v18 = 0;
  v19 = v20;
  v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6)
      sub_100006BD0(v6, v7, v8, v9, v10, v11, v12, v13);
    return 0;
  }
  v3 = v2;
  if (getifaddrs(&v18) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100006DF0();
  v4 = v18;
  if (!v18)
  {
LABEL_16:
    close(v3);
    return 0;
  }
  while ((v4->ifa_flags & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_100006E98(&v33, (uint64_t)v4, &v34);
LABEL_15:
    v4 = v4->ifa_next;
    if (!v4)
      goto LABEL_16;
  }
  p_ifa_name = &v4->ifa_name;
  if ((sub_100003CAC(v4->ifa_name) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_100006DB0(&v31, (uint64_t *)&v4->ifa_name, &v32);
    goto LABEL_15;
  }
  __strlcpy_chk(v19, *p_ifa_name, 16, 16);
  if (ioctl(v3, 0xC0F06992uLL, &v19) < 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100006ED8(&v16, v17);
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v15 = *p_ifa_name;
    *(_DWORD *)buf = 136315138;
    v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "get interface link parameters on %s", buf, 0xCu);
  }
  if (sub_100003C24(*((unint64_t *)&v21 + 1), (unsigned int *)(a1 + 172), (int *)(a1 + 176))
    || sub_100003C24(*((unint64_t *)&v25 + 1), (unsigned int *)(a1 + 136), (int *)(a1 + 140)))
  {
    return 0;
  }
  *(float *)(a1 + 180) = (float)v23 / 100000.0;
  *(float *)(a1 + 144) = (float)v27 / 100000.0;
  *(_DWORD *)(a1 + 184) = v22;
  *(_DWORD *)(a1 + 148) = v26;
  return 1;
}

uint64_t sub_100003C24(unint64_t a1, unsigned int *a2, int *a3)
{
  unsigned int v3;
  int v4;
  uint64_t result;

  v3 = a1;
  if (a1 > 0xF4240)
  {
    v4 = 1;
LABEL_5:
    result = 0;
    *a3 = v4;
    *a2 = v3 / 0xF4240;
    return result;
  }
  if (a1 > 0x3E8)
  {
    v4 = 0;
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100006F18();
  return 0xFFFFFFFFLL;
}

uint64_t sub_100003CAC(const char *a1)
{
  size_t v2;
  int v3;
  int v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v2 = strlen(off_10000C008);
  if (strncmp(a1, off_10000C008, v2))
  {
    v3 = socket(2, 2, 0);
    if ((v3 & 0x80000000) == 0)
    {
      v4 = v3;
      __strlcpy_chk(&v15, a1, 16, 16);
      if (ioctl(v4, 0xC020699FuLL, &v15))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100006F80();
      }
      else if ((_DWORD)v16 == 6 || (_DWORD)v16 == 255 || (_DWORD)v16 == 144)
      {
        v5 = 1;
        goto LABEL_14;
      }
      v5 = 0;
LABEL_14:
      close(v4);
      return v5;
    }
    v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6)
      sub_100006BD0(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return 0;
}

void sub_100003DF0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003E00(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003E10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_100003E2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

float *sub_100003E48@<X0>(float *result@<X0>, _QWORD *a2@<X2>, uint64_t a3@<X8>, float a4@<S0>)
{
  *result = a4;
  *a2 = a3;
  return result;
}

uint64_t sub_100003E54(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
  mach_msg_id_t msgh_id;
  uint64_t result;

  mig_reply_setup(a1, a2);
  a2[1].msgh_remote_port = -300;
  msgh_id = a1->msgh_id;
  if ((msgh_id - 78) <= 0xFFFFFFF1)
    return sub_1000069D0(a1, (uint64_t)a2);
  if (msgh_id != 70)
    return 0;
  a2->msgh_bits = 0;
  a2->msgh_remote_port = 0;
  result = 1;
  a2[1].msgh_remote_port = 0;
  return result;
}

uint64_t sub_100003EC4()
{
  NSObject *v1;
  uint8_t v2[12];
  mach_port_t sp;

  sp = 0;
  if (bootstrap_check_in(bootstrap_port, "com.apple.NetworkLinkConditioner", &sp))
  {
    v1 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "bootstrap_check_in failed, no port to listen on", v2, 2u);
    }
    exit(104);
  }
  mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_10000C080);
  return mach_port_move_member(mach_task_self_, sp, dword_10000C080);
}

uint64_t sub_100003F80()
{
  return mach_msg_server((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100003E54, 0x2044u, dword_10000C080, 50331648);
}

uint64_t start(uint64_t a1, char **a2)
{
  char *v3;
  char *v4;
  uint64_t v5;
  unsigned int v6;
  char *errorbuf;

  errorbuf = 0;
  if (sandbox_init("nlcd", 1uLL, &errorbuf) == -1)
    sub_100006FE8((const char **)&errorbuf);
  v3 = *a2;
  v4 = strrchr(v3, 47);
  if (v4)
    v5 = (uint64_t)(v4 + 1);
  else
    v5 = (uint64_t)v3;
  qword_10000C078 = v5;
  off_10000C010 = os_log_create("com.apple.nlcd", "default");
  sub_100003EC4();
  v6 = time(0);
  srandom(v6);
  sub_100001E08();
  mach_msg_server((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100003E54, 0x2044u, dword_10000C080, 50331648);
  return 0;
}

uint64_t sub_100004058(const char *a1, int a2, _QWORD *a3)
{
  NSObject *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  int *v15;
  int v16;
  int v17;
  int v18;
  char v19;
  uint64_t v20;
  char v21;
  xpc_object_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  xpc_object_t v26;
  void *v27;
  int v28;
  NSObject *v29;
  xpc_object_t v30;
  void *v31;
  int v32;
  NSObject *v33;
  xpc_object_t v34;
  void *v35;
  char v36;
  NSObject *v37;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  int v43;
  uint64_t v44;
  uint64_t value;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;

  if (dword_10000C018)
  {
    v6 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "pf_add_pipe";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }
  if (!a1)
  {
    v10 = off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      goto LABEL_59;
    *(_DWORD *)buf = 136315138;
    v47 = "pf_add_pipe";
    v11 = "%s: conf == NULL";
LABEL_58:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
    goto LABEL_59;
  }
  v7 = *(_DWORD *)a1;
  if (a2)
  {
    if ((v7 & 4) == 0)
    {
      v8 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "pf_add_pipe";
        v9 = "%s: OUTDIR && !(conf->flags & NLC_FLAG_SIMULATE_UPLINK)";
LABEL_14:
        v12 = v8;
        v13 = 12;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v9, buf, v13);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    v15 = (int *)(a1 + 28);
  }
  else
  {
    if ((v7 & 8) == 0)
    {
      v8 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "pf_add_pipe";
        v9 = "%s: INDIR && !(conf->flags & NLC_FLAG_SIMULATE_DOWNLINK)";
        goto LABEL_14;
      }
LABEL_16:
      v14 = 0;
      goto LABEL_60;
    }
    v15 = (int *)(a1 + 64);
  }
  v16 = sub_1000023D8();
  if (v16 == -1)
  {
    v10 = off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      goto LABEL_59;
    *(_DWORD *)buf = 136315138;
    v47 = "pf_add_pipe";
    v11 = "%s: getDummynetPipeNumber() returned -1 ";
    goto LABEL_58;
  }
  v17 = v16;
  if ((sub_1000028CC(v16, (float *)v15) & 0x80000000) != 0)
  {
    v10 = off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      goto LABEL_59;
    *(_DWORD *)buf = 136315138;
    v47 = "pf_add_pipe";
    v11 = "%s: config_pipe() returned -1 ";
    goto LABEL_58;
  }
  v18 = 0;
  v19 = 1;
  if (a2)
    v20 = 2;
  else
    v20 = 1;
  v43 = v17;
  v44 = v17;
  value = v20;
  while (1)
  {
    v21 = v19;
    v22 = xpc_dictionary_create(0, 0, 0);
    if (!v22)
    {
      v39 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "pf_add_pipe";
        v48 = 1024;
        v49 = v43;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create pipe %d failed", buf, 0x12u);
      }
      goto LABEL_78;
    }
    v23 = v22;
    xpc_dictionary_set_uint64(v22, kPFAction, 0xBuLL);
    xpc_dictionary_set_uint64(v23, kPFDirection, value);
    xpc_dictionary_set_BOOL(v23, kPFQuick, 1);
    xpc_dictionary_set_BOOL(v23, kPFAllowOpts, 1);
    v24 = *((_DWORD *)a1 + 1);
    if (v24 == 2 || !(v24 | v18))
    {
      xpc_dictionary_set_uint64(v23, kPFFamily, 2uLL);
      if (v15[6] == 58)
        v25 = 1;
      else
        v25 = v15[6];
      goto LABEL_36;
    }
    if (v24 == 30 || (v18 & (v24 == 0)) != 0)
    {
      xpc_dictionary_set_uint64(v23, kPFFamily, 0x1EuLL);
      if (v15[6] == 1)
        v25 = 58;
      else
        v25 = v15[6];
LABEL_36:
      xpc_dictionary_set_uint64(v23, kPFProtocol, v25);
    }
    v26 = xpc_dictionary_create(0, 0, 0);
    if (!v26)
    {
      v40 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        goto LABEL_76;
      goto LABEL_77;
    }
    v27 = v26;
    xpc_dictionary_set_uint64(v26, kPFSubDummyNetPipe, v44);
    xpc_dictionary_set_uint64(v27, kPFSubDummyNetPipeType, 0x4000uLL);
    xpc_dictionary_set_value(v23, kPFDummyNet, v27);
    xpc_release(v27);
    v28 = v15[8];
    if (!v28)
      goto LABEL_43;
    v29 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "pf_add_pipe";
      v48 = 1024;
      v49 = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s: linkconfig->src_port %u", buf, 0x12u);
    }
    v30 = xpc_dictionary_create(0, 0, 0);
    if (!v30)
    {
      v40 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
LABEL_76:
        *(_DWORD *)buf = 136315394;
        v47 = "pf_add_pipe";
        v48 = 1024;
        v49 = v43;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create subrule_dn %d failed", buf, 0x12u);
      }
LABEL_77:
      xpc_release(v23);
LABEL_78:
      v14 = 12;
      goto LABEL_60;
    }
    v31 = v30;
    xpc_dictionary_set_string(v30, kPFSubAddressLabel, kPFAny);
    xpc_dictionary_set_uint64(v31, kPFSubLowPort, v15[8]);
    xpc_dictionary_set_uint64(v31, kPFSubPortOperator, 2uLL);
    xpc_dictionary_set_value(v23, kPFFrom, v31);
    xpc_release(v31);
LABEL_43:
    v32 = v15[7];
    if (v32)
    {
      v33 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "pf_add_pipe";
        v48 = 1024;
        v49 = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s: linkconfig->dst_port %u", buf, 0x12u);
      }
      v34 = xpc_dictionary_create(0, 0, 0);
      if (!v34)
      {
        v40 = off_10000C010;
        if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
          goto LABEL_76;
        goto LABEL_77;
      }
      v35 = v34;
      xpc_dictionary_set_string(v34, kPFSubAddressLabel, kPFAny);
      xpc_dictionary_set_uint64(v35, kPFSubLowPort, v15[7]);
      xpc_dictionary_set_uint64(v35, kPFSubPortOperator, 2uLL);
      xpc_dictionary_set_value(v23, kPFTo, v35);
      xpc_release(v35);
    }
    if (a1[12])
      xpc_dictionary_set_string(v23, kPFInterface, a1 + 12);
    v36 = PFUserAddRule(*a3, a3[1], v23);
    xpc_release(v23);
    if ((v36 & 1) == 0)
      break;
    v14 = *((unsigned int *)a1 + 1);
    if ((_DWORD)v14)
    {
      v42 = off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      *(_DWORD *)buf = 136315394;
      v47 = "pf_add_pipe";
      v48 = 1024;
      v49 = v14;
      v9 = "%s: done netlink->family != AF_UNSPEC %u";
      v12 = v42;
      v13 = 18;
      goto LABEL_15;
    }
    v19 = 0;
    v18 = 1;
    if ((v21 & 1) == 0)
      goto LABEL_60;
  }
  v41 = off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "pf_add_pipe";
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s: PFUserAddRule failed", buf, 0xCu);
  }
  sub_100002644(v43);
LABEL_59:
  v14 = 0xFFFFFFFFLL;
LABEL_60:
  if (dword_10000C018)
  {
    v37 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "pf_add_pipe";
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
    }
  }
  return v14;
}

uint64_t sub_100004904(_QWORD *a1)
{
  NSObject *v2;
  xpc_object_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;

  if (dword_10000C018)
  {
    v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "pf_add_noloopbackrule";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v11, 0xCu);
    }
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    xpc_dictionary_set_uint64(v3, kPFAction, 0xCuLL);
    xpc_dictionary_set_uint64(v4, kPFDirection, 0);
    xpc_dictionary_set_BOOL(v4, kPFQuick, 1);
    xpc_dictionary_set_string(v4, kPFInterface, "lo0");
    v5 = PFUserAddRule(*a1, a1[1], v4);
    xpc_release(v4);
    if ((v5 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v8 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "pf_add_noloopbackrule";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: PFUserAddRule failed", (uint8_t *)&v11, 0xCu);
      }
      v6 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    v7 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "pf_add_noloopbackrule";
      v6 = 12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create failed", (uint8_t *)&v11, 0xCu);
    }
    else
    {
      v6 = 12;
    }
  }
  if (dword_10000C018)
  {
    v9 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "pf_add_noloopbackrule";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v11, 0xCu);
    }
  }
  return v6;
}

uint64_t sub_100004B6C(_QWORD *a1)
{
  NSObject *v2;
  xpc_object_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;

  if (dword_10000C018)
  {
    v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "pf_add_allowoptsrule";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v11, 0xCu);
    }
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    xpc_dictionary_set_uint64(v3, kPFAction, 0);
    xpc_dictionary_set_uint64(v4, kPFDirection, 0);
    xpc_dictionary_set_BOOL(v4, kPFAllowOpts, 1);
    v5 = PFUserAddRule(*a1, a1[1], v4);
    xpc_release(v4);
    if ((v5 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v8 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "pf_add_allowoptsrule";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: PFUserAddRule failed", (uint8_t *)&v11, 0xCu);
      }
      v6 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    v7 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "pf_add_allowoptsrule";
      v6 = 12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create", (uint8_t *)&v11, 0xCu);
    }
    else
    {
      v6 = 12;
    }
  }
  if (dword_10000C018)
  {
    v9 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "pf_add_allowoptsrule";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v11, 0xCu);
    }
  }
  return v6;
}

uint64_t sub_100004DB8(_QWORD *a1)
{
  NSObject *v2;
  xpc_object_t v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  const char *v15;

  if (dword_10000C018)
  {
    v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "pf_add_scrubrule";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v14, 0xCu);
    }
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  if (!v3)
  {
    v9 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "pf_add_scrubrule";
      v8 = 12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create", (uint8_t *)&v14, 0xCu);
      goto LABEL_17;
    }
LABEL_13:
    v8 = 12;
    goto LABEL_17;
  }
  v4 = v3;
  xpc_dictionary_set_uint64(v3, kPFAction, 2uLL);
  xpc_dictionary_set_uint64(v4, kPFDirection, 0);
  v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5)
  {
    v10 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "pf_add_scrubrule";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s: xpc_dictionary_create subrule_scrub failed", (uint8_t *)&v14, 0xCu);
    }
    xpc_release(v4);
    goto LABEL_13;
  }
  v6 = v5;
  xpc_dictionary_set_uint64(v5, kPFSubScrubFlags, 0x100uLL);
  xpc_dictionary_set_value(v4, kPFScrubOptions, v6);
  xpc_release(v6);
  v7 = PFUserAddRule(*a1, a1[1], v4);
  xpc_release(v4);
  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v11 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "pf_add_scrubrule";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s: PFUserAddRule failed", (uint8_t *)&v14, 0xCu);
    }
    v8 = 0xFFFFFFFFLL;
  }
LABEL_17:
  if (dword_10000C018)
  {
    v12 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "pf_add_scrubrule";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v14, 0xCu);
    }
  }
  return v8;
}

uint64_t sub_100005098(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  size_t v5;
  xpc_object_t value;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  int v12;
  const char *v13;

  if (dword_10000C018)
  {
    v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "pf_delete_pipes";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v12, 0xCu);
    }
  }
  v3 = (void *)PFUserCopyRules_S(*a1);
  v4 = v3;
  if (v3)
  {
    if (xpc_array_get_count(v3))
    {
      v5 = 0;
      while (1)
      {
        value = xpc_array_get_value(v4, v5);
        if (!value)
          break;
        v7 = sub_1000052A4(value);
        if (v7 >= 1)
          sub_100002644(v7);
        if (xpc_array_get_count(v4) <= ++v5)
          goto LABEL_17;
      }
      v8 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        v12 = 136315138;
        v13 = "pf_delete_pipes";
        v9 = "%s: pf_delete_pipes failed";
        goto LABEL_16;
      }
    }
  }
  else
  {
    v8 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "pf_delete_pipes";
      v9 = "%s: PFUserCopyRules_S failed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, 0xCu);
    }
  }
LABEL_17:
  if (dword_10000C018)
  {
    v10 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "pf_delete_pipes";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v12, 0xCu);
    }
  }
  if (v4)
    xpc_release(v4);
  return 0;
}

uint64_t sub_1000052A4(void *a1)
{
  xpc_object_t value;
  void *v2;

  value = xpc_dictionary_get_value(a1, kPFDummyNet);
  if (value && (v2 = value, xpc_dictionary_get_uint64(value, kPFSubDummyNetPipeType) == 0x4000))
    return xpc_dictionary_get_uint64(v2, kPFSubDummyNetPipe);
  else
    return 0xFFFFFFFFLL;
}

BOOL sub_100005308(uint64_t a1)
{
  NSObject *v1;
  int v2;
  size_t count;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  uint64_t v9;
  const char **v10;
  xpc_object_t value;
  void *v12;
  int v13;
  const char **v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  int v21;
  xpc_object_t v22;
  void *v23;
  xpc_object_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  int v29;
  __int128 v30;
  int v31;
  __int128 v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  NSObject *v37;
  uint32_t v38;
  NSObject *v39;
  uint64_t uint64;
  uint64_t v42;
  uint64_t v43;
  _DWORD *v45;
  unint64_t v46;
  xpc_object_t xarray;
  uint64_t v48[2];
  __int128 v49;
  __int128 v50;
  int v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  __int128 v56;
  int v57;

  v56 = 0uLL;
  v57 = 0;
  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v48[0] = 0;
  v48[1] = 0;
  if (dword_10000C018)
  {
    v1 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "pf_list_rules";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }
  v2 = sub_1000059D0(v48);
  if (v2)
    goto LABEL_63;
  xarray = (xpc_object_t)PFUserCopyRules_S(v48[0]);
  if (!xarray)
  {
    v33 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "pf_list_rules";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s: PFUserCopyRules_S failed", buf, 0xCu);
    }
    goto LABEL_63;
  }
  count = xpc_array_get_count(xarray);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 0;
  v46 = count;
  if (!count)
    goto LABEL_62;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v43 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0xFFFFFFFFLL;
  v10 = (const char **)&kPFProtocol;
  while (1)
  {
    value = xpc_array_get_value(xarray, v4);
    if (!value)
    {
      v34 = off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        goto LABEL_62;
      *(_DWORD *)buf = 136315138;
      v53 = "pf_list_rules";
      v35 = "%s: PFGetUserRules_S failed";
      goto LABEL_60;
    }
    v12 = value;
    v13 = sub_1000052A4(value);
    if (v13 < 0)
    {
      v20 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "pf_list_rules";
        v54 = 1024;
        v55 = v13;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s: rule_pipenum %d < 0", buf, 0x12u);
      }
      goto LABEL_46;
    }
    v45 = v7;
    if (v46 > v8 + 1)
    {
      v42 = v5;
      v14 = v10;
      v15 = v9;
      v16 = v6;
      v17 = xpc_array_get_value(xarray, v8 + 1);
      if (!v17)
      {
        v34 = off_10000C010;
        if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
          goto LABEL_62;
        *(_DWORD *)buf = 136315138;
        v53 = "pf_list_rules";
        v35 = "%s: PFGetUserRules_S failed";
        goto LABEL_60;
      }
      v18 = v17;
      v19 = sub_1000052A4(v17);
      if (v19 >= 1 && v13 == v19)
      {
        uint64 = xpc_dictionary_get_uint64(v12, kPFDirection);
        if (uint64 == xpc_dictionary_get_uint64(v18, kPFDirection))
        {
          ++v8;
          v6 = 1;
        }
        else
        {
          v6 = v16;
        }
      }
      else
      {
        v6 = v16;
      }
      v9 = v15;
      v10 = v14;
      v5 = v42;
    }
    if ((int)sub_100002A70(v13, (uint64_t)&v49) <= 0)
      break;
    v21 = 0;
    v56 = 0uLL;
    v57 = 0;
    if (!(_DWORD)v6)
      v21 = xpc_dictionary_get_uint64(v12, kPFFamily);
    DWORD2(v50) = xpc_dictionary_get_uint64(v12, *v10);
    v22 = xpc_dictionary_get_value(v12, kPFFrom);
    if (v22)
    {
      v23 = v22;
      if (xpc_dictionary_get_uint64(v22, kPFSubPortOperator) == 2)
        v51 = xpc_dictionary_get_uint64(v23, kPFSubLowPort);
    }
    v24 = xpc_dictionary_get_value(v12, kPFTo);
    if (v24)
    {
      v25 = v24;
      if (xpc_dictionary_get_uint64(v24, kPFSubPortOperator) == 2)
        HIDWORD(v50) = xpc_dictionary_get_uint64(v25, kPFSubLowPort);
    }
    if (!v45 || v21 != *v45 && (*v45 != 2 || v21 != 30 || DWORD2(v50) != 58 || *(_DWORD *)(v43 + 24) != 1))
    {
      xpc_dictionary_get_uint64(v12, kPFDirection);
LABEL_41:
      if ((int)v9 < 1)
      {
        v5 = a1 + 100 * ((int)v9 + 1) + 8;
        v9 = (int)v9 + 1;
        goto LABEL_43;
      }
      v34 = off_10000C010;
      if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        goto LABEL_62;
      *(_DWORD *)buf = 136315138;
      v53 = "pf_list_rules";
      v35 = "%s: too many configs, giving up";
LABEL_60:
      v37 = v34;
      v38 = 12;
      goto LABEL_61;
    }
    v26 = xpc_dictionary_get_uint64(v12, kPFDirection);
    if (v26 != 2)
    {
      if (v26 != 1 || (*(_BYTE *)v5 & 8) == 0)
        goto LABEL_43;
      goto LABEL_41;
    }
    if ((*(_BYTE *)v5 & 4) != 0)
      goto LABEL_41;
LABEL_43:
    *(_DWORD *)(v5 + 4) = v21;
    v7 = (_DWORD *)(v5 + 4);
    v27 = v56;
    *(_DWORD *)(v5 + 24) = v57;
    *(_OWORD *)(v5 + 8) = v27;
    v28 = xpc_dictionary_get_uint64(v12, kPFDirection);
    v29 = *(_DWORD *)v5;
    if (v28 == 1)
    {
      *(_DWORD *)v5 = v29 | 8;
      v43 = v5 + 64;
      v30 = v50;
      *(_OWORD *)(v5 + 64) = v49;
      *(_OWORD *)(v5 + 80) = v30;
      *(_DWORD *)(v5 + 96) = v51;
    }
    else
    {
      *(_DWORD *)v5 = v29 | 4;
      v43 = v5 + 28;
      v31 = v51;
      v32 = v50;
      *(_OWORD *)(v5 + 28) = v49;
      *(_OWORD *)(v5 + 44) = v32;
      *(_DWORD *)(v5 + 60) = v31;
    }
LABEL_46:
    v4 = ++v8;
    if (v46 <= v8)
      goto LABEL_62;
  }
  v36 = off_10000C010;
  if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    goto LABEL_62;
  *(_DWORD *)buf = 136315394;
  v53 = "pf_list_rules";
  v54 = 1024;
  v55 = v13;
  v35 = "%s: unknown pipe %d";
  v37 = v36;
  v38 = 18;
LABEL_61:
  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v35, buf, v38);
LABEL_62:
  xpc_release(xarray);
  v2 = 0;
LABEL_63:
  sub_100005BE8(v48);
  if (dword_10000C018)
  {
    v39 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "pf_list_rules";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
    }
  }
  return v2 == 0;
}

uint64_t sub_1000059D0(uint64_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;

  if (dword_10000C018)
  {
    v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v11, 0xCu);
    }
  }
  *a1 = 0;
  a1[1] = 0;
  v3 = PFUserCreate(kPFNLC, kPFBase, &_dispatch_main_q, 0);
  if (v3)
  {
    v4 = v3;
    v5 = PFUserBeginRules();
    if (v5 != -1)
    {
      v6 = v5;
      result = 0;
      *a1 = v4;
      a1[1] = v6;
      return result;
    }
    v9 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: PFUserBeginRules failed", (uint8_t *)&v11, 0xCu);
    }
    PFUserRelease(v4, 0);
  }
  else
  {
    v8 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: PFUserCreate failed", (uint8_t *)&v11, 0xCu);
    }
  }
  if (dword_10000C018)
  {
    v10 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "makePFContext";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v11, 0xCu);
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_100005BE8(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  const char *v5;

  if (dword_10000C018)
  {
    v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "cleanPFContext";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", (uint8_t *)&v4, 0xCu);
    }
  }
  if (*a1)
    PFUserRelease(*a1, 0);
  *a1 = 0;
  a1[1] = 0;
  if (dword_10000C018)
  {
    v3 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "cleanPFContext";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:end", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t sub_100005D10(int a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[4];
  const char *v26;
  uint8_t buf[24];

  if (dword_10000C018)
  {
    v4 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "pf_find_token";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }
  *(_OWORD *)buf = 0uLL;
  if (ioctl(a1, 0xC0104405uLL, buf) < 0)
  {
    if (*__error() == 2)
      goto LABEL_18;
    v12 = off_10000C010;
    if (!os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    *(_DWORD *)v25 = 136315138;
    v26 = "pf_find_token";
    v13 = "%s: DIOCGETSTARTERS failed";
    v14 = v12;
    v15 = 12;
    goto LABEL_17;
  }
  v5 = malloc_type_malloc(2 * *(int *)buf, 0x285F6EEuLL);
  if (v5)
  {
    v6 = v5;
    *(_QWORD *)&buf[8] = v5;
    if (ioctl(a1, 0xC0104405uLL, buf) < 0)
    {
      if (*__error() != 2)
      {
        v18 = off_10000C010;
        if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v25 = 136315138;
          v26 = "pf_find_token";
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s: DIOCGETSTARTERS failed", v25, 0xCu);
        }
      }
    }
    else
    {
      v7 = *(_DWORD *)buf;
      if (*(int *)buf >= 1)
      {
        v8 = 0;
        v9 = *(_QWORD *)&buf[8];
        v10 = (const char *)qword_10000C078;
        while (1)
        {
          v11 = v9 + v8;
          if (!strcmp((const char *)(v9 + v8 + 20), v10))
            break;
          v8 += 84;
          if ((int)v8 >= v7)
            goto LABEL_22;
        }
        v21 = *(_OWORD *)(v11 + 16);
        *(_OWORD *)a2 = *(_OWORD *)v11;
        *(_OWORD *)(a2 + 16) = v21;
        v22 = *(_OWORD *)(v11 + 32);
        v23 = *(_OWORD *)(v11 + 48);
        v24 = *(_OWORD *)(v11 + 64);
        *(_DWORD *)(a2 + 80) = *(_DWORD *)(v11 + 80);
        *(_OWORD *)(a2 + 48) = v23;
        *(_OWORD *)(a2 + 64) = v24;
        *(_OWORD *)(a2 + 32) = v22;
        v17 = 1;
        goto LABEL_23;
      }
    }
LABEL_22:
    v17 = 0;
LABEL_23:
    free(v6);
    goto LABEL_24;
  }
  v16 = off_10000C010;
  if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v25 = 0;
    v13 = "malloc";
    v14 = v16;
    v15 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, v25, v15);
  }
LABEL_18:
  v17 = 0;
LABEL_24:
  if (dword_10000C018)
  {
    v19 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v25 = 136315138;
      v26 = "pf_find_token";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s:end", v25, 0xCu);
    }
  }
  return v17;
}

uint64_t sub_10000601C()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v5[2];
  uint8_t buf[4];
  const char *v7;

  v5[0] = 0;
  v5[1] = 0;
  if (dword_10000C018)
  {
    v0 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "pf_delete_rules";
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }
  if (sub_1000059D0(v5))
    goto LABEL_9;
  sub_100005098(v5);
  if ((PFUserDeleteRules(v5[0], 0, 0) & 1) == 0)
  {
    v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "pf_delete_rules";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: PFUserCommitRules failed", buf, 0xCu);
    }
LABEL_9:
    v1 = 0;
    goto LABEL_10;
  }
  v1 = 1;
LABEL_10:
  sub_100005BE8(v5);
  if (dword_10000C018)
  {
    v3 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "pf_delete_rules";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
    }
  }
  return v1;
}

uint64_t sub_1000061C0(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  char v5;
  char v6;
  uint64_t v7;
  const char *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;

  v20 = 0;
  v21 = 0;
  if (dword_10000C018)
  {
    v2 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "pf_add_rules";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
    }
  }
  if (sub_10000601C())
  {
    if (sub_1000059D0(&v20) || sub_100004B6C(&v20) || sub_100004DB8(&v20))
      goto LABEL_35;
    v3 = 0;
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = v5;
      v7 = a1 + 100 * v3;
      v9 = *(_DWORD *)(v7 + 8);
      v8 = (const char *)(v7 + 8);
      if (v9)
      {
        if (v4)
        {
          v4 = 1;
        }
        else if (*(_DWORD *)(a1 + 100 * v3 + 16))
        {
          sub_100004904(&v20);
          v4 = v6 & 1;
        }
        else
        {
          v4 = 0;
        }
        if (sub_100004058(v8, 0, &v20) || sub_100004058(v8, 1, &v20))
          goto LABEL_35;
      }
      else
      {
        v10 = off_10000C010;
        if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v23 = "pf_add_rules";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s: done conf->flags == 0", buf, 0xCu);
        }
      }
      v5 = 0;
      v3 = 1;
    }
    while ((v6 & 1) != 0);
    if (dword_10000C018)
    {
      v11 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "commitChange";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:begin", buf, 0xCu);
      }
    }
    if ((PFUserCommitRules(v20, v21, 0, 0) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v15 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "commitChange";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s: PFUserCommitRules failed", buf, 0xCu);
      }
      v12 = -1;
    }
    if (dword_10000C018)
    {
      v16 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "commitChange";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
      }
    }
    if (v12)
    {
LABEL_35:
      v17 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "pf_add_rules";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s: result != 0", buf, 0xCu);
      }
      sub_100005098(&v20);
      v14 = 0;
    }
    else
    {
      v14 = 1;
    }
    sub_100005BE8(&v20);
    if (dword_10000C018)
    {
      v18 = off_10000C010;
      if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "pf_add_rules";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:end", buf, 0xCu);
      }
    }
  }
  else
  {
    v13 = off_10000C010;
    if (os_log_type_enabled((os_log_t)off_10000C010, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "pf_add_rules";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: pf_delete_rules() failed", buf, 0xCu);
    }
    return 0;
  }
  return v14;
}

uint64_t sub_1000065E8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 40273) >= 0xFFFFFFFB)
    return (uint64_t)*(&off_1000082C0 + 5 * (v1 - 40268) + 5);
  else
    return 0;
}

_DWORD *sub_100006624(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_8;
  }
  *(_QWORD *)(a2 + 32) = 0x11000000000000;
  v5 = result[3];
  v6 = *(_OWORD *)(v3 + 9);
  v7[0] = *(_OWORD *)(v3 + 5);
  v7[1] = v6;
  result = (_DWORD *)sub_100001F4C(v5, (mach_port_name_t *)(a2 + 28), (_DWORD *)(a2 + 48), (int *)(a2 + 52), v7);
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_1000066FC(_DWORD *result, uint64_t a2)
{
  NDR_record_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_1000022E4(result[3], result[8], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10000677C(_DWORD *result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  NDR_record_t v7;

  if ((*result & 0x80000000) != 0
    || (v3 = result[1], v3 < 0x28)
    || v3 > 0x428
    || (v4 = result[8], v4 > 0x400)
    || ((v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 40 >= v4) ? (v6 = v3 == v5 + 40) : (v6 = 0), !v6))
  {
    *(_DWORD *)(a2 + 32) = -304;
    v7 = NDR_record;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = v7;
    return result;
  }
  result = (_DWORD *)sub_1000018E4(result[3], result + 9, v4, *(unsigned int *)((char *)result + v5 + 36), (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v7 = NDR_record;
  if ((_DWORD)result)
    goto LABEL_10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

_DWORD *sub_100006830(_DWORD *result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  NDR_record_t v7;

  if ((*result & 0x80000000) != 0
    || (v3 = result[1], v3 < 0x28)
    || v3 > 0x428
    || (v4 = result[8], v4 > 0x400)
    || ((v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 40 >= v4) ? (v6 = v3 == v5 + 40) : (v6 = 0), !v6))
  {
    *(_DWORD *)(a2 + 32) = -304;
    v7 = NDR_record;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = v7;
    return result;
  }
  result = (_DWORD *)sub_100001A5C(result[3], result + 9, v4, *(unsigned int *)((char *)result + v5 + 36), (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v7 = NDR_record;
  if ((_DWORD)result)
    goto LABEL_10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

_DWORD *sub_1000068E4(_DWORD *result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  NDR_record_t v7;
  uint64_t v8;
  int v9;

  if ((*result & 0x80000000) == 0
    && (v3 = result[1], v3 >= 0x28)
    && v3 <= 0x428
    && (v4 = result[8], v4 <= 0x400)
    && ((v5 = (v4 + 3) & 0xFFFFFFFC, v3 - 40 >= v4) ? (v6 = v3 == v5 + 40) : (v6 = 0), v6))
  {
    v9 = 0;
    *(_DWORD *)(a2 + 36) = 1024;
    result = (_DWORD *)sub_100001C1C(result[3], result + 9, v4, (_OWORD *)(a2 + 40), (_DWORD *)(a2 + 36), *(unsigned int *)((char *)result + v5 + 36), &v9);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v7 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      v8 = (*(_DWORD *)(a2 + 36) + 3) & 0xFFFFFFFC;
      *(_DWORD *)(a2 + 4) = v8 + 44;
      *(_DWORD *)(a2 + v8 + 40) = v9;
      return result;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    v7 = NDR_record;
  }
  *(NDR_record_t *)(a2 + 24) = v7;
  return result;
}

uint64_t sub_1000069D0(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 40273) >= 0xFFFFFFFB
    && (v5 = (void (*)(void))*(&off_1000082C0 + 5 * (v4 - 40268) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100006A60(int a1)
{
  int *v2;
  char *v3;
  _DWORD v4[2];
  __int16 v5;
  char *v6;

  v2 = __error();
  v3 = strerror(*v2);
  v4[0] = 67109378;
  v4[1] = a1;
  v5 = 2080;
  v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "error getting enable_netagent sysctl err(%d) %s", (uint8_t *)v4, 0x12u);
}

void sub_100006B00(int *a1, int a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "error setting enable_netagent sysctl to %d, err(%d)", (uint8_t *)v3, 0xEu);
}

void sub_100006B8C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "NetEm simulation failure, fall back to packetfilter", v0, 2u);
}

void sub_100006BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003E00((void *)&_mh_execute_header, &_os_log_default, a3, "socket err", a5, a6, a7, a8, 0);
  sub_100003E1C();
}

void sub_100006C04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100003E3C();
  sub_100003DF0((void *)&_mh_execute_header, &_os_log_default, v0, "link params cannot be set on %s", v1, v2, v3, v4, v5);
  sub_100003E24();
}

void sub_100006C6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100003E3C();
  sub_100003DF0((void *)&_mh_execute_header, &_os_log_default, v0, "%s: no device", v1, v2, v3, v4, v5);
  sub_100003E24();
}

void sub_100006CD4(uint64_t a1)
{
  int *v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;

  v2 = __error();
  strerror(*v2);
  sub_100003E3C();
  v4 = 2080;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ioctl set link params error %s on %s", v3, 0x16u);
}

void sub_100006D70(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  sub_100003E48(a1, a3, *(_QWORD *)(a2 + 8), 4.8149e-34);
  sub_100003E10((void *)&_mh_execute_header, &_os_log_default, v3, "%s not UP, skipped", v4);
}

void sub_100006DB0(float *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  sub_100003E48(a1, a3, *a2, 4.8149e-34);
  sub_100003E10((void *)&_mh_execute_header, &_os_log_default, v3, "%s not in conditionable list, skip", v4);
}

void sub_100006DF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  sub_100003E2C((void *)&_mh_execute_header, &_os_log_default, v0, "getifaddrs %{errno}d", v1, v2, v3, v4, 0);
  sub_100003E1C();
}

void sub_100006E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003E00((void *)&_mh_execute_header, &_os_log_default, a3, "netem disable err", a5, a6, a7, a8, 0);
  sub_100003E1C();
}

void sub_100006E98(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  sub_100003E48(a1, a3, *(_QWORD *)(a2 + 8), 4.8149e-34);
  sub_100003E10((void *)&_mh_execute_header, &_os_log_default, v3, "%s not up, skip", v4);
}

void sub_100006ED8(uint8_t *buf, _BYTE *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ioctl (get link params)", buf, 2u);
}

void sub_100006F18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100003E3C();
  sub_100003DF0((void *)&_mh_execute_header, &_os_log_default, v0, "bad bps %llu, min 1Kbps", v1, v2, v3, v4, v5);
  sub_100003E24();
}

void sub_100006F80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100003E3C();
  sub_100003DF0((void *)&_mh_execute_header, &_os_log_default, v0, "SIOCGIFTYPE %s", v1, v2, v3, v4, v5);
  sub_100003E24();
}

void sub_100006FE8(const char **a1)
{
  errx(71, "sandbox_init(%s): %s", "nlcd", *a1);
}
