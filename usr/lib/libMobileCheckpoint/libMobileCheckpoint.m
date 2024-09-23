uint64_t MCCopyCheckpoint()
{
  int i;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  for (i = 4; ; --i)
  {
    if (_cacheValid())
    {
      v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", CFSTR("/var/mobile/Library/Caches/Checkpoint.plist"));
      if (v1)
        v2 = 0;
      else
        v2 = i == 4;
      if (v2)
      {
        v4 = (void *)MEMORY[0x2199CE0D0]();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastPathComponent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%d: cache is invalid, asking server to rebuild it"), v6, 70);
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        syslog(5, "%s", (const char *)objc_msgSend(v7, "UTF8String"));

        objc_autoreleasePoolPop(v4);
      }
      else
      {
        v3 = v1;
        if (v1)
          return v3;
      }
    }
    v8 = (void *)MEMORY[0x2199CE0D0]();
    v9 = MOXPCTransportOpen();
    if (v9)
      break;
    objc_autoreleasePoolPop(v8);
    if (!i)
      goto LABEL_16;
LABEL_15:
    usleep(0x3D090u);
  }
  v10 = v9;
  MOXPCTransportResume();
  getResponseForCommand(v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("checkpoint"));
  v3 = objc_claimAutoreleasedReturnValue();

  v12 = getResponseForCommand(v10, 1);
  MOXPCTransportClose();
  objc_autoreleasePoolPop(v8);
  if (v3)
    return v3;
  if (i)
    goto LABEL_15;
LABEL_16:
  v13 = (void *)MEMORY[0x2199CE0D0]();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%d: talking to the server failed"), v15, 86);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  syslog(5, "%s", (const char *)objc_msgSend(v16, "UTF8String"));

  objc_autoreleasePoolPop(v13);
  return 0;
}

uint64_t _cacheValid()
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  stat v5;
  stat v6;

  memset(&v6, 0, sizeof(v6));
  memset(&v5, 0, sizeof(v5));
  if (!stat("/var/mobile/Library/Caches/Checkpoint.plist", &v6)
    && !stat("/System/Library/CoreServices/Checkpoint.xml", &v5))
  {
    if (v6.st_mtimespec.tv_sec == v5.st_mtimespec.tv_sec && v6.st_mtimespec.tv_nsec == v5.st_mtimespec.tv_nsec)
      return 1;
    v1 = (void *)MEMORY[0x2199CE0D0]();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%d: cache %s doesn't match %s"), v3, 18, "/var/mobile/Library/Caches/Checkpoint.plist", "/System/Library/CoreServices/Checkpoint.xml", *(_QWORD *)&v5.st_dev, v5.st_ino, *(_QWORD *)&v5.st_uid, *(_QWORD *)&v5.st_rdev, v5.st_atimespec.tv_sec, v5.st_atimespec.tv_nsec);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    syslog(5, "%s", (const char *)objc_msgSend(v4, "UTF8String"));

    objc_autoreleasePoolPop(v1);
  }
  return 0;
}

uint64_t MCCopyCheckpointData()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;

  v0 = (void *)MEMORY[0x2199CE0D0]();
  if (_cacheValid())
  {
    v8 = 0;
    v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", CFSTR("/var/mobile/Library/Caches/Checkpoint.plist"), 8, &v8);
    v2 = v8;
    if (v1)
      goto LABEL_7;
    v3 = (void *)MEMORY[0x2199CE0D0]();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%d: mapping %s failed: %@"), v5, 106, "/var/mobile/Library/Caches/Checkpoint.plist", v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    syslog(5, "%s", (const char *)objc_msgSend(v6, "UTF8String"));

    objc_autoreleasePoolPop(v3);
  }
  v2 = (id)MCCopyCheckpoint();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v2, 200, 0, 0);
    v1 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
LABEL_7:

  objc_autoreleasePoolPop(v0);
  return v1;
}

uint64_t MCCopyCheckpointValue(const void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  const void *Value;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  CFDictionaryRef theDict;
  CFTypeRef cf;

  theDict = 0;
  cf = 0;
  v2 = 0;
  v3 = 0;
  if (!_cacheValid())
    goto LABEL_9;
  v4 = (void *)MEMORY[0x2199CE0D0]();
  v17 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", CFSTR("/var/mobile/Library/Caches/Checkpoint.plist"), 8, &v17);
  v5 = v17;
  v6 = v5;
  if (!v3)
  {
    v9 = (void *)MEMORY[0x2199CE0D0]();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%d: mapping %s failed: %@"), v11, 144, "/var/mobile/Library/Caches/Checkpoint.plist", v6);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    syslog(5, "%s", (const char *)objc_msgSend(v12, "UTF8String"));

    objc_autoreleasePoolPop(v9);
    v2 = 0;
    v3 = 0;
LABEL_8:

    objc_autoreleasePoolPop(v4);
LABEL_9:
    v15 = (void *)MCCopyCheckpoint();
    objc_msgSend(v15, "objectForKey:", a1);
    v8 = objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }

  objc_autoreleasePoolPop(v4);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", a1, 0);
  if ((_CFPropertyListCreateFiltered() & 1) == 0)
  {
    v4 = (void *)MEMORY[0x2199CE0D0]();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/MobileCheckpoint.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%d: extracting %@ from %s failed: %@"), v6, 154, a1, "/var/mobile/Library/Caches/Checkpoint.plist", cf);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    syslog(5, "%s", (const char *)objc_msgSend(v14, "UTF8String"));

    goto LABEL_8;
  }
  Value = CFDictionaryGetValue(theDict, a1);
  v8 = (uint64_t)Value;
  if (Value)
    CFRetain(Value);
LABEL_10:
  if (cf)
    CFRelease(cf);
  cf = 0;
  if (theDict)
    CFRelease(theDict);

  return v8;
}

id getResponseForCommand(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("command");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (MOXPCTransportSendMessage())
    v4 = (void *)MOXPCTransportReceiveMessage();
  else
    v4 = 0;

  return v4;
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t MOXPCTransportClose()
{
  return MEMORY[0x24BE67720]();
}

uint64_t MOXPCTransportOpen()
{
  return MEMORY[0x24BE67728]();
}

uint64_t MOXPCTransportReceiveMessage()
{
  return MEMORY[0x24BE67730]();
}

uint64_t MOXPCTransportResume()
{
  return MEMORY[0x24BE67738]();
}

uint64_t MOXPCTransportSendMessage()
{
  return MEMORY[0x24BE67740]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x24BDBD090]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

