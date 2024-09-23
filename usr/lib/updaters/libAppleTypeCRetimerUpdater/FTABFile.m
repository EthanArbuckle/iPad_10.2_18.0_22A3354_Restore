@implementation FTABFile

- (NSString)bverString
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  -[FTABFile subfileWithTag:](self, "subfileWithTag:", CFSTR("bver"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = objc_msgSend(v2, "dataLength")) != 0)
  {
    LODWORD(v5) = v4;
    if (*(_BYTE *)(objc_msgSend(v3, "dataPointer") + (v4 - 1)) == 10)
      v5 = (v5 - 1);
    else
      v5 = v5;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", objc_msgSend(v3, "dataPointer"), v5, 4);
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

+ (id)longTagName:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("acib")) & 1) != 0)
  {
    v4 = CFSTR("ACIBT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("aopf")) & 1) != 0)
  {
    v4 = CFSTR("AOP");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lpda")) & 1) != 0)
  {
    v4 = CFSTR("LeapBinsDigestsArray");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("phyb")) & 1) != 0)
  {
    v4 = CFSTR("PhyBlueTooth");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rkof")) & 1) != 0)
  {
    v4 = CFSTR("RTKitOSFeature");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rkos")) & 1) != 0)
  {
    v4 = CFSTR("RTKitOS");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rrko")) & 1) != 0)
  {
    v4 = CFSTR("RestoreRTKitOS");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rtpf")) & 1) != 0)
  {
    v4 = CFSTR("RTP");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sbd1")) & 1) != 0)
  {
    v4 = CFSTR("SoftwareBinaryDsp1");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("sbd2")))
  {
    v4 = CFSTR("SoftwareBinaryDsp2");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (FTABFile)initWithContentsOfURL:(id)a3
{
  id v5;
  FTABFile *v6;
  uint64_t v7;
  id v8;
  NSData *fileData;
  FTABFile *v10;
  NSObject *v11;
  id v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FTABFile;
  v6 = -[FTABFile init](&v14, sel_init);
  if (!v6)
    goto LABEL_5;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v5, 1, &v13);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v13;
  fileData = v6->_fileData;
  v6->_fileData = (NSData *)v7;

  if (!v6->_fileData)
  {
    v11 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FTABFile initWithContentsOfURL:].cold.1();

    goto LABEL_9;
  }
  if (!-[FTABFile initFile](v6, "initFile"))
  {
LABEL_9:

    v10 = 0;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_url, a3);

LABEL_5:
  v10 = v6;
LABEL_10:

  return v10;
}

- (FTABFile)initWithData:(id)a3
{
  id v4;
  FTABFile *v5;
  uint64_t v6;
  NSData *fileData;
  FTABFile *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FTABFile;
  v5 = -[FTABFile init](&v10, sel_init);
  if (v5
    && (v6 = objc_msgSend(v4, "copy"),
        fileData = v5->_fileData,
        v5->_fileData = (NSData *)v6,
        fileData,
        !-[FTABFile initFile](v5, "initFile")))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (BOOL)initFile
{
  NSMutableArray *v3;
  NSMutableArray *subFileArray;

  self->_filePointer = (const char *)-[NSData bytes](self->_fileData, "bytes");
  self->_fileLength = -[NSData length](self->_fileData, "length");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  subFileArray = self->_subFileArray;
  self->_subFileArray = v3;

  return -[FTABFile parseFileData](self, "parseFileData");
}

- (FTABFile)init
{
  FTABFile *v2;
  uint64_t v3;
  NSData *fileData;
  FTABSubfile *manifest;
  uint64_t v6;
  NSMutableArray *subFileArray;
  uint64_t v8;
  NSData *magic;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FTABFile;
  v2 = -[FTABFile init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    fileData = v2->_fileData;
    v2->_fileData = (NSData *)v3;

    manifest = v2->_manifest;
    v2->_manifest = 0;

    v2->_filePointer = (const char *)-[NSData bytes](v2->_fileData, "bytes");
    v2->_fileLength = -[NSData length](v2->_fileData, "length");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    subFileArray = v2->_subFileArray;
    v2->_subFileArray = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kFTABMagicLowercase, 8);
    v8 = objc_claimAutoreleasedReturnValue();
    magic = v2->_magic;
    v2->_magic = (NSData *)v8;

  }
  return v2;
}

- (BOOL)parseFileData
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const char *filePointer;
  _QWORD *v7;
  NSData *v8;
  NSData *magic;
  NSData *v10;
  NSData *bootNonce;
  uint64_t v12;
  uint64_t v13;
  FTABSubfile *v14;
  FTABSubfile *manifest;
  int v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  FTABSubfile *v22;
  uint64_t v24;
  uint64_t v25;

  if (self->_fileLength > 0x2F)
  {
    filePointer = self->_filePointer;
    v7 = filePointer + 32;
    if (*((_QWORD *)filePointer + 4) == 0x42415446534F4B52 || *v7 == 0x62617466736F6B72)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, 8);
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      magic = self->_magic;
      self->_magic = v8;

      self->_generation = *(_DWORD *)filePointer;
      self->_valid = *((_DWORD *)filePointer + 1);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", filePointer + 8, 8);
      v10 = (NSData *)objc_claimAutoreleasedReturnValue();
      bootNonce = self->_bootNonce;
      self->_bootNonce = v10;

      v12 = *((unsigned int *)filePointer + 5);
      if ((_DWORD)v12)
      {
        v13 = *((unsigned int *)filePointer + 4);
        if (!-[FTABFile fileValidForOffset:length:](self, "fileValidForOffset:length:", v13, *((unsigned int *)filePointer + 5)))
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
            -[FTABFile parseFileData].cold.5(v2, v24, v25);
          goto LABEL_26;
        }
        v14 = -[FTABSubfile initWithTag:dataPointer:dataLength:]([FTABSubfile alloc], "initWithTag:dataPointer:dataLength:", CFSTR("Manifest"), &self->_filePointer[v13], v12);
        manifest = self->_manifest;
        self->_manifest = v14;

      }
      v16 = *((_DWORD *)filePointer + 10);
      if (!v16)
        return 1;
      for (i = 0;
            -[FTABFile fileValidForOffset:length:](self, "fileValidForOffset:length:", (i + 48), 16);
            i += 16)
      {
        v19 = *(unsigned int *)&filePointer[i + 52];
        v18 = *(unsigned int *)&filePointer[i + 56];
        if (!-[FTABFile fileValidForOffset:length:](self, "fileValidForOffset:length:", v19, v18))
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
            -[FTABFile parseFileData].cold.3();
          goto LABEL_26;
        }
        v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &filePointer[i + 48], 4, 4);
        if (!v20)
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
            -[FTABFile parseFileData].cold.2((unsigned __int8 *)&filePointer[i + 48], v2);
          goto LABEL_26;
        }
        v21 = (void *)v20;
        v22 = -[FTABSubfile initWithTag:dataPointer:dataLength:]([FTABSubfile alloc], "initWithTag:dataPointer:dataLength:", v20, &self->_filePointer[v19], v18);
        -[NSMutableArray addObject:](self->_subFileArray, "addObject:", v22);
        --v16;

        if (!v16)
          return 1;
      }
      v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        -[FTABFile parseFileData].cold.4();
    }
    else
    {
      v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        -[FTABFile parseFileData].cold.6();
    }
  }
  else
  {
    v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[FTABFile parseFileData].cold.1(v2, v3, v4);
  }
LABEL_26:

  return 0;
}

- (BOOL)fileValidForOffset:(unsigned int)a3 length:(unsigned int)a4
{
  return self->_fileLength >= a4 + a3;
}

- (id)subfileWithTag:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_subFileArray;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "tag", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeSubfileWithTag:(id)a3
{
  void *v4;
  void *v5;

  -[FTABFile subfileWithTag:](self, "subfileWithTag:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NSMutableArray removeObject:](self->_subFileArray, "removeObject:", v4);
    v4 = v5;
  }

}

- (NSArray)subfiles
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_subFileArray);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_url)
    objc_msgSend(v3, "appendFormat:", CFSTR("FTAB %@:\n"), self->_url);
  else
    objc_msgSend(v3, "appendFormat:", CFSTR("FTAB:\n"), v15);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tGeneration: 0x%08x\n"), self->_generation);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tValid: %u\n"), self->_valid);
  -[NSData byteString](self->_bootNonce, "byteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\tBoot Nonce: %@\n"), v5);

  if (self->_manifest)
    objc_msgSend(v4, "appendFormat:", CFSTR("\tManifest: %@\n"), self->_manifest);
  if (-[NSMutableArray count](self->_subFileArray, "count"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("\tSubfiles:\n"));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_subFileArray;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (-v9 != i)
            objc_msgSend(v4, "appendString:", CFSTR("\n"));
          objc_msgSend(v4, "appendFormat:", CFSTR("\t\t%@"), v12);
        }
        v9 += v8;
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)addSubfileWithTagName:(id)a3 contentsOfURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  id v13;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v7, 1, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v8)
  {
    v10 = -[FTABFile addSubfileWithTagName:subfileData:](self, "addSubfileWithTagName:subfileData:", v6, v8);
  }
  else
  {
    v11 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FTABFile addSubfileWithTagName:contentsOfURL:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (BOOL)addSubfileWithTagName:(id)a3 subfileData:(id)a4
{
  id v6;
  id v7;
  FTABSubfile *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  FTABSubfile *v12;

  v6 = a4;
  v7 = a3;
  -[FTABFile removeSubfileWithTag:](self, "removeSubfileWithTag:", v7);
  v8 = [FTABSubfile alloc];
  v9 = objc_retainAutorelease(v6);
  v10 = objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");

  v12 = -[FTABSubfile initWithTag:dataPointer:dataLength:](v8, "initWithTag:dataPointer:dataLength:", v7, v10, v11);
  -[NSMutableArray addObject:](self->_subFileArray, "addObject:", v12);

  return 1;
}

- (void)addSubfiles:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "tag");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[FTABFile removeSubfileWithTag:](self, "removeSubfileWithTag:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[NSMutableArray addObjectsFromArray:](self->_subFileArray, "addObjectsFromArray:", v4);

}

- (void)setManifest:(id)a3
{
  id v4;
  FTABSubfile *v5;
  FTABSubfile *manifest;

  v4 = a3;
  v5 = -[FTABSubfile initWithTag:data:]([FTABSubfile alloc], "initWithTag:data:", CFSTR("Manifest"), v4);

  manifest = self->_manifest;
  self->_manifest = v5;

}

- (void)setBootNonce:(id)a3
{
  NSData *v4;
  NSData *bootNonce;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length") == 8)
  {
    v4 = (NSData *)objc_msgSend(v6, "copy");
    bootNonce = self->_bootNonce;
    self->_bootNonce = v4;

  }
}

- (id)createFileHandleForWritingToURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  os_log_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  id v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    objc_msgSend(v3, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v8 = objc_msgSend(v4, "removeItemAtPath:error:", v7, &v18);
    v9 = (os_log_t)v18;

    if ((v8 & 1) == 0)
    {
      v15 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[FTABFile createFileHandleForWritingToURL:].cold.3(v3);

      goto LABEL_14;
    }

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "createFileAtPath:contents:attributes:", v11, 0, 0);

  if ((v12 & 1) == 0)
  {
    v9 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FTABFile createFileHandleForWritingToURL:].cold.2(v3);
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", v3, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t)v17;
  if (!v13)
  {
    v14 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FTABFile createFileHandleForWritingToURL:].cold.1();

  }
LABEL_15:

  return v13;
}

- (BOOL)configureFileHandleWriteDestinationForURL:(id)a3
{
  NSMutableData *dataWriteDestination;
  id v5;
  NSFileHandle *v6;
  NSFileHandle *fileHandleWriteDestination;

  dataWriteDestination = self->_dataWriteDestination;
  self->_dataWriteDestination = 0;
  v5 = a3;

  -[FTABFile createFileHandleForWritingToURL:](self, "createFileHandleForWritingToURL:", v5);
  v6 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();

  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  self->_fileHandleWriteDestination = v6;

  return self->_fileHandleWriteDestination != 0;
}

- (void)configureDataWriteDestination
{
  NSFileHandle *fileHandleWriteDestination;
  NSMutableData *v4;
  NSMutableData *dataWriteDestination;

  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  self->_fileHandleWriteDestination = 0;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  dataWriteDestination = self->_dataWriteDestination;
  self->_dataWriteDestination = v4;

}

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  NSFileHandle *fileHandleWriteDestination;
  NSMutableData *dataWriteDestination;

  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  if (fileHandleWriteDestination)
  {
    LOBYTE(dataWriteDestination) = -[NSFileHandle writeBytes:length:](fileHandleWriteDestination, "writeBytes:length:", a3, a4);
  }
  else
  {
    dataWriteDestination = self->_dataWriteDestination;
    if (dataWriteDestination)
    {
      -[NSMutableData appendBytes:length:](dataWriteDestination, "appendBytes:length:", a3, a4);
      LOBYTE(dataWriteDestination) = 1;
    }
  }
  return (char)dataWriteDestination;
}

- (BOOL)writeToDestination
{
  int v3;
  FTABSubfile *manifest;
  int v5;
  unsigned int v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  FTABSubfile *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _QWORD v50[2];
  int v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v53 = 0;
  v54 = 0;
  v55 = 0;
  v50[0] = *(_QWORD *)&self->_generation;
  v50[1] = *(_QWORD *)-[NSData bytes](self->_bootNonce, "bytes");
  v3 = 16 * -[NSMutableArray count](self->_subFileArray, "count");
  manifest = self->_manifest;
  if (manifest)
  {
    v5 = v3 + 48;
    v6 = -[FTABSubfile dataLength](manifest, "dataLength");
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v51 = v5;
  v52 = v6;
  v54 = *(_QWORD *)-[NSData bytes](self->_magic, "bytes");
  LODWORD(v55) = -[NSMutableArray count](self->_subFileArray, "count");
  if (!-[FTABFile writeBytes:length:](self, "writeBytes:length:", v50, 48))
  {
    v7 = (NSMutableArray *)os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
      -[FTABFile writeToDestination].cold.4(&v7->super.super, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_31;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = self->_subFileArray;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = v3 + v6 + 48;
    v11 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v42 = 0;
        v43 = 0;
        objc_msgSend(v13, "tag");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        LODWORD(v42) = *(_DWORD *)objc_msgSend(v14, "UTF8String");

        HIDWORD(v42) = v10;
        LODWORD(v43) = objc_msgSend(v13, "dataLength");
        if (!-[FTABFile writeBytes:length:](self, "writeBytes:length:", &v42, 16))
        {
          v29 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[FTABFile writeToDestination].cold.3(v13);
LABEL_30:

          goto LABEL_31;
        }
        v10 += objc_msgSend(v13, "dataLength");
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v9)
        continue;
      break;
    }
  }

  v15 = self->_manifest;
  if (v15
    && !-[FTABFile writeBytes:length:](self, "writeBytes:length:", -[FTABSubfile dataPointer](v15, "dataPointer"), -[FTABSubfile dataLength](self->_manifest, "dataLength")))
  {
    v7 = (NSMutableArray *)os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
      -[FTABFile writeToDestination].cold.2(&v7->super.super, v31, v32, v33, v34, v35, v36, v37);
LABEL_31:
    v21 = 0;
    goto LABEL_32;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = self->_subFileArray;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v7);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        if (!-[FTABFile writeBytes:length:](self, "writeBytes:length:", objc_msgSend(v20, "dataPointer", (_QWORD)v38), objc_msgSend(v20, "dataLength")))
        {
          v29 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[FTABFile writeToDestination].cold.1(v20);
          goto LABEL_30;
        }
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      v21 = 1;
      if (v17)
        continue;
      break;
    }
  }
  else
  {
    v21 = 1;
  }
LABEL_32:

  return v21;
}

- (BOOL)writeToURL:(id)a3
{
  id v4;
  BOOL v5;
  NSFileHandle *fileHandleWriteDestination;
  NSObject *v7;

  v4 = a3;
  if (-[FTABFile configureFileHandleWriteDestinationForURL:](self, "configureFileHandleWriteDestinationForURL:", v4))
  {
    v5 = -[FTABFile writeToDestination](self, "writeToDestination");
    fileHandleWriteDestination = self->_fileHandleWriteDestination;
    self->_fileHandleWriteDestination = 0;

  }
  else
  {
    v7 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FTABFile writeToURL:].cold.1(v4);

    v5 = 0;
  }

  return v5;
}

- (id)writeToData
{
  void *v3;
  NSMutableData *dataWriteDestination;

  -[FTABFile configureDataWriteDestination](self, "configureDataWriteDestination");
  -[FTABFile writeToDestination](self, "writeToDestination");
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", self->_dataWriteDestination);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dataWriteDestination = self->_dataWriteDestination;
  self->_dataWriteDestination = 0;

  return v3;
}

- (BOOL)writeSubfileToURL:(id)a3 tag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  -[FTABFile subfileWithTag:](self, "subfileWithTag:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[FTABFile createFileHandleForWritingToURL:](self, "createFileHandleForWritingToURL:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = objc_msgSend(v9, "writeBytes:length:", objc_msgSend(v8, "dataPointer"), objc_msgSend(v8, "dataLength"));
    else
      v10 = 0;

  }
  else
  {
    v11 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FTABFile writeSubfileToURL:tag:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4 handle:(id)a5
{
  void *v7;
  id v8;
  void *v9;

  v7 = (void *)MEMORY[0x24BDBCE50];
  v8 = a5;
  objc_msgSend(v7, "dataWithBytes:length:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v8, "uarpWriteData:error:", v9, 0);

  return (char)a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  FTABFile *v4;

  -[FTABFile writeToData](self, "writeToData", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FTABFile initWithData:]([FTABFile alloc], "initWithData:", v3);

  return v4;
}

- (const)filePointer
{
  return self->_filePointer;
}

- (unint64_t)fileLength
{
  return self->_fileLength;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (unsigned)generation
{
  return self->_generation;
}

- (unsigned)valid
{
  return self->_valid;
}

- (NSData)bootNonce
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (NSData)magic
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (FTABSubfile)manifest
{
  return (FTABSubfile *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_magic, 0);
  objc_storeStrong((id *)&self->_bootNonce, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_dataWriteDestination, 0);
  objc_storeStrong((id *)&self->_fileHandleWriteDestination, 0);
  objc_storeStrong((id *)&self->_subFileArray, 0);
  objc_storeStrong((id *)&self->_fileData, 0);
}

- (void)initWithContentsOfURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_24BC99000, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)parseFileData
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x3Cu);
}

- (void)addSubfileWithTagName:contentsOfURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_24BC99000, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)createFileHandleForWritingToURL:.cold.1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_9_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)createFileHandleForWritingToURL:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_24BC99000, v2, v3, "Unable to create file at %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

- (void)createFileHandleForWritingToURL:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_24BC99000, v2, v3, "Unable to delete file at %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

- (void)writeToDestination
{
  OUTLINED_FUNCTION_1(&dword_24BC99000, a1, a3, "Failed to write FTAB header", a5, a6, a7, a8, 0);
}

- (void)writeToURL:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_24BC99000, v2, v3, "Failed to open file handle for writing to '%@'", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

- (void)writeSubfileToURL:tag:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_2(&dword_24BC99000, v0, v1, "Unable to locate subfile with tag '%@'", v2);
  OUTLINED_FUNCTION_3();
}

@end
