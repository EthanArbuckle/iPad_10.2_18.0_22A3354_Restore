@implementation BBMonitorScheduleStateFetch

void __BBMonitorScheduleStateFetch_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  const void *v4;
  __CFRunLoop *v5;
  uint64_t v6;
  _QWORD block[6];
  int v8;

  v4 = (const void *)*MEMORY[0x24BDBD5A0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __BBMonitorScheduleStateFetch_block_invoke_2;
  block[3] = &__block_descriptor_tmp_15;
  v5 = *(__CFRunLoop **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = a2;
  block[4] = v6;
  block[5] = a3;
  CFRunLoopPerformBlock(v5, v4, block);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 32));
}

void __BBMonitorScheduleStateFetch_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  const char *v4;
  int v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  NSObject *logger;
  os_log_type_t v13;
  unsigned int v14;
  NSObject *v15;
  os_log_type_t v16;
  unsigned int v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  unsigned int v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  unsigned __int8 *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  char v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 56))
    goto LABEL_9;
  v3 = *(_DWORD *)(a1 + 48);
  v4 = *(const char **)(a1 + 40);
  v5 = *(_DWORD *)(v2 + 4);
  if ((v5 & 0x10) != 0)
    *(_DWORD *)(v2 + 4) = v5 & 0xFFFFFFEF;
  if (!v3)
  {
    if (v4)
    {
      if (v4 != (const char *)1)
      {
        if (v4 == (const char *)2)
        {
          logger = mysyslog_get_logger();
          v13 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v13))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219EF1000, logger, v13, "BBMonitor: confirmed broken", buf, 2u);
          }
          v14 = *(_DWORD *)(v2 + 28);
          if (v14 >= 2)
          {
            if (v14 != 4)
            {
              v35 = mysyslog_get_logger();
              v36 = _SC_syslog_os_log_mapping();
              if (!os_log_type_enabled(v35, v36))
                goto LABEL_9;
              v37 = *(unsigned int *)(v2 + 28);
              if (v37 > 6)
                v38 = "<unknown>";
              else
                v38 = off_24DC16B50[v37];
              *(_DWORD *)buf = 136315394;
              v43 = v38;
              v44 = 1024;
              v45 = v37;
              v8 = "BBMonitor state is %s (%d), ignoring";
              v9 = v35;
              v10 = v36;
              v11 = 18;
              goto LABEL_8;
            }
            v6 = mysyslog_get_logger();
            v7 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v6, v7))
              goto LABEL_9;
            *(_WORD *)buf = 0;
            v8 = "BBMonitor: in broken state";
            goto LABEL_7;
          }
          *(_DWORD *)(v2 + 4) &= ~2u;
LABEL_29:
          BBMonitor_Probing(v2, 0, 0);
          goto LABEL_9;
        }
        v18 = mysyslog_get_logger();
        v19 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v18, v19))
        {
LABEL_53:
          if ((v5 & 0x10) != 0)
            BBMonitor_Detecting(v2, 0);
          goto LABEL_9;
        }
        *(_DWORD *)buf = 134217984;
        v43 = v4;
        v26 = "BBMonitor: unrecognized state %qu";
LABEL_52:
        _os_log_impl(&dword_219EF1000, v18, v19, v26, buf, 0xCu);
        goto LABEL_53;
      }
      v22 = mysyslog_get_logger();
      v23 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v22, v23))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219EF1000, v22, v23, "BBMonitor: detected broken", buf, 2u);
      }
      v24 = *(_DWORD *)(v2 + 4);
      *(_DWORD *)(v2 + 4) = v24 & 0xFFFFFFFD;
      v25 = *(_DWORD *)(v2 + 28);
      if (v25 > 6)
        goto LABEL_47;
      if (((1 << v25) & 0x63) != 0)
      {
        if ((v24 & 0x20) == 0)
          goto LABEL_29;
        v41 = 1;
        v27 = mysyslog_get_logger();
        v28 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v27, v28))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219EF1000, v27, v28, "BBMonitor: skipping probing whitelisted network", buf, 2u);
        }
        v29 = (unsigned __int8 *)&v41;
        v30 = v2;
        goto LABEL_39;
      }
      if (v25 == 4)
      {
        v31 = mysyslog_get_logger();
        v32 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v31, v32))
          goto LABEL_9;
        v33 = *(unsigned int *)(v2 + 28);
        if (v33 > 6)
          v34 = "<unknown>";
        else
          v34 = off_24DC16B50[v33];
        *(_DWORD *)buf = 136315138;
        v43 = v34;
        v8 = "BBMonitor(%s): waiting until next probe interval";
      }
      else
      {
LABEL_47:
        v31 = mysyslog_get_logger();
        v32 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v31, v32))
          goto LABEL_9;
        v39 = *(unsigned int *)(v2 + 28);
        if (v39 > 6)
          v40 = "<unknown>";
        else
          v40 = off_24DC16B50[v39];
        *(_DWORD *)buf = 136315138;
        v43 = v40;
        v8 = "BBMonitor(%s): ignoring";
      }
      v9 = v31;
      v10 = v32;
      v11 = 12;
      goto LABEL_8;
    }
    v15 = mysyslog_get_logger();
    v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v15, v16, "BBMonitor: not broken", buf, 2u);
    }
    v17 = *(_DWORD *)(v2 + 28);
    if (v17 < 2)
      goto LABEL_53;
    if (v17 == 6)
    {
      v18 = mysyslog_get_logger();
      v19 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v18, v19))
        goto LABEL_53;
      v20 = *(unsigned int *)(v2 + 28);
      if (v20 > 6)
        v21 = "<unknown>";
      else
        v21 = off_24DC16B50[v20];
      *(_DWORD *)buf = 136315138;
      v43 = v21;
      v26 = "BBMonitor(%s): ignoring";
      goto LABEL_52;
    }
    v30 = v2;
    v29 = 0;
LABEL_39:
    BBMonitor_Idle(v30, 0, v29);
    goto LABEL_9;
  }
  v6 = mysyslog_get_logger();
  v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v6, v7))
  {
    *(_WORD *)buf = 0;
    v8 = "BBMonitor: symptom error encountered";
LABEL_7:
    v9 = v6;
    v10 = v7;
    v11 = 2;
LABEL_8:
    _os_log_impl(&dword_219EF1000, v9, v10, v8, buf, v11);
  }
LABEL_9:
  BBMonitorRelease(*(_QWORD **)(a1 + 32));
}

@end
