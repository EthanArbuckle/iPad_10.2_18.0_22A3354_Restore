@implementation LPMedia

+ (NSArray)supportedContentTypes
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

+ (BOOL)hasEmbeddedDeviceTypeRoot
{
  io_service_t MatchingService;
  io_service_t v3;

  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], (CFDictionaryRef)&unk_24BF05DF8);
  v3 = MatchingService;
  if (MatchingService)
    IOObjectRelease(MatchingService);
  return v3 != 0;
}

+ (id)allMedia
{
  id v2;
  const __CFDictionary *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  io_iterator_t existing;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  +[LPMedia waitForBlockStorage](LPMedia, "waitForBlockStorage");
  existing = 0;
  v3 = IOServiceMatching("IOMedia");
  if (IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v3, &existing))
  {
    _os_log_pack_size();
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v4 + 4) = "+[LPMedia allMedia]";
    _LPLogPack(1);
    v5 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v6 = IOIteratorNext(existing);
    if ((_DWORD)v6)
    {
      v7 = v6;
      do
      {
        v8 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:](LPMedia, "mediaOfCorrectTypeGivenIOMedia:", v7);
        if (v8)
          objc_msgSend(v2, "addObject:", v8);
        IOObjectRelease(v7);

        v7 = IOIteratorNext(existing);
      }
      while ((_DWORD)v7);
    }
    if (existing)
      IOObjectRelease(existing);
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);
  }

  return v5;
}

+ (id)mediaForPath:(id)a3
{
  return +[LPMedia mediaForPath:snapshotName:](LPMedia, "mediaForPath:snapshotName:", a3, 0);
}

+ (id)mediaForPath:(id)a3 isSnapshot:(BOOL *)a4
{
  id v5;
  uint64_t v7;

  v7 = 0;
  v5 = (id)objc_msgSend(a1, "mediaForPath:snapshotName:", a3, &v7);
  if (a4 && v5)
    *a4 = v7 != 0;
  return v5;
}

+ (id)mediaForPath:(id)a3 snapshotName:(id *)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  const __CFDictionary *v17;
  uint64_t MatchingService;
  io_object_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  char *v23;
  void *CFProperty;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int *v28;
  char *v29;
  uint64_t v30;
  id v31;
  _QWORD v33[2];
  uint64_t v34;
  unsigned __int8 v35[272];
  uint64_t v36;
  _OWORD v37[3];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  statfs v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  bzero(&v42, 0x878uLL);
  v7 = objc_retainAutorelease(v6);
  if (!statfs((const char *)objc_msgSend(v7, "fileSystemRepresentation"), &v42))
  {
    v13 = v42.f_fsid.val[0];
    v40[0] = CFSTR("IOProviderClass");
    v40[1] = CFSTR("IOPropertyMatch");
    v41[0] = CFSTR("IOMedia");
    v38[0] = CFSTR("BSD Major");
    v14 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIBYTE(v42.f_fsid.val[0]));
    v38[1] = CFSTR("BSD Minor");
    v39[0] = v14;
    v15 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13 & 0xFFFFFF);
    v39[1] = v15;
    v16 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v41[1] = v16;
    v11 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);

    LODWORD(v14) = *MEMORY[0x24BDD8B20];
    v17 = (const __CFDictionary *)CFRetain(v11);
    MatchingService = IOServiceGetMatchingService((mach_port_t)v14, v17);
    if (!(_DWORD)MatchingService)
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      v22 = _os_log_pack_fill();
      *(_DWORD *)v22 = 136315650;
      *(_QWORD *)(v22 + 4) = "+[LPMedia mediaForPath:snapshotName:]";
      *(_WORD *)(v22 + 12) = 2112;
      *(_QWORD *)(v22 + 14) = v7;
      *(_WORD *)(v22 + 22) = 2048;
      *(_QWORD *)(v22 + 24) = v13;
      _LPLogPack(1);
      goto LABEL_3;
    }
    v19 = MatchingService;
    v20 = (id)objc_msgSend(a1, "mediaOfCorrectTypeGivenIOMedia:", MatchingService);
    v12 = v20;
    if (!a4 || !v20)
    {
LABEL_23:
      IOObjectRelease(v19);
      goto LABEL_24;
    }
    if ((v42.f_flags & 0x40000000) == 0)
    {
      v21 = 0;
LABEL_22:
      v31 = objc_retainAutorelease(v21);
      *a4 = v31;

      goto LABEL_23;
    }
    v23 = strrchr(v42.f_mntfromname, 64);
    if (v23)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v42.f_mntfromname, v23 - v42.f_mntfromname, 4);
      goto LABEL_20;
    }
    if (!IOObjectConformsTo(v19, "AppleAPFSSnapshot"))
    {
      v21 = 0;
      goto LABEL_20;
    }
    memset(v37, 0, 37);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v19, CFSTR("UUID"), 0, 0);
    objc_msgSend(CFProperty, "getCString:maxLength:encoding:", v37, 37, 4);
    v36 = 0;
    memset(v35, 0, sizeof(v35));
    v34 = 2;
    if (uuid_parse((const char *)v37, v35))
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      v25 = _os_log_pack_fill();
      *(_DWORD *)v25 = 136315907;
      *(_QWORD *)(v25 + 4) = "+[LPMedia mediaForPath:snapshotName:]";
      *(_WORD *)(v25 + 12) = 2080;
      *(_QWORD *)(v25 + 14) = "AppleAPFSSnapshot";
      *(_WORD *)(v25 + 22) = 2081;
      *(_QWORD *)(v25 + 24) = "UUID";
      *(_WORD *)(v25 + 32) = 2113;
      *(_QWORD *)(v25 + 34) = CFProperty;
      _LPLogPack(1);
    }
    else
    {
      if (!fsctl(v42.f_mntonname, 0xC1204A43uLL, &v34, 0))
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v35[24], strnlen((const char *)&v35[24], 0xFFuLL), 4);
        goto LABEL_19;
      }
      _os_log_pack_size();
      v33[1] = v33;
      MEMORY[0x24BDAC7A8]();
      v26 = _os_log_pack_fill();
      v27 = *__error();
      v28 = __error();
      v29 = strerror(*v28);
      *(_DWORD *)v26 = 136315650;
      *(_QWORD *)(v26 + 4) = "+[LPMedia mediaForPath:snapshotName:]";
      *(_WORD *)(v26 + 12) = 1024;
      *(_DWORD *)(v26 + 14) = v27;
      *(_WORD *)(v26 + 18) = 2080;
      *(_QWORD *)(v26 + 20) = v29;
      _LPLogPack(1);
    }
    v21 = 0;
LABEL_19:

LABEL_20:
    if (!objc_msgSend(v21, "length"))
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      v30 = _os_log_pack_fill();
      *(_DWORD *)v30 = 136315395;
      *(_QWORD *)(v30 + 4) = "+[LPMedia mediaForPath:snapshotName:]";
      *(_WORD *)(v30 + 12) = 2113;
      *(_QWORD *)(v30 + 14) = v7;
      _LPLogPack(1);
    }
    goto LABEL_22;
  }
  v8 = *__error();
  _os_log_pack_size();
  MEMORY[0x24BDAC7A8]();
  v9 = _os_log_pack_fill();
  v10 = strerror(v8);
  *(_DWORD *)v9 = 136315906;
  *(_QWORD *)(v9 + 4) = "+[LPMedia mediaForPath:snapshotName:]";
  *(_WORD *)(v9 + 12) = 2112;
  *(_QWORD *)(v9 + 14) = v7;
  *(_WORD *)(v9 + 22) = 1024;
  *(_DWORD *)(v9 + 24) = v8;
  *(_WORD *)(v9 + 28) = 2080;
  *(_QWORD *)(v9 + 30) = v10;
  _LPLogPack(1);
  v11 = 0;
LABEL_3:
  v12 = 0;
LABEL_24:

  return v12;
}

+ (id)snapshotNameForMediaForPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  id v43;
  _BYTE v44[120];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v43 = 0;
  v5 = (id)objc_msgSend(a1, "mediaForPath:snapshotName:", v4, &v43);
  v6 = v43;
  v7 = v6;
  if (!v5)
  {
    _os_log_pack_size();
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315395;
    *(_QWORD *)(v9 + 4) = "+[LPMedia snapshotNameForMediaForPath:]";
    *(_WORD *)(v9 + 12) = 2113;
    *(_QWORD *)(v9 + 14) = v4;
    _LPLogPack(1);
    v8 = 0;
    goto LABEL_32;
  }
  if (!v6)
  {
    v10 = (id)objc_msgSend(a1, "liveMediaForSnapshotAtPath:", CFSTR("/"));
    if (v10 && objc_msgSend(v5, "isEqual:", v10))
    {
      v42 = 0;
      v11 = (id)objc_msgSend(a1, "mediaForPath:snapshotName:", CFSTR("/"), &v42);
      v8 = v42;

      if (v11 && v8)
      {
LABEL_31:

        goto LABEL_32;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v5;
      v41 = 0;
      v13 = (id)objc_msgSend(v12, "snapshotInfoWithError:", &v41);
      v14 = v41;
      v15 = v14;
      if (v13)
      {
        v35 = v14;
        v33 = v12;
        v34 = v10;
        v36 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v32 = v13;
        v16 = v13;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v38;
          while (2)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v38 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              v8 = (id)objc_msgSend(v21, "objectForKeyedSubscript:", LPAPFSSnapshotPropertyKeyName[0]);
              v22 = (id)objc_msgSend(v21, "objectForKeyedSubscript:", LPAPFSSnapshotPropertyKeyMarkedForRoot[0]);
              if ((objc_msgSend(v22, "BOOLValue") & 1) != 0)
              {

                v10 = v34;
                v12 = v33;
                v13 = v32;
                v23 = v36;
                goto LABEL_29;
              }
              if (objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.os.update-")))
                objc_msgSend(v36, "addObject:", v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
            if (v18)
              continue;
            break;
          }
        }

        v23 = v36;
        if (objc_msgSend(v36, "count"))
        {
          v24 = (id)objc_msgSend(v36, "sortedArrayUsingComparator:", &__block_literal_global_1);
          v25 = (id)objc_msgSend(v24, "lastObject");
          v8 = (id)objc_msgSend(v25, "objectForKeyedSubscript:", LPAPFSSnapshotPropertyKeyName[0]);

        }
        else
        {
          _os_log_pack_size();
          v30 = _os_log_pack_fill();
          *(_DWORD *)v30 = 136315138;
          *(_QWORD *)(v30 + 4) = "+[LPMedia snapshotNameForMediaForPath:]";
          _LPLogPack(1);
          v8 = 0;
        }
        v10 = v34;
        v12 = v33;
        v13 = v32;
LABEL_29:

        v15 = v35;
      }
      else
      {
        _os_log_pack_size();
        v28 = _os_log_pack_fill();
        v29 = (id)objc_msgSend(v12, "devNodePath");
        *(_DWORD *)v28 = 136315650;
        *(_QWORD *)(v28 + 4) = "+[LPMedia snapshotNameForMediaForPath:]";
        *(_WORD *)(v28 + 12) = 2112;
        *(_QWORD *)(v28 + 14) = v29;
        *(_WORD *)(v28 + 22) = 2112;
        *(_QWORD *)(v28 + 24) = v15;

        _LPLogPack(1);
        v8 = 0;
      }

    }
    else
    {
      _os_log_pack_size();
      v26 = _os_log_pack_fill();
      v27 = (id)objc_msgSend(v5, "devNodePath");
      *(_DWORD *)v26 = 136315394;
      *(_QWORD *)(v26 + 4) = "+[LPMedia snapshotNameForMediaForPath:]";
      *(_WORD *)(v26 + 12) = 2112;
      *(_QWORD *)(v26 + 14) = v27;

      _LPLogPack(1);
      v8 = 0;
    }
    goto LABEL_31;
  }
  v8 = v6;
LABEL_32:

  return v8;
}

uint64_t __39__LPMedia_snapshotNameForMediaForPath___block_invoke(int a1, void *a2, id a3)
{
  __CFString *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v4 = LPAPFSSnapshotPropertyKeyXID[0];
  v5 = a3;
  v6 = (id)objc_msgSend(a2, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", LPAPFSSnapshotPropertyKeyXID[0]);

  v8 = objc_msgSend(v6, "compare:", v7);
  return v8;
}

+ (id)liveMediaForSnapshotAtPath:(id)a3
{
  id v4;
  io_object_t v5;
  io_registry_entry_t v6;
  uint64_t v7;
  __objc2_class *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_registry_entry_t parent;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("/")) & 1) == 0)
  {
    v8 = (__objc2_class *)a1;
LABEL_9:
    v9 = (id)-[__objc2_class mediaForPath:](v8, "mediaForPath:", v4);
    goto LABEL_18;
  }
  v5 = +[LPMedia _copyIOMediaForDiskWithPath:](LPMedia, "_copyIOMediaForDiskWithPath:", v4);
  if (v5)
  {
    v6 = v5;
    if (IOObjectConformsTo(v5, "AppleAPFSSnapshot"))
    {
      parent = 0;
      if (IORegistryEntryGetParentEntry(v6, "IOService", &parent)
        || !parent
        || !IOObjectConformsTo(parent, "AppleAPFSVolume"))
      {
        _os_log_pack_size();
        v13 = _os_log_pack_fill();
        *(_DWORD *)v13 = 136315395;
        *(_QWORD *)(v13 + 4) = "+[LPMedia liveMediaForSnapshotAtPath:]";
        *(_WORD *)(v13 + 12) = 2113;
        *(_QWORD *)(v13 + 14) = v4;
        _LPLogPack(1);
        v9 = 0;
        goto LABEL_17;
      }
      v7 = parent;
LABEL_13:
      v9 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:](LPMedia, "mediaOfCorrectTypeGivenIOMedia:", v7);
LABEL_17:
      IOObjectRelease(v6);
      goto LABEL_18;
    }
    _os_log_pack_size();
    v12 = _os_log_pack_fill();
    *(_DWORD *)v12 = 136315395;
    *(_QWORD *)(v12 + 4) = "+[LPMedia liveMediaForSnapshotAtPath:]";
    *(_WORD *)(v12 + 12) = 2113;
    *(_QWORD *)(v12 + 14) = v4;
    _LPLogPack(1);
    IOObjectRelease(v6);
    v8 = LPMedia;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("/")))
  {
    v10 = +[LPMedia _copyLiveFilesystemIOMediaForRootedSnapshot](LPMedia, "_copyLiveFilesystemIOMediaForRootedSnapshot");
    if ((_DWORD)v10)
    {
      v6 = v10;
      v7 = v10;
      goto LABEL_13;
    }
  }
  _os_log_pack_size();
  v11 = _os_log_pack_fill();
  *(_DWORD *)v11 = 136315395;
  *(_QWORD *)(v11 + 4) = "+[LPMedia liveMediaForSnapshotAtPath:]";
  *(_WORD *)(v11 + 12) = 2113;
  *(_QWORD *)(v11 + 14) = v4;
  _LPLogPack(1);
  v9 = 0;
LABEL_18:

  return v9;
}

+ (id)mediaForUUID:(id)a3
{
  const __CFAllocator *v3;
  id v4;
  __CFDictionary *Mutable;
  uint64_t MatchingService;
  io_object_t v7;
  id v8;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = a3;
  Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("IOProviderClass"), CFSTR("IOMedia"));
  CFDictionarySetValue(Mutable, CFSTR("UUID"), v4);

  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], Mutable);
  if ((_DWORD)MatchingService)
  {
    v7 = MatchingService;
    v8 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:](LPMedia, "mediaOfCorrectTypeGivenIOMedia:", MatchingService);
    IOObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)mediaForBSDNameOrDeviceNode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  mach_port_t v6;
  id v7;
  const __CFDictionary *v8;
  uint64_t MatchingService;
  io_object_t v10;
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "length"))
    {
      v5 = v4;
      if (objc_msgSend(v4, "hasPrefix:", CFSTR("/dev/")))
      {
        v5 = (id)objc_msgSend(v4, "substringFromIndex:", 5);

      }
      v6 = *MEMORY[0x24BDD8B20];
      v7 = objc_retainAutorelease(v5);
      v8 = IOBSDNameMatching(v6, 0, (const char *)objc_msgSend(v7, "fileSystemRepresentation"));
      MatchingService = IOServiceGetMatchingService(v6, v8);
      if ((_DWORD)MatchingService)
      {
        v10 = MatchingService;
        v11 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:](LPMedia, "mediaOfCorrectTypeGivenIOMedia:", MatchingService);
        IOObjectRelease(v10);
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
      v7 = v4;
    }
  }
  else
  {
    v11 = 0;
    v7 = 0;
  }

  return v11;
}

- (id)wholeMediaForMedia
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v9;
  CFTypeID v10;
  id v11;
  int v12;
  BOOL v13;
  io_iterator_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[LPMedia isWhole](self, "isWhole"))
    return self;
  v14 = 0;
  if (MEMORY[0x20BCF2F90](-[LPMedia ioMedia](self, "ioMedia"), "IOService", 3, &v14))
  {
    _os_log_pack_size();
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v4 + 4) = "-[LPMedia wholeMediaForMedia]";
    _LPLogPack(1);
    return 0;
  }
  else
  {
    v5 = IOIteratorNext(v14);
    if ((_DWORD)v5)
    {
      v6 = v5;
      v7 = 0;
      do
      {
        if (IOObjectConformsTo(v6, "IOMedia")
          && (CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v6, CFSTR("Whole"), 0, 0)) != 0)
        {
          v9 = CFProperty;
          v10 = CFGetTypeID(CFProperty);
          if (v10 == CFBooleanGetTypeID() && CFBooleanGetValue(v9))
          {
            v11 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:](LPMedia, "mediaOfCorrectTypeGivenIOMedia:", v6);

            v12 = 1;
            v7 = v11;
          }
          else
          {
            v12 = 0;
          }
          CFRelease(v9);
        }
        else
        {
          v12 = 0;
        }
        IOObjectRelease(v6);
        v6 = IOIteratorNext(v14);
        if ((_DWORD)v6)
          v13 = v12 == 0;
        else
          v13 = 0;
      }
      while (v13);
    }
    else
    {
      v7 = 0;
    }
    IOObjectRelease(v14);
    return v7;
  }
}

- (LPMedia)initWithIOMediaObject:(unsigned int)a3
{
  uint64_t v3;
  LPMedia *v4;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  v6.receiver = self;
  v6.super_class = (Class)LPMedia;
  v4 = -[LPMedia init](&v6, sel_init);
  if (v4)
  {
    IOObjectRetain(v3);
    -[LPMedia setIoMedia:](v4, "setIoMedia:", v3);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (-[LPMedia ioMedia](self, "ioMedia"))
    IOObjectRelease(-[LPMedia ioMedia](self, "ioMedia"));
  v3.receiver = self;
  v3.super_class = (Class)LPMedia;
  -[LPMedia dealloc](&v3, sel_dealloc);
}

- (id)content
{
  return -[LPMedia getStringPropertyWithName:](self, "getStringPropertyWithName:", CFSTR("Content"));
}

- (id)mediaUUID
{
  return -[LPMedia getStringPropertyWithName:](self, "getStringPropertyWithName:", CFSTR("UUID"));
}

- (id)name
{
  id v3;
  void *v4;
  char *v5;
  id v6;
  _QWORD v8[3];
  _OWORD v9[7];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = -[LPMedia mountPoint](self, "mountPoint");
  if (v3)
  {
    bzero(v9, 0x40CuLL);
    v8[2] = 0;
    v8[0] = 5;
    v8[1] = 2147491840;
    if (getattrlist((const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"), v8, v9, 0x40CuLL, 0) != -1)
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = (char *)v9 + SDWORD1(v9[0]) + 4;
LABEL_7:
      v6 = (id)objc_msgSend(v4, "stringWithCString:encoding:", v5, 4);
      goto LABEL_8;
    }
  }
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  if (!MEMORY[0x20BCF2F9C](-[LPMedia ioMedia](self, "ioMedia"), v9))
  {
    HIBYTE(v10) = 0;
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = (char *)v9;
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)setName:(id)a3 withError:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  int v10;
  uint64_t v11;
  int *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  __int128 v23;
  uint64_t v24;
  _DWORD v25[2];
  char v26[1024];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  bzero(v25, 0x408uLL);
  v7 = objc_retainAutorelease(-[LPMedia mountPoint](self, "mountPoint"));
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");

  if (!v8)
  {
    _os_log_pack_size();
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315138;
    *(_QWORD *)(v19 + 4) = "-[LPMedia setName:withError:]";
    _LPLogPack(1);
    if (a4)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BDD1128];
      v16 = 22;
      goto LABEL_7;
    }
LABEL_8:
    v20 = 0;
    goto LABEL_10;
  }
  v24 = 0;
  v23 = xmmword_2063637B0;
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v9, "UTF8String");
  __strlcpy_chk();
  v25[0] = 8;
  v25[1] = strlen(v26) + 1;
  v10 = setattrlist(v8, &v23, v25, 0x408uLL, 0);
  _os_log_pack_size();
  if (!v10)
  {
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315395;
    *(_QWORD *)(v21 + 4) = "-[LPMedia setName:withError:]";
    *(_WORD *)(v21 + 12) = 2113;
    *(_QWORD *)(v21 + 14) = v9;
    _LPLogPack(3);
    v20 = 1;
    goto LABEL_10;
  }
  v11 = _os_log_pack_fill();
  v12 = __error();
  v13 = strerror(*v12);
  *(_DWORD *)v11 = 136315394;
  *(_QWORD *)(v11 + 4) = "-[LPMedia setName:withError:]";
  *(_WORD *)(v11 + 12) = 2080;
  *(_QWORD *)(v11 + 14) = v13;
  _LPLogPack(1);
  if (!a4)
    goto LABEL_8;
  v14 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BDD1128];
  v16 = *__error();
  v17 = v14;
  v18 = v15;
LABEL_7:
  v20 = 0;
  *a4 = (id)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v16, 0);
LABEL_10:

  return v20;
}

- (id)BSDName
{
  return -[LPMedia getStringPropertyWithName:](self, "getStringPropertyWithName:", CFSTR("BSD Name"));
}

- (id)devNodePath
{
  id v2;
  id v3;

  v2 = -[LPMedia BSDName](self, "BSDName");
  if (v2)
    v3 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/dev/%@"), v2);
  else
    v3 = 0;

  return v3;
}

- (id)mountPoint
{
  id v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  const char *v6;
  statfs *v7;
  id v8;
  statfs *v10;

  v2 = -[LPMedia devNodePath](self, "devNodePath");
  if (v2)
  {
    v10 = 0;
    v3 = getmntinfo_r_np(&v10, 2);
    if (v3 < 1)
    {
LABEL_6:
      v8 = 0;
    }
    else
    {
      v4 = 0;
      v5 = 2168 * v3;
      while (1)
      {
        v6 = (const char *)objc_msgSend(objc_retainAutorelease(v2), "fileSystemRepresentation");
        v7 = &v10[v4 / 0x878];
        if (!strcmp(v6, v10[v4 / 0x878].f_mntfromname))
          break;
        v4 += 2168;
        if (v5 == v4)
          goto LABEL_6;
      }
      v8 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7->f_mntonname);
    }
    if (v10)
      free(v10);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)vendorName
{
  return -[LPMedia _deviceCharacteristicStringForKey:](self, "_deviceCharacteristicStringForKey:", CFSTR("Vendor Name"));
}

- (id)deviceModel
{
  uint64_t v3;
  const __CFAllocator *v4;
  void *v5;

  v3 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (1)
  {
    v5 = (void *)IORegistryEntrySearchCFProperty(-[LPMedia ioMedia](self, "ioMedia"), "IOService", off_24BF04AA0[v3], v4, 3u);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;

    if (++v3 == 4)
    {
      v5 = 0;
      return v5;
    }
  }
  return v5;
}

- (int)storageMedium
{
  id v2;
  int v3;

  v2 = -[LPMedia _deviceCharacteristicStringForKey:](self, "_deviceCharacteristicStringForKey:", CFSTR("Medium Type"));
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Rotational")) & 1) != 0)
  {
    v3 = 1;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("Solid State")))
  {
    v3 = 2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isWhole
{
  return -[LPMedia getBoolPropertyWithName:](self, "getBoolPropertyWithName:", CFSTR("Whole"));
}

- (BOOL)isInternal
{
  void *v2;
  id v3;
  char v4;

  v2 = (void *)IORegistryEntrySearchCFProperty(-[LPMedia ioMedia](self, "ioMedia"), "IOService", CFSTR("Protocol Characteristics"), 0, 3u);
  v3 = (id)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Physical Interconnect Location"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Internal"));

  return v4;
}

- (BOOL)isEmbeddedDeviceTypeRoot
{
  void *v2;
  char v3;

  v2 = (void *)IORegistryEntrySearchCFProperty(-[LPMedia ioMedia](self, "ioMedia"), "IOService", CFSTR("EmbeddedDeviceTypeRoot"), 0, 3u);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isReadOnly
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  statfs v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x20BCF317C](self, a2);
  v4 = -[LPMedia mountPoint](self, "mountPoint");
  if (v4)
  {
    bzero(&v9, 0x878uLL);
    v5 = objc_retainAutorelease(v4);
    if (!statfs((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &v9))
    {
      v7 = v9.f_flags & 1;
      goto LABEL_6;
    }
    _os_log_pack_size();
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136315394;
    *(_QWORD *)(v6 + 4) = "-[LPMedia isReadOnly]";
    *(_WORD *)(v6 + 12) = 2112;
    *(_QWORD *)(v6 + 14) = v5;
    _LPLogPack(1);
  }
  v7 = 0;
LABEL_6:

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (BOOL)isJournaled
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  statfs v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x20BCF317C](self, a2);
  v4 = -[LPMedia mountPoint](self, "mountPoint");
  if (v4)
  {
    bzero(&v9, 0x878uLL);
    v5 = objc_retainAutorelease(v4);
    if (!statfs((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &v9))
    {
      v7 = BYTE2(v9.f_flags) >> 7;
      goto LABEL_6;
    }
    _os_log_pack_size();
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136315394;
    *(_QWORD *)(v6 + 4) = "-[LPMedia isJournaled]";
    *(_WORD *)(v6 + 12) = 2112;
    *(_QWORD *)(v6 + 14) = v5;
    _LPLogPack(1);
  }
  LOBYTE(v7) = 0;
LABEL_6:

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  id v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v3 = -[LPMedia mountPoint](self, "mountPoint");
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = (NSString *)-[LPMedia name](self, "name");
    v8 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: %@, Mount: %@"), v6, v7, v3);
  }
  else
  {
    v6 = (NSString *)-[LPMedia mediaUUID](self, "mediaUUID");
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v10);
    v11 = -[LPMedia name](self, "name");
    v12 = v11;
    if (v6)
      v13 = (void *)objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: %@, UUID: %@"), v7, v11, v6);
    else
      v13 = (void *)objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: %@"), v7, v11, v15);
    v8 = v13;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  io_object_t v6;
  io_object_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[LPMedia ioMedia](self, "ioMedia");
    v7 = objc_msgSend(v5, "ioMedia");

    v8 = IOObjectIsEqualTo(v6, v7) == 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_deviceCharacteristicStringForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)IORegistryEntrySearchCFProperty(-[LPMedia ioMedia](self, "ioMedia"), "IOService", CFSTR("Device Characteristics"), 0, 3u);
  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (unsigned)_copyIOMediaForDiskWithPath:(id)a3
{
  int v4;
  uint64_t v5;
  char *v6;
  io_service_t MatchingService;
  id v8;
  id v9;
  mach_port_t v10;
  id v11;
  const __CFDictionary *v12;
  statfs v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  bzero(&v14, 0x878uLL);
  if (statfs((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), &v14))
  {
    v4 = *__error();
    _os_log_pack_size();
    v5 = _os_log_pack_fill();
    v6 = strerror(v4);
    *(_DWORD *)v5 = 136315650;
    *(_QWORD *)(v5 + 4) = "+[LPMedia _copyIOMediaForDiskWithPath:]";
    *(_WORD *)(v5 + 12) = 1024;
    *(_DWORD *)(v5 + 14) = v4;
    *(_WORD *)(v5 + 18) = 2080;
    *(_QWORD *)(v5 + 20) = v6;
    _LPLogPack(1);
    return 0;
  }
  else
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14.f_mntfromname);
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("/dev/")))
    {
      v9 = (id)objc_msgSend(v8, "substringFromIndex:", 5);

      v8 = v9;
    }
    v10 = *MEMORY[0x24BDD8B20];
    v11 = objc_retainAutorelease(v8);
    v12 = IOBSDNameMatching(v10, 0, (const char *)objc_msgSend(v11, "UTF8String"));
    MatchingService = IOServiceGetMatchingService(v10, v12);

  }
  return MatchingService;
}

+ (unsigned)_copyLiveFilesystemIOMediaForRootedSnapshot
{
  int v2;
  uint64_t v3;
  char *v4;
  io_service_t MatchingService;
  id v6;
  id v7;
  id v8;
  int v9;
  id v10;
  id v11;
  const __CFDictionary *v12;
  statfs v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  bzero(&v14, 0x878uLL);
  if (statfs("/", &v14))
  {
    v2 = *__error();
    _os_log_pack_size();
    v3 = _os_log_pack_fill();
    v4 = strerror(v2);
    *(_DWORD *)v3 = 136315650;
    *(_QWORD *)(v3 + 4) = "+[LPMedia _copyLiveFilesystemIOMediaForRootedSnapshot]";
    *(_WORD *)(v3 + 12) = 1024;
    *(_DWORD *)(v3 + 14) = v2;
    *(_WORD *)(v3 + 18) = 2080;
    *(_QWORD *)(v3 + 20) = v4;
    _LPLogPack(1);
    return 0;
  }
  else
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14.f_mntfromname);
    v7 = (id)objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("@"));
    if (objc_msgSend(v7, "count") == 2
      && (v8 = (id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1),
          v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("/dev/")),
          v8,
          v9))
    {
      v10 = (id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v11 = (id)objc_msgSend(v10, "substringFromIndex:", 5);

      LODWORD(v10) = *MEMORY[0x24BDD8B20];
      v6 = objc_retainAutorelease(v11);
      v12 = IOBSDNameMatching((mach_port_t)v10, 0, (const char *)objc_msgSend(v6, "UTF8String"));
      MatchingService = IOServiceGetMatchingService((mach_port_t)v10, v12);
    }
    else
    {
      MatchingService = 0;
    }

  }
  return MatchingService;
}

- (unsigned)ioMedia
{
  return self->_ioMedia;
}

- (void)setIoMedia:(unsigned int)a3
{
  self->_ioMedia = a3;
}

+ (NSDictionary)contentTypeToSubclassMap
{
  if (contentTypeToSubclassMap_once != -1)
    dispatch_once(&contentTypeToSubclassMap_once, &__block_literal_global_136);
  return (NSDictionary *)(id)contentTypeToSubclassMap_sharedMap;
}

void __44__LPMedia_Private__contentTypeToSubclassMap__block_invoke()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *context;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  _QWORD v25[6];

  v25[4] = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x20BCF317C]();
  v0 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v1 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v20;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v20 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v5);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v7 = (id)objc_msgSend(v6, "supportedContentTypes");
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v16;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v16 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(v0, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11++));
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v3);
  }

  v12 = objc_msgSend(v0, "copy");
  v13 = (void *)contentTypeToSubclassMap_sharedMap;
  contentTypeToSubclassMap_sharedMap = v12;

  objc_autoreleasePoolPop(context);
}

- (id)getPropertyWithName:(id)a3
{
  __CFString *v4;
  void *CFProperty;
  uint64_t v6;

  v4 = (__CFString *)a3;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(-[LPMedia ioMedia](self, "ioMedia"), v4, 0, 0);
  if (!CFProperty)
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 136315394;
    *(_QWORD *)(v6 + 4) = "-[LPMedia(Private) getPropertyWithName:]";
    *(_WORD *)(v6 + 12) = 2112;
    *(_QWORD *)(v6 + 14) = v4;
    _LPLogPack(3);
  }

  return CFProperty;
}

- (BOOL)getBoolPropertyWithName:(id)a3
{
  id v3;
  char v4;

  v3 = -[LPMedia getPropertyWithName:](self, "getPropertyWithName:", a3);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (id)mediaOfCorrectTypeGivenIOMedia:(unsigned int)a3
{
  uint64_t v3;
  void *CFProperty;
  NSDictionary *v5;
  objc_class *v6;
  void *v7;
  mach_timespec_t waitTime;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x24BDAC8D0];
  waitTime = (mach_timespec_t)5;
  if (IOServiceWaitQuiet(a3, &waitTime) == -536870186)
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    *(_WORD *)_os_log_pack_fill() = 0;
    _LPLogPack(2);
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, CFSTR("Content"), 0, 0);
  if (!CFProperty
    || (v5 = +[LPMedia contentTypeToSubclassMap](LPMedia, "contentTypeToSubclassMap"),
        v6 = -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFProperty),
        v5,
        !v6))
  {
    v6 = (objc_class *)objc_opt_class();
  }
  v7 = (void *)objc_msgSend([v6 alloc], "initWithIOMediaObject:", v3);

  return v7;
}

+ (void)waitForIOMediaWithDevNode:(id)a3
{
  id v3;
  id v4;
  mach_port_t v5;
  id v6;
  const __CFDictionary *v7;
  io_service_t MatchingService;
  io_object_t v9;
  uint64_t v10;
  uint64_t v11;
  mach_timespec_t waitTime;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("/dev/")))
  {
    v4 = (id)objc_msgSend(v3, "substringFromIndex:", 5);

  }
  v5 = *MEMORY[0x24BDD8B20];
  v6 = objc_retainAutorelease(v4);
  v7 = IOBSDNameMatching(v5, 0, (const char *)objc_msgSend(v6, "fileSystemRepresentation"));
  MatchingService = IOServiceGetMatchingService(v5, v7);
  if (MatchingService)
  {
    v9 = MatchingService;
    waitTime = (mach_timespec_t)5;
    if (IOServiceWaitQuiet(MatchingService, &waitTime) == -536870186)
    {
      _os_log_pack_size();
      v10 = _os_log_pack_fill();
      *(_DWORD *)v10 = 138412290;
      *(_QWORD *)(v10 + 4) = v6;
      _LPLogPack(1);
    }
    IOObjectRelease(v9);
  }
  else
  {
    _os_log_pack_size();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 138412290;
    *(_QWORD *)(v11 + 4) = v6;
    _LPLogPack(1);
  }

}

+ (void)waitForBlockStorage
{
  const __CFDictionary *v2;
  unsigned int v3;
  io_object_t v4;
  io_service_t v5;
  char v6;
  BOOL v7;
  mach_timespec_t waitTime;
  io_iterator_t existing;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  existing = 0;
  v2 = IOServiceMatching("IOBlockStorageDevice");
  if (!IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v2, &existing))
  {
    v3 = 0;
    do
    {
      MEMORY[0x20BCF2F48](existing);
      waitTime = (mach_timespec_t)5;
      v4 = IOIteratorNext(existing);
      if (v4)
      {
        v5 = v4;
        v6 = 0;
        do
        {
          v6 |= IOServiceWaitQuiet(v5, &waitTime) == -536870186;
          IOObjectRelease(v5);
          v5 = IOIteratorNext(existing);
        }
        while (v5);
      }
      else
      {
        v6 = 0;
      }
      if (IOIteratorIsValid(existing))
        v7 = 1;
      else
        v7 = v3 >= 4;
      ++v3;
    }
    while (!v7);
    if ((v6 & 1) != 0)
    {
      _os_log_pack_size();
      *(_WORD *)_os_log_pack_fill() = 0;
      _LPLogPack(2);
    }
    IOObjectRelease(existing);
  }
}

@end
