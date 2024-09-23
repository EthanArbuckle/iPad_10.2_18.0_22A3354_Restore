@implementation SKDisk

- (SKDisk)init
{
  SKDisk *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  SKDiskPrivateCache *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;

  v11.receiver = self;
  v11.super_class = (Class)SKDisk;
  v2 = -[SKDisk init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)NSNumber);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v5 = objc_msgSend(v3, "initWithUnsignedLongLong:", objc_msgSend(v4, "nextDiskObjectID"));
    -[SKDisk setDiskObjectID:](v2, "setDiskObjectID:", v5);

    v6 = sub_10000BA9C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskObjectID](v2, "diskObjectID"));
      *(_DWORD *)buf = 136315394;
      v13 = "-[SKDisk(DaemonAdditions) init]";
      v14 = 2114;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Initializing new disk with ID %{public}@", buf, 0x16u);

    }
    v9 = objc_alloc_init(SKDiskPrivateCache);
    -[SKDisk setPrivateCache:](v2, "setPrivateCache:", v9);

  }
  return v2;
}

- (SKDisk)initWithDADisk:(id)a3
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
    if (!v4 || (-[SKDisk setDaDisk:](v5, "setDaDisk:", v4), !-[SKDisk _cacheInfo](v6, "_cacheInfo")))
    {
      v7 = 0;
      goto LABEL_7;
    }
    -[SKDisk setIsValid:](v6, "setIsValid:", 1);
  }
  v7 = v6;
LABEL_7:

  return v7;
}

- (BOOL)canUpdateDiskIdentifierWithDiskInfo:(id)a3
{
  return 0;
}

- (BOOL)_cacheInfo
{
  SKDisk *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk daDisk](v2, "daDisk"));
  v4 = -[SKDisk _cacheInfoForDADisk:](v2, "_cacheInfoForDADisk:", v3);

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)_cacheInfoForDADisk:(id)a3
{
  __DADisk *v4;
  CFDictionaryRef v5;
  unsigned __int8 v6;
  __DADisk *v7;
  __DADisk *v8;
  DADiskRef v9;
  void *v10;
  void *v11;
  void *v12;
  SKIOMedia *v13;
  NSObject *p_super;
  id v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v34;
  const char *v35;
  __int16 v36;
  void *v37;

  v4 = (__DADisk *)a3;
  v5 = DADiskCopyDescription(v4);
  if (!v5)
  {
    v15 = sub_10000BA9C();
    p_super = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v34 = 136315138;
      v35 = "-[SKDisk(DaemonAdditions) _cacheInfoForDADisk:]";
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%s: DADiskCopyDescription failed", (uint8_t *)&v34, 0xCu);
    }
    goto LABEL_28;
  }
  if (-[SKDisk _cacheInfoWithDiskDescription:](self, "_cacheInfoWithDiskDescription:", v5))
  {
    if (!-[SKDisk isIOMediaDisk](self, "isIOMediaDisk"))
    {
      p_super = 0;
LABEL_16:
      v17 = objc_opt_class(SKAPFSSnapshotDisk);
      if ((objc_opt_isKindOfClass(self, v17) & 1) != 0
        || -[SKDisk _cacheSpacesWithPurgeable:](self, "_cacheSpacesWithPurgeable:", 1))
      {
        if ((-[SKDisk isWholeDisk](self, "isWholeDisk") & 1) != 0)
        {
          -[SKDisk setCanPartitionDisk:](self, "setCanPartitionDisk:", -[SKDisk isVirtualDiskType](self, "isVirtualDiskType") ^ 1);
          if (-[SKDisk canPartitionDisk](self, "canPartitionDisk"))
            v18 = -[SKDisk isDiskImage](self, "isDiskImage") ^ 1;
          else
            v18 = 0;
          -[SKDisk setIsPhysicalDisk:](self, "setIsPhysicalDisk:", v18);
        }
        else
        {
          -[SKDisk setIsPhysicalDisk:](self, "setIsPhysicalDisk:", 1);
          -[SKDisk setCanPartitionDisk:](self, "setCanPartitionDisk:", 0);
        }
        if (-[SKDisk isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(SKDisk)))
        {
          if (-[SKDisk isWholeDisk](self, "isWholeDisk"))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk daDisk](self, "daDisk"));
            v25 = +[SKDisk copySortedChildrenWithDADisk:ioMedia:](SKDisk, "copySortedChildrenWithDADisk:ioMedia:", v24, p_super);
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
            objc_msgSend(v26, "setSortedChildren:", v25);

            v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sortedChildren"));
            -[SKDisk setChildCount:](self, "setChildCount:", objc_msgSend(v28, "count"));

          }
          else
          {
            -[SKDisk setChildCount:](self, "setChildCount:", 0);
          }
          -[SKDisk setSupportsJournaling:](self, "setSupportsJournaling:", 0);
          -[SKDisk setIsJournaled:](self, "setIsJournaled:", 0);
          -[SKDisk setSupportsVerify:](self, "setSupportsVerify:", 0);
          -[SKDisk setSupportsRepair:](self, "setSupportsRepair:", 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk _getFilesystem](self, "_getFilesystem"));
          -[SKDisk setFilesystem:](self, "setFilesystem:", v29);

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](self, "filesystem"));
          if (v30)
            -[SKDisk _cacheFilesystem](self, "_cacheFilesystem");
          else
            -[SKDisk _cacheNoFilesystem](self, "_cacheNoFilesystem");
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "wholeDADisk"));
          -[SKDisk _cacheCanSupportRecoveryPartitionWithWholeDisk:](self, "_cacheCanSupportRecoveryPartitionWithWholeDisk:", v32);

        }
        v16 = 1;
        goto LABEL_40;
      }
LABEL_28:
      v16 = 0;
LABEL_40:

      goto LABEL_41;
    }
    v6 = -[SKDisk isWholeDisk](self, "isWholeDisk");
    v7 = (__DADisk *)objc_claimAutoreleasedReturnValue(-[SKDisk daDisk](self, "daDisk"));
    v8 = v7;
    v9 = v7;
    if ((v6 & 1) == 0)
      v9 = DADiskCopyWholeDisk(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    objc_msgSend(v10, "setWholeDADisk:", v9);

    if ((v6 & 1) == 0)
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wholeDADisk"));

    if (v12)
    {
      v13 = -[SKIOMedia initWithDADisk:]([SKIOMedia alloc], "initWithDADisk:", v4);
      if (v13)
      {
        p_super = &v13->super.super;
        if (!-[SKDisk _cacheInfoWithIOMedia:](self, "_cacheInfoWithIOMedia:", v13))
          goto LABEL_28;
        goto LABEL_16;
      }
      v23 = sub_10000BA9C();
      v20 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
        v34 = 136315394;
        v35 = "-[SKDisk(DaemonAdditions) _cacheInfoForDADisk:]";
        v36 = 2114;
        v37 = v21;
        v22 = "%s: Failed to find IO media of %{public}@";
        goto LABEL_26;
      }
    }
    else
    {
      v19 = sub_10000BA9C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
        v34 = 136315394;
        v35 = "-[SKDisk(DaemonAdditions) _cacheInfoForDADisk:]";
        v36 = 2114;
        v37 = v21;
        v22 = "%s: Failed to find whole disk for %{public}@";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v34, 0x16u);

      }
    }

    p_super = 0;
    goto LABEL_28;
  }
  v16 = 0;
LABEL_41:

  return v16;
}

- (void)_cacheIsWholeDiskWithDiskDescription:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", kDADiskDescriptionMediaWholeKey));
  -[SKDisk setIsWholeDisk:](self, "setIsWholeDisk:", sub_10000FC18(v4));

}

- (id)volumeNameWithDiskDescription:(id)a3
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", kDADiskDescriptionVolumeNameKey);
}

- (id)liveDiskIdentifierWithDiskDescription:(id)a3
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", kDADiskDescriptionMediaBSDNameKey);
}

- (BOOL)_cacheInfoWithDiskDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  unsigned int v42;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk liveDiskIdentifierWithDiskDescription:](self, "liveDiskIdentifierWithDiskDescription:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  objc_msgSend(v6, "setLiveDiskIdentifier:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
  if (!v7 && !-[SKDisk isValid](self, "isValid")
    || (v8 = -[SKDisk canUpdateDiskIdentifierWithDiskInfo:](self, "canUpdateDiskIdentifierWithDiskInfo:", v4),
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "liveDiskIdentifier"));
    -[SKDisk setDiskIdentifier:](self, "setDiskIdentifier:", v10);

  }
  v11 = sub_10000BA9C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
    *(_DWORD *)buf = 136315650;
    v38 = "-[SKDisk(DaemonAdditions) _cacheInfoWithDiskDescription:]";
    v39 = 2114;
    v40 = v13;
    v41 = 1024;
    v42 = -[SKDisk isValid](self, "isValid");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Caching %{public}@, isValid=%d", buf, 0x1Cu);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));

  if (v14)
  {
    -[SKDisk _cacheIsWholeDiskWithDiskDescription:](self, "_cacheIsWholeDiskWithDiskDescription:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kDADiskDescriptionVolumePathKey));
    v36 = v15;
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
      -[SKDisk setMountPoint:](self, "setMountPoint:", v16);

    }
    else
    {
      -[SKDisk setMountPoint:](self, "setMountPoint:", 0);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));

    if (!v17)
      -[SKDisk setOwnerUID:](self, "setOwnerUID:", -[SKDisk _getOwnerUsingStat](self, "_getOwnerUsingStat"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk volumeNameWithDiskDescription:](self, "volumeNameWithDiskDescription:", v4));
    -[SKDisk setVolumeName:](self, "setVolumeName:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kDADiskDescriptionVolumeUUIDKey));
    if (v19)
    {
      v20 = (__CFString *)CFUUIDCreateString(0, (CFUUIDRef)v19);
      -[SKDisk setVolumeUUID:](self, "setVolumeUUID:", v20);

    }
    else
    {
      -[SKDisk setVolumeUUID:](self, "setVolumeUUID:", 0);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kDADiskDescriptionMediaSizeKey));
    -[SKDisk setUnformattedSize:](self, "setUnformattedSize:", sub_10000FC5C(v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kDADiskDescriptionDeviceInternalKey));
    -[SKDisk setIsInternal:](self, "setIsInternal:", sub_10000FC18(v22));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kDADiskDescriptionMediaRemovableKey));
    -[SKDisk setIsRemovable:](self, "setIsRemovable:", sub_10000FC18(v23));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kDADiskDescriptionMediaWritableKey));
    v25 = v24;
    if (v24)
      v26 = (uint64_t)sub_10000FC18(v24);
    else
      v26 = 1;
    -[SKDisk setIsMediaWritable:](self, "setIsMediaWritable:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kDADiskDescriptionDeviceProtocolKey));
    if (sub_10000FABC(v27))
      v28 = objc_msgSend(v27, "isEqual:", CFSTR("Virtual Interface"));
    else
      v28 = 0;
    -[SKDisk setIsDiskImage:](self, "setIsDiskImage:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kDADiskDescriptionVolumeKindKey));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    objc_msgSend(v30, "setVolumeKind:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kDADiskDescriptionVolumeTypeKey));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    objc_msgSend(v32, "setVolumeType:", v31);

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kDADiskDescriptionMediaContentKey));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    objc_msgSend(v34, "setRawIOContent:", v33);

  }
  return v14 != 0;
}

- (unsigned)_getOwnerUsingStat
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uid_t v10;
  stat v12;
  uint8_t buf[4];
  NSObject *v14;
  __int16 v15;
  uid_t st_uid;

  memset(&v12, 0, sizeof(v12));
  v3 = objc_claimAutoreleasedReturnValue(-[SKDisk _getIdentifierForStat](self, "_getIdentifierForStat"));
  if ((-[SKDisk isIOMediaDisk](self, "isIOMediaDisk") & 1) == 0)
  {
    v9 = sub_10000BA9C();
    v4 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ is not an IO media disk, assuming owner is root", buf, 0xCu);
    }
    goto LABEL_8;
  }
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/%@"), v3)));
  v5 = stat((const char *)-[NSObject UTF8String](v4, "UTF8String"), &v12);
  v6 = sub_10000BA9C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "stat failed on %@, assuming owner is root", buf, 0xCu);
    }

LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  if (v8)
  {
    *(_DWORD *)buf = 138412546;
    v14 = v4;
    v15 = 1024;
    st_uid = v12.st_uid;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "stat on %@, returned UID %d", buf, 0x12u);
  }

  v10 = v12.st_uid;
LABEL_9:

  return v10;
}

- (BOOL)_cacheInfoWithIOMedia:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _BOOL8 v9;
  id v10;
  NSObject *v11;
  void *v12;
  _UNKNOWN **v13;
  void *v14;
  _BYTE v16[12];
  __int16 v17;
  void *v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "copyProperties");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    v7 = objc_msgSend(v6, "copyHumanIOContentWithMediaDict:isWholeDisk:", v5, -[SKDisk isWholeDisk](self, "isWholeDisk"));
    -[SKDisk setIoContent:](self, "setIoContent:", v7);

    if ((-[SKDisk isValid](self, "isValid") & 1) == 0)
    {
      v8 = objc_msgSend(v4, "copyPropertyWithClass:key:", objc_opt_class(NSString), CFSTR("UUID"));
      -[SKDisk setMediaUUID:](self, "setMediaUUID:", v8);

    }
    v16[0] = 0;
    if (-[SKDisk isWholeDisk](self, "isWholeDisk", *(_QWORD *)v16))
    {
      -[SKDisk setStartLocation:](self, "setStartLocation:", 0);
      v9 = 0;
    }
    else
    {
      v13 = sub_100005ED8(v5, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      -[SKDisk setStartLocation:](self, "setStartLocation:", objc_msgSend(v14, "unsignedLongLongValue"));

      v9 = v16[0] != 0;
    }
    -[SKDisk setIsPartitionDisk:](self, "setIsPartitionDisk:", v9);
    v11 = objc_msgSend(v4, "copyParentPropertyWithClass:key:", objc_opt_class(NSNumber), CFSTR("OSInternal"));
    -[SKDisk setIsOSInternal:](self, "setIsOSInternal:", sub_10000FC18(v11));
  }
  else
  {
    v10 = sub_10000BA9C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
      *(_DWORD *)v16 = 136315394;
      *(_QWORD *)&v16[4] = "-[SKDisk(DaemonAdditions) _cacheInfoWithIOMedia:]";
      v17 = 2114;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Failed to get IO media properties for %{public}@", v16, 0x16u);

    }
  }

  return v5 != 0;
}

- (void)_cacheFilesystem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  _QWORD *v9;
  unsigned int v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned int v25;
  _QWORD *v26;
  SKDisk *v27;
  void *v28;
  id v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](self, "filesystem"));
  v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "majorType"));

  if (objc_msgSend(v29, "isEqualToString:", CFSTR("hfs")))
  {
    -[SKDisk setSupportsVerify:](self, "setSupportsVerify:", 1);
    -[SKDisk setSupportsRepair:](self, "setSupportsRepair:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](self, "filesystem"));
    -[SKDisk setSupportsJournaling:](self, "setSupportsJournaling:", objc_msgSend(v4, "supportsJournaling"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    -[SKDisk setIsJournaled:](self, "setIsJournaled:", ((unint64_t)objc_msgSend(v5, "mountFlags") >> 23) & 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](self, "filesystem"));
    -[SKDisk setIsCaseSensitive:](self, "setIsCaseSensitive:", objc_msgSend(v6, "isCaseSensitive"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Apple_Boot"));

    if ((v8 & 1) != 0)
    {
      -[SKDisk setRole:](self, "setRole:", kSKDiskRoleBooter);
      v9 = &kSKDiskTypeAppleBoot;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("/System/Library/CoreServices/Finder.app")));
        v18 = objc_msgSend(v15, "fileExistsAtPath:", v17);

        v19 = &kSKDiskRoleLegacyMacSystem;
        if (!v18)
          v19 = &kSKDiskRoleLegacyMacData;
        -[SKDisk setRole:](self, "setRole:", *v19);

      }
      else
      {
        -[SKDisk setRole:](self, "setRole:", kSKDiskRoleLegacyMacData);
      }
      v9 = &kSKDiskTypeHFS;
    }
    -[SKDisk setType:](self, "setType:", *v9);
    v13 = &kSKDiskFileSystemHFS;
    goto LABEL_23;
  }
  if (objc_msgSend(v29, "isEqualToString:", CFSTR("msdos")))
  {
    -[SKDisk setSupportsVerify:](self, "setSupportsVerify:", 1);
    -[SKDisk setSupportsRepair:](self, "setSupportsRepair:", 1);
    v10 = -[SKDisk isRealEFIPartition](self, "isRealEFIPartition");
    v11 = &kSKDiskRoleBooter;
    if (v10)
    {
      v12 = &kSKDiskTypeEFI;
    }
    else
    {
      v11 = &kSKDiskRoleWindowsData;
      v12 = &kSKDiskTypeFAT;
    }
    -[SKDisk setRole:](self, "setRole:", *v11);
    -[SKDisk setType:](self, "setType:", *v12);
    v13 = &kSKDiskFileSystemFAT;
    goto LABEL_23;
  }
  if (!objc_msgSend(v29, "isEqualToString:", CFSTR("exfat")))
  {
    if (objc_msgSend(v29, "isEqualToString:", CFSTR("ntfs")))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("/Windows/System32/ntdll.dll")));

      v22 = objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));
      if (v22)
      {
        v23 = (void *)v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v25 = objc_msgSend(v24, "fileExistsAtPath:", v21);

        v26 = &kSKDiskRoleWindowsSystem;
        if (!v25)
          v26 = &kSKDiskRoleWindowsData;
      }
      else
      {
        v26 = &kSKDiskRoleWindowsData;
      }
      -[SKDisk setRole:](self, "setRole:", *v26);
      -[SKDisk setType:](self, "setType:", kSKDiskTypeNTFS);
      v28 = (void *)kSKDiskFileSystemNTFS;
      v27 = self;
    }
    else
    {
      if (objc_msgSend(v29, "isEqualToString:", CFSTR("acfs")))
      {
        -[SKDisk setRole:](self, "setRole:", kSKDiskRoleXSanData);
        -[SKDisk setType:](self, "setType:", kSKDiskTypeXSanLV);
        v13 = &kSKDiskFileSystemACFS;
        goto LABEL_23;
      }
      -[SKDisk setRole:](self, "setRole:", kSKDiskRoleUnknown);
      -[SKDisk setType:](self, "setType:", kSKDiskType3rdPartyFilesystem);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("kSKDiskFileSystem_%@"), v29));
      v27 = self;
      v28 = v21;
    }
    -[SKDisk setFilesystemType:](v27, "setFilesystemType:", v28);

    goto LABEL_24;
  }
  -[SKDisk setSupportsVerify:](self, "setSupportsVerify:", 1);
  -[SKDisk setSupportsRepair:](self, "setSupportsRepair:", 1);
  -[SKDisk setRole:](self, "setRole:", kSKDiskRoleWindowsData);
  -[SKDisk setType:](self, "setType:", kSKDiskTypeExFAT);
  v13 = &kSKDiskFileSystemExFAT;
LABEL_23:
  -[SKDisk setFilesystemType:](self, "setFilesystemType:", *v13);
LABEL_24:

}

- (BOOL)isRealEFIPartition
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("EFI"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "wholeDADisk"));
    v7 = +[SKDisk copySortedChildrenWithDADisk:ioMedia:](SKDisk, "copySortedChildrenWithDADisk:ioMedia:", v6, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk daDisk](self, "daDisk"));
    v9 = objc_msgSend(v7, "indexOfObject:", v8);

    if (v9)
      v10 = v9 == (id)0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = 1;
    LOBYTE(v4) = v10;
    if (v9 && v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = sub_10000BA9C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
        v15 = 136315650;
        v16 = "-[SKDisk(DaemonAdditions) isRealEFIPartition]";
        v17 = 2114;
        v18 = v13;
        v19 = 1024;
        v20 = (int)v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ is an EFI partition in the middle of the disk (child #%d), treating as a regular FAT", (uint8_t *)&v15, 0x1Cu);

      }
    }

  }
  return v4;
}

- (void)_cacheNoFilesystem
{
  unsigned int v3;
  void *v4;
  unsigned int v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;

  v3 = -[SKDisk isWholeDisk](self, "isWholeDisk");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  v5 = objc_msgSend(v4, "schemeID");
  if (v3)
  {

    v6 = &kSKDiskTypeAPMWholeDisk;
    v7 = &kSKDiskTypeMBRWholeDisk;
    v8 = &kSKDiskTypeUninitalized;
    if (v5 == 16)
      v8 = &kSKDiskTypeGPTWholeDisk;
    if (v5 != 8)
      v7 = v8;
    if (v5 != 1)
      v6 = v7;
    -[SKDisk setType:](self, "setType:", *v6);
    v9 = &kSKDiskRolePhysicalDisk;
    goto LABEL_9;
  }

  if (v5 == 512
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent")), v10, !v10))
  {
    v14 = &kSKDiskRoleNoRole;
LABEL_15:
    -[SKDisk setRole:](self, "setRole:", *v14);
    v15 = &kSKDiskTypeUninitalized;
LABEL_16:
    -[SKDisk setType:](self, "setType:", *v15);
    goto LABEL_17;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Apple_Boot"));

  if (v12)
  {
    -[SKDisk setRole:](self, "setRole:", kSKDiskRoleBooter);
    v13 = &kSKDiskTypeAppleBoot;
LABEL_25:
    -[SKDisk setType:](self, "setType:", *v13);
    v16 = &kSKDiskFileSystemHFS;
    goto LABEL_18;
  }
  if (-[SKDisk isRealEFIPartition](self, "isRealEFIPartition"))
  {
    -[SKDisk setRole:](self, "setRole:", kSKDiskRoleBooter);
    -[SKDisk setType:](self, "setType:", kSKDiskTypeEFI);
    v16 = &kSKDiskFileSystemFAT;
    goto LABEL_18;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("Apple_HFS")))
  {

LABEL_24:
    -[SKDisk setRole:](self, "setRole:", kSKDiskRoleMacData);
    v13 = &kSKDiskTypeHFS;
    goto LABEL_25;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Apple_RAID"));

  if (v19)
    goto LABEL_24;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("Apple_APFS"));

  if (v21)
  {
    v22 = -[SKDisk isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(SKAPFSStoreDisk));
    -[SKDisk setRole:](self, "setRole:", kSKDiskRoleStorageImplementation);
    if (v22)
      v15 = &kSKDiskTypeAPFSPS;
    else
      v15 = &kSKDiskTypeDamaged;
    goto LABEL_16;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Apple_RAID_Offline"));

  if (v24)
  {
    v14 = &kSKDiskRoleStorageImplementation;
    goto LABEL_15;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("Apple_KernelCoreDump")))
  {

LABEL_35:
    -[SKDisk setRole:](self, "setRole:", kSKDiskRoleStorageImplementation);
    v13 = &kSKDiskTypeAppleCoreDump;
    goto LABEL_25;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("Apple_SadMac"));

  if (v27)
    goto LABEL_35;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "rawIOContent"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
  v31 = objc_msgSend(v29, "isEqualToString:", v30);

  if ((v31 & 1) != 0)
  {
    v32 = kSKDiskTypeOtherUnrecognized;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "rawIOContent"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v32, v34));
    -[SKDisk setType:](self, "setType:", v35);

  }
  else
  {
    v36 = kSKDiskTypeOtherRecognizable;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v36, v33));
    -[SKDisk setType:](self, "setType:", v34);
  }

  v9 = &kSKDiskRoleNoRole;
LABEL_9:
  -[SKDisk setRole:](self, "setRole:", *v9);
LABEL_17:
  v16 = &kSKDiskFileSystemUndefined;
LABEL_18:
  -[SKDisk setFilesystemType:](self, "setFilesystemType:", *v16);
}

- (id)_getFilesystem
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "volumeKind"));

  if (!sub_10000FABC(v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rawIOContent"));
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("41504653-0000-11AA-AA11-00306543ECAC"));

    if ((v7 & 1) != 0)
    {
      v8 = CFSTR("apfs");
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Apple_APFS"));

      if ((v19 & 1) != 0)
        goto LABEL_12;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("Apple_HFS"));

      if ((v23 & 1) != 0)
      {
        v8 = CFSTR("hfs");
      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("MS-DOS"));

        if (!v25)
          goto LABEL_5;
        v8 = CFSTR("msdos");
      }
    }

    v4 = (__CFString *)v8;
  }
LABEL_5:
  if (!sub_10000FABC(v4)
    || (v9 = objc_claimAutoreleasedReturnValue(-[SKDisk filesystemWithType:](self, "filesystemWithType:", v4))) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
    v12 = sub_10000FABC(v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("EFI"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
      v16 = v15;
      if (v14)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_filesystemForDMFilesystemType:isEncrypted:", CFSTR("MS-DOS FAT32"), 0));
        v17 = v16;
LABEL_15:

        goto LABEL_16;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_filesystemForIOContent:", v20));

      if (v17)
      {
        v17 = v17;
        v10 = v17;
        goto LABEL_15;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "rawIOContent"));
      v29 = objc_msgSend(v26, "isEqual:", v28);

      if ((v29 & 1) == 0)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "rawIOContent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_filesystemForIOContent:", v32));

        if (!v10)
          goto LABEL_16;
        goto LABEL_15;
      }
    }
LABEL_12:
    v10 = 0;
    goto LABEL_16;
  }
  v10 = (void *)v9;
LABEL_16:

  return v10;
}

- (id)filesystemWithType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("apfs")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("hfs")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("msdos")) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", CFSTR("cd9660")))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zfs")) & 1) != 0)
    {
      v9 = 0;
      v10 = CFSTR("ZFS");
      goto LABEL_8;
    }
    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "volumeType"));
  v7 = sub_10000FABC(v6);

  if (!v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self, "mountPoint"));
    sub_10000FABC(v13);

    goto LABEL_10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "volumeType"));

  if (!v9)
  {
LABEL_10:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_firstFilesystemForMajorType:", v4));
    goto LABEL_11;
  }
  v10 = 0;
LABEL_8:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_filesystemForUnlocalizedName:dmPersonality:", v9, v10));

LABEL_11:
  return v12;
}

- (BOOL)_cacheSpacesWithPurgeable:(BOOL)a3
{
  _BOOL4 v3;
  SKDisk *v4;
  void *v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t f_flags;
  void *v16;
  uint64_t v18;
  void *v19;
  statfs v20;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  bzero(&v20, 0x878uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](v4, "mountPoint"));
  if (v5
    && (v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](v4, "mountPoint"))),
        v7 = statfs((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v20) == 0,
        v6,
        v5,
        v7))
  {
    -[SKDisk setIsWritable:](v4, "setIsWritable:", (v20.f_flags & 1) == 0);
    -[SKDisk setTotalSpace:](v4, "setTotalSpace:", v20.f_blocks * v20.f_bsize);
    -[SKDisk setFreeSpace:](v4, "setFreeSpace:", v20.f_bavail * v20.f_bsize);
    f_flags = v20.f_flags;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](v4, "privateCache"));
    objc_msgSend(v16, "setMountFlags:", f_flags);

    -[SKDisk setOwnerUID:](v4, "setOwnerUID:", v20.f_owner);
    if ((-[SKDisk isIOMediaDisk](v4, "isIOMediaDisk") & 1) == 0)
      -[SKDisk setUnformattedSize:](v4, "setUnformattedSize:", -[SKDisk totalSpace](v4, "totalSpace"));
  }
  else
  {
    -[SKDisk setIsWritable:](v4, "setIsWritable:", 0);
    -[SKDisk setTotalSpace:](v4, "setTotalSpace:", -[SKDisk unformattedSize](v4, "unformattedSize"));
    -[SKDisk setFreeSpace:](v4, "setFreeSpace:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](v4, "privateCache"));
    objc_msgSend(v8, "setMountFlags:", 0);

  }
  if (v3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](v4, "mountPoint"));

    v10 = 0;
    if (v9 && &_CacheDeleteCopyPurgeableSpaceWithInfo)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](v4, "mountPoint", CFSTR("CACHE_DELETE_VOLUME")));
      v19 = v11;
      v12 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT")));
        v14 = v13;
        if (v13)
          v10 = objc_msgSend(v13, "unsignedLongLongValue");
        else
          v10 = 0;

      }
      else
      {
        v10 = 0;
      }

    }
    -[SKDisk setPurgeableSpace:](v4, "setPurgeableSpace:", v10);
  }
  -[SKDisk setAvailableSpace:](v4, "setAvailableSpace:", (char *)-[SKDisk freeSpace](v4, "freeSpace") + (_QWORD)-[SKDisk purgeableSpace](v4, "purgeableSpace"));
  objc_sync_exit(v4);

  return 1;
}

+ (id)copySortedChildrenWithDADisk:(id)a3 ioMedia:(id)a4
{
  __DADisk *v6;
  SKIOMedia *v7;
  const char *BSDName;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  __DADisk *v26;

  v6 = (__DADisk *)a3;
  v7 = (SKIOMedia *)a4;
  if (v6)
  {
    BSDName = DADiskGetBSDName(v6);
    if (BSDName)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", BSDName));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
      v11 = objc_msgSend(v10, "copyExtendedDiskInfoWithDiskIdentifier:", v9);

      if (v11
        && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kSKSortedChildren"))),
            v12,
            v12))
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kSKSortedChildren")));
      }
      else
      {
        if (!v7)
          v7 = -[SKIOMedia initWithDADisk:]([SKIOMedia alloc], "initWithDADisk:", v6);
        v13 = objc_msgSend(a1, "newSortedChildrenWithIOMedia:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
        v20 = v13;
        v21 = v9;
        v19 = CFSTR("kSKSortedChildren");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
        v22 = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
        objc_msgSend(v14, "_addToExtendedDiskInfoCacheWithDictionary:", v16);

      }
    }
    else
    {
      v17 = sub_10000BA9C();
      v9 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "+[SKDisk(DaemonAdditions) copySortedChildrenWithDADisk:ioMedia:]";
        v25 = 2112;
        v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Invalid DADiskRef %@", buf, 0x16u);
      }
      v13 = &__NSArray0__struct;
    }

  }
  else
  {
    v13 = &__NSArray0__struct;
  }

  return v13;
}

+ (id)newSortedChildrenWithIOMedia:(id)a3
{
  id v3;
  _UNKNOWN **v4;
  id v5;
  void *v6;
  id v7;
  char **v8;
  SKIOMedia *v9;
  __int128 v10;
  SKIOMedia *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _UNKNOWN **v15;
  void *v16;
  _UNKNOWN **v17;
  void *v18;
  id v19;
  id v20;
  SKIOMedia *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  __int128 v31;
  id v32;
  __DASession *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _QWORD v46[2];

  v3 = a3;
  if (v3)
  {
    v4 = &APFSCancelContainerResize_ptr;
    v5 = objc_msgSend(v3, "copyPropertyWithClass:key:", objc_opt_class(NSNumber), CFSTR("BSD Unit"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    v33 = (__DASession *)objc_msgSend(v6, "diskArbSession");

    v32 = v3;
    v7 = objc_msgSend(v3, "newIteratorWithOptions:", 1);
    v8 = &selRef_sendStderr_;
    v9 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v7);
    if (v9)
    {
      v11 = v9;
      *(_QWORD *)&v10 = 136315394;
      v31 = v10;
      do
      {
        if (objc_msgSend(v7, "invalidated", v31))
          objc_msgSend(v34, "removeAllObjects");
        if (IOObjectConformsTo(-[SKIOObject ioObj](v11, "ioObj"), "IOMedia"))
        {
          v12 = -[SKIOObject copyPropertyWithClass:key:](v11, "copyPropertyWithClass:key:", objc_opt_class(v4[103]), CFSTR("BSD Unit"));
          if (objc_msgSend(v12, "isEqual:", v5))
          {
            v13 = DADiskCreateFromIOMedia(kCFAllocatorDefault, v33, -[SKIOObject ioObj](v11, "ioObj"));
            if (v13)
            {
              v14 = -[SKIOObject copyProperties](v11, "copyProperties");
              v46[0] = v13;
              v15 = sub_100005ED8(v14, 0);
              v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
              v46[1] = v16;
              v17 = v4;
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2));
              objc_msgSend(v34, "addObject:", v18);

              v4 = v17;
              v8 = &selRef_sendStderr_;

            }
            else
            {
              v20 = sub_10000BA9C();
              v14 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v31;
                v41 = "+[SKDisk(DaemonAdditions) newSortedChildrenWithIOMedia:]";
                v42 = 2114;
                v43 = v12;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to create DADisk for child disk %{public}@", buf, 0x16u);
              }
            }

          }
          else
          {
            v19 = sub_10000BA9C();
            v13 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v41 = "+[SKDisk(DaemonAdditions) newSortedChildrenWithIOMedia:]";
              v42 = 2114;
              v43 = v12;
              v44 = 2114;
              v45 = v5;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Found IO media with BSD unit %{public}@ as a child of disk with BSD unit %{public}@, ignoring", buf, 0x20u);
            }
          }

          IORegistryIteratorExitEntry((io_iterator_t)objc_msgSend(v7, "ioObj"));
        }
        v21 = (SKIOMedia *)objc_msgSend(objc_alloc((Class)(v8 + 402)), "initWithIteratorNext:", v7);

        v11 = v21;
      }
      while (v21);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sortedArrayUsingComparator:", &stru_100044C18));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "objectAtIndexedSubscript:", 0));
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v26);
    }

    v3 = v32;
  }
  else
  {
    v23 = &__NSArray0__struct;
  }

  return v23;
}

- (BOOL)_supportsRecaching
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)reProbeWithError:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v9[0] = kSKDiskMountOptionRecursive;
  v5 = &__kCFBooleanFalse;
  if (-[SKDisk isWholeDisk](self, "isWholeDisk")
    && !-[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk"))
  {
    v5 = &__kCFBooleanTrue;
  }
  v9[1] = kSKDiskMountOptionToolOptions;
  v10[0] = v5;
  v10[1] = &off_100047E80;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  v7 = +[SKMountOperation mountWithDisk:options:error:](SKMountOperation, "mountWithDisk:options:error:", self, v6, a3);

  return v7;
}

- (SKMountState)previousMount
{
  return (SKMountState *)objc_getAssociatedObject(self, "previousMount");
}

- (void)setPreviousMount:(id)a3
{
  objc_setAssociatedObject(self, "previousMount", a3, (void *)1);
}

@end
