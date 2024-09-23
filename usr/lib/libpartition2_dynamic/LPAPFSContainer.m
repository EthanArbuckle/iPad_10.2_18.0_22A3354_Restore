@implementation LPAPFSContainer

+ (id)supportedContentTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = LPAPFSContainerMediaTypeUUID[0];
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

+ (id)allAPFSContainers
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = +[LPMedia allMedia](LPMedia, "allMedia");
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9, (_QWORD)v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  return v10;
}

+ (id)diagsContainer
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = +[LPPartitionMedia primaryMedia](LPPartitionMedia, "primaryMedia");
  v3 = v2;
  if (v2)
  {
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (id)objc_msgSend(v2, "children");
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "role", (_QWORD)v11) == 1)
          {
            v5 = (id)objc_msgSend(v8, "container");
            goto LABEL_14;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    _os_log_pack_size();
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v9 + 4) = "+[LPAPFSContainer diagsContainer]";
    _LPLogPack(1);
    v5 = 0;
  }

  return v5;
}

- (id)addVolumeWithName:(id)a3 role:(int)a4 caseSensitive:(BOOL)a5 reserveSize:(int64_t)a6 quotaSize:(int64_t)a7 pairedVolume:(id)a8 error:(id *)a9
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;

  v12 = a5;
  v15 = a3;
  v16 = a8;
  v17 = -[LPMedia BSDName](self, "BSDName");
  v18 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v49 = v16;
  if (!v17)
  {
    if (a9)
      *a9 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    goto LABEL_12;
  }
  if (!v15)
  {
    if (a9)
      *a9 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v15, "length") < 0x80)
  {
    if (v16)
    {
      v22 = (id)objc_msgSend(v16, "BSDName");
      if (a4 != 1)
      {
        v24 = v22;
        if (a9)
          *a9 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
        _os_log_pack_size();
        goto LABEL_44;
      }
      v48 = v22;
      if ((objc_msgSend(v22, "hasPrefix:", v17) & 1) == 0)
      {
        if (a9)
          *a9 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
        _os_log_pack_size();
        v42 = _os_log_pack_fill();
        *(_DWORD *)v42 = 136315138;
        *(_QWORD *)(v42 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
        goto LABEL_48;
      }
      v23 = 1;
    }
    else
    {
      v48 = 0;
      if ((a4 - 1) > 0xF)
        v23 = 0;
      else
        v23 = word_206363688[a4 - 1];
    }
    objc_msgSend(v18, "setObject:forKey:", v15, *MEMORY[0x24BDFD360]);
    v25 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v23);
    objc_msgSend(v18, "setObject:forKey:", v25, *MEMORY[0x24BDFD380]);

    if (MEMORY[0x24BDFD368])
      objc_msgSend(v18, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFD368]);
    if (v12)
      objc_msgSend(v18, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFD348]);
    if (a6)
    {
      v26 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a6);
      objc_msgSend(v18, "setObject:forKey:", v26, *MEMORY[0x24BDFD378]);

    }
    if (a7)
    {
      v27 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a7);
      objc_msgSend(v18, "setObject:forKey:", v27, *MEMORY[0x24BDFD370]);

    }
    if (!v48)
      goto LABEL_37;
    v28 = (_QWORD *)MEMORY[0x24BDFD358];
    if (MEMORY[0x24BDFD358])
    {
      v29 = (id)objc_msgSend(v48, "substringFromIndex:", 4);
      v30 = (id)objc_msgSend(v29, "componentsSeparatedByString:", CFSTR("s"));
      if ((unint64_t)objc_msgSend(v30, "count") <= 1)
      {
        if (a9)
          *a9 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
        _os_log_pack_size();
        v46 = _os_log_pack_fill();
        *(_DWORD *)v46 = 136315138;
        *(_QWORD *)(v46 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
        _LPLogPack(1);

        goto LABEL_49;
      }
      v47 = v29;
      v31 = (id)objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v30, "count") - 1);
      v32 = objc_msgSend(v31, "intValue");

      v33 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v32);
      objc_msgSend(v18, "setObject:forKey:", v33, *v28);

LABEL_37:
      _os_log_pack_size();
      v34 = _os_log_pack_fill();
      v35 = objc_retainAutorelease(v17);
      v36 = objc_msgSend(v35, "fileSystemRepresentation");
      *(_DWORD *)v34 = 136315650;
      *(_QWORD *)(v34 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
      *(_WORD *)(v34 + 12) = 2080;
      *(_QWORD *)(v34 + 14) = v36;
      *(_WORD *)(v34 + 22) = 2112;
      *(_QWORD *)(v34 + 24) = v18;
      _LPLogPack(1);
      if (MEMORY[0x24BDFD2A0] && a4 == 1)
      {
        _os_log_pack_size();
        v37 = _os_log_pack_fill();
        *(_DWORD *)v37 = 136315138;
        *(_QWORD *)(v37 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
        _LPLogPack(1);
        objc_msgSend(objc_retainAutorelease(v35), "fileSystemRepresentation");
        v38 = APFSVolumeCreateForMSU();
        if (v38)
        {
LABEL_40:
          if (a9)
            *a9 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v38, 0);
          _os_log_pack_size();
          v39 = _os_log_pack_fill();
          *(_DWORD *)v39 = 136315394;
          *(_QWORD *)(v39 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
          *(_WORD *)(v39 + 12) = 1024;
          *(_DWORD *)(v39 + 14) = v38;
LABEL_48:
          _LPLogPack(1);
LABEL_49:
          v41 = v48;
          goto LABEL_50;
        }
      }
      else
      {
        objc_msgSend(objc_retainAutorelease(v35), "fileSystemRepresentation");
        v38 = APFSVolumeCreate();
        if (v38)
          goto LABEL_40;
      }
      v43 = (id)objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BDFD350]);
      v44 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@s%d"), v35, objc_msgSend(v43, "intValue") + 1);
      v45 = -[LPMedia BSDName](self, "BSDName");
      +[LPMedia waitForIOMediaWithDevNode:](LPMedia, "waitForIOMediaWithDevNode:", v45);

      v20 = +[LPMedia mediaForBSDNameOrDeviceNode:](LPMedia, "mediaForBSDNameOrDeviceNode:", v44);
      goto LABEL_14;
    }
    v24 = v48;
    _os_log_pack_size();
LABEL_44:
    v40 = _os_log_pack_fill();
    *(_DWORD *)v40 = 136315138;
    *(_QWORD *)(v40 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
    _LPLogPack(1);
    v41 = v24;
LABEL_50:

    goto LABEL_13;
  }
  if (a9)
    *a9 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
LABEL_12:
  _os_log_pack_size();
  v19 = _os_log_pack_fill();
  *(_DWORD *)v19 = 136315138;
  *(_QWORD *)(v19 + 4) = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
  _LPLogPack(1);
LABEL_13:
  v20 = 0;
LABEL_14:

  return v20;
}

- (id)volumes
{
  id v3;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  io_object_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  io_object_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[LPMedia BSDName](self, "BSDName");
  +[LPMedia waitForIOMediaWithDevNode:](LPMedia, "waitForIOMediaWithDevNode:", v3);

  v15 = 0;
  if (MEMORY[0x20BCF2F90](-[LPMedia ioMedia](self, "ioMedia"), "IOService", 1, &v15))
  {
    _os_log_pack_size();
    *(_WORD *)_os_log_pack_fill() = 0;
    _LPLogPack(1);
    return MEMORY[0x24BDBD1A8];
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    v14 = 0;
    v14 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 8);
    v6[4] = &v9;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3254779904;
    v7[2] = __26__LPAPFSContainer_volumes__block_invoke;
    v7[3] = &__block_descriptor_44_e8_32r_e8_v12__0I8l;
    v8 = v15;
    v7[4] = &v9;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3254779904;
    v6[2] = __26__LPAPFSContainer_volumes__block_invoke_18;
    v6[3] = &__block_descriptor_40_e8_32r_e5_v8__0l;
    iterateSafely(v15, 3, v7, v6);
    IOObjectRelease(v15);
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v10[5]);
    _Block_object_dispose(&v9, 8);

    return v5;
  }
}

void __26__LPAPFSContainer_volumes__block_invoke(uint64_t a1, uint64_t object)
{
  const __CFString *CFProperty;
  const __CFString *v5;
  CFTypeID v6;
  LPAPFSVolume *v7;

  if (IOObjectConformsTo(object, "IOMedia"))
  {
    MEMORY[0x20BCF2FC0](*(unsigned int *)(a1 + 40));
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(object, CFSTR("Content"), 0, 0);
    if (CFProperty)
    {
      v5 = CFProperty;
      v6 = CFGetTypeID(CFProperty);
      if (v6 == CFStringGetTypeID() && CFStringCompare(v5, LPAPFSVolumeMediaTypeUUID[0], 0) == kCFCompareEqualTo)
      {
        v7 = -[LPMedia initWithIOMediaObject:]([LPAPFSVolume alloc], "initWithIOMediaObject:", object);
        if (v7)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);

      }
      CFRelease(v5);
    }
  }
}

uint64_t __26__LPAPFSContainer_volumes__block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeAllObjects");
}

- (id)physicalStores
{
  id v3;
  id v4;
  id v5;
  id v6;
  const __CFDictionary *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  io_object_t v13;
  io_object_t v14;
  BOOLean_t v15;
  CFTypeRef CFProperty;
  const void *v17;
  CFTypeID v18;
  LPAPFSPhysicalStore *v19;
  BOOL v20;
  const __CFDictionary *v22;
  id v23;
  io_iterator_t v24;
  io_iterator_t existing;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[LPMedia BSDName](self, "BSDName");
  +[LPMedia waitForIOMediaWithDevNode:](LPMedia, "waitForIOMediaWithDevNode:", v3);

  v23 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v4 = -[LPMedia mediaUUID](self, "mediaUUID");
  if (v4)
  {
    existing = 0;
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
    v26 = CFSTR("Content");
    v27[0] = LPAPFSPhysicalStoreMediaUUID[0];
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("IOPropertyMatch"));

    v7 = (const __CFDictionary *)v5;
    if (IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v7, &existing))
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      v8 = _os_log_pack_fill();
      *(_DWORD *)v8 = 136315138;
      *(_QWORD *)(v8 + 4) = "-[LPAPFSContainer physicalStores]";
      _LPLogPack(1);
      v9 = 0;
    }
    else
    {
      v11 = IOIteratorNext(existing);
      if ((_DWORD)v11)
      {
        v12 = v11;
        do
        {
          v24 = 0;
          if (!MEMORY[0x20BCF2F90](v12, "IOService", 1, &v24))
          {
            v13 = IOIteratorNext(v24);
            if (v13)
            {
              v14 = v13;
              do
              {
                v15 = IOObjectConformsTo(v14, "IOMedia");
                if (v15)
                {
                  CFProperty = IORegistryEntryCreateCFProperty(v14, CFSTR("UUID"), 0, 0);
                  if (CFProperty)
                  {
                    v17 = CFProperty;
                    v18 = CFGetTypeID(CFProperty);
                    if (v18 == CFStringGetTypeID() && CFEqual(v17, v4))
                    {
                      v19 = -[LPMedia initWithIOMediaObject:]([LPAPFSPhysicalStore alloc], "initWithIOMediaObject:", v12);
                      if (v19)
                        objc_msgSend(v23, "addObject:", v19);

                    }
                    CFRelease(v17);
                  }
                }
                IOObjectRelease(v14);
                v14 = IOIteratorNext(v24);
                if (v14)
                  v20 = v15 == 0;
                else
                  v20 = 0;
              }
              while (v20);
            }
            IOObjectRelease(v24);
          }
          IOObjectRelease(v12);
          v12 = IOIteratorNext(existing);
        }
        while ((_DWORD)v12);
      }
      if (existing)
        IOObjectRelease(existing);
      v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v23, v7);
      v7 = v22;
    }

  }
  else
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[LPAPFSContainer physicalStores]";
    _LPLogPack(1);
    v9 = 0;
  }

  return v9;
}

- (id)volumesWithRole:(int)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = -[LPAPFSContainer volumes](self, "volumes");
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "role", (_QWORD)v14) == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  return v12;
}

- (id)prebootVolume
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = -[LPAPFSContainer volumesWithRole:](self, "volumesWithRole:", 6);
  if (objc_msgSend(v2, "count") == 1)
  {
    v3 = (id)objc_msgSend(v2, "objectAtIndex:", 0);
  }
  else
  {
    if ((unint64_t)objc_msgSend(v2, "count") >= 2)
    {
      _os_log_pack_size();
      v4 = _os_log_pack_fill();
      v5 = (id)objc_msgSend(v2, "description");
      *(_DWORD *)v4 = 138477827;
      *(_QWORD *)(v4 + 4) = v5;
      _LPLogPack(1);

    }
    v3 = 0;
  }

  return v3;
}

- (id)recoveryVolume
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = -[LPAPFSContainer volumesWithRole:](self, "volumesWithRole:", 4);
  if (objc_msgSend(v2, "count") == 1)
  {
    v3 = (id)objc_msgSend(v2, "objectAtIndex:", 0);
  }
  else
  {
    if ((unint64_t)objc_msgSend(v2, "count") >= 2)
    {
      _os_log_pack_size();
      v4 = _os_log_pack_fill();
      v5 = (id)objc_msgSend(v2, "description");
      *(_DWORD *)v4 = 138477827;
      *(_QWORD *)(v4 + 4) = v5;
      _LPLogPack(1);

    }
    v3 = 0;
  }

  return v3;
}

- (id)updateVolume
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = -[LPAPFSContainer volumesWithRole:](self, "volumesWithRole:", 12);
  if (objc_msgSend(v2, "count") == 1)
  {
    v3 = (id)objc_msgSend(v2, "objectAtIndex:", 0);
  }
  else
  {
    if ((unint64_t)objc_msgSend(v2, "count") >= 2)
    {
      _os_log_pack_size();
      v4 = _os_log_pack_fill();
      v5 = (id)objc_msgSend(v2, "description");
      *(_DWORD *)v4 = 138477827;
      *(_QWORD *)(v4 + 4) = v5;
      _LPLogPack(1);

    }
    v3 = 0;
  }

  return v3;
}

@end
