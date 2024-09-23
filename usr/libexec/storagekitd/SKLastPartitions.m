@implementation SKLastPartitions

- (SKLastPartitions)initWithDisk:(id)a3
{
  id v4;
  SKLastPartitions *v5;
  void *v6;
  void *v7;
  SKDisk *resizablePart;
  void **p_resizablePart;
  void *v10;
  unsigned int v11;
  SKDisk *v12;
  SKDisk *recoveryPart;
  SKDisk *v14;
  id v15;
  void *v16;
  void *v17;
  SKDisk *v18;
  uint64_t v20;
  SKDisk *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SKLastPartitions;
  v5 = -[SKLastPartitions init](&v28, "init");
  if (!v5)
    goto LABEL_11;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "children"));
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    resizablePart = (SKDisk *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    p_resizablePart = (void **)&v5->_resizablePart;
    objc_storeStrong((id *)&v5->_resizablePart, resizablePart);
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](resizablePart, "ioContent"));
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Apple_APFS_Recovery"));

      if (v11)
      {
        v12 = resizablePart;
        recoveryPart = v5->_recoveryPart;
        v5->_recoveryPart = v12;
      }
      else
      {
        v20 = objc_opt_class(SKAPFSStoreDisk);
        if ((objc_opt_isKindOfClass(resizablePart, v20) & 1) == 0)
          goto LABEL_19;
        v21 = (SKDisk *)objc_claimAutoreleasedReturnValue(-[SKDisk container](resizablePart, "container"));
        recoveryPart = v21;
        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk volumes](v21, "volumes"));
          if (objc_msgSend(v22, "count") == (id)1)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 0));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getAPFSVolumeRole"));
            v25 = objc_msgSend(v24, "isEqualToString:", SKAPFSVolumeRoleRecovery);

            if (v25)
              objc_storeStrong((id *)&v5->_recoveryPart, resizablePart);
          }

        }
      }

LABEL_19:
      if (v5->_recoveryPart)
      {
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)objc_msgSend(v7, "count") - 2));
        v27 = *p_resizablePart;
        *p_resizablePart = (void *)v26;

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
  v16 = (void *)objc_opt_class(v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
  v5->_nonResizableSize = (unint64_t)v15
                        + (_QWORD)objc_msgSend(v16, "secondaryPartitionTableSizeWithDiskType:", v17);

  v18 = v5->_recoveryPart;
  if (v18)
    v5->_nonResizableSize += (unint64_t)-[SKDisk unformattedSize](v18, "unformattedSize");

LABEL_11:
  return v5;
}

+ (unint64_t)secondaryPartitionTableSizeWithDiskType:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", kSKDiskTypeGPTWholeDisk))
    return 20480;
  else
    return 0;
}

+ (unint64_t)hfsMinimalSizeForDisk:(id)a3 currentSize:(unint64_t *)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  __MKMedia *v8;
  id v9;
  int v10;
  id v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  unint64_t v16;
  id v17;
  unsigned int v18;
  id v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  v7 = objc_msgSend(v6, "isEqualToString:", kSKDiskTypeHFS);

  if ((v7 & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v20 = 0;
    v8 = +[SKPartitionTable createMediaRefWithDisk:error:](SKPartitionTable, "createMediaRefWithDisk:error:", v5, &v20);
    v9 = v20;
    if (v8)
    {
      v10 = MKHFSGetResizeLimits(&v21, v8, 0);
      CFRelease(v8);
      if (!v10)
      {
        v18 = objc_msgSend(v5, "getSectorSize");
        if (a4)
          *a4 = v21 * v18;
        v16 = v22 * v18;
        goto LABEL_14;
      }
      v11 = sub_10000BA9C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "+[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]";
        v25 = 2112;
        v26 = v5;
        v27 = 1024;
        LODWORD(v28) = v10;
        v13 = "%s: Failed to get size from %@, %d";
        v14 = v12;
        v15 = 28;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      }
    }
    else
    {
      v17 = sub_10000BA9C();
      v12 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "+[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]";
        v25 = 2112;
        v26 = v5;
        v27 = 2112;
        v28 = v9;
        v13 = "%s: Failed to read media from %@, %@";
        v14 = v12;
        v15 = 32;
        goto LABEL_9;
      }
    }

    v16 = (unint64_t)objc_msgSend(v5, "totalSpace");
LABEL_14:

    goto LABEL_15;
  }
  v16 = (unint64_t)objc_msgSend(v5, "totalSpace");
LABEL_15:

  return v16;
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
