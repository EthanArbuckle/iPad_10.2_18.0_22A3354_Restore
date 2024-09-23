@implementation SKDiskImageSizeLimits

+ (BOOL)isSupportedWholeDisk:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v7[0] = kSKDiskTypeGPTWholeDisk[0];
  v7[1] = kSKDiskTypeMBRWholeDisk[0];
  v7[2] = kSKDiskTypeAPMWholeDisk[0];
  v7[3] = kSKDiskTypeUninitalized[0];
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4);

  return (char)v3;
}

- (unint64_t)physicalStoreMinimumSizeFromStore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int MinimalSize;
  NSObject *v8;
  unint64_t v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "diskIdentifier");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "UTF8String");
    MinimalSize = APFSContainerGetMinimalSize();

    if (!MinimalSize)
    {
      v9 = 0;
      goto LABEL_8;
    }
    SKGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[SKDiskImageSizeLimits physicalStoreMinimumSizeFromStore:]";
      v13 = 2112;
      v14 = v3;
      v15 = 1024;
      v16 = MinimalSize;
      _os_log_impl(&dword_22FE50000, v8, OS_LOG_TYPE_ERROR, "%s: Failed to get size from %@, %d", buf, 0x1Cu);
    }

  }
  v9 = objc_msgSend(v3, "totalSpace");
LABEL_8:

  return v9;
}

- (unint64_t)currentBytes
{
  return self->_currentBytes;
}

- (void)setCurrentBytes:(unint64_t)a3
{
  self->_currentBytes = a3;
}

- (unint64_t)maxBytes
{
  return self->_maxBytes;
}

- (void)setMaxBytes:(unint64_t)a3
{
  self->_maxBytes = a3;
}

- (unint64_t)minBytes
{
  return self->_minBytes;
}

- (void)setMinBytes:(unint64_t)a3
{
  self->_minBytes = a3;
}

@end
