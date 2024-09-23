@implementation PLDiskController

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobileslideshow-diskSpaceDidBecomeLow"), 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PLDiskController;
  -[PLDiskController dealloc](&v5, sel_dealloc);
}

- (PLDiskController)init
{
  PLDiskController *v2;
  BOOL v3;
  int v4;
  int v5;
  int v6;
  int v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  Boolean keyExistsAndHasValidFormat;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLDiskController;
  v2 = -[PLDiskController init](&v11, sel_init);
  if (v2)
  {
    v2->_lastFSCheck = CFAbsoluteTimeGetCurrent() + -2.0;
    v2->_bytesRequiredForPhoto = objc_msgSend(MEMORY[0x1E0C8B0E8], "maxLivePhotoDataSize");
    if (MGGetBoolAnswer())
      v2->_bytesRequiredForPhoto *= 4;
    keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(CFSTR("DiskSpaceWasLow"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat))
    {
      v3 = 1;
    }
    else
    {
      v3 = keyExistsAndHasValidFormat == 0;
    }
    v4 = v3;
    if (v3)
      v5 = 2;
    else
      v5 = 0;
    v2->_flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&v2->_flags & 0xFFFFFFFC | v4 | v5);
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
    v6 = (PLIsReallyAssetsd_isAssetsd != 0) | __PLIsAssetsdProxyService & 1;
    if ((PLIsReallyAssetsd_isAssetsd != 0) | __PLIsAssetsdProxyService & 1)
      v7 = 4;
    else
      v7 = 0;
    v2->_flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&v2->_flags & 0xFFFFFFFB | v7);
    if (!v6)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)DiskSpaceDidBecomeLow, CFSTR("com.apple.mobileslideshow-diskSpaceDidBecomeLow"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return v2;
}

- (void)_diskSpaceDidBecomeLow
{
  $C32D55F661429721DB3F1451F78C0B31 flags;
  id v3;

  flags = self->_flags;
  self->_flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&flags | 1);
  if ((*(_BYTE *)&flags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("PLDiskSpaceDidBecomeLowNotification"), 0);

  }
}

- (void)_actuallyUpdateCookie
{
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if ((*(_DWORD *)&self->_flags & 1) == 0)
    v3 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(CFSTR("DiskSpaceWasLow"), *v3, CFSTR("com.apple.mobileslideshow"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  if ((~*(_DWORD *)&self->_flags & 5) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow-diskSpaceDidBecomeLow"), 0, 0, 1u);
  }
}

- (void)_updateCookie
{
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    -[PLDiskController _actuallyUpdateCookie](self, "_actuallyUpdateCookie");
  else
    -[PLDiskController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__actuallyUpdateCookie, 0, 0);
}

- (void)updateAvailableDiskSpace
{
  $C32D55F661429721DB3F1451F78C0B31 flags;
  CFAbsoluteTime Current;
  void *v5;
  void *v6;
  int64_t v7;
  BOOL v8;
  $C32D55F661429721DB3F1451F78C0B31 v9;
  $C32D55F661429721DB3F1451F78C0B31 v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v12;

  flags = self->_flags;
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastFSCheck >= 2.0)
  {
    self->_lastFSCheck = Current;
    *(_DWORD *)&self->_flags &= ~2u;
    v5 = (void *)objc_opt_class();
    NSHomeDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "diskSpaceAvailableForPath:", v6);

    v8 = v7 < self->_bytesRequiredForPhoto;
    v9 = self->_flags;
    self->_flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&v9 & 0xFFFFFFFD | (2 * v8));
    if (v8)
    {
      NSLog((NSString *)CFSTR("*** Not enough space to take a picture. Available space is %lld"), v7);
      v10 = self->_flags;
      if ((*(_BYTE *)&flags & 2) != 0)
      {
        if ((*(_BYTE *)&v10 & 4) != 0)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow-diskSpaceDidBecomeLow"), 0, 0, 1u);
        }
      }
      else
      {
        self->_flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&v10 | 1);
        -[PLDiskController _updateCookie](self, "_updateCookie");
        if ((*(_BYTE *)&self->_flags & 4) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "postNotificationName:object:", CFSTR("PLDiskSpaceDidBecomeLowNotification"), 0);

        }
      }
    }
    else if ((*(_BYTE *)&v9 & 1) != 0)
    {
      self->_flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&v9 & 0xFFFFFFFC | (2 * v8));
      -[PLDiskController _updateCookie](self, "_updateCookie");
    }
  }
}

- (BOOL)hasEnoughDiskToTakePicture
{
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return 1;
  -[PLDiskController updateAvailableDiskSpace](self, "updateAvailableDiskSpace");
  return (*(_BYTE *)&self->_flags & 2) == 0;
}

- (int64_t)bytesToAutomaticallyClear
{
  return 5 * self->_bytesRequiredForPhoto;
}

+ (id)sharedInstance
{
  pl_dispatch_once(&sharedInstance_pl_once_token_17, &__block_literal_global_10667);
  return (id)sharedInstance_pl_once_object_17;
}

+ (int64_t)freeDiskSpaceThreshold
{
  void *v2;
  void *v3;

  if ((freeDiskSpaceThreshold_didSetFreeDiskSpaceThreshold & 1) == 0)
  {
    v2 = (void *)MGCopyAnswer();
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DE2CA8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    freeDiskSpaceThreshold_freeDiskSpaceThreshold = objc_msgSend(v3, "longLongValue");

    freeDiskSpaceThreshold_didSetFreeDiskSpaceThreshold = 1;
  }
  return freeDiskSpaceThreshold_freeDiskSpaceThreshold;
}

+ (int64_t)diskSpaceAvailableForUse
{
  void *v3;
  int64_t v4;

  NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "diskSpaceAvailableForPath:", v3);

  return v4;
}

+ (int64_t)diskSpaceAvailableForPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v5, "attributesOfFileSystemForPath:error:", v4, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;

    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB2B00]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedLongLongValue");

      v10 = objc_msgSend(a1, "freeDiskSpaceThreshold");
      if (v9 <= v10)
        v11 = 0;
      else
        v11 = v9 - v10;
    }
    else
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v4;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_ERROR, "Unable to get file system attributes for %@: %@", buf, 0x16u);
      }

      v11 = -1;
    }

  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Missing path to get free space", buf, 2u);
    }
    v11 = -1;
  }

  return v11;
}

+ (int64_t)fileSystemSizeForPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int64_t v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mountPointForPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "attributesOfFileSystemForPath:error:", v3, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;

    if (v5)
    {
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB2B10]);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject unsignedLongLongValue](v7, "unsignedLongLongValue");
    }
    else
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v12 = v3;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Unable to get file system attributes for %@: %@", buf, 0x16u);
      }
      v8 = -1;
    }

  }
  else
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Missing path to get free space", buf, 2u);
    }
    v8 = -1;
  }

  return v8;
}

+ (id)mountPointForPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  statfs v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27.f_bsize) = 0;
      v15 = "nil path for mountPoint";
      v16 = v14;
      v17 = 2;
LABEL_11:
      _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v27, v17);
    }
LABEL_12:

    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("/")) & 1) == 0)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v27.f_bsize = 138412290;
      *(_QWORD *)&v27.f_iosize = v5;
      v15 = "Path %@ must be an absolute path, retuning nil for mount point";
      v16 = v14;
      v17 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  memset(&v27, 0, 512);
  v6 = objc_retainAutorelease(v5);
  if (!statfs((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v27))
  {
    if (v27.f_mntonname[0])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27.f_mntonname);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v8 = *MEMORY[0x1E0C99D08];
  v23 = 0;
  v9 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v24, v8, &v23);
  v10 = v24;
  v11 = v23;
  v12 = v11;
  if (!v9 || v11)
  {
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    while ((objc_msgSend(v18, "isEqualToString:", &stru_1E376D3F8) & 1) == 0)
    {
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("/Volumes")))
      {
        PLBackendGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v6;
          _os_log_impl(&dword_199DF7000, v20, OS_LOG_TYPE_ERROR, "Searched up to '/Volumes', cannot find mount point for '%@', returning nil for mount point", buf, 0xCu);
        }

        break;
      }
      objc_msgSend(a1, "mountPointForPath:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v13 = (void *)v19;
        goto LABEL_25;
      }
    }
    v13 = 0;
LABEL_25:

  }
  else
  {
    objc_msgSend(v10, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_27:
  PLBackendGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v27.f_bsize = 138412546;
    *(_QWORD *)&v27.f_iosize = v5;
    WORD2(v27.f_blocks) = 2112;
    *(uint64_t *)((char *)&v27.f_blocks + 6) = (uint64_t)v13;
    _os_log_impl(&dword_199DF7000, v21, OS_LOG_TYPE_DEFAULT, "Mount point for %@: %@", (uint8_t *)&v27, 0x16u);
  }

  return v13;
}

+ (BOOL)freeSpaceBelowDesiredSpaceThresholdForPath:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  PLVolumeInfo *v11;
  PLVolumeInfo *v12;
  _QWORD block[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PLDiskController_freeSpaceBelowDesiredSpaceThresholdForPath___block_invoke;
  block[3] = &unk_1E376CAD8;
  block[4] = &v14;
  if (freeSpaceBelowDesiredSpaceThresholdForPath__onceToken != -1)
    dispatch_once(&freeSpaceBelowDesiredSpaceThresholdForPath__onceToken, block);
  if (*((_BYTE *)v15 + 24))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(a1, "mountPointForPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)freeSpaceBelowDesiredSpaceThresholdForPath__mountPointToThreshold, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (v11 = -[PLVolumeInfo initWithMountPoint:]([PLVolumeInfo alloc], "initWithMountPoint:", v6),
            (v12 = v11) != 0)
        && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLVolumeInfo desiredDiskThreshold](v11, "desiredDiskThreshold")), v7 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend((id)freeSpaceBelowDesiredSpaceThresholdForPath__mountPointToThreshold, "setObject:forKeyedSubscript:", v7, v6), v12, v7))
      {
        v8 = objc_msgSend(a1, "diskSpaceAvailableForPath:", v4);
        v9 = v8 < objc_msgSend(v7, "longLongValue");
        *((_BYTE *)v15 + 24) = v9;

      }
    }

    v5 = *((_BYTE *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __63__PLDiskController_freeSpaceBelowDesiredSpaceThresholdForPath___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFPreferencesGetAppBooleanValue(CFSTR("PLForceLowDiskSpace"), CFSTR("com.apple.mobileslideshow"), 0) != 0;
  v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = (void *)freeSpaceBelowDesiredSpaceThresholdForPath__mountPointToThreshold;
  freeSpaceBelowDesiredSpaceThresholdForPath__mountPointToThreshold = (uint64_t)v1;

}

void __34__PLDiskController_sharedInstance__block_invoke()
{
  PLDiskController *v0;
  void *v1;

  v0 = objc_alloc_init(PLDiskController);
  v1 = (void *)sharedInstance_pl_once_object_17;
  sharedInstance_pl_once_object_17 = (uint64_t)v0;

}

@end
