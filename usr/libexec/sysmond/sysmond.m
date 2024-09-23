uint64_t start()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _xpc_connection_s *mach_service;

  if (mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_10000CDB8))
  {
    v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v0)
      sub_100007478(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    if (!mach_port_insert_right(mach_task_self_, dword_10000CDB8, dword_10000CDB8, 0x14u))
    {
      mach_service = xpc_connection_create_mach_service(SYSMON_XPC_SERVICE_NAME, 0, 1uLL);
      xpc_connection_set_event_handler(mach_service, &stru_1000083B8);
      xpc_connection_resume(mach_service);
      dispatch_main();
    }
    v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v8)
      sub_100007440(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  return 0xFFFFFFFFLL;
}

void sub_100004220(id a1, void *a2)
{
  void *v3;
  void *v4;
  void **v5;
  __int128 v6;
  void *v7;
  void *v8;

  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    v3 = (void *)xpc_connection_copy_entitlement_value(a2, "com.apple.sysmond.client");
    if (v3 && (v4 = v3, xpc_release(v3), v4 == &_xpc_BOOL_true))
    {
      v5 = _NSConcreteStackBlock;
      *(_QWORD *)&v6 = 0x40000000;
      *((_QWORD *)&v6 + 1) = sub_100004370;
      v7 = &unk_1000083D8;
      v8 = a2;
      xpc_connection_set_event_handler((xpc_connection_t)a2, &v5);
      xpc_connection_resume((xpc_connection_t)a2);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v5) = 67109378;
        HIDWORD(v5) = xpc_connection_get_pid((xpc_connection_t)a2);
        LOWORD(v6) = 2080;
        *(_QWORD *)((char *)&v6 + 2) = "com.apple.sysmond.client";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Client %d denied; missing \"%s\" entitlement.",
          (uint8_t *)&v5,
          0x12u);
      }
      xpc_connection_cancel((xpc_connection_t)a2);
    }
  }
}

void sub_100004370(uint64_t a1, xpc_object_t object)
{
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = sub_100005B20(object);
    if (v4)
    {
      v5 = v4;
      v6 = sub_100005BCC(v4);
      _os_object_release(v5);
      xpc_dictionary_set_mach_send(v6, "force_deserialization_on_clientside", dword_10000CDB8);
      if (v6)
      {
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v6);
        xpc_release(v6);
      }
    }
    else
    {
      xpc_dictionary_set_mach_send(0, "force_deserialization_on_clientside", dword_10000CDB8);
    }
  }
}

void sub_10000442C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

BOOL sub_10000443C(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v5[2];
  uint64_t v6[2];
  uint64_t v7[2];
  __int128 v8;
  _OWORD v9[2];
  int64_t value[2];
  int64_t v11[2];
  __int128 v12;
  uint64_t v13[2];
  uint64_t v14[2];
  __int128 v15;

  *(_OWORD *)v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  *(_OWORD *)v13 = 0u;
  *(_OWORD *)value = 0u;
  *(_OWORD *)v11 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)v7 = 0u;
  v8 = 0u;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)v6 = 0u;
  v2 = sub_100005AB0(a1);
  v3 = proc_pidinfo(v2, 18, 0, v5, 192);
  if (v3 == 192)
  {
    if (HIDWORD(v5[1]) != v2)
      sub_1000074B0();
    sub_100006344(a1, 1, LODWORD(v5[0]));
    sub_100006344(a1, 2, HIDWORD(v5[0]));
    sub_100006344(a1, 3, LODWORD(v5[1]));
    sub_100006344(a1, 5, LODWORD(v6[0]));
    sub_100006344(a1, 6, HIDWORD(v6[0]));
    sub_100006344(a1, 7, LODWORD(v6[1]));
    sub_100006344(a1, 8, HIDWORD(v6[1]));
    sub_100006344(a1, 9, LODWORD(v7[0]));
    sub_100006344(a1, 10, HIDWORD(v7[0]));
    sub_100006344(a1, 11, LODWORD(v7[1]));
    sub_100006418(a1, 12, (char *)&v8);
    sub_100006418(a1, 13, (char *)v9);
    sub_100006344(a1, 14, LODWORD(value[0]));
    sub_100006344(a1, 15, HIDWORD(value[0]));
    sub_100006344(a1, 16, LODWORD(value[1]));
    sub_1000062FC(a1, 17, SHIDWORD(value[1]));
    sub_100006344(a1, 18, LODWORD(v11[0]));
    sub_1000062FC(a1, 19, SHIDWORD(v11[0]));
    sub_1000063D0(a1, 20, 1000000000 * v11[1] + 1000 * v12);
    sub_100006344(a1, 55, LODWORD(v6[0]));
    sub_1000062B4(a1, 56, (v5[0] & 0x800000) != 0);
    sub_100006344(a1, 69, v13[1]);
    sub_100006344(a1, 70, v14[0]);
    sub_100006344(a1, 71, 0);
  }
  return v3 == 192;
}

BOOL sub_10000468C(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9[2];
  __int128 v10;
  __int128 v11;
  int64_t value[2];
  int64_t v13[2];
  int64_t v14[2];

  *(_OWORD *)v13 = 0u;
  *(_OWORD *)v14 = 0u;
  v11 = 0u;
  *(_OWORD *)value = 0u;
  *(_OWORD *)v9 = 0u;
  v10 = 0u;
  v2 = sub_100005AB0(a1);
  v3 = proc_pidinfo(v2, 4, 0, v9, 96);
  if (v3 == 96)
  {
    sub_100006344(a1, 21, v9[0]);
    sub_100006344(a1, 22, v9[1]);
    v4 = sub_100004830(v10);
    sub_100006344(a1, 23, v4);
    v5 = sub_100004830(*((unint64_t *)&v10 + 1));
    sub_100006344(a1, 24, v5);
    v6 = sub_100004830(v11);
    sub_100006344(a1, 25, v6);
    v7 = sub_100004830(*((unint64_t *)&v11 + 1));
    sub_100006344(a1, 26, v7);
    sub_1000062FC(a1, 27, SLODWORD(value[0]));
    sub_1000062FC(a1, 28, SHIDWORD(value[0]));
    sub_100006344(a1, 29, value[1] & ~(SLODWORD(value[1]) >> 31));
    sub_1000062FC(a1, 30, SHIDWORD(value[1]));
    sub_1000062FC(a1, 31, SLODWORD(v13[0]));
    sub_1000062FC(a1, 32, SHIDWORD(v13[0]));
    sub_1000062FC(a1, 33, SLODWORD(v13[1]));
    sub_1000062FC(a1, 34, SHIDWORD(v13[1]));
    sub_1000062FC(a1, 35, SLODWORD(v14[0]));
    sub_1000062FC(a1, 36, SHIDWORD(v14[0]));
    sub_1000062FC(a1, 37, SLODWORD(v14[1]));
    sub_1000062FC(a1, 38, SHIDWORD(v14[1]));
  }
  return v3 == 96;
}

unint64_t sub_100004830(unint64_t a1)
{
  if (qword_10000CDC0 != -1)
    dispatch_once(&qword_10000CDC0, &stru_100008418);
  return (unint64_t)(*(double *)&qword_10000CAF0 * (double)a1 / *(double *)&qword_10000CAF8);
}

BOOL sub_100004894(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t value;
  uint64_t v6;

  value = 0;
  v6 = 0;
  v2 = sub_100005AB0(a1);
  v3 = proc_pidinfo(v2, 12, 0, &value, 16);
  if (v3 == 16)
  {
    sub_100006344(a1, 39, value);
    sub_100006344(a1, 40, HIDWORD(value));
    sub_100006344(a1, 41, v6);
    sub_100006344(a1, 42, HIDWORD(v6));
  }
  return v3 == 16;
}

BOOL sub_100004928(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  unint64_t v12;
  xpc_object_t v13;
  _OWORD v15[27];
  uint64_t v16;
  rusage_info_t buffer[2];
  __int128 v18;
  int8x16_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  *(_OWORD *)buffer = 0u;
  v18 = 0u;
  v2 = sub_100005AB0(a1);
  v3 = proc_pid_rusage(v2, 2, buffer);
  if (!v3)
  {
    sub_100006344(a1, 63, v22);
    v4 = mach_absolute_time();
    v5 = v4 - v22;
    v6 = sub_100004830(v4 - v22);
    sub_100006344(a1, 61, v6);
    v7 = sub_100004830(v18);
    sub_100006344(a1, 23, v7);
    v8 = sub_100004830(*((unint64_t *)&v18 + 1));
    sub_100006344(a1, 24, v8);
    sub_100006344(a1, 47, v19.u64[0]);
    sub_100006344(a1, 46, v19.u64[1]);
    sub_100006344(a1, 29, v20);
    sub_100006344(a1, 65, *((uint64_t *)&v20 + 1));
    sub_100006344(a1, 22, v21);
    sub_100006344(a1, 66, *((uint64_t *)&v21 + 1));
    v16 = 0;
    memset(v15, 0, sizeof(v15));
    v9 = sub_100005AB8(a1);
    pm_sample_task_and_pid(v9, v2, v15, v4, -28);
    *(_OWORD *)((char *)&v15[8] + 4) = v18;
    *(int8x16_t *)((char *)&v15[9] + 4) = vextq_s8(v19, v19, 8uLL);
    *(_OWORD *)((char *)&v15[19] + 8) = v26;
    *((_QWORD *)&v15[20] + 1) = v20;
    v10 = pm_energy_impact(v15);
    if (sub_100005AB0(a1))
    {
      v11 = v10 * 1000000000.0;
      sub_100006344(a1, 60, (unint64_t)v11);
      v12 = sub_100004830(v5);
      sub_10000638C(a1, 62, (double)(unint64_t)v11 * 100.0 / (double)v12);
    }
    else
    {
      sub_100006344(a1, 60, 0);
    }
    v13 = xpc_uuid_create((const unsigned __int8 *)buffer);
    sub_100006264(a1, 64, (uint64_t)v13);
    xpc_release(v13);
    sub_100006344(a1, 72, v26);
    sub_100006344(a1, 73, *((uint64_t *)&v26 + 1));
  }
  return v3 == 0;
}

BOOL sub_100004BDC(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t value[2];
  __int128 v6;
  uint64_t v7;

  v7 = 0;
  *(_OWORD *)value = 0u;
  v6 = 0u;
  v2 = sub_100005AB0(a1);
  v3 = proc_pidinfo(v2, 20, 1uLL, value, 40);
  if (v3 == 40)
    sub_100006344(a1, 75, value[0]);
  return v3 == 40;
}

void sub_100004C48(id a1)
{
  kern_return_t v1;
  unint64_t v2;
  unint64_t v3;
  mach_timebase_info info;

  info = 0;
  v1 = mach_timebase_info(&info);
  if (v1)
  {
    _os_assumes_log(v1);
  }
  else
  {
    LODWORD(v2) = info.numer;
    LODWORD(v3) = info.denom;
    *(double *)&qword_10000CAF0 = (double)v2;
    *(double *)&qword_10000CAF8 = (double)v3;
  }
}

_QWORD *sub_100004C98(void *a1, uint64_t a2)
{
  _QWORD *v4;
  xpc_object_t v5;
  size_t v6;

  v4 = (_QWORD *)sub_100005DD0();
  v5 = xpc_retain(a1);
  v4[2] = v5;
  v6 = sub_100006038(v5);
  v4[3] = v6;
  v4[4] = malloc_type_calloc(v6, 8uLL, 0x80040B8603338uLL);
  v4[5] = a2;
  sub_100006344((uint64_t)v4, 1, a2);
  return v4;
}

xpc_object_t sub_100004D0C(uint64_t a1)
{
  xpc_object_t v2;
  unsigned int v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  int *v14;
  uint64_t *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  _QWORD v24[2];
  void (*v25)(uint64_t, uint64_t);
  void *v26;
  uint64_t v27;
  xpc_object_t v28;
  _OWORD buffer[2];
  uint64_t v30;

  v2 = xpc_array_create(0, 0);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 0x40000000;
  v25 = sub_100004F0C;
  v26 = &unk_100008520;
  v27 = a1;
  v28 = v2;
  v3 = proc_listpids(1u, 0, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    v4 = v3;
    v5 = malloc_type_malloc(v3, 0xCC3D7942uLL);
    if (v5)
    {
      v6 = v5;
      while (1)
      {
        v7 = proc_listpids(1u, 0, v6, v4);
        if ((v7 & 0x80000000) != 0)
        {
          v9 = (uint64_t *)v6;
          goto LABEL_26;
        }
        v8 = v7;
        if (v4 >= v7 + 4)
          break;
        v4 += 64;
        v6 = reallocf(v6, v4);
        if (!v6)
          return v2;
      }
      v10 = v7 >> 2;
      v11 = (uint64_t *)malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
      v12 = v11;
      if (v8 >= 4)
      {
        if (v10 <= 1)
          v13 = 1;
        else
          v13 = v8 >> 2;
        v14 = (int *)v6;
        v15 = v11;
        do
        {
          v16 = *v14++;
          v30 = 0;
          memset(buffer, 0, sizeof(buffer));
          v17 = proc_pidinfo(v16, 20, 1uLL, buffer, 40);
          v18 = *(_QWORD *)&buffer[0];
          if (v17 != 40)
            v18 = 1;
          *v15++ = v18;
          --v13;
        }
        while (v13);
      }
      free(v6);
      qsort_b(v12, v8 >> 2, 8uLL, &stru_100008560);
      if (*v12 != 1)
        sub_1000074B0();
      sub_100004F0C((uint64_t)v24, 1uLL);
      if (v8 >= 8)
      {
        v19 = 2;
        if (v10 > 2)
          v19 = v8 >> 2;
        v20 = v19 - 1;
        v21 = v12 + 1;
        v22 = 1;
        do
        {
          if (*v21 != v22)
          {
            ((void (*)(_QWORD *))v25)(v24);
            v22 = *v21;
          }
          ++v21;
          --v20;
        }
        while (v20);
      }
      v9 = v12;
LABEL_26:
      free(v9);
    }
  }
  return v2;
}

void sub_100004F0C(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  xpc_object_t v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = sub_100004C98(*(void **)(a1 + 32), a2);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000;
  v6[2] = sub_100004FDC;
  v6[3] = &unk_100008500;
  v6[4] = &v7;
  v6[5] = v3;
  sub_100005FA0(v4, (uint64_t)v6);
  if (!*((_BYTE *)v8 + 24))
  {
    v5 = sub_100006194((uint64_t)v3);
    xpc_array_set_value(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v5);
    xpc_release(v5);
  }
  j___os_object_release(v3);
  _Block_object_dispose(&v7, 8);
}

uint64_t sub_100004FDC(uint64_t result, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = result;
  v4 = 0;
  while (1)
  {
    if (dword_100008438[v4] == a2)
    {
      result = sub_100006224(*(_QWORD *)(v3 + 40), a2);
      if ((result & 1) == 0)
      {
        result = (*(uint64_t (**)(_QWORD))&dword_100008438[v4 + 2])(*(_QWORD *)(v3 + 40));
        if ((result & 1) == 0)
          break;
      }
    }
    v4 += 4;
    if (v4 == 48)
      return result;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = 1;
  return result;
}

BOOL sub_100005060(uint64_t a1)
{
  int v2;
  double v3;
  uint64_t value[2];
  uint64_t v6[2];
  uint64_t v7[2];
  uint64_t v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
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
  _OWORD v27[8];
  __int128 v28;
  int v29;
  _BYTE v30[28];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _BYTE v40[24];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)v7 = 0u;
  *(_OWORD *)v8 = 0u;
  *(_OWORD *)value = 0u;
  *(_OWORD *)v6 = 0u;
  v2 = coalition_info_resource_usage(*(_QWORD *)(a1 + 40), value, 352);
  if (!v2)
  {
    sub_100006344(a1, 2, value[0]);
    sub_100006344(a1, 3, value[1]);
    sub_100006344(a1, 4, v6[0]);
    sub_100006344(a1, 5, v6[1]);
    sub_100006344(a1, 6, v7[0]);
    sub_100006344(a1, 7, v7[1]);
    sub_100006344(a1, 8, v8[0]);
    sub_100006344(a1, 9, v8[1]);
    v47 = 0;
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0;
    *(_OWORD *)&v40[8] = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0;
    *(_OWORD *)&v30[12] = 0u;
    v28 = 0u;
    memset(v27, 0, sizeof(v27));
    *(_OWORD *)v30 = *(_OWORD *)v7;
    v43 = *((unint64_t *)&v10 + 1);
    *(_QWORD *)((char *)&v28 + 4) = v6[1];
    *(_OWORD *)v40 = *(_OWORD *)v8;
    v3 = pm_energy_impact(v27);
    if (*(_QWORD *)(a1 + 40) == 1)
      v3 = 0.0;
    sub_10000638C(a1, 12, v3);
  }
  return v2 == 0;
}

uint64_t sub_100005210(uint64_t a1)
{
  uint64_t result;
  void *v3;
  char *string;
  char *v5;

  if (*(_QWORD *)(a1 + 40) == 1)
  {
    sub_100006418(a1, 13, "com.apple.system");
    sub_100006418(a1, 14, "com.apple.system");
    return 1;
  }
  result = xpc_coalition_copy_info();
  if (result)
  {
    v3 = (void *)result;
    if (xpc_get_type((xpc_object_t)result) == (xpc_type_t)&_xpc_type_dictionary)
    {
      string = (char *)xpc_dictionary_get_string(v3, XPC_COALITION_INFO_KEY_NAME);
      if (string)
        sub_100006418(a1, 13, string);
      v5 = (char *)xpc_dictionary_get_string(v3, XPC_COALITION_INFO_KEY_BUNDLE_IDENTIFIER);
      if (v5)
        sub_100006418(a1, 14, v5);
      xpc_release(v3);
      return 1;
    }
    return 0;
  }
  return result;
}

int sub_1000052E8(id a1, const void *a2, const void *a3)
{
  if (*(_QWORD *)a2 < *(_QWORD *)a3)
    return -1;
  else
    return *(_QWORD *)a2 > *(_QWORD *)a3;
}

BOOL sub_100005300(uint64_t a1)
{
  task_name_t v2;
  kern_return_t v3;
  _OWORD v5[2];
  uint64_t value[3];
  mach_msg_type_number_t task_info_outCnt;

  *(_OWORD *)value = 0u;
  memset(v5, 0, sizeof(v5));
  v2 = sub_100005AB8(a1);
  task_info_outCnt = 12;
  v3 = task_info(v2, 0x15u, (task_info_t)v5, &task_info_outCnt);
  if (!v3)
  {
    sub_100006344(a1, 48, value[0]);
    sub_100006344(a1, 49, value[1]);
  }
  return v3 == 0;
}

uint64_t sub_10000537C(uint64_t a1)
{
  ipc_space_inspect_t v2;
  ipc_info_space_basic_t basic_info;

  if (sub_100005AB0(a1))
  {
    v2 = sub_100005AB8(a1);
    memset(&basic_info, 0, sizeof(basic_info));
    if (!mach_port_space_basic_info(v2, &basic_info))
      sub_100006344(a1, 50, basic_info.iisb_table_inuse);
  }
  return 1;
}

BOOL sub_1000053D8(uint64_t a1)
{
  task_policy_get_t v2;
  kern_return_t v3;
  int64_t value;
  BOOLean_t get_default;
  mach_msg_type_number_t policy_infoCnt;

  value = 0;
  v2 = sub_100005AB8(a1);
  get_default = 0;
  policy_infoCnt = 2;
  v3 = task_policy_get(v2, 8u, (task_policy_t)&value, &policy_infoCnt, &get_default);
  if (!v3)
  {
    sub_1000062FC(a1, 57, (int)value);
    sub_1000062FC(a1, 58, SHIDWORD(value));
  }
  return v3 == 0;
}

BOOL sub_100005450(uint64_t a1)
{
  task_name_t v2;
  kern_return_t v3;
  _OWORD v5[3];
  uint64_t v6[2];
  __int128 v7;
  __int128 v8;
  uint64_t value[2];
  uint64_t v10[2];
  __int128 v11;
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
  int v26;
  mach_msg_type_number_t task_info_outCnt;

  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  *(_OWORD *)value = 0u;
  *(_OWORD *)v6 = 0u;
  v7 = 0u;
  memset(v5, 0, sizeof(v5));
  v2 = sub_100005AB8(a1);
  task_info_outCnt = 93;
  v3 = task_info(v2, 0x17u, (task_info_t)v5, &task_info_outCnt);
  if (!v3)
  {
    sub_100006344(a1, 59, value[1]);
    sub_100006344(a1, 67, v10[1] + v6[0] - value[0]);
    sub_100006344(a1, 68, v6[1]);
    sub_100006344(a1, 74, v10[1]);
  }
  return v3 == 0;
}

uint64_t sub_100005530(uint64_t a1)
{
  char *v2;
  BOOL v3;
  xpc_object_t v5;
  unint64_t v6;
  xpc_object_t v7;
  size_t v8;
  int v9;
  unint64_t v10;
  char *v11;
  int v12;
  BOOL v13;
  size_t v14;
  int v15[2];
  int v16;

  *(_QWORD *)v15 = 0x3100000001;
  v16 = sub_100005AB0(a1);
  if (sub_100005AB0(a1))
  {
    if (qword_10000CDC8 != -1)
      dispatch_once(&qword_10000CDC8, &stru_1000085A0);
    v14 = dword_10000CDD0;
    v2 = (char *)malloc_type_malloc(dword_10000CDD0, 0xB3228DD5uLL);
    if (sysctl(v15, 3u, v2, &v14, 0, 0))
      v3 = 0;
    else
      v3 = v14 >= 4;
    if (!v3)
    {
      free(v2);
      return 0;
    }
    v6 = *(unsigned int *)v2;
    v7 = xpc_array_create(0, 0);
    v8 = v14 - 4;
    if (v14 != 4)
    {
      v9 = 0;
      v10 = 0;
      v11 = v2 + 4;
      do
      {
        v12 = v9;
        v9 = *v11;
        if (*v11)
          v13 = v12 == 0;
        else
          v13 = 0;
        if (v13 && memchr(v11, 0, v8))
        {
          if (v10)
          {
            if (v10 <= v6)
              xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, v11);
          }
          else
          {
            sub_100006418(a1, 43, v11);
          }
          ++v10;
          v9 = *v11;
        }
        ++v11;
        --v8;
      }
      while (v8);
    }
    sub_100006264(a1, 44, (uint64_t)v7);
    xpc_release(v7);
    free(v2);
  }
  else
  {
    v5 = xpc_array_create(0, 0);
    xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, "kernel_task");
    sub_100006264(a1, 44, (uint64_t)v5);
    xpc_release(v5);
  }
  return 1;
}

void sub_100005730(id a1)
{
  size_t v1;

  v1 = 4;
  if (sysctlbyname("kern.argmax", &dword_10000CDD0, &v1, 0, 0))
    dword_10000CDD0 = 0x40000;
}

xpc_object_t sub_100005780(uint64_t a1)
{
  xpc_object_t v2;
  unsigned int v3;
  unint64_t v4;
  char *v5;
  char *v6;
  unsigned int v7;
  unsigned int v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];
  void (*v14)(uint64_t, int);
  void *v15;
  uint64_t v16;
  xpc_object_t v17;

  v2 = xpc_array_create(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000;
  v14 = sub_1000058D4;
  v15 = &unk_100008AA8;
  v16 = a1;
  v17 = v2;
  v3 = proc_listpids(1u, 0, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    v4 = v3;
    v5 = (char *)malloc_type_malloc(v3, 0xE4979E02uLL);
    if (v5)
    {
      v6 = v5;
      while (1)
      {
        v7 = proc_listpids(1u, 0, v6, v4);
        v8 = v7;
        if ((v7 & 0x80000000) != 0)
        {
LABEL_7:
          qsort_b(v6, (unint64_t)(int)v8 >> 2, 4uLL, &stru_100008AE8);
          goto LABEL_11;
        }
        if (v4 >= v7 + 4)
          break;
        v4 += 64;
        v6 = (char *)reallocf(v6, v4);
        if (!v6)
          goto LABEL_7;
      }
      v9 = v7 >> 2;
      qsort_b(v6, v9, 4uLL, &stru_100008AE8);
      if (v8 >= 4)
      {
        v10 = 0;
        v11 = 4 * v9;
        do
        {
          v14((uint64_t)v13, *(_DWORD *)&v6[v10]);
          v10 += 4;
        }
        while (v11 != v10);
      }
LABEL_11:
      free(v6);
    }
  }
  return v2;
}

void sub_1000058D4(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  xpc_object_t v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = sub_100005A38(*(void **)(a1 + 32), a2);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000;
  v6[2] = sub_1000059A4;
  v6[3] = &unk_100008A88;
  v6[4] = &v7;
  v6[5] = v3;
  sub_100005FA0(v4, (uint64_t)v6);
  if (!*((_BYTE *)v8 + 24))
  {
    v5 = sub_100006194(v3);
    xpc_array_set_value(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v5);
    xpc_release(v5);
  }
  j___os_object_release(v3);
  _Block_object_dispose(&v7, 8);
}

uint64_t sub_1000059A4(uint64_t result, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = result;
  v4 = 0;
  while (1)
  {
    if (dword_1000085C0[v4] == a2)
    {
      result = sub_100006224(*(_QWORD *)(v3 + 40), a2);
      if ((result & 1) == 0)
      {
        result = (*(uint64_t (**)(_QWORD))&dword_1000085C0[v4 + 2])(*(_QWORD *)(v3 + 40));
        if ((result & 1) == 0)
          break;
      }
    }
    v4 += 4;
    if (v4 == 304)
      return result;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = 1;
  return result;
}

int sub_100005A28(id a1, const void *a2, const void *a3)
{
  return *(_DWORD *)a2 - *(_DWORD *)a3;
}

uint64_t sub_100005A38(void *a1, int a2)
{
  uint64_t v4;
  xpc_object_t v5;
  size_t v6;

  v4 = sub_100005D90();
  v5 = xpc_retain(a1);
  *(_QWORD *)(v4 + 16) = v5;
  v6 = sub_100006038(v5);
  *(_QWORD *)(v4 + 24) = v6;
  *(_QWORD *)(v4 + 32) = malloc_type_calloc(v6, 8uLL, 0x80040B8603338uLL);
  *(_DWORD *)(v4 + 40) = a2;
  *(_DWORD *)(v4 + 44) = 0;
  sub_100006344(v4, 4, a2);
  return v4;
}

uint64_t sub_100005AB0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t sub_100005AB8(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  mach_port_name_t tn;

  result = *(unsigned int *)(a1 + 44);
  if (!(_DWORD)result)
  {
    tn = 0;
    v3 = *(unsigned int *)(a1 + 40);
    if ((_DWORD)v3)
    {
      if (task_read_for_pid(mach_task_self_, v3, &tn))
        return *(unsigned int *)(a1 + 44);
    }
    else if (task_name_for_pid(mach_task_self_, 0, &tn))
    {
      return *(unsigned int *)(a1 + 44);
    }
    result = tn;
    *(_DWORD *)(a1 + 44) = tn;
  }
  return result;
}

uint64_t sub_100005B20(void *a1)
{
  uint64_t v2;
  xpc_object_t value;

  v2 = sub_100005DF0();
  *(_QWORD *)(v2 + 16) = xpc_dictionary_get_uint64(a1, SYSMON_XPC_KEY_TYPE);
  value = xpc_dictionary_get_value(a1, SYSMON_XPC_KEY_ATTRIBUTES);
  *(_QWORD *)(v2 + 24) = value;
  if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_data)
  {
    xpc_retain(*(xpc_object_t *)(v2 + 24));
    *(_QWORD *)(v2 + 32) = xpc_dictionary_get_uint64(a1, SYSMON_XPC_KEY_FLAGS);
  }
  else
  {
    _os_assumes_log(0);
    *(_QWORD *)(v2 + 24) = 0;
    j___os_object_release(v2);
    return 0;
  }
  return v2;
}

xpc_object_t sub_100005BCC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  size_t length;
  _BYTE *v4;
  char v5;
  _BYTE *v6;
  char v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  v1 = *(void **)(a1 + 24);
  length = xpc_data_get_length(v1);
  v4 = malloc_type_malloc(length, 0x1CE7A272uLL);
  if (xpc_data_get_bytes(v1, v4, 0, length) != length)
    _os_assumes_log(0);
  if (v2 == 3)
  {
    v6 = v4 + 1;
    v7 = v4[1];
    if ((v7 & 4) != 0)
      *v4 |= 0x22u;
    if ((v7 & 8) != 0)
    {
      *v4 |= 2u;
      goto LABEL_13;
    }
  }
  else if (v2 == 1)
  {
    v5 = v4[6];
    if ((v5 & 8) != 0)
    {
      *v4 |= 0x10u;
      v4[2] |= 0x80u;
      v4[3] |= 1u;
    }
    if ((v5 & 0x10) != 0)
    {
      *v4 |= 0x10u;
      v6 = v4 + 7;
      v7 = v4[7];
LABEL_13:
      *v6 = v7 | 0x10;
    }
  }
  v8 = xpc_data_create(v4, length);
  free(v4);
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v9, SYSMON_XPC_REPLY_KEY_HEADER, v8);
  switch(v2)
  {
    case 3:
      v10 = sub_100004D0C((uint64_t)v8);
      break;
    case 2:
      v10 = sub_100006460(v8);
      break;
    case 1:
      v10 = sub_100005780((uint64_t)v8);
      break;
    default:
      goto LABEL_22;
  }
  v11 = v10;
  if (v10)
  {
    xpc_dictionary_set_value(v9, SYSMON_XPC_REPLY_KEY_TABLE, v10);
    xpc_release(v11);
  }
LABEL_22:
  v12 = xpc_date_create_from_current();
  xpc_dictionary_set_value(v9, SYSMON_XPC_REPLY_KEY_TIMESTAMP, v12);
  xpc_release(v12);
  xpc_release(v8);
  return v9;
}

uint64_t sub_100005D90()
{
  uint64_t v0;

  v0 = objc_opt_class(OS_sysmond_process);
  return _os_object_alloc(v0, 48);
}

uint64_t sub_100005DB0()
{
  uint64_t v0;

  v0 = objc_opt_class(OS_sysmond_system);
  return _os_object_alloc(v0, 48);
}

uint64_t sub_100005DD0()
{
  uint64_t v0;

  v0 = objc_opt_class(OS_sysmond_coalition);
  return _os_object_alloc(v0, 48);
}

uint64_t sub_100005DF0()
{
  uint64_t v0;

  v0 = objc_opt_class(OS_sysmond_request);
  return _os_object_alloc(v0, 40);
}

size_t sub_100005FA0(void *a1, uint64_t a2)
{
  _BYTE *bytes_ptr;
  size_t result;
  size_t v6;
  uint64_t i;
  unsigned int v8;
  unsigned int v9;

  bytes_ptr = xpc_data_get_bytes_ptr(a1);
  result = xpc_data_get_length(a1);
  if (result)
  {
    v6 = result;
    for (i = 0; i != v6; ++i)
    {
      v8 = bytes_ptr[i];
      if (bytes_ptr[i])
      {
        do
        {
          v9 = __clz(__rbit32(v8));
          v8 &= ~(1 << v9);
          result = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, (8 * (_DWORD)i) | v9);
        }
        while ((_BYTE)v8);
      }
    }
  }
  return result;
}

uint64_t sub_100006038(void *a1)
{
  unsigned __int8 *bytes_ptr;
  size_t length;
  uint64_t i;
  unsigned int v5;
  uint8x8_t v6;

  bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(a1);
  length = xpc_data_get_length(a1);
  for (i = 0; length; --length)
  {
    v5 = *bytes_ptr++;
    v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
    v6.i16[0] = vaddlv_u8(v6);
    i += v6.u32[0];
  }
  return i;
}

uint64_t sub_100006090(void *a1, int a2)
{
  uint64_t v2;
  _QWORD v4[6];
  int v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = -1;
  v10[3] = -1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_10000613C;
  v4[3] = &unk_100008B10;
  v5 = a2;
  v4[4] = v10;
  v4[5] = &v6;
  sub_100005FA0(a1, (uint64_t)v4);
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

uint64_t sub_10000613C(uint64_t result, int a2)
{
  uint64_t v2;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  if (*(_DWORD *)(result + 48) == a2)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    if (*(_QWORD *)(v2 + 24) != -1)
      sub_1000074B0();
    *(_QWORD *)(v2 + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  }
  return result;
}

xpc_object_t sub_100006194(uint64_t a1)
{
  size_t v2;
  size_t i;
  xpc_object_t v4;
  xpc_object_t v5;
  unint64_t v6;
  unint64_t v7;

  v2 = *(_QWORD *)(a1 + 24);
  if (v2)
  {
    for (i = 0; i < v2; ++i)
    {
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * i))
      {
        v4 = xpc_null_create();
        v2 = *(_QWORD *)(a1 + 24);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * i) = v4;
      }
    }
  }
  v5 = xpc_array_create(*(xpc_object_t **)(a1 + 32), v2);
  if (*(_QWORD *)(a1 + 24))
  {
    v6 = 0;
    do
    {
      xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 8 * v6));
      v7 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v6++) = 0;
    }
    while (v6 < v7);
  }
  return v5;
}

BOOL sub_100006224(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = sub_100006090(*(void **)(a1 + 16), a2);
  return (v3 & 0x8000000000000000) == 0 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v3) != 0;
}

uint64_t sub_100006264(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = sub_100006090(*(void **)(a1 + 16), a2);
  if ((result & 0x8000000000000000) == 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v6 + 8 * result))
    {
      *(_QWORD *)(v6 + 8 * result) = a3;
      return (uint64_t)xpc_retain(*(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 8 * result));
    }
  }
  return result;
}

void sub_1000062B4(uint64_t a1, int a2, BOOL value)
{
  xpc_object_t v5;

  v5 = xpc_BOOL_create(value);
  sub_100006264(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

void sub_1000062FC(uint64_t a1, int a2, int64_t value)
{
  xpc_object_t v5;

  v5 = xpc_int64_create(value);
  sub_100006264(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

void sub_100006344(uint64_t a1, int a2, uint64_t value)
{
  xpc_object_t v5;

  v5 = xpc_uint64_create(value);
  sub_100006264(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

void sub_10000638C(uint64_t a1, int a2, double a3)
{
  xpc_object_t v5;

  v5 = xpc_double_create(a3);
  sub_100006264(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

void sub_1000063D0(uint64_t a1, int a2, int64_t interval)
{
  xpc_object_t v5;

  v5 = xpc_date_create(interval);
  sub_100006264(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

void sub_100006418(uint64_t a1, int a2, char *string)
{
  xpc_object_t v5;

  v5 = xpc_string_create(string);
  sub_100006264(a1, a2, (uint64_t)v5);
  xpc_release(v5);
}

xpc_object_t sub_100006460(void *a1)
{
  xpc_object_t v2;
  uint64_t v3;
  xpc_object_t v4;
  _QWORD v6[5];

  v2 = xpc_array_create(0, 0);
  v3 = sub_100006514(a1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000;
  v6[2] = sub_100006570;
  v6[3] = &unk_100008D70;
  v6[4] = v3;
  sub_100005FA0(a1, (uint64_t)v6);
  v4 = sub_100006194(v3);
  xpc_array_set_value(v2, 0xFFFFFFFFFFFFFFFFLL, v4);
  xpc_release(v4);
  j___os_object_release(v3);
  return v2;
}

uint64_t sub_100006514(void *a1)
{
  uint64_t v2;
  xpc_object_t v3;
  size_t v4;

  v2 = sub_100005DB0();
  v3 = xpc_retain(a1);
  *(_QWORD *)(v2 + 16) = v3;
  v4 = sub_100006038(v3);
  *(_QWORD *)(v2 + 24) = v4;
  *(_QWORD *)(v2 + 32) = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
  *(_DWORD *)(v2 + 40) = 0;
  return v2;
}

uint64_t sub_100006570(uint64_t result, int a2)
{
  uint64_t v3;
  uint64_t i;

  v3 = result;
  for (i = 0; i != 144; i += 4)
  {
    if (dword_100008B30[i] == a2)
    {
      result = sub_100006224(*(_QWORD *)(v3 + 32), a2);
      if ((result & 1) == 0)
        result = (*(uint64_t (**)(_QWORD))&dword_100008B30[i + 2])(*(_QWORD *)(v3 + 32));
    }
  }
  return result;
}

uint64_t sub_1000065DC(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 40);
  if (!(_DWORD)result)
  {
    result = mach_host_self();
    *(_DWORD *)(a1 + 40) = result;
  }
  return result;
}

BOOL sub_100006608(uint64_t a1)
{
  host_t v2;
  kern_return_t v3;
  uint64_t v4;
  uint64_t value[2];
  uint64_t v7[2];
  uint64_t v8[2];
  uint64_t v9[2];
  uint64_t v10[2];
  uint64_t v11[2];
  uint64_t v12[2];
  uint64_t v13[2];
  uint64_t v14[2];
  uint64_t v15;
  mach_msg_type_number_t host_info64_outCnt;

  v15 = 0;
  *(_OWORD *)v13 = 0u;
  *(_OWORD *)v14 = 0u;
  *(_OWORD *)v11 = 0u;
  *(_OWORD *)v12 = 0u;
  *(_OWORD *)v9 = 0u;
  *(_OWORD *)v10 = 0u;
  *(_OWORD *)v7 = 0u;
  *(_OWORD *)v8 = 0u;
  *(_OWORD *)value = 0u;
  v2 = sub_1000065DC(a1);
  host_info64_outCnt = 38;
  v3 = host_statistics64(v2, 4, (host_info64_t)value, &host_info64_outCnt);
  if (!v3)
  {
    sub_100006344(a1, 1, (LODWORD(value[0]) - HIDWORD(v11[1])));
    sub_100006344(a1, 2, HIDWORD(value[0]));
    sub_100006344(a1, 3, LODWORD(value[1]));
    sub_100006344(a1, 4, HIDWORD(value[1]));
    sub_100006344(a1, 5, v7[0]);
    sub_100006344(a1, 6, v7[1]);
    sub_100006344(a1, 7, v8[0]);
    sub_100006344(a1, 8, v8[1]);
    sub_100006344(a1, 9, v9[0]);
    sub_100006344(a1, 10, v9[1]);
    sub_100006344(a1, 11, v10[0]);
    sub_100006344(a1, 12, v10[1]);
    sub_100006344(a1, 13, v11[0]);
    sub_100006344(a1, 14, LODWORD(v11[1]));
    sub_100006344(a1, 15, HIDWORD(v11[1]));
    sub_100006344(a1, 16, v12[0]);
    sub_100006344(a1, 17, v12[1]);
    sub_100006344(a1, 18, v13[0]);
    sub_100006344(a1, 19, v13[1]);
    sub_100006344(a1, 20, LODWORD(v14[0]));
    sub_100006344(a1, 21, HIDWORD(v14[0]));
    sub_100006344(a1, 33, LODWORD(v14[1]));
    sub_100006344(a1, 34, HIDWORD(v14[1]));
    sub_100006344(a1, 35, v15);
    if (qword_10000CDE0 != -1)
      dispatch_once(&qword_10000CDE0, &stru_100008DB0);
    v4 = qword_10000CDD8;
    sub_100006344(a1, 36, qword_10000CDD8);
    sub_100006344(a1, 37, v15 + v4);
    sub_100006344(a1, 38, v4 - (LODWORD(value[0]) - HIDWORD(v11[1])));
  }
  return v3 == 0;
}

uint64_t sub_100006874(uint64_t a1)
{
  host_priv_t v2;
  kern_return_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t info_outCnt;
  integer_t info_out[2];
  uint64_t v12;
  mach_msg_type_number_t processor_setsCnt;
  processor_set_name_array_t processor_sets;

  processor_sets = 0;
  processor_setsCnt = 0;
  v2 = sub_1000065DC(a1);
  v3 = host_processor_sets(v2, &processor_sets, &processor_setsCnt);
  if (v3)
  {
LABEL_13:
    _os_assumes_log(v3);
    return 0;
  }
  if (processor_setsCnt)
  {
    v4 = 0;
    v5 = 0;
    while (1)
    {
      *(_QWORD *)info_out = 0;
      v12 = 0;
      info_outCnt = 4;
      v3 = processor_set_statistics(processor_sets[v4], 4, info_out, &info_outCnt);
      if (v3)
        goto LABEL_13;
      v6 = info_out[1];
      v7 = mach_port_deallocate(mach_task_self_, processor_sets[v4]);
      if (v7)
        _os_assumes_log(v7);
      v5 += v6;
      if (++v4 >= (unint64_t)processor_setsCnt)
        goto LABEL_10;
    }
  }
  v5 = 0;
LABEL_10:
  sub_100006344(a1, 24, v5);
  v8 = mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)processor_sets, 4 * processor_setsCnt);
  if (v8)
    _os_assumes_log(v8);
  return 1;
}

void sub_10000698C(id a1)
{
  size_t v1;

  v1 = 8;
  sysctlbyname("hw.memsize", &qword_10000CDD8, &v1, 0, 0);
  qword_10000CDD8 /= vm_kernel_page_size;
}

void sub_1000069F0(int a1, void *a2)
{
  free(a2);
}

uint64_t sub_1000069F8(void *context)
{
  if (qword_10000CDF0 != -1)
    dispatch_once(&qword_10000CDF0, &stru_100008E18);
  dispatch_sync_f((dispatch_queue_t)qword_10000CDF8, context, (dispatch_function_t)sub_100006ABC);
  return 1;
}

void sub_100006A58(id a1)
{
  CFDictionaryValueCallBacks v1;

  qword_10000CDF8 = (uint64_t)dispatch_queue_create("process_get_libtop_memory mutex", 0);
  *(_OWORD *)&v1.version = xmmword_100008DD0;
  *(_OWORD *)&v1.release = *(_OWORD *)&off_100008DE0;
  v1.equal = 0;
  qword_10000CDE8 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &v1);
}

void sub_100006ABC(uint64_t a1)
{
  uint64_t v1;
  int v2;
  vm_map_read_t v3;
  char *v4;
  int *v5;
  uint64_t v6;
  vm_size_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  mach_vm_address_t v14;
  mach_vm_address_t v15;
  int v16;
  int v18;
  int v19;
  unint64_t v20;
  _QWORD *Value;
  _DWORD *v22;
  unsigned int v23;
  mach_vm_size_t v24;
  _DWORD *v25;
  int v26;
  int v27;
  vm_size_t v28;
  uint64_t v29;
  vm_size_t v30;
  int v31;
  uint64_t v32;
  mach_vm_size_t v33;
  vm_size_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  mach_vm_size_t v39;
  mach_vm_address_t v40;
  size_t v41[2];
  __int128 v42;
  int v43;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;
  int info[2];
  uint64_t v47;
  int v48;
  mach_vm_size_t size;
  mach_vm_address_t address[2];

  v1 = a1;
  v2 = sub_100005AB0(a1);
  v3 = sub_100005AB8(v1);
  v4 = (char *)malloc_type_calloc(1uLL, 0x4C0uLL, 0x10300403E5244D6uLL);
  *((_DWORD *)v4 + 1) = v2;
  v5 = (int *)(v4 + 936);
  *((_DWORD *)v4 + 234) = 0;
  v6 = qword_10000CE30;
  if (!qword_10000CE30)
  {
    qword_10000CE30 = 12;
    if (sysctlnametomib("sysctl.proc_cputype", dword_10000CE00, (size_t *)&qword_10000CE30))
    {
      qword_10000CE30 = 0;
      goto LABEL_9;
    }
    v6 = qword_10000CE30;
    if (!qword_10000CE30)
      goto LABEL_3;
  }
  dword_10000CE00[v6] = v2;
  v41[0] = 4;
  if (!sysctl(dword_10000CE00, v6 + 1, v5, v41, 0, 0))
  {
LABEL_3:
    v7 = vm_kernel_page_size;
    size = 0;
    address[0] = 0;
    *((_DWORD *)v4 + 302) = 0;
    *(_QWORD *)info = 0;
    v47 = 0;
    v48 = 0;
    infoCnt = 5;
    object_name = 0;
    if (mach_vm_region(v3, address, &size, 12, info, &infoCnt, &object_name))
    {
      v8 = 0;
      v9 = 0;
      v36 = 0;
      v37 = 0;
      v35 = 0;
      v10 = 0;
      v38 = 0;
LABEL_5:
      v11 = v35 + v8;
      *((_QWORD *)v4 + 4) = v35 + v8;
      *((_QWORD *)v4 + 5) = v9;
      *((_QWORD *)v4 + 6) = v37;
      *((_QWORD *)v4 + 7) = v38;
      *((_QWORD *)v4 + 8) = v36;
      *((_DWORD *)v4 + 18) = v10;
      *((_DWORD *)v4 + 19) = 0;
LABEL_6:
      sub_100006344(v1, 53, v11);
      sub_100006344(v1, 54, *((_QWORD *)v4 + 6));
      goto LABEL_9;
    }
    v10 = 0;
    v37 = 0;
    v38 = 0;
    v35 = 0;
    v36 = 0;
    v9 = 0;
    v8 = 0;
    v32 = v1;
    v34 = v7;
    while (1)
    {
      v12 = *v5;
      if (*v5 <= 16777222)
      {
        if (v12 == 7)
          goto LABEL_21;
        if (v12 != 12)
        {
          if (v12 != 18)
            goto LABEL_71;
LABEL_21:
          v13 = 0x20000000;
          v14 = 2415919104;
          goto LABEL_28;
        }
        v13 = 0x40000000;
        v14 = 0x40000000;
      }
      else if (v12 > 16777233)
      {
        if (v12 == 16777234)
        {
          v14 = 0x7FFF60000000;
          v13 = 2684354560;
        }
        else
        {
          if (v12 != 33554444)
LABEL_71:
            sub_1000074C8(v12);
          v13 = 2281701376;
          v14 = 436207616;
        }
      }
      else if (v12 == 16777223)
      {
        v14 = 0x7FF800000000;
        v13 = 0x7FE000000;
      }
      else
      {
        if (v12 != 16777228)
          goto LABEL_71;
        v13 = 0x180000000;
        v14 = 0x180000000;
      }
LABEL_28:
      v15 = v14 + v13;
      v16 = v48;
      if (v14 <= address[0] && v15 > address[0])
      {
        v38 += v7 * v47;
        if (!*((_DWORD *)v4 + 302) && v48 == 3)
        {
          v43 = 0;
          *(_OWORD *)v41 = 0u;
          v42 = 0u;
          v40 = address[0];
          v39 = size;
          infoCnt = 9;
          if (mach_vm_region(v3, &v40, &v39, 10, (vm_region_info_t)v41, &infoCnt, &object_name))
            goto LABEL_5;
          if ((_DWORD)v42)
            *((_DWORD *)v4 + 302) = 1;
          v16 = v48;
        }
        if (v16 != 2)
          goto LABEL_48;
        ++v10;
LABEL_47:
        v8 += (HIDWORD(v47) + (unint64_t)v47) * v7;
        v9 += size;
        goto LABEL_48;
      }
      ++v10;
      v18 = info[1];
      if (v48 == 1 && info[1] == 1)
        goto LABEL_47;
      switch((char)v48)
      {
        case 1:
        case 4:
          v19 = *((_DWORD *)v4 + 1);
          if (v19)
          {
            v20 = info[0];
            v31 = HIDWORD(v47);
            v33 = size;
            Value = CFDictionaryGetValue((CFDictionaryRef)qword_10000CDE8, (const void *)info[0]);
            if (Value)
            {
              v22 = Value;
              if (*(_DWORD *)Value == v19)
              {
                v1 = v32;
                Value[1] += v33;
                v23 = *((_DWORD *)Value + 7) + 1;
                *((_DWORD *)Value + 7) = v23;
                v5 = (int *)(v4 + 936);
LABEL_57:
                if (v23 >= 2)
                {
                  v26 = v22[8];
                  if (v26 != 3)
                    v22[4] = v26;
                  v35 -= *((_QWORD *)v22 + 5);
                  v9 -= *((_QWORD *)v22 + 6);
                  v37 -= *((_QWORD *)v22 + 7);
                }
                v22[8] = 3;
                *((_QWORD *)v22 + 6) = 0;
                *((_QWORD *)v22 + 7) = 0;
                *((_QWORD *)v22 + 5) = 0;
                v27 = v22[4];
                if (v27 != 6)
                {
                  if (v27 == 4 && v22[6] == v23)
                  {
                    v22[8] = 4;
                    v22[4] = 6;
                    v28 = v34 * v22[5];
                    v35 += v28;
                    v29 = *((_QWORD *)v22 + 1);
                    *((_QWORD *)v22 + 5) = v28;
                    *((_QWORD *)v22 + 6) = v29;
                    v9 += v29;
                  }
                  else
                  {
                    v30 = v34 * v22[5];
                    *((_QWORD *)v22 + 7) = v30;
                    v37 += v30;
                  }
                }
                if (v48 != 1)
                {
                  v7 = v34;
                  break;
                }
                v7 = v34;
                v24 = v34 * v47;
                v8 += v24;
                goto LABEL_68;
              }
              *(_DWORD *)Value = v19;
              Value[1] += v33;
              v23 = 1;
              *((_DWORD *)Value + 7) = 1;
            }
            else
            {
              v25 = malloc_type_malloc(0x40uLL, 0x1000040EA6C7F01uLL);
              if (!v25)
              {
                v11 = *((_QWORD *)v4 + 4);
                v1 = v32;
                goto LABEL_6;
              }
              v22 = v25;
              *v25 = v19;
              v25[1] = v20;
              *((_QWORD *)v25 + 1) = v33;
              v25[4] = v16;
              v25[5] = v31;
              v25[6] = v18;
              v25[7] = 1;
              CFDictionarySetValue((CFMutableDictionaryRef)qword_10000CDE8, (const void *)v20, v25);
              v23 = v22[7];
            }
            v1 = v32;
            v22[8] = 3;
            *((_QWORD *)v22 + 6) = 0;
            *((_QWORD *)v22 + 7) = 0;
            *((_QWORD *)v22 + 5) = 0;
            v5 = (int *)(v4 + 936);
            goto LABEL_57;
          }
          v5 = (int *)(v4 + 936);
          if (v48 == 1)
          {
            v8 += v7 * v47;
            v24 = size;
LABEL_68:
            v9 += v24;
            break;
          }
          break;
        case 2:
        case 8:
          goto LABEL_47;
        case 3:
          v36 += size;
          break;
        default:
          sub_1000074F8();
      }
LABEL_48:
      address[0] += size;
      *(_QWORD *)info = 0;
      v47 = 0;
      v48 = 0;
      infoCnt = 5;
      object_name = 0;
      if (mach_vm_region(v3, address, &size, 12, info, &infoCnt, &object_name))
        goto LABEL_5;
    }
  }
LABEL_9:
  free(v4);
}

uint64_t sub_1000070A0(uint64_t a1)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  size_t size;

  size = 0;
  if (sysctl(dword_10000CDA0, 6u, 0, &size, 0, 0) < 0)
    return 0;
  v2 = (unsigned __int16 *)malloc_type_malloc(size, 0x15BA3060uLL);
  if (!v2)
    sub_1000074B0();
  v3 = v2;
  if (sysctl(dword_10000CDA0, 6u, v2, &size, 0, 0) < 0)
  {
    free(v3);
    return 0;
  }
  if (v3 >= (unsigned __int16 *)((char *)v3 + size))
  {
    v7 = 0;
    v6 = 0;
    v5 = 0;
    v4 = 0;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = v3;
    do
    {
      if (*((_BYTE *)v8 + 3) == 18)
      {
        v6 += *((_QWORD *)v8 + 9);
        v4 += *((_QWORD *)v8 + 7);
        v5 += *((_QWORD *)v8 + 13);
        v7 += *((_QWORD *)v8 + 12);
      }
      v8 = (unsigned __int16 *)((char *)v8 + *v8);
    }
    while (v8 < (unsigned __int16 *)((char *)v3 + size));
  }
  free(v3);
  sub_100006344(a1, 29, v4);
  sub_100006344(a1, 31, v6);
  sub_100006344(a1, 30, v7);
  sub_100006344(a1, 32, v5);
  return 1;
}

BOOL sub_100007208(uint64_t a1)
{
  const __CFDictionary *v2;
  kern_return_t MatchingServices;
  kern_return_t v4;
  io_object_t v5;
  io_registry_entry_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  kern_return_t v11;
  const __CFDictionary *Value;
  const __CFDictionary *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  const __CFNumber *v17;
  uint64_t v19;
  uint64_t valuePtr;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;

  existing = 0;
  valuePtr = 0;
  properties = 0;
  v2 = IOServiceMatching("IOBlockStorageDriver");
  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing);
  v4 = MatchingServices;
  if (MatchingServices)
  {
    _os_assumes_log(MatchingServices);
  }
  else
  {
    v19 = a1;
    v5 = IOIteratorNext(existing);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      do
      {
        valuePtr = 0;
        properties = 0;
        v11 = IORegistryEntryCreateCFProperties(v6, &properties, kCFAllocatorDefault, 0);
        if (v11)
        {
          _os_assumes_log(v11);
        }
        else if (properties)
        {
          Value = (const __CFDictionary *)CFDictionaryGetValue(properties, CFSTR("Statistics"));
          if (Value)
          {
            v13 = Value;
            v14 = (const __CFNumber *)CFDictionaryGetValue(Value, CFSTR("Operations (Read)"));
            if (v14)
            {
              CFNumberGetValue(v14, kCFNumberSInt64Type, &valuePtr);
              v10 += valuePtr;
            }
            v15 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("Bytes (Read)"));
            if (v15)
            {
              CFNumberGetValue(v15, kCFNumberSInt64Type, &valuePtr);
              v8 += valuePtr;
            }
            v16 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("Operations (Write)"));
            if (v16)
            {
              CFNumberGetValue(v16, kCFNumberSInt64Type, &valuePtr);
              v9 += valuePtr;
            }
            v17 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("Bytes (Write)"));
            if (v17)
            {
              CFNumberGetValue(v17, kCFNumberSInt64Type, &valuePtr);
              v7 += valuePtr;
            }
          }
          CFRelease(properties);
        }
        IOObjectRelease(v6);
        v6 = IOIteratorNext(existing);
      }
      while (v6);
    }
    else
    {
      v10 = 0;
      v9 = 0;
      v8 = 0;
      v7 = 0;
    }
    IOIteratorReset(existing);
    IOObjectRelease(existing);
    sub_100006344(v19, 27, v8);
    sub_100006344(v19, 28, v7);
    sub_100006344(v19, 25, v10);
    sub_100006344(v19, 26, v9);
    v4 = 0;
  }
  return v4 == 0;
}

void sub_100007440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000442C((void *)&_mh_execute_header, &_os_log_default, a3, "Error: sysmond failed to insert mach port rights", a5, a6, a7, a8, 0);
}

void sub_100007478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000442C((void *)&_mh_execute_header, &_os_log_default, a3, "Error: sysmond failed to allocate mach port", a5, a6, a7, a8, 0);
}

void sub_1000074B0()
{
  uint64_t v0;

  v0 = _os_assert_log(0);
  _os_crash(v0);
  __break(1u);
}

void sub_1000074C8(int a1)
{
  fprintf(__stderrp, "unknown CPU type: 0x%x\n", a1);
  abort();
}

void sub_1000074F8()
{
  __assert_rtn("libtop_update_vm_regions", "process-libtop-memory.c", 393, "0");
}
