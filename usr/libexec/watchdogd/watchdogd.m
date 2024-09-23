uint64_t sub_100003F70(_BYTE *a1, uint64_t a2)
{
  uint64_t v3;
  char v5;
  kern_return_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_t sp;

  if (!a1)
    sub_100005DB4();
  *a1 = 0;
  v3 = qword_100021AE8;
  if (qword_100021AE8)
  {
    v5 = 0;
    do
    {
      sp = 0;
      if (!*(_BYTE *)(v3 + 16) && *(_BYTE *)(v3 + 60))
      {
        v6 = bootstrap_look_up(bootstrap_port, *(const char **)(v3 + 32), &sp);
        v13 = *(_QWORD *)(v3 + 32);
        if (v6)
        {
          bootstrap_strerror(v6);
          sub_10000558C(0, "late checkin service discovery for service %s failed, returned: %s", v14, v15, v16, v17, v18, v19, v13);
          *a1 = 1;
        }
        else
        {
          sub_10000558C(0, "found late checkin service: %s", v7, v8, v9, v10, v11, v12, *(_QWORD *)(v3 + 32));
          *(_DWORD *)(v3 + 104) = sp;
          *(_BYTE *)(v3 + 60) = 0;
          *(_QWORD *)(v3 + 120) = a2;
          *(_QWORD *)(v3 + 112) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          v5 = 1;
        }
      }
      v3 = *(_QWORD *)v3;
    }
    while (v3);
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_100004080(const __CFString *a1)
{
  const __CFString *v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  char CStringPtr;

  if (a1)
    v1 = a1;
  else
    v1 = &stru_100015938;
  v2 = IORegistryEntrySetCFProperty(dword_100021A38, CFSTR("IOPMUBootAppName"), v1);
  v3 = v2;
  if ((_DWORD)v2)
  {
    v17 = mach_error_string(v2);
    sub_10000558C(2, "failed to record foreground application with error %s", v4, v5, v6, v7, v8, v9, v17);
  }
  else
  {
    CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
    sub_10000558C(0, "set foreground app %s in PMU", v10, v11, v12, v13, v14, v15, CStringPtr);
  }
  return v3;
}

uint64_t sub_100004114(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  mach_error_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  mach_port_options_t options;
  mach_port_name_t name;

  if (dword_100021B48)
    sub_100005DB4();
  if (mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_100021B48))
    sub_100005DB4();
  v8 = qword_100021AE8;
  if (qword_100021AE8)
  {
    v9 = 0;
    do
    {
      bzero((void *)(v8 + 184), 0x658uLL);
      *(_DWORD *)(v8 + 188) = 14;
      *(_BYTE *)(v8 + 194) = 0;
      *(_BYTE *)(v8 + 1402) = 0;
      if (!*(_BYTE *)(v8 + 16) && *(_DWORD *)(v8 + 104) && (*(_DWORD *)(v8 + 68) != 3 || *(_BYTE *)(v8 + 80)))
      {
        name = 0;
        *(_OWORD *)&options.flags = xmmword_10000F338;
        options.reserved[1] = 0;
        if (mach_port_construct(mach_task_self_, &options, 1uLL, &name))
          sub_100005DB4();
        v10 = sub_1000042E8(*(_DWORD *)(v8 + 104), *(_QWORD *)(v8 + 8), a1, name, 0);
        *(_DWORD *)(v8 + 188) = v10;
        if (v10)
        {
          if (v10 == 268435460)
          {
            sub_10000558C(2, "failed to kickoff alive request to service %s, %s watchdog request handling code likely hung", v11, v12, v13, v14, v15, v16, *(_QWORD *)(v8 + 40));
          }
          else
          {
            v17 = *(_QWORD *)(v8 + 40);
            mach_error_string(v10);
            sub_10000558C(2, "failed to kickoff alive request to service %s with error: %s", v18, v19, v20, v21, v22, v23, v17);
          }
          mach_port_mod_refs(mach_task_self_, name, 1u, -1);
        }
        else
        {
          if (mach_port_insert_member(mach_task_self_, name, dword_100021B48))
            sub_100005DB4();
          *(_DWORD *)(v8 + 184) = name;
          v9 = (v9 + 1);
        }
      }
      v8 = *(_QWORD *)v8;
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  sub_10000558C(0, "watchdogd sent %d pings for round %llu", v2, v3, v4, v5, v6, v7, v9);
  return v9;
}

uint64_t sub_1000042E8(mach_port_name_t a1, uint64_t a2, uint64_t a3, unsigned int a4, mach_msg_timeout_t timeout)
{
  uint64_t v6;
  int v8;
  mach_port_name_t name[4];
  uint64_t v10;
  uint64_t v11;
  int v12;
  NDR_record_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_OWORD *)name = 0u;
  v11 = a4;
  v12 = 1376256;
  v13 = NDR_record;
  v14 = a2;
  v15 = a3;
  v8 = -2147483629;
  name[1] = a1;
  v10 = 0x1005BB490;
  if (&_voucher_mach_msg_set)
    voucher_mach_msg_set((mach_msg_header_t *)&v8);
  v6 = mach_msg((mach_msg_header_t *)&v8, 17, 0x40u, 0, 0, timeout, 0);
  if ((v6 - 268435459) <= 1)
  {
    if ((v8 & 0x1F00) == 0x1100)
      mach_port_deallocate(mach_task_self_, name[2]);
    mach_msg_destroy((mach_msg_header_t *)&v8);
  }
  return v6;
}

uint64_t sub_1000043D4(const char *a1, uint64_t a2, int a3, int a4, char **a5)
{
  const char *v5;
  const char *v7;

  if (!a1)
    sub_100005DB4();
  if (a3 == 2)
  {
    v5 = "ERROR";
    goto LABEL_10;
  }
  if (a3)
  {
    if (dword_100021AB0 >= 3)
    {
      v5 = "DEBUG";
      goto LABEL_10;
    }
    return 0;
  }
  if (dword_100021AB0 < 2)
    return 0;
  v5 = "INFO";
LABEL_10:
  v7 = "";
  if (a4)
    v7 = "service-monitoring thread:";
  return asprintf(a5, "watchdogd: %s %llu: %s: %s\n", v7, a2, v5, a1);
}

void sub_100004474(id a1)
{
  mach_error_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  mach_error_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  char v22;
  uint32_t dataSize;
  int data;
  uint64_t v25;
  uint64_t v26;

  if (IODataQueueWaitForAvailableData((IODataQueueMemory *)qword_100021A60, dword_100021A68))
    sub_100005DB4();
  do
  {
    bzero(&data, 0x210uLL);
    dataSize = 528;
    v1 = IODataQueueDequeue((IODataQueueMemory *)qword_100021A60, &data, &dataSize);
    v8 = v1;
    if (v1)
    {
      if (v1 == -536870169)
        return;
      v22 = mach_error_string(v1);
      sub_10000558C(2, "LOGGING ERROR: IODataQueueDequeue returned %s", v9, v10, v11, v12, v13, v14, v22);
    }
    else
    {
      sub_1000045A8(data, v25, v2, v3, v4, v5, v6, v7, (char)&v26);
      do
        v21 = __ldaxr(&dword_100021B4C);
      while (__stlxr(0, &dword_100021B4C));
      if (v21)
        sub_10000558C(2, "dropped %d messages from service monitoring thread", v15, v16, v17, v18, v19, v20, v21);
    }
  }
  while (v8 != -536870169);
}

void sub_1000045A8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_1000056B0(3, a1, a2, "%s", &a9);
}

uint64_t sub_1000045E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _opaque_pthread_t *v8;
  thread_inspect_t v9;
  _opaque_pthread_t *v10;
  thread_act_t v11;
  pthread_key_t v12;
  pthread_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  dispatch_time_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  __uint64_t v45;
  uint64_t *v46;
  unsigned __int8 *v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  const char *v51;
  size_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  int v66;
  size_t v67;
  unint64_t v68;
  size_t v69;
  mach_error_t v70;
  int v71;
  unint64_t v72;
  size_t v73;
  uint64_t v74;
  char *v75;
  int v76;
  size_t v77;
  uint64_t v78;
  size_t v79;
  int v80;
  uint64_t v81;
  unint64_t v82;
  size_t v83;
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
  int v96;
  uint64_t has_internal_diagnostics;
  uint64_t v98;
  unint64_t v99;
  unsigned int *v100;
  int v102;
  _BOOL4 v103;
  int v104;
  char *v105;
  size_t v106;
  int v107;
  int v108;
  void *v109;
  __uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t result;
  char v122;
  char v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  __uint64_t v127;
  char v128;
  int v129;
  char v130;
  void *v131;
  mach_msg_type_number_t policy_infoCnt[2];
  BOOLean_t get_default;
  integer_t policy_info[4];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;

  qword_1000219E0 = 0;
  sub_10000558C(0, "service monitoring thread created", a3, a4, a5, a6, a7, a8, v122);
  memset(policy_info, 0, sizeof(policy_info));
  get_default = 1;
  policy_infoCnt[0] = 4;
  v8 = pthread_self();
  v9 = pthread_mach_thread_np(v8);
  if (thread_policy_get(v9, 2u, policy_info, policy_infoCnt, &get_default))
  {
LABEL_156:
    _os_crash("thread_policy_get(thread_self, THREAD_TIME_CONSTRAINT_POLICY, ...) failed ");
    __break(1u);
    goto LABEL_157;
  }
  v10 = pthread_self();
  v11 = pthread_mach_thread_np(v10);
  if (!thread_policy_set(v11, 2u, policy_info, 4u))
  {
    v12 = qword_100021B28;
    v13 = pthread_self();
    pthread_setspecific(v12, v13);
    v14 = pthread_setname_np("watchdogd service monitoring thread");
    sub_10000C9A4(v14, v15, v16, v17, v18, v19, v20, v21);
    LOBYTE(get_default) = 0;
    sub_100003F70(&get_default, qword_1000219E0);
    if ((_BYTE)get_default)
      v127 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 30000000000;
    else
      v127 = 0;
    qword_100021B00 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    v22 = dispatch_time(0, 0);
    *(_QWORD *)policy_infoCnt = 0;
    v23 = &qword_100021000;
    v24 = &qword_100021000;
    v25 = &qword_100021000;
LABEL_7:
    while (1)
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)v23[356], 0xFFFFFFFFFFFFFFFFLL);
      if (!v24[314])
        break;
      sub_10000558C(0, "service monitoring thread resuming monitoring after %s", v26, v27, v28, v29, v30, v31, v24[314]);
      if (*((_BYTE *)v25 + 2800))
      {
        v32 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        v40 = (_QWORD *)qword_100021AE8;
        if (qword_100021AE8)
        {
          v41 = v32;
          do
          {
            bzero(v40 + 14, 0x6A0uLL);
            v32 = sub_1000050B4((uint64_t)v40);
            if ((_DWORD)v32)
            {
              v42 = qword_1000219E0;
              v40[14] = v41;
              v40[15] = v42;
            }
            v40 = (_QWORD *)*v40;
          }
          while (v40);
        }
        while (1)
        {
LABEL_18:
          sub_100005D70(v32, v33, v34, v35, v36, v37, v38, v39, v123);
          sub_10000ABA0();
          v43 = objc_autoreleasePoolPush();
          v44 = sub_100004114(qword_1000219E0);
          v22 = dispatch_time(0, 10000000000);
          v45 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          if (byte_1000219E8 == 1)
          {
            v46 = (uint64_t *)sub_1000083E4();
            if (v46)
            {
              v47 = (unsigned __int8 *)v46;
              if (sub_100008490(v46))
              {
                qword_1000219F0 = (uint64_t)v47;
              }
              else
              {
                sub_100005D40(v47);
                sub_100005A4C();
              }
            }
          }
          v131 = v43;
          sub_1000050E8(v44, v45 + 10000000000);
          v48 = qword_100021AE8;
          if (!qword_100021AE8)
          {
            byte_1000219E8 = 0;
LABEL_144:
            v23 = &qword_100021000;
            v24 = &qword_100021000;
            v25 = &qword_100021000;
            v109 = v131;
            goto LABEL_145;
          }
          do
          {
            if (sub_1000050B4(v48) && *(_DWORD *)(v48 + 68) == 2)
            {
              if (*(_BYTE *)(v48 + 192))
              {
                for (i = *(_QWORD *)(v48 + 72); i; i = *(_QWORD *)(i + 96))
                {
                  if ((int)*(_QWORD *)(v48 + 1392) < 1)
                  {
LABEL_33:
                    if (sub_1000050B4(i))
                      *(_BYTE *)(i + 80) = 0;
                  }
                  else
                  {
                    v50 = *(_QWORD *)(v48 + 1392);
                    v51 = *(const char **)(i + 24);
                    v52 = strlen(v51);
                    v53 = (const char *)(v48 + 1232);
                    while (v52 != strlen(v53) || strcasecmp(v51, v53))
                    {
                      v53 += 32;
                      if (!--v50)
                        goto LABEL_33;
                    }
                    if (*(_DWORD *)(i + 68) != 3)
                    {
                      v118 = _os_assert_log(0);
                      _os_crash(v118);
                      __break(1u);
                      goto LABEL_154;
                    }
                    if (!sub_1000050B4(i))
                    {
                      bzero((void *)(i + 112), 0x6A0uLL);
                      *(_BYTE *)(i + 80) = 1;
                      *(_QWORD *)(i + 120) = qword_1000219E0 + 1;
                      *(_QWORD *)(i + 112) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
                    }
                  }
                }
              }
            }
            v48 = *(_QWORD *)v48;
          }
          while (v48);
          v54 = qword_100021AE8;
          v148 = 0u;
          v149 = 0u;
          v146 = 0u;
          v147 = 0u;
          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          v140 = 0u;
          v141 = 0u;
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          *(_OWORD *)policy_info = 0u;
          v135 = 0u;
          byte_1000219E8 = 0;
          if (!qword_100021AE8)
            goto LABEL_144;
          v126 = 0;
          v128 = 0;
          v129 = 0;
          v130 = 1;
          do
          {
            if (!sub_1000050B4(v54) || *(_DWORD *)(v54 + 68) == 3 && *(_QWORD *)(v54 + 120) == qword_1000219E0 + 1)
              goto LABEL_47;
            if (*(_BYTE *)(v54 + 193))
            {
              v61 = qword_1000219E0;
              v62 = *(_QWORD *)(v54 + 128) + 1;
              *(_QWORD *)(v54 + 128) = v62;
              *(_QWORD *)(v54 + 136) = v45;
              *(_QWORD *)(v54 + 176) = 0;
              *(_BYTE *)(v54 + 172) = 0;
              *(_BYTE *)(v54 + 1400) = 0;
              *(_QWORD *)(v54 + 152) = 0;
              *(_QWORD *)(v54 + 160) = 0;
              *(_QWORD *)(v54 + 144) = v61;
              atomic_store(0, (unsigned int *)(v54 + 168));
              v125 = v62;
              sub_10000558C(0, "watchdog poll for service %s returned successfully, %lld successful checkins", v55, v56, v57, v58, v59, v60, *(_QWORD *)(v54 + 40));
              goto LABEL_47;
            }
            v63 = *(_QWORD *)(v54 + 144);
            if (*(_QWORD *)(v54 + 120) > v63)
              v63 = *(_QWORD *)(v54 + 120);
            if (*(_QWORD *)(v54 + 160))
              v64 = *(_QWORD *)(v54 + 160);
            else
              v64 = v63;
            if (*(_DWORD *)(v54 + 176) != dword_100020FD4 && qword_1000219E0 + 2 == v64 + *(int *)(v54 + 56))
            {
              sub_10000558C(2, "marking diagnostic collection next round for %s", v55, v56, v57, v58, v59, v60, *(_QWORD *)(v54 + 40));
              byte_1000219E8 = 1;
            }
            v65 = v54 + 1402;
            *(_OWORD *)(v54 + 1770) = 0u;
            *(_OWORD *)(v54 + 1786) = 0u;
            *(_OWORD *)(v54 + 1738) = 0u;
            *(_OWORD *)(v54 + 1754) = 0u;
            *(_OWORD *)(v54 + 1706) = 0u;
            *(_OWORD *)(v54 + 1722) = 0u;
            *(_OWORD *)(v54 + 1674) = 0u;
            *(_OWORD *)(v54 + 1690) = 0u;
            *(_OWORD *)(v54 + 1642) = 0u;
            *(_OWORD *)(v54 + 1658) = 0u;
            *(_OWORD *)(v54 + 1610) = 0u;
            *(_OWORD *)(v54 + 1626) = 0u;
            *(_OWORD *)(v54 + 1578) = 0u;
            *(_OWORD *)(v54 + 1594) = 0u;
            *(_OWORD *)(v54 + 1546) = 0u;
            *(_OWORD *)(v54 + 1562) = 0u;
            *(_OWORD *)(v54 + 1514) = 0u;
            *(_OWORD *)(v54 + 1530) = 0u;
            *(_OWORD *)(v54 + 1482) = 0u;
            *(_OWORD *)(v54 + 1498) = 0u;
            *(_OWORD *)(v54 + 1450) = 0u;
            *(_OWORD *)(v54 + 1466) = 0u;
            *(_OWORD *)(v54 + 1418) = 0u;
            *(_OWORD *)(v54 + 1434) = 0u;
            *(_OWORD *)(v54 + 1402) = 0u;
            v66 = snprintf((char *)(v54 + 1402), 0x190uLL, "checkin with service: %s ", *(const char **)(v54 + 40));
            if ((unint64_t)v66 <= 0x190)
              v67 = 400 - v66;
            else
              v67 = 0;
            v68 = snprintf((char *)(v65 + v66), v67, "(%d induced crashes) ", *(_DWORD *)(v54 + 180)) + (uint64_t)v66;
            if (v68 <= 0x190)
              v69 = 400 - v68;
            else
              v69 = 0;
            v70 = *(_DWORD *)(v54 + 188);
            if (v70)
            {
              if (v70 == 268435460)
              {
                v71 = snprintf((char *)(v65 + v68), v69, "failed to send ping message, %s watchdog request handling code likely hung ");
              }
              else
              {
                mach_error_string(v70);
                v71 = snprintf((char *)(v65 + v68), v69, "failed to send ping message with error %s ");
              }
            }
            else if (*(_BYTE *)(v54 + 192))
            {
              if (*(_BYTE *)(v54 + 193))
                goto LABEL_155;
              v71 = snprintf((char *)(v65 + v68), v69, "returned not alive ", v124, v125);
            }
            else
            {
              v71 = snprintf((char *)(v65 + v68), v69, "didn't receive a reply from the service ");
            }
            v72 = v68 + v71;
            if (v72 <= 0x190)
              v73 = 400 - v72;
            else
              v73 = 0;
            v74 = *(_QWORD *)(v54 + 1224);
            if (*(_BYTE *)(v54 + 194))
            {
              v75 = (char *)(v65 + v72);
              if (v74)
              {
                v125 = *(_QWORD *)(v54 + 1224);
                v76 = snprintf(v75, v73, "with context:\n%s (code 0x%llx)\n");
              }
              else
              {
                v76 = snprintf(v75, v73, "with context:\n%s\n");
              }
              goto LABEL_80;
            }
            if (v74)
            {
              v76 = snprintf((char *)(v65 + v72), v73, "with code 0x%llx\n");
LABEL_80:
              v72 += v76;
            }
            if (v72 <= 0x190)
              v77 = 400 - v72;
            else
              v77 = 0;
            v78 = *(_QWORD *)(v54 + 128);
            if (v78)
            {
              v72 += snprintf((char *)(v65 + v72), v77, "%lld seconds since last successful checkin, %lld total successful checkins since ", (v45 - *(_QWORD *)(v54 + 136)) / 0x3B9ACA00, v78);
              if (v72 <= 0x190)
                v79 = 400 - v72;
              else
                v79 = 0;
              if (*(_DWORD *)(v54 + 68) == 3 && *(_QWORD *)(v54 + 120) != *(_QWORD *)(*(_QWORD *)(v54 + 88) + 120))
              {
                v125 = (v45 - *(_QWORD *)(v54 + 112)) / 0x3B9ACA00;
                v80 = snprintf((char *)(v65 + v72), v79, "monitoring enabled by %s (%lld seconds ago)");
              }
              else
              {
                v80 = snprintf((char *)(v65 + v72), v79, "%lld seconds ago");
              }
            }
            else if (*(_DWORD *)(v54 + 68) == 3 && *(_QWORD *)(v54 + 120) != *(_QWORD *)(*(_QWORD *)(v54 + 88) + 120))
            {
              v125 = (v45 - *(_QWORD *)(v54 + 112)) / 0x3B9ACA00;
              v80 = snprintf((char *)(v65 + v72), v77, "no successful checkins since monitoring enabled by %s (%lld seconds ago)");
            }
            else
            {
              v80 = snprintf((char *)(v65 + v72), v77, "no successful checkins since %lld seconds ago");
            }
            v81 = *(_QWORD *)(v54 + 152);
            if (v81)
            {
              v82 = v72 + v80;
              if (v82 <= 0x190)
                v83 = 400 - v82;
              else
                v83 = 0;
              snprintf((char *)(v65 + v82), v83, ", %lld seconds since last crashed by watchdogd, ", (v45 - v81) / 0x3B9ACA00);
            }
            if (os_variant_has_internal_diagnostics("com.apple.watchdogd"))
            {
              if (sub_1000077DC())
              {
                sub_10000558C(2, "skipping evaluating or taking action on service %s because watchdogd defanged", v90, v91, v92, v93, v94, v95, *(_QWORD *)(v54 + 40));
                goto LABEL_47;
              }
              v96 = sub_100007DB4(*(_QWORD *)(v54 + 24), 0);
              if (v96 >= 1)
              {
                if (sub_100007D0C(v96))
                {
                  sub_10000558C(2, "skipping evaluating or taking action on service %s because service being debugged", v84, v85, v86, v87, v88, v89, *(_QWORD *)(v54 + 24));
                  goto LABEL_47;
                }
              }
            }
            sub_10000558C(2, "%s", v84, v85, v86, v87, v88, v89, v54 + 122);
            has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.watchdogd");
            if (!(_DWORD)has_internal_diagnostics)
              goto LABEL_135;
            v99 = 2863311532 * *(_DWORD *)(v54 + 56);
            if (qword_1000219E0 < v64 + (int)(HIDWORD(v99) + (v99 >> 63)))
              goto LABEL_135;
            v100 = (unsigned int *)(v54 + 168);
            while (!__ldaxr(v100))
            {
              v102 = 1;
              if (!__stlxr(1u, v100))
                goto LABEL_114;
            }
            v102 = 0;
            __clrex();
LABEL_114:
            v103 = *(_BYTE *)(v54 + 63) && *(_BYTE *)(v54 + 172) == 0;
            if ((v102 | v103) != 1)
              goto LABEL_135;
            if ((v126 & 0x100000000) != 0)
            {
              if ((v128 & 1) != 0)
                goto LABEL_122;
            }
            else if ((sub_100008B54(has_internal_diagnostics, v98, v55, v56, v57, v58, v59, v60) & 1) != 0)
            {
LABEL_122:
              sub_10000ABA0();
              v104 = v129;
              if ((v102 & ((v129 & 1) == 0)) != 0)
                v104 = 1;
              v128 = 1;
              v129 = v104;
              if (v103)
              {
                *(_BYTE *)(v54 + 172) = 1;
                sub_1000096EC(*(_QWORD *)(v54 + 40));
              }
              goto LABEL_126;
            }
            v128 = 0;
LABEL_126:
            if ((v129 & 1) != 0 && v102)
            {
              v105 = (char *)policy_info + (int)v126;
              v106 = 256 - (int)v126;
              if ((_DWORD)v126)
                v107 = snprintf(v105, v106, ", %s");
              else
                v107 = snprintf(v105, v106, "%s");
              v108 = v107 + v126;
              if (v107 + (int)v126 >= 256)
                v108 = 256;
              LODWORD(v126) = v108;
            }
            BYTE4(v126) = 1;
LABEL_135:
            if (qword_1000219E0 >= v64 + *(int *)(v54 + 56))
            {
              v130 = 0;
              *(_BYTE *)(v54 + 1400) = 1;
            }
LABEL_47:
            v54 = *(_QWORD *)v54;
          }
          while (v54);
          if ((v129 & 1) != 0)
          {
            sub_10000558C(0, "attempting to dump tailspin for: %s", v55, v56, v57, v58, v59, v60, (char)policy_info);
            sub_100008C0C((const char *)policy_info, &stru_100014D88);
          }
          v23 = &qword_100021000;
          v24 = &qword_100021000;
          v25 = &qword_100021000;
          v109 = v131;
          if ((v128 & 1) != 0)
            sub_100008BD0();
          if ((v130 & 1) == 0)
            sub_10000ADB4(v45);
LABEL_145:
          sub_100005D40((unsigned __int8 *)qword_1000219F8);
          qword_1000219F8 = qword_1000219F0;
          qword_1000219F0 = 0;
          objc_autoreleasePoolPop(v109);
          v110 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          if (v110 - qword_100021B00 >= 0x1BF08EB001)
            sub_100005BAC(v110, v111, v112, v113, v114, v115, v116, v117, v123);
          if ((_BYTE)get_default && clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) > v127)
          {
            sub_100003F70(&get_default, qword_1000219E0);
            if ((_BYTE)get_default)
              v127 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 30000000000;
          }
          sub_100005A4C();
          v32 = sub_100005ACC(v22, (unint64_t *)policy_infoCnt);
          ++qword_1000219E0;
          if (((v32 ^ 1) & 1) != 0)
            goto LABEL_7;
        }
      }
      if (*(_QWORD *)policy_infoCnt)
      {
        v22 = dispatch_time(0, *(int64_t *)policy_infoCnt);
        *(_QWORD *)policy_infoCnt = 0;
      }
      v32 = sub_100005ACC(v22, (unint64_t *)policy_infoCnt);
      if ((_DWORD)v32)
        goto LABEL_18;
    }
LABEL_154:
    v119 = _os_assert_log(0);
    _os_crash(v119);
    __break(1u);
LABEL_155:
    v120 = _os_assert_log(0);
    _os_crash(v120);
    __break(1u);
    goto LABEL_156;
  }
LABEL_157:
  result = _os_crash("thread_policy_set(thread_self, THREAD_TIME_CONSTRAINT_POLICY, ...) failed");
  __break(1u);
  return result;
}

BOOL sub_1000050B4(uint64_t a1)
{
  return !*(_BYTE *)(a1 + 16) && *(_DWORD *)(a1 + 104) && (*(_DWORD *)(a1 + 68) != 3 || *(_BYTE *)(a1 + 80));
}

void sub_1000050E8(int a1, __uint64_t a2)
{
  int v4;
  __uint64_t v5;
  unint64_t v6;
  mach_msg_return_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  mach_port_name_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  _BYTE v29[1256];
  mach_msg_header_t msg;

  if (a1 < 1)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = 0;
    do
    {
      v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      if (a2 <= v5)
        break;
      v6 = (a2 - v5) / 0xF4240;
      bzero(&msg, 0x4E8uLL);
      bzero(v29, 0x4E8uLL);
      v7 = mach_msg(&msg, 1282, 0, 0x52Cu, dword_100021B48, v6, 0);
      if (v7 != 268451843)
      {
        if (v7)
        {
          v28 = mach_error_string(v7);
          sub_10000558C(2, "failed to receive message with error: %s", v14, v15, v16, v17, v18, v19, v28);
        }
        else
        {
          ++v4;
          if (msg.msgh_id == 6009000)
            sub_1000052B8((uint64_t)&msg, (uint64_t)v29);
          else
            sub_10000558C(0, "received message with an unknown message id: %d (Reply ID should be: %d)", v8, v9, v10, v11, v12, v13, msg.msgh_id);
        }
      }
    }
    while (v4 < a1);
  }
  for (i = qword_100021AE8; i; i = *(_QWORD *)i)
  {
    v21 = *(_DWORD *)(i + 184);
    if (v21)
    {
      mach_port_mod_refs(mach_task_self_, v21, 1u, -1);
      *(_DWORD *)(i + 184) = 0;
    }
  }
  mach_port_mod_refs(mach_task_self_, dword_100021B48, 3u, -1);
  dword_100021B48 = 0;
  sub_10000558C(0, "watchdogd_process_replies returning after processing %d replies (%d pings sent)", v22, v23, v24, v25, v26, v27, v4);
}

uint64_t sub_1000052B8(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t result;

  v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v4 = *(_DWORD *)(a1 + 20) + 100;
  *(_QWORD *)(a2 + 8) = v3;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v4;
  if (*(_DWORD *)(a1 + 20) == 6009000)
  {
    if ((*(_DWORD *)a1 & 0x80000000) != 0)
      goto LABEL_16;
    v6 = *(unsigned int *)(a1 + 4);
    if (v6 < 0x48)
      goto LABEL_16;
    if (v6 > 0x4E8)
      goto LABEL_16;
    v7 = *(_DWORD *)(a1 + 56);
    if (v7 > 0x400)
      goto LABEL_16;
    v8 = (v7 + 3) & 0xFFFFFFFC;
    if ((int)v6 - 72 < v7 || v6 < v8 + 72)
      goto LABEL_16;
    v10 = a1 + v8;
    v11 = *(unsigned int *)(v10 + 68);
    if (v11 > 5)
      goto LABEL_16;
    v12 = v6 - v8;
    if (v11 > (v12 - 72) >> 5 || v12 != 32 * (_DWORD)v11 + 72)
      goto LABEL_16;
    if (*(unsigned int *)(a1 + 4) >= 0x43CuLL)
      v6 = 1084;
    if (memchr((void *)(a1 + 60), 0, v6 - 60))
    {
      *(_DWORD *)(a2 + 32) = sub_10000541C(*(_DWORD *)(a1 + 12), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), (_BYTE *)(a1 + 60), *(_QWORD *)(v10 + 60), (const void *)(v10 + 72), v11);
    }
    else
    {
LABEL_16:
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }
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

uint64_t sub_10000541C(int a1, unint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5, uint64_t a6, const void *a7, uint64_t a8)
{
  unsigned int v8;
  int v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;

  if (dword_100020FD0 <= a2)
  {
    sub_10000558C(2, "received invalid client ID (%llu) in reply message, skipping message", a3, a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a2);
    return 5;
  }
  v8 = a8;
  v12 = a4;
  v13 = &qword_100021AE8;
  do
    v13 = (uint64_t *)*v13;
  while (v13 && v13[1] != a2);
  if (*((_DWORD *)v13 + 46) != a1)
  {
    sub_10000558C(2, "received message for client (with claimed client ID: %llu) doesn't match receive port, skipping message", a3, a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a2);
    return 5;
  }
  sub_10000558C(1, "received reply message from %s round: %llu is_alive: %d string: %s", a3, a4, (uint64_t)a5, a6, (uint64_t)a7, a8, v13[5]);
  if (*((_DWORD *)v13 + 47))
    sub_100005DB4();
  *((_BYTE *)v13 + 192) = 1;
  *((_BYTE *)v13 + 193) = v12 != 0;
  v13[153] = a6;
  if (*a5)
    __strlcpy_chk((char *)v13 + 194, a5, 1024, 1024);
  if (*((_DWORD *)v13 + 17) != 2)
    return 0;
  sub_10000558C(0, "reply from controller %s for round: %llu includes %d ephemeral services", v14, v15, v16, v17, v18, v19, v13[5]);
  if (!v8)
    return 0;
  if (v8 >= 6)
    sub_100005DB4();
  memcpy(v13 + 154, a7, 32 * v8);
  result = 0;
  v13[174] = v8;
  return result;
}

void sub_10000558C(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __uint64_t v11;

  v11 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  sub_1000056B0(0, a1, v11, a2, &a9);
}

void sub_1000055DC(id a1, RBSProcessMonitor *a2, RBSProcessHandle *a3, RBSProcessStateUpdate *a4)
{
  RBSProcessStateUpdate *v5;
  RBSProcessHandle *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  v7 = -[RBSProcessHandle pid](v6, "pid");
  v13 = (id)objc_claimAutoreleasedReturnValue(-[RBSProcessStateUpdate state](v5, "state"));
  v8 = objc_msgSend(v13, "taskState");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessStateUpdate state](v5, "state"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endowmentNamespaces"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RBSProcessHandle bundle](v6, "bundle"));

  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  sub_100005C84(v7, v8, v10, v12);

}

void sub_1000056B0(char a1, int a2, uint64_t a3, const char *a4, va_list a5)
{
  char v10;
  uint64_t v11;
  int v12;
  int v13;
  IOReturn v14;
  unsigned int v15;
  int v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  id *v23;
  id v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD block[4];
  _QWORD v34[5];
  int v35;
  char v36;
  char v37;
  _QWORD v38[4];
  _QWORD v39[5];
  int v40;
  char v41;
  char v42;
  _QWORD v43[3];
  int v44;
  _QWORD v45[4];
  _BYTE data[12];
  int v47;
  char v48[512];

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  if (a2 == 2)
    v10 = 16;
  else
    v10 = 2 * (a2 == 1);
  v11 = a1 & 1;
  if (pthread_getspecific(qword_100021B28))
  {
    if (v11)
    {
      v27 = _os_assert_log(!(a1 & 1));
      v28 = _os_crash(v27);
      sub_10000DCB4(v28);
    }
    if (!qword_100021A60)
    {
      v29 = _os_assert_log(0);
      v30 = _os_crash(v29);
      sub_10000DCB4(v30);
    }
    bzero(&v47, 0x204uLL);
    *(_QWORD *)&data[4] = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    *(_DWORD *)data = a2;
    v12 = vsnprintf(v48, 0x200uLL, a4, a5);
    if (v12 >= 512)
      v13 = 512;
    else
      v13 = v12;
    v47 = v13;
    v14 = IODataQueueEnqueue((IODataQueueMemory *)qword_100021A60, data, v13 + 16);
    if (v14 != 268435460 && v14)
    {
      if (v14 != -536870168)
      {
        v31 = _os_assert_log(v14 == 268435460);
        v32 = _os_crash(v31);
        sub_10000DCB4(v32);
      }
      do
        v15 = __ldaxr(&dword_100021B4C);
      while (__stlxr(v15 + 1, &dword_100021B4C));
    }
  }
  else
  {
    if (qword_100021AA8 != -1)
      dispatch_once(&qword_100021AA8, &stru_100014F80);
    if (dword_100021AB0 && qword_100021AB8 != -1)
      dispatch_once(&qword_100021AB8, &stru_100014FA0);
    *(_QWORD *)data = 0;
    v16 = vasprintf((char **)data, a4, a5);
    if (*(_QWORD *)data && v16 >= 1)
    {
      v17 = a1 & 2;
      v18 = (void *)qword_100021A98;
      if (!v17)
        v18 = &_os_log_default;
      v19 = v18;
      v20 = v19;
      v21 = qword_100021A88;
      if (v11)
      {
        v25 = v17 >> 1;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10000D250;
        v38[3] = &unk_100015030;
        v23 = (id *)v39;
        v26 = v19;
        v41 = v10;
        v39[3] = a3;
        v39[4] = *(_QWORD *)data;
        v39[0] = v26;
        v39[1] = v43;
        v40 = a2;
        v42 = v25;
        v39[2] = v45;
        dispatch_sync(v21, v38);
      }
      else
      {
        v22 = v17 >> 1;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000D3E4;
        block[3] = &unk_100015030;
        v23 = (id *)v34;
        v24 = v19;
        v36 = v10;
        v34[3] = a3;
        v34[4] = *(_QWORD *)data;
        v34[0] = v24;
        v34[1] = v43;
        v35 = a2;
        v37 = v22;
        v34[2] = v45;
        dispatch_async(v21, block);
      }

    }
  }
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
}

void sub_100005A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void *sub_100005A4C()
{
  void *result;
  uint64_t v1;
  char i;
  char v3;
  unsigned __int8 v4;
  pid_t v5;

  result = pthread_getspecific(qword_100021B28);
  if (!result)
    sub_100005DB4();
  if (byte_100021454 == 1)
  {
    v1 = 0;
    for (i = 1; ; i = 0)
    {
      v3 = i;
      v4 = atomic_load((unsigned __int8 *)(qword_100021448 + 16 * v1 + 8));
      if ((v4 & 1) != 0)
        break;
      v1 = 1;
      if ((v3 & 1) == 0)
      {
        v5 = getpid();
        result = (void *)proc_set_dirty(v5, 0);
        byte_100021454 = 0;
        return result;
      }
    }
  }
  return result;
}

BOOL sub_100005ACC(dispatch_time_t timeout, unint64_t *a2)
{
  intptr_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  if (!a2)
    sub_100005DB4();
  v4 = dispatch_semaphore_wait((dispatch_semaphore_t)qword_100021B10, timeout);
  if (!v4)
  {
    v15 = 0;
    v16 = 0;
    if ((dispatch_time_to_nsec(0, &v16, &v15) & 1) == 0)
      sub_100005DB4();
    if (v16 != 1)
      sub_100005DB4();
    v14 = 0;
    if ((dispatch_time_to_nsec(timeout, &v16, &v14) & 1) == 0)
      sub_100005DB4();
    if (v16 != 1)
      sub_100005DB4();
    v11 = v14 - v15;
    if (v14 < v15)
      v11 = 0;
    *a2 = v11;
    sub_10000558C(0, "service monitoring thread pausing...", v5, v6, v7, v8, v9, v10, v13);
    qword_1000219D0 = 0;
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_100021B18);
  }
  return v4 != 0;
}

void sub_100005BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (qword_100021A48 != -1)
    dispatch_once(&qword_100021A48, &stru_100014F20);
  if (byte_100021A50 == 1)
  {
    sub_10000558C(0, "skipping setting PMU boot stage because -wdt_no_pmu found in boot-args or no-pmu found in EDT", a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    if (!dword_100021A38)
      sub_100005DB4();
    if ((byte_100021A54 & 1) == 0)
    {
      if (IORegistryEntrySetCFProperty(dword_100021A38, CFSTR("IOPMUBootStage"), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 255)))
      {
        sub_10000558C(2, "Unable to set device boot stage to 0x%x, IORegistryEntrySetCFProperty returned 0x%x", v9, v10, v11, v12, v13, v14, 255);
      }
      byte_100021A54 = 1;
    }
  }
}

void sub_100005C84(int a1, int a2, void *a3, const __CFString *a4)
{
  id v7;
  void *v8;
  unsigned int v9;
  int v10;
  id v11;

  v7 = a3;
  v8 = v7;
  switch(a2)
  {
    case 1:
    case 3:
      goto LABEL_6;
    case 2:
    case 4:
      v11 = v7;
      v9 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.frontboard.visibility"));
      v8 = v11;
      if (v9)
      {
        if (sub_100004080(a4))
          v10 = 0;
        else
          v10 = a1;
      }
      else
      {
LABEL_6:
        if (dword_100021A58 != a1)
          goto LABEL_9;
        v11 = v8;
        sub_100004080(CFSTR("com.apple.SpringBoard"));
        v10 = 0;
      }
      dword_100021A58 = v10;
      v8 = v11;
LABEL_9:

      return;
    default:
      goto LABEL_9;
  }
}

unsigned __int8 *sub_100005D40(unsigned __int8 *result)
{
  unsigned __int8 *v1;

  if (result)
  {
    v1 = result;
    result = (unsigned __int8 *)stackshot_config_dealloc(*(_QWORD *)result);
    *(_QWORD *)v1 = 0;
    atomic_store(0, v1 + 8);
  }
  return result;
}

void sub_100005D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  kern_return_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = IOConnectCallScalarMethod(dword_100021418, 1u, 0, 0, 0, 0);
  if (v9)
    sub_10000DAC0(v9, v10, v11, v12, v13, v14, v15, v16);
  sub_10000558C(1, "checked in with KEXT", v11, v12, v13, v14, v15, v16, a9);
}

void sub_100005DB4()
{
  uint64_t v0;

  v0 = sub_1000065E0();
  _os_crash(v0);
  __break(1u);
}

void wd_optin_service_register(void *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  _xpc_connection_s *mach_service;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  _QWORD v13[4];
  _xpc_connection_s *v14;
  void (**v15)(_QWORD, _QWORD);

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5)
    sub_100005DB4();
  if (!v6)
    sub_100005DB4();
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!v7)
    sub_100005DB4();
  if (sub_100005F04())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", 0, 2uLL);
    xpc_connection_set_event_handler(mach_service, &stru_1000149C8);
    xpc_connection_activate(mach_service);
    v10 = sub_100006034(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006148;
    v13[3] = &unk_1000149F0;
    v14 = mach_service;
    v15 = v8;
    v12 = mach_service;
    xpc_connection_send_message_with_reply(v12, v11, v6, v13);

  }
  else
  {
    *__error() = 45;
    v8[2](v8, 0);
  }

}

BOOL sub_100005F04()
{
  _BOOL8 result;
  uint64_t v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if ((os_variant_is_darwinos("com.apple.watchdogd") & 1) != 0)
  {
    if (qword_100020FE8 != -1)
      dispatch_once(&qword_100020FE8, &stru_100014A50);
    if (byte_100020FE0)
    {
      result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_10000D6D4(result, v1, v2, v3, v4, v5, v6, v7);
        return 0;
      }
    }
    else
    {
      if (qword_100020FF0 != -1)
        dispatch_once(&qword_100020FF0, &stru_100014A70);
      if (byte_100020FF8 != 1)
        return 1;
      result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_10000D6A0(result, v15, v16, v17, v18, v19, v20, v21);
        return 0;
      }
    }
  }
  else
  {
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10000D708(result, v8, v9, v10, v11, v12, v13, v14);
      return 0;
    }
  }
  return result;
}

void sub_100005FF0(id a1, OS_xpc_object *a2)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2)
      sub_10000D73C(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

id sub_100006034(void *a1)
{
  id v1;
  xpc_object_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v8;

  v1 = a1;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "watchdogd_request_command", 0);
  if (!v1)
    goto LABEL_4;
  v8 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v1, 200, 0, &v8));
  v4 = v8;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    xpc_dictionary_set_data(v2, "watchdogd_optin_service_identifier", objc_msgSend(v5, "bytes"), (size_t)objc_msgSend(v5, "length"));

LABEL_4:
    v6 = v2;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10000D770(v4);

  v6 = 0;
LABEL_8:

  return v6;
}

void sub_100006148(uint64_t a1, void *a2)
{
  sub_100006180(a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

uint64_t sub_100006180(void *a1)
{
  id v1;
  uint64_t v2;
  int *v3;
  int v4;
  int int64;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  v1 = a1;
  if (xpc_get_type(v1) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10000D800(v1);
    v3 = __error();
    v2 = 0;
    v4 = 61;
    goto LABEL_7;
  }
  if (xpc_get_type(v1) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v2 = 0;
    goto LABEL_8;
  }
  int64 = xpc_dictionary_get_int64(v1, "watchdogd_request_result");
  if (int64 != 1)
  {
    if (int64)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10000D880(int64);
      v3 = __error();
      if ((int64 & 0xFFFFFFFE) == 2)
      {
        v2 = 0;
        v4 = 1;
      }
      else
      {
        v2 = 0;
        v4 = 22;
      }
    }
    else
    {
      v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v7)
        sub_10000D8F8(v7, v8, v9, v10, v11, v12, v13, v14);
      v3 = __error();
      v2 = 0;
      v4 = 94;
    }
LABEL_7:
    *v3 = v4;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "optin registration successful", v15, 2u);
  }
  v2 = 1;
LABEL_8:

  return v2;
}

uint64_t wd_optin_service_register_sync(void *a1)
{
  id v1;
  void *v2;
  _xpc_connection_s *mach_service;
  id v4;
  void *v5;
  xpc_object_t v6;
  uint64_t v7;

  v1 = a1;
  if (!v1)
    sub_100005DB4();
  v2 = v1;
  if (sub_100005F04())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", 0, 2uLL);
    xpc_connection_set_event_handler(mach_service, &stru_100014A10);
    xpc_connection_activate(mach_service);
    v4 = sub_100006034(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = xpc_connection_send_message_with_reply_sync(mach_service, v5);
    v7 = sub_100006180(v6);
    xpc_connection_cancel(mach_service);

  }
  else
  {
    v7 = 0;
    *__error() = 45;
  }

  return v7;
}

void sub_1000063A0(id a1, OS_xpc_object *a2)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2)
      sub_10000D73C(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_1000063E4(id a1)
{
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0))
    byte_100020FE0 = v2 != 0;
}

void sub_10000643C(id a1)
{
  uint64_t v1;

  if (qword_100021000 != -1)
    dispatch_once(&qword_100021000, &stru_100014A90);
  v1 = 0;
  if (os_parse_boot_arg_from_buffer_int(&unk_100021008, "wdt", &v1)
    && (unint64_t)(v1 + 1) <= 9
    && ((1 << (v1 + 1)) & 0x203) != 0)
  {
    byte_100020FF8 = 1;
  }
}

void sub_1000064C8(id a1)
{
  size_t v1;
  uint8_t buf[4];
  void *v3;

  v1 = 1024;
  if (sysctlbyname("kern.bootargs", &unk_100021008, &v1, 0, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10000D92C();
    _os_crash("could not retrieve device boot-args");
    __break(1u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v3 = &unk_100021008;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "retrieved current device boot-args: %s", buf, 0xCu);
  }
}

void sub_1000065B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000065C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_1000065E0()
{
  return _os_assert_log(0);
}

void sub_1000065E8()
{
  const char *v0;
  size_t v1;
  size_t v2;
  char *v3;
  size_t v4;
  char *v5;
  size_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_registry_entry_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *CFProperty;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFStringRef v28;
  mach_error_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  mach_error_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  size_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  size_t v57;
  size_t v58;
  uint64_t v59;
  const char **v60;
  size_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  size_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  size_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  size_t v91;
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
  size_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  char v114;
  char v115;
  char v116;
  char __str[1024];
  char buffer[1024];

  v0 = (const char *)sub_10000A104();
  v1 = strlen(v0);
  if (!strnstr(v0, "wdt_test=", v1))
    return;
  v2 = strlen(v0);
  v3 = strnstr(v0, "wdt_controller", v2);
  v4 = strlen(v0);
  v5 = strnstr(v0, "wdt_ephemeral", v4);
  v6 = strlen(v0);
  v7 = strnstr(v0, "wdt_optin", v6);
  bzero(buffer, 0x400uLL);
  bzero(__str, 0x400uLL);
  v14 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v14)
    sub_10000558C(2, "NVRAM is not supported on this system", v8, v9, v10, v11, v12, v13, v113);
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v14, CFSTR("boot-args"), 0, 0);
  if (!CFProperty)
    sub_10000558C(2, "No boot-args NVRAM variable found", v15, v16, v17, v18, v19, v20, v113);
  CFStringGetCString(CFProperty, buffer, 1024, 0x8000100u);
  sub_10000558C(0, "Retrieved current boot-args from NVRAM: %s\n", v22, v23, v24, v25, v26, v27, (char)buffer);
  CFRelease(CFProperty);
  sub_100006B48(buffer, "wdt_test=");
  sub_100006B48(buffer, "wdt_ephemeral=");
  sub_100006B48(buffer, "wdt_controller=");
  sub_100006B48(buffer, "wdt_optin=");
  sub_100006B48(buffer, "wdt=");
  sub_100006B48(buffer, "-wdt_no_pmu");
  snprintf(__str, 0x400uLL, "%s wdt=-1 -wdt_no_pmu", buffer);
  v28 = CFStringCreateWithCString(kCFAllocatorDefault, __str, 0x8000100u);
  v29 = IORegistryEntrySetCFProperty(v14, CFSTR("boot-args"), v28);
  if (v29)
  {
    mach_error_string(v29);
    sub_10000558C(2, "Failed to set new boot-args to %s in NVRAM, IORegistryEntrySetCFProperty returned %s", v30, v31, v32, v33, v34, v35, (char)__str);
  }
  CFRelease(v28);
  v36 = IORegistryEntrySetCFProperty(v14, CFSTR("IONVRAM-FORCESYNCNOW-PROPERTY"), CFSTR("IONVRAM-FORCESYNCNOW-PROPERTY"));
  if (v36)
  {
    v43 = mach_error_string(v36);
    sub_10000558C(2, "Failed to flush new boot-args to in NVRAM, IORegistryEntrySetCFProperty returned %s", v44, v45, v46, v47, v48, v49, v43);
  }
  sub_10000558C(0, "Updated and flushed new boot-args: %s", v37, v38, v39, v40, v41, v42, (char)__str);
  v50 = strlen(v0);
  if (strnstr(v0, "wdt_test=healthy", v50)
    || (v57 = strlen(v0), strnstr(v0, "wdt_test=tm_nopanic", v57))
    || (v58 = strlen(v0), strnstr(v0, "wdt_test=tm_panic", v58)))
  {
    sub_10000CE2C(0, "watchdogd detected testing boot-args for daemon (controller: %d) (ephemeral: %d) (optin: %d)", v51, v52, v53, v54, v55, v56, v3 != 0);
    if (dword_100020FD0 <= 2)
      sub_10000D9A8();
    memcpy(&unk_100019ED0, &unk_100018290, 0x710uLL);
    sub_100006C74(off_100019EE8[0], off_100019EF0[0], "/usr/local/libexec/watchdogtestdaemon", 0);
    v59 = 1;
    dword_100020FD0 = 1;
    if (v3)
    {
      memcpy(&unk_10001A5E0, &unk_1000189A0, 0x710uLL);
      sub_100006C74(off_10001A5F8[0], off_10001A600[0], "/usr/local/libexec/watchdogtestcontroller", "-c");
      v59 = ++dword_100020FD0;
    }
    if (v5)
    {
      v60 = (const char **)((char *)&unk_100019ED0 + 1808 * v59);
      memcpy(v60, &unk_1000190B0, 0x710uLL);
      sub_100006C74(v60[3], v60[4], "/usr/local/libexec/watchdogtestephemeral", "-e");
      ++dword_100020FD0;
    }
    if (v7)
      sub_100006C74(off_1000197D8[0], off_1000197E0[0], "/usr/local/libexec/watchdogtestoptin", "-o");
    return;
  }
  v61 = strlen(v0);
  if (strnstr(v0, "wdt_test=no_user_checkin", v61))
  {
    sub_10000CE2C(0, "watchdogd detected testing boot-args to not run, exiting", v62, v63, v64, v65, v66, v67, v114);
    goto LABEL_30;
  }
  v68 = strlen(v0);
  if (strnstr(v0, "wdt_test=cpu_hang", v68))
  {
    sub_10000CE2C(0, "watchdogd detected testing boot-args to trigger CPU hang", v69, v70, v71, v72, v73, v74, v114);
    sub_1000079D0();
  }
  v75 = strlen(v0);
  if (strnstr(v0, "wdt_test=soc_watchdog", v75))
  {
    sub_10000CE2C(0, "triggering SoC watchdog", v76, v77, v78, v79, v80, v81, v114);
    sub_100005BAC(v82, v83, v84, v85, v86, v87, v88, v89, v115);
    v90 = 0;
LABEL_29:
    sub_100007A20(v90);
LABEL_30:
    sub_100009D4C();
  }
  v91 = strlen(v0);
  if (strnstr(v0, "wdt_test=panic_soc_watchdog", v91))
  {
    sub_10000CE2C(0, "triggering panic SoC watchdog", v92, v93, v94, v95, v96, v97, v114);
    sub_100005BAC(v98, v99, v100, v101, v102, v103, v104, v105, v116);
    v90 = 1;
    goto LABEL_29;
  }
  v106 = strlen(v0);
  if (strnstr(v0, "wdt_test=iokit_busy", v106))
  {
    sub_10000CE2C(0, "triggering IOKit busy", v107, v108, v109, v110, v111, v112, v114);
    sub_100007A70();
  }
}

void sub_100006B48(char *a1, const char *a2)
{
  size_t v4;
  size_t v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  char *v17;
  const char *v18;
  size_t v19;
  char *__s2;

  v4 = strlen(a1);
  v5 = strlen(a2);
  if (v4 > v5)
  {
    __s2 = 0;
    v6 = strnstr(a1, a2, v5);
    if (!v6)
    {
      asprintf(&__s2, " %s", a2);
      v7 = __s2;
      v8 = strstr(a1, __s2);
      free(v7);
      if (!v8)
      {
        sub_10000558C(0, "No existing %s boot-arg to remove.\n", v9, v10, v11, v12, v13, v14, (char)a2);
        return;
      }
      v6 = v8 + 1;
    }
    v15 = &v6[strcspn(v6, " ")];
    v16 = &v15[strspn(v15, " ")];
    do
      v17 = v6--;
    while (v6 >= a1 && *v6 == 32);
    if (*v16)
    {
      v18 = &v16[-(v17 != a1)];
      v19 = strlen(v18);
      memmove(v17, v18, v19 + 1);
    }
    else
    {
      *v17 = 0;
    }
  }
}

void sub_100006C74(const char *a1, const char *a2, const char *a3, const char *a4)
{
  _launch_data *v8;
  void *v9;
  _launch_data *v10;
  _launch_data *v11;
  _launch_data *v12;
  _launch_data *v13;
  _launch_data *v14;
  _launch_data *v15;
  _launch_data *v16;
  _launch_data *v17;
  _launch_data *v18;
  _launch_data *v19;
  _launch_data *v20;
  _launch_data *v21;
  _launch_data *v22;
  _launch_data *v23;
  _launch_data *v24;

  v8 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  v9 = objc_autoreleasePoolPush();
  v10 = launch_data_new_string(a1);
  launch_data_dict_insert(v8, v10, "Label");
  v11 = launch_data_alloc(LAUNCH_DATA_ARRAY);
  v12 = launch_data_new_string(a3);
  launch_data_array_set_index(v11, v12, 0);
  if (a4)
  {
    v13 = launch_data_new_string(a4);
    launch_data_array_set_index(v11, v13, 1uLL);
  }
  launch_data_dict_insert(v8, v11, "ProgramArguments");
  v14 = launch_data_new_string("Interactive");
  launch_data_dict_insert(v8, v14, "POSIXSpawnType");
  v15 = launch_data_new_BOOL(0);
  launch_data_dict_insert(v8, v15, "EnablePressuredExit");
  v16 = launch_data_new_BOOL(0);
  launch_data_dict_insert(v8, v16, "EnableTransactions");
  v17 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  v18 = launch_data_new_BOOL(0);
  launch_data_dict_insert(v17, v18, "SuccessfulExit");
  launch_data_dict_insert(v8, v17, "KeepAlive");
  v19 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  v20 = launch_data_new_BOOL(1);
  launch_data_dict_insert(v19, v20, a2);
  launch_data_dict_insert(v8, v19, "MachServices");
  objc_autoreleasePoolPop(v9);
  v21 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  if (!v21)
    sub_10000D9A8();
  v22 = v21;
  launch_data_dict_insert(v21, v8, "SubmitJob");
  v23 = launch_msg(v22);
  if (!v23)
  {
    if (!*__error())
      goto LABEL_9;
LABEL_11:
    sub_10000D9C0((char)a2);
  }
  v24 = v23;
  if (launch_data_get_type(v23) == LAUNCH_DATA_ERRNO && launch_data_get_errno(v24))
    goto LABEL_11;
  launch_data_free(v22);
  v22 = v24;
LABEL_9:
  launch_data_free(v22);
}

BOOL sub_100006E78()
{
  uint64_t v0;
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  _BOOL8 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  mach_error_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int Volumes;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  IONotificationPort *v62;
  IONotificationPort *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  void *i;
  const char *v69;
  const __CFDictionary *v70;
  io_service_t MatchingService;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  io_service_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  mach_error_t v85;
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
  CFIndex v99;
  const __CFNumber *ValueAtIndex;
  void *v101;
  char v102;
  char v103;
  char v104;
  char v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int16 v111;
  io_object_t notification;
  char v113;
  unsigned int v114;
  _BYTE v115[128];
  statfs v116;
  unsigned __int8 uu[8];
  uint64_t v118;
  _QWORD v119[2];
  _QWORD v120[2];
  statfs v121;

  v114 = 0;
  bzero(&v121, 0x878uLL);
  v120[1] = 0;
  v120[0] = 0;
  v119[1] = 0;
  v119[0] = 0;
  v113 = 0;
  v118 = 0;
  *(_QWORD *)uu = 0;
  v0 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (!qword_100021AD8)
    sub_100005DB4();
  v1 = (void *)v0;
  if (statfs("/", &v121))
  {
    v2 = __error();
    v103 = strerror(*v2);
    v9 = "failed to statfs root with error: %s";
LABEL_4:
    sub_10000558C(2, v9, v3, v4, v5, v6, v7, v8, v103);
LABEL_5:
    v10 = 0;
    goto LABEL_43;
  }
  sub_100007414(v121.f_mntfromname, (char *)v120, (char *)v119, (uint64_t)&v114);
  v11 = APFSContainerVolumeGroupGet(v120, v114, uu);
  if (v11 == 49197)
    goto LABEL_11;
  v12 = v11;
  if (v11 == 49154)
    goto LABEL_11;
  if (v11)
    goto LABEL_12;
  if (uuid_is_null(uu))
  {
    if (uuid_is_null(uu))
    {
LABEL_11:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ss%d"), v119, v114));
      objc_msgSend(v1, "addObject:", v19);

      goto LABEL_13;
    }
LABEL_12:
    v20 = strerror(v12 & 0x3FFF);
    sub_10000558C(2, "error looking up volume group: %s", v21, v22, v23, v24, v25, v26, v20);
    goto LABEL_13;
  }
  sub_10000558C(0, "root volume is part of a volume group looking up volumes to monitor...", v13, v14, v15, v16, v17, v18, v102);
  *(_QWORD *)&v116.f_bsize = 0;
  Volumes = APFSContainerVolumeGroupGetVolumes(v120, uu, &v116);
  if (Volumes)
  {
    strerror(Volumes & 0x3FFF);
    sub_10000558C(2, "failed to get volume group from disk: %s with error: %s", v56, v57, v58, v59, v60, v61, (char)v120);
    goto LABEL_5;
  }
  if (CFArrayGetCount(*(CFArrayRef *)&v116.f_bsize) < 1)
    sub_100005DB4();
  if (CFArrayGetCount(*(CFArrayRef *)&v116.f_bsize) >= 1)
  {
    v99 = 0;
    do
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)&v116.f_bsize, v99);
      notification = 0;
      if (!CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &notification))
        sub_100005DB4();
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ss%d"), v119, notification));
      objc_msgSend(v1, "addObject:", v101);

      ++v99;
    }
    while (CFArrayGetCount(*(CFArrayRef *)&v116.f_bsize) > v99);
  }
  CFRelease(*(CFTypeRef *)&v116.f_bsize);
LABEL_13:
  bzero(&v116, 0x878uLL);
  v111 = 0;
  if (statfs("/private/var", &v116))
  {
    v27 = __error();
    v104 = strerror(*v27);
    sub_10000558C(2, "failed to statfs data volume with error: %s", v28, v29, v30, v31, v32, v33, v104);
  }
  else
  {
    v34 = APFSVolumeRole(v116.f_mntfromname, &v111, 0);
    if (v34 || v111 != 64)
    {
      mach_error_string(v34);
      sub_10000558C(2, "Failed to get role of %s, expected data volume, actual role 0x%x, error message: %s\n", v49, v50, v51, v52, v53, v54, (char)v116.f_mntfromname);
    }
    else
    {
      sub_100007414(v116.f_mntfromname, (char *)v120, (char *)v119, (uint64_t)&v114);
      asprintf((char **)&qword_100021408, "%ss%d", (const char *)v119, v114);
      if (qword_100021408)
      {
        v41 = APFSVolumeNeedsCryptoMigration(qword_100021408, &v113);
        if (v41)
        {
          v113 = 0;
          v106 = v41 & 0x3FFF;
          sub_10000558C(2, "Cannot determine whether crypto migration is needed for %s with error %d", v42, v43, v44, v45, v46, v47, qword_100021408);
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), qword_100021408, v106));
        objc_msgSend(v1, "addObject:", v48);

      }
      else
      {
        sub_10000558C(2, "Failed to allocate data volume string", v35, v36, v37, v38, v39, v40, v105);
      }
    }
  }
  if (!objc_msgSend(v1, "count"))
  {
    v9 = "No volumes watchdog needs to monitor are found\n";
    goto LABEL_4;
  }
  notification = 0;
  v62 = IONotificationPortCreate(kIOMainPortDefault);
  if (!v62)
    sub_100005DB4();
  v63 = v62;
  IONotificationPortSetDispatchQueue(v62, (dispatch_queue_t)qword_100021AD8);
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v64 = v1;
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v66; i = (char *)i + 1)
      {
        if (*(_QWORD *)v108 != v67)
          objc_enumerationMutation(v64);
        v69 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)i)), "UTF8String");
        v70 = IOBSDNameMatching(kIOMainPortDefault, 0, v69);
        MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v70);
        if (MatchingService)
        {
          v78 = MatchingService;
          if (IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
          {
            v85 = IOServiceAddInterestNotification(v63, v78, "IOGeneralInterest", (IOServiceInterestCallback)sub_100007500, 0, &notification);
            if (v85)
            {
              mach_error_string(v85);
              sub_10000558C(2, "failed to register volume interest notification for: %s with error: %s", v92, v93, v94, v95, v96, v97, (char)v69);
            }
            else
            {
              sub_10000558C(0, "registered volume interest notification for: %s", v86, v87, v88, v89, v90, v91, (char)v69);
            }
          }
          else
          {
            sub_10000558C(2, "unable to monitor: %s for freeze notifications, not an APFS volume", v79, v80, v81, v82, v83, v84, (char)v69);
          }
          IOObjectRelease(v78);
        }
        else
        {
          sub_10000558C(2, "failed to find IOKit object for volume: %s", v72, v73, v74, v75, v76, v77, (char)v69);
        }
      }
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
    }
    while (v66);
  }

  v10 = v113 != 0;
LABEL_43:

  return v10;
}

void sub_100007414(const char *a1, char *a2, char *a3, uint64_t a4)
{
  size_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  int v17;

  v17 = 0;
  v8 = strlen(a1);
  v9 = strnstr(a1, "/dev", v8);
  if (v9 && ((v16 = v9, sscanf(v9, "/dev/disk%ds%d", &v17, a4) == 2) || sscanf(v16, "disk%ds%d", &v17, a4) == 2))
  {
    snprintf(a2, 0x10uLL, "/dev/disk%d", v17);
    snprintf(a3, 0x10uLL, "disk%d", v17);
  }
  else
  {
    sub_10000558C(2, "failed to parse disk information from root_disk_name: %s", v10, v11, v12, v13, v14, v15, (char)a1);
  }
}

void sub_100007500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  char v19;
  char v20;

  v20 = 0;
  switch(a3)
  {
    case 0xE0084006:
      v9 = dword_100021410;
      if (!dword_100021410)
      {
        sub_100009CD8((uint64_t)"volume freeze notification", a2, a3, a4, a5, a6, a7, a8);
        v9 = dword_100021410;
      }
      dword_100021410 = v9 + 1;
      v10 = "received volume freeze notification";
      goto LABEL_16;
    case 0xE0084007:
      if (!--dword_100021410)
        sub_100009D10((uint64_t)"volume unfreeze notification", a2, a3, a4, a5, a6, a7, a8, v18);
      v10 = "received volume unfreeze complete notification";
      goto LABEL_16;
    case 0xE008400A:
      if ((byte_100021414 & 1) != 0)
      {
        v10 = "duplicated volume transcribe start notification!";
        goto LABEL_18;
      }
      byte_100021414 = 1;
      sub_100009CD8((uint64_t)"volume transcribe start notification", a2, a3, a4, a5, a6, a7, a8);
      v10 = "received volume transcribe start notification";
LABEL_16:
      v17 = 0;
      goto LABEL_19;
    case 0xE008400B:
      if (byte_100021414 == 1)
      {
        byte_100021414 = 0;
        sub_100009D10((uint64_t)"volume transcribe stop notification", a2, a3, a4, a5, a6, a7, a8, v18);
        if (qword_100021408)
        {
          if (APFSVolumeNeedsCryptoMigration(qword_100021408, &v20))
          {
            sub_10000558C(2, "Cannot determine whether crypto migration for %s is needed with error %d", v11, v12, v13, v14, v15, v16, qword_100021408);
          }
          else if (!v20)
          {
            sub_10000558C(0, "crypto migration finished", v11, v12, v13, v14, v15, v16, v19);
            sub_100009AE4(v20);
          }
        }
        sub_10000558C(0, "received volume transcribe stop notification", v11, v12, v13, v14, v15, v16, v19);
      }
      else
      {
        v10 = "duplicated volume transcribe stop notification!";
LABEL_18:
        v17 = 2;
LABEL_19:
        sub_10000558C(v17, v10, a3, a4, a5, a6, a7, a8, a9);
      }
      return;
    default:
      sub_10000558C(0, "ignoring interest notification of type: %u", a3, a4, a5, a6, a7, a8, a3);
      return;
  }
}

void sub_10000769C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const __CFDictionary *v9;
  io_service_t MatchingService;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  io_object_t v17;
  kern_return_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  char *v34;

  v9 = IOServiceMatching("IOWatchdog");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v9);
  if (!MatchingService)
  {
    sub_10000CE2C(2, "failed to discover watchdog KEXT service", v11, v12, v13, v14, v15, v16, v32);
    if (sub_10000A244())
    {
      sub_10000CE2C(0, "detected virtual machine environment and no watchdog KEXT found, exiting...", v26, v27, v28, v29, v30, v31, v33);
      sub_100009D4C();
    }
    sub_10000DA04();
  }
  v17 = MatchingService;
  v18 = IOServiceOpen(MatchingService, mach_task_self_, 1u, (io_connect_t *)&dword_100021418);
  IOObjectRelease(v17);
  if (v18)
    v25 = 1;
  else
    v25 = dword_100021418 == 0;
  if (v25)
    sub_10000DA1C(&v34, v18);
  sub_10000558C(0, "connected to watchdog KEXT", v19, v20, v21, v22, v23, v24, a9);
}

BOOL sub_100007784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v0 = IOConnectCallScalarMethod(dword_100021418, 0, 0, 0, &output, &outputCnt);
  if ((_DWORD)v0)
    sub_10000DA64(v0, v1, v2, v3, v4, v5, v6, v7);
  return output != 0;
}

BOOL sub_1000077DC()
{
  kern_return_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v0 = IOConnectCallScalarMethod(dword_100021418, 5u, 0, 0, &output, &outputCnt);
  if (v0)
    sub_10000DA90(v0, v1, v2, v3, v4, v5, v6, v7);
  return output != 0;
}

void sub_100007834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = IOConnectCallScalarMethod(dword_100021418, 3u, 0, 0, 0, 0);
  if ((_DWORD)v9)
    sub_10000DAF0(v9, v10, v11, v12, v13, v14, v15, v16);
  sub_10000558C(0, "called into KEXT to disable userspace monitoring", v11, v12, v13, v14, v15, v16, a9);
}

void sub_100007874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = IOConnectCallScalarMethod(dword_100021418, 4u, 0, 0, 0, 0);
  if ((_DWORD)v9)
    sub_10000DB1C(v9, v10, v11, v12, v13, v14, v15, v16);
  sub_10000558C(0, "called into KEXT to re-enable userspace monitoring", v11, v12, v13, v14, v15, v16, a9);
}

void sub_1000078B4(const char *a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char __str[16];
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
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
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
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)__str = 0u;
  v9 = 0u;
  snprintf(__str, 0x800uLL, "%s", a1);
  v1 = IOConnectCallStructMethod(dword_100021418, 2u, __str, 0x800uLL, 0, 0);
  sub_10000558C(2, "IOConnectCallStructMethod returned 0x%x", v2, v3, v4, v5, v6, v7, v1);
  _os_crash("watchdogd failed to panic device");
  __break(1u);
}

uint64_t sub_100007964(_BYTE *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v11;
  __int16 outputStruct;

  outputStruct = 0;
  v11 = 2;
  if (!a1)
    sub_10000D9A8();
  v2 = IOConnectCallStructMethod(dword_100021418, 9u, 0, 0, &outputStruct, &v11);
  if ((_DWORD)v2)
    sub_10000DB48(v2, v3, v4, v5, v6, v7, v8, v9);
  *a1 = HIBYTE(outputStruct);
  return outputStruct;
}

void sub_1000079D0()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = IOConnectCallScalarMethod(dword_100021418, 6u, 0, 0, 0, 0);
  sub_10000CE2C(2, "Failed to call kIOWatchdogDaemonTestCPUHang method, returned : %d", v1, v2, v3, v4, v5, v6, v0);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonTestCPUHang, ...) failed");
  __break(1u);
}

uint64_t sub_100007A20(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t input;

  input = a1;
  result = IOConnectCallScalarMethod(dword_100021418, 7u, &input, 1u, 0, 0);
  if (input)
    sub_10000DBA0(result, v2, v3, v4, v5, v6, v7, v8);
  if ((_DWORD)result)
    sub_10000DB74(result, v2, v3, v4, v5, v6, v7, v8);
  return result;
}

uint64_t sub_100007A70()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = IOConnectCallScalarMethod(dword_100021418, 8u, 0, 0, 0, 0);
  if ((_DWORD)result)
    sub_10000DBCC(result, v1, v2, v3, v4, v5, v6, v7);
  return result;
}

void sub_100007AA8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_10000CE2C(2, a2, a3, a4, a5, a6, a7, a8, a9);
}

id sub_100007AB0()
{
  if (qword_100021438 != -1)
    dispatch_once(&qword_100021438, &stru_100014AB0);
  return (id)qword_100021430;
}

void sub_100007AF0(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.watchdogd.service_diagnostics", v4);
  v3 = (void *)qword_100021430;
  qword_100021430 = (uint64_t)v2;

  if (!qword_100021430)
    sub_100005DB4();

}

id sub_100007B54(int a1)
{
  dispatch_queue_t v2;
  void *v3;
  dispatch_group_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  qword_100021440 = (uint64_t)malloc_type_calloc(a1, 0x1C0uLL, 0x1050040AEA4FF0BuLL);
  if (!qword_100021440)
    sub_100005DB4();
  qword_100021448 = (uint64_t)malloc_type_calloc(2uLL, 0x10uLL, 0x1080040C20BADFCuLL);
  if (!qword_100021448)
    sub_100005DB4();
  dword_100021450 = a1;
  if (os_variant_has_internal_diagnostics("com.apple.watchdogd"))
  {
    v2 = dispatch_queue_create("com.apple.watchdogd.enhanced_diags", 0);
    v3 = (void *)qword_100021420;
    qword_100021420 = (uint64_t)v2;

    v4 = dispatch_group_create();
    v5 = (void *)qword_100021428;
    qword_100021428 = (uint64_t)v4;

  }
  v6 = (id)objc_opt_self(NSObject);
  v7 = (id)objc_opt_self(NSString);
  v8 = (id)objc_opt_self(NSNumber);
  v9 = (id)objc_opt_self(NSUUID);
  v10 = (id)objc_opt_self(NSDictionary);
  v11 = (id)objc_opt_self(NSMutableData);
  v12 = (id)objc_opt_self(OSLaunchdJob);
  v13 = (id)objc_opt_self(OSLaunchdDomain);
  v14 = (id)objc_opt_self(OSLaunchdJobInfo);
  v15 = (id)objc_opt_self(OSLaunchdJobExitStatus);
  v16 = (id)objc_opt_self(NSObject);
  v17 = (id)objc_opt_self(NSObject);
  return (id)objc_opt_self(NSObject);
}

uint64_t sub_100007D0C(int a1)
{
  char v1;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD buffer[2];
  __int128 v11;
  __int128 v12;

  v1 = a1;
  v11 = 0u;
  v12 = 0u;
  memset(buffer, 0, sizeof(buffer));
  if (proc_pidinfo(a1, 13, 0, buffer, 64) == 64)
    return (v11 >> 1) & 1;
  v3 = __error();
  strerror(*v3);
  sub_10000558C(2, "failed to get PROC_PIDT_SHORTBSDINFO on pid %d with error: %s", v4, v5, v6, v7, v8, v9, v1);
  return 0;
}

uint64_t sub_100007DB4(uint64_t a1, char **a2)
{
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v43[32];
  _QWORD v44[32];

  v3 = a1;
  v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  if (!v4)
    sub_100005DB4();
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[OSLaunchdDomain currentDomain](OSLaunchdDomain, "currentDomain"));
  v7 = +[OSLaunchdJob copyJobWithLabel:domain:](OSLaunchdJob, "copyJobWithLabel:domain:", v5, v6);

  if (v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getCurrentJobInfo"));
    v21 = v14;
    if (!v14)
    {
      sub_10000558C(2, "failed to get service info for launchd service %s", v15, v16, v17, v18, v19, v20, v3);
      if (a2)
        asprintf(a2, "appears to have been unloaded");
      goto LABEL_33;
    }
    if (!a2)
      goto LABEL_29;
    if (objc_msgSend(v14, "state") != (id)4 && objc_msgSend(v21, "state") != (id)2)
    {
      if (objc_msgSend(v21, "state") == (id)3)
      {
        objc_msgSend(v21, "lastSpawnError");
        strerror((int)objc_msgSend(v21, "lastSpawnError"));
        asprintf(a2, "failed to spawn with error %d (%s)");
      }
      else if (objc_msgSend(v21, "state") == (id)1)
      {
        asprintf(a2, "has not run since boot / load");
      }
      goto LABEL_29;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastExitStatus"));

    if (!v22)
    {
      if (objc_msgSend(v21, "state") != (id)2)
        sub_100005DB4();
      asprintf(a2, "has not exited since first loaded");
      goto LABEL_29;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastExitStatus"));
    v24 = objc_msgSend(v23, "os_reason_namespace");

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastExitStatus"));
    v26 = objc_msgSend(v25, "wait4Status");

    if (!(_DWORD)v24)
    {
      if ((v26 & 0x7F) == 0)
        asprintf(a2, "last exited with exit status : %d");
      goto LABEL_29;
    }
    if ((_DWORD)v24 == 20)
    {
LABEL_29:
      if (objc_msgSend(v21, "state") == (id)2)
      {
        if ((int)objc_msgSend(v21, "pid") <= 0)
          sub_100005DB4();
        v32 = (uint64_t)objc_msgSend(v21, "pid");
        goto LABEL_34;
      }
      objc_msgSend(v21, "state");
      sub_10000558C(2, "failed to get PID for launchd service %s, current OSLaunchdJobState is %d", v36, v37, v38, v39, v40, v41, v3);
LABEL_33:
      v32 = 0xFFFFFFFFLL;
LABEL_34:

      goto LABEL_35;
    }
    v43[0] = &off_100015980;
    v43[1] = &off_100015998;
    v44[0] = CFSTR("JETSAM");
    v44[1] = CFSTR("SIGNAL");
    v43[2] = &off_1000159B0;
    v43[3] = &off_1000159C8;
    v44[2] = CFSTR("CODESIGNING");
    v44[3] = CFSTR("HANGTRACER");
    v43[4] = &off_1000159E0;
    v43[5] = &off_1000159F8;
    v44[4] = CFSTR("TEST");
    v44[5] = CFSTR("DYLD");
    v43[6] = &off_100015A10;
    v43[7] = &off_100015A28;
    v44[6] = CFSTR("LIBXPC");
    v44[7] = CFSTR("OBJC");
    v43[8] = &off_100015A40;
    v43[9] = &off_100015A58;
    v44[8] = CFSTR("EXEC");
    v44[9] = CFSTR("FRONTBOARD");
    v43[10] = &off_100015A70;
    v43[11] = &off_100015A88;
    v44[10] = CFSTR("TCC");
    v44[11] = CFSTR("REPORTCRASH");
    v43[12] = &off_100015AA0;
    v43[13] = &off_100015AB8;
    v44[12] = CFSTR("COREANIMATION");
    v44[13] = CFSTR("AGGREGATED");
    v43[14] = &off_100015AD0;
    v43[15] = &off_100015AE8;
    v44[14] = CFSTR("RUNNINGBOARD");
    v44[15] = CFSTR("SKYWALK");
    v43[16] = &off_100015B00;
    v43[17] = &off_100015B18;
    v44[16] = CFSTR("SETTINGS");
    v44[17] = CFSTR("LIBSYSTEM");
    v43[18] = &off_100015B30;
    v43[19] = &off_100015B48;
    v44[18] = CFSTR("FOUNDATION");
    v44[19] = CFSTR("WATCHDOG");
    v43[20] = &off_100015B60;
    v43[21] = &off_100015B78;
    v44[20] = CFSTR("METAL");
    v44[21] = CFSTR("WATCHKIT");
    v43[22] = &off_100015B90;
    v43[23] = &off_100015BA8;
    v44[22] = CFSTR("GUARD");
    v44[23] = CFSTR("ANALYTICS");
    v43[24] = &off_100015BC0;
    v43[25] = &off_100015BD8;
    v44[24] = CFSTR("SANDBOX");
    v44[25] = CFSTR("SECURITY");
    v43[26] = &off_100015BF0;
    v43[27] = &off_100015C08;
    v44[26] = CFSTR("ENDPOINTSECURITY");
    v44[27] = CFSTR("PAC_EXCEPTION");
    v43[28] = &off_100015C20;
    v43[29] = &off_100015C38;
    v44[28] = CFSTR("BLUETOOTH_CHIP");
    v44[29] = CFSTR("PORT_SPACE");
    v43[30] = &off_100015C50;
    v43[31] = &off_100015C68;
    v44[30] = CFSTR("WEBKIT");
    v44[31] = CFSTR("BACKLIGHTSERVICES");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 32));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v24));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", v28));

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v24));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v30));

      if (v31)
      {
LABEL_28:
        v33 = objc_retainAutorelease(v31);
        v34 = (const char *)objc_msgSend(v33, "UTF8String");
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastExitStatus"));
        asprintf(a2, "last exited with reason namespace: %s, code %llu", v34, objc_msgSend(v35, "os_reason_code"));

        goto LABEL_29;
      }
    }
    else
    {

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v24));
    goto LABEL_28;
  }
  sub_10000558C(2, "did not find a launchd service %s", v8, v9, v10, v11, v12, v13, v3);
  if (a2)
    asprintf(a2, "appears to not exist in launchd");
  v32 = 0xFFFFFFFFLL;
LABEL_35:

  return v32;
}

uint64_t sub_1000083E4()
{
  uint64_t v0;
  char v1;
  char v2;
  unsigned __int8 *v3;
  pid_t v6;

  if (!pthread_getspecific(qword_100021B28))
    sub_100005DB4();
  v0 = 0;
  v1 = 1;
  while (2)
  {
    v2 = v1;
    v3 = (unsigned __int8 *)(qword_100021448 + 16 * v0 + 8);
    while (!__ldaxr(v3))
    {
      if (!__stlxr(1u, v3))
      {
        if ((byte_100021454 & 1) == 0)
        {
          v6 = getpid();
          proc_set_dirty(v6, 1);
          byte_100021454 = 1;
        }
        return qword_100021448 + 16 * v0;
      }
    }
    v1 = 0;
    __clrex();
    v0 = 1;
    if ((v2 & 1) != 0)
      continue;
    break;
  }
  return 0;
}

uint64_t sub_100008490(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char stackshot_size;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;

  if (!a1)
    sub_100005DB4();
  v2 = stackshot_config_create();
  if (!v2)
    sub_100005DB4();
  v3 = v2;
  if (stackshot_config_set_flags(v2, 25894923))
    sub_100005DB4();
  v4 = -6;
  while (1)
  {
    v5 = stackshot_capture_with_config(v3);
    v12 = v5;
    if (v5 != 16 && v5 != 60)
      break;
    if (__CFADD__(v4++, 1))
    {
      strerror(v5);
      sub_10000558C(2, "failed to capture stackshot, syscall returned %d (%s)", v14, v15, v16, v17, v18, v19, v12);
      goto LABEL_13;
    }
  }
  if (!v5)
  {
    stackshot_size = stackshot_config_get_stackshot_size(v3);
    sub_10000558C(0, "watchdog captured stackshot (%u bytes)", v27, v28, v29, v30, v31, v32, stackshot_size);
    *a1 = v3;
    return 1;
  }
  sub_10000558C(2, "failed to capture stackshot, syscall returned %d", v6, v7, v8, v9, v10, v11, v5);
LABEL_13:
  *a1 = 0;
  sub_10000558C(2, "failed to capture stackshot", v20, v21, v22, v23, v24, v25, v34);
  return 0;
}

void sub_100008580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _OWORD *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  dispatch_block_t v20;
  id v21;
  NSObject *v22;
  _QWORD block[6];

  v8 = a3;
  sub_10000558C(0, "writing diagnostics for %d services", a3, a4, a5, a6, a7, a8, a3);
  if (!a1)
    sub_100005DB4();
  if (dword_100021450 < v8)
    sub_100005DB4();
  if (v8 <= 0)
  {
    dword_100021458 = v8;
  }
  else
  {
    v11 = 0;
    v12 = qword_100021440;
    v13 = (_QWORD *)(a2 + 32);
    do
    {
      v14 = (_OWORD *)(v12 + v11);
      v14[26] = 0u;
      v14[27] = 0u;
      v14[24] = 0u;
      v14[25] = 0u;
      v14[22] = 0u;
      v14[23] = 0u;
      v14[20] = 0u;
      v14[21] = 0u;
      v14[18] = 0u;
      v14[19] = 0u;
      v14[16] = 0u;
      v14[17] = 0u;
      v14[14] = 0u;
      v14[15] = 0u;
      v14[12] = 0u;
      v14[13] = 0u;
      v14[10] = 0u;
      v14[11] = 0u;
      v14[8] = 0u;
      v14[9] = 0u;
      v14[6] = 0u;
      v14[7] = 0u;
      v14[4] = 0u;
      v14[5] = 0u;
      v14[2] = 0u;
      v14[3] = 0u;
      *v14 = 0u;
      v14[1] = 0u;
      *v14 = *((_OWORD *)v13 - 2);
      v15 = (_BYTE *)*(v13 - 1);
      *((_QWORD *)v14 + 2) = *(v13 - 2);
      *((_QWORD *)v14 + 54) = *v13;
      if (*v15)
      {
        __strlcpy_chk(v14 + 2, v15, 400, 400);
        v12 = qword_100021440;
      }
      v13 += 6;
      v11 += 448;
    }
    while (448 * v8 != v11);
    v16 = 0;
    v17 = 0;
    dword_100021458 = v8;
    do
    {
      v18 = qword_100021440 + v16;
      v19 = sub_100007DB4(*(_QWORD *)(qword_100021440 + v16), (char **)(qword_100021440 + v16 + 24));
      if (v19 >= 1)
        *(_DWORD *)(v18 + 440) = v19;
      ++v17;
      v16 += 448;
    }
    while (v17 < dword_100021458);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008748;
  block[3] = &unk_100014AD0;
  block[4] = a1;
  block[5] = mach_absolute_time();
  v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  v21 = sub_100007AB0();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  dispatch_async(v22, v20);

}

void sub_100008748(uint64_t a1)
{
  double Current;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void **v11;
  id v12;
  int *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int *v20;
  void *v21;
  uint64_t stackshot_buffer;
  uint64_t stackshot_size;
  void **v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  int v28;
  void *v29;
  void *v30;

  Current = CFAbsoluteTimeGetCurrent();
  if (dword_100021458 >= 1)
  {
    v3 = Current;
    v4 = 0;
    v5 = 440;
    do
    {
      v6 = objc_autoreleasePoolPush();
      v7 = qword_100021440;
      v8 = qword_100021440 + v5;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("(%d monitored services unresponsive): %s"), dword_100021458, qword_100021440 + v5 - 408));
      v10 = v9;
      v11 = (void **)(v8 - 416);
      if (*v11)
      {
        objc_msgSend(v9, "appendFormat:", CFSTR(", %s"), *v11);
        free(*v11);
        *v11 = 0;
      }
      if (*(int *)(v7 + v5) < 1)
      {
        v19 = objc_alloc((Class)OSAStackShotReport);
        v20 = (int *)(v7 + v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(v7 + v5 - 432)));
        v17 = objc_msgSend(v19, "initWithName:reason:exceptionCode:exceptionCodeCount:", v21, v10, v20 - 2, 1);

        if (*v20 < 1)
          v18 = 0;
        else
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
        stackshot_buffer = stackshot_config_get_stackshot_buffer(**(_QWORD **)(a1 + 32));
        stackshot_size = stackshot_config_get_stackshot_size(**(_QWORD **)(a1 + 32));
        if (!v18)
        {
LABEL_17:
          objc_msgSend(v17, "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:", stackshot_buffer, stackshot_size, &__NSArray0__struct, *(_QWORD *)(a1 + 40), 0xFFFFFFFFLL, v3);
          goto LABEL_18;
        }
        v29 = v18;
        v24 = &v29;
      }
      else
      {
        v28 = 0;
        v27 = xmmword_10000F320;
        v12 = objc_alloc((Class)OSACrackShotReport);
        v13 = (int *)(v7 + v5);
        v14 = *(unsigned int *)(v7 + v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *((_QWORD *)v13 - 54)));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *((_QWORD *)v13 - 53)));
        v17 = objc_msgSend(v12, "initWithPid:procName:bundleID:exitSnapshot:reason:", v14, v15, v16, &v27, v10);

        if (*v13 < 1)
          v18 = 0;
        else
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
        stackshot_buffer = stackshot_config_get_stackshot_buffer(**(_QWORD **)(a1 + 32));
        stackshot_size = stackshot_config_get_stackshot_size(**(_QWORD **)(a1 + 32));
        if (!v18)
          goto LABEL_17;
        v30 = v18;
        v24 = &v30;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 1));
      objc_msgSend(v17, "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:", stackshot_buffer, stackshot_size, v25, *(_QWORD *)(a1 + 40), 0xFFFFFFFFLL, v3);

LABEL_18:
      objc_msgSend(v17, "saveWithOptions:", 0);

      objc_autoreleasePoolPop(v6);
      ++v4;
      v5 += 448;
    }
    while (v4 < dword_100021458);
  }
  v26 = *(_QWORD *)(a1 + 32);
  if (v26)
  {
    stackshot_config_dealloc(*(_QWORD *)v26);
    *(_QWORD *)v26 = 0;
    atomic_store(0, (unsigned __int8 *)(v26 + 8));
  }
  sync();
}

uint64_t sub_100008A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  sub_10000558C(0, "crashing service %s with reason context: %s", a3, a4, a5, a6, a7, a8, a1);
  if ((int)sub_100007DB4(a1, 0) <= 0)
  {
    sub_10000558C(2, "failed to discover PID for job %s", v9, v10, v11, v12, v13, v14, a1);
    return 0;
  }
  v15 = 1;
  if (terminate_with_reason())
  {
    v16 = __error();
    strerror(*v16);
    sub_10000558C(2, "failed to terminate service %s, terminate_with_reason() returned %d (%s)", v17, v18, v19, v20, v21, v22, a1);
    return 0;
  }
  return v15;
}

uint64_t sub_100008B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  char v11;

  do
  {
    if (__ldaxr(byte_100021AC0))
    {
      v9 = 0;
      __clrex();
      sub_10000558C(2, "skipping collecting enhanced diagnostics because outstanding diagnostics still in progress", a3, a4, a5, a6, a7, a8, v11);
      return v9;
    }
    v9 = 1;
  }
  while (__stlxr(1u, byte_100021AC0));
  if (!qword_100021428)
    sub_100005DB4();
  gettimeofday((timeval *)qword_100021AC8, 0);
  return v9;
}

void sub_100008BD0()
{
  dispatch_group_notify((dispatch_group_t)qword_100021428, (dispatch_queue_t)qword_100021420, &stru_100014AF0);
}

void sub_100008BEC(id a1)
{
  sync();
  atomic_store(0, byte_100021AC0);
}

void sub_100008C0C(const char *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  const char *v8;

  v3 = a2;
  dispatch_group_enter((dispatch_group_t)qword_100021428);
  snprintf(byte_10002145C, 0x100uLL, "watchdog monitored services appear unhealthy: %s", a1);
  v4 = qword_100021420;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008CC0;
  block[3] = &unk_100014B18;
  v7 = v3;
  v8 = a1;
  v5 = v3;
  dispatch_async(v4, block);

}

void sub_100008CC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char v83;
  char v84;
  char v85;
  char v86;
  id v87;
  id v88;
  id v89;
  _OWORD v90[2];
  __uint64_t v91;
  uint64_t v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[3];
  _QWORD v96[3];
  char __str[1024];
  char v98[128];

  sub_1000091C0(v98);
  snprintf(__str, 0x400uLL, "%s/watchdog-%s.tailspin", "/var/mobile/Library/Logs/CrashReporter", v98);
  if (!&_tailspin_dump_output_with_options_sync)
  {
    v8 = "Tailspin SPI not found";
LABEL_8:
    sub_10000558C(2, v8, v2, v3, v4, v5, v6, v7, (char)v82);
    return;
  }
  v9 = open(__str, 2562, 416);
  if ((v9 & 0x80000000) != 0)
  {
    v40 = __error();
    v82 = __str;
    strerror(*v40);
    v8 = "Could not create file, skip tailspin: %s %s";
    goto LABEL_8;
  }
  v10 = v9;
  v96[0] = &__kCFBooleanTrue;
  v95[0] = UnsafePointer;
  v95[1] = UnsafePointer;
  v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &unk_10002145C));
  v96[1] = v11;
  v95[2] = UnsafePointer;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", &_DRSubmitLog != 0));
  v96[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v96, v95, 3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v13));

  LOBYTE(v11) = tailspin_dump_output_with_options_sync(v10, v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((v11 & 1) != 0)
  {
    close(v10);
    sub_10000558C(0, "%s created successfully", v21, v22, v23, v24, v25, v26, (char)__str);
    v90[0] = xmmword_10000F300;
    v90[1] = xmmword_10000F310;
    v91 = clock_gettime_nsec_np(_CLOCK_REALTIME) + 604800000000000;
    v92 = 0;
    if (fsctl(__str, 0xC0304A6FuLL, v90, 0))
    {
      v33 = __error();
      strerror(*v33);
      sub_10000558C(2, "Failed to mark %s as purgeable due to %s", v34, v35, v36, v37, v38, v39, (char)__str);
    }
    else
    {
      sub_10000558C(0, "Mark %s as purgeable succeeds", v27, v28, v29, v30, v31, v32, (char)__str);
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v93[0] = NSFileOwnerAccountName;
    v93[1] = NSFileGroupOwnerAccountName;
    v94[0] = CFSTR("root");
    v94[1] = CFSTR("_analyticsusers");
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v94, v93, 2));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str));
    v88 = 0;
    objc_msgSend(v52, "setAttributes:ofItemAtPath:error:", v53, v54, &v88);
    v44 = v88;

    if (!v44)
    {
      if (&_DRSubmitLog)
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a1 + 40)));
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &unk_10002145C));
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str));
        v87 = 0;
        DRSubmitLog(CFSTR("com.apple.watchdogd"), v67, v68, 0, CFSTR("Tailspin"), v69, 0, &v87);
        v44 = v87;

        if (v44)
        {
          v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedDescription")));
          v86 = objc_msgSend(v45, "UTF8String");
          sub_10000558C(2, "DRSubmitLog: %s", v76, v77, v78, v79, v80, v81, v86);
          goto LABEL_14;
        }
        sub_10000558C(0, "submitted %s to DiagnosticPipeline", v70, v71, v72, v73, v74, v75, (char)__str);
        if ((sub_10000A440() & 1) == 0)
          sub_100009238();
        dispatch_group_leave((dispatch_group_t)qword_100021428);
      }
      else
      {
        sub_10000558C(0, "DRSubmitLog is not available", v55, v56, v57, v58, v59, v60, v83);
      }
      v44 = 0;
      goto LABEL_15;
    }
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedDescription")));
    v85 = objc_msgSend(v45, "UTF8String");
    sub_10000558C(2, "setAttributes: %s", v61, v62, v63, v64, v65, v66, v85);
LABEL_14:

    goto LABEL_15;
  }
  sub_10000558C(2, "Failed to save tailspin to file: %s", v15, v16, v17, v18, v19, v20, (char)__str);
  close(v10);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str));
  v89 = 0;
  v43 = objc_msgSend(v41, "removeItemAtPath:error:", v42, &v89);
  v44 = v89;

  if ((v43 & 1) == 0)
  {
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedDescription")));
    v84 = objc_msgSend(v45, "UTF8String");
    sub_10000558C(2, "Cannot remove failed tailspin: %s", v46, v47, v48, v49, v50, v51, v84);
    goto LABEL_14;
  }
LABEL_15:

}

uint64_t sub_1000091C0(char *a1)
{
  tm v3;

  memset(&v3, 0, sizeof(v3));
  localtime_r(qword_100021AC8, &v3);
  return snprintf(a1, 0x80uLL, "%d-%02d-%02d.%02d.%02d.%02d", v3.tm_year + 1900, v3.tm_mon + 1, v3.tm_mday, v3.tm_hour, v3.tm_min, v3.tm_sec);
}

void sub_100009238()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char *v21;
  char *v22;
  char *v23;
  unsigned int v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSDateFormatter *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  unsigned __int8 v47;
  id v48;
  id v49;
  char v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  id obj;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _QWORD v68[2];

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "components:fromDate:toDate:options:", 16, qword_100021560, v0, 0));

  if ((uint64_t)objc_msgSend(v2, "day") >= 7)
  {
    v58 = v0;
    sub_10000558C(0, "Prune the old tailspins in %s", v3, v4, v5, v6, v7, v8, (char)"/var/mobile/Library/Logs/CrashReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/mobile/Library/Logs/CrashReporter")));
    v68[0] = NSURLNameKey;
    v68[1] = NSURLIsDirectoryKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, v11, 4, 0));

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v64;
      v59 = *(_QWORD *)v64;
      do
      {
        v16 = 0;
        v60 = v14;
        do
        {
          if (*(_QWORD *)v64 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
          if (objc_msgSend(v18, "containsString:", CFSTR(".tailspin")))
          {
            v19 = v18;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
            if (objc_msgSend(v20, "containsString:", CFSTR(".tailspin")))
            {
              v21 = (char *)objc_msgSend(v19, "rangeOfString:", CFSTR(".tailspin"));
              if (v21 == (char *)0x7FFFFFFFFFFFFFFFLL)
                sub_100005DB4();
            }
            else
            {
              v21 = 0;
            }
            v22 = 0;
            do
            {
              v23 = v22;
              v24 = objc_msgSend(v20, "characterAtIndex:");
              v22 = v23 + 1;
            }
            while (v21 != v23 && v24 != 45);
            if (v21 + 1 == v22)
            {
              v25 = objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
              sub_10000558C(2, "unable to parse date from filename %s, skipping", v26, v27, v28, v29, v30, v31, v25);
              v32 = 0;
            }
            else
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringWithRange:", v22, v21 - v22));
              v34 = objc_opt_new(NSDateFormatter);
              v35 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
              -[NSDateFormatter setLocale:](v34, "setLocale:", v35);
              -[NSDateFormatter setDateFormat:](v34, "setDateFormat:", CFSTR("yyyy-MM-dd.HH.mm.ss"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v34, "dateFromString:", v33));

              v15 = v59;
            }

            if (v32)
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "components:fromDate:toDate:options:", 16, v32, v58, 0));

              if ((uint64_t)objc_msgSend(v37, "day") >= 8)
              {
                v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString")));
                v39 = objc_msgSend(v38, "UTF8String");
                sub_10000558C(0, "Deleting old tailspin %s that was generated %ld days ago", v40, v41, v42, v43, v44, v45, v39);

                v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                v62 = 0;
                v47 = objc_msgSend(v46, "removeItemAtURL:error:", v17, &v62);
                v48 = v62;

                if ((v47 & 1) == 0)
                {
                  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString")));
                  v50 = objc_msgSend(v49, "UTF8String");
                  v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedDescription")));
                  objc_msgSend(v51, "UTF8String");
                  sub_10000558C(2, "Failed to delete old tailspin %s, error:%s", v52, v53, v54, v55, v56, v57, v50);

                }
                v15 = v59;
              }
            }
            else
            {
              v37 = v2;
            }

            v2 = v37;
            v14 = v60;
          }

          v16 = (char *)v16 + 1;
        }
        while (v16 != v14);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      }
      while (v14);
    }

    v0 = v58;
    objc_storeStrong((id *)&qword_100021560, v58);

  }
}

void sub_1000096EC(uint64_t a1)
{
  _QWORD block[5];

  dispatch_group_enter((dispatch_group_t)qword_100021428);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000975C;
  block[3] = &unk_100014B38;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_100021420, block);
}

void sub_10000975C(uint64_t a1)
{
  char *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  pid_t v21;
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
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  int *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  pid_t v50;
  posix_spawn_file_actions_t v51;
  sigset_t v52;
  sigset_t v53;
  posix_spawnattr_t v54;
  char *__argv[7];
  char __str[1024];
  char v57[128];
  char *__envp[2];

  sub_1000091C0(v57);
  snprintf(__str, 0x400uLL, "%s/watchdog-%s-ddt-%s.txt", "/var/mobile/Library/Logs/CrashReporter", *(const char **)(a1 + 32), v57);
  __argv[0] = "ddt";
  __argv[1] = "--no-ports";
  v2 = *(char **)(a1 + 32);
  __argv[2] = "--no-kevents";
  __argv[3] = v2;
  __argv[4] = "-o";
  __argv[5] = __str;
  __argv[6] = 0;
  *(_OWORD *)__envp = off_100014B58;
  v54 = 0;
  v3 = posix_spawnattr_init(&v54);
  if (v3)
    sub_10000DC10(v3);
  v4 = posix_spawnattr_setflags(&v54, 16396);
  if (v4)
    sub_10000DC10(v4);
  v5 = posix_spawnattr_setprocesstype_np(&v54, 1024);
  if (v5)
    sub_10000DC10(v5);
  v53 = 0;
  v6 = posix_spawnattr_setsigmask(&v54, &v53);
  if (v6)
    sub_10000DC10(v6);
  v52 = -1;
  v7 = posix_spawnattr_setsigdefault(&v54, &v52);
  if (v7)
    sub_10000DC10(v7);
  v51 = 0;
  if (posix_spawn_file_actions_init(&v51) == -1)
    sub_10000DBF8();
  if (posix_spawn_file_actions_addopen(&v51, 1, "/dev/console", 131073, 0) == -1)
    sub_10000DBF8();
  if (posix_spawn_file_actions_addopen(&v51, 2, "/dev/console", 131073, 0) == -1)
    sub_10000DBF8();
  if (posix_spawn_file_actions_addopen(&v51, 0, "/dev/null", 0, 0) == -1)
    sub_10000DBF8();
  v50 = 0;
  v8 = posix_spawn(&v50, "/usr/local/bin/ddt", &v51, &v54, __argv, __envp);
  posix_spawn_file_actions_destroy(&v51);
  posix_spawnattr_destroy(&v54);
  if (v8)
  {
    strerror(v8);
    sub_10000558C(2, "failed to spawn %s with error: %s", v15, v16, v17, v18, v19, v20, (char)"/usr/local/bin/ddt");
    goto LABEL_12;
  }
  sub_10000558C(0, "%s spawned as %d", v9, v10, v11, v12, v13, v14, (char)"/usr/local/bin/ddt");
  v49 = 0;
  v21 = waitpid(v50, &v49, 0);
  if (v21 != -1)
  {
LABEL_16:
    if (v21 != v50)
    {
      sub_10000558C(2, "waitpid on %s with PID %d returned %d", v22, v23, v24, v25, v26, v27, (char)"/usr/local/bin/ddt");
      goto LABEL_12;
    }
    if ((v49 & 0x7F) != 0)
    {
      v34 = "%s : did not exit? status : %d";
    }
    else
    {
      if (!BYTE1(v49))
      {
        sub_10000558C(0, "%s: exited with status %d, saved at %s", v22, v23, v24, v25, v26, v27, (char)"/usr/local/bin/ddt");
        goto LABEL_24;
      }
      v34 = "%s: exited with status %d";
    }
    sub_10000558C(2, v34, v22, v23, v24, v25, v26, v27, (char)"/usr/local/bin/ddt");
LABEL_24:
    v42 = v49 & 0x7F;
    if ((v49 & 0x7F) != 0 && v42 != 127)
    {
      strsignal(v42);
      sub_10000558C(2, "%s: exited due to signal %s", v43, v44, v45, v46, v47, v48, (char)"/usr/local/bin/ddt");
    }
    goto LABEL_12;
  }
  while (*__error() == 4)
  {
    sub_10000558C(2, "waitpid on %s with PID %d returned EINTR, retrying", v28, v29, v30, v31, v32, v33, (char)"/usr/local/bin/ddt");
    v21 = waitpid(v50, &v49, 0);
    if (v21 != -1)
      goto LABEL_16;
  }
  v35 = __error();
  strerror(*v35);
  sub_10000558C(2, "waitpid on %s with PID %d failed with error %s", v36, v37, v38, v39, v40, v41, (char)"/usr/local/bin/ddt");
LABEL_12:
  dispatch_group_leave((dispatch_group_t)qword_100021428);
}

uint64_t sub_100009AD4(int a1)
{
  return _os_assert_log(a1);
}

uint64_t sub_100009ADC(int *a1)
{
  return _os_assert_log(*a1);
}

void sub_100009AE4(char a1)
{
  if (byte_100021578 && (a1 & 1) == 0)
  {
    if (qword_100021570 != -1)
      dispatch_once(&qword_100021570, &stru_100014B68);
    if (!qword_100021AE0)
      sub_100005DB4();
    dispatch_async((dispatch_queue_t)qword_100021AE0, &stru_100014B88);
  }
}

void sub_100009B4C(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  dispatch_queue_attr_t v7;
  dispatch_queue_t v8;
  void *v9;
  char v10;
  NSObject *v11;

  sub_10000558C(0, "watchdogd registers iokit monitoring", v1, v2, v3, v4, v5, v6, v10);
  v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v11 = objc_claimAutoreleasedReturnValue(v7);
  v8 = dispatch_queue_create("com.apple.watchdogd.monitoring_iokit", v11);
  v9 = (void *)qword_100021AE0;
  qword_100021AE0 = (uint64_t)v8;

}

void sub_100009BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[8];
  mach_timespec_t waitTime;

  v8 = 60;
  waitTime = (mach_timespec_t)60;
  if (byte_100021580)
  {
    v8 = 120;
    waitTime.tv_sec = 120;
  }
  sub_10000558C(0, "Wait for IOKit to quiesce in %ds", a3, a4, a5, a6, a7, a8, v8);
  v9 = sub_10000D000();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WatchdogdWaitForIOKitQuiese", (const char *)&unk_100013622, buf, 2u);
  }

  if (IOKitWaitQuietWithOptions(kIOMainPortDefault, &waitTime, 1u))
    sub_1000078B4("Timeout waiting for IOKit to quiesce in 60s");
  v11 = sub_10000D000();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WatchdogdWaitForIOKitQuiese", (const char *)&unk_100013622, v13, 2u);
  }

}

void sub_100009CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  char v9;

  v8 = dword_10002157C;
  if (!dword_10002157C)
  {
    sub_100007834(a1, a2, a3, a4, a5, a6, a7, a8, v9);
    sub_10000A4F8();
    v8 = dword_10002157C;
  }
  dword_10002157C = v8 + 1;
}

void sub_100009D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v9 = dword_10002157C;
  if (dword_10002157C <= 0)
    sub_100005DB4();
  --dword_10002157C;
  if (v9 == 1)
  {
    sub_10000A54C(a1);
    sub_100007874(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void sub_100009D4C()
{
  sleep(2u);
  exit(0);
}

void start()
{
  void *v0;
  int v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t has_internal_diagnostics;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  dispatch_queue_attr_t v24;
  NSObject *v25;
  dispatch_queue_attr_t v26;
  NSObject *v27;
  dispatch_queue_t v28;
  void *v29;
  uint64_t v30;
  dispatch_source_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  char v47;
  char v48;

  v0 = objc_autoreleasePoolPush();
  xpc_set_event_stream_handler("com.apple.iokit.matching", 0, &stru_100014BA8);
  v1 = pthread_key_create((pthread_key_t *)&qword_100021B28, 0);
  if (v1)
  {
    v42 = _os_assert_log(v1);
    v30 = _os_crash(v42);
    __break(1u);
LABEL_13:
    v43 = _os_assert_log(v30);
    v33 = _os_crash(v43);
    __break(1u);
    goto LABEL_14;
  }
  sub_10000CE7C();
  sub_10000769C(v2, v3, v4, v5, v6, v7, v8, v9, v45);
  sub_10000CAD8();
  if (!sub_100007784())
  {
    sub_10000CE2C(0, "userspace monitoring disabled", v10, v11, v12, v13, v14, v15, v46);
    sub_100005BAC(v34, v35, v36, v37, v38, v39, v40, v41, v48);
LABEL_11:
    sleep(2u);
    exit(0);
  }
  sub_10000558C(0, "userspace monitoring enabled", v10, v11, v12, v13, v14, v15, v46);
  has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.watchdogd");
  if ((_DWORD)has_internal_diagnostics)
    sub_1000065E8();
  sub_100005D70(has_internal_diagnostics, v17, v18, v19, v20, v21, v22, v23, v47);
  byte_100021578 = sub_100007964(&byte_100021580);
  v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = dispatch_queue_attr_make_with_qos_class(v25, QOS_CLASS_USER_INITIATED, 0);
  v27 = objc_claimAutoreleasedReturnValue(v26);

  v28 = dispatch_queue_create("com.apple.watchdogd.monitoring_transitions", v27);
  v29 = (void *)qword_100021AD8;
  qword_100021AD8 = (uint64_t)v28;

  v30 = qword_100021AD8;
  if (!qword_100021AD8)
    goto LABEL_13;
  dispatch_async((dispatch_queue_t)qword_100021AD8, &stru_100014BC8);
  dispatch_async((dispatch_queue_t)qword_100021AD8, &stru_100014BE8);
  dispatch_async((dispatch_queue_t)qword_100021AD8, &stru_100014C08);
  sub_10000CB74();
  if (!os_variant_is_darwinos("com.apple.watchdogd"))
  {
LABEL_9:

    objc_autoreleasePoolPop(v0);
    CFRunLoopRun();
    goto LABEL_11;
  }
  sub_10000B618();
  v31 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  v32 = (void *)qword_100021568;
  qword_100021568 = (uint64_t)v31;

  v33 = qword_100021568;
  if (qword_100021568)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_100021568, &stru_100014C28);
    signal(15, (void (__cdecl *)(int))1);
    dispatch_resume((dispatch_object_t)qword_100021568);
    goto LABEL_9;
  }
LABEL_14:
  v44 = _os_assert_log(v33);
  _os_crash(v44);
  __break(1u);
}

void sub_100009F40(id a1)
{
  sub_10000A54C((uint64_t)"load");
}

void sub_100009F4C(id a1)
{
  IONotificationPortRef thePortRef;

  thePortRef = 0;
  dword_100021588 = IORegisterForSystemPower(0, &thePortRef, (IOServiceInterestCallback)sub_100009FAC, &dword_100021584);
  if (!dword_100021588)
    sub_100005DB4();
  if (!thePortRef)
    sub_100005DB4();
  IONotificationPortSetDispatchQueue(thePortRef, (dispatch_queue_t)qword_100021AD8);
}

void sub_100009FAC(int a1, int a2, uint64_t a3, intptr_t notificationID, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  switch((_DWORD)a3)
  {
    case 0xE0000300:
      sub_10000558C(0, "received system wake notification", a3, notificationID, a5, a6, a7, a8, v25);
      if (byte_10002158C == 1)
      {
        byte_10002158C = 0;
        if (qword_100021AE0)
          dispatch_async((dispatch_queue_t)qword_100021AE0, &stru_100014C48);
        sub_100009D10((uint64_t)"wake", v10, v11, v12, v13, v14, v15, v16, a9);
      }
      break;
    case 0xE0000280:
      sub_10000558C(0, "received system sleep notification", a3, notificationID, a5, a6, a7, a8, v25);
      byte_10002158C = 1;
      sub_100009CD8(v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_11:
      IOAllowPowerChange(dword_100021588, notificationID);
      return;
    case 0xE0000270:
      goto LABEL_11;
  }
}

void sub_10000A084(id a1)
{
  _BOOL4 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  const char *v9;

  v1 = sub_100006E78();
  v8 = v1;
  v9 = "No";
  if (v1)
    v9 = "Yes";
  sub_10000558C(0, "crypto migration needed: %s", v2, v3, v4, v5, v6, v7, (char)v9);
  sub_100009AE4(v8);
}

void sub_10000A0DC(id a1)
{
  uint64_t v1;
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
  uint64_t v13;
  uint64_t v14;
  char vars0;
  char vars0a;

  sub_10000558C(0, "watchodgd has been SIGTERMed", v1, v2, v3, v4, v5, v6, vars0);
  sub_100005D70(v7, v8, v9, v10, v11, v12, v13, v14, vars0a);
  sub_10000B584();
}

void *sub_10000A104()
{
  if (qword_100021590 != -1)
    dispatch_once(&qword_100021590, &stru_100014C68);
  return &unk_100021598;
}

void sub_10000A144(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v7 = 1024;
  if (sysctlbyname("kern.bootargs", &unk_100021598, &v7, 0, 0))
    sub_10000DC24();
  sub_10000558C(0, "retrieved current device boot-args: %s", v1, v2, v3, v4, v5, v6, (char)&unk_100021598);
}

uint64_t sub_10000A1A8()
{
  if (qword_100021998 != -1)
    dispatch_once(&qword_100021998, &stru_100014C88);
  return byte_1000219A0;
}

void sub_10000A1E8(id a1)
{
  io_registry_entry_t v1;
  CFTypeRef CFProperty;
  char v3;

  v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v1)
  {
    CFProperty = IORegistryEntryCreateCFProperty(v1, CFSTR("stress-rack"), 0, 0);
    if (!CFProperty)
    {
      v3 = 0;
      goto LABEL_6;
    }
    CFRelease(CFProperty);
  }
  v3 = 1;
LABEL_6:
  byte_1000219A0 = v3;
}

uint64_t sub_10000A244()
{
  if (qword_1000219A8 != -1)
    dispatch_once(&qword_1000219A8, &stru_100014CA8);
  return byte_1000219A1;
}

void sub_10000A284(id a1)
{
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0))
    byte_1000219A1 = v2 != 0;
}

uint64_t sub_10000A2DC()
{
  if (qword_1000219B8 != -1)
    dispatch_once(&qword_1000219B8, &stru_100014CC8);
  return byte_1000219B0;
}

void sub_10000A31C(id a1)
{
  io_registry_entry_t v1;
  const __CFData *CFProperty;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFData *v9;
  uint64_t Length;
  size_t v11;
  BOOL v12;
  UInt8 buffer[64];
  char v14;
  CFRange v15;

  v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  if (v1)
  {
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v1, CFSTR("osenvironment"), 0, 0);
    if (CFProperty)
    {
      v9 = CFProperty;
      Length = CFDataGetLength(CFProperty);
      if (Length > 64)
      {
        v12 = 0;
      }
      else
      {
        v11 = Length;
        v15.location = 0;
        v15.length = Length;
        CFDataGetBytes(v9, v15, buffer);
        v12 = strncmp((const char *)buffer, "diagnostics", v11) == 0;
      }
      byte_1000219B0 = v12;
      CFRelease(v9);
    }
    else
    {
      byte_1000219B0 = 0;
      sub_10000558C(2, "Cannot locate osenvironment entry in IORegistry", v3, v4, v5, v6, v7, v8, v14);
    }
  }
  else
  {
    byte_1000219B0 = 0;
  }
}

uint64_t sub_10000A440()
{
  if (qword_1000219C0 != -1)
    dispatch_once(&qword_1000219C0, &stru_100014CE8);
  return byte_1000219C8;
}

void sub_10000A480(id a1)
{
  io_registry_entry_t v1;
  io_object_t v2;
  CFTypeRef CFProperty;

  v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/filesystems");
  if (v1)
  {
    v2 = v1;
    CFProperty = IORegistryEntryCreateCFProperty(v1, CFSTR("e-apfs"), kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      byte_1000219C8 = 1;
    }
    IOObjectRelease(v2);
  }
}

void sub_10000A4F8()
{
  uint64_t v0;
  uint64_t v1;
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
  char vars0;
  char vars0a;

  dispatch_semaphore_signal((dispatch_semaphore_t)qword_100021B10);
  sub_10000558C(0, "signaled service monitoring thread to pause", v0, v1, v2, v3, v4, v5, vars0);
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_100021B18, 0xFFFFFFFFFFFFFFFFLL);
  sub_10000558C(0, "service monitoring thread paused", v6, v7, v8, v9, v10, v11, vars0a);
  qword_1000219D0 = 0;
}

void sub_10000A54C(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (qword_1000219D0)
    sub_100005DB4();
  v1 = a1;
  qword_1000219D0 = a1;
  if (qword_1000219D8 != -1)
    dispatch_once(&qword_1000219D8, &stru_100014D08);
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_100021B20);
  sub_10000558C(0, "signaled service monitoring thread to resume for %s", v2, v3, v4, v5, v6, v7, v1);
}

void sub_10000A5CC(id a1)
{
  char *v1;
  void *v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  int v27;
  uint64_t v28;
  char **v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  char **v38;
  dispatch_semaphore_t v39;
  void *v40;
  dispatch_semaphore_t v41;
  void *v42;
  dispatch_semaphore_t v43;
  void *v44;
  uint64_t v45;
  _QWORD *v46;
  char *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  const char **v52;
  uint64_t v53;
  const char *v54;
  size_t v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  unint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  int v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;

  v1 = (char *)&unk_100019ED0;
  if (os_variant_has_internal_diagnostics("com.apple.watchdogd"))
  {
    v2 = sub_10000A104();
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    if (os_parse_boot_arg_from_buffer_string(v2, "-wdt_panic_immediately", 0, 0))
    {
      dword_100020FD4 = 0;
      sub_10000558C(2, "monitoring for all daemons configured to panic on first timeout (per %s boot-arg)", v3, v4, v5, v6, v7, v8, (char)"-wdt_panic_immediately");
    }
    else if (os_parse_boot_arg_from_buffer_string(v2, "wdt_panic_when_unresponsive", &v64, 128))
    {
      sub_10000558C(2, "detected boot-arg (%s) to panic on first timeout with value: %s", v9, v10, v11, v12, v13, v14, (char)"wdt_panic_when_unresponsive");
      sub_10000AA00((char)"wdt_panic_when_unresponsive", (char *)&v64, &stru_100014D48);
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
    }
    if (os_parse_boot_arg_from_buffer_string(v2, "wdt_capture_ddt_on_timeout", &v64, 128))
    {
      sub_10000558C(2, "detected boot-arg (%s) to capture ddt on timeout with value: %s", v15, v16, v17, v18, v19, v20, (char)"wdt_capture_ddt_on_timeout");
      sub_10000AA00((char)"wdt_capture_ddt_on_timeout", (char *)&v64, &stru_100014D68);
    }
    if (os_parse_boot_arg_from_buffer_string(v2, "-wdt_clear_state_on_resume", 0, 0))
      byte_100021AF0 = 1;
    if (os_parse_boot_arg_from_buffer_string(v2, "-wdt_skip_crash_without_tailspin", 0, 0))
    {
      sub_10000558C(0, "Enable tailspin check before crashing service (per %s boot-arg)", v21, v22, v23, v24, v25, v26, (char)"-wdt_skip_crash_without_tailspin");
      byte_100021AF1 = 1;
    }
    v27 = dword_100020FD0;
    if (dword_100020FD0 >= 1)
    {
      v28 = 0;
      v29 = off_100019EF8;
      do
      {
        if (*((_BYTE *)v29 - 23))
        {
          sub_10000558C(2, "enabled monitoring for internal service : %s", v21, v22, v23, v24, v25, v26, (char)*v29);
          *((_BYTE *)v29 - 24) = 0;
          v27 = dword_100020FD0;
        }
        v29 += 226;
        ++v28;
      }
      while (v28 < v27);
    }
  }
  if (sub_10000A2DC())
  {
    v36 = dword_100020FD0;
    if (dword_100020FD0 >= 1)
    {
      v37 = 0;
      v38 = off_100019EF8;
      do
      {
        if (*((_BYTE *)v38 + 24))
        {
          sub_10000558C(0, "disable monitoring for service : %s at checkerboard mode", v30, v31, v32, v33, v34, v35, (char)*v38);
          *((_BYTE *)v38 - 24) = 1;
          v36 = dword_100020FD0;
        }
        v38 += 226;
        ++v37;
      }
      while (v37 < v36);
    }
  }
  v39 = dispatch_semaphore_create(0);
  v40 = (void *)qword_100021B10;
  qword_100021B10 = (uint64_t)v39;

  v41 = dispatch_semaphore_create(0);
  v42 = (void *)qword_100021B18;
  qword_100021B18 = (uint64_t)v41;

  v43 = dispatch_semaphore_create(0);
  v44 = (void *)qword_100021B20;
  qword_100021B20 = (uint64_t)v43;

  sub_100007B54(dword_100020FD0);
  v63 = dword_100020FD0;
  if (dword_100020FD0 < 1)
  {
    v1 = 0;
  }
  else
  {
    v45 = 0;
    do
    {
      v46 = v1;
      v47 = &v1[1808 * v45];
      if (*((_DWORD *)v47 + 17) == 2)
      {
        v48 = 0;
        v49 = v46;
        v50 = &v46[226 * v45];
        v50[9] = 0;
        v51 = v50 + 9;
        v52 = (const char **)(v51 - 4);
        v53 = v63;
        do
        {
          if (*((_DWORD *)v49 + 17) == 3)
          {
            v54 = (const char *)v49[9];
            if (!v54)
              sub_100005DB4();
            v55 = strlen(*v52);
            if (!strncmp(*v52, v54, v55))
            {
              v49[12] = v48;
              *v51 = v49;
              v48 = v49;
              v49[11] = v47;
            }
          }
          v49 += 226;
          --v53;
        }
        while (v53);
      }
      ++v45;
      v1 = (char *)v46;
    }
    while (v45 != v63);
    v56 = v46 + 11;
    v57 = v63;
    do
    {
      if (*((_DWORD *)v56 - 5) == 3 && !*v56)
        sub_100005DB4();
      v56 += 226;
      --v57;
    }
    while (v57);
    v58 = 0;
    v59 = v63 + 1;
    do
    {
      v60 = (v59 - 2);
      v61 = &v46[226 * v60];
      *v61 = v58;
      v61[1] = v60;
      --v59;
      v58 = v61;
    }
    while (v59 > 1);
  }
  qword_100021AE8 = (uint64_t)v1;
  v62 = pthread_create(&qword_100021AF8, 0, (void *(__cdecl *)(void *))sub_1000045E4, 0);
  if (v62)
    sub_10000DC60(v62);
}

void sub_10000AA00(char a1, char *a2, void *a3)
{
  void (**v4)(id, void *);
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  const char **v14;
  size_t v15;
  char *__stringp;

  __stringp = a2;
  v4 = a3;
  v5 = strsep(&__stringp, ",");
  if (v5)
  {
    v12 = v5;
    while (*v12)
    {
      v13 = dword_100020FD0;
      if (dword_100020FD0 < 1)
      {
LABEL_8:
        sub_10000558C(2, "%s boot-arg specified for daemon %s which cannot be found in services list", v6, v7, v8, v9, v10, v11, a1);
      }
      else
      {
        v14 = (const char **)&unk_100019ED0;
        while (1)
        {
          v15 = strlen(v14[5]);
          if (!strncasecmp(v14[5], v12, v15))
            break;
          v14 += 226;
          if (!--v13)
            goto LABEL_8;
        }
        v4[2](v4, v14);
      }
      v12 = strsep(&__stringp, ",");
      if (!v12)
        goto LABEL_13;
    }
    sub_10000558C(2, "%s boot-arg specified with empty daemon name", v6, v7, v8, v9, v10, v11, a1);
  }
LABEL_13:

}

void sub_10000AB20(id a1, watchdog_service *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a2->var11 = 1;
  sub_10000558C(2, "monitoring for %s configured to panic on first timeout (per %s boot-arg)", v2, v3, v4, v5, v6, v7, (char)a2->var6);
}

void sub_10000AB60(id a1, watchdog_service *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a2->var12 = 1;
  sub_10000558C(2, "monitoring for %s configured to capture ddt on timeout (per %s boot-arg)", v2, v3, v4, v5, v6, v7, (char)a2->var6);
}

void sub_10000ABA0()
{
  unsigned __int8 v0;
  char *v1;
  const char **v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t *v21;
  uint64_t *v22;

  v0 = atomic_load(byte_100021B38);
  if ((v0 & 1) != 0)
  {
    v1 = (char *)qword_100021B30;
    if (!qword_100021B30)
      sub_100005DB4();
    do
    {
      v2 = (const char **)v1;
      v1 = *(char **)v1;
      v3 = &qword_100021AE8;
      while (1)
      {
        v3 = (uint64_t *)*v3;
        if (!v3)
          break;
        if (!strcmp(v2[4], (const char *)v3[4]))
        {
          sub_10000558C(0, "Service %s:%s has already been enrolled, duplicated with %s:%s", v4, v5, v6, v7, v8, v9, (char)v2[3]);
          v10 = (uint64_t *)qword_100021B30;
          if ((const char **)qword_100021B30 == v2)
          {
            v11 = &qword_100021B30;
          }
          else
          {
            do
            {
              v11 = v10;
              v10 = (uint64_t *)*v10;
            }
            while (v10 != (uint64_t *)v2);
          }
          *v11 = (uint64_t)*v2;
          free((void *)v2[3]);
          free((void *)v2[5]);
          free((void *)v2[4]);
          free((void *)v2[6]);
          free(v2);
          break;
        }
      }
    }
    while (v1);
    if (!qword_100021B30)
      goto LABEL_23;
    if (os_unfair_lock_trylock((os_unfair_lock_t)&unk_100021B08))
    {
      v12 = (uint64_t *)qword_100021B30;
      if (qword_100021B30)
      {
        do
        {
          v13 = (uint64_t *)*v12;
          if (sub_10000C8DC((uint64_t)v12, qword_1000219E0))
          {
            v20 = dword_100020FD0;
            v12[1] = dword_100020FD0;
            v21 = (uint64_t *)qword_100021B30;
            if ((uint64_t *)qword_100021B30 == v12)
            {
              v22 = &qword_100021B30;
            }
            else
            {
              do
              {
                v22 = v21;
                v21 = (uint64_t *)*v21;
              }
              while (v21 != v12);
            }
            *v22 = *v12;
            *v12 = qword_100021AE8;
            qword_100021AE8 = (uint64_t)v12;
            dword_100020FD0 = v20 + 1;
            sub_10000558C(0, "service %s enroll succcessful", v14, v15, v16, v17, v18, v19, v12[5]);
          }
          v12 = v13;
        }
        while (v13);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100021B08);
LABEL_23:
      atomic_store(0, byte_100021B38);
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_100021B40);
      return;
    }
    if (byte_100021A00 == 1)
      sub_100005DB4();
    byte_100021A00 = 1;
  }
}

void sub_10000ADB4(uint64_t a1)
{
  uint64_t v1;
  int v3;
  unint64_t v4;
  size_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  size_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  id v45;
  NSObject *v46;
  _QWORD v48[5];
  BOOL v49;
  char *v50;
  char v51[2048];
  char v52[2048];

  v1 = qword_100021AE8;
  if (!qword_100021AE8)
    goto LABEL_72;
  do
  {
    if (sub_1000050B4(v1) && *(_BYTE *)(v1 + 1400) && (*(_BYTE *)(v1 + 62) || *(_DWORD *)(v1 + 176) >= dword_100020FD4))
    {
      bzero(v51, 0x800uLL);
      if (*(_QWORD *)(v1 + 128))
      {
        v3 = snprintf(v51, 0x800uLL, "no successful checkins from %s (%d induced crashes) in %llu seconds\n");
      }
      else if (*(_DWORD *)(v1 + 68) == 3 && *(_QWORD *)(v1 + 120) != *(_QWORD *)(*(_QWORD *)(v1 + 88) + 120))
      {
        v3 = snprintf(v51, 0x800uLL, "no successful checkins from %s (%d induced crashes) since monitoring enabled by %s (%llu seconds ago)\n");
      }
      else
      {
        v3 = snprintf(v51, 0x800uLL, "no successful checkins from %s (%d induced crashes) \n", *(const char **)(v1 + 40), *(_DWORD *)(v1 + 180));
      }
      v4 = v3;
      if ((unint64_t)v3 <= 0x800)
        v5 = 2048 - v3;
      else
        v5 = 0;
      if (*(_BYTE *)(v1 + 194))
      {
        v6 = *(_QWORD *)(v1 + 1224);
        v7 = &v51[v3];
        if (v6)
          v8 = snprintf(v7, v5, "%s returned not alive with context : %s (code: 0x%llx\n", *(const char **)(v1 + 40), (const char *)(v1 + 194), v6);
        else
          v8 = snprintf(v7, v5, "service returned not alive with context : %s\n", (const char *)(v1 + 194));
        v4 += v8;
        if (v4 <= 0x800)
          v5 = 2048 - v4;
        else
          v5 = 0;
      }
      v50 = 0;
      sub_100007DB4(*(_QWORD *)(v1 + 24), &v50);
      if (v50)
        snprintf(&v51[v4], v5, "%s %s\n", *(const char **)(v1 + 40), v50);
      bzero(v52, 0x800uLL);
      v9 = snprintf(v52, 0x800uLL, "%s", v51);
      v10 = qword_100021AE8;
      if (qword_100021AE8)
      {
        v11 = v9;
        if ((unint64_t)v9 <= 0x800)
          v12 = 2048 - v9;
        else
          v12 = 0;
        do
        {
          if (sub_1000050B4(v10))
          {
            v13 = &v52[v11];
            if (*(_DWORD *)(v10 + 180))
              v14 = snprintf(&v52[v11], v12, "service: %s (%d induced crashes), ");
            else
              v14 = snprintf(&v52[v11], v12, "service: %s, ");
            v15 = v14;
            v16 = *(_QWORD *)(v10 + 136);
            v17 = v12 - v14;
            if (v16)
            {
              v18 = snprintf(&v13[v14], v17, "total successful checkins in %llu seconds: %llu, last successful checkin: %llu seconds ago\n", (a1 - *(_QWORD *)(v10 + 112)) / 0x3B9ACA00uLL, *(_QWORD *)(v10 + 128), (a1 - v16) / 0x3B9ACA00uLL);
            }
            else if (*(_DWORD *)(v10 + 68) == 3 && *(_QWORD *)(v10 + 120) != *(_QWORD *)(*(_QWORD *)(v10 + 88) + 120))
            {
              v18 = snprintf(&v13[v14], v17, "no successful checkins since monitoring enabled by %s (%llu seconds ago)\n");
            }
            else
            {
              v18 = snprintf(&v13[v14], v17, "no successful checkins in %llu seconds\n");
            }
            v11 += v15 + v18;
            if (v11 <= 0x800)
              v12 = 2048 - v11;
            else
              v12 = 0;
          }
          v10 = *(_QWORD *)v10;
        }
        while (v10);
      }
      sub_1000078B4(v52);
    }
    v1 = *(_QWORD *)v1;
  }
  while (v1);
  v19 = qword_100021AE8;
  __chkstk_darwin();
  v27 = &v48[-2 * v26 - 1];
  if (!v19)
LABEL_72:
    sub_100005DB4();
  v28 = 0;
  do
  {
    if (!*(_BYTE *)(v19 + 1400))
      goto LABEL_57;
    if (*(_BYTE *)(v19 + 1401))
      sub_100005DB4();
    v29 = &v27[6 * (int)v28];
    *v29 = *(_QWORD *)(v19 + 24);
    *(_OWORD *)(v29 + 1) = *(_OWORD *)(v19 + 40);
    v30 = *(unsigned __int8 *)(v19 + 61);
    *(_BYTE *)(v19 + 1401) = v30;
    if (!byte_100021AF1)
      goto LABEL_53;
    v31 = atomic_load((unsigned int *)(v19 + 168));
    if (v31 != 1)
    {
      v30 = *(unsigned __int8 *)(v19 + 1401);
LABEL_53:
      if (v30)
        v32 = 581827278;
      else
        v32 = 313391822;
      goto LABEL_56;
    }
    sub_10000558C(0, "skip crashing service %s due to pending tailspin", v20, v21, v22, v23, v24, v25, *(_QWORD *)(v19 + 24));
    *(_BYTE *)(v19 + 1401) = 1;
    v32 = 581827278;
LABEL_56:
    v33 = &v27[6 * (int)v28];
    v33[3] = v19 + 1402;
    v33[4] = v32;
    v33[5] = *(_QWORD *)(v19 + 8);
    v28 = (v28 + 1);
LABEL_57:
    v19 = *(_QWORD *)v19;
  }
  while (v19);
  if ((int)v28 <= 0)
    goto LABEL_72;
  v34 = qword_1000219F8;
  if (qword_1000219F8)
  {
    sub_100008580(qword_1000219F8, (uint64_t)v27, v28, v21, v22, v23, v24, v25);
    qword_1000219F8 = 0;
  }
  v35 = v28;
  v36 = v27 + 5;
  do
  {
    v37 = *v36;
    v36 += 6;
    v38 = sub_10000C8B8(v37);
    if (!v38)
      sub_100005DB4();
    v44 = v38;
    if (!*((_BYTE *)v38 + 1401))
    {
      if (sub_100008A98(v38[3], (uint64_t)v38 + 1402, v34 != 0, v39, v40, v41, v42, v43))
      {
        ++*((_DWORD *)v44 + 45);
        v44[19] = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      }
      if (&_AnalyticsSendEventLazy)
      {
        v45 = sub_100007AB0();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10000B44C;
        v48[3] = &unk_100014DC8;
        v48[4] = v44;
        v49 = v34 != 0;
        dispatch_async(v46, v48);

      }
    }
    *((_BYTE *)v44 + 1401) = 0;
    v44[20] = qword_1000219E0;
    ++*((_DWORD *)v44 + 44);
    atomic_store(0, (unsigned int *)v44 + 42);
    --v35;
  }
  while (v35);
}

void sub_10000B394(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unsigned int *v8;
  unsigned int v9;

  if (os_variant_has_internal_diagnostics("com.apple.watchdogd"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100021B08);
    v7 = (_QWORD *)qword_100021AE8;
    if (qword_100021AE8)
    {
      do
      {
        v8 = (unsigned int *)(v7 + 21);
        while (1)
        {
          v9 = __ldaxr(v8);
          if (v9 != 1)
            break;
          if (!__stlxr(2u, v8))
          {
            sub_10000558C(0, "update service %s tailspin status to DONE", v1, v2, v3, v4, v5, v6, v7[5]);
            goto LABEL_8;
          }
        }
        __clrex();
LABEL_8:
        v7 = (_QWORD *)*v7;
      }
      while (v7);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100021B08);
  }
}

uint64_t sub_10000B44C(uint64_t a1)
{
  _QWORD v2[5];
  char v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000B4B0;
  v2[3] = &unk_100014DA8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  return AnalyticsSendEventLazy(CFSTR("com.apple.Watchdog.ProcessCrashed"), v2);
}

id sub_10000B4B0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("crashedProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)));
  v6[1] = CFSTR("diagsCaptured");
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

void sub_10000B584()
{
  id v0;
  NSObject *v1;

  v0 = sub_10000B5B8();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  dispatch_async(v1, &stru_100014DE8);

}

id sub_10000B5B8()
{
  if (qword_100021A18 != -1)
    dispatch_once(&qword_100021A18, &stru_100014E30);
  return (id)qword_100021A10;
}

void sub_10000B5F8(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char vars0;

  sub_10000CE2C(0, "bailing out", v1, v2, v3, v4, v5, v6, vars0);
  sub_100009D4C();
}

void sub_10000B618()
{
  id v0;
  void *v1;
  void *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  dispatch_queue_attr_t v22;
  NSObject *v23;
  dispatch_queue_t v24;
  void *v25;
  int v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  dispatch_semaphore_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  xpc_connection_t mach_service;
  void *v39;
  _xpc_connection_s *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  uint64_t v53;
  char v54;
  char v55;
  _QWORD block[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE value[40];

  v0 = objc_alloc_init((Class)NSMutableArray);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v54 = (char)off_100020FD8;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s")));
  v3 = objc_msgSend(v1, "fileExistsAtPath:", v2);

  if (!v3)
    goto LABEL_8;
  v10 = sub_10000C1B8();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  memset(value, 0, 37);
  if (getxattr(off_100020FD8, "BootSessionUUID", value, 0x25uLL, 0, 0) == -1)
  {
    v26 = *__error();
    v27 = __error();
    strerror(*v27);
    sub_10000558C(2, "Cannot get boot session uuid xattr from file with error %d %s", v28, v29, v30, v31, v32, v33, v26);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", value, 4));
    v13 = objc_msgSend(v12, "isEqualToString:", v11);

    if (v13)
    {
      v20 = sub_10000B9B4();
      v21 = objc_claimAutoreleasedReturnValue(v20);

      v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v24 = dispatch_queue_create("com.apple.watchdogd.service_recovery", v23);
      v25 = (void *)qword_100021A08;
      qword_100021A08 = (uint64_t)v24;

      if (!qword_100021A08)
        sub_100005DB4();

      v0 = (id)v21;
      goto LABEL_8;
    }
  }
  sub_10000558C(0, "Found stashed services info from different boot, try to remove it", v14, v15, v16, v17, v18, v19, v54);
  if (unlink(off_100020FD8))
    sub_10000DC78();
LABEL_8:
  sub_10000558C(0, "watchdogd sets up listener for opt-in service registration", v4, v5, v6, v7, v8, v9, v54);
  qword_100021B30 = 0;
  atomic_store(0, byte_100021B38);
  v34 = dispatch_semaphore_create(0);
  v35 = (void *)qword_100021B40;
  qword_100021B40 = (uint64_t)v34;

  v36 = sub_10000B5B8();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", v37, 1uLL);
  v39 = (void *)qword_100021A30;
  qword_100021A30 = (uint64_t)mach_service;

  v40 = (_xpc_connection_s *)qword_100021A30;
  if (!qword_100021A30)
    sub_100005DB4();
  *(_QWORD *)value = _NSConcreteStackBlock;
  *(_QWORD *)&value[8] = 3221225472;
  *(_QWORD *)&value[16] = sub_10000C2AC;
  *(_QWORD *)&value[24] = &unk_100014E78;
  *(_QWORD *)&value[32] = v37;
  v41 = v37;
  xpc_connection_set_event_handler(v40, value);
  xpc_connection_activate((xpc_connection_t)qword_100021A30);
  sub_10000558C(0, "watchdogd starts listening incoming opt-in service registration message", v42, v43, v44, v45, v46, v47, v55);

  if (objc_msgSend(v0, "count"))
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v48 = v0;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(_QWORD *)v58 != v51)
            objc_enumerationMutation(v48);
          v53 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000BC90;
          block[3] = &unk_100014E10;
          block[4] = v53;
          dispatch_async((dispatch_queue_t)qword_100021A08, block);
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v50);
    }

  }
}

id sub_10000B9B4()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  id v52;
  _BYTE v53[128];

  v0 = objc_alloc_init((Class)NSMutableArray);
  v45 = (char)off_100020FD8;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s")));
  v52 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v1, 0, &v52));
  v3 = v52;

  if (v2)
  {
    v51 = 0;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v2, 0, 0, &v51));
    v5 = v51;

    if (v4)
    {
      v6 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
      {
        if (objc_msgSend(v4, "count"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
          v14 = objc_opt_class(NSDictionary);
          isKindOfClass = objc_opt_isKindOfClass(v13, v14);

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v0, "addObjectsFromArray:", v4);
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v46 = v0;
            v16 = v0;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v48;
              do
              {
                v20 = 0;
                do
                {
                  if (*(_QWORD *)v48 != v19)
                    objc_enumerationMutation(v16);
                  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v20), "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_launchd_job_label"))));
                  v22 = objc_msgSend(v21, "UTF8String");
                  sub_10000558C(0, "Found previously stashed service %s", v23, v24, v25, v26, v27, v28, v22);

                  v20 = (char *)v20 + 1;
                }
                while (v18 != v20);
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
              }
              while (v18);
            }

            v0 = v46;
          }
        }
      }
      else
      {
        sub_10000558C(2, "Stashed data seems not compliant with expectation", v7, v8, v9, v10, v11, v12, v45);
      }
    }
    else
    {
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
      v37 = objc_msgSend(v36, "UTF8String");
      sub_10000558C(2, "Failed to parse plist with error : %s", v38, v39, v40, v41, v42, v43, v37);

    }
  }
  else
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    v29 = objc_msgSend(v4, "UTF8String");
    sub_10000558C(2, "Failed to read stashed service: %s", v30, v31, v32, v33, v34, v35, v29);
    v5 = v3;
  }

  return v0;
}

uint64_t sub_10000BC90(uint64_t a1)
{
  return sub_10000BC98(*(void **)(a1 + 32));
}

uint64_t sub_10000BC98(void *a1)
{
  id v1;
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 v44;
  uint64_t *v45;
  uint64_t *i;
  uint64_t v47;
  char v49;

  v1 = a1;
  if (!v1)
    sub_100005DB4();
  v2 = v1;

  v3 = (uint64_t *)malloc_type_calloc(1uLL, 0x710uLL, 0x10720401A6BF4D0uLL);
  if (v3)
  {
    v10 = v3;
    *((_DWORD *)v3 + 17) = 1;
    *((_DWORD *)v3 + 14) = 6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_launchd_job_label")));
    if (v11 && (v12 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
    {
      v13 = objc_retainAutorelease(v11);
      v10[3] = (uint64_t)strdup((const char *)objc_msgSend(v13, "UTF8String"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_bootstrap_service_name")));

      if (v11 && (v14 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v11, v14) & 1) != 0))
      {
        v15 = objc_retainAutorelease(v11);
        v10[4] = (uint64_t)strdup((const char *)objc_msgSend(v15, "UTF8String"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_process_name")));

        if (v11 && (v16 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v11, v16) & 1) != 0))
        {
          v17 = objc_retainAutorelease(v11);
          v10[5] = (uint64_t)strdup((const char *)objc_msgSend(v17, "UTF8String"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_bundle_id")));

          if (v11 && (v18 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v11, v18) & 1) != 0))
          {
            v19 = objc_retainAutorelease(v11);
            v10[6] = (uint64_t)strdup((const char *)objc_msgSend(v19, "UTF8String"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_skip_crashing")));
            if (v20)
            {
              v21 = objc_opt_class(NSNumber);
              if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
                *((_BYTE *)v10 + 61) = objc_msgSend(v20, "BOOLValue");
            }
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_late_first_checkin")));

            if (v22)
            {
              v23 = objc_opt_class(NSNumber);
              if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
                *((_BYTE *)v10 + 60) = objc_msgSend(v22, "BOOLValue");
            }
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_internal_builds_only")));

            if (v24)
            {
              v25 = objc_opt_class(NSNumber);
              if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
                *((_BYTE *)v10 + 17) = objc_msgSend(v24, "BOOLValue");
            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_num_rounds_to_timeout")));

            if (v26)
            {
              v27 = objc_opt_class(NSNumber);
              if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
                *((_DWORD *)v10 + 14) = objc_msgSend(v26, "unsignedIntValue");
            }
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_panic_on_first_timeout")));

            if (v28)
            {
              v29 = objc_opt_class(NSNumber);
              if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
                *((_BYTE *)v10 + 62) = objc_msgSend(v28, "BOOLValue");
            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchdog_optin_service_capture_ddt_on_timeout")));

            if (v30)
            {
              v37 = objc_opt_class(NSNumber);
              if ((objc_opt_isKindOfClass(v30, v37) & 1) != 0)
                *((_BYTE *)v10 + 63) = objc_msgSend(v30, "BOOLValue");
            }
            *v10 = qword_100021B30;
            qword_100021B30 = (uint64_t)v10;
            atomic_store(1u, byte_100021B38);
            sub_10000558C(0, "wait for service %s to be enrolled", v31, v32, v33, v34, v35, v36, v10[3]);
            dispatch_semaphore_wait((dispatch_semaphore_t)qword_100021B40, 0xFFFFFFFFFFFFFFFFLL);
            v44 = atomic_load(byte_100021B38);
            if ((v44 & 1) != 0)
              sub_100005DB4();
            if (!qword_100021B30)
            {
              v47 = 1;
              v11 = v19;
              goto LABEL_44;
            }
            sub_10000558C(2, "watchdogd refuses to pick up opt-in service %s", v38, v39, v40, v41, v42, v43, v10[3]);
            v45 = &qword_100021B30;
            for (i = (uint64_t *)qword_100021B30; i != v10; i = (uint64_t *)*i)
              v45 = i;
            *v45 = *v10;
            free((void *)v10[6]);
            v10[6] = 0;
            v47 = 6;
          }
          else
          {
            v30 = 0;
            v47 = 5;
          }
          free((void *)v10[5]);
          v10[5] = 0;
        }
        else
        {
          v30 = 0;
          v47 = 5;
        }
        free((void *)v10[4]);
        v10[4] = 0;
      }
      else
      {
        v30 = 0;
        v47 = 5;
      }
      free((void *)v10[3]);
    }
    else
    {
      v30 = 0;
      v47 = 5;
    }
    free(v10);
LABEL_44:

    goto LABEL_45;
  }
  sub_10000558C(2, "Failed to allocate new watchdog service", v4, v5, v6, v7, v8, v9, v49);
  v47 = 4;
LABEL_45:

  return v47;
}

void sub_10000C154(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.watchdogd.optin_listener", v4);
  v3 = (void *)qword_100021A10;
  qword_100021A10 = (uint64_t)v2;

  if (!qword_100021A10)
    sub_100005DB4();

}

id sub_10000C1B8()
{
  if (qword_100021A28 != -1)
    dispatch_once(&qword_100021A28, &stru_100014E50);
  return (id)qword_100021A20;
}

void sub_10000C1F8(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  size_t v10;
  _BYTE v11[37];

  memset(v11, 0, sizeof(v11));
  v10 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v11, &v10, 0, 0))
  {
    sub_10000558C(2, "Failed to get kern.bootsessionuuid", v1, v2, v3, v4, v5, v6, v9);
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4));
    v8 = (void *)qword_100021A20;
    qword_100021A20 = v7;

  }
}

void sub_10000C2AC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char type;
  char string;
  _QWORD handler[4];
  id v29;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    v10 = (void *)xpc_connection_copy_entitlement_value(v3, "com.apple.watchdogd.runtime-opt-in");
    v17 = v10;
    if (v10 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v17))
    {
      sub_10000558C(0, "Client has correct entitlement", v11, v12, v13, v14, v15, v16, v25);
    }
    else
    {
      sub_10000558C(2, "Client doesn't have correct entitlement", v11, v12, v13, v14, v15, v16, v25);
      sub_10000C420(v3, 2u);
    }
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000C498;
    handler[3] = &unk_100014E78;
    v18 = v3;
    v29 = v18;
    xpc_connection_set_event_handler((xpc_connection_t)v18, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v18, *(dispatch_queue_t *)(a1 + 32));
    xpc_connection_activate((xpc_connection_t)v18);

  }
  else if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    sub_10000558C(0, "watchdogd received error message %s", v19, v20, v21, v22, v23, v24, string);
  }
  else
  {
    type = xpc_get_type(v3);
    sub_10000558C(0, "watchdogd received unknown event of type %p", v4, v5, v6, v7, v8, v9, type);
  }

}

void sub_10000C420(void *a1, unsigned int a2)
{
  xpc_object_t reply;
  void *v4;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  xpc_object_t xdict;

  xdict = a1;
  reply = xpc_dictionary_create_reply(xdict);
  if (!reply)
    sub_100005DB4();
  v4 = reply;
  xpc_dictionary_set_int64(reply, "watchdogd_request_result", a2);
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (!v6)
    sub_100005DB4();
  v7 = v6;
  xpc_connection_send_message(v6, v4);

}

void sub_10000C498(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *data;
  void *v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  unsigned int v38;
  id v39;
  uint64_t v40;
  const char *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  char v78;
  size_t v79;
  int *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  char type;
  char string;
  char v90;
  char v91;
  id v92;
  size_t length;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_uint64(v3, "watchdogd_request_command")
      || (length = 0, (data = xpc_dictionary_get_data(v3, "watchdogd_optin_service_identifier", &length)) == 0))
    {
      v10 = 0;
      goto LABEL_6;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, length));
    if (v19)
    {
      v92 = 0;
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v19, 0, 0, &v92));
      if (v10)
        goto LABEL_16;
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "description")));
      v21 = objc_msgSend(v20, "UTF8String");
      sub_10000558C(2, "Failed to get the opt-in service identifier with error %s", v22, v23, v24, v25, v26, v27, v21);

    }
    v10 = 0;
LABEL_16:

    if (v10)
    {
      v28 = sub_10000BC98(v10);
      if (v28 == 1)
      {
        v10 = v10;
        sub_10000558C(0, "Try to stash service info into file", v29, v30, v31, v32, v33, v34, v87);
        v35 = objc_alloc_init((Class)NSMutableArray);
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), off_100020FD8));
        v38 = objc_msgSend(v36, "fileExistsAtPath:", v37);

        if (v38)
        {
          v39 = sub_10000B9B4();
          v40 = objc_claimAutoreleasedReturnValue(v39);

          v35 = (id)v40;
        }
        objc_msgSend(v35, "addObject:", v10);
        v41 = off_100020FD8;
        v42 = v35;
        if (!v41)
          sub_100005DB4();
        v43 = v42;
        v44 = open(v41, 513, 420);
        if ((v44 & 0x80000000) != 0)
        {
          v57 = __error();
          v58 = strerror(*v57);
          sub_10000558C(2, "Failed to safely open file : %s", v59, v60, v61, v62, v63, v64, v58);
        }
        else
        {
          v45 = v44;
          length = 0;
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v43, 200, 0, &length));
          v47 = (id)length;
          if (v47)
          {
            v48 = v47;
            v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "description")));
            v50 = objc_msgSend(v49, "UTF8String");
            sub_10000558C(2, "Error parsing plist: %s", v51, v52, v53, v54, v55, v56, v50);

            close(v45);
          }
          else
          {
            v65 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v45, 0);
            v92 = 0;
            objc_msgSend(v65, "writeData:error:", v46, &v92);
            v66 = v92;
            v67 = v92;
            v68 = v67;
            if (v66)
            {
              v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "description")));
              v90 = objc_msgSend(v69, "UTF8String");
              sub_10000558C(2, "Error persisting submission results: %s", v70, v71, v72, v73, v74, v75, v90);
            }
            else
            {
              v76 = sub_10000C1B8();
              v69 = (id)objc_claimAutoreleasedReturnValue(v76);
              v77 = objc_msgSend(v69, "length");
              if (v69)
                v78 = v38;
              else
                v78 = 1;
              if ((v78 & 1) == 0)
              {
                v79 = (size_t)v77;
                v69 = objc_retainAutorelease(v69);
                if (setxattr(v41, "BootSessionUUID", objc_msgSend(v69, "UTF8String"), v79, 0, 0))
                {
                  v80 = __error();
                  v91 = strerror(*v80);
                  sub_10000558C(2, "setxattr failed with error %s", v81, v82, v83, v84, v85, v86, v91);
                }
              }
            }

            close(v45);
          }
        }

        v11 = 1;
      }
      else
      {
        v11 = v28;
      }
      goto LABEL_7;
    }
LABEL_6:
    v11 = 4;
LABEL_7:
    sub_10000C420(v3, v11);

    goto LABEL_10;
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    sub_10000558C(0, "watchdogd received error message %s", v12, v13, v14, v15, v16, v17, string);
  }
  else
  {
    type = xpc_get_type(v3);
    sub_10000558C(0, "watchdogd received unknown request type %p", v4, v5, v6, v7, v8, v9, type);
  }
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
LABEL_10:

}

uint64_t *sub_10000C8B8(uint64_t a1)
{
  uint64_t *result;

  result = &qword_100021AE8;
  do
    result = (uint64_t *)*result;
  while (result && result[1] != a1);
  return result;
}

uint64_t sub_10000C8DC(uint64_t a1, uint64_t a2)
{
  _BOOL8 v3;
  kern_return_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  mach_port_t sp;

  if (!a1)
    sub_100005DB4();
  if (*(_BYTE *)(a1 + 16))
    sub_100005DB4();
  if (*(_BYTE *)(a1 + 60))
    return 1;
  sp = 0;
  v5 = bootstrap_look_up(bootstrap_port, *(const char **)(a1 + 32), &sp);
  v3 = v5 == 0;
  v12 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    bootstrap_strerror(v5);
    sub_10000558C(2, "bootstrap_look_up service: %s failed with error: %s", v13, v14, v15, v16, v17, v18, v12);
  }
  else
  {
    sub_10000558C(0, "discovered port for service: %s", v6, v7, v8, v9, v10, v11, *(_QWORD *)(a1 + 32));
    *(_DWORD *)(a1 + 104) = sp;
    *(_QWORD *)(a1 + 120) = a2;
    *(_QWORD *)(a1 + 112) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  }
  return v3;
}

void sub_10000C9A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char v9;
  const char *v10;
  kern_return_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  mach_port_t sp;

  v8 = qword_100021AE8;
  if (qword_100021AE8)
  {
    v9 = 0;
    do
    {
      sp = 0;
      if (!*(_BYTE *)(v8 + 16))
      {
        if (!*(_DWORD *)(v8 + 68))
          sub_100005DB4();
        if (!*(_DWORD *)(v8 + 56))
          sub_100005DB4();
        v10 = *(const char **)(v8 + 32);
        if (!*v10)
          sub_100005DB4();
        if (!**(_BYTE **)(v8 + 24))
          sub_100005DB4();
        if (!**(_BYTE **)(v8 + 40))
          sub_100005DB4();
        if (!**(_BYTE **)(v8 + 48))
          sub_100005DB4();
        if (*(_DWORD *)(v8 + 104))
          sub_100005DB4();
        v11 = bootstrap_look_up(bootstrap_port, v10, &sp);
        v18 = *(_QWORD *)(v8 + 32);
        if (v11)
        {
          bootstrap_strerror(v11);
          sub_10000558C(2, "bootstrap_look_up service: %s failed with error: %s", v19, v20, v21, v22, v23, v24, v18);
        }
        else
        {
          sub_10000558C(0, "discovered port for service: %s", v12, v13, v14, v15, v16, v17, *(_QWORD *)(v8 + 32));
          *(_DWORD *)(v8 + 104) = sp;
          ++v9;
        }
      }
      v8 = *(_QWORD *)v8;
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  sub_10000558C(0, "found %d services to monitor", a3, a4, a5, a6, a7, a8, v9);
}

void sub_10000CAD8()
{
  __CFDictionary *v0;
  const __CFDictionary *v1;

  if (qword_100021A48 != -1)
    dispatch_once(&qword_100021A48, &stru_100014F20);
  if ((byte_100021A50 & 1) == 0)
  {
    v0 = IOServiceMatching("IOService");
    if (!v0)
      sub_100005DB4();
    v1 = v0;
    CFDictionarySetValue(v0, CFSTR("IOPropertyMatch"), &off_100015CA8);
    dword_100021A38 = IOServiceGetMatchingService(kIOMainPortDefault, v1);
    if (!dword_100021A38)
      sub_100005DB4();
  }
}

void sub_10000CB74()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (qword_100021A48 != -1)
    dispatch_once(&qword_100021A48, &stru_100014F20);
  if ((byte_100021A50 & 1) == 0)
  {
    if (!dword_100021A38)
      sub_100005DB4();
    if (!qword_100021A40)
    {
      if (objc_opt_class(RBSProcessMonitor))
      {
        v0 = objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", &stru_100014EC0));
        v1 = (void *)qword_100021A40;
        qword_100021A40 = v0;

      }
      v2 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("com.apple.frontboard.visibility")));
      sub_100005C84(0, 4, v2, CFSTR("com.apple.SpringBoard"));

    }
  }
}

void sub_10000CC5C(id a1, RBSProcessMonitorConfiguring *a2)
{
  RBSProcessMonitorConfiguring *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
  objc_msgSend(v3, "setValues:", 1);
  v8 = CFSTR("com.apple.frontboard.visibility");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v3, "setEndowmentNamespaces:", v4);

  -[RBSProcessMonitorConfiguring setStateDescriptor:](v2, "setStateDescriptor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingProcessTypeApplication](RBSProcessPredicate, "predicateMatchingProcessTypeApplication"));
  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  -[RBSProcessMonitorConfiguring setPredicates:](v2, "setPredicates:", v6);

  -[RBSProcessMonitorConfiguring setUpdateHandler:](v2, "setUpdateHandler:", &stru_100014F00);
}

void sub_10000CD78(id a1)
{
  const char *v1;
  io_registry_entry_t v2;
  io_object_t v3;
  CFTypeRef v4;

  if (os_variant_has_internal_diagnostics("com.apple.watchdogd"))
  {
    v1 = (const char *)sub_10000A104();
    if (strnstr(v1, "-wdt_no_pmu", 0x400uLL))
    {
      byte_100021A50 = 1;
    }
    else
    {
      v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/arm-io/wdt");
      if (v2)
      {
        v3 = v2;
        v4 = IORegistryEntrySearchCFProperty(v2, "IODeviceTree", CFSTR("no-pmu"), kCFAllocatorDefault, 3u);
        if (v4)
        {
          byte_100021A50 = 1;
          CFRelease(v4);
        }
        IOObjectRelease(v3);
      }
    }
  }
}

void sub_10000CE2C(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __uint64_t v11;

  v11 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  sub_1000056B0(1, a1, v11, a2, &a9);
}

void sub_10000CE7C()
{
  _DWORD *v0;
  _DWORD *v1;
  mach_port_name_t NotificationPort;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_source_t v5;
  void *v6;
  const char *v7;
  size_t v8;
  char *v9;
  char *v10;
  NSObject *v11;

  v0 = malloc_type_malloc(0x8000uLL, 0xD9491EB6uLL);
  qword_100021A60 = (uint64_t)v0;
  if (!v0)
    sub_100005DB4();
  v1 = v0;
  bzero(v0 + 1, 0x7FFCuLL);
  *v1 = 32728;
  NotificationPort = IODataQueueAllocateNotificationPort();
  dword_100021A68 = NotificationPort;
  if (!NotificationPort)
    sub_100005DB4();
  mach_port_insert_right(mach_task_self_, NotificationPort, NotificationPort, 0x14u);
  if (IODataQueueSetNotificationPort((IODataQueueMemory *)qword_100021A60, dword_100021A68))
    sub_100005DB4();
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue(v3);
  v4 = dispatch_queue_create("com.apple.watchdogd.rt_log", v11);
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, dword_100021A68, 0, v4);
  v6 = (void *)qword_100021A70;
  qword_100021A70 = (uint64_t)v5;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100021A70, &stru_100014F40);
  dispatch_activate((dispatch_object_t)qword_100021A70);
  v7 = (const char *)sub_10000A104();
  if (sub_10000A1A8())
    dword_100021AB0 = 1;
  if (v7)
  {
    v8 = strlen(v7);
    v9 = strnstr(v7, "wdt_logging=", v8);
    if (v9)
    {
      v10 = v9;
      if (strlen(v9) >= 0xD)
        dword_100021AB0 = atoi(v10 + 12);
    }
  }
  +[OSLaunchdJob setDisableLogging_4watchdogd:](OSLaunchdJob, "setDisableLogging_4watchdogd:", 1);

}

id sub_10000D000()
{
  if (qword_100021A80 != -1)
    dispatch_once(&qword_100021A80, &stru_100014F60);
  return (id)qword_100021A78;
}

void sub_10000D040(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.watchdogd", "signpost");
  v2 = (void *)qword_100021A78;
  qword_100021A78 = (uint64_t)v1;

}

void sub_10000D070(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  NSObject *v6;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.watchdogd.log", v6);
  v3 = (void *)qword_100021A88;
  qword_100021A88 = (uint64_t)v2;

  v4 = os_log_create("com.apple.watchdogd", "service-monitoring-thread");
  v5 = (void *)qword_100021A98;
  qword_100021A98 = (uint64_t)v4;

}

void sub_10000D0E4(id a1)
{
  dispatch_queue_attr_t v1;
  NSObject *v2;
  int *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  Block_layout *v7;
  int v8;
  _QWORD block[4];
  int v10;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  qword_100021AA0 = (uint64_t)fopen("/dev/console", "w+");
  v3 = __error();
  if (qword_100021AA0)
  {
    v4 = dispatch_queue_create("com.apple.watchdogd.serial_log", v2);
    v5 = (void *)qword_100021A90;
    qword_100021A90 = (uint64_t)v4;

    v6 = qword_100021A88;
    v7 = &stru_100014FE0;
  }
  else
  {
    v8 = *v3;
    v6 = qword_100021A88;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D1BC;
    block[3] = &unk_100014FC0;
    v10 = v8;
    v7 = (Block_layout *)block;
  }
  dispatch_async(v6, v7);

}

void sub_10000D1BC(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10000DCB8(a1);
}

void sub_10000D1F8(id a1)
{
  uint8_t v1[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "watchdogd logging to serial enabled", v1, 2u);
  }
}

void sub_10000D250(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  v2 = *(NSObject **)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 76);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134218242;
    v10 = v4;
    v11 = 2080;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%llu: %s", buf, 0x16u);
  }
  if (qword_100021A90)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sub_1000043D4(*(const char **)(a1 + 64), *(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 77), (char **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24));
    v6 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(*(_QWORD *)(v6 + 8) + 24))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000D390;
      v8[3] = &unk_100015008;
      v7 = *(_QWORD *)(a1 + 40);
      v8[4] = v6;
      v8[5] = v7;
      dispatch_sync((dispatch_queue_t)qword_100021A90, v8);
    }
  }
  free(*(void **)(a1 + 64));
}

uint64_t sub_10000D390(uint64_t a1)
{
  fwrite(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 1uLL, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (FILE *)qword_100021AA0);
  free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return fflush((FILE *)qword_100021AA0);
}

void sub_10000D3E4(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  v2 = *(NSObject **)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 76);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134218242;
    v10 = v4;
    v11 = 2080;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%llu: %s", buf, 0x16u);
  }
  if (qword_100021A90)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sub_1000043D4(*(const char **)(a1 + 64), *(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 77), (char **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24));
    v6 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(*(_QWORD *)(v6 + 8) + 24))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000D524;
      v8[3] = &unk_100015008;
      v7 = *(_QWORD *)(a1 + 40);
      v8[4] = v6;
      v8[5] = v7;
      dispatch_async((dispatch_queue_t)qword_100021A90, v8);
    }
  }
  free(*(void **)(a1 + 64));
}

uint64_t sub_10000D524(uint64_t a1)
{
  fwrite(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 1uLL, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (FILE *)qword_100021AA0);
  free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return fflush((FILE *)qword_100021AA0);
}

_DWORD *(*sub_10000D578(uint64_t a1))(_DWORD *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 6009000)
    return sub_10000D594;
  else
    return 0;
}

_DWORD *sub_10000D594(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  char *v8;
  uint64_t v9;
  int v10;

  if ((*result & 0x80000000) != 0)
    goto LABEL_15;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x48)
    goto LABEL_15;
  if (v4 > 0x4E8)
    goto LABEL_15;
  v5 = result[14];
  if (v5 > 0x400)
    goto LABEL_15;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 72 < v5 || v4 < v6 + 72)
    goto LABEL_15;
  v8 = (char *)result + v6;
  v9 = *((unsigned int *)v8 + 17);
  if (v9 > 5)
    goto LABEL_15;
  v10 = v4 - v6;
  if (v9 > (v10 - 72) >> 5 || v10 != 32 * (_DWORD)v9 + 72)
    goto LABEL_15;
  if (result[1] >= 0x43CuLL)
    v4 = 1084;
  result = memchr(result + 15, 0, v4 - 60);
  if (result)
  {
    result = (_DWORD *)sub_10000541C(v3[3], *((_QWORD *)v3 + 4), *((_QWORD *)v3 + 5), v3[12], (_BYTE *)v3 + 60, *(_QWORD *)(v8 + 60), v8 + 72, v9);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  else
  {
LABEL_15:
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  return result;
}

void sub_10000D6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000065B8((void *)&_mh_execute_header, &_os_log_default, a3, "watchdog user space monitoring is disabled", a5, a6, a7, a8, 0);
  sub_1000065D8();
}

void sub_10000D6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000065B8((void *)&_mh_execute_header, &_os_log_default, a3, "watchdog opt-in service registration is not supported on VM", a5, a6, a7, a8, 0);
  sub_1000065D8();
}

void sub_10000D708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000065B8((void *)&_mh_execute_header, &_os_log_default, a3, "watchdog opt-in service registration is only supported on darwinOS variant", a5, a6, a7, a8, 0);
  sub_1000065D8();
}

void sub_10000D73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000065B8((void *)&_mh_execute_header, &_os_log_default, a3, "Received unexpected xpc message from WatchdogClient channel", a5, a6, a7, a8, 0);
  sub_1000065D8();
}

void sub_10000D770(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description")));
  objc_msgSend(v1, "UTF8String");
  sub_1000065C8((void *)&_mh_execute_header, &_os_log_default, v2, "Unable to create plist out of services - %s", v3, v4, v5, v6, 2u);

}

void sub_10000D800(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  sub_1000065C8((void *)&_mh_execute_header, &_os_log_default, v1, "Failed to communicate with watchdogd: %s", v2, v3, v4, v5, 2u);
}

void sub_10000D880(int a1)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "optin registration failed due to %d", (uint8_t *)v1, 8u);
  sub_1000065D8();
}

void sub_10000D8F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000065B8((void *)&_mh_execute_header, &_os_log_default, a3, "result doesn't have a valid return", a5, a6, a7, a8, 0);
  sub_1000065D8();
}

void sub_10000D92C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = __error();
  strerror(*v0);
  sub_1000065C8((void *)&_mh_execute_header, &_os_log_default, v1, "could not retrieve device boot-args, failed with error: %s", v2, v3, v4, v5, 2u);
}

void sub_10000D9A8()
{
  uint64_t v0;

  v0 = _os_assert_log(0);
  _os_crash(v0);
  __break(1u);
}

void sub_10000D9C0(char a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = __error();
  strerror(*v2);
  sub_10000558C(2, "failed to submit launchd job for %s with error %s", v3, v4, v5, v6, v7, v8, a1);
  _os_crash("failed to submit launchd job for test service");
  __break(1u);
}

void sub_10000DA04()
{
  _os_crash("connect_to_kext() unexpectedly failed - unable to lookup watchdog KEXT service");
  __break(1u);
}

void sub_10000DA1C(char **a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = 0;
  v3 = asprintf(a1, "IOServiceOpen failed with error : 0x%x", a2);
  sub_100007AA8(v3, "%s", v4, v5, v6, v7, v8, v9, (char)*a1);
  _os_crash(*a1);
  __break(1u);
}

void sub_10000DA64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007AA8(a1, "Failed to call kIOWatchdogDaemonCheckEnabled method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonCheckEnabled, ...) failed");
  __break(1u);
}

void sub_10000DA90(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000558C(2, "Failed to call kIOWatchdogDaemonCheckUserspaceDefanged method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonCheckUserspaceDefanged, ...) failed");
  __break(1u);
}

void sub_10000DAC0(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000558C(2, "Failed to call kIOWatchdogDaemonCheckin method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonCheckin, ...) failed");
  __break(1u);
}

void sub_10000DAF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007AA8(a1, "Failed to call kIOWatchdogDaemonDisableUserspaceMonitoring method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonDisableUserspaceMonitoring, ...) failed");
  __break(1u);
}

void sub_10000DB1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007AA8(a1, "Failed to call kIOWatchdogDaemonReenableUserspaceMonitoring method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonReenableUserspaceMonitoring, ...) failed");
  __break(1u);
}

void sub_10000DB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007AA8(a1, "Failed to call kIOWatchdogDaemonCheckIOKitMonitoringEnabled method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallStructMethod(watchdog_kext_connection, kIOWatchdogDaemonCheckIOKitMonitoringEnabled, ...) failed");
  __break(1u);
}

void sub_10000DB74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007AA8(a1, "Failed to call kIOWatchdogDaemonTestSocWatchdog method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonTestSocWatchdog, ...) failed");
  __break(1u);
}

void sub_10000DBA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007AA8(a1, "Failed to call kIOWatchdogDaemonTestSocWatchdog method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonTestSocWatchdog (panic), ...) failed");
  __break(1u);
}

void sub_10000DBCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007AA8(a1, "Failed to call kIOWatchdogDaemonTestIOKitBusy method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash("IOConnectCallScalarMethod(watchdog_kext_connection, kIOWatchdogDaemonTestIOKitBusy, ...) failed");
  __break(1u);
}

void sub_10000DBF8()
{
  int *v0;
  uint64_t v1;

  v0 = __error();
  v1 = sub_100009ADC(v0);
  _os_crash(v1);
  __break(1u);
}

void sub_10000DC10(int a1)
{
  uint64_t v1;

  v1 = sub_100009AD4(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_10000DC24()
{
  int *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = __error();
  v1 = strerror(*v0);
  sub_10000CE2C(2, "could not retrieve device boot-args, failed with error: %s", v2, v3, v4, v5, v6, v7, v1);
  _os_crash("could not retrieve device boot-args");
  __break(1u);
}

void sub_10000DC60(int a1)
{
  uint64_t v1;

  v1 = _os_assert_log(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_10000DC78()
{
  int *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = __error();
  v1 = strerror(*v0);
  sub_10000558C(0, "Failed to unlink prior stashed services info with error %s", v2, v3, v4, v5, v6, v7, v1);
  _os_crash("unlink services stash file failed");
  __break(1u);
}

void sub_10000DCB8(uint64_t a1)
{
  char *v1;
  int v2;
  char *v3;

  v1 = strerror(*(_DWORD *)(a1 + 32));
  v2 = 136315138;
  v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to open /dev/console with error : %s", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundle");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copyJobWithLabel_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyJobWithLabel:domain:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDomain");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptor");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endowmentNamespaces");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getCurrentJobInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentJobInfo");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithFileDescriptor_closeOnDealloc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:closeOnDealloc:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithName_reason_exceptionCode_exceptionCodeCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:reason:exceptionCode:exceptionCodeCount:");
}

id objc_msgSend_initWithPid_procName_bundleID_exitSnapshot_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPid:procName:bundleID:exitSnapshot:reason:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lastExitStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastExitStatus");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastSpawnError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSpawnError");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_os_reason_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "os_reason_code");
}

id objc_msgSend_os_reason_namespace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "os_reason_namespace");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_predicateMatchingProcessTypeApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateMatchingProcessTypeApplication");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_saveWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveWithOptions:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDisableLogging_4watchdogd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableLogging_4watchdogd:");
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndowmentNamespaces:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskState");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_useStackshotBuffer_size_frontmostPids_atTime_machTime_sequence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:");
}

id objc_msgSend_wait4Status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wait4Status");
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}
