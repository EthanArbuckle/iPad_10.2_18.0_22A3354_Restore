@implementation IOReportUpdateSamplesRaw

uint64_t __IOReportUpdateSamplesRaw_block_invoke(_QWORD *a1, const __CFDictionary *a2)
{
  unint64_t DriverID;
  unint64_t ChannelID;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v11;
  CFIndex v12;
  const char *v13;
  CFTypeID v14;
  CFIndex Length;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  void *value;
  CFRange v21;

  value = 0;
  DriverID = IOReportChannelGetDriverID(a2);
  ChannelID = IOReportChannelGetChannelID(a2);
  v7 = a1[5];
  v6 = a1[6];
  while (1)
  {
    if (v7 >= v6)
      goto LABEL_22;
    v8 = *(unsigned __int16 *)(v7 + 20);
    if (!*(_WORD *)(v7 + 20))
      break;
    if (*(_QWORD *)v7 == DriverID && *(_QWORD *)(v7 + 8) == ChannelID)
    {
      if (v7 + (v8 << 6) > v6)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          _visitSample_cold_1(a2);
        v11 = (_QWORD *)a1[7];
        if (v11 && !*v11)
        {
          v12 = *(int *)(*(_QWORD *)(a1[4] + 8) + 24);
          v13 = "absurd element count from provider";
          goto LABEL_46;
        }
        return 1;
      }
      if (CFDictionaryGetValueIfPresent(a2, CFSTR("RawElements"), (const void **)&value))
      {
        if (value && (v14 = CFGetTypeID(value), v14 == CFDataGetTypeID()))
        {
          Length = CFDataGetLength((CFDataRef)value);
          if (Length == v8 << 6)
          {
            v21.length = Length;
            v21.location = 0;
            CFDataReplaceBytes((CFMutableDataRef)value, v21, (const UInt8 *)v7, v21.length);
            v6 = a1[6];
LABEL_22:
            if (v7 != v6)
              return 0;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              __IOReportUpdateSamplesRaw_block_invoke_cold_4(a2);
            v16 = (_QWORD *)a1[7];
            if (v16 && !*v16)
              *(_QWORD *)a1[7] = createCFErr(*(int *)(*(_QWORD *)(a1[4] + 8) + 24), "Didn't find provider_id channel_id match for samplesDict channel");
            *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -536870160;
            return 1;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            __IOReportUpdateSamplesRaw_block_invoke_cold_5(a2);
          v19 = (_QWORD *)a1[7];
          if (!v19 || *v19)
            return 1;
          v12 = *(int *)(*(_QWORD *)(a1[4] + 8) + 24);
          v13 = "Stale samplesDict, IOReporter elements count changed";
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            __IOReportUpdateSamplesRaw_block_invoke_cold_3(a2);
          v17 = (_QWORD *)a1[7];
          if (!v17 || *v17)
            return 1;
          v12 = *(int *)(*(_QWORD *)(a1[4] + 8) + 24);
          v13 = "samplesDict has bad elemsData error";
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          __IOReportUpdateSamplesRaw_block_invoke_cold_2(a2);
        v18 = (_QWORD *)a1[7];
        if (!v18 || *v18)
          return 1;
        v12 = *(int *)(*(_QWORD *)(a1[4] + 8) + 24);
        v13 = "Couldn't find kIOReportRawElementsKey in samplesDict";
      }
LABEL_46:
      *(_QWORD *)a1[7] = createCFErr(v12, v13);
      return 1;
    }
    v7 += v8 << 6;
  }
  v9 = (_QWORD *)a1[7];
  if (v9 && !*v9)
    *(_QWORD *)a1[7] = createCFErr(*(int *)(*(_QWORD *)(a1[4] + 8) + 24), "bad raw data from provider");
  return 16;
}

void __IOReportUpdateSamplesRaw_block_invoke_cold_2(const __CFDictionary *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8(&dword_206347000, MEMORY[0x24BDACB70], v1, "Couldn't find kIOReportRawElementsKey, %@ -- %@ -- %@ -- %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOReportUpdateSamplesRaw_block_invoke_cold_3(const __CFDictionary *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8(&dword_206347000, MEMORY[0x24BDACB70], v1, "samplesDict has bad elemsData error, %@ -- %@ -- %@ -- %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOReportUpdateSamplesRaw_block_invoke_cold_4(const __CFDictionary *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_206347000, MEMORY[0x24BDACB70], v1, "Didn't find provider_id channel_id match for samplesDict channel %@ -- %@ -- %@ -- %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOReportUpdateSamplesRaw_block_invoke_cold_5(const __CFDictionary *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_206347000, MEMORY[0x24BDACB70], v1, "Stale samplesDict, IOReporter elements count changed %@ -- %@ -- %@ -- %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
