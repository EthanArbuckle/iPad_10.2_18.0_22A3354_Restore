@implementation TelephonyBasebandWatchdogStartWithStackshot

void __TelephonyBasebandWatchdogStartWithStackshot_block_invoke(uint64_t a1)
{
  __int128 v1;
  uint8_t buf[4];
  char *v3;
  char __str[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
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
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18 = v1;
  v19 = v1;
  v16 = v1;
  v17 = v1;
  v14 = v1;
  v15 = v1;
  v12 = v1;
  v13 = v1;
  v10 = v1;
  v11 = v1;
  v8 = v1;
  v9 = v1;
  v6 = v1;
  v7 = v1;
  *(_OWORD *)__str = v1;
  v5 = v1;
  snprintf(__str, 0x100uLL, "Telephony operation timeout at '%s', timeout %u\n", *(const char **)(a1 + 32), *(_DWORD *)(a1 + 40));
  _TelephonyUtilDebugPrint();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v3 = __str;
    _os_log_error_impl(&dword_22D8C6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Telephony watchdog fired: %s\n", buf, 0xCu);
  }
}

@end
