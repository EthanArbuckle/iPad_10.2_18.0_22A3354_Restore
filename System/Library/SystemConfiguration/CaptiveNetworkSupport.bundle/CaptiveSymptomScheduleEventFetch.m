@implementation CaptiveSymptomScheduleEventFetch

void __CaptiveSymptomScheduleEventFetch_block_invoke(uint64_t a1, int a2, _QWORD *a3)
{
  NSObject *logger;
  os_log_type_t v6;
  const void *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      v18 = 67109120;
      LODWORD(v19) = a2;
      _os_log_impl(&dword_219EF1000, logger, v6, "managed_event_fetch failed %d", (uint8_t *)&v18, 8u);
    }
  }
  else if (a3)
  {
    v8 = (const void *)a3[6];
    v9 = a3[4];
    v10 = mysyslog_get_logger();
    v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = a3[1];
      v13 = a3[2];
      v14 = a3[3];
      v15 = a3[5];
      v18 = 134219266;
      v19 = v12;
      v20 = 2080;
      v21 = v13;
      v22 = 2048;
      v23 = v14;
      v24 = 2080;
      v25 = v15;
      v26 = 2048;
      v27 = v9;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_219EF1000, v10, v11, "managed_event_fetch:\nid = %lld\nclass = %s\ntime = %f\ncause = %s\ncode = %lld\nadditional info = %@", (uint8_t *)&v18, 0x3Eu);
    }
    CFDictionaryGetTypeID();
    if (v8)
      CFGetTypeID(v8);
  }
  else
  {
    v16 = mysyslog_get_logger();
    v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_219EF1000, v16, v17, "managed_event_fetch returned NULL event", (uint8_t *)&v18, 2u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

@end
