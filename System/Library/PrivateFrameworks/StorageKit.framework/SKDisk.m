@implementation SKDisk

- (id)minimalDictionaryRepresentation
{
  SKDisk *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("**ClassName**"));

  -[SKDisk diskObjectID](v2, "diskObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("diskObjectID"));

  -[SKDisk role](v2, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("role"));

  -[SKDisk type](v2, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("type"));

  -[SKDisk filesystemType](v2, "filesystemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SKDisk filesystemType](v2, "filesystemType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("filesystemType"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", kSKDiskFileSystemUndefined[0], CFSTR("filesystemType"));
  }
  -[SKDisk diskIdentifier](v2, "diskIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SKDisk diskIdentifier](v2, "diskIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("diskIdentifier"));

  }
  -[SKDisk mediaUUID](v2, "mediaUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SKDisk mediaUUID](v2, "mediaUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("mediaUUID"));

  }
  objc_sync_exit(v2);

  return v3;
}

- (id)dictionaryRepresentation
{
  SKDisk *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v2 = self;
  objc_sync_enter(v2);
  -[SKDisk minimalDictionaryRepresentation](v2, "minimalDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isValid](v2, "isValid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("isValid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isDiskImage](v2, "isDiskImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isDiskImage"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isInternal](v2, "isInternal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isInternal"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isWholeDisk](v2, "isWholeDisk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("isWholeDisk"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isPhysicalDisk](v2, "isPhysicalDisk"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isPhysicalDisk"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk canPartitionDisk](v2, "canPartitionDisk"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("canPartitionDisk"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isCaseSensitive](v2, "isCaseSensitive"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isCaseSensitive"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isLocked](v2, "isLocked"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isLocked"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isOSInternal](v2, "isOSInternal"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("isOSInternal"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isPartitionDisk](v2, "isPartitionDisk"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("isPartitionDisk"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKDisk freeSpace](v2, "freeSpace"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("freeSpace"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKDisk purgeableSpace](v2, "purgeableSpace"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("purgeableSpace"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKDisk availableSpace](v2, "availableSpace"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("availableSpace"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKDisk totalSpace](v2, "totalSpace"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("totalSpace"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKDisk startLocation](v2, "startLocation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("startLocation"));

  -[SKDisk mountPoint](v2, "mountPoint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    -[SKDisk mountPoint](v2, "mountPoint");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("mountPoint"));

  -[SKDisk volumeName](v2, "volumeName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    -[SKDisk volumeName](v2, "volumeName");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("volumeName"));

  -[SKDisk volumeUUID](v2, "volumeUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    -[SKDisk volumeUUID](v2, "volumeUUID");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("volumeUUID"));

  -[SKDisk ioContent](v2, "ioContent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    -[SKDisk ioContent](v2, "ioContent");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("ioContent"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKDisk unformattedSize](v2, "unformattedSize"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("unformattedSize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk supportsRepair](v2, "supportsRepair"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("supportsRepair"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk supportsVerify](v2, "supportsVerify"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("supportsVerify"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKDisk childCount](v2, "childCount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("childCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk supportsJournaling](v2, "supportsJournaling"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("supportsJournaling"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isJournaled](v2, "isJournaled"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("isJournaled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isWritable](v2, "isWritable"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("isWritable"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKDisk isMediaWritable](v2, "isMediaWritable"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("isMediaWritable"));

  -[SKDisk filesystem](v2, "filesystem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[SKDisk filesystem](v2, "filesystem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("filesystem"));

  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)matchesDictionary:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("**ClassName**"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    -[SKDisk diskIdentifier](self, "diskIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("diskIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v10)
    {
      v12 = 0;
      goto LABEL_9;
    }
    -[SKDisk mediaUUID](self, "mediaUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = 1;
      goto LABEL_9;
    }
    -[SKDisk mediaUUID](self, "mediaUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v12 = 0;
  }

LABEL_9:
  return v12;
}

- (SKDisk)initWithDictionary:(id)a3
{
  id v4;
  SKDisk *v5;
  SKDisk *v6;
  SKDisk *v7;

  v4 = a3;
  v5 = -[SKDisk init](self, "init");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    objc_sync_enter(v7);
    -[SKDisk updateWithDictionary:](v7, "updateWithDictionary:", v4);
    objc_sync_exit(v7);

  }
  return v6;
}

- (void)updateWithDictionary:(id)a3
{
  SKDisk *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  SKFilesystem *v68;
  void *v69;
  SKFilesystem *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  objc_class *v94;
  id v95;
  void *v96;
  id v97;
  uint8_t buf[24];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v97 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v97, "objectForKey:", CFSTR("**ClassName**"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "objectForKey:", CFSTR("**ClassName**"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      SKGetOSLog();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        v94 = (objc_class *)objc_opt_class();
        NSStringFromClass(v94);
        v95 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "objectForKey:", CFSTR("**ClassName**"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKDisk updateWithDictionary:].cold.1(v95, v96, buf, v93);
      }

      __assert_rtn("-[SKDisk updateWithDictionary:]", "SKDisk.m", 211, "NO");
    }
  }
  objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("diskObjectID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDisk setDiskObjectID:](v4, "setDiskObjectID:", v10);

  objc_msgSend(v97, "objectForKey:", CFSTR("role"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("role"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setRole:](v4, "setRole:", v12);

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("filesystemType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("filesystemType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setFilesystemType:](v4, "setFilesystemType:", v14);

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setType:](v4, "setType:", v16);

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isValid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isValid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsValid:](v4, "setIsValid:", objc_msgSend(v18, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isDiskImage"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isDiskImage"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsDiskImage:](v4, "setIsDiskImage:", objc_msgSend(v20, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isInternal"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isInternal"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsInternal:](v4, "setIsInternal:", objc_msgSend(v22, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isWholeDisk"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isWholeDisk"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsWholeDisk:](v4, "setIsWholeDisk:", objc_msgSend(v24, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isPhysicalDisk"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isPhysicalDisk"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsPhysicalDisk:](v4, "setIsPhysicalDisk:", objc_msgSend(v26, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("canPartitionDisk"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("canPartitionDisk"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setCanPartitionDisk:](v4, "setCanPartitionDisk:", objc_msgSend(v28, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isPartitionDisk"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isPartitionDisk"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsPartitionDisk:](v4, "setIsPartitionDisk:", objc_msgSend(v30, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("supportsJournaling"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("supportsJournaling"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setSupportsJournaling:](v4, "setSupportsJournaling:", objc_msgSend(v32, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isJournaled"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isJournaled"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsJournaled:](v4, "setIsJournaled:", objc_msgSend(v34, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isCaseSensitive"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isCaseSensitive"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsCaseSensitive:](v4, "setIsCaseSensitive:", objc_msgSend(v36, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("mediaUUID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("mediaUUID"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 == v39)
    {
      v40 = 0;
    }
    else
    {
      objc_msgSend(v97, "objectForKey:", CFSTR("mediaUUID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SKDisk setMediaUUID:](v4, "setMediaUUID:", v40);
    if (v38 != v39)

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isOSInternal"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isOSInternal"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsOSInternal:](v4, "setIsOSInternal:", objc_msgSend(v42, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("childCount"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("childCount"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setChildCount:](v4, "setChildCount:", objc_msgSend(v44, "unsignedLongLongValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("startLocation"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("startLocation"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setStartLocation:](v4, "setStartLocation:", objc_msgSend(v46, "unsignedLongLongValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isLocked"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isLocked"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsLocked:](v4, "setIsLocked:", objc_msgSend(v48, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("diskIdentifier"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("diskIdentifier"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50 == v51)
    {
      v52 = 0;
    }
    else
    {
      objc_msgSend(v97, "objectForKey:", CFSTR("diskIdentifier"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SKDisk setDiskIdentifier:](v4, "setDiskIdentifier:", v52);
    if (v50 != v51)

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("volumeName"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("volumeName"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54 == v55)
    {
      v56 = 0;
    }
    else
    {
      objc_msgSend(v97, "objectForKey:", CFSTR("volumeName"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SKDisk setVolumeName:](v4, "setVolumeName:", v56);
    if (v54 != v55)

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("volumeUUID"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("volumeUUID"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58 == v59)
    {
      v60 = 0;
    }
    else
    {
      objc_msgSend(v97, "objectForKey:", CFSTR("volumeUUID"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SKDisk setVolumeUUID:](v4, "setVolumeUUID:", v60);
    if (v58 != v59)

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("supportsRepair"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("supportsRepair"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setSupportsRepair:](v4, "setSupportsRepair:", objc_msgSend(v62, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("supportsVerify"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("supportsVerify"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setSupportsVerify:](v4, "setSupportsVerify:", objc_msgSend(v64, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("unformattedSize"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("unformattedSize"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setUnformattedSize:](v4, "setUnformattedSize:", objc_msgSend(v66, "unsignedLongLongValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("filesystem"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    v68 = [SKFilesystem alloc];
    objc_msgSend(v97, "objectForKey:", CFSTR("filesystem"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[SKFilesystem initWithDictionaryRepresentation:](v68, "initWithDictionaryRepresentation:", v69);
    -[SKDisk setFilesystem:](v4, "setFilesystem:", v70);

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("freeSpace"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("freeSpace"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setFreeSpace:](v4, "setFreeSpace:", objc_msgSend(v72, "unsignedLongLongValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("purgeableSpace"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("purgeableSpace"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setPurgeableSpace:](v4, "setPurgeableSpace:", objc_msgSend(v74, "unsignedLongLongValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("availableSpace"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("availableSpace"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setAvailableSpace:](v4, "setAvailableSpace:", objc_msgSend(v76, "unsignedLongLongValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("totalSpace"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("totalSpace"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setTotalSpace:](v4, "setTotalSpace:", objc_msgSend(v78, "unsignedLongLongValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("ioContent"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("ioContent"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80 == v81)
    {
      v82 = 0;
    }
    else
    {
      objc_msgSend(v97, "objectForKey:", CFSTR("ioContent"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SKDisk setIoContent:](v4, "setIoContent:", v82);
    if (v80 != v81)

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isWritable"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isWritable"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsWritable:](v4, "setIsWritable:", objc_msgSend(v84, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("isMediaWritable"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("isMediaWritable"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setIsMediaWritable:](v4, "setIsMediaWritable:", objc_msgSend(v86, "BOOLValue"));

  }
  objc_msgSend(v97, "objectForKey:", CFSTR("mountPoint"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    objc_msgSend(v97, "objectForKey:", CFSTR("mountPoint"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v88 == v89)
    {
      v90 = 0;
    }
    else
    {
      objc_msgSend(v97, "objectForKey:", CFSTR("mountPoint"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SKDisk setMountPoint:](v4, "setMountPoint:", v90);
    if (v88 != v89)

  }
  -[SKDisk volumeUUID](v4, "volumeUUID");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v91)
  {
    -[SKDisk _DAVolumeUUIDForDisk:](v4, "_DAVolumeUUIDForDisk:", v4);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk setVolumeUUID:](v4, "setVolumeUUID:", v92);

  }
  objc_sync_exit(v4);

}

+ (void)sortWithDisks:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_3);
}

uint64_t __24__SKDisk_sortWithDisks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  uint64_t v29;
  uint64_t v30;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "startLocation");
  if (v8 >= objc_msgSend(v7, "startLocation"))
  {
    v10 = objc_msgSend(v6, "startLocation");
    if (v10 <= objc_msgSend(v7, "startLocation"))
    {
      objc_msgSend(v6, "diskIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v11, "length") < 5)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v7, "diskIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13 < 5)
        {
          v9 = 0;
          goto LABEL_29;
        }
        objc_msgSend(v6, "diskIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "substringFromIndex:", 4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("s"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v11, "count");
        objc_msgSend(v7, "diskIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "substringFromIndex:", 4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("s"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v19, "count");
        v9 = 0;
        if (v16 && v20)
        {
          v21 = 0;
          v29 = v20;
          v30 = v16;
          if (v16 >= v20)
            v22 = v20;
          else
            v22 = v16;
          if (v22 <= 1)
            v23 = 1;
          else
            v23 = v22;
          v9 = 1;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v21, v29, v30);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "intValue");

            objc_msgSend(v19, "objectAtIndexedSubscript:", v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "intValue");

            if (v25 < v27)
            {
              v9 = -1;
              goto LABEL_27;
            }
            if (v25 > v27)
              goto LABEL_27;
            ++v21;
          }
          while (v23 != v21);
          if (v30 == v29)
          {
            v9 = 0;
          }
          else if (v30 < v29)
          {
            v9 = -1;
          }
          else
          {
            v9 = 1;
          }
        }
LABEL_27:

      }
      goto LABEL_29;
    }
    v9 = 1;
  }
  else
  {
    v9 = -1;
  }
LABEL_29:

  return v9;
}

- (id)children
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[SKDisk isWholeDisk](self, "isWholeDisk"))
  {
    -[SKDisk diskIdentifier](self, "diskIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "allDisks");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk");
      v7 = objc_alloc(MEMORY[0x24BDD17C8]);
      -[SKDisk diskIdentifier](self, "diskIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v6)
        v10 = CFSTR("%@/");
      else
        v10 = CFSTR("%@s");
      v11 = (void *)objc_msgSend(v7, "initWithFormat:", v10, v8);

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v5;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v17, "diskIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "hasPrefix:", v11);

            if (v19)
              objc_msgSend(v3, "addObject:", v17);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v14);
      }

      +[SKDisk sortWithDisks:](SKDisk, "sortWithDisks:", v3);
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[SKDisk mediaUUID](self, "mediaUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = isEqualOrBothNil((unint64_t)v6, (uint64_t)v7);

    if (v8)
    {
      -[SKDisk diskIdentifier](self, "diskIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "diskIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = isEqualOrBothNil((unint64_t)v9, (uint64_t)v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[SKDisk mediaUUID](self, "mediaUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKDisk diskIdentifier](self, "diskIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  if (v3)
  {
    -[SKDisk mediaUUID](self, "mediaUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 ^= objc_msgSend(v6, "hash");

  }
  return v5;
}

- (id)supportedFilesystems
{
  void *v2;
  void *v3;

  +[SKManager sharedManager](SKManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formatableFileSystems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canResize
{
  void *v3;
  void *v4;
  char v5;

  -[SKDisk filesystemType](self, "filesystemType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", kSKDiskFileSystemHFS[0]))
  {
    -[SKDisk filesystem](self, "filesystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isJournaled");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isExternal
{
  if (-[SKDisk isInternal](self, "isInternal"))
    return 0;
  else
    return !-[SKDisk isDiskImage](self, "isDiskImage");
}

- (BOOL)isTrusted
{
  _BOOL4 v3;

  v3 = -[SKDisk isInternal](self, "isInternal");
  if (v3)
    LOBYTE(v3) = !-[SKDisk isRemovable](self, "isRemovable");
  return v3;
}

- (void)expireCacheWithOptions:(unint64_t)a3 completionBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recacheDisk:options:callbackBlock:", self, a3, v6);

}

- (void)expireCacheWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recacheDisk:options:callbackBlock:", self, 0, v4);

}

- (void)expireCache
{
  id v3;

  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recacheDisk:options:callbackBlock:", self, 0, 0);

}

- (void)recacheWithOptions:(unint64_t)a3
{
  id v5;

  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recacheDisk:options:blocking:callbackBlock:", self, a3, 1, 0);

}

- (BOOL)canBoot
{
  void *v2;
  char v3;

  -[SKDisk role](self, "role");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", kSKDiskRoleMacSystem[0]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", kSKDiskRoleLegacyMacSystem[0]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", kSKDiskRoleWindowsSystem[0]);
  }

  return v3;
}

- (BOOL)canBeErasedToRole:(id)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = kSKDiskRoleLegacyMacData[0];
  v5 = kSKDiskRoleMacData[0];
  v6 = kSKDiskRoleWindowsData[0];
  v7 = kSKDiskRoleDigitalCameraData[0];
  v8 = kSKDiskRoleExternalMedia[0];
  v9 = a3;
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v10, "containsObject:", v9);

  return (char)v4;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  const __CFString *v3;
  const __CFString *mediaUUID;
  const __CFString *volumeUUID;

  if (self->_isValid)
    v3 = CFSTR("Yes");
  else
    v3 = CFSTR("No");
  mediaUUID = CFSTR("None");
  volumeUUID = (const __CFString *)self->_volumeUUID;
  if (!volumeUUID)
    volumeUUID = CFSTR("None");
  if (self->_mediaUUID)
    mediaUUID = (const __CFString *)self->_mediaUUID;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Role: %@, Type: %@, Valid: %@, Volume UUID: %@, Media UUID: %@"), self->_role, self->_type, v3, volumeUUID, mediaUUID);
}

- (id)redactedDescription
{
  SKDisk *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *diskObjectID;
  const __CFString *diskIdentifier;
  NSString *mountPoint;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  diskObjectID = v2->_diskObjectID;
  diskIdentifier = (const __CFString *)v2->_diskIdentifier;
  mountPoint = v2->_mountPoint;
  -[SKDisk innerDescriptionWithPrivateData:](v2, "innerDescriptionWithPrivateData:", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("None");
  if (diskIdentifier)
    v11 = diskIdentifier;
  v12 = CFSTR("Yes");
  if (!mountPoint)
    v12 = CFSTR("No");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: [%@] { BSD Name: %@, Mounted: %@, %@ }>"), v5, diskObjectID, v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v13;
}

- (id)description
{
  SKDisk *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *diskObjectID;
  const __CFString *volumeName;
  const __CFString *diskIdentifier;
  const __CFString *mountPoint;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  diskObjectID = v2->_diskObjectID;
  volumeName = (const __CFString *)v2->_volumeName;
  diskIdentifier = (const __CFString *)v2->_diskIdentifier;
  mountPoint = (const __CFString *)v2->_mountPoint;
  -[SKDisk innerDescriptionWithPrivateData:](v2, "innerDescriptionWithPrivateData:", 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("Not Mounted");
  if (mountPoint)
    v12 = mountPoint;
  v13 = CFSTR("None");
  if (diskIdentifier)
    v13 = diskIdentifier;
  v14 = &stru_24FDC08E8;
  if (volumeName)
    v14 = volumeName;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: [%@] { Volume Name: \"%@\", BSD Name: %@, Mount point: %@, %@ }>"), v5, diskObjectID, v14, v13, v12, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v15;
}

- (id)_DAVolumeUUIDForDiskIdentifier:(id)a3
{
  id v3;
  void *v4;
  const __CFAllocator *v5;
  __DASession *v6;
  __DASession *v7;
  __DADisk *v8;
  __DADisk *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  const void *Value;
  const void *v13;
  CFTypeID v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;

  v3 = a3;
  v4 = v3;
  if (v3
    && objc_msgSend(v3, "length")
    && (v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240],
        (v6 = DASessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240])) != 0))
  {
    v7 = v6;
    v8 = DADiskCreateFromBSDName(v5, v6, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    if (v8)
    {
      v9 = v8;
      v10 = DADiskCopyDescription(v8);
      if (v10)
      {
        v11 = v10;
        Value = CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BE2D088]);
        if (Value
          && (v13 = Value, v14 = CFUUIDGetTypeID(), v14 == CFGetTypeID(v13))
          && (v15 = (__CFString *)CFUUIDCreateString(v5, (CFUUIDRef)v13)) != 0)
        {
          v16 = v15;
          v17 = (void *)-[__CFString copy](v15, "copy");
          CFRelease(v16);
        }
        else
        {
          v17 = 0;
        }
        CFRelease(v11);
      }
      else
      {
        v17 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      v17 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_DAVolumeUUIDForDisk:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[SKDisk diskIdentifier](self, "diskIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDisk _DAVolumeUUIDForDiskIdentifier:](self, "_DAVolumeUUIDForDiskIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)wholeDiskIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SKDisk contentDiskIdentifier](self, "contentDiskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringFromIndex:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("s"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    -[SKDisk contentDiskIdentifier](self, "contentDiskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringToIndex:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)cachedWholeDiskByIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
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
  -[SKDisk wholeDiskIdentifier](self, "wholeDiskIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allDisks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_msgSend(v9, "diskIdentifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v2);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isVirtualDiskType
{
  return 0;
}

- (BOOL)isIOMediaDisk
{
  if (-[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk"))
    return 0;
  else
    return !-[SKDisk isIOSRootSnapshot](self, "isIOSRootSnapshot");
}

- (BOOL)isLiveFSAPFSDisk
{
  void *v2;
  char v3;

  -[SKDisk diskIdentifier](self, "diskIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("apfs://disk"));

  return v3;
}

- (BOOL)isIOSRootSnapshot
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)rename:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renameDisk:to:withCompletionBlock:", self, v7, v6);

  return 1;
}

- (BOOL)unmountWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unmountDisk:withCompletionBlock:", self, v4);

  return 1;
}

- (BOOL)unmountWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unmountDisk:options:withCompletionBlock:", self, v7, v6);

  return 1;
}

- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  SKSyncCommand *v7;
  void *v8;
  SKSyncCommand *v9;
  _QWORD v11[4];
  SKSyncCommand *v12;

  v6 = a3;
  v7 = objc_alloc_init(SKSyncCommand);
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __35__SKDisk_unmountWithOptions_error___block_invoke;
  v11[3] = &unk_24FDC0030;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v8, "unmountDisk:options:blocking:withCompletionBlock:", self, v6, 1, v11);

  LOBYTE(a4) = -[SKSyncCommand returnWithError:](v9, "returnWithError:", a4);
  return (char)a4;
}

uint64_t __35__SKDisk_unmountWithOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "onCallbackWithError:", a2);
}

- (BOOL)mountWithCompletionBlock:(id)a3
{
  return -[SKDisk mountWithOptions:withCompletionBlock:](self, "mountWithOptions:withCompletionBlock:", 0, a3);
}

- (BOOL)mountWithOptions:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("kSKDiskMountOptionToolOptions"));
  v10 = -[SKDisk mountWithOptionsDictionary:withCompletionBlock:](self, "mountWithOptionsDictionary:withCompletionBlock:", v9, v7);

  return v10;
}

- (BOOL)mountWithOptionsDictionary:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mountDisk:options:completionBlock:", self, v7, v6);

  return 1;
}

- (BOOL)mountWithOptionsDictionary:(id)a3 error:(id *)a4
{
  id v6;
  SKSyncCommand *v7;
  void *v8;
  SKSyncCommand *v9;
  _QWORD v11[4];
  SKSyncCommand *v12;

  v6 = a3;
  v7 = objc_alloc_init(SKSyncCommand);
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__SKDisk_mountWithOptionsDictionary_error___block_invoke;
  v11[3] = &unk_24FDC0030;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v8, "mountDisk:options:blocking:completionBlock:", self, v6, 1, v11);

  LOBYTE(a4) = -[SKSyncCommand returnWithError:](v9, "returnWithError:", a4);
  return (char)a4;
}

uint64_t __43__SKDisk_mountWithOptionsDictionary_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "onCallbackWithError:", a2);
}

- (BOOL)mountWithParams:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[SKDisk mountWithOptionsDictionary:error:](self, "mountWithOptionsDictionary:error:", v6, a4);

  return (char)a4;
}

- (BOOL)ejectWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ejectDisk:withCompletionBlock:", self, v4);

  return 1;
}

- (BOOL)ejectWithError:(id *)a3
{
  SKSyncCommand *v5;
  void *v6;
  SKSyncCommand *v7;
  _QWORD v9[4];
  SKSyncCommand *v10;

  v5 = objc_alloc_init(SKSyncCommand);
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __25__SKDisk_ejectWithError___block_invoke;
  v9[3] = &unk_24FDC0030;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "ejectDisk:blocking:withCompletionBlock:", self, 1, v9);

  LOBYTE(a3) = -[SKSyncCommand returnWithError:](v7, "returnWithError:", a3);
  return (char)a3;
}

uint64_t __25__SKDisk_ejectWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "onCallbackWithError:", a2);
}

- (id)resizeToSize:(unint64_t)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  +[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resize:toSize:completionBlock:", self, a3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "chainChildProgress:withPendingUnitCount:", v9, 100);
  return v7;
}

- (void)resize:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "resize:toSize:completionBlock:", self, a3, v8);

}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)filesystemType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFilesystemType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSString)volumeName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVolumeName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)volumeUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVolumeUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)mediaUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMediaUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)mountPoint
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMountPoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)freeSpace
{
  return self->_freeSpace;
}

- (void)setFreeSpace:(unint64_t)a3
{
  self->_freeSpace = a3;
}

- (unint64_t)purgeableSpace
{
  return self->_purgeableSpace;
}

- (void)setPurgeableSpace:(unint64_t)a3
{
  self->_purgeableSpace = a3;
}

- (unint64_t)availableSpace
{
  return self->_availableSpace;
}

- (void)setAvailableSpace:(unint64_t)a3
{
  self->_availableSpace = a3;
}

- (unint64_t)totalSpace
{
  return self->_totalSpace;
}

- (void)setTotalSpace:(unint64_t)a3
{
  self->_totalSpace = a3;
}

- (NSString)diskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDiskIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)isDiskImage
{
  return self->_isDiskImage;
}

- (void)setIsDiskImage:(BOOL)a3
{
  self->_isDiskImage = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)isRemovable
{
  return self->_isRemovable;
}

- (void)setIsRemovable:(BOOL)a3
{
  self->_isRemovable = a3;
}

- (BOOL)isWholeDisk
{
  return self->_isWholeDisk;
}

- (void)setIsWholeDisk:(BOOL)a3
{
  self->_isWholeDisk = a3;
}

- (BOOL)isPhysicalDisk
{
  return self->_isPhysicalDisk;
}

- (void)setIsPhysicalDisk:(BOOL)a3
{
  self->_isPhysicalDisk = a3;
}

- (BOOL)canPartitionDisk
{
  return self->_canPartitionDisk;
}

- (void)setCanPartitionDisk:(BOOL)a3
{
  self->_canPartitionDisk = a3;
}

- (BOOL)supportsJournaling
{
  return self->_supportsJournaling;
}

- (void)setSupportsJournaling:(BOOL)a3
{
  self->_supportsJournaling = a3;
}

- (BOOL)isJournaled
{
  return self->_isJournaled;
}

- (void)setIsJournaled:(BOOL)a3
{
  self->_isJournaled = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (NSString)ioContent
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIoContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)supportsRepair
{
  return self->_supportsRepair;
}

- (void)setSupportsRepair:(BOOL)a3
{
  self->_supportsRepair = a3;
}

- (BOOL)supportsVerify
{
  return self->_supportsVerify;
}

- (void)setSupportsVerify:(BOOL)a3
{
  self->_supportsVerify = a3;
}

- (unint64_t)unformattedSize
{
  return self->_unformattedSize;
}

- (void)setUnformattedSize:(unint64_t)a3
{
  self->_unformattedSize = a3;
}

- (BOOL)isCaseSensitive
{
  return self->_isCaseSensitive;
}

- (void)setIsCaseSensitive:(BOOL)a3
{
  self->_isCaseSensitive = a3;
}

- (unint64_t)childCount
{
  return self->_childCount;
}

- (void)setChildCount:(unint64_t)a3
{
  self->_childCount = a3;
}

- (unint64_t)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(unint64_t)a3
{
  self->_startLocation = a3;
}

- (SKFilesystem)filesystem
{
  return (SKFilesystem *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFilesystem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)role
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRole:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)isOSInternal
{
  return self->_isOSInternal;
}

- (void)setIsOSInternal:(BOOL)a3
{
  self->_isOSInternal = a3;
}

- (BOOL)isPartitionDisk
{
  return self->_isPartitionDisk;
}

- (void)setIsPartitionDisk:(BOOL)a3
{
  self->_isPartitionDisk = a3;
}

- (BOOL)isWritable
{
  return self->_isWritable;
}

- (void)setIsWritable:(BOOL)a3
{
  self->_isWritable = a3;
}

- (BOOL)isMediaWritable
{
  return self->_isMediaWritable;
}

- (void)setIsMediaWritable:(BOOL)a3
{
  self->_isMediaWritable = a3;
}

- (NSNumber)diskObjectID
{
  return self->_diskObjectID;
}

- (void)setDiskObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_diskObjectID, a3);
}

- (NSObject)daDisk
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setDaDisk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (unsigned)ownerUID
{
  return self->_ownerUID;
}

- (void)setOwnerUID:(unsigned int)a3
{
  self->_ownerUID = a3;
}

- (SKDiskPrivateCache)privateCache
{
  return self->_privateCache;
}

- (void)setPrivateCache:(id)a3
{
  objc_storeStrong((id *)&self->_privateCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateCache, 0);
  objc_storeStrong((id *)&self->_daDisk, 0);
  objc_storeStrong((id *)&self->_diskObjectID, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_filesystem, 0);
  objc_storeStrong((id *)&self->_ioContent, 0);
  objc_storeStrong((id *)&self->_diskIdentifier, 0);
  objc_storeStrong((id *)&self->_mountPoint, 0);
  objc_storeStrong((id *)&self->_mediaUUID, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_volumeName, 0);
  objc_storeStrong((id *)&self->_filesystemType, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (id)formattableFilesystems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[SKDisk isMediaWritable](self, "isMediaWritable"))
  {
    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formatableFileSystems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SKDisk isExternal](self, "isExternal"))
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SKFilesystem allFilesystems](SKFilesystem, "allFilesystems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "filteredArrayUsingPredicate:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_13_0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "filteredArrayUsingPredicate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_15_0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v6;
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isExtension");
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "majorType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hfs")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "majorType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("apfs")) ^ 1;

  }
  return v4;
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "majorType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("apfs")))
    v4 = objc_msgSend(v2, "isExtension") ^ 1;
  else
    v4 = 0;

  return v4;
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "sortPriority");
  if (v6 >= (int)objc_msgSend(v5, "sortPriority"))
  {
    v8 = objc_msgSend(v4, "sortPriority");
    v7 = v8 > (int)objc_msgSend(v5, "sortPriority");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (id)formattableFilesystemWithFilesystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[SKDisk formattableFilesystems](self, "formattableFilesystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) == 0)
  {
    v6 = (void *)MEMORY[0x24BDD1758];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__SKDisk_Erase__formattableFilesystemWithFilesystem___block_invoke;
    v11[3] = &unk_24FDC01A0;
    v12 = v4;
    v7 = v4;
    objc_msgSend(v6, "predicateWithBlock:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

uint64_t __53__SKDisk_Erase__formattableFilesystemWithFilesystem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isExtensionInsensitiveEqual:", *(_QWORD *)(a1 + 32));
}

- (BOOL)cleanupWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SKDisk children](self, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "cleanupWithError:", a3))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (unsigned)getSectorSize
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  unsigned int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  SKDisk *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = 512;
  -[SKDisk diskIdentifier](self, "diskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    SKGetOSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[SKDisk(Erase) getSectorSize]";
      v19 = 2112;
      v20 = self;
      v12 = "%s: Disk %@, does not have a BSD name";
      v13 = v11;
      v14 = 22;
LABEL_12:
      _os_log_impl(&dword_22FE50000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }
LABEL_13:

    return 512;
  }
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SKDisk diskIdentifier](self, "diskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("/dev/r%@"), v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0);

  if (v7 < 0)
  {
    SKGetOSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = *__error();
      *(_DWORD *)buf = 136315650;
      v18 = "-[SKDisk(Erase) getSectorSize]";
      v19 = 2112;
      v20 = self;
      v21 = 1024;
      v22 = v15;
      v12 = "%s: Failed to get block size of %@, open err %d";
      v13 = v11;
      v14 = 28;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (ioctl(v7, 0x40046418uLL, &v16))
  {
    SKGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *__error();
      *(_DWORD *)buf = 136315650;
      v18 = "-[SKDisk(Erase) getSectorSize]";
      v19 = 2112;
      v20 = self;
      v21 = 1024;
      v22 = v9;
      _os_log_impl(&dword_22FE50000, v8, OS_LOG_TYPE_ERROR, "%s: Failed to get block size of %@, ioctl err %d", buf, 0x1Cu);
    }

  }
  close(v7);
  return v16;
}

- (BOOL)wipeDiskWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;

  -[SKDisk diskIdentifier](self, "diskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v13 = CFSTR("Disk does not have a BSD name");
    v14 = 22;
    return +[SKError failWithPOSIXCode:debugDescription:error:](SKError, "failWithPOSIXCode:debugDescription:error:", v14, v13, a3);
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[SKDisk diskIdentifier](self, "diskIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("/dev/r%@"), v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 2);

  if (v9 < 0)
  {
    v14 = *__error();
    v13 = CFSTR("Failed to open disk");
    return +[SKError failWithPOSIXCode:debugDescription:error:](SKError, "failWithPOSIXCode:debugDescription:error:", v14, v13, a3);
  }
  -[SKDisk getSectorSize](self, "getSectorSize");
  v10 = wipefs_alloc();
  if ((_DWORD)v10)
  {
    v11 = v10;
    close(v9);
    v12 = CFSTR("wipefs_alloc failed");
  }
  else
  {
    v11 = wipefs_wipe();
    wipefs_free();
    close(v9);
    if (!(_DWORD)v11)
      return 1;
    v12 = CFSTR("wipefs_wipe failed");
  }
  return +[SKError failWithPOSIXCode:debugDescription:error:](SKError, "failWithPOSIXCode:debugDescription:error:", v11, v12, a3);
}

- (void)updateWithDictionary:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_impl(&dword_22FE50000, log, OS_LOG_TYPE_ERROR, "Invalid Class Update: %{public}@ -> %{public}@", buf, 0x16u);

}

@end
