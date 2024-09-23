@implementation PLVolumeInfo

- (PLVolumeInfo)initWithPath:(id)a3
{
  void *v4;
  PLVolumeInfo *v5;

  +[PLDiskController mountPointForPath:](PLDiskController, "mountPointForPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLVolumeInfo initWithMountPoint:](self, "initWithMountPoint:", v4);

  return v5;
}

- (PLVolumeInfo)initWithMountPoint:(id)a3
{
  id v4;
  PLVolumeInfo *v5;
  id v6;
  NSObject *v7;
  int *v8;
  char *v9;
  uint64_t f_bsize;
  int v12;
  id v13;
  __int16 v14;
  char *v15;
  statfs v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PLVolumeInfo init](self, "init");
  if (v5)
  {
    if (v4)
    {
      bzero(&v16, 0x878uLL);
      v6 = objc_retainAutorelease(v4);
      if (!statfs((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v16))
      {
        f_bsize = v16.f_bsize;
        v5->_blockSize = v16.f_bsize;
        v5->_volumeSize = v16.f_blocks * f_bsize;
        objc_storeStrong((id *)&v5->_mountPoint, v6);
        goto LABEL_9;
      }
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = __error();
        v9 = strerror(*v8);
        v12 = 138412546;
        v13 = v6;
        v14 = 2080;
        v15 = v9;
        _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "unable to stat volume %@: %s", (uint8_t *)&v12, 0x16u);
      }

    }
    v5 = 0;
  }
LABEL_9:

  return v5;
}

- (int64_t)availableSpace
{
  return +[PLDiskController diskSpaceAvailableForPath:](PLDiskController, "diskSpaceAvailableForPath:", self->_mountPoint);
}

- (unint64_t)desiredDiskThreshold
{
  unint64_t result;
  NSObject *v4;
  int *v5;
  char *v6;
  unint64_t volumeSize;
  unsigned int v8;
  uint8_t buf[4];
  char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = self->_desiredDiskThreshold;
  if (!result)
  {
    v8 = 0;
    if (fsctl(-[NSString fileSystemRepresentation](self->_mountPoint, "fileSystemRepresentation"), 0x4004681DuLL, &v8, 0))
    {
      PLBackendGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        volumeSize = self->_volumeSize;
        *(_DWORD *)buf = 136315650;
        v10 = v6;
        v11 = 2048;
        v12 = 1283457024;
        v13 = 2048;
        v14 = volumeSize;
        _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED desired threshold %llu for volume_size: %llu", buf, 0x20u);
      }

      result = 1283457024;
    }
    else
    {
      result = self->_blockSize * v8;
    }
    self->_desiredDiskThreshold = result;
  }
  return result;
}

- (unint64_t)nearLowDiskThreshold
{
  unint64_t result;
  NSObject *v4;
  int *v5;
  char *v6;
  unint64_t volumeSize;
  unsigned int v8;
  uint8_t buf[4];
  char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = self->_nearLowDiskThreshold;
  if (!result)
  {
    v8 = 0;
    if (fsctl(-[NSString fileSystemRepresentation](self->_mountPoint, "fileSystemRepresentation"), 0x40044A12uLL, &v8, 0))
    {
      PLBackendGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        volumeSize = self->_volumeSize;
        *(_DWORD *)buf = 136315650;
        v10 = v6;
        v11 = 2048;
        v12 = 0x40000000;
        v13 = 2048;
        v14 = volumeSize;
        _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED near low threshold %llu for volume_size: %llu", buf, 0x20u);
      }

      result = 0x40000000;
    }
    else
    {
      result = self->_blockSize * v8;
    }
    self->_nearLowDiskThreshold = result;
  }
  return result;
}

- (unint64_t)lowDiskThreshold
{
  unint64_t result;
  NSObject *v4;
  int *v5;
  char *v6;
  unint64_t volumeSize;
  unsigned int v8;
  uint8_t buf[4];
  char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = self->_lowDiskThreshold;
  if (!result)
  {
    v8 = 0;
    if (fsctl(-[NSString fileSystemRepresentation](self->_mountPoint, "fileSystemRepresentation"), 0x4004681CuLL, &v8, 0))
    {
      PLBackendGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        volumeSize = self->_volumeSize;
        *(_DWORD *)buf = 136315650;
        v10 = v6;
        v11 = 2048;
        v12 = 734003200;
        v13 = 2048;
        v14 = volumeSize;
        _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED low threshold %llu for volume_size: %llu", buf, 0x20u);
      }

      result = 734003200;
    }
    else
    {
      result = self->_blockSize * v8;
    }
    self->_lowDiskThreshold = result;
  }
  return result;
}

- (unint64_t)veryLowDiskThreshold
{
  unint64_t result;
  NSObject *v4;
  int *v5;
  char *v6;
  unint64_t volumeSize;
  unsigned int v8;
  uint8_t buf[4];
  char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = self->_veryLowDiskThreshold;
  if (!result)
  {
    v8 = 0;
    if (fsctl(-[NSString fileSystemRepresentation](self->_mountPoint, "fileSystemRepresentation"), 0x4004681BuLL, &v8, 0))
    {
      PLBackendGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        volumeSize = self->_volumeSize;
        *(_DWORD *)buf = 136315650;
        v10 = v6;
        v11 = 2048;
        v12 = 524288000;
        v13 = 2048;
        v14 = volumeSize;
        _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED very low threshold %llu for volume_size: %llu", buf, 0x20u);
      }

      result = 524288000;
    }
    else
    {
      result = self->_blockSize * v8;
    }
    self->_veryLowDiskThreshold = result;
  }
  return result;
}

- (unint64_t)volumeSize
{
  return self->_volumeSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountPoint, 0);
}

@end
