void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

_BYTE *OUTLINED_FUNCTION_8(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

uint64_t ggctl_connect(io_object_t *a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  NSObject *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  io_connect_t connect;

  connect = 0;
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceMatching("AppleHDQGasGaugeControl");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        ggctl_connect_cold_2();
      connect = 0;
    }
    if (a1)
      *a1 = v5;
    else
      IOObjectRelease(v5);
    return connect;
  }
  else
  {
    v6 = logger;
    result = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      ggctl_connect_cold_1(v6, v8, v9);
      return 0;
    }
  }
  return result;
}

uint64_t ggctl_disconnect(uint64_t connect)
{
  if ((_DWORD)connect)
    return IOServiceClose(connect);
  return connect;
}

void ggctl_reset(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  NSObject *v3;
  uint8_t buf[8];
  uint64_t input;

  input = a2;
  v2 = IOConnectCallMethod(a1, 0, &input, 1u, 0, 0, 0, 0, 0, 0);
  v3 = logger;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      ggctl_reset_cold_1();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219944000, v3, OS_LOG_TYPE_DEFAULT, "gas gauge: reset", buf, 2u);
    }
    ++gauge_reset_count;
  }
}

uint64_t ggctl_get_hdq_state(mach_port_t a1)
{
  kern_return_t v1;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v1 = IOConnectCallMethod(a1, 1u, 0, 0, 0, 0, &output, &outputCnt, 0, 0);
  if (v1 == -536870183)
    return 4294967294;
  if (v1)
    return 0xFFFFFFFFLL;
  return output != 0;
}

uint64_t ggctl_get_device_configuration(mach_port_t a1, void *outputStruct)
{
  size_t outputStructCnt;

  outputStructCnt = 352;
  return IOConnectCallStructMethod(a1, 2u, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t ggctl_enable_currentlog(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 3u, &input, 1u, 0, 0);
}

uint64_t ggctl_map_currentlog(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = MEMORY[0x219A345E8](a1, 0, *MEMORY[0x24BDAEC58], &v6, &v5, 1);
  v4 = v6;
  if ((_DWORD)result)
    v4 = 0;
  *a2 = v4;
  return result;
}

uint64_t ggctl_open_device(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int hdq_state;
  NSObject *v5;

  v3 = a1;
  if (!a3)
    return v3;
  hdq_state = ggctl_get_hdq_state(a1);
  if (hdq_state < 0)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      ggctl_open_device_cold_2();
  }
  else
  {
    if (hdq_state)
    {
      if (IOConnectCallScalarMethod(v3, 6u, 0, 0, 0, 0)
        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      {
        ggctl_open_device_cold_4();
      }
      return v3;
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      ggctl_open_device_cold_3();
    ggctl_reset(v3, 1u);
  }
  v5 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    ggctl_open_device_cold_1(v5);
  return 0xFFFFFFFFLL;
}

uint64_t hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t ggctl_hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t ggctl_hdqRead8(mach_port_t a1, int a2)
{
  uint32_t outputCnt;
  uint64_t input;
  int64x2_t v5;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  input = a2;
  v5 = vdupq_n_s64(8uLL);
  outputCnt = 1;
  if (IOConnectCallScalarMethod(a1, 7u, &input, 3u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t ggctl_hdqRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t ggctl_hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  v5 = xmmword_21994F190;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_controlRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t ggctl_controlWrite16(mach_port_t a1, int a2, int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_readBlock(mach_port_t a1, int a2, int a3, void *outputStruct, _BYTE *a5)
{
  uint64_t result;
  size_t v7;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  output = 0;
  outputCnt = 1;
  v7 = 32;
  if (IOConnectCallMethod(a1, 9u, input, 2u, 0, 0, &output, &outputCnt, outputStruct, &v7))
    return 0xFFFFFFFFLL;
  result = 0;
  if (a5)
    *a5 = output;
  return result;
}

uint64_t ggctl_writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_gaugeInterrupts(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  unsigned int v3;
  uint64_t input;

  input = a2;
  v2 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v2 == -536870183)
    v3 = -2;
  else
    v3 = -1;
  if (v2)
    return v3;
  else
    return 0;
}

CFDictionaryRef pmps_service()
{
  CFDictionaryRef result;
  CFDictionaryRef v1;
  __CFDictionary *v2;
  void *keys;

  keys = CFSTR("built-in");
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, MEMORY[0x24BDBD270], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (result)
  {
    v1 = result;
    v2 = IOServiceMatching("IOPMPowerSource");
    CFDictionarySetValue(v2, CFSTR("IOPropertyMatch"), v1);
    CFRelease(v1);
    return (CFDictionaryRef)IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v2);
  }
  return result;
}

uint64_t uart_open_device(uint64_t a1, uint64_t a2, int a3)
{
  return ggctl_open_device(a1, 0, a3);
}

uint64_t hdqRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  v5 = xmmword_21994F190;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t controlOp16(mach_port_t a1, int a2)
{
  uint64_t input;

  input = a2;
  if (IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t controlRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t controlWrite16(mach_port_t a1, int a2, int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t gaugeEnableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  input = 1;
  v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t gaugeDisableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  input = 0;
  v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t gaugeDisconnect(mach_port_t connection)
{
  int v2;
  int v3;
  NSObject *v4;
  unsigned int v6;
  __int16 v7;
  uint64_t input;
  uint32_t outputCnt;
  uint64_t output;
  __int16 v11;
  int v12;
  uint64_t v13;

  v2 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  do
  {
    output = 0;
    outputCnt = 1;
    input = 23;
    if (IOConnectCallScalarMethod(connection, 0xBu, &input, 1u, &output, &outputCnt))
      v3 = -1;
    else
      v3 = output;
    if (!v3)
      break;
    v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      LODWORD(output) = 67109376;
      HIDWORD(output) = v2;
      v11 = 1024;
      v12 = v3;
      _os_log_error_impl(&dword_219944000, v4, OS_LOG_TYPE_ERROR, "%d: retry OpenProtector (%d)", (uint8_t *)&output, 0xEu);
    }
    usleep(0xF4240u);
    ++v2;
  }
  while (v2 != 3);
  v7 = 0;
  output = 0;
  outputCnt = 1;
  input = 32;
  IOConnectCallScalarMethod(connection, 0xBu, &input, 1u, &output, &outputCnt);
  if (controlReadU16(connection, 0, &v7))
    return 4294967291;
  if (v3)
    v6 = -36;
  else
    v6 = 0;
  if ((v7 & 0x2000) != 0)
    return v6;
  else
    return 0xFFFFFFFFLL;
}

uint64_t controlReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadS8(mach_port_t a1, int a2, _BYTE *a3)
{
  uint64_t result;

  result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadU8(mach_port_t a1, int a2, _BYTE *a3)
{
  uint64_t result;

  result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t controlReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t dumpBuffer(unsigned __int8 *a1, int a2)
{
  uint64_t v3;
  int v4;

  if (a2 >= 1)
  {
    v3 = a2;
    do
    {
      v4 = *a1++;
      printf(" %02x", v4);
      --v3;
    }
    while (v3);
  }
  return putchar(10);
}

uint64_t registerName(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0x600)
  {
    if (a2 - 1281 > 1 || (*(_DWORD *)a1 | 4) != 0x1E)
      goto LABEL_8;
    return 0;
  }
  if ((*(_DWORD *)a1 | 2) == 0xE)
    return 0;
LABEL_8:
  v2 = *(_QWORD *)(a1 + 72);
  if (!v2
    && (a2 < 0x600 || (v2 = *(_QWORD *)(a1 + 48)) == 0)
    && (a2 < 0x501 || (v2 = *(_QWORD *)(a1 + 40)) == 0)
    && (a2 < 0x313 || (v2 = *(_QWORD *)(a1 + 32)) == 0)
    && (a2 < 0x132 || (v2 = *(_QWORD *)(a1 + 24)) == 0))
  {
    if (a2 < 0x119)
      return *(_QWORD *)(a1 + 8);
    v2 = *(_QWORD *)(a1 + 16);
    if (!v2)
      return *(_QWORD *)(a1 + 8);
  }
  return v2;
}

uint64_t readRegister(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  int v4;
  uint64_t result;
  uint64_t (*v6)(_WORD *);

  v4 = *(_DWORD *)(a2 + 4);
  result = 0xFFFFFFFFLL;
  if (v4 <= 1)
  {
    if (v4)
    {
      if (v4 == 1)
        return hdqReadU16(a3, *(_DWORD *)a2, a1);
    }
    else
    {
      return hdqReadS16(a3, *(_DWORD *)a2, a1);
    }
  }
  else
  {
    switch(v4)
    {
      case 100:
        v6 = *(uint64_t (**)(_WORD *))(a2 + 64);
        if (v6)
          return v6(a1);
        break;
      case 10:
        return controlReadU16(a3, *(_DWORD *)a2, a1);
      case 2:
        result = ggctl_hdqRead8(a3, *(_DWORD *)a2);
        if ((result & 0x80000000) == 0)
        {
          if (a1)
            *(_BYTE *)a1 = result;
          return 0;
        }
        break;
    }
  }
  return result;
}

uint64_t getFWVersion(mach_port_t a1, __int16 *a2)
{
  __int16 v3;
  uint64_t result;

  v3 = getFWVersion_gFWVersion[0];
  if (getFWVersion_gFWVersion[0])
    goto LABEL_2;
  if (!controlReadU16(a1, 2, getFWVersion_gFWVersion))
  {
    v3 = getFWVersion_gFWVersion[0];
    if (getFWVersion_gFWVersion[0] == 256)
    {
      v3 = 1536;
      getFWVersion_gFWVersion[0] = 1536;
    }
LABEL_2:
    result = 0;
    *a2 = v3;
    return result;
  }
  return 0xFFFFFFFFLL;
}

double readLifetimeData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  double result;
  __int128 v6;
  __int128 v7;
  unsigned __int16 v8;
  __int128 outputStruct;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) == 0
    && v8 >= 0x313u
    && !ggctl_readBlock(a3, -1, 4, &outputStruct, 0))
  {
    v6 = v10;
    *a1 = outputStruct;
    a1[1] = v6;
    if (!ggctl_readBlock(a3, -1, 6, &outputStruct, 0))
    {
      result = *(double *)&outputStruct;
      v7 = v10;
      a1[2] = outputStruct;
      a1[3] = v7;
    }
  }
  return result;
}

double readRaTableData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  double result;
  __int128 v6;
  unsigned __int16 v7;
  _OWORD outputStruct[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 7, outputStruct, 0))
  {
    result = *(double *)outputStruct;
    v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

double readIMAXAndSOCSmoothData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  double result;
  __int128 v6;
  unsigned __int16 v7;
  _OWORD outputStruct[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 8, outputStruct, 0))
  {
    result = *(double *)outputStruct;
    v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

uint64_t findRaWeightMulitplier(int a1)
{
  uint64_t v1;

  v1 = 0;
  while ((unsigned __int16)battery_health_metric_config[v1] != a1)
  {
    v1 += 4;
    if (v1 == 68)
      return 0;
  }
  return *(unsigned int *)&battery_health_metric_config[v1 + 2];
}

float calculateWra(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned __int16 a9)
{
  return (double)a2 * 0.137995
       + (double)a1 * 0.0693069
       + (double)a3 * 0.137376
       + (double)a4 * 0.137376
       + (double)a5 * 0.137376
       + (double)a6 * 0.137376
       + (double)a7 * 0.137376
       + (double)a8 * 0.0872525
       + (double)a9 * 0.0185644;
}

float calculateChemicalWeightedRa(unsigned int a1, float a2)
{
  return (float)((float)a1 * a2) / 1000.0;
}

CFDictionaryRef readShutdownReasonData(mach_port_t a1)
{
  NSObject *v2;
  const char *v3;
  _OWORD v5[2];
  __int128 v6;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  _OWORD v12[3];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v6 = 0u;
  memset(v5, 0, sizeof(v5));
  memset(v12, 0, sizeof(v12));
  if (ggctl_logShutdownReason(a1, (uint64_t)v5, 1u))
  {
    v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315394;
    v9 = "readShutdownReasonData";
    v10 = 1024;
    v11 = 2502;
    v3 = "%s:%d cannot read data";
LABEL_4:
    _os_log_impl(&dword_219944000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 0x12u);
    return 0;
  }
  if (!*((_QWORD *)&v6 + 1))
  {
    v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315394;
    v9 = "readShutdownReasonData";
    v10 = 1024;
    v11 = 2506;
    v3 = "%s:%d invalid timestamp";
    goto LABEL_4;
  }
  return parseShutdownReason((__int16 *)v5, (const UInt8 *)v12, a1);
}

uint64_t ggctl_logShutdownReason(mach_port_t a1, uint64_t a2, unsigned int a3)
{
  kern_return_t v4;
  __int128 v5;
  __int128 v7;
  uint64_t input;
  uint64_t v9;
  size_t v10;
  __int128 outputStruct;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD inputStruct[3];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = 64;
  if (!a2)
    return 0xFFFFFFFFLL;
  if ((a3 & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    outputStruct = 0u;
    v12 = 0u;
    input = a3;
    v4 = IOConnectCallMethod(a1, 0x11u, &input, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
    if (!v4)
    {
      v5 = v12;
      *(_OWORD *)a2 = outputStruct;
      *(_OWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 32) = v13;
      *(_DWORD *)(a2 + 48) = v14;
    }
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 16);
    inputStruct[0] = *(_OWORD *)a2;
    inputStruct[1] = v7;
    inputStruct[2] = *(_OWORD *)(a2 + 32);
    v16 = *(_DWORD *)(a2 + 48);
    v9 = a3;
    v4 = IOConnectCallMethod(a1, 0x11u, &v9, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
  }
  if (v4)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

CFDictionaryRef parseShutdownReason(__int16 *a1, const UInt8 *a2, mach_port_t a3)
{
  const __CFAllocator *v6;
  CFDictionaryRef v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t valuePtr;
  void *keys[23];
  __int128 v37;
  __int128 v38;
  const __CFString *v39;
  void *values[22];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  UInt8 bytes[16];
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0;
  keys[0] = CFSTR("ShutDownTimestamp");
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  valuePtr = *((_QWORD *)a1 + 5);
  values[0] = CFNumberCreate(v6, kCFNumberLongType, &valuePtr);
  keys[1] = CFSTR("ShutDownUISoc");
  v34 = *((_DWORD *)a1 + 12);
  values[1] = CFNumberCreate(v6, kCFNumberFloatType, &v34);
  keys[2] = CFSTR("ShutDownTemperature");
  v33 = *a1;
  values[2] = CFNumberCreate(v6, kCFNumberIntType, &v33);
  keys[3] = CFSTR("ShutDownPresentDOD");
  v32 = a1[1];
  values[3] = CFNumberCreate(v6, kCFNumberIntType, &v32);
  keys[4] = CFSTR("ShutDownMaxRa08");
  v31 = a1[2];
  values[4] = CFNumberCreate(v6, kCFNumberIntType, &v31);
  keys[5] = CFSTR("ShutDownNominalChargeCapacity");
  v30 = (unsigned __int16)a1[3];
  values[5] = CFNumberCreate(v6, kCFNumberIntType, &v30);
  keys[6] = CFSTR("ShutDownPrevNominalChargeCapacity");
  v29 = (unsigned __int16)a1[4];
  values[6] = CFNumberCreate(v6, kCFNumberIntType, &v29);
  keys[7] = CFSTR("ShutDownFullChargeCapacity");
  v28 = a1[5];
  values[7] = CFNumberCreate(v6, kCFNumberIntType, &v28);
  keys[8] = CFSTR("ShutDownPrevFullChargeCapacity");
  v27 = a1[6];
  values[8] = CFNumberCreate(v6, kCFNumberIntType, &v27);
  keys[9] = CFSTR("ShutDownRemainingCapacity");
  v26 = a1[7];
  values[9] = CFNumberCreate(v6, kCFNumberIntType, &v26);
  keys[10] = CFSTR("ShutDownPrevRemainingCapacity");
  v25 = a1[8];
  values[10] = CFNumberCreate(v6, kCFNumberIntType, &v25);
  keys[11] = CFSTR("ShutDownCycleCount");
  v24 = (unsigned __int16)a1[9];
  values[11] = CFNumberCreate(v6, kCFNumberIntType, &v24);
  keys[12] = CFSTR("ShutDownMaxDischargeCurrent");
  v23 = a1[10];
  values[12] = CFNumberCreate(v6, kCFNumberIntType, &v23);
  keys[13] = CFSTR("ShutDownTimeAbove95");
  v22 = *((unsigned __int8 *)a1 + 22);
  values[13] = CFNumberCreate(v6, kCFNumberIntType, &v22);
  keys[14] = CFSTR("ShutDownVoltage");
  v21 = *(__int16 *)((char *)a1 + 23);
  values[14] = CFNumberCreate(v6, kCFNumberIntType, &v21);
  keys[15] = CFSTR("ShutDownPrevVoltage");
  v20 = *(__int16 *)((char *)a1 + 25);
  values[15] = CFNumberCreate(v6, kCFNumberIntType, &v20);
  keys[16] = CFSTR("ShutDownAverageCurrent");
  v19 = *(__int16 *)((char *)a1 + 27);
  values[16] = CFNumberCreate(v6, kCFNumberIntType, &v19);
  keys[17] = CFSTR("ShutDownPrevAverageCurrent");
  v18 = *(__int16 *)((char *)a1 + 29);
  values[17] = CFNumberCreate(v6, kCFNumberIntType, &v18);
  keys[18] = CFSTR("ShutDownCycleCountLastQmax");
  v17 = *((unsigned __int8 *)a1 + 31);
  values[18] = CFNumberCreate(v6, kCFNumberIntType, &v17);
  keys[19] = CFSTR("ShutDownResScale");
  v16 = (unsigned __int16)a1[16];
  values[19] = CFNumberCreate(v6, kCFNumberIntType, &v16);
  keys[20] = CFSTR("ShutDownQstart");
  v15 = a1[17];
  values[20] = CFNumberCreate(v6, kCFNumberIntType, &v15);
  keys[21] = CFSTR("ShutDownPassedCharge");
  v14 = a1[18];
  values[21] = CFNumberCreate(v6, kCFNumberIntType, &v14);
  keys[22] = CFSTR("ShutDownDOD0");
  v13 = (unsigned __int16)a1[19];
  *(_QWORD *)&v41 = CFNumberCreate(v6, kCFNumberIntType, &v13);
  *(_QWORD *)&v37 = CFSTR("Raw");
  *((_QWORD *)&v41 + 1) = CFDataCreate(v6, (const UInt8 *)a1, 52);
  v46 = 0;
  *(_OWORD *)bytes = 0u;
  v45 = 0u;
  ggctl_logShutdownDLog(a3, (uint64_t)bytes, 1u);
  *((_QWORD *)&v37 + 1) = CFSTR("ShutDownDLog");
  *(_QWORD *)&v42 = CFDataCreate(v6, bytes, 40);
  *(_QWORD *)&v38 = CFSTR("timeSinceAwake");
  v12 = *(_QWORD *)a2;
  *((_QWORD *)&v42 + 1) = CFNumberCreate(v6, kCFNumberLongType, &v12);
  *((_QWORD *)&v38 + 1) = CFSTR("ShutDownRaTableRaw");
  *(_QWORD *)&v43 = CFDataCreate(v6, a2 + 8, 32);
  v39 = CFSTR("ShutDownRSS");
  v11 = *((unsigned __int16 *)a2 + 20);
  *((_QWORD *)&v43 + 1) = CFNumberCreate(v6, kCFNumberIntType, &v11);
  v7 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, 28, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = 27;
  do
  {
    CFRelease(values[v8]);
    v9 = v8-- + 1;
  }
  while (v9 > 1);
  return v7;
}

void writeBatteryDiagnosticData(uint64_t a1, int a2)
{
  size_t outputStructCnt;
  _BYTE v5[48];
  __int16 v6;
  _QWORD v7[45];

  v7[44] = *MEMORY[0x24BDAC8D0];
  bzero(v5, 0x258uLL);
  outputStructCnt = 352;
  IOConnectCallStructMethod(a1, 2u, 0, 0, v7, &outputStructCnt);
  v6 = 4000;
  logBatteryDiagnosticData((uint64_t)v5, a1, a2);
}

void logBatteryDiagnosticData(uint64_t a1, uint64_t a2, int a3)
{
  const __CFDictionary *v6;
  int SInt32ForKey;
  float v8;
  int v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  char *v16;
  _BYTE v17[24];
  __int128 v18;
  uint64_t v19;
  char __str[2];
  __int16 v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  char v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;
  char v36;
  uint64_t v37;
  time_t v38;
  float v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v40 = 0u;
  v41 = 0u;
  v42 = 0;
  v6 = IOServiceMatching("IOPMPowerSource");
  service = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v6);
  if (service)
  {
    if ((getSInt32ForKey(CFSTR("CurrentCapacity"), (_DWORD *)&v14 + 1) & 0x80000000) != 0)
    {
      IOObjectRelease(service);
    }
    else
    {
      SInt32ForKey = getSInt32ForKey(CFSTR("MaxCapacity"), &v14);
      IOObjectRelease(service);
      if ((SInt32ForKey & 0x80000000) == 0)
      {
        v8 = (float)(100 * HIDWORD(v14)) / (float)(int)v14;
        setUPOData(CFSTR("IOPMUBootUPOState"), v8 > 10.0);
        if (*(_DWORD *)(a1 + 596) && v8 > 10.0 && *(__int16 *)(a1 + 48) >= 2742)
          setUPOData(CFSTR("IOPMUBootUPOCounter"), 1);
        v9 = (__int16)(*(unsigned __int8 *)(a1 + 104) << 8) | *(unsigned __int8 *)(a1 + 105);
        v10 = (__int16)(*(unsigned __int8 *)(a1 + 126) << 8) | *(unsigned __int8 *)(a1 + 127);
        v11 = *(unsigned __int8 *)(a1 + 142);
        v12 = *(unsigned __int8 *)(a1 + 139);
        if (a3)
        {
          v38 = time(0);
          v39 = v8;
          *(_WORD *)__str = *(_WORD *)(a1 + 48);
          v21 = *(_WORD *)(a1 + 58);
          v22 = v10;
          v23 = *(_WORD *)(a1 + 46);
          v24 = *(_WORD *)(a1 + 228);
          v25 = *(_WORD *)(a1 + 44);
          v26 = *(_WORD *)(a1 + 226);
          v27 = *(_WORD *)(a1 + 52);
          v28 = *(_WORD *)(a1 + 230);
          v29 = *(_WORD *)(a1 + 84);
          v30 = v9;
          v31 = v11;
          v32 = *(_WORD *)(a1 + 42);
          v33 = *(_WORD *)(a1 + 222);
          v34 = *(_WORD *)(a1 + 50);
          v35 = *(_WORD *)(a1 + 224);
          v36 = v12;
          v37 = *(_QWORD *)(a1 + 60);
          v19 = 0;
          *(_QWORD *)v17 = v38 - *(_QWORD *)(a1 + 232);
          *(_OWORD *)&v17[8] = *(_OWORD *)(a1 + 158);
          v18 = *(_OWORD *)(a1 + 174);
          LOWORD(v19) = bswap32(*(unsigned __int16 *)(a1 + 191)) >> 16;
          ggctl_logShutdownReason(a2, (uint64_t)__str, 0);
          ggctl_logShutdownDLog(a2, (uint64_t)&v40, 0);
          ggctl_logShutdownReason2(a2, v17, 0);
        }
        *(_OWORD *)v17 = *(_OWORD *)a1;
        *(_WORD *)&v17[16] = *(_WORD *)(a1 + 16);
        snprintf(__str, 0x200uLL, "%s,%5.2f,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d"
          ",%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d",
          v17,
          v8,
          *(__int16 *)(a1 + 48),
          *(__int16 *)(a1 + 58),
          v10,
          *(unsigned __int16 *)(a1 + 46),
          *(unsigned __int16 *)(a1 + 228),
          *(__int16 *)(a1 + 44),
          *(__int16 *)(a1 + 226),
          *(__int16 *)(a1 + 52),
          *(__int16 *)(a1 + 230),
          *(unsigned __int16 *)(a1 + 84),
          v9,
          v11,
          *(__int16 *)(a1 + 42),
          *(__int16 *)(a1 + 222),
          *(__int16 *)(a1 + 50),
          *(__int16 *)(a1 + 224),
          v12,
          *(unsigned __int16 *)(a1 + 60),
          __rev16(*(unsigned __int16 *)(a1 + 191)),
          __rev16(*(unsigned __int16 *)(a1 + 158)),
          __rev16(*(unsigned __int16 *)(a1 + 160)),
          __rev16(*(unsigned __int16 *)(a1 + 162)),
          __rev16(*(unsigned __int16 *)(a1 + 164)),
          __rev16(*(unsigned __int16 *)(a1 + 166)),
          __rev16(*(unsigned __int16 *)(a1 + 168)),
          __rev16(*(unsigned __int16 *)(a1 + 170)),
          __rev16(*(unsigned __int16 *)(a1 + 172)),
          __rev16(*(unsigned __int16 *)(a1 + 174)),
          __rev16(*(unsigned __int16 *)(a1 + 176)),
          __rev16(*(unsigned __int16 *)(a1 + 178)),
          __rev16(*(unsigned __int16 *)(a1 + 180)),
          __rev16(*(unsigned __int16 *)(a1 + 182)),
          __rev16(*(unsigned __int16 *)(a1 + 184)),
          __rev16(*(unsigned __int16 *)(a1 + 186)),
          (unsigned __int16)v40,
          WORD1(v40),
          WORD2(v40),
          WORD3(v40),
          WORD4(v40),
          WORD5(v40),
          WORD6(v40),
          HIWORD(v40),
          (unsigned __int16)v41,
          WORD1(v41),
          WORD2(v41),
          WORD3(v41),
          WORD4(v41),
          WORD5(v41),
          WORD6(v41),
          HIWORD(v41),
          (unsigned __int16)v42,
          WORD1(v42),
          WORD2(v42),
          HIWORD(v42));
        CFAbsoluteTimeGetCurrent();
        logLineForAppleCare();
        v13 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v16 = __str;
          _os_log_impl(&dword_219944000, v13, OS_LOG_TYPE_DEFAULT, "Battery Diagnostic Data:: %s", buf, 0xCu);
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    logBatteryDiagnosticData_cold_1();
  }
}

BOOL okToLoad()
{
  stat v1;

  memset(&v1, 0, sizeof(v1));
  return stat("/dev/cu.gas-gauge", &v1) == 0;
}

uint64_t startUpdateThread(unsigned int a1)
{
  uint64_t v2;
  NSObject *v4;
  uint8_t v5[8];
  pthread_t v6;
  stat v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(&v7, 0, sizeof(v7));
  if (stat("/dev/cu.gas-gauge", &v7))
    return 0xFFFFFFFFLL;
  v6 = 0;
  memset(&v7, 0, 64);
  pthread_attr_init((pthread_attr_t *)&v7);
  pthread_attr_setdetachstate((pthread_attr_t *)&v7, 2);
  logger = (uint64_t)os_log_create("com.apple.AppleHDQGasGauge", "battery");
  if (!logger)
    return 0xFFFFFFFFLL;
  v2 = pthread_create(&v6, (const pthread_attr_t *)&v7, (void *(__cdecl *)(void *))updateThread, (void *)a1);
  if ((_DWORD)v2)
  {
    v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_219944000, v4, OS_LOG_TYPE_ERROR, "pthread_create", v5, 2u);
      v4 = logger;
    }
    os_release(v4);
  }
  else
  {
    pthread_attr_destroy((pthread_attr_t *)&v7);
  }
  return v2;
}

uint64_t updateThread(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  NSObject *v4;
  unsigned int v5;
  io_service_t v6;
  mach_port_t v7;
  IONotificationPort *v8;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  const __CFString *v11;
  __CFRunLoop *v12;
  __CFRunLoopSource *v13;
  uint64_t v14;
  io_connect_t v15;
  mach_error_t v16;
  BOOL *v17;
  mach_error_t v18;
  NSObject *v19;
  const __CFNumber *v21;
  const __CFNumber *v22;
  CFTypeID v23;
  NSObject *v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  CFTypeID v27;
  int Value;
  const __CFBoolean *v29;
  const __CFBoolean *v30;
  CFTypeID v31;
  NSObject *v32;
  const __CFNumber *v33;
  const __CFNumber *v34;
  CFTypeID v35;
  NSObject *v36;
  const __CFBoolean *v37;
  const __CFBoolean *v38;
  CFTypeID v39;
  NSObject *v40;
  const __CFNumber *v41;
  const __CFNumber *v42;
  CFTypeID v43;
  NSObject *v44;
  IONotificationPort *v45;
  kern_return_t v46;
  NSObject *v47;
  __CFRunLoop *v48;
  __CFRunLoopSource *v49;
  NSObject *v50;
  __darwin_time_t v51;
  NSObject *v52;
  int v53;
  char v54;
  int v55;
  int v56;
  double v57;
  double v58;
  int v59;
  mach_port_t v60;
  kern_return_t v61;
  int v62;
  NSObject *v63;
  int v64;
  int v65;
  NSObject *v66;
  CFAbsoluteTime v67;
  _BOOL4 v68;
  _BOOL4 v69;
  char v70;
  double v71;
  double v72;
  NSObject *v73;
  NSObject *v74;
  int v75;
  int v76;
  int v77;
  NSObject *v78;
  int v79;
  NSObject *v80;
  int v81;
  CFTypeRef CFProperty;
  CFTypeRef v83;
  CFTypeID v84;
  int v85;
  unsigned __int8 v86;
  NSObject *v87;
  int v88;
  int hdq_state;
  CFPropertyListRef v90;
  _BOOL4 v91;
  mach_port_t v92;
  int v93;
  unint64_t v94;
  int v95;
  NSObject *v96;
  unsigned int v97;
  int v98;
  int v99;
  NSObject *v100;
  NSObject *v101;
  int v102;
  _BOOL4 v103;
  uint64_t v104;
  int v105;
  int v106;
  CFNumberRef v107;
  CFNumberRef v108;
  int v109;
  BOOL v110;
  NSObject *v111;
  int v112;
  int Block;
  NSObject *v114;
  __darwin_time_t v115;
  unint64_t v116;
  NSObject *v117;
  __darwin_time_t v118;
  int v119;
  NSObject *v120;
  __darwin_time_t v121;
  unint64_t v122;
  NSObject *v123;
  NSObject *v124;
  __darwin_time_t v125;
  char v126;
  NSObject *v127;
  unint64_t v128;
  _BOOL4 v129;
  _BOOL4 v130;
  unint64_t v131;
  _BOOL4 v132;
  NSObject *v133;
  int v134;
  int v135;
  NSObject *v136;
  NSObject *v137;
  int v138;
  NSObject *v139;
  uint64_t v140;
  int BatteryData;
  CFDictionaryRef ChargerData;
  _BOOL4 v143;
  int v144;
  int v145;
  BOOL v146;
  int v147;
  int v148;
  __int16 v149;
  NSObject *v150;
  BOOL v151;
  __int16 v152;
  int v153;
  unsigned int v154;
  NSObject *v155;
  NSObject *v156;
  BOOL v157;
  int v158;
  BOOL v159;
  NSObject *v160;
  NSObject *v161;
  _BOOL4 v162;
  CFDictionaryRef v163;
  NSObject *v164;
  const __CFAllocator *v165;
  int v166;
  const __CFString *v167;
  int v168;
  int v169;
  NSObject *v170;
  _BOOL4 v171;
  unsigned int v172;
  int v174;
  CFNumberRef v175;
  uint64_t v176;
  uint64_t v177;
  int U16;
  _BOOL4 v179;
  NSObject *v180;
  unint64_t v181;
  NSObject *v182;
  CFNumberRef v183;
  uint64_t v184;
  uint64_t v185;
  CFNumberRef v186;
  uint64_t v187;
  CFNumberRef v188;
  uint64_t v189;
  CFNumberRef v190;
  uint64_t v191;
  CFNumberRef v192;
  uint64_t v193;
  unsigned int v194;
  CFNumberRef v195;
  uint64_t v196;
  const void *v197;
  uint64_t v198;
  CFNumberRef v199;
  uint64_t v200;
  char *v201;
  CFNumberRef v202;
  uint64_t v203;
  CFNumberRef v204;
  uint64_t v205;
  CFNumberRef v206;
  uint64_t v207;
  CFNumberRef v208;
  uint64_t v209;
  CFDictionaryRef v210;
  CFDictionaryRef v211;
  CFDictionaryRef v212;
  NSObject *v213;
  CFDictionaryRef v214;
  CFDictionaryRef v215;
  NSObject *v216;
  CFDictionaryRef v217;
  NSObject *v218;
  int S16;
  int v221;
  NSObject *v222;
  time_t v223;
  uint64_t v224;
  NSObject *v225;
  const char *v226;
  char v227;
  time_t v228;
  char v229;
  uint64_t v230;
  _BOOL4 v231;
  NSObject *v232;
  const char *v233;
  int v234;
  int v235;
  NSObject *v236;
  __int16 v237;
  _BOOL4 v238;
  NSObject *v239;
  int v240;
  int v241;
  int v242;
  NSObject *v243;
  char v244;
  NSObject *v245;
  int v246;
  NSObject *v247;
  int v248;
  int v249;
  int v250;
  NSObject *v251;
  NSObject *v252;
  uint64_t v253;
  _BOOL4 v254;
  NSObject *v255;
  const char *v256;
  uint32_t v257;
  CFAbsoluteTime v258;
  NSObject *v259;
  NSObject *v260;
  int v261;
  _BOOL4 v262;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  os_log_t logc;
  int v267;
  int v268;
  _BOOL4 v269;
  int v270;
  int v271;
  int v272;
  uint64_t v273;
  os_log_t v274;
  _BOOL4 v275;
  NSObject *v276;
  time_t v277;
  _BOOL4 v278;
  char v279;
  _BOOL4 v280;
  int v281;
  uint64_t v282;
  BOOL v283;
  int v284;
  int v285;
  int v286;
  uint64_t v287;
  int v288;
  CFPropertyListRef v289;
  int v290;
  BOOL *v291;
  unsigned int v292;
  _BOOL4 v293;
  BOOL v294;
  const __CFString *v295;
  const __CFString *v296;
  const __CFString *mode;
  io_connect_t v298;
  BOOL v299;
  _BOOL4 v300;
  const __CFAllocator *allocator;
  io_connect_t kernelPort;
  CFTypeRef v303;
  BOOL v304;
  int v305;
  char v306;
  char v307;
  char v308[7];
  int v309;
  int v310;
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  int v320;
  int v321;
  int v322;
  int v323;
  int v324;
  _BOOL4 v325;
  int v326;
  char v327;
  char v328[15];
  char v329;
  char v330[15];
  char v331;
  char v332[15];
  size_t v333;
  int valuePtr;
  uint64_t refCon;
  intptr_t notificationID;
  io_object_t notifier;
  IONotificationPortRef thePortRef;
  unsigned __int16 v339;
  int v340;
  io_object_t notification[2];
  uint8_t v342[4];
  int v343[3];
  uint8_t v344[4];
  const char *v345;
  __int16 v346;
  int v347;
  void *keys[2];
  __int128 v349;
  __int128 v350;
  _BYTE input[52];
  double v352;
  int v353;
  void *v354[2];
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  uint8_t buf[32];
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  char v397[64];
  uint64_t v398;

  v398 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)notification = 0;
  v340 = 0;
  v339 = 0;
  thePortRef = 0;
  notifier = 0;
  notificationID = 0;
  refCon = 0;
  pthread_setname_np("GasGauge-updateThread");
  v2 = 0x2550A4000uLL;
  gRestrictLogMessagesCounter = 0;
  v3 = 0x253F33000uLL;
  v4 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219944000, v4, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread start", buf, 2u);
  }
  v5 = pmps_service();
  if (v5)
  {
    v6 = v5;
    v7 = *MEMORY[0x24BDD8B18];
    v8 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    if (IOServiceAddInterestNotification(v8, v6, "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        updateThread_cold_10();
      return 0;
    }
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(v8);
    v11 = (const __CFString *)*MEMORY[0x24BDBD5A0];
    CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    kernelPort = IORegisterForSystemPower(&refCon, &thePortRef, (IOServiceInterestCallback)iokit_callback, &notifier);
    if (kernelPort && thePortRef)
    {
      v12 = CFRunLoopGetCurrent();
      v13 = IONotificationPortGetRunLoopSource(thePortRef);
      CFRunLoopAddSource(v12, v13, v11);
      v14 = ggctl_connect(&notification[1]);
      if (!(_DWORD)v14)
        return 0;
      v15 = v14;
      *(_QWORD *)buf = 0;
      v354[0] = 0;
      v16 = MEMORY[0x219A345E8](v14, 0, *MEMORY[0x24BDAEC58], buf, v354, 1);
      if (v16)
        v17 = 0;
      else
        v17 = *(BOOL **)buf;
      if (v16)
      {
        v18 = v16;
        v19 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
          updateThread_cold_9(v18, v19);
        IOServiceClose(v15);
        return 0;
      }
      v287 = *(_QWORD *)buf;
      v291 = v17;
      mode = v11;
      *(_QWORD *)buf = 352;
      IOConnectCallStructMethod(v15, 2u, 0, 0, &dword_253F33930, (size_t *)buf);
      byte_253F3387C = dword_253F339D4 != 0;
      v339 = word_253F339BE;
      v284 = dword_253F33A88;
      valuePtr = dword_253F339C4;
      v295 = (const __CFString *)*MEMORY[0x24BDBD588];
      v296 = (const __CFString *)*MEMORY[0x24BDBD590];
      v21 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("UpdateSampleConfig"), CFSTR("com.apple.gasgauge"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
      if (v21)
      {
        v22 = v21;
        v23 = CFGetTypeID(v21);
        if (v23 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v22, kCFNumberSInt32Type, &valuePtr);
          v24 = logger;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = valuePtr;
            _os_log_impl(&dword_219944000, v24, OS_LOG_TYPE_DEFAULT, "changed updateSampleConfig=%#x", buf, 8u);
          }
        }
        CFRelease(v22);
      }
      v292 = valuePtr;
      v25 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("CriticalBattery"), CFSTR("com.apple.gasgauge"), v296, v295);
      if (v25)
      {
        v26 = v25;
        v27 = CFGetTypeID(v25);
        if (v27 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v26, kCFNumberSInt32Type, &word_253F339BC);
          CFRelease(v26);
        }
        else
        {
          Value = CFBooleanGetValue(v26);
          CFRelease(v26);
          if (!Value)
          {
            v260 = logger;
            v290 = 0;
            if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219944000, v260, OS_LOG_TYPE_DEFAULT, "Critical battery shutdown disabled", buf, 2u);
              v290 = 0;
            }
            goto LABEL_30;
          }
        }
      }
      v290 = 1;
LABEL_30:
      v29 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("UserMode"), CFSTR("com.apple.gasgauge"), v296, v295);
      if (v29)
      {
        v30 = v29;
        v31 = CFGetTypeID(v29);
        v293 = v31 == CFBooleanGetTypeID() && CFBooleanGetValue(v30) != 0;
        CFRelease(v30);
        v32 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v293;
          _os_log_impl(&dword_219944000, v32, OS_LOG_TYPE_DEFAULT, "gas gauge: userModeEnabled=%d", buf, 8u);
        }
      }
      else
      {
        v293 = 0;
      }
      v33 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("CriticalFlagDelay"), CFSTR("com.apple.gasgauge"), v296, v295);
      if (v33)
      {
        v34 = v33;
        v35 = CFGetTypeID(v33);
        if (v35 == CFNumberGetTypeID())
          CFNumberGetValue(v34, kCFNumberSInt32Type, &v339);
        CFRelease(v34);
        v36 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v339;
          _os_log_impl(&dword_219944000, v36, OS_LOG_TYPE_DEFAULT, "gas gauge: critical flag delay %d", buf, 8u);
        }
      }
      v37 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("DebugPolling"), CFSTR("com.apple.gasgauge"), v296, v295);
      if (v37)
      {
        v38 = v37;
        v39 = CFGetTypeID(v37);
        if (v39 == CFBooleanGetTypeID())
          debug_polling = CFBooleanGetValue(v38) != 0;
        CFRelease(v38);
        v40 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = debug_polling;
          _os_log_impl(&dword_219944000, v40, OS_LOG_TYPE_DEFAULT, "gas gauge: debug_polling=%d", buf, 8u);
        }
      }
      v41 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("RestricLogCounter"), CFSTR("com.apple.gasgauge"), v296, v295);
      if (v41)
      {
        v42 = v41;
        v43 = CFGetTypeID(v41);
        if (v43 == CFNumberGetTypeID())
          CFNumberGetValue(v42, kCFNumberSInt32Type, &gRestrictLogCounter);
        CFRelease(v42);
        v44 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = gRestrictLogCounter;
          _os_log_impl(&dword_219944000, v44, OS_LOG_TYPE_DEFAULT, "gas gauge: log counter %d", buf, 8u);
        }
      }
      v305 = dword_253F339C8;
      if (dword_253F339C8)
      {
        v45 = IONotificationPortCreate(v7);
        v46 = IOServiceAddInterestNotification(v45, notification[1], "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification);
        v47 = logger;
        if (v46)
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
            updateThread_cold_8();
        }
        else
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219944000, v47, OS_LOG_TYPE_DEFAULT, "gasgauge: listening for battery interrupts", buf, 2u);
          }
          v48 = CFRunLoopGetCurrent();
          v49 = IONotificationPortGetRunLoopSource(v45);
          CFRunLoopAddSource(v48, v49, v11);
        }
      }
      v340 = 0;
      getUPOData(CFSTR("IOPMUBootUPOState"), &v340);
      v299 = v340 != 0;
      getUPOData(CFSTR("IOPMUBootBatteryHealthMetric"), &dword_253F33928);
      v333 = 64;
      if (sysctlbyname("hw.model", v397, &v333, 0, 0))
      {
        v50 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
          updateThread_cold_7(v50);
      }
      v298 = v15;
      v51 = UpSeconds();
      v52 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219776;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v290;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (unsigned __int16)word_253F339BC;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = valuePtr;
        *(_WORD *)&buf[30] = 1024;
        LODWORD(v377) = byte_253F3387C;
        WORD2(v377) = 1024;
        *(_DWORD *)((char *)&v377 + 6) = v339;
        WORD5(v377) = 1024;
        HIDWORD(v377) = dword_253F339C0;
        LOWORD(v378) = 1024;
        *(_DWORD *)((char *)&v378 + 2) = v340;
        _os_log_impl(&dword_219944000, v52, OS_LOG_TYPE_DEFAULT, "gasgauge: %llu updateThread critical(%d, 0x%x), uscfg=0x%x, dyn=%d cfd=%d cfd-voltage=%d, upos=%x", buf, 0x36u);
      }
      v282 = a1;
      v278 = a1 != 0;
      LOBYTE(v53) = 0;
      v283 = 0;
      v304 = 0;
      v300 = 0;
      v294 = 0;
      v54 = 0;
      v306 = 0;
      v279 = 0;
      v277 = 0;
      v55 = 0;
      v288 = 0;
      v56 = 0;
      qword_253F33920 = time(0);
      v280 = (dword_253F339D8 | dword_253F33A1C) != 0;
      v286 = (v292 >> 2) & 1;
      v285 = (v292 >> 3) & 1;
      allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v303 = (CFTypeRef)*MEMORY[0x24BDBD270];
      v289 = (CFPropertyListRef)*MEMORY[0x24BDBD268];
      v57 = 0.0;
      v58 = 0.0;
      LOBYTE(v281) = 1;
      v59 = -1;
      v60 = -1;
      while (1)
      {
        v396 = 0u;
        v395 = 0u;
        v394 = 0u;
        v393 = 0u;
        v392 = 0u;
        v391 = 0u;
        v390 = 0u;
        v389 = 0u;
        v388 = 0u;
        v387 = 0u;
        v386 = 0u;
        v385 = 0u;
        v384 = 0u;
        v383 = 0u;
        v382 = 0u;
        v381 = 0u;
        v380 = 0u;
        v379 = 0u;
        v378 = 0u;
        v377 = 0u;
        memset(buf, 0, sizeof(buf));
        v375 = 0u;
        v374 = 0u;
        v373 = 0u;
        v372 = 0u;
        v371 = 0u;
        v370 = 0u;
        v369 = 0u;
        v368 = 0u;
        v367 = 0u;
        v366 = 0u;
        v365 = 0u;
        v363 = 0u;
        v364 = 0u;
        v361 = 0u;
        v362 = 0u;
        v359 = 0u;
        v360 = 0u;
        v357 = 0u;
        v358 = 0u;
        v355 = 0u;
        v356 = 0u;
        *(_OWORD *)v354 = 0u;
        if (v305 && v60 != -1)
        {
          *(_QWORD *)input = 1;
          v61 = IOConnectCallScalarMethod(v60, 0x10u, (const uint64_t *)input, 1u, 0, 0);
          v62 = v61 == -536870183 ? -2 : -1;
          if (v61)
          {
            v63 = *(NSObject **)(v3 + 2064);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)input = 67109120;
              *(_DWORD *)&input[4] = v62;
              _os_log_impl(&dword_219944000, v63, OS_LOG_TYPE_DEFAULT, "cannot enable gauge interrupts (%d)", input, 8u);
            }
          }
        }
        LODWORD(refCon) = 0;
        if (v55)
        {
          v64 = *(_DWORD *)(v2 + 2664);
          if (v64)
          {
            v65 = v64 - 1;
          }
          else
          {
            if (v57 == 0.0)
              goto LABEL_81;
            v66 = *(NSObject **)(v3 + 2064);
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              v67 = CFAbsoluteTimeGetCurrent();
              *(_DWORD *)input = 67109632;
              *(_DWORD *)&input[4] = v55;
              *(_WORD *)&input[8] = 2048;
              *(double *)&input[10] = v67 - v57;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = gRestrictLogCounter;
              _os_log_impl(&dword_219944000, v66, OS_LOG_TYPE_DEFAULT, "failure last_update_failed_counter=%d last_success at %g, supressing %d subsequent errors", input, 0x18u);
            }
            v65 = gRestrictLogCounter;
          }
          *(_DWORD *)(v2 + 2664) = v65;
        }
LABEL_81:
        v68 = v59 != -1;
        v69 = v59 < 50;
        v70 = v68 && v69;
        if (v68 && v69)
          v71 = 5.0;
        else
          v71 = 20.0;
        if ((v54 & 1) != 0)
        {
LABEL_526:
          IOObjectRelease(v6);
          MEMORY[0x219A345F4](v298, 0, *MEMORY[0x24BDAEC58], v291);
          IOServiceClose(v298);
          *(_DWORD *)(v2 + 2664) = 0;
          v259 = *(NSObject **)(v3 + 2064);
          if (os_log_type_enabled(v259, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219944000, v259, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread terminated", buf, 2u);
          }
          return 0;
        }
        if (!(v56 | v55))
          goto LABEL_122;
        v72 = CFAbsoluteTimeGetCurrent();
        if (debug_polling && (v73 = *(NSObject **)(v3 + 2064), os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)))
        {
          *(_DWORD *)input = 136316418;
          *(_QWORD *)&input[4] = "updateThread";
          *(_WORD *)&input[12] = 1024;
          *(_DWORD *)&input[14] = 2802;
          *(_WORD *)&input[18] = 1024;
          *(_DWORD *)&input[20] = v56;
          *(_WORD *)&input[24] = 1024;
          *(_DWORD *)&input[26] = v53 & 1;
          *(_WORD *)&input[30] = 2048;
          *(double *)&input[32] = v72;
          *(_WORD *)&input[40] = 2048;
          *(double *)&input[42] = v58;
          _os_log_debug_impl(&dword_219944000, v73, OS_LOG_TYPE_DEBUG, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f *** ", input, 0x32u);
          if ((v53 & 1) == 0)
          {
LABEL_92:
            v58 = v71 + v72;
            goto LABEL_93;
          }
        }
        else if ((v53 & 1) == 0)
        {
          goto LABEL_92;
        }
        v71 = 0.0;
        if (v72 < v58)
          v71 = v58 - v72;
LABEL_93:
        if (debug_polling)
        {
          v74 = *(NSObject **)(v3 + 2064);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)input = 136316674;
            *(_QWORD *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2860;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v56;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = v53 & 1;
            *(_WORD *)&input[30] = 2048;
            *(double *)&input[32] = v72;
            *(_WORD *)&input[40] = 2048;
            *(double *)&input[42] = v58;
            *(_WORD *)&input[50] = 2048;
            v352 = v71;
            _os_log_error_impl(&dword_219944000, v74, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f update_interval=%f *** ", input, 0x3Cu);
          }
        }
        if (v71 == 0.0)
        {
          v53 = 0;
          LODWORD(refCon) = 0;
LABEL_121:
          LOBYTE(v53) = v53 != 0;
          goto LABEL_122;
        }
        if (CFRunLoopRunInMode(mode, v71, 1u) != kCFRunLoopRunHandledSource)
        {
          v53 = 0;
          goto LABEL_121;
        }
        v53 = 0;
        v75 = refCon;
        v76 = 1;
        if ((int)refCon > -536870145)
        {
          if ((_DWORD)refCon == -536870144 || (_DWORD)refCon == -536723200)
            goto LABEL_113;
          v77 = -469794560;
        }
        else
        {
          if ((refCon + 536870288) <= 0x20
            && ((1 << (refCon - 112)) & 0x100010001) != 0)
          {
            goto LABEL_113;
          }
          v77 = -536870320;
        }
        if ((_DWORD)refCon != v77)
        {
          v76 = debug_polling;
          if (debug_polling)
          {
            v78 = *(NSObject **)(v3 + 2064);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)input = 136315906;
              *(_QWORD *)&input[4] = "updateThread";
              *(_WORD *)&input[12] = 1024;
              *(_DWORD *)&input[14] = 2879;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = v56;
              *(_WORD *)&input[24] = 1024;
              *(_DWORD *)&input[26] = v75;
              _os_log_error_impl(&dword_219944000, v78, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x  (ign) *** ", input, 0x1Eu);
            }
            v76 = 0;
            v53 = 1;
          }
          else
          {
            v53 = 1;
          }
        }
LABEL_113:
        if (v75 > -536870145)
        {
          if (v75 == -536870144 || v75 == -469794560)
            goto LABEL_121;
          v79 = -536723200;
        }
        else
        {
          if ((v75 + 536870288) <= 0x20 && ((1 << (v75 - 112)) & 0x100010001) != 0)
            goto LABEL_121;
          v79 = -536870320;
        }
        if (v75 == v79)
          goto LABEL_121;
        if (v76)
        {
LABEL_122:
          if (debug_polling && (v80 = *(NSObject **)(v3 + 2064), os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)))
          {
            *(_DWORD *)input = 136316162;
            *(_QWORD *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2897;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v56;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = refCon;
            *(_WORD *)&input[30] = 1024;
            *(_DWORD *)&input[32] = v306 & 1;
            _os_log_error_impl(&dword_219944000, v80, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x system_sleep=%d *** ", input, 0x24u);
            if (v56)
              goto LABEL_125;
LABEL_126:
            CFProperty = IORegistryEntryCreateCFProperty(v6, CFSTR("AdapterInfo"), allocator, 0);
            v83 = IORegistryEntryCreateCFProperty(v6, CFSTR("AppleRawExternalConnected"), allocator, 0);
            LODWORD(keys[0]) = 0;
            if (CFProperty)
            {
              v84 = CFGetTypeID(CFProperty);
              if (v84 == CFNumberGetTypeID())
                CFNumberGetValue((CFNumberRef)CFProperty, kCFNumberSInt32Type, keys);
              CFRelease(CFProperty);
              v85 = (int)keys[0];
              if (v304 != (LODWORD(keys[0]) == 0))
              {
LABEL_132:
                v86 = v300 ^ (v83 != v303);
                goto LABEL_133;
              }
              v86 = 0;
            }
            else
            {
              v85 = 0;
              v86 = 0;
              if (!v304)
                goto LABEL_132;
            }
LABEL_133:
            if (debug_polling)
            {
              v87 = logger;
              if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)input = 136316418;
                *(_QWORD *)&input[4] = "updateThread";
                *(_WORD *)&input[12] = 1024;
                *(_DWORD *)&input[14] = 2921;
                *(_WORD *)&input[18] = 1024;
                *(_DWORD *)&input[20] = v56;
                *(_WORD *)&input[24] = 1024;
                *(_DWORD *)&input[26] = v86 & 1;
                *(_WORD *)&input[30] = 1024;
                *(_DWORD *)&input[32] = v85;
                *(_WORD *)&input[36] = 1024;
                *(_DWORD *)&input[38] = v83 == v303;
                _os_log_impl(&dword_219944000, v87, OS_LOG_TYPE_DEFAULT, "*** %s:%d updatesDone=%d same_adaptor=%d adaptor_type=%d external_connected=%d *** ", input, 0x2Au);
              }
            }
            if ((v86 & (v56 != 0)) != 1 || v71 == 0.0)
            {
              v88 = (int)keys[0];
              v304 = LODWORD(keys[0]) != 0;
              v300 = v83 == v303;
              v2 = 0x2550A4000;
              if (v83)
                CFRelease(v83);
              if (v88 != 0 && v299)
              {
                setUPOData(CFSTR("IOPMUBootUPOState"), 0);
                v299 = 0;
              }
              ++debug_cnt_ut_recv;
              v81 = refCon;
              v3 = 0x253F33000uLL;
              goto LABEL_147;
            }
            v2 = 0x2550A4000;
            if (v83)
              CFRelease(v83);
            v54 = 0;
            v60 = -1;
            LOBYTE(v53) = 1;
LABEL_141:
            v3 = 0x253F33000;
          }
          else
          {
            if (!v56)
              goto LABEL_126;
LABEL_125:
            v81 = refCon;
            if ((_DWORD)refCon == -536723200)
              goto LABEL_126;
LABEL_147:
            if (v81 == -469794560)
            {
              LOBYTE(v53) = 1;
              if (v71 != 0.0)
                v70 = 1;
            }
            if ((v306 & (v81 != -536870144)) != 0)
            {
LABEL_156:
              v54 = 0;
              v60 = -1;
              v306 = 1;
            }
            else if (v81 == -536870288)
            {
              IOAllowPowerChange(kernelPort, notificationID);
              v54 = 0;
              v60 = -1;
              LOBYTE(v53) = 1;
            }
            else
            {
              if (v55 && v81 == -536870272)
              {
                IOAllowPowerChange(kernelPort, notificationID);
                goto LABEL_156;
              }
              if (v298 == -1)
              {
                v54 = 0;
                ++v55;
                goto LABEL_166;
              }
              if (v81 == -536870144)
              {
                if (v294)
                  updateThermalCoolDownState(notification[1], 0);
                v294 = 0;
                if ((v306 & 1) != 0)
                {
                  v306 = 0;
                  qword_253F33920 = time(0);
                }
                else
                {
                  v306 = 0;
                }
              }
              hdq_state = ggctl_get_hdq_state(v298);
              if (hdq_state == -2)
              {
                v54 = 1;
                goto LABEL_444;
              }
              if (hdq_state)
              {
                if (hdq_state < 0)
                {
                  if (os_log_type_enabled(*(os_log_t *)(v3 + 2064), OS_LOG_TYPE_ERROR))
                    updateThread_cold_2(&v327, v328);
                  v54 = 0;
                  goto LABEL_443;
                }
                v93 = hdqBreak(v298);
                if (v93 != -2)
                {
                  if (v93 < 0)
                  {
                    v94 = v3;
                    v95 = ++updateThread_debug_break_failures;
                    v96 = *(NSObject **)(v94 + 2064);
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)input = 136315906;
                      *(_QWORD *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3024;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v95;
                      *(_WORD *)&input[24] = 1024;
                      *(_DWORD *)&input[26] = -1;
                      _os_log_error_impl(&dword_219944000, v96, OS_LOG_TYPE_ERROR, "%s:%d break failed break_failures=%d (%d)", input, 0x1Eu);
                      v95 = updateThread_debug_break_failures;
                    }
                    if ((-858993459 * v95) <= 0x33333333)
                    {
                      statsAndLogs(notification[1], 0);
                      v3 = 0x253F33000uLL;
                    }
                    else
                    {
                      v97 = -1227133513 * v95;
                      v3 = 0x253F33000;
                      if (v97 <= 0x24924924)
                        debugLog(notification[1], 63);
                    }
                  }
                  else if (updateThread_debug_break_failures)
                  {
                    statsAndLogs(notification[1], 1);
                    debugLog(notification[1], 0);
                    updateThread_debug_break_failures = 0;
                  }
                }
                if (v305)
                {
                  if (v56)
                  {
                    v98 = gaugeDisableInterrupts(v298);
                    if (v98 < 0)
                    {
                      v99 = v98;
                      v100 = *(NSObject **)(v3 + 2064);
                      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)input = 136315650;
                        *(_QWORD *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3044;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v99;
                        _os_log_error_impl(&dword_219944000, v100, OS_LOG_TYPE_ERROR, "%s:%d cannot disable gauge interrupts (%d)", input, 0x18u);
                      }
                    }
                  }
                }
                if ((_DWORD)refCon == -536870272)
                {
                  v106 = OSThermalNotificationCurrentLevel();
                  v294 = v106 > 14;
                  v2 = 0x2550A4000;
                  if (v106 >= 15)
                    updateThermalCoolDownState(notification[1], 1);
                  IOAllowPowerChange(kernelPort, notificationID);
                  v54 = 0;
                  v306 = 1;
                  goto LABEL_444;
                }
                v2 = 0x2550A4000;
                if ((_DWORD)refCon == -536870320)
                  goto LABEL_526;
                if (v56)
                {
                  v273 = 0;
                  goto LABEL_203;
                }
                if ((getFWVersion(v298, &word_253F3385E) & 0x80000000) != 0)
                {
                  v54 = 0;
                  v56 = 0;
                  ++v55;
                  v60 = v298;
                }
                else
                {
                  v107 = CFNumberCreate(allocator, kCFNumberIntType, &word_253F3385E);
                  if (v107)
                  {
                    v108 = v107;
                    IORegistryEntrySetCFProperty(v6, CFSTR("GasGaugeFirmwareVersion"), v107);
                    CFRelease(v108);
                  }
                  v109 = (unsigned __int16)word_253F3385E;
                  v110 = (unsigned __int16)word_253F3385E - 1281 < 2;
                  *v291 = (unsigned __int16)word_253F3385E > 0x131u;
                  if (v109 == 265)
                  {
                    v111 = logger;
                    v290 = 0;
                    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)input = 0;
                      _os_log_impl(&dword_219944000, v111, OS_LOG_TYPE_DEFAULT, "gas gauge firmware 1.09: disabling critical battery shutdown", input, 2u);
                      v290 = 0;
                    }
                  }
                  LOBYTE(v286) = v286 | v110;
                  keys[0] = 0;
                  if ((readChargeTable(v298, (__CFData **)keys) & 0x80000000) != 0)
                  {
                    v54 = 0;
                    v56 = 0;
                    ++v55;
                    v60 = v298;
                    goto LABEL_141;
                  }
                  v3 = 0x253F33000uLL;
                  if (keys[0])
                  {
                    *(void **)buf = keys[0];
                    v354[0] = CFSTR("ChargeTable");
                    v273 = 1;
                  }
                  else
                  {
                    v273 = 0;
                  }
                  if (dword_253F33930)
                    v112 = dword_253F33930;
                  else
                    v112 = 2;
                  Block = ggctl_readBlock(v298, -1, v112, updateThread_batteryInfo, 0);
                  if (Block < 0)
                    strcpy((char *)updateThread_batteryInfo, "000000");
                  if ((v285 & 1) != 0)
                  {
                    byte_253F33860 = dword_253F339D0;
                    if ((_BYTE)dword_253F339D0)
                    {
                      LOBYTE(v285) = 1;
                    }
                    else
                    {
                      v156 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        *(_QWORD *)input = 67109376;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = Block;
                        _os_log_error_impl(&dword_219944000, v156, OS_LOG_TYPE_ERROR, "disabled passedCharge PCFF=%d err=%d", input, 0xEu);
                      }
                      LOBYTE(v285) = 0;
                      v2 = 0x2550A4000;
                    }
                  }
                  else
                  {
                    LOBYTE(v285) = 0;
                  }
                  if (byte_253F3387C)
                    word_253F3385C = 136;
                  if (hdqReadS16(v298, 60, &word_253F3385A))
                    word_253F3385A = 0;
                  if (controlReadU16(v298, 8, &word_253F33858))
                  {
                    word_253F33858 = 0;
                    v269 = 0;
                    v270 = 1;
                    v104 = v273;
LABEL_280:
                    v325 = v56 < 16;
                    *(_QWORD *)&buf[8 * v104] = CFNumberCreate(allocator, kCFNumberIntType, &v325);
                    v354[v104] = CFSTR("ForceFullGGUpdateOnBoot");
                    HIDWORD(v128) = -1431655764 * v56 + 143165576;
                    LODWORD(v128) = HIDWORD(v128);
                    v129 = (v128 >> 2) < 0x4444445 && v56 < 16;
                    if (v129)
                    {
                      v130 = 1;
                    }
                    else
                    {
                      HIDWORD(v131) = -1813430636 * v56 + 9544368;
                      LODWORD(v131) = HIDWORD(v131);
                      v130 = (v131 >> 4) < 0x123457;
                    }
                    v274 = (os_log_t)v104;
                    if (debug_polling)
                    {
                      v132 = v130;
                      v133 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)input = 136316418;
                        *(_QWORD *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3254;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v56;
                        *(_WORD *)&input[24] = 1024;
                        *(_DWORD *)&input[26] = v132;
                        *(_WORD *)&input[30] = 1024;
                        *(_DWORD *)&input[32] = v129;
                        *(_WORD *)&input[36] = 1024;
                        *(_DWORD *)&input[38] = v56 < 16;
                        _os_log_impl(&dword_219944000, v133, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d, fullUpdate=%d, bootFullUpdate=%d, forceFullUpdate=%d] ", input, 0x2Au);
                        v134 = debug_polling;
                      }
                      else
                      {
                        v134 = 1;
                      }
                      if (v56)
                        v135 = v132;
                      else
                        v135 = 0;
                      v3 = 0x253F33000uLL;
                      v130 = v132;
                      if (v134)
                      {
                        v104 = (uint64_t)v274;
                        if (v135)
                        {
                          v135 = 1;
                          statsAndLogs(notification[1], 1);
                        }
                      }
                      else
                      {
                        v104 = (uint64_t)v274;
                      }
                    }
                    else
                    {
                      if (v56)
                        v135 = v130;
                      else
                        v135 = 0;
                      v3 = 0x253F33000;
                    }
                    if (v270)
                    {
LABEL_439:
                      if (*v291 && *(_DWORD *)(v287 + 4))
                        ++*(_DWORD *)(v287 + 28);
                      v54 = 0;
                      ++debug_cnt_ut_err;
LABEL_443:
                      ++v55;
                      goto LABEL_444;
                    }
                    v262 = v130;
                    if (debug_polling)
                    {
                      v136 = *(NSObject **)(v3 + 2064);
                      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)input = 136315650;
                        *(_QWORD *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3295;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v56;
                        _os_log_impl(&dword_219944000, v136, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d POLLING THE BATTERY", input, 0x18u);
                      }
                    }
                    v137 = (v104 + 1);
                    v138 = !v293;
                    if (!v56)
                      v138 = 1;
                    v267 = v138;
                    if (v138 != 1)
                      goto LABEL_317;
                    v139 = (v104 + 1);
                    if (v262)
                      v140 = 18;
                    else
                      v140 = 10;
                    BatteryData = readBatteryData((uint64_t)&updateThread_updates, v140, v298);
                    if (BatteryData == (_DWORD)v140)
                    {
                      calculateBatteryHealthMetric();
                      v137 = v139;
                      goto LABEL_317;
                    }
                    v271 = BatteryData;
                    log = *(NSObject **)(v3 + 2064);
                    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)input = 67109376;
                      *(_DWORD *)&input[4] = v140;
                      *(_WORD *)&input[8] = 1024;
                      *(_DWORD *)&input[10] = v271;
                      _os_log_impl(&dword_219944000, log, OS_LOG_TYPE_DEFAULT, "cannot read battery data count=%d (err=%d)", input, 0xEu);
                    }
                    calculateBatteryHealthMetric();
                    v137 = v139;
                    LODWORD(ChargerData) = v271;
                    if (v271)
                    {
                      v143 = 0;
                    }
                    else
                    {
LABEL_317:
                      v144 = word_253F33862;
                      v145 = word_253F3386A;
                      if (word_253F3386A)
                        v146 = 0;
                      else
                        v146 = word_253F33862 == 3600;
                      v147 = (unsigned __int16)word_253F33892;
                      if (v146 || (unsigned __int16)word_253F33892 == 0xFFFF)
                      {
                        logb = v137;
                        v155 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)input = 67110144;
                          *(_DWORD *)&input[4] = v147;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = word_253F3386C;
                          *(_WORD *)&input[14] = 1024;
                          *(_DWORD *)&input[16] = word_253F33864;
                          *(_WORD *)&input[20] = 1024;
                          *(_DWORD *)&input[22] = v144;
                          *(_WORD *)&input[26] = 1024;
                          *(_DWORD *)&input[28] = v145;
                          _os_log_impl(&dword_219944000, v155, OS_LOG_TYPE_DEFAULT, "gas gauge reset detected (flags %#x capacity %d/%dmAh voltage %dmV current %dmA)", input, 0x20u);
                        }
                        v143 = 0;
                        LODWORD(ChargerData) = -1;
                        v3 = 0x253F33000;
                        v137 = logb;
                      }
                      else
                      {
                        if (!v56 && v340)
                        {
                          loga = v137;
                          v340 = 0;
                          v148 = word_253F33864;
                          v149 = 100 * (word_253F33864 / 100) + 100;
                          v150 = logger;
                          v151 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                          v152 = v149;
                          v153 = v149;
                          if (v151)
                          {
                            *(_QWORD *)input = 67110144;
                            v154 = ((26215 * v149) >> 18) + ((26215 * v149) >> 31);
                            *(_WORD *)&input[8] = 1024;
                            *(_DWORD *)&input[10] = v148;
                            *(_WORD *)&input[14] = 1024;
                            *(_DWORD *)&input[16] = word_253F3386C;
                            *(_WORD *)&input[20] = 1024;
                            *(_DWORD *)&input[22] = v153;
                            *(_WORD *)&input[26] = 1024;
                            *(_DWORD *)&input[28] = ((26215 * v153) >> 18) + ((26215 * v153) >> 31);
                            _os_log_impl(&dword_219944000, v150, OS_LOG_TYPE_DEFAULT, "mask real UPOState=%x FCC=%d RemCap=%d new FCC=%d new RemCap=%d", input, 0x20u);
                          }
                          else
                          {
                            v154 = ((26215 * v149) >> 18) + ((26215 * v149) >> 31);
                          }
                          word_253F33864 = v152;
                          word_253F3386C = v154;
                          v137 = loga;
                        }
                        if (((v267 ^ 1) & 1) != 0)
                        {
                          LODWORD(ChargerData) = 0;
                          v157 = v300;
                        }
                        else
                        {
                          v157 = v300;
                          if (v300)
                            v158 = 24;
                          else
                            v158 = 22;
                          LODWORD(ChargerData) = hdqReadS16(v298, v158, &word_253F3386E);
                        }
                        v143 = (_DWORD)ChargerData == 0;
                        v159 = (_DWORD)ChargerData != 0;
                        if ((v292 & 2) == 0)
                          v159 = 1;
                        if ((v159 || !v157) | (v267 ^ 1) & 1)
                        {
                          v3 = 0x253F33000;
                        }
                        else
                        {
                          ChargerData = readChargerData(v286 & 1, v285 & 1, v298);
                          *(_QWORD *)&buf[8 * (_QWORD)v137] = ChargerData;
                          v3 = 0x253F33000uLL;
                          if (ChargerData)
                          {
                            if (v282)
                              CFShow(ChargerData);
                            LODWORD(ChargerData) = 0;
                            v354[(_QWORD)v137] = CFSTR("ChargerData");
                            v137 = ((char *)&v274->isa + 2);
                          }
                        }
                      }
                    }
                    v272 = (int)ChargerData;
                    v275 = v143;
                    if (v143 && (unsigned __int16)word_253F3385E >= 0x501u)
                    {
                      v324 = (unsigned __int16)word_253F33866;
                      *(_QWORD *)&buf[8 * (_QWORD)v137] = CFNumberCreate(allocator, kCFNumberIntType, &v324);
                      v354[(_QWORD)v137] = CFSTR("NominalChargeCapacity");
                      v160 = ((char *)&v137->isa + 1);
                    }
                    else
                    {
                      v160 = v137;
                    }
                    if (debug_polling)
                    {
                      v161 = *(NSObject **)(v3 + 2064);
                      if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)input = 67109376;
                        *(_DWORD *)&input[4] = dword_253F339D8;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = dword_253F33A1C;
                        _os_log_impl(&dword_219944000, v161, OS_LOG_TYPE_DEFAULT, "determineVACVoltage, vacLevelCount=%d, vac95LevelCount=%d", input, 0xEu);
                      }
                    }
                    v162 = v300;
                    v261 = v135;
                    if (!byte_253F3387C || v56 != 0 && !v300)
                    {
                      if (v280 && (v56 == 0 || v300))
                      {
                        v168 = determineVACVoltage();
                        if (v168 != dword_253F33880)
                        {
                          v169 = v168;
                          dword_253F33880 = v168;
                          v170 = *(NSObject **)(v3 + 2064);
                          if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = v169;
                            _os_log_impl(&dword_219944000, v170, OS_LOG_TYPE_DEFAULT, "Added atvAbsMaxVoltageMV=%u to battery dict", input, 8u);
                            v169 = dword_253F33880;
                          }
                          v165 = allocator;
                          v323 = v169;
                          v164 = v160;
                          *(_QWORD *)&buf[8 * (_QWORD)v160] = CFNumberCreate(allocator, kCFNumberIntType, &v323);
                          v167 = CFSTR("atvAbsMaxVoltageMV");
                          v162 = v300;
                          v166 = v267;
LABEL_375:
                          v354[(_QWORD)v164] = (void *)v167;
                          v164 = ((char *)v164 + 1);
                          goto LABEL_376;
                        }
                        v162 = v300;
                      }
                      v165 = allocator;
                      v164 = v160;
                      goto LABEL_371;
                    }
                    v163 = dynamicATV(v298);
                    v164 = v160;
                    *(_QWORD *)&buf[8 * (_QWORD)v160] = v163;
                    v165 = allocator;
                    if (v163)
                    {
                      v166 = v267;
                      if (v282)
                        CFShow(v163);
                      v167 = CFSTR("AppleDynamicATV");
                      goto LABEL_375;
                    }
LABEL_371:
                    v166 = v267;
LABEL_376:
                    v171 = v275;
                    if ((v292 & 2) != 0)
                      v171 = 0;
                    if ((v166 & (v171 && v162)) == 1)
                    {
                      *(_QWORD *)input = 0;
                      keys[0] = 0;
                      *(_QWORD *)input = CFNumberCreate(v165, kCFNumberIntType, &dword_253F33880);
                      keys[0] = CFSTR("ChargingVoltage");
                      *(_QWORD *)&buf[8 * (_QWORD)v164] = CFDictionaryCreate(v165, (const void **)keys, (const void **)input, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      v354[(_QWORD)v164] = CFSTR("ChargerData");
                      v164 = ((char *)v164 + 1);
                      CFRelease(*(CFTypeRef *)input);
                    }
                    if (dword_253F33A60)
                    {
                      v172 = determinePoSMThreshold();
                      if (v172 != dword_253F33888)
                        dword_253F33888 = v172;
                      *(_DWORD *)input = HIWORD(v172);
                      LODWORD(keys[0]) = (unsigned __int16)v172;
                      if ((unsigned __int16)v172 == 0xFFFF || HIWORD(v172) == 0xFFFF)
                        v174 = 0;
                      else
                        v174 = dword_253F33A60;
                      *(_DWORD *)v344 = v174;
                      *(_QWORD *)&buf[8 * (_QWORD)v164] = CFNumberCreate(v165, kCFNumberIntType, v344);
                      v354[(_QWORD)v164] = CFSTR("PoSMEnabled");
                      v175 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v176 = 8 * (_QWORD)v164 + 8;
                      *(_QWORD *)&buf[v176] = v175;
                      *(void **)((char *)v354 + v176) = CFSTR("PoSMUpperThreshold");
                      v164 = ((char *)v164 + 2);
                      *(_QWORD *)&buf[8 * (_QWORD)v164] = CFNumberCreate(allocator, kCFNumberIntType, keys);
                      v354[(_QWORD)v164] = CFSTR("PoSMLowerThreshold");
                    }
                    else
                    {
                      *(_DWORD *)input = 0;
                      *(_QWORD *)&buf[8 * (_QWORD)v164] = CFNumberCreate(v165, kCFNumberIntType, input);
                      v354[(_QWORD)v164] = CFSTR("PoSMEnabled");
                    }
                    if ((v275 & v292) != 0)
                      U16 = 0;
                    else
                      U16 = v272;
                    if ((v166 & v275 & v292) == 1)
                      U16 = hdqReadU16(v298, 110, &word_253F33870);
                    v3 = 0x253F33000uLL;
                    v2 = 0x2550A4000;
                    v179 = v269;
                    v180 = v164;
                    v181 = (unint64_t)&v164->isa + 1;
                    if (!U16)
                    {
                      v182 = v180;
                      logc = v180;
                      v322 = 10 * word_253F33868 - 27320;
                      *(_QWORD *)&buf[8 * v181] = CFNumberCreate(allocator, kCFNumberIntType, &v322);
                      v354[v181] = CFSTR("Temperature");
                      v321 = word_253F3386A;
                      v183 = CFNumberCreate(allocator, kCFNumberIntType, &v321);
                      v184 = 8 * (_QWORD)v182;
                      v185 = 8 * (_QWORD)v182 + 16;
                      *(_QWORD *)&buf[v185] = v183;
                      *(void **)((char *)v354 + v185) = CFSTR("Amperage");
                      v320 = word_253F33862;
                      v186 = CFNumberCreate(allocator, kCFNumberIntType, &v320);
                      v187 = 8 * (_QWORD)v182 + 24;
                      *(_QWORD *)&buf[v187] = v186;
                      *(void **)((char *)v354 + v187) = CFSTR("Voltage");
                      v319 = word_253F3386E;
                      v188 = CFNumberCreate(allocator, kCFNumberIntType, &v319);
                      v189 = 8 * (_QWORD)v182 + 32;
                      *(_QWORD *)&buf[v189] = v188;
                      *(void **)((char *)v354 + v189) = CFSTR("TimeRemaining");
                      v59 = word_253F3386C;
                      v318 = word_253F3386C;
                      v190 = CFNumberCreate(allocator, kCFNumberIntType, &v318);
                      v191 = v184 + 40;
                      *(_QWORD *)&buf[v191] = v190;
                      *(void **)((char *)v354 + v191) = CFSTR("CurrentCapacity");
                      v317 = word_253F33864;
                      v192 = CFNumberCreate(allocator, kCFNumberIntType, &v317);
                      v193 = v184 + 48;
                      *(_QWORD *)&buf[v193] = v192;
                      *(void **)((char *)v354 + v193) = CFSTR("MaxCapacity");
                      HIWORD(v194) = -18304;
                      LOWORD(v194) = word_253F3388E;
                      *(_DWORD *)input = llroundf((float)((float)((float)word_253F33872 * -0.000061035) + 1.0) * (float)v194);
                      v195 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v196 = v184 + 56;
                      *(_QWORD *)&buf[v196] = v195;
                      *(void **)((char *)v354 + v196) = CFSTR("AbsoluteCapacity");
                      v197 = v303;
                      if (!v269)
                        v197 = v289;
                      v198 = v184 + 64;
                      *(_QWORD *)&buf[v198] = v197;
                      *(void **)((char *)v354 + v198) = CFSTR("AtCriticalLevel");
                      v316 = (unsigned __int16)word_253F33892;
                      v199 = CFNumberCreate(allocator, kCFNumberIntType, &v316);
                      v200 = v184 + 72;
                      *(_QWORD *)&buf[v200] = v199;
                      *(void **)((char *)v354 + v200) = CFSTR("AppleRawBatteryFlags");
                      v201 = (char *)&logc[1].isa + 2;
                      if ((v292 & 1) != 0)
                      {
                        v315 = (unsigned __int16)word_253F33870;
                        *(_QWORD *)&buf[8 * (_QWORD)v201] = CFNumberCreate(allocator, kCFNumberIntType, &v315);
                        v354[(_QWORD)v201] = CFSTR("ITMiscStatus");
                        v314 = word_253F33870 & 3;
                        v202 = CFNumberCreate(allocator, kCFNumberIntType, &v314);
                        v203 = v184 + 88;
                        *(_QWORD *)&buf[v203] = v202;
                        *(void **)((char *)v354 + v203) = CFSTR("ITSimulationCounter");
                        v313 = ((unsigned __int16)word_253F33870 >> 2) & 3;
                        v204 = CFNumberCreate(allocator, kCFNumberIntType, &v313);
                        v205 = v184 + 96;
                        *(_QWORD *)&buf[v205] = v204;
                        *(void **)((char *)v354 + v205) = CFSTR("RaUpdateCounter");
                        v201 = (char *)&logc[1].isa + 5;
                      }
                      v312 = word_253F33892 & 0x80;
                      *(_QWORD *)&buf[8 * (_QWORD)v201] = CFNumberCreate(allocator, kCFNumberIntType, &v312);
                      v354[(_QWORD)v201] = CFSTR("OCVTakenFlag");
                      v311 = word_253F33892 & 0x200;
                      v206 = CFNumberCreate(allocator, kCFNumberIntType, &v311);
                      v207 = 8 * (_QWORD)v201 + 8;
                      *(_QWORD *)&buf[v207] = v206;
                      *(void **)((char *)v354 + v207) = CFSTR("FCFlag");
                      v181 = (unint64_t)(v201 + 2);
                      if (!v262)
                        goto LABEL_406;
                      v310 = (unsigned __int16)word_253F3388C;
                      *(_QWORD *)&buf[8 * v181] = CFNumberCreate(allocator, kCFNumberIntType, &v310);
                      v354[v181] = CFSTR("CycleCount");
                      v309 = word_253F3385A;
                      v208 = CFNumberCreate(allocator, kCFNumberIntType, &v309);
                      v209 = 8 * (_QWORD)v201 + 24;
                      *(_QWORD *)&buf[v209] = v208;
                      *(void **)((char *)v354 + v209) = CFSTR("DesignCapacity");
                      v181 = (unint64_t)(v201 + 4);
                      v210 = parseBatteryData(v292 & 1, v278);
                      *(_QWORD *)&buf[8 * (_QWORD)(v201 + 4)] = v210;
                      if (v210)
                      {
                        U16 = 0;
                        if (v282)
                          CFShow(v210);
                        v354[v181] = CFSTR("BatteryData");
                        v181 = (unint64_t)(v201 + 5);
                        v179 = v269;
                      }
                      else
                      {
LABEL_406:
                        v179 = v269;
                        U16 = 0;
                      }
                      v2 = 0x2550A4000;
                    }
                    if (v284 && (updateThread_oneTime & 1) == 0)
                    {
                      v350 = 0u;
                      memset(input, 0, sizeof(input));
                      *(_OWORD *)keys = 0u;
                      v349 = 0u;
                      if (ggctl_logShutdownReason(v298, (uint64_t)input, 1u) || !*(_QWORD *)&input[40])
                      {
                        v213 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v344 = 136315394;
                          v345 = "updateThread";
                          v346 = 1024;
                          v347 = 3577;
                          _os_log_impl(&dword_219944000, v213, OS_LOG_TYPE_DEFAULT, "%s:%d  Error Reading Shutdown reason", v344, 0x12u);
                        }
                      }
                      else
                      {
                        ggctl_logShutdownReason2(v298, keys, 1u);
                        v211 = parseShutdownReason((__int16 *)input, (const UInt8 *)keys, v298);
                        if (v211)
                        {
                          v212 = v211;
                          if (v282)
                            CFShow(v211);
                          *(_QWORD *)&buf[8 * v181] = v212;
                          v354[v181++] = CFSTR("BatteryShutdownReason");
                        }
                        memset(input, 0, sizeof(input));
                        ggctl_logShutdownReason(v298, (uint64_t)input, 0);
                        *(_OWORD *)keys = 0u;
                        v349 = 0u;
                        v350 = 0u;
                        ggctl_logShutdownReason2(v298, keys, 0);
                      }
                      v2 = 0x2550A4000;
                      updateThread_oneTime = 1;
                      v179 = v269;
                    }
                    if (v179)
                    {
                      readIMAXAndSOCSmoothData(byte_253F338F6, v177, v298);
                      logBatteryDiagnosticData((uint64_t)updateThread_batteryInfo, v298, v284 != 0);
                    }
                    if (!U16)
                    {
                      v214 = CFDictionaryCreate(allocator, (const void **)v354, (const void **)buf, v181, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      if (v214)
                      {
                        v215 = v214;
                        if (v282)
                          CFShow(v214);
                        if (debug_polling)
                        {
                          v216 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)input = 136315650;
                            *(_QWORD *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3600;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v56;
                            _os_log_impl(&dword_219944000, v216, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d PUBLISHING BATTERY data", input, 0x18u);
                          }
                        }
                        v217 = v215;
                        U16 = IORegistryEntrySetCFProperties(v6, v215);
                        if (U16)
                        {
                          v276 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = U16;
                            _os_log_error_impl(&dword_219944000, v276, OS_LOG_TYPE_ERROR, "IORegistryEntrySetCFProperties(0x%x)", input, 8u);
                          }
                        }
                        CFRelease(v217);
                        ++debug_cnt_ut_sent;
                      }
                      else
                      {
                        v218 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)input = 136315650;
                          *(_QWORD *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3608;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v56;
                          _os_log_error_impl(&dword_219944000, v218, OS_LOG_TYPE_ERROR, "%s:%d  updatesDone=%d dictionary failed", input, 0x18u);
                        }
                        U16 = 0;
                      }
                      v2 = 0x2550A4000;
                    }
                    do
                      CFRelease(*(CFTypeRef *)&buf[8 * v181 - 8]);
                    while (v181-- > 1);
                    if (U16)
                      goto LABEL_439;
                    if (v293)
                    {
                      if ((v281 & 1) != 0)
                      {
                        S16 = controlReadS16(v298, 25, 0);
                        if (S16)
                        {
                          v221 = S16;
                          v222 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = v221;
                            _os_log_error_impl(&dword_219944000, v222, OS_LOG_TYPE_ERROR, "CCA: usermode cannot disable DLOG (%#x)", input, 8u);
                          }
                          LOBYTE(v281) = 1;
                        }
                        else
                        {
                          LOBYTE(v281) = 0;
                          *(_DWORD *)(v287 + 24) = 0;
                          *(_DWORD *)(v287 + 16) = 0;
                          *(_QWORD *)(v287 + 8) = 0;
                        }
                        goto LABEL_516;
                      }
                      LOBYTE(v281) = 0;
LABEL_517:
                      if (*(_DWORD *)(v2 + 2664))
                      {
                        *(_DWORD *)(v2 + 2664) = 0;
                        v253 = logger;
                        v254 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if (v57 == 0.0)
                        {
                          if (v254)
                          {
                            *(_WORD *)input = 0;
                            v255 = v253;
                            v256 = "gasgauge success after previous failure";
                            v257 = 2;
                            goto LABEL_523;
                          }
                        }
                        else if (v254)
                        {
                          v258 = CFAbsoluteTimeGetCurrent();
                          *(_DWORD *)input = 134217984;
                          *(double *)&input[4] = v258 - v57;
                          v255 = v253;
                          v256 = "gasgauge success after previous %gs failure";
                          v257 = 12;
LABEL_523:
                          _os_log_impl(&dword_219944000, v255, OS_LOG_TYPE_DEFAULT, v256, input, v257);
                        }
                      }
                      v57 = CFAbsoluteTimeGetCurrent();
                      v54 = 0;
                      v55 = 0;
                      word_253F33916 = word_253F33862;
                      word_253F33918 = word_253F3386A;
                      dword_253F3391A = *(_DWORD *)&word_253F33864;
                      word_253F3391E = word_253F3386C;
                      ++v56;
                      goto LABEL_444;
                    }
                    if ((unsigned __int16)word_253F3385E < 0x132u)
                      goto LABEL_517;
                    if ((v279 & 1) != 0)
                    {
                      v223 = time(0);
                      if (v223 < v277)
                      {
                        v224 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)input = 134217984;
                          *(_QWORD *)&input[4] = v277;
                          v225 = v224;
                          v226 = "CCA: wait for deadline now=%lu";
                          goto LABEL_475;
                        }
                        goto LABEL_476;
                      }
                      v228 = v223;
                      if ((unsigned __int16)word_253F3385E < 0x600u)
                      {
                        LOWORD(keys[0]) = 0;
                        v234 = controlReadU16(v298, 0, keys);
                        if (v234)
                        {
                          v235 = v234;
                          v236 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = v235;
                            _os_log_error_impl(&dword_219944000, v236, OS_LOG_TYPE_ERROR, "CCA: cannot read DLOG status (%#x)", input, 8u);
                          }
                          goto LABEL_476;
                        }
                        v237 = (__int16)keys[0];
                        v230 = logger;
                        v238 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v237 & 0x800) != 0)
                        {
                          if (!v238)
                            goto LABEL_476;
                          goto LABEL_474;
                        }
                        if (v238)
                        {
                          *(_DWORD *)input = 67109376;
                          *(_DWORD *)&input[4] = v56;
                          *(_WORD *)&input[8] = 2048;
                          *(_QWORD *)&input[10] = v228;
                          v232 = v230;
                          v233 = "CCA: re-enable DLOG updatesDone=%d, now=%lu";
LABEL_471:
                          _os_log_impl(&dword_219944000, v232, OS_LOG_TYPE_DEFAULT, v233, input, 0x12u);
                        }
LABEL_472:
                        v227 = 0;
                        v277 = 0;
                      }
                      else
                      {
                        v229 = word_253F33892;
                        v230 = logger;
                        v231 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v229 & 0x20) == 0)
                        {
                          if (v231)
                          {
                            *(_DWORD *)input = 67109376;
                            *(_DWORD *)&input[4] = v56;
                            *(_WORD *)&input[8] = 2048;
                            *(_QWORD *)&input[10] = v228;
                            v232 = v230;
                            v233 = "CCA: re-enable DLOG updatesDone=%u, now=%lu";
                            goto LABEL_471;
                          }
                          goto LABEL_472;
                        }
                        if (!v231)
                          goto LABEL_476;
LABEL_474:
                        *(_DWORD *)input = 134217984;
                        *(_QWORD *)&input[4] = v228;
                        v225 = v230;
                        v226 = "CCA: GasGauge still calibrating now=%lu";
LABEL_475:
                        _os_log_impl(&dword_219944000, v225, OS_LOG_TYPE_DEFAULT, v226, input, 0xCu);
LABEL_476:
                        v227 = 1;
                      }
                    }
                    else
                    {
                      v227 = 0;
                    }
                    if ((v281 & 1) != 0)
                    {
                      if (*(_DWORD *)(v287 + 4))
                        goto LABEL_484;
                      v239 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        v240 = *(_DWORD *)(v287 + 4);
                        *(_DWORD *)input = 67109120;
                        *(_DWORD *)&input[4] = v240;
                        _os_log_impl(&dword_219944000, v239, OS_LOG_TYPE_DEFAULT, "disabling DLOG (num_clients=%i)", input, 8u);
                      }
                      v241 = controlReadS16(v298, 25, 0);
                      if (v241)
                      {
                        v242 = v241;
                        v243 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)input = 67109120;
                          *(_DWORD *)&input[4] = v242;
                          _os_log_error_impl(&dword_219944000, v243, OS_LOG_TYPE_ERROR, "cannot disable DLOG (%#x)", input, 8u);
                        }
LABEL_484:
                        v281 = 1;
                      }
                      else
                      {
                        v281 = 0;
                        *(_DWORD *)(v287 + 24) = 0;
                        *(_DWORD *)(v287 + 16) = 0;
                        *(_QWORD *)(v287 + 8) = 0;
                      }
                    }
                    else
                    {
                      v281 = 0;
                    }
                    if (*(_DWORD *)(v287 + 4))
                      v244 = v227;
                    else
                      v244 = 1;
                    if ((v244 & 1) == 0)
                    {
                      if (!v56 || v281 != 1)
                      {
                        v245 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          v246 = *(_DWORD *)(v287 + 4);
                          *(_DWORD *)input = 67109376;
                          *(_DWORD *)&input[4] = v56;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = v246;
                          _os_log_impl(&dword_219944000, v245, OS_LOG_TYPE_DEFAULT, "gathering data log updatesDone=%d num_clients=%d", input, 0xEu);
                        }
                      }
                      if ((*(_DWORD *)(v287 + 4) & 0x80000000) != 0
                        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        updateThread_cold_4(&v307, v308);
                      }
                      if (drainDataLog(v298))
                      {
                        v247 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          updateThread_cold_3(v342, v343, v247);
                      }
                      v281 = 1;
                    }
                    if ((v227 & 1) != 0)
                    {
                      v248 = 1;
                    }
                    else if ((unsigned __int16)word_253F3385E < 0x600u)
                    {
                      v248 = v261;
                      if ((unsigned __int16)word_253F3385E <= 0x501u)
                        v248 = 0;
                    }
                    else
                    {
                      v248 = ((unsigned __int16)word_253F33892 >> 5) & 1;
                    }
                    v279 = v248;
                    if ((v281 & v248) == 1)
                    {
                      v249 = controlReadS16(v298, 25, 0);
                      if (v249)
                      {
                        v250 = v249;
                        v251 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)input = 67109120;
                          *(_DWORD *)&input[4] = v250;
                          _os_log_error_impl(&dword_219944000, v251, OS_LOG_TYPE_ERROR, "CCA: cannot disable DLOG (%#x)", input, 8u);
                        }
                        v279 = 0;
                        LOBYTE(v281) = 1;
                      }
                      else
                      {
                        *(_DWORD *)(v287 + 16) = 0;
                        *(_QWORD *)(v287 + 8) = 0;
                        v277 = time(0) + 20;
                        v252 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)input = 67109376;
                          *(_DWORD *)&input[4] = v56;
                          *(_WORD *)&input[8] = 2048;
                          *(_QWORD *)&input[10] = v277;
                          _os_log_impl(&dword_219944000, v252, OS_LOG_TYPE_DEFAULT, "CCA: disabled DLOG updatesDone=%d ccaDeadline=%lu", input, 0x12u);
                        }
                        LOBYTE(v281) = 0;
                        v279 = 1;
                      }
                    }
                    v3 = 0x253F33000uLL;
LABEL_516:
                    v2 = 0x2550A4000uLL;
                    goto LABEL_517;
                  }
LABEL_203:
                  if (debug_polling)
                  {
                    v101 = *(NSObject **)(v3 + 2064);
                    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)input = 136315650;
                      *(_QWORD *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3146;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v56;
                      _os_log_impl(&dword_219944000, v101, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d READING FLAGS", input, 0x18u);
                    }
                  }
                  v102 = hdqReadU16(v298, 10, &word_253F33892);
                  v103 = 0;
                  v270 = v102;
                  if (v102 || (unsigned __int16)word_253F33892 == 0xFFFF)
                  {
                    v104 = v273;
                  }
                  else
                  {
                    v104 = v273;
                    if (((v290 ^ 1) & 1) == 0)
                    {
                      if (word_253F339BC)
                      {
                        v268 = 0;
                        if ((v292 & 0x20) != 0)
                        {
                          v105 = v283
                              && (unsigned __int16)(word_253F339BC & word_253F33892) == (unsigned __int16)word_253F339BC;
                          v283 = (unsigned __int16)(word_253F339BC & word_253F33892) == (unsigned __int16)word_253F339BC;
                        }
                        else
                        {
                          v105 = (unsigned __int16)(word_253F339BC & word_253F33892) == (unsigned __int16)word_253F339BC;
                        }
                      }
                      else if (v56 && dword_253F339C0 >= word_253F33862)
                      {
                        v268 = 0;
                        v105 = 1;
                      }
                      else
                      {
                        v105 = ((unsigned __int16)word_253F33892 >> 2) & 1;
                        v268 = 1;
                      }
                      if (debug_polling)
                      {
                        v114 = *(NSObject **)(v3 + 2064);
                        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                        {
                          v115 = UpSeconds();
                          *(_DWORD *)input = 136317186;
                          *(_QWORD *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3178;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v56;
                          *(_WORD *)&input[24] = 1024;
                          *(_DWORD *)&input[26] = v105;
                          *(_WORD *)&input[30] = 1024;
                          *(_DWORD *)&input[32] = v300;
                          v3 = 0x253F33000uLL;
                          *(_WORD *)&input[36] = 2048;
                          *(_QWORD *)&input[38] = v115;
                          *(_WORD *)&input[46] = 1024;
                          *(_DWORD *)&input[48] = v339;
                          LOWORD(v352) = 1024;
                          *(_DWORD *)((char *)&v352 + 2) = dword_253F339C0;
                          HIWORD(v352) = 1024;
                          v353 = word_253F33862;
                          _os_log_impl(&dword_219944000, v114, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu cfd=%d cfd-voltage=%d batteryInfo.voltage=%d", input, 0x40u);
                        }
                      }
                      if (!v339)
                        goto LABEL_263;
                      v116 = UpSeconds();
                      if (v116 <= v339)
                      {
                        if (!v56)
                          goto LABEL_532;
                        v119 = word_253F33862;
                        if (dword_253F339C0 >= word_253F33862)
                        {
                          v122 = v116;
                          v123 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)input = 136316162;
                            *(_QWORD *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3201;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v56;
                            *(_WORD *)&input[24] = 2048;
                            *(_QWORD *)&input[26] = v122;
                            *(_WORD *)&input[34] = 1024;
                            *(_DWORD *)&input[36] = v119;
                            _os_log_impl(&dword_219944000, v123, OS_LOG_TYPE_DEFAULT, "%s:%d updatesDone=%d UpSeconds=%llu voltage=%d (low)", input, 0x28u);
                          }
                          v268 = 0;
                          v105 = 1;
                          v3 = 0x253F33000uLL;
                          goto LABEL_263;
                        }
                        v3 = 0x253F33000uLL;
                        if (v300)
                        {
LABEL_532:
                          if (debug_polling)
                          {
                            if (v105)
                            {
                              v120 = *(NSObject **)(v3 + 2064);
                              if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
                              {
                                v121 = UpSeconds();
                                *(_DWORD *)input = 136315906;
                                *(_QWORD *)&input[4] = "updateThread";
                                *(_WORD *)&input[12] = 1024;
                                *(_DWORD *)&input[14] = 3209;
                                *(_WORD *)&input[18] = 2048;
                                *(_QWORD *)&input[20] = v121;
                                *(_WORD *)&input[28] = 1024;
                                *(_DWORD *)&input[30] = v339;
                                _os_log_impl(&dword_219944000, v120, OS_LOG_TYPE_DEFAULT, "%s:%d UpSeconds=%llu (cfd = %u) forcing critical to 0", input, 0x22u);
                              }
                            }
                          }
                          if (!v268)
                            v105 = 0;
                          v268 = v268 << 31 >> 31;
                        }
                      }
                      else if (debug_polling)
                      {
                        v117 = *(NSObject **)(v3 + 2064);
                        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                        {
                          v118 = UpSeconds();
                          *(_DWORD *)input = 136315906;
                          *(_QWORD *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3191;
                          *(_WORD *)&input[18] = 2048;
                          *(_QWORD *)&input[20] = v118;
                          *(_WORD *)&input[28] = 1024;
                          *(_DWORD *)&input[30] = v339;
                          _os_log_impl(&dword_219944000, v117, OS_LOG_TYPE_DEFAULT, "%s:%d deadline expired at UpSeconds=%llu (cfd = %u)", input, 0x22u);
                        }
                      }
LABEL_263:
                      if (!word_253F339BC)
                      {
                        v326 = v268;
                        *(_QWORD *)((unint64_t)buf | (8 * v273)) = CFNumberCreate(allocator, kCFNumberIntType, &v326);
                        *(_QWORD *)((unint64_t)v354 & 0xFFFFFFFFFFFFFFF7 | (8 * (v273 & 1))) = CFSTR("SOCBasedShutdown");
                        v104 = v273 + 1;
                      }
                      if (debug_polling)
                      {
                        if (v105)
                        {
                          v124 = *(NSObject **)(v3 + 2064);
                          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                          {
                            v125 = UpSeconds();
                            *(_DWORD *)input = 136316674;
                            *(_QWORD *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3227;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v56;
                            *(_WORD *)&input[24] = 1024;
                            *(_DWORD *)&input[26] = 1;
                            *(_WORD *)&input[30] = 1024;
                            *(_DWORD *)&input[32] = v300;
                            v3 = 0x253F33000uLL;
                            *(_WORD *)&input[36] = 2048;
                            *(_QWORD *)&input[38] = v125;
                            *(_WORD *)&input[46] = 1024;
                            *(_DWORD *)&input[48] = word_253F33862;
                            _os_log_impl(&dword_219944000, v124, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu batteryInfo.voltage=%d", input, 0x34u);
                          }
                        }
                      }
                      v103 = v105 != 0;
                      v2 = 0x2550A4000;
                    }
                  }
                  if ((v70 & 1) == 0 || (v288 > 2 ? (v126 = 1) : (v126 = v103), (v126 & 1) != 0 || v55))
                  {
                    v269 = v103;
                    v288 = 0;
                    goto LABEL_280;
                  }
                  ++v288;
                  v127 = *(NSObject **)(v3 + 2064);
                  if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)input = 0;
                    _os_log_impl(&dword_219944000, v127, OS_LOG_TYPE_INFO, "flags update only", input, 2u);
                  }
                  v54 = 0;
                  v55 = 0;
LABEL_444:
                  v60 = v298;
                }
              }
              else
              {
                v90 = CFPreferencesCopyValue(CFSTR("ResetEnabled"), CFSTR("com.apple.gasgauge"), v296, v295);
                v91 = os_log_type_enabled(*(os_log_t *)(v3 + 2064), OS_LOG_TYPE_ERROR);
                if (v90 == v289)
                {
                  v92 = v298;
                  if (v91)
                    updateThread_cold_5(&v331, v332);
                }
                else
                {
                  if (v91)
                    updateThread_cold_6(&v329, v330);
                  v92 = v298;
                  ggctl_reset(v298, 1u);
                }
                v54 = 0;
                ++v55;
                v60 = v92;
              }
            }
          }
        }
        else
        {
          v54 = 0;
LABEL_166:
          v60 = -1;
        }
      }
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      updateThread_cold_1();
  }
  return 0;
}

uint64_t batteryThread(unsigned int a1)
{
  updateThread(a1);
  return 0;
}

uint64_t GGEventInstall()
{
  uint64_t result;
  uint64_t v1;
  NSObject *global_queue;
  NSObject *v3;
  _QWORD v4[6];
  stat v5;

  memset(&v5, 0, sizeof(v5));
  result = stat("/dev/cu.gas-gauge", &v5);
  if (!(_DWORD)result)
  {
    EnableFullSleepForRevCOrLater(0);
    result = os_transaction_create();
    if (result)
    {
      v1 = result;
      global_queue = dispatch_get_global_queue(0, 0);
      v3 = dispatch_source_create(MEMORY[0x24BDACA08], 0xFuLL, 0, global_queue);
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 0x40000000;
      v4[2] = __GGEventInstall_block_invoke;
      v4[3] = &__block_descriptor_tmp;
      v4[4] = v1;
      v4[5] = v3;
      dispatch_source_set_event_handler(v3, v4);
      dispatch_resume(v3);
      return startUpdateThread(0);
    }
  }
  return result;
}

uint64_t EnableFullSleepForRevCOrLater(int a1)
{
  uint64_t result;
  mach_port_t v3;
  size_t v4;
  unsigned __int16 v5;
  _OWORD outputStruct[9];
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
  size_t outputStructCnt;

  result = ggctl_connect(0);
  if ((_DWORD)result)
  {
    v3 = result;
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
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    memset(outputStruct, 0, sizeof(outputStruct));
    outputStructCnt = 352;
    result = IOConnectCallStructMethod(result, 2u, 0, 0, outputStruct, &outputStructCnt);
    if (v3 != -1)
    {
      if (DWORD2(v7))
      {
        outputStructCnt = 0;
        if (IOConnectCallScalarMethod(v3, 0x10u, &outputStructCnt, 1u, 0, 0))
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
            EnableFullSleepForRevCOrLater_cold_5();
        }
      }
      if (IOConnectCallScalarMethod(v3, 6u, 0, 0, 0, 0))
      {
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
          EnableFullSleepForRevCOrLater_cold_4();
      }
      else
      {
        v5 = -1;
        if ((getFWVersion(v3, (__int16 *)&v5) & 0x80000000) != 0
          && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        {
          EnableFullSleepForRevCOrLater_cold_3();
        }
        if (v5 >= 0x310u)
        {
          v4 = a1 ? 16 : 19;
          outputStructCnt = v4;
          if (IOConnectCallScalarMethod(v3, 0xAu, &outputStructCnt, 1u, 0, 0))
          {
            if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
              EnableFullSleepForRevCOrLater_cold_2();
          }
        }
      }
      if (DWORD2(v7))
      {
        outputStructCnt = 1;
        if (IOConnectCallScalarMethod(v3, 0x10u, &outputStructCnt, 1u, 0, 0))
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
            EnableFullSleepForRevCOrLater_cold_1();
        }
      }
      return IOServiceClose(v3);
    }
  }
  return result;
}

double ggctl_logShutdownDLog(mach_port_t a1, uint64_t a2, unsigned int a3)
{
  kern_return_t v4;
  double result;
  __int128 v6;
  uint64_t v7;
  uint64_t input;
  size_t v9;
  __int128 outputStruct;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v9 = 40;
  if ((a3 & 1) != 0)
  {
    if (!a2)
      return result;
    v12 = 0;
    outputStruct = 0u;
    v11 = 0u;
    v7 = a3;
    v4 = IOConnectCallMethod(a1, 0x12u, &v7, 1u, 0, 0, 0, 0, &outputStruct, &v9);
  }
  else
  {
    if (!a2)
      return result;
    v12 = 0;
    outputStruct = 0u;
    v11 = 0u;
    input = a3;
    v4 = IOConnectCallMethod(a1, 0x12u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v9);
  }
  if (!v4)
  {
    result = *(double *)&outputStruct;
    v6 = v11;
    *(_OWORD *)a2 = outputStruct;
    *(_OWORD *)(a2 + 16) = v6;
    *(_QWORD *)(a2 + 32) = v12;
  }
  return result;
}

uint64_t getSInt32ForKey(CFStringRef key, _DWORD *a2)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v4;
  CFTypeID TypeID;
  int Value;
  uint64_t result;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(service, key, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v4 = CFProperty;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      Value = CFNumberGetValue(v4, kCFNumberSInt32Type, a2);
      CFRelease(v4);
      if (Value)
        return 0;
    }
    else
    {
      CFRelease(v4);
    }
  }
  result = 0xFFFFFFFFLL;
  *a2 = -1;
  return result;
}

void setUPOData(const __CFString *a1, int a2)
{
  CFMutableDictionaryRef v3;
  __CFDictionary *v4;
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  io_service_t MatchingService;
  io_registry_entry_t v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  int valuePtr;
  int v14;

  v14 = a2;
  v3 = IOServiceMatching("IOService");
  if (v3)
  {
    v4 = v3;
    valuePtr = 0;
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
    v6 = CFDictionaryCreate(v5, (const void **)&setUPOData_tmp, (const void **)&v12, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(v4, CFSTR("IOPropertyMatch"), v6);
      CFRelease(v7);
      MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v4);
      if (!MatchingService)
        return;
      v9 = MatchingService;
      v10 = CFNumberCreate(v5, kCFNumberSInt32Type, &v14);
      IORegistryEntrySetCFProperty(v9, a1, v10);
      IOObjectRelease(v9);
      v11 = v10;
    }
    else
    {
      v11 = v4;
    }
    CFRelease(v11);
  }
}

uint64_t ggctl_logShutdownReason2(uint64_t result, _OWORD *a2, unsigned int a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t input;
  uint64_t v7;
  size_t v8;
  __int128 outputStruct;
  __int128 v10;
  __int128 v11;
  _OWORD inputStruct[3];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 48;
  if (a2)
  {
    if ((a3 & 1) != 0)
    {
      v10 = 0u;
      v11 = 0u;
      outputStruct = 0u;
      input = a3;
      result = IOConnectCallMethod(result, 0x13u, &input, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
      if (!(_DWORD)result)
      {
        v4 = v10;
        *a2 = outputStruct;
        a2[1] = v4;
        a2[2] = v11;
      }
    }
    else
    {
      v5 = a2[1];
      inputStruct[0] = *a2;
      inputStruct[1] = v5;
      inputStruct[2] = a2[2];
      v7 = a3;
      return IOConnectCallMethod(result, 0x13u, &v7, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
    }
  }
  return result;
}

uint64_t iokit_callback(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_DWORD *)result = a3;
  *(_QWORD *)(result + 8) = a4;
  return result;
}

void getUPOData(CFStringRef key, void *a2)
{
  io_registry_entry_t v4;
  CFAllocatorRef *v5;
  CFMutableDictionaryRef v6;
  __CFDictionary *v7;
  const __CFAllocator *v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  CFTypeRef CFProperty;
  const void *v12;
  CFTypeID TypeID;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = find_pmu_pmu_service;
  v5 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (find_pmu_pmu_service)
    goto LABEL_7;
  v6 = IOServiceMatching("IOService");
  if (v6)
  {
    v7 = v6;
    v15 = 0;
    v8 = *v5;
    find_pmu_zero_number = (uint64_t)CFNumberCreate(*v5, kCFNumberSInt32Type, &v15);
    v9 = CFDictionaryCreate(v8, (const void **)&find_pmu_tmp, (const void **)&find_pmu_zero_number, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (v9)
    {
      v10 = v9;
      CFDictionarySetValue(v7, CFSTR("IOPropertyMatch"), v9);
      CFRelease(v10);
      find_pmu_pmu_service = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v7);
    }
    else
    {
      CFRelease(v7);
    }
  }
  v4 = find_pmu_pmu_service;
  if (find_pmu_pmu_service)
  {
LABEL_7:
    CFProperty = IORegistryEntryCreateCFProperty(v4, key, *v5, 0);
    if (CFProperty)
    {
      v12 = CFProperty;
      TypeID = CFNumberGetTypeID();
      if (TypeID != CFGetTypeID(v12) || !CFNumberGetValue((CFNumberRef)v12, kCFNumberSInt32Type, a2))
      {
        v14 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315394;
          v16 = "/Library/Caches/com.apple.xbs/Sources/AppleHDQGasGauge/AppleHDQGasGauge.c";
          v17 = 1024;
          v18 = 2348;
          _os_log_impl(&dword_219944000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d cannot read upo data", (uint8_t *)&v15, 0x12u);
        }
      }
      CFRelease(v12);
    }
  }
}

void updateThermalCoolDownState(io_registry_entry_t a1, int a2)
{
  const __CFAllocator *v4;
  void **v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "ThermalCoolDown", 0x8000100u);
  v5 = (void **)MEMORY[0x24BDBD270];
  if (!a2)
    v5 = (void **)MEMORY[0x24BDBD268];
  values = *v5;
  v6 = CFDictionaryCreate(v4, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v6)
  {
    v7 = v6;
    IORegistryEntrySetCFProperties(a1, v6);
    CFRelease(v7);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    updateThermalCoolDownState_cold_1();
  }
}

void statsAndLogs(io_registry_entry_t a1, int a2)
{
  const __CFAllocator *v4;
  const void *v5;
  CFIndex v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  void *values;
  CFTypeRef cf;
  void *keys;
  CFStringRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  cf = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  keys = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "stats", 0x8000100u);
  v5 = (const void *)*MEMORY[0x24BDBD268];
  values = (void *)*MEMORY[0x24BDBD268];
  if (a2)
  {
    v12 = CFStringCreateWithCString(v4, "log", 0x8000100u);
    cf = v5;
    v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  v7 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, v6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v7)
  {
    v8 = v7;
    if (IORegistryEntrySetCFProperties(a1, v7) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      statsAndLogs_cold_2();
    CFRelease(v8);
    CFRelease(values);
    if (a2)
      CFRelease(cf);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    statsAndLogs_cold_1();
  }
}

void debugLog(io_registry_entry_t a1, int a2)
{
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  int valuePtr;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  valuePtr = a2;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "debug", 0x8000100u);
  values = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  v4 = CFDictionaryCreate(v3, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v4)
  {
    v5 = v4;
    if (IORegistryEntrySetCFProperties(a1, v4))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        debugLog_cold_2();
    }
    CFRelease(v5);
    CFRelease(values);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    debugLog_cold_1();
  }
}

uint64_t readChargeTable(mach_port_t a1, __CFData **a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  char *p_outputStruct;
  char v15;
  int v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  __CFData *Mutable;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  UInt8 *MutableBytePtr;
  UInt8 *v28;
  char *v29;
  UInt8 *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  unsigned __int8 outputStruct;
  unsigned __int8 v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  _BYTE v48[34];

  *(_QWORD *)&v48[26] = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  if (!dword_253F33934)
    return 0;
  v3 = 0xFFFFFFFFLL;
  if (!ggctl_readBlock(a1, -1, dword_253F33934, &outputStruct, 0))
  {
    v4 = v47;
    if (v47 == 255)
    {
      v9 = outputStruct;
      v10 = (unint64_t)outputStruct >> 4;
      v11 = 6 * v10 + 4;
      if (outputStruct <= 0x4FuLL)
      {
        v13 = 0;
        v37 = v46;
        p_outputStruct = (char *)&outputStruct;
        do
        {
          v15 = *p_outputStruct++;
          v13 += v15;
          --v11;
        }
        while (v11);
        v16 = v13;
        if (v13)
        {
          v17 = logger;
          v3 = 0;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109632;
            v39 = v16;
            v40 = 1024;
            v41 = v45;
            v42 = 1024;
            v43 = 256 - (v16 - v45);
            v6 = "gas gauge charge table bad checksum: checksum %#x checksum byte %#x expecting %#x";
            v7 = v17;
            v8 = 20;
            goto LABEL_14;
          }
        }
        else
        {
          v19 = (unint64_t)v46 >> 4;
          v20 = 4 * v19 + 8;
          Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], v20 * (unint64_t)v10);
          CFDataSetLength(Mutable, v20 * (unint64_t)v10);
          if (v9 >= 0x10)
          {
            v22 = 0;
            if (v19 <= 1)
              v23 = 1;
            else
              v23 = v19;
            v36 = v23;
            if (v10 <= 1)
              v24 = 1;
            else
              v24 = v10;
            v25 = v48;
            v26 = 10;
            do
            {
              MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
              v28 = &MutableBytePtr[v22 * v20];
              v29 = (char *)(&outputStruct + 6 * v22);
              *(_WORD *)v28 = 100 * v29[4];
              *((_WORD *)v28 + 1) = 100 * v29[5];
              *((_DWORD *)v28 + 1) = v19;
              if (v37 >= 0x10)
              {
                v30 = &MutableBytePtr[v26];
                v31 = v19 - 1;
                v32 = v36;
                v33 = v25;
                do
                {
                  if (v31)
                    v34 = updateThread_batteryInfo[(*v33 & 0xF) + 64];
                  else
                    LOWORD(v34) = -1;
                  *((_WORD *)v30 - 1) = v34;
                  v35 = *v33++;
                  *(_WORD *)v30 = *(int *)((char *)&updateThread_batteryInfo[80] + (((unint64_t)v35 >> 2) & 0x3C));
                  v30 += 4;
                  --v31;
                  --v32;
                }
                while (v32);
              }
              ++v22;
              v26 += v20;
              v25 += 6;
            }
            while (v22 != v24);
          }
          v3 = 0;
          *a2 = Mutable;
        }
      }
      else
      {
        v12 = logger;
        v3 = 0;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v39 = v10;
          v40 = 1024;
          v41 = 6 * v10 + 4;
          v6 = "gas gauge charge table inconsistent: %d data entries, %d bytes";
          v7 = v12;
          v8 = 14;
          goto LABEL_14;
        }
      }
    }
    else
    {
      v5 = logger;
      v3 = 0;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v39 = v4;
        v6 = "gas gauge charge table invalid type: %#x";
        v7 = v5;
        v8 = 8;
LABEL_14:
        _os_log_impl(&dword_219944000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t readRemainingCapacity__(_WORD *a1, int *a2, mach_port_t a3)
{
  int v6;
  unsigned __int16 v8;

  v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (v8 <= 0x118u)
    v6 = *a2;
  else
    v6 = 50;
  return hdqReadS16(a3, v6, a1);
}

uint64_t readFAC__(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  __int16 v6;

  v6 = 0;
  if ((getFWVersion(a3, &v6) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (v6 == 1536)
    return 0;
  return hdqReadU16(a3, 14, a1);
}

uint64_t readBatteryData(uint64_t a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t Register;
  unsigned __int16 v10;

  v10 = 0;
  if ((getFWVersion(a3, (__int16 *)&v10) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if ((int)a2 >= 1)
  {
    v6 = 0;
    v7 = v10;
    while (1)
    {
      if (*(_DWORD *)(a1 + 4) == -1)
        return v6;
      if (registerName(a1, v7))
      {
        Register = readRegister(*(_WORD **)(a1 + 56), a1, a3);
        if ((Register & 0x80000000) != 0)
          break;
      }
      ++v6;
      a1 += 80;
      if (a2 == v6)
        return a2;
    }
    return Register;
  }
  return a2;
}

void calculateBatteryHealthMetric()
{
  uint64_t v0;
  float v1;
  float v2;
  float v3;

  if ((unsigned __int16)word_253F3385E >= 0x600u)
  {
    v0 = 0;
    v1 = (double)(bswap32((unsigned __int16)word_253F338D8) >> 16) * 0.137995
       + (double)(bswap32((unsigned __int16)word_253F338D6) >> 16) * 0.0693069
       + (double)(bswap32((unsigned __int16)word_253F338DA) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_253F338DC) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_253F338DE) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_253F338E0) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_253F338E2) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_253F338E4) >> 16) * 0.0872525
       + (double)(bswap32((unsigned __int16)word_253F338E6) >> 16) * 0.0185644;
    word_253F3392C = (int)v1;
    while (battery_health_metric_config[v0] != word_253F33858)
    {
      v0 += 4;
      if (v0 == 68)
      {
        v2 = 0.0;
        goto LABEL_7;
      }
    }
    v2 = (float)*(unsigned int *)&battery_health_metric_config[v0 + 2];
LABEL_7:
    v3 = (float)(v2 * v1) / 1000.0;
    word_253F3392E = (int)v3;
    if (dword_253F33928 < (int)v3)
    {
      dword_253F33928 = (int)v3;
      setUPOData(CFSTR("IOPMUBootBatteryHealthMetric"), (int)v3);
    }
  }
}

CFDictionaryRef readChargerData(int a1, int a2, mach_port_t a3)
{
  const __CFAllocator *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  CFDictionaryRef v10;
  CFNumberRef v11;
  uint64_t v12;
  CFNumberRef v13;
  uint64_t v14;
  CFNumberRef v15;
  uint64_t v16;
  unint64_t v17;
  time_t v19;
  void *keys[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *values[9];

  values[8] = *(void **)MEMORY[0x24BDAC8D0];
  if (readBatteryData((uint64_t)&readChargerData_chargerRegs, 5, a3) != 5)
    return 0;
  memset(&values[2], 0, 48);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt8Type, &readChargerData_notChargingReason);
  keys[0] = CFSTR("NotChargingReason");
  values[1] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerAlert);
  keys[1] = CFSTR("ChargerAlert");
  if (!a1)
    goto LABEL_11;
  v7 = readChargerData_notChargingReason & 0x10;
  if (a2)
  {
    if ((readChargerData_notChargingReason & 0x10) != 0)
    {
      v7 = (readChargerData_notChargingReason >> 4) & 1;
      LOWORD(v19) = 0;
      if ((hdqReadU16(a3, 52, &v19) & 0x80000000) == 0)
      {
        v8 = 1717986919 * byte_253F33860 * word_253F3385A;
        if ((int)((v8 >> 34) + ((unint64_t)v8 >> 63)) > (unsigned __int16)v19)
          v7 = 0;
      }
    }
  }
  if (v7)
  {
    values[2] = *(void **)MEMORY[0x24BDBD270];
    *(_QWORD *)&v21 = CFSTR("ChargerTimeout");
    v9 = 3;
  }
  else
  {
LABEL_11:
    v9 = 2;
  }
  if ((readChargerData_notChargingReason & 0x20) != 0)
  {
    values[v9] = (void *)*MEMORY[0x24BDBD270];
    keys[v9++] = CFSTR("ChargerWatchdogTimeout");
  }
  values[v9] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingCurrent);
  keys[v9] = CFSTR("ChargingCurrent");
  v11 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingVoltage);
  v12 = 8 * v9 + 8;
  *(void **)((char *)values + v12) = v11;
  *(void **)((char *)keys + v12) = CFSTR("ChargingVoltage");
  v13 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerStatus);
  v14 = 8 * v9 + 16;
  *(void **)((char *)values + v14) = v13;
  *(void **)((char *)keys + v14) = CFSTR("ChargerStatus");
  v19 = time(0);
  v15 = CFNumberCreate(v6, kCFNumberLongType, &v19);
  v16 = 8 * v9 + 24;
  *(void **)((char *)values + v16) = v15;
  *(void **)((char *)keys + v16) = CFSTR("UpdateTime");
  v10 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, v9 + 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  do
  {
    CFRelease(values[v9 + 3]);
    v17 = v9 + 4;
    --v9;
  }
  while (v17 > 1);
  return v10;
}

CFDictionaryRef dynamicATV(mach_port_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  const __CFAllocator *v12;
  int v13;
  unint64_t v14;
  CFDictionaryRef v15;
  const __CFString *v18;
  const __CFString *v19;
  void *values;
  CFNumberRef v21;
  uint64_t input[2];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v19 = 0;
  *(_OWORD *)input = xmmword_21994F1A0;
  v23 = 0;
  if (IOConnectCallScalarMethod(a1, 7u, input, 3u, 0, 0))
  {
    v1 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      dynamicATV_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
  v9 = word_253F3385C + (unsigned __int16)word_253F33866;
  v10 = word_253F3385A;
  if (v9 <= (__int16)(v10 + ((unsigned __int16)(v10 & 0x8000) >> 15)) >> 1)
    v11 = (__int16)(word_253F3385A + ((word_253F3385A & 0x8000u) >> 15)) >> 1;
  else
    v11 = word_253F3385C + (unsigned __int16)word_253F33866;
  if (v9 <= word_253F3385A)
    v10 = v11;
  dword_253F33884 = v10;
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &dword_253F33884);
  v18 = CFSTR("atvBatteryCapacityMA");
  if (dword_253F339D8)
  {
    v13 = determineVACVoltage();
    if (v13 != dword_253F33880)
      dword_253F33880 = v13;
    v21 = CFNumberCreate(v12, kCFNumberIntType, &dword_253F33880);
    v19 = CFSTR("atvAbsMaxVoltageMV");
    v14 = 2;
  }
  else
  {
    v14 = 1;
  }
  v15 = CFDictionaryCreate(v12, (const void **)&v18, (const void **)&values, v14, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  do
    CFRelease(*(&v19 + v14));
  while (v14-- > 1);
  return v15;
}

uint64_t determineVACVoltage()
{
  unsigned int v0;
  uint64_t v1;
  int *v3;
  unsigned __int16 v4;
  unsigned int v5;
  unsigned int v6;
  int v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  unsigned __int8 v12;
  __int16 v13;
  unsigned __int8 *v14;
  unsigned __int16 v15;
  BOOL v17;
  unint64_t v18;
  int *v19;
  unsigned __int16 v20;
  unsigned int v21;
  unsigned int v22;
  int v24;
  NSObject *v25;
  BOOL v26;
  unsigned int v27;
  uint64_t v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  NSObject *v34;
  int v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v0 = dword_253F33880;
  v1 = dword_253F339D8;
  if (dword_253F339D8)
  {
    if (determineVACVoltage_lastBatteryCycleCount != (unsigned __int16)word_253F3388C || dword_253F33880 == 0)
    {
      determineVACVoltage_lastBatteryCycleCount = (unsigned __int16)word_253F3388C;
      v3 = &dword_253F339DC;
      while (1)
      {
        v5 = *v3++;
        v4 = v5;
        v6 = HIWORD(v5);
        if (v5 < 0x10000 || v6 > (unsigned __int16)word_253F3388C)
          break;
        if (!--v1)
        {
          v8 = determineVACVoltage_vacBasedVoltageMV;
          if (determineVACVoltage_vacBasedVoltageMV)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      v8 = v4;
      if (v4)
        goto LABEL_17;
LABEL_16:
      v8 = LOWORD(updateThread_batteryInfo[dword_253F339D8 + 104]);
LABEL_17:
      determineVACVoltage_vacBasedVoltageMV = v8;
      v9 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 67109120;
        v38 = v8;
        _os_log_impl(&dword_219944000, v9, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vacBasedVoltageMV=%d", (uint8_t *)&v37, 8u);
        v8 = determineVACVoltage_vacBasedVoltageMV;
      }
      if (v0)
        v10 = 1;
      else
        v10 = v8 == 0;
      if (!v10)
        v0 = v8;
    }
  }
  v11 = dword_253F33A1C;
  if (dword_253F33A1C && (unsigned __int16)word_253F3385E >= 0x313u)
  {
    v12 = word_253F338C6;
    if ((unsigned __int16)word_253F3385E <= 0x500u)
      v13 = word_253F338C6;
    else
      v13 = word_253F338C4;
    v14 = (unsigned __int8 *)&word_253F338C6 + 1;
    if ((unsigned __int16)word_253F3385E > 0x500u)
      v14 = (unsigned __int8 *)&word_253F338C4 + 1;
    v15 = *v14 | (unsigned __int16)(v13 << 8);
    if ((unsigned __int16)word_253F3385E <= 0x500u)
      v12 = byte_253F338C8;
    if (v12 && v15 != 0)
    {
      if (determineVACVoltage_lastTimeAbove95 != v12
        || ((unsigned __int16)determineVACVoltage_lastToT == v15 ? (v17 = v0 == 0) : (v17 = 1), v17))
      {
        determineVACVoltage_lastTimeAbove95 = v12;
        determineVACVoltage_lastToT = v15;
        v18 = (42949673 * (unint64_t)(v12 * v15)) >> 32;
        v19 = &dword_253F33A20;
        while (1)
        {
          v21 = *v19++;
          v20 = v21;
          v22 = HIWORD(v21);
          if (v21 < 0x10000 || v18 < v22)
            break;
          if (!--v11)
          {
            v24 = determineVACVoltage_vac95BasedVoltageMV;
            if (determineVACVoltage_vac95BasedVoltageMV)
              goto LABEL_54;
            goto LABEL_53;
          }
        }
        v24 = v20;
        if (v20)
          goto LABEL_54;
LABEL_53:
        v24 = LOWORD(updateThread_batteryInfo[dword_253F33A1C + 121]);
LABEL_54:
        determineVACVoltage_vac95BasedVoltageMV = v24;
        v25 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 67109376;
          v38 = v24;
          v39 = 1024;
          v40 = v0;
          _os_log_impl(&dword_219944000, v25, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vac95BasedVoltageMV=%d absMaxVoltageMV=%d", (uint8_t *)&v37, 0xEu);
          v24 = determineVACVoltage_vac95BasedVoltageMV;
        }
        if (v0)
          v26 = 1;
        else
          v26 = v24 == 0;
        if (!v26)
          v0 = v24;
      }
    }
  }
  v27 = determineVACVoltage_vacBasedVoltageMV;
  if (determineVACVoltage_vacBasedVoltageMV >= v0 || determineVACVoltage_vacBasedVoltageMV == 0)
    v27 = v0;
  if (determineVACVoltage_vac95BasedVoltageMV >= v27 || determineVACVoltage_vac95BasedVoltageMV == 0)
    v30 = v27;
  else
    v30 = determineVACVoltage_vac95BasedVoltageMV;
  v31 = dword_253F33880;
  v32 = word_253F33862;
  if (dword_253F33880)
    v33 = v30 >= word_253F33862;
  else
    v33 = 1;
  if (v33)
    return v30;
  v34 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    v37 = 67109376;
    v38 = v32;
    v39 = 1024;
    v40 = v30;
    _os_log_impl(&dword_219944000, v34, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: waiting for vbat(%d) < vac(%d)", (uint8_t *)&v37, 0xEu);
    return dword_253F33880;
  }
  return v31;
}

uint64_t determinePoSMThreshold()
{
  __int16 *v0;
  unsigned __int8 *v1;
  __int16 *v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  int v15;
  _BOOL4 v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  unsigned int v24;
  unsigned int v26;
  NSObject *v29;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  int v34;
  uint8_t buf[4];
  _BOOL4 v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  if ((unsigned __int16)word_253F3385E <= 0x500u)
  {
    if ((unsigned __int16)word_253F3385E < 0x313u)
      return 0xFFFFFFFFLL;
    v2 = &word_253F338C6;
    v0 = (__int16 *)&byte_253F338C8;
    v1 = (unsigned __int8 *)&word_253F338C6 + 1;
  }
  else
  {
    v0 = &word_253F338C6;
    v1 = (unsigned __int8 *)&word_253F338C4 + 1;
    v2 = &word_253F338C4;
  }
  v3 = *v1 | (*(unsigned __int8 *)v2 << 8);
  v4 = *(unsigned __int8 *)v0;
  v5 = (unsigned __int16)dword_253F33A64;
  v6 = (unsigned __int16)dword_253F33A64 != 0;
  v7 = (unsigned __int16)word_253F33A68;
  v8 = word_253F33A68 != 0;
  v9 = (unsigned __int16)word_253F33A70;
  v10 = word_253F33A70 != 0;
  v11 = determinePoSMThreshold_lastBatteryCycleCount != (unsigned __int16)word_253F3388C
     && (unsigned __int16)dword_253F33A64 != 0;
  v12 = (unsigned __int16)determinePoSMThreshold_lastToT != v3 && word_253F33A68 != 0;
  v13 = determinePoSMThreshold_lastAbove95 != v4
     || (unsigned __int16)determinePoSMThreshold_lastToT != v3;
  v14 = determinePoSMThreshold_lastAbove95 != v4 && word_253F33A70 != 0;
  v32 = v11;
  v33 = v14;
  v15 = (unsigned __int16)dword_253F33A6C;
  v31 = (unsigned __int16)dword_253F33A6C != 0;
  if ((_WORD)dword_253F33A6C)
    v16 = v13;
  else
    v16 = 0;
  if (v11)
  {
    determinePoSMThreshold_lastBatteryCycleCount = (unsigned __int16)word_253F3388C;
    if ((unsigned __int16)word_253F3388C <= HIWORD(dword_253F33A64))
      v17 = -1;
    else
      v17 = dword_253F33A74;
    determinePoSMThreshold_vacThreshold = v17;
  }
  if (v12)
  {
    determinePoSMThreshold_lastToT = v3;
    if (v3 <= HIWORD(*(_DWORD *)&word_253F33A68))
      v18 = -1;
    else
      v18 = dword_253F33A78;
    determinePoSMThreshold_vacpThreshold = v18;
  }
  if (v16)
  {
    determinePoSMThreshold_lastToT = v3;
    determinePoSMThreshold_lastAbove95 = v4;
    if ((42949673 * (unint64_t)(v4 * v3)) >> 32 <= HIWORD(dword_253F33A6C))
      v19 = -1;
    else
      v19 = dword_253F33A7C;
    determinePoSMThreshold_vac95Threshold = v19;
  }
  v34 = (unsigned __int16)word_253F3388C;
  if (word_253F33A70)
  {
    determinePoSMThreshold_lastAbove95 = v4;
    if (v4 <= HIWORD(*(_DWORD *)&word_253F33A70))
    {
      v21 = 0x253F33000uLL;
      v20 = -1;
    }
    else
    {
      v20 = dword_253F33A80;
      v21 = 0x253F33000;
    }
    *(_DWORD *)(v21 + 2772) = v20;
  }
  else
  {
    v20 = determinePoSMThreshold_vac95pThreshold;
  }
  if (determinePoSMThreshold_vacThreshold == -1 || v5 == 0)
    v24 = -1;
  else
    v24 = determinePoSMThreshold_vacThreshold;
  if (determinePoSMThreshold_vacpThreshold >= v24 || v7 == 0)
    v26 = v24;
  else
    v26 = determinePoSMThreshold_vacpThreshold;
  if (determinePoSMThreshold_vac95Threshold < v26 && v15 != 0)
    v26 = determinePoSMThreshold_vac95Threshold;
  if (v20 >= v26 || v9 == 0)
    v22 = v26;
  else
    v22 = v20;
  v29 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    v36 = v6;
    v37 = 1024;
    v38 = v8;
    v39 = 1024;
    v40 = v31;
    v41 = 1024;
    v42 = v10;
    _os_log_impl(&dword_219944000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, enabled:%d %d %d %d ", buf, 0x1Au);
    v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    v36 = v32;
    v37 = 1024;
    v38 = v12;
    v39 = 1024;
    v40 = v16;
    v41 = 1024;
    v42 = v33;
    _os_log_impl(&dword_219944000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, changed:%d %d %d %d ", buf, 0x1Au);
    v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    v36 = v34;
    v37 = 1024;
    v38 = HIWORD(dword_253F33A64);
    v39 = 1024;
    v40 = v3;
    v41 = 1024;
    v42 = (unsigned __int16)word_253F33A6A;
    v43 = 1024;
    v44 = (42949673 * (unint64_t)(v4 * v3)) >> 32;
    v45 = 1024;
    v46 = HIWORD(dword_253F33A6C);
    v47 = 1024;
    v48 = v4;
    v49 = 1024;
    v50 = (unsigned __int16)word_253F33A72;
    _os_log_impl(&dword_219944000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, cmp:%d>%u %d>%u %d>%u %d>%u", buf, 0x32u);
    v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    v36 = v22;
    v37 = 1024;
    v38 = determinePoSMThreshold_vacThreshold;
    v39 = 1024;
    v40 = determinePoSMThreshold_vacpThreshold;
    v41 = 1024;
    v42 = determinePoSMThreshold_vac95Threshold;
    v43 = 1024;
    v44 = determinePoSMThreshold_vac95pThreshold;
    _os_log_impl(&dword_219944000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold,minThreshold=%u threshold:%u %u %u %u", buf, 0x20u);
  }
  return v22;
}

CFDictionaryRef parseBatteryData(int a1, int a2)
{
  const __CFAllocator *v4;
  uint64_t v5;
  CFNumberRef v6;
  uint64_t v7;
  CFNumberRef v8;
  uint64_t v9;
  CFNumberRef v10;
  uint64_t v11;
  CFNumberRef v12;
  uint64_t v13;
  CFStringRef StringWithBytes;
  uint64_t v15;
  CFNumberRef v16;
  uint64_t v17;
  uint64_t v18;
  __int16 *v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  CFDictionaryRef v23;
  unint64_t v24;
  CFNumberRef v25;
  uint64_t v26;
  CFNumberRef v27;
  uint64_t v28;
  CFNumberRef v29;
  uint64_t v30;
  uint64_t v31;
  CFNumberRef v32;
  uint64_t v33;
  CFNumberRef v34;
  uint64_t v35;
  CFNumberRef v36;
  uint64_t v37;
  uint64_t v38;
  CFNumberRef v39;
  uint64_t v40;
  CFDictionaryRef v41;
  unint64_t v42;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  unsigned int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  __int16 v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  _BYTE valuePtr[12];
  void *values;
  int v67;
  unsigned int v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  time_t v92;
  void *v93[3];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  void *v107;
  _QWORD v108[2];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  void *keys[22];
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  void *v126[21];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&valuePtr[4] = 0;
  v121 = 0;
  v120 = 0u;
  v119 = 0u;
  v118 = 0u;
  v117 = 0u;
  v116 = 0u;
  v115 = 0u;
  v114 = 0u;
  v113 = 0u;
  v112 = 0u;
  v111 = 0u;
  v110 = 0u;
  v109 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v107 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)updateThread_batteryInfo, 32);
  v93[0] = CFSTR("MfgData");
  v108[0] = createStringWithBytes((UInt8 *)updateThread_batteryInfo, 0x12uLL);
  v93[1] = CFSTR("Serial");
  *(_QWORD *)valuePtr = word_253F3385A;
  v108[1] = CFNumberCreate(v4, kCFNumberIntType, valuePtr);
  v93[2] = CFSTR("DesignCapacity");
  v64 = (unsigned __int16)word_253F3388E;
  values = CFNumberCreate(v4, kCFNumberIntType, &v64);
  if (values)
  {
    *(_QWORD *)&v109 = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x24BDBD690]);
    *(_QWORD *)&v94 = CFSTR("Qmax");
    CFRelease(values);
    v5 = 4;
  }
  else
  {
    v5 = 3;
  }
  v63 = word_253F33864;
  v108[v5 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v63);
  v93[v5] = CFSTR("MaxCapacity");
  v62 = (unsigned __int16)word_253F3388C;
  v6 = CFNumberCreate(v4, kCFNumberIntType, &v62);
  v7 = 8 * v5 + 8;
  *(_QWORD *)((char *)&v108[-1] + v7) = v6;
  *(void **)((char *)v93 + v7) = CFSTR("CycleCount");
  v61 = (unsigned __int16)word_253F33890;
  v8 = CFNumberCreate(v4, kCFNumberIntType, &v61);
  v9 = 8 * v5 + 16;
  *(_QWORD *)((char *)&v108[-1] + v9) = v8;
  *(void **)((char *)v93 + v9) = CFSTR("StateOfCharge");
  v60 = word_253F33862;
  v10 = CFNumberCreate(v4, kCFNumberIntType, &v60);
  v11 = 8 * v5 + 24;
  *(_QWORD *)((char *)&v108[-1] + v11) = v10;
  *(void **)((char *)v93 + v11) = CFSTR("Voltage");
  v59 = (unsigned __int16)word_253F33892;
  v12 = CFNumberCreate(v4, kCFNumberIntType, &v59);
  v13 = 8 * v5 + 32;
  *(_QWORD *)((char *)&v108[-1] + v13) = v12;
  *(void **)((char *)v93 + v13) = CFSTR("Flags");
  StringWithBytes = createStringWithBytes((UInt8 *)updateThread_batteryInfo + 2, 4uLL);
  v15 = 8 * v5 + 40;
  *(_QWORD *)((char *)&v108[-1] + v15) = StringWithBytes;
  *(void **)((char *)v93 + v15) = CFSTR("ManufactureDate");
  v58 = word_253F33858;
  v16 = CFNumberCreate(v4, kCFNumberSInt16Type, &v58);
  v17 = 8 * v5 + 48;
  *(_QWORD *)((char *)&v108[-1] + v17) = v16;
  *(void **)((char *)v93 + v17) = CFSTR("ChemID");
  v18 = v5 + 7;
  if (word_253F3385E != 1536)
  {
    v57 = (unsigned __int16)word_253F33894;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v57);
    v93[v18] = CFSTR("FullAvailableCapacity");
    v18 = v5 | 8;
    if ((unsigned __int16)word_253F3385E < 0x313u)
      goto LABEL_20;
  }
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0;
  v92 = time(0);
  keys[0] = CFSTR("UpdateTime");
  v126[0] = CFNumberCreate(v4, kCFNumberLongType, &v92);
  keys[1] = CFSTR("MaximumTemperature");
  v91 = (__int16)(byte_253F33896 << 8) | byte_253F33897;
  v126[1] = CFNumberCreate(v4, kCFNumberIntType, &v91);
  keys[2] = CFSTR("MinimumTemperature");
  v90 = (__int16)(byte_253F33898 << 8) | byte_253F33899;
  v126[2] = CFNumberCreate(v4, kCFNumberIntType, &v90);
  keys[3] = CFSTR("MaximumPackVoltage");
  v89 = (__int16)(byte_253F3389A << 8) | byte_253F3389B;
  v126[3] = CFNumberCreate(v4, kCFNumberIntType, &v89);
  keys[4] = CFSTR("MinimumPackVoltage");
  v88 = (__int16)(byte_253F3389C << 8) | byte_253F3389D;
  v126[4] = CFNumberCreate(v4, kCFNumberIntType, &v88);
  keys[5] = CFSTR("MaximumChargeCurrent");
  v87 = (__int16)(byte_253F3389E << 8) | byte_253F3389F;
  v126[5] = CFNumberCreate(v4, kCFNumberIntType, &v87);
  keys[6] = CFSTR("MaximumDischargeCurrent");
  v86 = (__int16)(byte_253F338A0 << 8) | byte_253F338A1;
  v126[6] = CFNumberCreate(v4, kCFNumberIntType, &v86);
  keys[7] = CFSTR("MaximumOverChargedCapacity");
  v85 = (__int16)(byte_253F338A2 << 8) | byte_253F338A3;
  v126[7] = CFNumberCreate(v4, kCFNumberIntType, &v85);
  keys[8] = CFSTR("MaximumOverDischargedCapacity");
  v84 = (__int16)(byte_253F338A4 << 8) | byte_253F338A5;
  v126[8] = CFNumberCreate(v4, kCFNumberIntType, &v84);
  keys[9] = CFSTR("MaximumFCC");
  v83 = (__int16)(byte_253F338A6 << 8) | byte_253F338A7;
  v126[9] = CFNumberCreate(v4, kCFNumberIntType, &v83);
  keys[10] = CFSTR("MinimumFCC");
  v82 = (__int16)(byte_253F338A8 << 8) | byte_253F338A9;
  v126[10] = CFNumberCreate(v4, kCFNumberIntType, &v82);
  keys[11] = CFSTR("MaximumDeltaVoltage");
  v81 = (__int16)(byte_253F338AA << 8) | byte_253F338AB;
  v126[11] = CFNumberCreate(v4, kCFNumberIntType, &v81);
  keys[12] = CFSTR("MinimumDeltaVoltage");
  v80 = (__int16)(byte_253F338AC << 8) | byte_253F338AD;
  v126[12] = CFNumberCreate(v4, kCFNumberIntType, &v80);
  keys[13] = CFSTR("LowAvgCurrentLastRun");
  v79 = (__int16)(byte_253F338AE << 8) | byte_253F338AF;
  v126[13] = CFNumberCreate(v4, kCFNumberIntType, &v79);
  keys[14] = CFSTR("HighAvgCurrentLastRun");
  v78 = (__int16)(byte_253F338B0 << 8) | byte_253F338B1;
  v126[14] = CFNumberCreate(v4, kCFNumberIntType, &v78);
  keys[15] = CFSTR("MaximumQmax");
  v77 = (__int16)(byte_253F338B2 << 8) | byte_253F338B3;
  v126[15] = CFNumberCreate(v4, kCFNumberIntType, &v77);
  keys[16] = CFSTR("MinimumQmax");
  v76 = (__int16)(byte_253F338B4 << 8) | byte_253F338B5;
  v126[16] = CFNumberCreate(v4, kCFNumberIntType, &v76);
  keys[17] = CFSTR("MaximumRa0-8");
  v75 = (__int16)(byte_253F338B6 << 8) | byte_253F338B7;
  v126[17] = CFNumberCreate(v4, kCFNumberIntType, &v75);
  keys[18] = CFSTR("MinimumRa0-8");
  v74 = (__int16)(byte_253F338B8 << 8) | byte_253F338B9;
  v126[18] = CFNumberCreate(v4, kCFNumberIntType, &v74);
  keys[19] = CFSTR("AverageTemperature");
  v73 = byte_253F338BA;
  v126[19] = CFNumberCreate(v4, kCFNumberIntType, &v73);
  keys[20] = CFSTR("TemperatureSamples");
  v72 = bswap32(unk_253F338BB);
  v126[20] = CFNumberCreate(v4, kCFNumberIntType, &v72);
  keys[21] = CFSTR("FlashWriteCount");
  v71 = __rev16(unk_253F338BF);
  *(_QWORD *)&v127 = CFNumberCreate(v4, kCFNumberIntType, &v71);
  *(_QWORD *)&v123 = CFSTR("RDISCnt");
  v70 = __rev16(unk_253F338C1);
  *((_QWORD *)&v127 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v70);
  *((_QWORD *)&v123 + 1) = CFSTR("CycleCountLastQmax");
  v69 = byte_253F338C3;
  *(_QWORD *)&v128 = CFNumberCreate(v4, kCFNumberIntType, &v69);
  if ((unsigned __int16)word_253F3385E < 0x501u)
  {
    if ((unsigned __int16)word_253F3385E < 0x313u)
    {
      v22 = 24;
      goto LABEL_12;
    }
    v19 = &word_253F338C6;
  }
  else
  {
    v19 = &word_253F338C4;
  }
  v20 = __rev16((unsigned __int16)*v19);
  *(_QWORD *)&v124 = CFSTR("TotalOperatingTime");
  v68 = v20;
  *((_QWORD *)&v128 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v68);
  v21 = *((unsigned __int8 *)v19 + 2);
  *((_QWORD *)&v124 + 1) = CFSTR("TimeAbove95Perc");
  v67 = v21;
  *(_QWORD *)&v129 = CFNumberCreate(v4, kCFNumberIntType, &v67);
  v22 = 26;
LABEL_12:
  keys[v22] = CFSTR("Raw");
  v126[v22] = CFDataCreate(v4, (const UInt8 *)&byte_253F33896, 64);
  v23 = CFDictionaryCreate(v4, (const void **)keys, (const void **)v126, v22 | 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  do
  {
    CFRelease(v126[v22]);
    v24 = v22-- + 1;
  }
  while (v24 > 1);
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      parseBatteryData_cold_2();
      if (!a1)
        goto LABEL_22;
LABEL_21:
      v56 = (unsigned __int16)word_253F33870;
      v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v56);
      v93[v18] = CFSTR("ITMiscStatus");
      v55 = word_253F33870 & 3;
      v25 = CFNumberCreate(v4, kCFNumberIntType, &v55);
      v26 = 8 * v18 + 8;
      *(_QWORD *)((char *)&v108[-1] + v26) = v25;
      *(void **)((char *)v93 + v26) = CFSTR("ITSimulationCounter");
      v18 += 2;
      goto LABEL_22;
    }
LABEL_20:
    if (!a1)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (a2)
    CFShow(v23);
  v108[v18 - 1] = v23;
  v93[v18++] = CFSTR("LifetimeData");
  if (a1)
    goto LABEL_21;
LABEL_22:
  if ((unsigned __int16)word_253F3385E >= 0x600u)
  {
    *(_QWORD *)&valuePtr[4] = CFDataCreate(v4, (const UInt8 *)&word_253F338D6, 32);
    if (*(_QWORD *)&valuePtr[4])
    {
      v108[v18 - 1] = CFArrayCreate(v4, (const void **)&valuePtr[4], 1, MEMORY[0x24BDBD690]);
      v93[v18++] = CFSTR("RaTableRaw");
      CFRelease(*(CFTypeRef *)&valuePtr[4]);
    }
    v54 = (unsigned __int16)word_253F3392C;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v54);
    v93[v18] = CFSTR("WeightedRa");
    v53 = (unsigned __int16)word_253F3392E;
    v27 = CFNumberCreate(v4, kCFNumberIntType, &v53);
    v28 = 8 * v18 + 8;
    *(_QWORD *)((char *)&v108[-1] + v28) = v27;
    *(void **)((char *)v93 + v28) = CFSTR("ChemicalWeightedRa");
    v52 = dword_253F33928;
    v29 = CFNumberCreate(v4, kCFNumberIntType, &v52);
    v30 = 8 * v18 + 16;
    *(_QWORD *)((char *)&v108[-1] + v30) = v29;
    *(void **)((char *)v93 + v30) = CFSTR("BatteryHealthMetric");
    v31 = v18 + 3;
    if ((unsigned __int16)word_253F3385E < 0x600u)
    {
      v18 += 3;
    }
    else
    {
      v108[v31 - 1] = CFDataCreate(v4, byte_253F338F6, 32);
      v93[v31] = CFSTR("iMaxAndSocSmoothTable");
      v51 = __rev16(*(unsigned __int16 *)&byte_253F338F6[1]);
      v32 = CFNumberCreate(v4, kCFNumberIntType, &v51);
      v33 = 8 * v18 + 32;
      *(_QWORD *)((char *)&v108[-1] + v33) = v32;
      *(void **)((char *)v93 + v33) = CFSTR("RSS");
      v18 += 5;
    }
  }
  v50 = (unsigned __int16)word_253F33874;
  v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v50);
  v93[v18] = CFSTR("ResScale");
  v49 = word_253F33876;
  v34 = CFNumberCreate(v4, kCFNumberIntType, &v49);
  v35 = 8 * v18 + 8;
  *(_QWORD *)((char *)&v108[-1] + v35) = v34;
  *(void **)((char *)v93 + v35) = CFSTR("Qstart");
  v48 = word_253F33878;
  v36 = CFNumberCreate(v4, kCFNumberIntType, &v48);
  v37 = 8 * v18 + 16;
  *(_QWORD *)((char *)&v108[-1] + v37) = v36;
  *(void **)((char *)v93 + v37) = CFSTR("PassedCharge");
  v38 = v18 + 3;
  v47 = (unsigned __int16)word_253F3387A;
  values = CFNumberCreate(v4, kCFNumberIntType, &v47);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x24BDBD690]);
    v93[v38] = CFSTR("DOD0");
    v38 = v18 + 4;
    CFRelease(values);
  }
  v46 = word_253F33872;
  values = CFNumberCreate(v4, kCFNumberIntType, &v46);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x24BDBD690]);
    v93[v38++] = CFSTR("PresentDOD");
    CFRelease(values);
  }
  v45 = (unsigned __int16)word_253F33892;
  v108[v38 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v45);
  v93[v38] = CFSTR("GaugeFlagRaw");
  v44 = gauge_reset_count;
  v39 = CFNumberCreate(v4, kCFNumberLongLongType, &v44);
  v40 = 8 * v38 + 8;
  *(_QWORD *)((char *)&v108[-1] + v40) = v39;
  *(void **)((char *)v93 + v40) = CFSTR("GaugeResetCounter");
  if (v38 >= 27)
    parseBatteryData_cold_1();
  v41 = CFDictionaryCreate(v4, (const void **)v93, (const void **)&v107, v38 + 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v38 >= -1)
  {
    do
    {
      CFRelease((CFTypeRef)v108[v38]);
      v42 = v38 + 2;
      --v38;
    }
    while (v42 > 1);
  }
  return v41;
}

__darwin_time_t UpSeconds()
{
  timeval v1;

  if (!UpSeconds_boottime)
  {
    v1.tv_sec = 16;
    sysctlbyname("kern.boottime", &UpSeconds_boottime, (size_t *)&v1, 0, 0);
  }
  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec - UpSeconds_boottime;
}

CFStringRef createStringWithBytes(UInt8 *bytes, unint64_t a2)
{
  unint64_t v2;
  unsigned int v3;

  v2 = 0;
  if (a2)
  {
    v3 = 1;
    do
    {
      if (!bytes[v2])
        break;
      v2 = v3++;
    }
    while (v2 < a2);
  }
  return CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
}

void ggctl_connect_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "AppleHDQGasGaugeControl";
  OUTLINED_FUNCTION_9(&dword_219944000, a1, a3, "could not find %s service", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

void ggctl_connect_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_219944000, v0, v1, "could not open service: %#x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void ggctl_reset_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_219944000, v0, v1, "gas gauge: cannot issue a reset", v2);
  OUTLINED_FUNCTION_4();
}

void ggctl_open_device_cold_1(NSObject *a1)
{
  int *v2;
  char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = __error();
  v3 = strerror(*v2);
  v4 = 136315394;
  v5 = "checkreset";
  v6 = 2080;
  v7 = v3;
  _os_log_error_impl(&dword_219944000, a1, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_11();
}

void ggctl_open_device_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_219944000, v0, v1, "gas gauge: cannot determine the state of SWI line", v2);
  OUTLINED_FUNCTION_4();
}

void ggctl_open_device_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_219944000, v0, v1, "gas gauge: SWI line low, issuing reset", v2);
  OUTLINED_FUNCTION_4();
}

void ggctl_open_device_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_219944000, v0, v1, "%s:%d break failed (%d)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void logBatteryDiagnosticData_cold_1()
{
  os_log_t v0;
  _WORD v1[10];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v1 = 136315650;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v1[7] = 2373;
  v1[9] = 2080;
  v2 = "IOPMPowerSource";
  _os_log_error_impl(&dword_219944000, v0, OS_LOG_TYPE_ERROR, "%s:%d cannot find service %s\n", (uint8_t *)v1, 0x1Cu);
}

void updateThread_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_219944000, v0, v1, "gasgauge: could not register for system power notifications", v2);
  OUTLINED_FUNCTION_4();
}

void updateThread_cold_2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_219944000, v2, (uint64_t)v2, "gasgauge: SWI line, cannot determine the state of line", v3);
}

void updateThread_cold_3(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = -1;
  _os_log_error_impl(&dword_219944000, log, OS_LOG_TYPE_ERROR, "cannot drain the data log (%d)", buf, 8u);
}

void updateThread_cold_4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_219944000, v2, (uint64_t)v2, "num_client<0, client error?", v3);
}

void updateThread_cold_5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_219944000, v2, (uint64_t)v2, "gasgauge: SWI line low reset disabled, ignoring", v3);
}

void updateThread_cold_6(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_0(&dword_219944000, v2, (uint64_t)v2, "gasgauge: SWI line low issuing reset", v3);
}

void updateThread_cold_7(NSObject *a1)
{
  int *v2;
  char *v3;
  uint64_t v4;
  int v5;
  char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = __error();
  v3 = strerror(*v2);
  v5 = 136315138;
  v6 = v3;
  OUTLINED_FUNCTION_9(&dword_219944000, a1, v4, "could not find hw.model: %s", (uint8_t *)&v5);
  OUTLINED_FUNCTION_11();
}

void updateThread_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_219944000, v0, v1, "gasgauge: could not register for battery events err=%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void updateThread_cold_9(mach_error_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 136315138;
  v5 = mach_error_string(a1);
  OUTLINED_FUNCTION_9(&dword_219944000, a2, v3, "gasgauge: could not map data log: %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_11();
}

void updateThread_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_219944000, v0, v1, "gasgauge: could not register for power source events", v2);
  OUTLINED_FUNCTION_4();
}

void EnableFullSleepForRevCOrLater_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_219944000, v0, v1, "cannot disable interrupts '%d'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void EnableFullSleepForRevCOrLater_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_219944000, v0, v1, "full sleep failed (%x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void EnableFullSleepForRevCOrLater_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_219944000, v0, v1, "%s:%d cannot read fw version", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void EnableFullSleepForRevCOrLater_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_219944000, v0, v1, "%s:%d break failed (%d)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void EnableFullSleepForRevCOrLater_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_219944000, v0, v1, "%s:%d cannot disable interrupts '%d'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void updateThermalCoolDownState_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_219944000, v0, v1, "%s:%d cannot update thermal state", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void statsAndLogs_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_219944000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void statsAndLogs_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_219944000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void debugLog_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_219944000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void debugLog_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_219944000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void dynamicATV_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_219944000, a1, a3, "dynATV: cannot write to charger startus (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void parseBatteryData_cold_1()
{
  __assert_rtn("parseBatteryData", "AppleHDQGasGauge.c", 1565, "batteryDataCount<=kNumBatteryDataUpdateKeys");
}

void parseBatteryData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_219944000, v0, v1, "Cannot create the lifetime dictionary", v2);
  OUTLINED_FUNCTION_4();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x24BDBC438](obj);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC560](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x24BDD7EA8](*(_QWORD *)&kernelPort, notificationID);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F18](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F80](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x24BDD8888](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x24BDD8930](*(_QWORD *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x24BDAC510]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint64_t logLineForAppleCare()
{
  return MEMORY[0x24BE29FB8]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x24BDAF998](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

