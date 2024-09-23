@implementation SKPartitionTable

+ (__MKMedia)createMediaRefWithDisk:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  __MKMedia *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v14;
  unsigned int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unsigned int v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v5 = a3;
  v16 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "diskIdentifier"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/r%@"), v6)));
  v8 = objc_msgSend(v7, "fileSystemRepresentation");

  v23[0] = CFSTR("Writable");
  v23[1] = CFSTR("Shared Writer");
  v24[0] = &__kCFBooleanTrue;
  v24[1] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
  v10 = (__MKMedia *)MKMediaCreateWithPath(kCFAllocatorDefault, v8, v9, &v16);
  if (v10)
    v11 = v16 == 0;
  else
    v11 = 0;
  if (!v11)
  {
    v12 = sub_10000BA9C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "+[SKPartitionTable createMediaRefWithDisk:error:]";
      v19 = 2112;
      v20 = v5;
      v21 = 1024;
      v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Failed to create media ref with disk %@, MK err %d", buf, 0x1Cu);
    }

    v14 = +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", v16, a4);
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
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SKPartitionTable *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  id v28;
  void *v29;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SKPartitionTable;
  v7 = -[SKPartitionTable init](&v25, "init");
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    partitions = v7->_partitions;
    v7->_partitions = (NSMutableArray *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wholeDiskForDisk:", v6));

    if (!v11)
    {
      v20 = objc_opt_class(SKAPFSDisk);
      if ((objc_opt_isKindOfClass(v6, v20) & 1) == 0)
        goto LABEL_11;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "container"));
      if (!v11)
        goto LABEL_11;
    }
    v12 = objc_opt_class(SKAPFSContainerDisk);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "designatedPhysicalStore"));
      if (!v13)
      {
        v29 = v11;
        v21 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v21, 0));
        v19 = (SKPartitionTable *)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v23, a4));

        goto LABEL_16;
      }
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "wholeDiskForDisk:", v14));

      v6 = v14;
      v11 = (void *)v16;
      if (!v16)
      {
LABEL_11:
        v28 = v6;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
        v21 = objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v11, 0));
        v19 = (SKPartitionTable *)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v21, a4));
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_storeStrong((id *)&v7->_disk, v11);
    v7->_sectorSize = objc_msgSend(v11, "getSectorSize");
    v17 = (void *)objc_opt_class(v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](v7, "disk"));
    v7->_mediaRef = (__MKMedia *)objc_msgSend(v17, "createMediaRefWithDisk:error:", v18, a4);

    if (!v7->_mediaRef)
    {
      v22 = sub_10000BA9C();
      v21 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[SKPartitionTable initWithDisk:error:]";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Failed to create media ref", buf, 0xCu);
      }
      v19 = 0;
      goto LABEL_16;
    }

  }
  v19 = v7;
LABEL_17:

  return v19;
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
  -[SKPartitionTable dealloc](&v4, "dealloc");
}

- (BOOL)writeNewMediaLayout:(id)a3 partitionScheme:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  id v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;

  v6 = a3;
  v22 = 0;
  v21 = 0;
  v7 = MKCFCreateMedia(&v21, &v22);
  if (!v7 || v22)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
    objc_msgSend(v14, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_1000455D8);

    v15 = sub_10000BA9C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
      v25 = 1024;
      v26 = v22;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s: Failed to create media, MK err %d", buf, 0x12u);
    }

    goto LABEL_16;
  }
  v8 = v7;
  if (a4)
    v9 = 1;
  else
    v9 = 16;
  if (a4 == 1)
    v10 = 8;
  else
    v10 = v9;
  MKCFCreateMap(v10, v21, v6, 0, 0x1000 / -[SKPartitionTable sectorSize](self, "sectorSize"), -[SKPartitionTable sectorSize](self, "sectorSize"), 0, &off_100047D40, -[SKPartitionTable mediaRef](self, "mediaRef"), &v22);
  if (v22)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
    objc_msgSend(v11, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_1000455F8);

    v12 = sub_10000BA9C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
      v25 = 1024;
      v26 = v22;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s: Failed to create partition map, MK err %d", buf, 0x12u);
    }

    MKCFDisposeMedia(v8);
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  v22 = MKCFWriteMedia(v8, v6, 0, 0, -[SKPartitionTable mediaRef](self, "mediaRef"));
  if (v22)
  {
    v19 = sub_10000BA9C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
      v25 = 1024;
      v26 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to write scheme, MK err %d", buf, 0x12u);
    }

  }
  MKCFDisposeMedia(v8);
  v17 = v22 == 0;
LABEL_17:

  return v17;
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5
{
  return -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:](self, "overwriteExistingMediaLayout:opts:partitionScheme:size:", a3, a4, *(_QWORD *)&a5, 0);
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5 size:(unint64_t)a6
{
  unsigned __int16 v7;
  id v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  const __CFArray *Value;
  void *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  id v18;
  NSObject *v19;
  const void *ValueAtIndex;
  void *v21;
  id v22;
  BOOL v23;
  id v25;
  NSObject *v26;
  int v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;

  v7 = a5;
  v10 = a3;
  v27 = 0;
  v11 = (const __CFDictionary *)MKCFReadMedia(&off_100047D68, -[SKPartitionTable mediaRef](self, "mediaRef"), &v27);
  if (!v11 || v27)
  {
    v18 = sub_10000BA9C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      v30 = 1024;
      v31 = v27;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
    }

    goto LABEL_14;
  }
  v12 = v11;
  Value = (const __CFArray *)CFDictionaryGetValue(v11, CFSTR("Schemes"));
  MKCFCreateMap(v7, Value, v10, 0, 1, -[SKPartitionTable sectorSize](self, "sectorSize"), a6, a4, -[SKPartitionTable mediaRef](self, "mediaRef"), &v27);
  if (v27)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
    objc_msgSend(v14, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_100045618);

    v15 = sub_10000BA9C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      v30 = 1024;
      v31 = v27;
      v17 = "%s: Failed to create partition map, MK err %d";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, v17, buf, 0x12u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(Value, 1);
  v27 = MKCFUpdateScheme(ValueAtIndex, 0, 1, 0, -[SKPartitionTable mediaRef](self, "mediaRef"));
  if (v27)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
    objc_msgSend(v21, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_100045638);

    v22 = sub_10000BA9C();
    v16 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      v30 = 1024;
      v31 = v27;
      v17 = "%s: Failed to update scheme, MK err %d";
      goto LABEL_12;
    }
LABEL_13:

    MKCFDisposeMedia(v12);
LABEL_14:
    v23 = 0;
    goto LABEL_15;
  }
  v27 = MKCFWriteScheme(ValueAtIndex, v10, 0, 0, -[SKPartitionTable mediaRef](self, "mediaRef"));
  if (v27)
  {
    v25 = sub_10000BA9C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      v30 = 1024;
      v31 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s: Failed to write scheme, MK err %d", buf, 0x12u);
    }

  }
  MKCFDisposeMedia(v12);
  v23 = v27 == 0;
LABEL_15:

  return v23;
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
    v5 = (void *)objc_opt_class(self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
    -[SKPartitionTable setMediaRef:](self, "setMediaRef:", objc_msgSend(v5, "createMediaRefWithDisk:error:", v6, a3));

  }
  return -[SKPartitionTable mediaRef](self, "mediaRef") != 0;
}

- (BOOL)writePartitionScheme:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  unsigned int v8;
  NSMutableArray *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  const __CFString *v34;
  NSMutableArray *v35;
  void *v36;
  _BYTE v37[128];

  if (!-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a4))
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
  v8 = objc_msgSend(v7, "wipeDiskWithError:", a4);

  if (!v8)
    return 0;
  v9 = objc_opt_new(NSMutableArray);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable partitions](self, "partitions", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
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
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "buildWithScheme:sectorSize:", v15, -[SKPartitionTable sectorSize](self, "sectorSize")));
        if (!v17)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
          v36 = v20;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
          v22 = 300;
          goto LABEL_23;
        }
        v18 = (void *)v17;
        -[NSMutableArray addObject:](v9, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v12)
        continue;
      break;
    }
  }

  v34 = CFSTR("Partitions");
  v35 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
  if (-[SKPartitionTable writeNewMediaLayout:partitionScheme:](self, "writeNewMediaLayout:partitionScheme:", v10, a3))
  {
    -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
    v19 = 1;
  }
  else
  {
    v23 = sub_10000BA9C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[SKPartitionTable writePartitionScheme:error:]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Failed to write media on disk", buf, 0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
    v31 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    v22 = 114;
LABEL_23:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", v22, v21, 0));
    v19 = +[SKError failWithError:error:](SKError, "failWithError:error:", v25, a4);

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "diskIdentifier"));

  v6 = -[SKIOMedia initWithDevName:](v4, "initWithDevName:", v5);
  v7 = -[SKIOObject copyPropertyWithClass:key:](v6, "copyPropertyWithClass:key:", objc_opt_class(NSNumber), CFSTR("Partition ID"));

  return v7;
}

+ (BOOL)updatePartitionTypeWithPartitions:(id)a3 partID:(id)a4 newType:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned __int8 v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

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
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Partition ID")));
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

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't find partition with ID %@"), v9));
  v20 = +[SKError failWithSKErrorCode:debugDescription:error:](SKError, "failWithSKErrorCode:debugDescription:error:", 117, v19, a6);
LABEL_11:

  return v20;
}

- (BOOL)overwritePartitionAt:(id)a3 filesystem:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;

  v8 = a3;
  v9 = a4;
  if (-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a5))
  {
    v33 = 0;
    v10 = MKCFReadMedia(&off_100047D90, -[SKPartitionTable mediaRef](self, "mediaRef"), &v33);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (!v11 || v33)
    {
      v22 = sub_10000BA9C();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[SKPartitionTable overwritePartitionAt:filesystem:error:]";
        v37 = 1024;
        v38 = v33;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v33, 0));
      v21 = +[SKError failWithError:error:](SKError, "failWithError:error:", v13, a5);
      goto LABEL_18;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Schemes")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Sections")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Partitions")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "type"));
    v17 = sub_100020918(v16);

    if (v17 == 512)
    {
      MKCFDisposeMedia(v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
      v34 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v19, 0));
      v21 = +[SKError failWithError:error:](SKError, "failWithError:error:", v20, a5);

    }
    else
    {
      v24 = (void *)objc_opt_class(self);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentMask"));
      LODWORD(v24) = objc_msgSend(v24, "updatePartitionTypeWithPartitions:partID:newType:error:", v14, v8, v25, a5);

      if ((_DWORD)v24)
      {
        v33 = MKCFWriteMedia(v12, 0, 0, &off_100047DB8, -[SKPartitionTable mediaRef](self, "mediaRef"));
        MKCFDisposeMedia(v12);
        v27 = v31;
        v26 = v32;
        if (v33)
        {
          v21 = +[SKError failWithSKErrorCode:debugDescription:error:](SKError, "failWithSKErrorCode:debugDescription:error:", 114, CFSTR("Failed to overwrite existing partition"), a5);
        }
        else
        {
          -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
          v21 = 1;
        }
        v28 = v30;
        goto LABEL_17;
      }
      v21 = 0;
    }
    v28 = v30;
    v27 = v31;
    v26 = v32;
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  v21 = 0;
LABEL_19:

  return v21;
}

- (BOOL)fitToContainerSize:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;

  if (!-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a4))
    return 0;
  v28 = 0;
  v7 = MKCFReadMedia(&off_100047DE0, -[SKPartitionTable mediaRef](self, "mediaRef"), &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8 || v28)
  {
    v16 = sub_10000BA9C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[SKPartitionTable fitToContainerSize:error:]";
      v33 = 1024;
      v34 = v28;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v28, 0));
    v15 = +[SKError failWithError:error:](SKError, "failWithError:error:", v12, a4);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "type"));
    v11 = sub_100020918(v10);

    if ((_DWORD)v11 == 512)
    {
      MKCFDisposeMedia(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
      v30 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v13, 0));
      v15 = +[SKError failWithError:error:](SKError, "failWithError:error:", v14, a4);

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Schemes")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Sections")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
      v21 = -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:](self, "overwriteExistingMediaLayout:opts:partitionScheme:size:", v20, &off_100047E08, v11, a3 / -[SKPartitionTable sectorSize](self, "sectorSize"));
      MKCFDisposeMedia(v8);
      if ((v21 & 1) != 0)
      {
        -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
        v15 = 1;
      }
      else
      {
        v22 = sub_10000BA9C();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v32 = "-[SKPartitionTable fitToContainerSize:error:]";
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to fit existing partition", buf, 0xCu);
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
        v29 = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 114, v25, 0));
        v15 = +[SKError failWithError:error:](SKError, "failWithError:error:", v26, a4);

      }
    }
  }

  return v15;
}

- (BOOL)resizePartitionID:(id)a3 size:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  id v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  int v58;
  void *v59;
  const __CFString *v60;
  NSMutableArray *v61;
  _BYTE v62[128];
  NSMutableArray *v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  int v67;

  v53 = a3;
  if (-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a6))
  {
    v58 = 0;
    v8 = MKCFReadMedia(&off_100047E30, -[SKPartitionTable mediaRef](self, "mediaRef"), &v58);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (!v9 || v58)
    {
      v22 = sub_10000BA9C();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v65 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
        v66 = 1024;
        v67 = v58;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v58, 0));
      v21 = +[SKError failWithError:error:](SKError, "failWithError:error:", v11, a6);
      goto LABEL_27;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Schemes")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Sections")));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("Partitions")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "type"));
    v17 = sub_100020918(v16);

    v50 = v14;
    if (v17 == 512)
    {
      MKCFDisposeMedia(v10);
      v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
      v63 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, v19, 0));
      v21 = +[SKError failWithError:error:](SKError, "failWithError:error:", v20, a6);

    }
    else
    {
      v47 = v17;
      v44 = v13;
      v45 = v12;
      v46 = v11;
      v43 = a6;
      v48 = v10;
      v18 = objc_opt_new(NSMutableArray);
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v24 = v14;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v55 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
            v30 = objc_msgSend(v29, "mutableCopy");
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Partition ID")));
            v32 = objc_msgSend(v31, "isEqualToNumber:", v53);

            if (v32)
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4 / -[SKPartitionTable sectorSize](self, "sectorSize")));
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, CFSTR("Size"));

              if (a5)
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a5 / -[SKPartitionTable sectorSize](self, "sectorSize")));
                objc_msgSend(v30, "setObject:forKeyedSubscript:", v34, CFSTR("Offset"));

              }
            }
            -[NSMutableArray addObject:](v18, "addObject:", v30);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        }
        while (v26);
      }

      v60 = CFSTR("Partitions");
      v61 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
      v35 = -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:](self, "overwriteExistingMediaLayout:opts:partitionScheme:", v19, &off_100047E58, v47);
      v10 = v48;
      MKCFDisposeMedia(v48);
      if ((v35 & 1) == 0)
      {
        v37 = sub_10000BA9C();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        v13 = v44;
        v36 = v49;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v65 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s: Failed to overwrite existing partition", buf, 0xCu);
        }

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
        v59 = v39;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 114, v40, 0));
        v21 = +[SKError failWithError:error:](SKError, "failWithError:error:", v41, v43);

        v12 = v45;
        v11 = v46;
        goto LABEL_26;
      }
      -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
      v21 = 1;
      v11 = v46;
      v13 = v44;
    }
    v36 = v49;
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  v21 = 0;
LABEL_28:

  return v21;
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
