@implementation TelephonyBasebandWatchdogStartWithStackshot

void __TelephonyBasebandWatchdogStartWithStackshot_block_invoke(uint64_t a1)
{
  __int128 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  char *v9;
  char __str[16];
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
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24 = v1;
  v25 = v1;
  v22 = v1;
  v23 = v1;
  v20 = v1;
  v21 = v1;
  v18 = v1;
  v19 = v1;
  v16 = v1;
  v17 = v1;
  v14 = v1;
  v15 = v1;
  v12 = v1;
  v13 = v1;
  *(_OWORD *)__str = v1;
  v11 = v1;
  snprintf(__str, 0x100uLL, "Telephony operation timeout at '%s', timeout %u\n", *(const char **)(a1 + 32), *(_DWORD *)(a1 + 40));
  _TelephonyUtilDebugPrint((uint64_t)"TelephonyBasebandWatchdogStartWithStackshot_block_invoke", (uint64_t)"Telephony watchdog fired: %s\n", v2, v3, v4, v5, v6, v7, (uint64_t)__str);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v9 = __str;
    _os_log_error_impl(&dword_190D2F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Telephony watchdog fired: %s\n", buf, 0xCu);
  }
}

@end
