@implementation CRLSystemInfo

+ (NSString)macAddress
{
  int v2;
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  _BYTE v16[4000];

  memset(v15, 0, 12);
  v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    v7 = 0;
  }
  else
  {
    v3 = v2;
    LODWORD(v15[0]) = 4000;
    *(_QWORD *)((char *)v15 + 4) = v16;
    if (ioctl(v2, 0xC00C6924uLL, v15) < 0 || SLODWORD(v15[0]) < 1)
    {
      v7 = 0;
    }
    else
    {
      v4 = &v16[SLODWORD(v15[0])];
      v5 = v16;
      do
      {
        if (v5[17] == 18
          && ((v13 = 0,
               v14 = 0,
               v12 = 0,
               v6 = ether_ntoa((const ether_addr *)&v5[v5[21] + 24]),
               sscanf(v6, "%x:%x:%x:%x:%x:%x", (char *)&v14 + 4, &v14, (char *)&v13 + 4, &v13, (char *)&v12 + 4, &v12),
               v14)
           || v13
           || v12))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02X:%02X:%02X:%02X:%02X:%02X"), HIDWORD(v14), v14, HIDWORD(v13), v13, HIDWORD(v12), v12));
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
  }
  return (NSString *)v7;
}

+ (NSString)processorName
{
  void *v2;
  size_t v4;
  int v5[3];
  _BYTE v6[257];

  *(_QWORD *)v5 = 0xC00000006;
  v4 = 257;
  if (sysctl(v5, 2u, v6, &v4, 0, 0) < 0
    || (v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v6))) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice crl_platformString](UIDevice, "crl_platformString"));
  }
  return (NSString *)v2;
}

+ (NSString)operatingSystemName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "systemName"));

  return (NSString *)v3;
}

+ (NSString)systemVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "systemVersion"));

  return (NSString *)v3;
}

+ (NSString)osVersion
{
  if (qword_10006DA28 != -1)
    dispatch_once(&qword_10006DA28, &stru_1000614D8);
  return (NSString *)(id)qword_10006DA20;
}

+ (NSString)hwModel
{
  if (qword_10006DA38 != -1)
    dispatch_once(&qword_10006DA38, &stru_1000614F8);
  return (NSString *)(id)qword_10006DA30;
}

+ (NSString)deviceName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  if (v3 && !objc_msgSend(v3, "length"))
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

@end
