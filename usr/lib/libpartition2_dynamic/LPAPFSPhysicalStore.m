@implementation LPAPFSPhysicalStore

+ (id)supportedContentTypes
{
  id v4;
  objc_super v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    v6[0] = LPAPFSPhysicalStoreMediaUUID[0];
    v6[1] = LPAPFSPhysicalStoreDiagsMediaUUID[0];
    v6[2] = LPAPFSPhysicalStoreRecoveryMediaUUID[0];
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
    return v4;
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___LPAPFSPhysicalStore;
    return objc_msgSendSuper2(&v5, sel_supportedContentTypes);
  }
}

- (int)role
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = -[LPMedia content](self, "content");
  v3 = v2;
  if (!v2)
  {
    _os_log_pack_size();
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136315138;
    *(_QWORD *)(v5 + 4) = "-[LPAPFSPhysicalStore role]";
    _LPLogPack(1);
    goto LABEL_7;
  }
  if ((objc_msgSend(v2, "isEqualToString:", LPAPFSPhysicalStoreDiagsMediaUUID[0]) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", LPAPFSPhysicalStoreRecoveryMediaUUID[0]) & 1) != 0)
    {
      v4 = 2;
      goto LABEL_8;
    }
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v4 = 1;
LABEL_8:

  return v4;
}

- (id)parent
{
  uint64_t v2;
  LPPartitionMedia *v3;
  uint64_t v5;
  uint64_t v6;
  const __CFString *CFProperty;
  const __CFString *v8;
  CFTypeID v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  LPPartitionMedia *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  io_iterator_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  if (MEMORY[0x20BCF2F90](-[LPMedia ioMedia](self, "ioMedia"), "IOService", 3, &v22))
  {
    _os_log_pack_size();
    v2 = _os_log_pack_fill();
    *(_DWORD *)v2 = 136315138;
    *(_QWORD *)(v2 + 4) = "-[LPAPFSPhysicalStore parent]";
    _LPLogPack(1);
LABEL_3:
    v3 = 0;
    return v3;
  }
  v5 = IOIteratorNext(v22);
  if (!(_DWORD)v5)
    goto LABEL_3;
  v6 = v5;
  v3 = 0;
  do
  {
    if (IOObjectConformsTo(v6, "IOMedia")
      && (CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, CFSTR("Content"), 0, 0)) != 0)
    {
      v8 = CFProperty;
      v9 = CFGetTypeID(CFProperty);
      if (v9 == CFStringGetTypeID())
      {
        v21 = 0u;
        v20 = 0u;
        v19 = 0u;
        v18 = 0u;
        v10 = +[LPPartitionMedia contentTypesForPartitionMedia](LPPartitionMedia, "contentTypesForPartitionMedia", 0);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v10);
              if (CFStringCompare(*(CFStringRef *)(*((_QWORD *)&v18 + 1) + 8 * i), v8, 0) == kCFCompareEqualTo)
              {
                v16 = -[LPMedia initWithIOMediaObject:]([LPPartitionMedia alloc], "initWithIOMediaObject:", v6);

                v13 = 1;
                v3 = v16;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          }
          while (v12);
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v13 = 0;
    }
    v17 = IOIteratorNext(v22);
    if (!(_DWORD)v17)
      break;
    v6 = v17;
  }
  while ((v13 & 1) == 0);
  return v3;
}

- (id)container
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  LPAPFSContainer *v6;
  CFTypeRef CFProperty;
  void *v8;
  CFTypeID v9;
  LPAPFSContainer *v10;
  int v11;
  BOOL v12;
  io_iterator_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  if (MEMORY[0x20BCF2F90](-[LPMedia ioMedia](self, "ioMedia"), "IOService", 1, &v13))
  {
    _os_log_pack_size();
    v2 = _os_log_pack_fill();
    *(_DWORD *)v2 = 136315138;
    *(_QWORD *)(v2 + 4) = "-[LPAPFSPhysicalStore container]";
    _LPLogPack(1);
    return 0;
  }
  else
  {
    v4 = IOIteratorNext(v13);
    if ((_DWORD)v4)
    {
      v5 = v4;
      v6 = 0;
      do
      {
        if (IOObjectConformsTo(v5, "IOMedia")
          && (CFProperty = IORegistryEntryCreateCFProperty(v5, CFSTR("Content"), 0, 0)) != 0)
        {
          v8 = (void *)CFProperty;
          v9 = CFGetTypeID(CFProperty);
          if (v9 == CFStringGetTypeID()
            && objc_msgSend(v8, "isEqualToString:", LPAPFSContainerMediaTypeUUID[0]))
          {
            v10 = -[LPMedia initWithIOMediaObject:]([LPAPFSContainer alloc], "initWithIOMediaObject:", v5);

            v11 = 1;
            v6 = v10;
          }
          else
          {
            v11 = 0;
          }
          CFRelease(v8);
        }
        else
        {
          v11 = 0;
        }
        IOObjectRelease(v5);
        v5 = IOIteratorNext(v13);
        if ((_DWORD)v5)
          v12 = v11 == 0;
        else
          v12 = 0;
      }
      while (v12);
    }
    else
    {
      v6 = 0;
    }
    IOObjectRelease(v13);
    return v6;
  }
}

@end
