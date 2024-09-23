@implementation TSUSystemInfo

+ (id)macAddress
{
  int v2;
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  _BYTE *v17;
  _BYTE v18[4000];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = socket(2, 2, 0);
  if (v2 < 0)
    return 0;
  v3 = v2;
  v16 = 4000;
  v17 = v18;
  if (ioctl(v2, 0xC00C6924uLL, &v16) < 0 || v16 < 1)
  {
    v7 = 0;
  }
  else
  {
    v4 = &v18[v16];
    v5 = v18;
    do
    {
      if (v5[17] == 18
        && ((v15 = 0,
             v13 = 0,
             v14 = 0,
             v12 = 0,
             v6 = ether_ntoa((const ether_addr *)&v5[v5[21] + 24]),
             sscanf(v6, "%x:%x:%x:%x:%x:%x", &v15, (char *)&v14 + 4, &v14, (char *)&v13 + 4, &v13, &v12),
             v15)
         || v14
         || HIDWORD(v13)
         || (_DWORD)v13
         || v12))
      {
        v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X:%02X:%02X:%02X:%02X:%02X"), v15, HIDWORD(v14), v14, HIDWORD(v13), v13, v12);
      }
      else
      {
        v7 = 0;
      }
      v8 = v5[16];
      if (v8 <= 0x10)
        v9 = 32;
      else
        v9 = v8 + 16;
      v5 += v9;
    }
    while (v5 < v4 && v7 == 0);
  }
  close(v3);
  return v7;
}

+ (id)processorName
{
  id result;
  size_t v3;
  int v4[3];
  _BYTE v5[257];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v4 = 0xC00000006;
  v3 = 257;
  if (sysctl(v4, 2u, v5, &v3, 0, 0) < 0)
    return (id)objc_msgSend(MEMORY[0x24BDF69C8], "platformString");
  result = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), v5);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x24BDF69C8], "platformString");
  return result;
}

+ (id)systemVersion
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "systemVersion");
}

+ (id)hwModel
{
  if (hwModel_onceToken != -1)
    dispatch_once(&hwModel_onceToken, &__block_literal_global_4);
  return (id)hwModel_hwModel;
}

void __24__TSUSystemInfo_hwModel__block_invoke()
{
  void *v0;
  size_t size;

  size = 0;
  sysctlbyname("hw.model", 0, &size, 0, 0);
  v0 = malloc_type_malloc(size, 0xD07625F7uLL);
  sysctlbyname("hw.model", v0, &size, 0, 0);
  hwModel_hwModel = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v0);
  free(v0);
}

@end
