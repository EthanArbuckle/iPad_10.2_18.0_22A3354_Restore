@implementation SKPartitionTable

+ (__MKMedia)createMediaRefWithDisk:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  __MKMedia *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "diskIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("/dev/r%@"), v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "fileSystemRepresentation");

  v20[0] = CFSTR("Writable");
  v20[1] = CFSTR("Shared Writer");
  v21[0] = MEMORY[0x24BDBD1C8];
  v21[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (__MKMedia *)MKMediaCreateWithPath();
  if (!v10)
  {
    SKGetOSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "+[SKPartitionTable createMediaRefWithDisk:error:]";
      v16 = 2112;
      v17 = v5;
      v18 = 1024;
      v19 = 0;
      _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_ERROR, "%s: Failed to create media ref with disk %@, MK err %d", buf, 0x1Cu);
    }

    v12 = +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 0, a4);
    v10 = 0;
  }

  return v10;
}

- (SKPartitionTable)initWithDisk:(id)a3 error:(id *)a4
{
  id v6;
  SKPartitionTable *v7;
  uint64_t v8;
  NSMutableArray *partitions;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  SKPartitionTable *v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SKPartitionTable;
  v7 = -[SKPartitionTable init](&v22, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    partitions = v7->_partitions;
    v7->_partitions = (NSMutableArray *)v8;

    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wholeDiskForDisk:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
      objc_msgSend(v6, "container");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "designatedPhysicalStore");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v26[0] = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
        v19 = objc_claimAutoreleasedReturnValue();
        +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKError nilWithError:error:](SKError, "nilWithError:error:", v20, a4);
        v18 = (SKPartitionTable *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      v13 = (void *)v12;
      +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "wholeDiskForDisk:", v13);
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = v13;
      v11 = (void *)v15;
      if (!v15)
      {
LABEL_11:
        v25 = v6;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v11, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        +[SKError nilWithError:error:](SKError, "nilWithError:error:", v19, a4);
        v18 = (SKPartitionTable *)objc_claimAutoreleasedReturnValue();
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_storeStrong((id *)&v7->_disk, v11);
    v7->_sectorSize = objc_msgSend(v11, "getSectorSize");
    v16 = (void *)objc_opt_class();
    -[SKPartitionTable disk](v7, "disk");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_mediaRef = (__MKMedia *)objc_msgSend(v16, "createMediaRefWithDisk:error:", v17, a4);

    if (!v7->_mediaRef)
    {
      SKGetOSLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[SKPartitionTable initWithDisk:error:]";
        _os_log_impl(&dword_22FE50000, v19, OS_LOG_TYPE_ERROR, "%s: Failed to create media ref", buf, 0xCu);
      }
      v18 = 0;
      goto LABEL_16;
    }

  }
  v18 = v7;
LABEL_17:

  return v18;
}

- (void)dealloc
{
  __MKMedia *mediaRef;
  objc_super v4;

  mediaRef = self->_mediaRef;
  if (mediaRef)
    CFRelease(mediaRef);
  v4.receiver = self;
  v4.super_class = (Class)SKPartitionTable;
  -[SKPartitionTable dealloc](&v4, sel_dealloc);
}

- (BOOL)writeNewMediaLayout:(id)a3 partitionScheme:(unint64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v10;
  __MKMedia *v11;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v12 = 0;
  if (MKCFCreateMedia())
  {
    -[SKPartitionTable sectorSize](self, "sectorSize");
    -[SKPartitionTable sectorSize](self, "sectorSize");
    v11 = -[SKPartitionTable mediaRef](self, "mediaRef");
    MKCFCreateMap();
    -[SKPartitionTable mediaRef](self, "mediaRef", v11, &v12, 0);
    v12 = MKCFWriteMedia();
    if (v12)
    {
      SKGetOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
        v15 = 1024;
        v16 = v12;
        _os_log_impl(&dword_22FE50000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to write scheme, MK err %d", buf, 0x12u);
      }

    }
    MKCFDisposeMedia();
    v8 = v12 == 0;
  }
  else
  {
    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &__block_literal_global_45);

    SKGetOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
      v15 = 1024;
      v16 = v12;
      _os_log_impl(&dword_22FE50000, v7, OS_LOG_TYPE_FAULT, "%s: Failed to create media, MK err %d", buf, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

id __56__SKPartitionTable_writeNewMediaLayout_partitionScheme___block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKPartitionTable.m", 141);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id __56__SKPartitionTable_writeNewMediaLayout_partitionScheme___block_invoke_49()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKPartitionTable.m", 149);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5
{
  return -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:](self, "overwriteExistingMediaLayout:opts:partitionScheme:size:", a3, a4, *(_QWORD *)&a5, 0);
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5 size:(unint64_t)a6
{
  id v7;
  const __CFDictionary *v8;
  const __CFArray *Value;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v15;
  __MKMedia *v16;
  int v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v17 = 0;
  -[SKPartitionTable mediaRef](self, "mediaRef");
  v8 = (const __CFDictionary *)MKCFReadMedia();
  if (!v8)
  {
    SKGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      v20 = 1024;
      v21 = v17;
      _os_log_impl(&dword_22FE50000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
    }

    goto LABEL_10;
  }
  Value = (const __CFArray *)CFDictionaryGetValue(v8, CFSTR("Schemes"));
  -[SKPartitionTable sectorSize](self, "sectorSize");
  v16 = -[SKPartitionTable mediaRef](self, "mediaRef");
  MKCFCreateMap();
  CFArrayGetValueAtIndex(Value, 1);
  -[SKPartitionTable mediaRef](self, "mediaRef", v16, &v17);
  v17 = MKCFUpdateScheme();
  if (v17)
  {
    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &__block_literal_global_60);

    SKGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      v20 = 1024;
      v21 = v17;
      _os_log_impl(&dword_22FE50000, v12, OS_LOG_TYPE_FAULT, "%s: Failed to update scheme, MK err %d", buf, 0x12u);
    }

    MKCFDisposeMedia();
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  -[SKPartitionTable mediaRef](self, "mediaRef");
  v17 = MKCFWriteScheme();
  if (v17)
  {
    SKGetOSLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      v20 = 1024;
      v21 = v17;
      _os_log_impl(&dword_22FE50000, v15, OS_LOG_TYPE_ERROR, "%s: Failed to write scheme, MK err %d", buf, 0x12u);
    }

  }
  MKCFDisposeMedia();
  v13 = v17 == 0;
LABEL_11:

  return v13;
}

id __75__SKPartitionTable_overwriteExistingMediaLayout_opts_partitionScheme_size___block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKPartitionTable.m", 180);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id __75__SKPartitionTable_overwriteExistingMediaLayout_opts_partitionScheme_size___block_invoke_59()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKPartitionTable.m", 187);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (void)flushMediaRef
{
  if (-[SKPartitionTable mediaRef](self, "mediaRef"))
  {
    CFRelease(-[SKPartitionTable mediaRef](self, "mediaRef"));
    -[SKPartitionTable setMediaRef:](self, "setMediaRef:", 0);
  }
}

- (BOOL)allocateMediaRef:(id *)a3
{
  void *v5;
  void *v6;

  if (!-[SKPartitionTable mediaRef](self, "mediaRef"))
  {
    v5 = (void *)objc_opt_class();
    -[SKPartitionTable disk](self, "disk");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKPartitionTable setMediaRef:](self, "setMediaRef:", objc_msgSend(v5, "createMediaRefWithDisk:error:", v6, a3));

  }
  return -[SKPartitionTable mediaRef](self, "mediaRef") != 0;
}

- (BOOL)writePartitionScheme:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a4))
    return 0;
  -[SKPartitionTable disk](self, "disk");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wipeDiskWithError:", a4);

  if (!v8)
    return 0;
  v9 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SKPartitionTable partitions](self, "partitions", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    if (a3)
      v14 = 1;
    else
      v14 = 16;
    if (a3 == 1)
      v15 = 8;
    else
      v15 = v14;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "buildWithScheme:sectorSize:", v15, -[SKPartitionTable sectorSize](self, "sectorSize"));
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          -[SKPartitionTable disk](self, "disk");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 300;
          goto LABEL_23;
        }
        v18 = (void *)v17;
        objc_msgSend(v9, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v12)
        continue;
      break;
    }
  }

  v33 = CFSTR("Partitions");
  v34 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SKPartitionTable writeNewMediaLayout:partitionScheme:](self, "writeNewMediaLayout:partitionScheme:", v10, a3))
  {
    -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
    v19 = 1;
  }
  else
  {
    SKGetOSLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[SKPartitionTable writePartitionScheme:error:]";
      _os_log_impl(&dword_22FE50000, v23, OS_LOG_TYPE_ERROR, "%s: Failed to write media on disk", buf, 0xCu);
    }

    -[SKPartitionTable disk](self, "disk");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 114;
LABEL_23:
    +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", v22, v21, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[SKError failWithError:error:](SKError, "failWithError:error:", v24, a4);

  }
  return v19;
}

+ (id)partitionIDFromDisk:(id)a3
{
  id v3;
  SKIOMedia *v4;
  void *v5;
  SKIOMedia *v6;
  id v7;

  v3 = a3;
  v4 = [SKIOMedia alloc];
  objc_msgSend(v3, "diskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SKIOMedia initWithDevName:](v4, "initWithDevName:", v5);
  v7 = -[SKIOObject copyPropertyWithClass:key:](v6, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("Partition ID"));

  return v7;
}

+ (BOOL)updatePartitionTypeWithPartitions:(id)a3 partID:(id)a4 newType:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  BOOL v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Partition ID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", v9);

        if (v18)
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, CFSTR("Type"));
          v20 = 1;
          v19 = v11;
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Couldn't find partition with ID %@"), v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[SKError failWithSKErrorCode:debugDescription:error:](SKError, "failWithSKErrorCode:debugDescription:error:", 117, v19, a6);
LABEL_11:

  return v20;
}

- (BOOL)overwritePartitionAt:(id)a3 filesystem:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a5))
  {
    -[SKPartitionTable mediaRef](self, "mediaRef");
    MKCFReadMedia();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      SKGetOSLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[SKPartitionTable overwritePartitionAt:filesystem:error:]";
        v35 = 1024;
        v36 = 0;
        _os_log_impl(&dword_22FE50000, v21, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = +[SKError failWithError:error:](SKError, "failWithError:error:", v12, a5);
      goto LABEL_17;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Schemes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Sections"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Partitions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKPartitionTable disk](self, "disk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = diskTypeToScheme(v15);

    if (v16 == 512)
    {
      MKCFDisposeMedia();
      -[SKPartitionTable disk](self, "disk");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = +[SKError failWithError:error:](SKError, "failWithError:error:", v19, a5);

    }
    else
    {
      v22 = (void *)objc_opt_class();
      objc_msgSend(v9, "contentMask");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = objc_msgSend(v22, "updatePartitionTypeWithPartitions:partID:newType:error:", v13, v8, v23, a5);

      if ((_DWORD)v22)
      {
        -[SKPartitionTable mediaRef](self, "mediaRef");
        v31 = MKCFWriteMedia();
        MKCFDisposeMedia();
        v25 = v29;
        v24 = v30;
        if (v31)
        {
          v20 = +[SKError failWithSKErrorCode:debugDescription:error:](SKError, "failWithSKErrorCode:debugDescription:error:", 114, CFSTR("Failed to overwrite existing partition"), a5);
        }
        else
        {
          -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
          v20 = 1;
        }
        v26 = v28;
        goto LABEL_16;
      }
      v20 = 0;
    }
    v26 = v28;
    v25 = v29;
    v24 = v30;
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)fitToContainerSize:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a4))
    return 0;
  -[SKPartitionTable mediaRef](self, "mediaRef");
  MKCFReadMedia();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SKPartitionTable disk](self, "disk");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = diskTypeToScheme(v9);

    if ((_DWORD)v10 == 512)
    {
      MKCFDisposeMedia();
      -[SKPartitionTable disk](self, "disk");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[SKError failWithError:error:](SKError, "failWithError:error:", v13, a4);

    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Schemes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Sections"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:](self, "overwriteExistingMediaLayout:opts:partitionScheme:size:", v18, &unk_24FDCC8B0, v10, a3 / -[SKPartitionTable sectorSize](self, "sectorSize"));
      MKCFDisposeMedia();
      if (v19)
      {
        -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
        v14 = 1;
      }
      else
      {
        SKGetOSLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v28 = "-[SKPartitionTable fitToContainerSize:error:]";
          _os_log_impl(&dword_22FE50000, v20, OS_LOG_TYPE_ERROR, "%s: Failed to fit existing partition", buf, 0xCu);
        }

        -[SKPartitionTable disk](self, "disk");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v21;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 114, v22, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = +[SKError failWithError:error:](SKError, "failWithError:error:", v23, a4);

      }
    }
  }
  else
  {
    SKGetOSLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SKPartitionTable fitToContainerSize:error:]";
      v29 = 1024;
      v30 = 0;
      _os_log_impl(&dword_22FE50000, v15, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[SKError failWithError:error:](SKError, "failWithError:error:", v11, a4);
  }

  return v14;
}

- (BOOL)resizePartitionID:(id)a3 size:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  int v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  _BYTE v59[128];
  void *v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  if (-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a6))
  {
    v55 = 0;
    -[SKPartitionTable mediaRef](self, "mediaRef");
    MKCFReadMedia();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      SKGetOSLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
        v63 = 1024;
        v64 = v55;
        _os_log_impl(&dword_22FE50000, v21, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v55, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = +[SKError failWithError:error:](SKError, "failWithError:error:", v10, a6);
      goto LABEL_26;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Schemes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Sections"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("Partitions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKPartitionTable disk](self, "disk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = diskTypeToScheme(v15);

    v47 = v13;
    if (v16 == 512)
    {
      MKCFDisposeMedia();
      -[SKPartitionTable disk](self, "disk");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = +[SKError failWithError:error:](SKError, "failWithError:error:", v19, a6);

    }
    else
    {
      v44 = v16;
      v41 = v12;
      v42 = v11;
      v43 = v10;
      v40 = a6;
      v45 = v9;
      v17 = (void *)objc_opt_new();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v22 = v13;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v52 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            v28 = (void *)objc_msgSend(v27, "mutableCopy");
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Partition ID"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToNumber:", v50);

            if (v30)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4 / -[SKPartitionTable sectorSize](self, "sectorSize"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("Size"));

              if (a5)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5 / -[SKPartitionTable sectorSize](self, "sectorSize"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, CFSTR("Offset"));

              }
            }
            objc_msgSend(v17, "addObject:", v28);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        }
        while (v24);
      }

      v57 = CFSTR("Partitions");
      v58 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:](self, "overwriteExistingMediaLayout:opts:partitionScheme:", v18, &unk_24FDCC900, v44);
      v9 = v45;
      MKCFDisposeMedia();
      if (!v33)
      {
        SKGetOSLog();
        v35 = objc_claimAutoreleasedReturnValue();
        v12 = v41;
        v34 = v46;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v62 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
          _os_log_impl(&dword_22FE50000, v35, OS_LOG_TYPE_ERROR, "%s: Failed to overwrite existing partition", buf, 0xCu);
        }

        -[SKPartitionTable disk](self, "disk");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v36;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 114, v37, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = +[SKError failWithError:error:](SKError, "failWithError:error:", v38, v40);

        v11 = v42;
        v10 = v43;
        goto LABEL_25;
      }
      -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
      v20 = 1;
      v10 = v43;
      v12 = v41;
    }
    v34 = v46;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v20 = 0;
LABEL_27:

  return v20;
}

- (NSMutableArray)partitions
{
  return self->_partitions;
}

- (void)setPartitions:(id)a3
{
  objc_storeStrong((id *)&self->_partitions, a3);
}

- (SKDisk)disk
{
  return (SKDisk *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)sectorSize
{
  return self->_sectorSize;
}

- (void)setSectorSize:(unsigned int)a3
{
  self->_sectorSize = a3;
}

- (__MKMedia)mediaRef
{
  return self->_mediaRef;
}

- (void)setMediaRef:(__MKMedia *)a3
{
  self->_mediaRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disk, 0);
  objc_storeStrong((id *)&self->_partitions, 0);
}

@end
