@implementation SKLastPartitions

- (SKLastPartitions)initWithDisk:(id)a3
{
  id v4;
  SKLastPartitions *v5;
  void *v6;
  void *v7;
  void *resizablePart;
  void **p_resizablePart;
  void *v10;
  int v11;
  SKDisk *v12;
  SKDisk *recoveryPart;
  SKDisk *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  SKDisk *v18;
  SKDisk *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SKLastPartitions;
  v5 = -[SKLastPartitions init](&v27, sel_init);
  if (!v5)
    goto LABEL_11;
  objc_msgSend(v4, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "lastObject");
    resizablePart = (void *)objc_claimAutoreleasedReturnValue();
    p_resizablePart = (void **)&v5->_resizablePart;
    objc_storeStrong((id *)&v5->_resizablePart, resizablePart);
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      objc_msgSend(resizablePart, "ioContent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Apple_APFS_Recovery"));

      if (v11)
      {
        v12 = resizablePart;
        recoveryPart = v5->_recoveryPart;
        v5->_recoveryPart = v12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_19;
        objc_msgSend(resizablePart, "container");
        v20 = (SKDisk *)objc_claimAutoreleasedReturnValue();
        recoveryPart = v20;
        if (v20)
        {
          -[SKDisk volumes](v20, "volumes");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "count") == 1)
          {
            objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "getAPFSVolumeRole");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", SKAPFSVolumeRoleRecovery);

            if (v24)
              objc_storeStrong((id *)&v5->_recoveryPart, resizablePart);
          }

        }
      }

LABEL_19:
      if (v5->_recoveryPart)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 2);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *p_resizablePart;
        *p_resizablePart = (void *)v25;

      }
    }
  }
  else
  {
    v14 = (SKDisk *)v4;
    resizablePart = v5->_resizablePart;
    v5->_resizablePart = v14;
  }

  v15 = -[SKDisk startLocation](v5->_resizablePart, "startLocation");
  v16 = (void *)objc_opt_class();
  objc_msgSend(v4, "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_nonResizableSize = objc_msgSend(v16, "secondaryPartitionTableSizeWithDiskType:", v17) + v15;

  v18 = v5->_recoveryPart;
  if (v18)
    v5->_nonResizableSize += -[SKDisk unformattedSize](v18, "unformattedSize");

LABEL_11:
  return v5;
}

+ (unint64_t)secondaryPartitionTableSizeWithDiskType:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", kSKDiskTypeGPTWholeDisk[0]))
    return 20480;
  else
    return 0;
}

+ (unint64_t)hfsMinimalSizeForDisk:(id)a3 currentSize:(unint64_t *)a4
{
  id v5;
  void *v6;
  char v7;
  __MKMedia *v8;
  id v9;
  int v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  unint64_t v15;
  unsigned int v16;
  id v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", kSKDiskTypeHFS[0]);

  if ((v7 & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v18 = 0;
    v8 = +[SKPartitionTable createMediaRefWithDisk:error:](SKPartitionTable, "createMediaRefWithDisk:error:", v5, &v18);
    v9 = v18;
    if (v8)
    {
      v10 = MKHFSGetResizeLimits();
      CFRelease(v8);
      if (!v10)
      {
        v16 = objc_msgSend(v5, "getSectorSize");
        if (a4)
          *a4 = v19 * v16;
        v15 = v20 * v16;
        goto LABEL_14;
      }
      SKGetOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "+[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]";
        v23 = 2112;
        v24 = v5;
        v25 = 1024;
        LODWORD(v26) = v10;
        v12 = "%s: Failed to get size from %@, %d";
        v13 = v11;
        v14 = 28;
LABEL_9:
        _os_log_impl(&dword_22FE50000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      }
    }
    else
    {
      SKGetOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "+[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]";
        v23 = 2112;
        v24 = v5;
        v25 = 2112;
        v26 = v9;
        v12 = "%s: Failed to read media from %@, %@";
        v13 = v11;
        v14 = 32;
        goto LABEL_9;
      }
    }

    v15 = objc_msgSend(v5, "totalSpace");
LABEL_14:

    goto LABEL_15;
  }
  v15 = objc_msgSend(v5, "totalSpace");
LABEL_15:

  return v15;
}

- (SKDisk)resizablePart
{
  return self->_resizablePart;
}

- (SKDisk)recoveryPart
{
  return self->_recoveryPart;
}

- (unint64_t)nonResizableSize
{
  return self->_nonResizableSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryPart, 0);
  objc_storeStrong((id *)&self->_resizablePart, 0);
}

@end
