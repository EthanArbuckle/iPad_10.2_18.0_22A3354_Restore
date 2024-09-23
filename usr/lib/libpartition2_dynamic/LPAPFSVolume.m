@implementation LPAPFSVolume

+ (void)initialize
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[17];
  _QWORD v22[19];

  v22[17] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    v21[0] = &unk_24BF05BF0;
    v20 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v22[0] = v20;
    v21[1] = &unk_24BF05C08;
    v19 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v22[1] = v19;
    v21[2] = &unk_24BF05C20;
    v18 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v22[2] = v18;
    v21[3] = &unk_24BF05C38;
    v17 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
    v22[3] = v17;
    v21[4] = &unk_24BF05C50;
    v16 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
    v22[4] = v16;
    v21[5] = &unk_24BF05C68;
    v15 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
    v22[5] = v15;
    v21[6] = &unk_24BF05C80;
    v14 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v22[6] = v14;
    v21[7] = &unk_24BF05C98;
    v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
    v22[7] = v2;
    v21[8] = &unk_24BF05CB0;
    v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
    v22[8] = v3;
    v21[9] = &unk_24BF05CC8;
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
    v22[9] = v4;
    v21[10] = &unk_24BF05CE0;
    v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 11);
    v22[10] = v5;
    v21[11] = &unk_24BF05CF8;
    v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
    v22[11] = v6;
    v21[12] = &unk_24BF05D10;
    v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 13);
    v22[12] = v7;
    v21[13] = &unk_24BF05D28;
    v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 14);
    v22[13] = v8;
    v21[14] = &unk_24BF05D40;
    v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 15);
    v22[14] = v9;
    v21[15] = &unk_24BF05D58;
    v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
    v22[15] = v10;
    v21[16] = &unk_24BF05D70;
    v11 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 16);
    v22[16] = v11;
    v12 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 17);
    v13 = (void *)sRoleLookupTable;
    sRoleLookupTable = (uint64_t)v12;

    if (_is_running_in_ramdisk_onceToken != -1)
      dispatch_once(&_is_running_in_ramdisk_onceToken, &__block_literal_global_170);
    +[LPAPFSVolume _loadMountPointTableForMode:](LPAPFSVolume, "_loadMountPointTableForMode:", (_is_running_in_ramdisk_is_ramdisk & 1) == 0);
  }
}

+ (id)supportedContentTypes
{
  id v4;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    v6[0] = LPAPFSVolumeMediaTypeUUID[0];
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    return v4;
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___LPAPFSVolume;
    return objc_msgSendSuper2(&v5, sel_supportedContentTypes);
  }
}

+ (void)_loadMountPointTableForMode:(int)a3
{
  int *v3;
  int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v3 = (int *)((char *)&kLPDefaultMountPointTable + 16 * a3);
  v4 = *v3;
  v5 = *((_QWORD *)v3 + 1);
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", *v3);
  if (v4 >= 1)
  {
    v7 = v4;
    v8 = (uint64_t *)(v5 + 8);
    do
    {
      v9 = *((unsigned int *)v8 - 2);
      v10 = *v8;
      v8 += 2;
      v11 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
      v12 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
      objc_msgSend(v6, "setObject:forKey:", v11, v12);

      --v7;
    }
    while (v7);
  }
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
  v14 = (void *)sMountPointLookupTable;
  sMountPointLookupTable = (uint64_t)v13;

}

+ (id)defaultMountPointGivenRole:(int)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)sMountPointLookupTable;
  v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v5 = (id)objc_msgSend(v3, "objectForKey:", v4);

  return v5;
}

+ (id)defaultVolumeNameGivenRole:(int)a3
{
  uint64_t v3;

  v3 = 0;
  while (sLegacyVolumeNameMapping[v3] != a3)
  {
    v3 += 4;
    if (v3 == 44)
      return 0;
  }
  return *(id *)&sLegacyVolumeNameMapping[v3 + 2];
}

- (BOOL)setRole:(int)a3 withError:(id *)a4
{
  id v6;
  uint64_t i;
  id v8;
  int v9;
  int v10;

  v6 = -[LPMedia BSDName](self, "BSDName");
  for (i = 0; i != 34; i += 2)
  {
    if (sRoleEncodingMapping[i] == a3)
      break;
  }
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "fileSystemRepresentation");
  v9 = APFSVolumeRole();
  v10 = v9;
  if (a4 && v9)
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v9, 0);

  return v10 == 0;
}

- (int)role
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  id v10;
  id v11;

  v3 = objc_retainAutorelease(-[LPMedia BSDName](self, "BSDName"));
  objc_msgSend(v3, "UTF8String");
  v4 = APFSVolumeRole();

  if (v4)
  {
    _os_log_pack_size();
    v5 = _os_log_pack_fill();
    *(_DWORD *)v5 = 136315394;
    *(_QWORD *)(v5 + 4) = "-[LPAPFSVolume role]";
    *(_WORD *)(v5 + 12) = 1024;
    *(_DWORD *)(v5 + 14) = v4;
    _LPLogPack(1);
  }
  else
  {
    v9 = (void *)sRoleLookupTable;
    v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v11 = (id)objc_msgSend(v9, "objectForKey:", v10);
    v8 = objc_msgSend(v11, "intValue");

    if (v8)
      return v8;
  }
  v6 = -[LPMedia name](self, "name");
  v7 = 0;
  while (!objc_msgSend(v6, "isEqualToString:", *(_QWORD *)&sLegacyVolumeNameMapping[v7 + 2]))
  {
    v7 += 4;
    if (v7 == 44)
    {
      v8 = 0;
      goto LABEL_8;
    }
  }
  v8 = sLegacyVolumeNameMapping[v7];
LABEL_8:

  return v8;
}

- (id)volumeGroupUUID
{
  id v2;
  const char *v3;
  id v4;
  uuid_t uu;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = objc_retainAutorelease(-[LPMedia getStringPropertyWithName:](self, "getStringPropertyWithName:", CFSTR("VolGroupUUID")));
  v3 = (const char *)objc_msgSend(v2, "UTF8String");
  memset(uu, 0, sizeof(uu));
  if (!v3 || uuid_parse(v3, uu) || uuid_is_null(uu))
    v4 = 0;
  else
    v4 = v2;

  return v4;
}

- (id)container
{
  uint64_t v3;
  uint64_t v4;
  LPAPFSContainer *v5;
  LPAPFSContainer *v6;
  LPAPFSContainer *v7;
  _BOOL4 v8;
  LPAPFSContainer *v9;
  BOOL v10;
  io_iterator_t iterator;

  iterator = 0;
  if (MEMORY[0x20BCF2F90](-[LPMedia ioMedia](self, "ioMedia"), "IOService", 3, &iterator))
    return 0;
  v3 = IOIteratorNext(iterator);
  if ((_DWORD)v3)
  {
    v4 = v3;
    v5 = 0;
    do
    {
      if (IOObjectConformsTo(v4, "AppleAPFSMedia"))
      {
        v6 = -[LPMedia initWithIOMediaObject:]([LPAPFSContainer alloc], "initWithIOMediaObject:", v4);
        v7 = v6;
        v8 = v6 != 0;
        if (v6)
        {
          v9 = v6;

          v5 = v9;
        }

      }
      else
      {
        v8 = 0;
      }
      IOObjectRelease(v4);
      v4 = IOIteratorNext(iterator);
      if ((_DWORD)v4)
        v10 = !v8;
      else
        v10 = 0;
    }
    while (v10);
  }
  else
  {
    v5 = 0;
  }
  IOObjectRelease(iterator);
  return v5;
}

- (BOOL)isCaseSenstive
{
  return -[LPMedia getBoolPropertyWithName:](self, "getBoolPropertyWithName:", CFSTR("CaseSensitive"));
}

- (BOOL)isEncrypted
{
  id v2;

  v2 = objc_retainAutorelease(-[LPMedia devNodePath](self, "devNodePath"));
  objc_msgSend(v2, "fileSystemRepresentation");
  APFSVolumeGetVEKState();

  return 0;
}

- (BOOL)isFilevaultEncrypted
{
  id v2;

  v2 = objc_retainAutorelease(-[LPMedia devNodePath](self, "devNodePath"));
  objc_msgSend(v2, "fileSystemRepresentation");
  APFSVolumeGetVEKState();

  return 0;
}

- (id)pairedVolume
{
  id v3;
  int v4;
  id v5;
  int v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = -[LPAPFSVolume container](self, "container");
  v4 = -[LPAPFSVolume role](self, "role");
  v5 = -[LPAPFSVolume volumeGroupUUID](self, "volumeGroupUUID");
  v15 = 0u;
  v16 = 0u;
  if (v4 == 1)
    v6 = 3;
  else
    v6 = 1;
  v17 = 0uLL;
  v18 = 0uLL;
  v7 = (id)objc_msgSend(v3, "volumes", (_QWORD)v15);
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "role") == v6)
        {
          v12 = (id)objc_msgSend(v11, "volumeGroupUUID");
          v13 = objc_msgSend(v12, "isEqualToString:", v5);

          if (v13)
          {
            v8 = v11;
            goto LABEL_15;
          }
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

  return v8;
}

- (id)snapshotMountPoints
{
  id v2;
  id v3;
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v18;
  id v19;
  statfs *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v2 = -[LPMedia devNodePath](self, "devNodePath");
  if (v2)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@%@"), v2);
    v20 = 0;
    v4 = getmntinfo_r_np(&v20, 0);
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 13);
    v6 = (void *)MEMORY[0x20BCF317C]();
    if (v4 >= 1)
    {
      v18 = v6;
      v19 = v2;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v20[v7].f_mntfromname, v18, v19);
        if (objc_msgSend(v10, "hasSuffix:", v3))
        {
          v11 = (id)objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "rangeOfString:options:", CFSTR("@"), 4));

          v12 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v20[v7].f_mntonname);
          v21[0] = LPAPFSVolumeSnapshotMountPointKeyName;
          v21[1] = LPAPFSVolumeSnapshotMountPointKeyMountPoint;
          v22[0] = v11;
          v22[1] = v12;
          v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
          objc_msgSend(v5, "addObject:", v13);

          v9 = v12;
          v8 = v11;
        }

        ++v7;
      }
      while (v4 != v7);

      v6 = v18;
      v2 = v19;
    }
    objc_autoreleasePoolPop(v6);
    if (v20)
      free(v20);
    if (objc_msgSend(v5, "count"))
      v14 = v5;
    else
      v14 = 0;
    v15 = v14;

  }
  else
  {
    _os_log_pack_size();
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[LPAPFSVolume snapshotMountPoints]";
    _LPLogPack(1);
    v15 = 0;
  }

  return v15;
}

- (BOOL)isMounted
{
  id v3;
  BOOL v4;
  id v5;

  v3 = -[LPMedia mountPoint](self, "mountPoint");
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = -[LPAPFSVolume snapshotMountPoints](self, "snapshotMountPoints");
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)eraseVolumeWithError:(id *)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  uint64_t v8;

  v4 = -[LPMedia mountPoint](self, "mountPoint");
  v5 = v4;
  if (v4)
  {
    v6 = _lp2_delete_directory_contents((const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"));
    if (a3 && v6)
      *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v6, 0);
    v7 = *__error() == 0;
  }
  else
  {
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    _os_log_pack_size();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v8 + 4) = "-[LPAPFSVolume eraseVolumeWithError:]";
    _LPLogPack(1);
    v7 = 0;
  }

  return v7;
}

- (BOOL)mountWithError:(id *)a3
{
  id v5;
  BOOL v6;
  id v7;
  id v8;
  id v9;

  v5 = -[LPMedia mountPoint](self, "mountPoint");

  if (v5)
    return 1;
  v7 = +[LPAPFSVolume defaultMountPointGivenRole:](LPAPFSVolume, "defaultMountPointGivenRole:", -[LPAPFSVolume role](self, "role"));
  if (v7
    && (v8 = +[LPMedia mediaForPath:](LPMedia, "mediaForPath:", v7),
        v8,
        !v8))
  {
    v6 = -[LPAPFSVolume mountAtPath:error:](self, "mountAtPath:error:", v7, a3);
  }
  else
  {
    v9 = -[LPAPFSVolume mountAtTemporaryPathWithError:](self, "mountAtTemporaryPathWithError:", a3);
    v6 = v9 != 0;

  }
  return v6;
}

- (BOOL)mountAtPath:(id)a3 error:(id *)a4
{
  return -[LPAPFSVolume mountAtPath:options:error:](self, "mountAtPath:options:error:", a3, 0, a4);
}

- (id)_createTemporaryMountPointWithError:(id *)a3
{
  uint64_t v5;
  char v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (_is_running_in_ramdisk_onceToken != -1)
    dispatch_once(&_is_running_in_ramdisk_onceToken, &__block_literal_global_170);
  bzero(v6, 0x400uLL);
  __strlcpy_chk();
  if (mkdtemp(v6))
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
  _os_log_pack_size();
  MEMORY[0x24BDAC7A8]();
  v5 = _os_log_pack_fill();
  *(_DWORD *)v5 = 136315138;
  *(_QWORD *)(v5 + 4) = v6;
  _LPLogPack(1);
  if (*a3)
    *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
  return 0;
}

- (id)mountAtTemporaryPathWithError:(id *)a3
{
  return -[LPAPFSVolume mountAtTemporaryPathWithOptions:error:](self, "mountAtTemporaryPathWithOptions:error:", 0, a3);
}

- (id)mountAtTemporaryPathWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = -[LPAPFSVolume _createTemporaryMountPointWithError:](self, "_createTemporaryMountPointWithError:", a4);
  if (v7 && -[LPAPFSVolume mountAtPath:options:error:](self, "mountAtPath:options:error:", v7, v6, a4))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (BOOL)mountAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  unsigned int v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  unsigned int v44;
  id v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  int v55;
  void *v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  _QWORD v70[2];
  _QWORD v71[2];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = -[LPMedia devNodePath](self, "devNodePath");
  if (v10)
  {
    v11 = -[LPMedia mountPoint](self, "mountPoint");
    v12 = objc_msgSend(v11, "isEqualToString:", v8);
    if (!v9 && v12)
    {
      _os_log_pack_size();
      v13 = _os_log_pack_fill();
      *(_DWORD *)v13 = 138412290;
      *(_QWORD *)(v13 + 4) = v8;
      _LPLogPack(2);
      v14 = 1;
LABEL_43:

      goto LABEL_44;
    }
    if (v11)
    {
      _os_log_pack_size();
      v18 = _os_log_pack_fill();
      *(_DWORD *)v18 = 138412546;
      *(_QWORD *)(v18 + 4) = v11;
      *(_WORD *)(v18 + 12) = 2112;
      *(_QWORD *)(v18 + 14) = v8;
      _LPLogPack(2);
      v14 = 0;
      if (!-[LPAPFSVolume unmountWithError:](self, "unmountWithError:", a5))
        goto LABEL_43;
    }
    v19 = objc_retainAutorelease(v8);
    v20 = mkpath_np((const char *)objc_msgSend(v19, "fileSystemRepresentation"), 0x1FFu);
    v68 = v11;
    if (v20 && v20 != 17)
    {
      if (a5)
      {
        v26 = (void *)MEMORY[0x24BDD1540];
        v27 = *MEMORY[0x24BDD1128];
        v28 = v10;
        v29 = v20;
        v78 = *MEMORY[0x24BDD0CB8];
        v79[0] = v19;
        v30 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
        v31 = v29;
        v10 = v28;
        *a5 = (id)objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, v31, v30);

      }
      _os_log_pack_size();
      v32 = _os_log_pack_fill();
      v33 = objc_retainAutorelease(-[LPMedia description](self, "description"));
      v34 = objc_msgSend(v33, "UTF8String");
      v35 = objc_msgSend(objc_retainAutorelease(v19), "fileSystemRepresentation");
      *(_DWORD *)v32 = 136380931;
      *(_QWORD *)(v32 + 4) = v34;
      *(_WORD *)(v32 + 12) = 2081;
      *(_QWORD *)(v32 + 14) = v35;

      _LPLogPack(1);
      v14 = 0;
      v11 = v68;
      goto LABEL_43;
    }
    v74 = xmmword_24BF049E8;
    v75 = unk_24BF049F8;
    v76 = xmmword_24BF04A08;
    v77 = 0;
    v72 = xmmword_24BF049C8;
    v73 = unk_24BF049D8;
    v21 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", LPAPFSVolumeMountOptionReadOnly);
    v22 = v21;
    v23 = (void *)MEMORY[0x24BDBD1C0];
    if (!v21)
      v21 = (id)MEMORY[0x24BDBD1C0];
    v24 = v21;

    v65 = v24;
    if (objc_msgSend(v24, "BOOLValue"))
    {
      *((_QWORD *)&v72 + 1) = "-o";
      *(_QWORD *)&v73 = "rdonly";
      v25 = 3;
    }
    else
    {
      v25 = 1;
    }
    v36 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", LPAPFSVolumeMountOptionNoBrowse);
    v37 = v36;
    if (!v36)
      v36 = (id)MEMORY[0x24BDBD1C8];
    v38 = v36;

    v64 = v38;
    if (objc_msgSend(v38, "BOOLValue"))
    {
      *((_QWORD *)&v72 + v25) = "-o";
      v39 = v25 + 1;
      v25 += 2;
      *((_QWORD *)&v72 + v39) = "nobrowse";
    }
    v40 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", LPAPFSVolumeMountOptionNoFirmlinks);
    v41 = v40;
    if (!v40)
      v40 = v23;
    v42 = v40;

    v63 = v42;
    if (objc_msgSend(v42, "BOOLValue"))
      *((_QWORD *)&v72 + v25++) = "-n";
    v67 = v8;
    v43 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", LPAPFSVolumeMountOptionSnapshotName);
    v60 = objc_msgSend(v43, "length");
    v62 = v43;
    if (v60)
    {
      v44 = v25 + 1;
      *((_QWORD *)&v72 + v25) = "-s";
      v25 += 2;
      *((_QWORD *)&v72 + v44) = objc_msgSend(objc_retainAutorelease(v43), "fileSystemRepresentation");
    }
    v66 = v10;
    v45 = objc_retainAutorelease(v10);
    *((_QWORD *)&v72 + v25) = objc_msgSend(v45, "fileSystemRepresentation");
    v61 = objc_retainAutorelease(v19);
    *((_QWORD *)&v72 + v25 + 1) = objc_msgSend(v61, "fileSystemRepresentation");
    v46 = _execForLibpartition((const char **)&v72);
    if ((_DWORD)v46 == 75)
    {
      _os_log_pack_size();
      v47 = 0;
      do
      {
        v48 = _os_log_pack_fill();
        *(_DWORD *)v48 = 138412802;
        *(_QWORD *)(v48 + 4) = v45;
        *(_WORD *)(v48 + 12) = 1024;
        *(_DWORD *)(v48 + 14) = 75;
        *(_WORD *)(v48 + 18) = 1024;
        *(_DWORD *)(v48 + 20) = v47;
        _LPLogPack(1);
        sleep(3u);
        v46 = _execForLibpartition((const char **)&v72);
        if ((_DWORD)v46 != 75)
          break;
      }
      while (v47++ < 2);
    }
    v14 = (_DWORD)v46 == 0;
    if ((_DWORD)v46)
    {
      v8 = v67;
      v11 = v68;
      if (a5)
      {
        v50 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mount_apfs returned : %d"), v46);
        v51 = (void *)MEMORY[0x24BDD1540];
        v69 = *MEMORY[0x24BDD1128];
        v52 = *MEMORY[0x24BDD0FC8];
        v70[0] = *MEMORY[0x24BDD0FD8];
        v70[1] = v52;
        v71[0] = CFSTR("Mount failed");
        v71[1] = v50;
        v53 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
        *a5 = (id)objc_msgSend(v51, "errorWithDomain:code:userInfo:", v69, 22, v53);

      }
      _os_log_pack_size();
      v54 = _os_log_pack_fill();
      *(_DWORD *)v54 = 138412546;
      *(_QWORD *)(v54 + 4) = v45;
      *(_WORD *)(v54 + 12) = 1024;
      *(_DWORD *)(v54 + 14) = v46;
      v55 = 1;
    }
    else
    {
      v8 = v67;
      v11 = v68;
      if (v60)
      {
        _os_log_pack_size();
        v57 = _os_log_pack_fill();
        *(_DWORD *)v57 = 138412803;
        *(_QWORD *)(v57 + 4) = v45;
        *(_WORD *)(v57 + 12) = 2113;
        v56 = v62;
        *(_QWORD *)(v57 + 14) = v62;
        *(_WORD *)(v57 + 22) = 2113;
        *(_QWORD *)(v57 + 24) = v61;
        _LPLogPack(2);
        v10 = v66;
        goto LABEL_42;
      }
      _os_log_pack_size();
      v59 = _os_log_pack_fill();
      *(_DWORD *)v59 = 138412547;
      *(_QWORD *)(v59 + 4) = v45;
      *(_WORD *)(v59 + 12) = 2113;
      *(_QWORD *)(v59 + 14) = v61;
      v55 = 2;
    }
    _LPLogPack(v55);
    v10 = v66;
    v56 = v62;
LABEL_42:

    goto LABEL_43;
  }
  if (a5)
    *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
  _os_log_pack_size();
  v15 = _os_log_pack_fill();
  v16 = objc_retainAutorelease(-[LPMedia description](self, "description"));
  v17 = objc_msgSend(v16, "UTF8String");
  *(_DWORD *)v15 = 136315138;
  *(_QWORD *)(v15 + 4) = v17;

  _LPLogPack(1);
  v14 = 0;
LABEL_44:

  return v14;
}

- (BOOL)unmountWithError:(id *)a3
{
  return -[LPAPFSVolume unmountWithOptions:error:](self, "unmountWithOptions:error:", 0, a3);
}

- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  int v7;
  id v8;
  BOOL v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  int v33;
  int v34;
  id v35;
  uint64_t v36;
  id v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  id v42;
  uint64_t v43;
  BOOL v44;
  LPAPFSVolume *v45;
  int v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v67;
  id v68;
  void *v69;
  LPAPFSVolume *v70;
  char v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v58 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v6 = (id)objc_msgSend(v5, "objectForKey:", LPAPFSVolumeUnmountOptionAll);
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = (id)objc_msgSend(v5, "objectForKey:", LPAPFSVolumeUnmountOptionSnapshotName);
  if (v8)
    v9 = 0;
  else
    v9 = v7 == 0;
  v61 = v5;
  v70 = self;
  if (v9)
  {
    v28 = -[LPMedia mountPoint](self, "mountPoint");

    if (!v28)
      goto LABEL_28;
    v29 = -[LPMedia mountPoint](self, "mountPoint");
    objc_msgSend(v58, "addObject:", v29);
    v30 = v29;
  }
  else
  {
    v10 = -[LPAPFSVolume snapshotMountPoints](self, "snapshotMountPoints");
    v11 = -[LPMedia mountPoint](self, "mountPoint");
    v12 = v11;
    if (v10)
    {
      v64 = v11;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v67 = v10;
      v68 = v10;
      v13 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      v14 = v58;
      if (v13)
      {
        v15 = v13;
        v16 = *(_QWORD *)v77;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v77 != v16)
              objc_enumerationMutation(v68);
            v18 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            if ((v7 & 1) != 0)
            {
              v19 = (id)objc_msgSend(v18, "objectForKey:", LPAPFSVolumeSnapshotMountPointKeyMountPoint);
              objc_msgSend(v14, "addObject:", v19);

            }
            else
            {
              v20 = (id)objc_msgSend(v61, "objectForKey:", LPAPFSVolumeSnapshotMountPointKeyName);
              v21 = (id)objc_msgSend(v18, "objectForKey:", v20);
              v22 = (id)objc_msgSend(v61, "objectForKey:", LPAPFSVolumeUnmountOptionSnapshotName);
              v23 = objc_msgSend(v21, "isEqualToString:", v22);

              v24 = v21;
              v14 = v58;

              v25 = v20;
              self = v70;

              if (v23)
              {
                v26 = (id)objc_msgSend(v18, "objectForKey:", LPAPFSVolumeSnapshotMountPointKeyMountPoint);
                objc_msgSend(v58, "addObject:", v26);

                if ((v7 & 1) == 0)
                {

                  v5 = v61;
                  v10 = v67;
                  v12 = v64;
                  goto LABEL_26;
                }
              }
            }
          }
          v15 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
          if (v15)
            continue;
          break;
        }
      }

      v5 = v61;
      v10 = v67;
      v12 = v64;
    }
    if (v12)
      v27 = v7;
    else
      v27 = 0;
    if (v27 == 1)
      objc_msgSend(v58, "addObject:", v12);
LABEL_26:

    v30 = v10;
  }

LABEL_28:
  if (objc_msgSend(v58, "count"))
  {
    objc_msgSend(v58, "sortUsingComparator:", &__block_literal_global);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v59 = v58;
    v62 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    if (!v62)
    {
      v44 = 0;
      goto LABEL_67;
    }
    v60 = *(_QWORD *)v73;
    v63 = *MEMORY[0x24BDD1128];
    while (1)
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v73 != v60)
          objc_enumerationMutation(v59);
        v69 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v31);
        v65 = v31;
        if (v5)
        {
          v32 = (id)objc_msgSend(v5, "objectForKey:", LPAPFSVolumeUnmountOptionForce);
          v33 = v32 != 0;

          v34 = v33 << 19;
          v35 = (id)objc_msgSend(v5, "objectForKey:", LPAPFSVolumeUnmountOptionDoNotLock);

          if (v35)
          {
            v71 = 1;
            if (fsctl((const char *)objc_msgSend(objc_retainAutorelease(v69), "fileSystemRepresentation"), 0x80014A22uLL, &v71, 0))
            {
              if (*__error() == 17)
              {
                _os_log_pack_size();
                v36 = _os_log_pack_fill();
                v37 = -[LPMedia devNodePath](self, "devNodePath");
                *(_DWORD *)v36 = 138412290;
                *(_QWORD *)(v36 + 4) = v37;
                v38 = 2;
              }
              else
              {
                _os_log_pack_size();
                v39 = _os_log_pack_fill();
                v37 = -[LPMedia devNodePath](self, "devNodePath");
                v40 = *__error();
                *(_DWORD *)v39 = 138412546;
                *(_QWORD *)(v39 + 4) = v37;
                *(_WORD *)(v39 + 12) = 1024;
                *(_DWORD *)(v39 + 14) = v40;
                v38 = 1;
              }
              _LPLogPack(v38);

            }
          }
        }
        else
        {
          v34 = 0;
        }
        v41 = 0;
        while (1)
        {
          v42 = objc_retainAutorelease(v69);
          if (!unmount((const char *)objc_msgSend(v42, "fileSystemRepresentation"), v34))
            break;
          v43 = *__error();
          v44 = v43 == 22;
          v45 = v70;
          if ((_DWORD)v43 == 22)
          {
            _os_log_pack_size();
            *(_WORD *)_os_log_pack_fill() = 0;
            _LPLogPack(1);
          }
          else if (v41 < 3)
          {
            if ((_DWORD)v43 == 35 || (_DWORD)v43 == 16)
            {
              ++v41;
              sleep(3u);
              v46 = 1;
              goto LABEL_57;
            }
          }
          else
          {
            if (v41 == 3 && (_DWORD)v43 == 16 && -[LPAPFSVolume role](v70, "role") != 12)
            {
              v34 |= 0x80000u;
              sleep(3u);
              _os_log_pack_size();
              v47 = _os_log_pack_fill();
              v48 = -[LPMedia devNodePath](v70, "devNodePath");
              *(_DWORD *)v47 = 138412546;
              *(_QWORD *)(v47 + 4) = v48;
              *(_WORD *)(v47 + 12) = 1024;
              *(_DWORD *)(v47 + 14) = 16;
              v45 = v70;
              v46 = 1;
              _LPLogPack(1);

              v41 = 4;
              goto LABEL_57;
            }
            if (a4)
            {
              v46 = 0;
              *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v63, v43, 0);
              goto LABEL_57;
            }
          }
          v46 = 0;
LABEL_57:
          _os_log_pack_size();
          v49 = _os_log_pack_fill();
          v50 = -[LPMedia devNodePath](v45, "devNodePath");
          v51 = v50;
          *(_DWORD *)v49 = 138412802;
          v52 = "no";
          if (v46)
            v52 = "yes";
          *(_QWORD *)(v49 + 4) = v50;
          *(_WORD *)(v49 + 12) = 2080;
          *(_QWORD *)(v49 + 14) = v52;
          *(_WORD *)(v49 + 22) = 1024;
          *(_DWORD *)(v49 + 24) = v43;
          _LPLogPack(1);

          if ((v46 & 1) == 0)
          {
            self = v70;
            goto LABEL_62;
          }
        }
        _os_log_pack_size();
        v53 = _os_log_pack_fill();
        self = v70;
        v54 = -[LPMedia devNodePath](v70, "devNodePath");
        *(_DWORD *)v53 = 138412547;
        *(_QWORD *)(v53 + 4) = v54;
        *(_WORD *)(v53 + 12) = 2113;
        *(_QWORD *)(v53 + 14) = v42;
        _LPLogPack(2);

        v44 = 1;
LABEL_62:
        v31 = v65 + 1;
        v5 = v61;
      }
      while (v65 + 1 != v62);
      v62 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      if (!v62)
      {
LABEL_67:

        goto LABEL_68;
      }
    }
  }
  _os_log_pack_size();
  v55 = _os_log_pack_fill();
  v56 = -[LPMedia devNodePath](self, "devNodePath");
  *(_DWORD *)v55 = 138412290;
  *(_QWORD *)(v55 + 4) = v56;
  _LPLogPack(2);

  v44 = 1;
LABEL_68:

  return v44;
}

uint64_t __41__LPAPFSVolume_unmountWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

- (BOOL)unmountAllWithError:(id *)a3
{
  id v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = LPAPFSVolumeUnmountOptionAll;
  v8[0] = MEMORY[0x24BDBD1C8];
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  LOBYTE(a3) = -[LPAPFSVolume unmountWithOptions:error:](self, "unmountWithOptions:error:", v5, a3);

  return (char)a3;
}

- (BOOL)deleteVolumeWithError:(id *)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  BOOL v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;

  v4 = -[LPMedia devNodePath](self, "devNodePath");
  if (v4)
  {
    _os_log_pack_size();
    v5 = _os_log_pack_fill();
    *(_QWORD *)&v6 = 136315394;
    v20 = v6;
    *(_DWORD *)v5 = 136315394;
    *(_QWORD *)(v5 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
    *(_WORD *)(v5 + 12) = 2112;
    *(_QWORD *)(v5 + 14) = v4;
    _LPLogPack(2);
    objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
    v7 = APFSVolumeDelete();
    if (!v7)
    {
      v14 = 1;
      goto LABEL_18;
    }
    v8 = v7;
    if (v7 >> 26 == 56)
    {
      _os_log_pack_size();
      v9 = _os_log_pack_fill();
      v10 = v8 & 0x3FFF;
      *(_DWORD *)v9 = v20;
      *(_QWORD *)(v9 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
      *(_WORD *)(v9 + 12) = 1024;
      *(_DWORD *)(v9 + 14) = v10;
      _LPLogPack(1);
      if (a3)
      {
        v11 = (void *)MEMORY[0x24BDD1540];
        v12 = CFSTR("com.apple.IOKit");
LABEL_14:
        v17 = v10;
LABEL_17:
        v14 = 0;
        *a3 = (id)objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v17, 0, v20);
        goto LABEL_18;
      }
    }
    else
    {
      v15 = v7 & 0xFFFFC000;
      _os_log_pack_size();
      if (v15 == 49152)
      {
        v16 = _os_log_pack_fill();
        v10 = v8 & 0x3FFF;
        *(_DWORD *)v16 = v20;
        *(_QWORD *)(v16 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
        *(_WORD *)(v16 + 12) = 1024;
        *(_DWORD *)(v16 + 14) = v10;
        _LPLogPack(1);
        if (a3)
        {
          v11 = (void *)MEMORY[0x24BDD1540];
          v12 = (const __CFString *)*MEMORY[0x24BDD1128];
          goto LABEL_14;
        }
      }
      else
      {
        v18 = _os_log_pack_fill();
        *(_DWORD *)v18 = v20;
        *(_QWORD *)(v18 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
        *(_WORD *)(v18 + 12) = 1024;
        *(_DWORD *)(v18 + 14) = v8;
        _LPLogPack(1);
        if (a3)
        {
          v11 = (void *)MEMORY[0x24BDD1540];
          v12 = (const __CFString *)*MEMORY[0x24BDD1100];
          v17 = (int)v8;
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    _os_log_pack_size();
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v13 + 4) = "-[LPAPFSVolume deleteVolumeWithError:]";
    _LPLogPack(1);
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (id)snapshotsWithError:(id *)a3
{
  id v3;
  id v4;
  id v5;
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
  v3 = -[LPAPFSVolume snapshotInfoWithError:](self, "snapshotInfoWithError:", a3);
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "objectForKey:", LPAPFSSnapshotPropertyKeyName[0], (_QWORD)v12);
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (id)snapshotInfoWithError:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  int v8;
  int v9;
  int v10;
  unsigned int *v11;
  BOOL v12;
  int *v13;
  unsigned int v14;
  id v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  id v39;
  int v40;
  void *v41;
  uint64_t v42;
  attrlist v43;
  _QWORD v44[258];

  v44[256] = *MEMORY[0x24BDAC8D0];
  v5 = -[LPMedia mountPoint](self, "mountPoint");
  v6 = v5;
  if (!v5)
  {
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    _os_log_pack_size();
    v33 = _os_log_pack_fill();
    v34 = -[LPMedia description](self, "description");
    *(_DWORD *)v33 = 136315395;
    *(_QWORD *)(v33 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
    *(_WORD *)(v33 + 12) = 2113;
    *(_QWORD *)(v33 + 14) = v34;
    _LPLogPack(1);

    goto LABEL_43;
  }
  v7 = objc_retainAutorelease(v5);
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0x100000);
  if (v8 < 0)
  {
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    _os_log_pack_size();
    v35 = _os_log_pack_fill();
    *(_DWORD *)v35 = 136315651;
    *(_QWORD *)(v35 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
    *(_WORD *)(v35 + 12) = 2113;
    *(_QWORD *)(v35 + 14) = v7;
    *(_WORD *)(v35 + 22) = 1024;
    *(_DWORD *)(v35 + 24) = 0;
    _LPLogPack(1);
LABEL_43:
    v32 = 0;
    goto LABEL_47;
  }
  v9 = v8;
  v38 = v6;
  v39 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  *(_QWORD *)&v43.volattr = 0;
  *(_QWORD *)&v43.fileattr = 0;
  bzero(v44, 0x800uLL);
  *(_QWORD *)&v43.bitmapcount = 0xA000002100000005;
  v10 = fs_snapshot_list(v9, &v43, v44, 0x800uLL, 0);
  if (v10 >= 1)
  {
    v11 = (unsigned int *)v44;
    v40 = v9;
    do
    {
      do
      {
        v12 = __OFSUB__(v10--, 1);
        if (v10 < 0 != v12)
          break;
        v13 = (int *)(v11 + 6);
        v14 = v11[1];
        v42 = *v11;
        if ((v14 & 0x20000000) != 0)
        {
          v17 = *v13;
          _os_log_pack_size();
          v18 = _os_log_pack_fill();
          *(_DWORD *)v18 = 136315394;
          *(_QWORD *)(v18 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
          *(_WORD *)(v18 + 12) = 1024;
          *(_DWORD *)(v18 + 14) = v17;
          _LPLogPack(1);
        }
        else
        {
          if ((v14 & 1) != 0)
          {
            v19 = (char *)v13 + *v13;
            v15 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v19);
            if (!v15)
            {
              _os_log_pack_size();
              v20 = _os_log_pack_fill();
              *(_DWORD *)v20 = 136315395;
              *(_QWORD *)(v20 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
              *(_WORD *)(v20 + 12) = 2081;
              *(_QWORD *)(v20 + 14) = v19;
              _LPLogPack(2);
            }
            v13 = (int *)(v11 + 8);
            v16 = v11[1];
          }
          else
          {
            v15 = 0;
            LOBYTE(v16) = v11[1];
          }
          v41 = v15;
          if ((v16 & 0x20) != 0)
          {
            v24 = *(_QWORD *)v13;
            v23 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)v13 & 0x3FFFFFFFFFFFFFFFLL);
            v25 = (void *)MEMORY[0x24BDBD1C8];
            v26 = (void *)MEMORY[0x24BDBD1C0];
            if ((v24 & 0x4000000000000000) != 0)
              v27 = (void *)MEMORY[0x24BDBD1C8];
            else
              v27 = (void *)MEMORY[0x24BDBD1C0];
            v22 = v27;
            if (v24 < 0)
              v28 = v25;
            else
              v28 = v26;
            v21 = v28;
          }
          else
          {
            v21 = 0;
            v22 = 0;
            v23 = 0;
          }
          v29 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
          v30 = v29;
          if (v41)
            objc_msgSend(v29, "setObject:forKey:", v41, LPAPFSSnapshotPropertyKeyName[0]);
          if (v23)
            objc_msgSend(v30, "setObject:forKey:", v23, LPAPFSSnapshotPropertyKeyXID[0]);
          if (v22)
            objc_msgSend(v30, "setObject:forKey:", v22, LPAPFSSnapshotPropertyKeyMarkedForRevert);
          if (v21)
            objc_msgSend(v30, "setObject:forKey:", v21, LPAPFSSnapshotPropertyKeyMarkedForRoot[0]);
          if (objc_msgSend(v30, "count"))
            objc_msgSend(v39, "addObject:", v30);

          v9 = v40;
        }
        v11 = (unsigned int *)((char *)v11 + v42);
      }
      while ((v14 & 0x20000000) == 0);
      v11 = (unsigned int *)v44;
      v10 = fs_snapshot_list(v9, &v43, v44, 0x800uLL, 0);
    }
    while (v10 > 0);
  }
  if (v10 < 0)
  {
    _os_log_pack_size();
    v36 = _os_log_pack_fill();
    *(_DWORD *)v36 = 136315394;
    *(_QWORD *)(v36 + 4) = "-[LPAPFSVolume snapshotInfoWithError:]";
    *(_WORD *)(v36 + 12) = 1024;
    *(_DWORD *)(v36 + 14) = v10;
    _LPLogPack(1);
    close(v9);
    v31 = v39;
    v32 = 0;
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v10, 0);
  }
  else
  {
    close(v9);
    v31 = v39;
    v32 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v39);
  }

  v6 = v38;
LABEL_47:

  return v32;
}

- (BOOL)createSnapshot:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;
  int v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v6 = a3;
  v7 = -[LPMedia mountPoint](self, "mountPoint");
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    if (a4)
      *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    goto LABEL_12;
  }
  if (!v7)
  {
    if (a4)
      *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
LABEL_12:
    _os_log_pack_size();
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = "-[LPAPFSVolume createSnapshot:error:]";
    _LPLogPack(1);
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  v8 = objc_retainAutorelease(v7);
  v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0);
  if (v9 < 0)
  {
    if (a4)
      *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    _os_log_pack_size();
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315395;
    *(_QWORD *)(v18 + 4) = "-[LPAPFSVolume createSnapshot:error:]";
    *(_WORD *)(v18 + 12) = 2113;
    *(_QWORD *)(v18 + 14) = v8;
    _LPLogPack(1);
    goto LABEL_13;
  }
  v10 = v9;
  v11 = fs_snapshot_create(v9, (const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), 0);
  v12 = v11 == 0;
  if (v11)
  {
    v13 = *__error();
    if (a4)
      *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v13, 0);
    _os_log_pack_size();
    v14 = _os_log_pack_fill();
    v15 = strerror(v13);
    *(_DWORD *)v14 = 67109378;
    *(_DWORD *)(v14 + 4) = v13;
    *(_WORD *)(v14 + 8) = 2080;
    *(_QWORD *)(v14 + 10) = v15;
    _LPLogPack(1);
  }
  close(v10);
LABEL_14:

  return v12;
}

- (BOOL)deleteSnapshots:(id)a3 waitForDeletionFor:(double)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  int v20;
  char v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v25;
  int v26;
  uint64_t v27;
  id v28;
  id *v29;
  char v30;
  _QWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[112];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = -[LPMedia mountPoint](self, "mountPoint");
  if (!v8)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    goto LABEL_25;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v22 = 1;
    goto LABEL_27;
  }
  if (!v9)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
LABEL_25:
    _os_log_pack_size();
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136315138;
    *(_QWORD *)(v23 + 4) = "-[LPAPFSVolume deleteSnapshots:waitForDeletionFor:error:]";
LABEL_26:
    _LPLogPack(1);
    v22 = 0;
    goto LABEL_27;
  }
  v10 = open((const char *)objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation"), 0);
  if (v10 < 0)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    _os_log_pack_size();
    v25 = _os_log_pack_fill();
    v26 = *__error();
    *(_DWORD *)v25 = 136315394;
    *(_QWORD *)(v25 + 4) = "-[LPAPFSVolume deleteSnapshots:waitForDeletionFor:error:]";
    *(_WORD *)(v25 + 12) = 1024;
    *(_DWORD *)(v25 + 14) = v26;
    goto LABEL_26;
  }
  v11 = v10;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v13)
  {
    v14 = v13;
    v29 = a5;
    v28 = v9;
    v15 = 0;
    v30 = 0;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v12);
        v18 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i));
        if (fs_snapshot_delete(v11, (const char *)objc_msgSend(v18, "fileSystemRepresentation"), 0))
        {
          v15 = *__error();
          _os_log_pack_size();
          v19 = _os_log_pack_fill();
          v20 = *__error();
          *(_DWORD *)v19 = 136315651;
          *(_QWORD *)(v19 + 4) = "-[LPAPFSVolume deleteSnapshots:waitForDeletionFor:error:]";
          *(_WORD *)(v19 + 12) = 2113;
          *(_QWORD *)(v19 + 14) = v18;
          *(_WORD *)(v19 + 22) = 1024;
          *(_DWORD *)(v19 + 24) = v20;
          _LPLogPack(1);
        }
        else
        {
          v30 = 1;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v14);

    if (v29)
    {
      v21 = v30;
      if (v15)
        *v29 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v15, 0);
      v9 = v28;
    }
    else
    {
      v9 = v28;
      v21 = v30;
    }
  }
  else
  {

    v21 = 0;
  }
  if (a4 != 0.0)
  {
    v31[2] = 0;
    v31[1] = 0;
    v31[0] = 15;
    if (ffsctl(v11, 0x80184A24uLL, v31, 0))
    {
      _os_log_pack_size();
      v27 = _os_log_pack_fill();
      *(_DWORD *)v27 = 136315138;
      *(_QWORD *)(v27 + 4) = "-[LPAPFSVolume deleteSnapshots:waitForDeletionFor:error:]";
      _LPLogPack(1);
    }
  }
  close(v11);
  v22 = v21 & 1;
LABEL_27:

  return v22;
}

- (BOOL)renameSnapshot:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = -[LPMedia mountPoint](self, "mountPoint");
  if (!v8 || !objc_msgSend(v8, "length"))
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    goto LABEL_17;
  }
  if (!v9 || !objc_msgSend(v9, "length"))
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    goto LABEL_17;
  }
  if (!v10)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
LABEL_17:
    _os_log_pack_size();
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315138;
    *(_QWORD *)(v19 + 4) = "-[LPAPFSVolume renameSnapshot:to:error:]";
LABEL_18:
    _LPLogPack(1);
    v15 = 0;
    goto LABEL_19;
  }
  v11 = objc_retainAutorelease(v10);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0);
  if (v12 < 0)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    _os_log_pack_size();
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315395;
    *(_QWORD *)(v21 + 4) = "-[LPAPFSVolume renameSnapshot:to:error:]";
    *(_WORD *)(v21 + 12) = 2113;
    *(_QWORD *)(v21 + 14) = v11;
    goto LABEL_18;
  }
  v13 = v12;
  v14 = fs_snapshot_rename(v12, (const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), (const char *)objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation"), 0);
  v15 = v14 == 0;
  if (v14)
  {
    v16 = *__error();
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v16, 0);
    _os_log_pack_size();
    v17 = _os_log_pack_fill();
    v18 = strerror(v16);
    *(_DWORD *)v17 = 67109378;
    *(_DWORD *)(v17 + 4) = v16;
    *(_WORD *)(v17 + 8) = 2080;
    *(_QWORD *)(v17 + 10) = v18;
    _LPLogPack(1);
  }
  close(v13);
LABEL_19:

  return v15;
}

- (BOOL)revertToSnapshot:(id)a3 error:(id *)a4
{
  return -[LPAPFSVolume revertToSnapshot:options:error:](self, "revertToSnapshot:options:error:", a3, 0, a4);
}

- (BOOL)revertToSnapshot:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _QWORD v26[2];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = -[LPMedia mountPoint](self, "mountPoint");
  if (!v8 || !objc_msgSend(v8, "length"))
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    goto LABEL_13;
  }
  if (!v10)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
LABEL_13:
    _os_log_pack_size();
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)(v21 + 4) = "-[LPAPFSVolume revertToSnapshot:options:error:]";
    _LPLogPack(1);
    v15 = 0;
    goto LABEL_14;
  }
  v11 = objc_retainAutorelease(v10);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0);
  if (v12 < 0)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    _os_log_pack_size();
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136315395;
    *(_QWORD *)(v23 + 4) = "-[LPAPFSVolume revertToSnapshot:options:error:]";
    *(_WORD *)(v23 + 12) = 2113;
    *(_QWORD *)(v23 + 14) = v11;
    v15 = 1;
    _LPLogPack(1);
  }
  else
  {
    v13 = v12;
    v14 = fs_snapshot_revert(v12, (const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), 0);
    v15 = v14 == 0;
    if (v14)
    {
      v27 = v11;
      v16 = *__error();
      if (a5)
        *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v16, 0);
      _os_log_pack_size();
      v26[1] = v26;
      v17 = _os_log_pack_fill();
      v18 = strerror(v16);
      *(_DWORD *)v17 = 67109378;
      *(_DWORD *)(v17 + 4) = v16;
      *(_WORD *)(v17 + 8) = 2080;
      *(_QWORD *)(v17 + 10) = v18;
      _LPLogPack(1);
      v11 = v27;
    }
    close(v13);
    v19 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", LPAPFSVolumeRevertOptionSkipRemount);
    if (objc_msgSend(v19, "BOOLValue"))
    {
      _os_log_pack_size();
      v20 = _os_log_pack_fill();
      *(_DWORD *)v20 = 136315394;
      *(_QWORD *)(v20 + 4) = "-[LPAPFSVolume revertToSnapshot:options:error:]";
      *(_WORD *)(v20 + 12) = 2112;
      *(_QWORD *)(v20 + 14) = v11;
      _LPLogPack(2);
    }
    else if (-[LPAPFSVolume unmountWithError:](self, "unmountWithError:", a5)
           && -[LPAPFSVolume mountAtPath:options:error:](self, "mountAtPath:options:error:", v11, v9, a5))
    {
      v15 = 1;
    }
    else
    {
      _os_log_pack_size();
      v24 = _os_log_pack_fill();
      v25 = *__error();
      *(_DWORD *)v24 = 136315394;
      *(_QWORD *)(v24 + 4) = "-[LPAPFSVolume revertToSnapshot:options:error:]";
      *(_WORD *)(v24 + 12) = 1024;
      *(_DWORD *)(v24 + 14) = v25;
      _LPLogPack(1);
      v15 = 0;
    }

  }
LABEL_14:

  return v15;
}

- (BOOL)rootToSnapshot:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  _os_log_pack_size();
  v7 = _os_log_pack_fill();
  *(_DWORD *)v7 = 136315138;
  *(_QWORD *)(v7 + 4) = "-[LPAPFSVolume rootToSnapshot:error:]";
  _LPLogPack(3);
  v8 = -[LPMedia mountPoint](self, "mountPoint");
  if (v6 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
    if (!v8)
    {
LABEL_4:
      if (a4)
        *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
      v9 = _os_log_pack_fill();
      *(_DWORD *)v9 = 136315138;
      *(_QWORD *)(v9 + 4) = "-[LPAPFSVolume rootToSnapshot:error:]";
LABEL_17:
      _LPLogPack(1);
      v14 = 0;
      goto LABEL_18;
    }
  }
  else if (!v8)
  {
    goto LABEL_4;
  }
  _os_log_pack_size();
  v10 = _os_log_pack_fill();
  *(_DWORD *)v10 = 136315395;
  *(_QWORD *)(v10 + 4) = "-[LPAPFSVolume rootToSnapshot:error:]";
  *(_WORD *)(v10 + 12) = 2113;
  *(_QWORD *)(v10 + 14) = v8;
  _LPLogPack(3);
  v11 = open((const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), 0);
  if (v11 < 0)
  {
    if (a4)
      *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315395;
    *(_QWORD *)(v17 + 4) = "-[LPAPFSVolume rootToSnapshot:error:]";
    *(_WORD *)(v17 + 12) = 2113;
    *(_QWORD *)(v17 + 14) = v8;
    goto LABEL_17;
  }
  v12 = v11;
  v13 = fs_snapshot_root();
  v14 = v13 == 0;
  if (v13)
  {
    v15 = *__error();
    if (a4)
      *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v15, 0);
    _os_log_pack_size();
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)(v16 + 4) = "-[LPAPFSVolume rootToSnapshot:error:]";
    *(_WORD *)(v16 + 12) = 1024;
    *(_DWORD *)(v16 + 14) = v15;
    _LPLogPack(1);
  }
  close(v12);
LABEL_18:

  return v14;
}

@end
