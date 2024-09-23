@implementation MSDDemoVolumeManager

+ (id)sharedInstance
{
  if (qword_10000C748 != -1)
    dispatch_once(&qword_10000C748, &stru_100008390);
  return (id)qword_10000C740;
}

- (NSString)userHomePath
{
  return NSHomeDirectoryForUser(CFSTR("mobile"));
}

- (void)mountDemoVolume
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[3];
  _QWORD v14[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  objc_msgSend(v3, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Mounting demo volume with name '%@' at '%@'..."), CFSTR("com.apple.mobilestoredemo.storage"), CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoVolumeManager lookupAPFSVolumeDevByName:](self, "lookupAPFSVolumeDevByName:", CFSTR("com.apple.mobilestoredemo.storage")));
  if (!v4)
  {
    v7 = 0;
    goto LABEL_8;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[MSDDemoVolumeManager findAPFSVolumeMountPoint:](self, "findAPFSVolumeMountPoint:", v4));
  if (v5)
  {
    v6 = (__CFString *)v5;
    v7 = 0;
  }
  else
  {
    v13[0] = NSFileOwnerAccountName;
    v13[1] = NSFileGroupOwnerAccountName;
    v14[0] = CFSTR("mobile");
    v14[1] = CFSTR("mobile");
    v13[2] = NSFilePosixPermissions;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 448));
    v14[2] = v8;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));

    v6 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage");
    if (!-[MSDDemoVolumeManager mountAPFSVolume:atMountPoint:withAttributes:](self, "mountAPFSVolume:atMountPoint:withAttributes:", v4, CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), v7))goto LABEL_8;
  }
  v9 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  v11 = v10;
  if ((v9 & 1) != 0)
    objc_msgSend(v10, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Demo volume successfully mounted!"), v12);
  else
    objc_msgSend(v10, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Demo volume incorrectly mounted at %@"), v6);

LABEL_8:
}

- (void)moveDataFromShelterToFinal
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  id v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = 0;
  if (!objc_msgSend(v3, "fileExistsAtPath:isDirectory:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"), &v11))goto LABEL_7;
  v4 = v11;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Moving files from data shelter folder..."));

    -[MSDDemoVolumeManager moveStagingToFinal:](self, "moveStagingToFinal:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"));
  }
  else
  {
    objc_msgSend(v5, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%@ is not a folder."), CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"));

  }
  if (objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter")))
  {
    v10 = 0;
    v7 = objc_msgSend(v3, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"), &v10);
    v8 = v10;
    if ((v7 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      objc_msgSend(v9, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Failed to remove data shelter folder with error - %@"), v8);

    }
  }
  else
  {
LABEL_7:
    v8 = 0;
  }

}

- (id)lookupAPFSVolumeDevByName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const __CFDictionary *v6;
  uint64_t MatchingServices;
  io_object_t v8;
  io_registry_entry_t v9;
  void *v10;
  const void *Value;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;
  io_name_t name;

  v3 = a3;
  v4 = v3;
  existing = 0;
  memset(name, 0, sizeof(name));
  properties = 0;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    v6 = IOServiceNameMatching((const char *)objc_msgSend(v5, "UTF8String"));
    MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v6, &existing);
    if (!(_DWORD)MatchingServices)
    {
      v8 = IOIteratorNext(existing);
      if (v8)
      {
        v9 = v8;
        do
        {
          if (IOObjectConformsTo(v9, "AppleAPFSVolume"))
          {
            memset(name, 0, sizeof(name));
            if (IORegistryEntryGetName(v9, name)
              || IORegistryEntryCreateCFProperties(v9, &properties, kCFAllocatorDefault, 0))
            {
              goto LABEL_26;
            }
            if (!strncmp((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), name, 0x80uLL))
            {
              Value = CFDictionaryGetValue(properties, CFSTR("BSD Name"));
              v12 = objc_claimAutoreleasedReturnValue(Value);
              if (!v12)
                goto LABEL_26;
              v13 = (void *)v12;
              v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/%@"), v12));

            }
            else
            {
              v10 = 0;
            }
            CFRelease(properties);
          }
          else
          {
            v10 = 0;
          }
          IOObjectRelease(v9);
          v9 = IOIteratorNext(existing);
          if (v9)
            v14 = v10 == 0;
          else
            v14 = 0;
        }
        while (v14);
        IOObjectRelease(existing);
        if (v10)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
          objc_msgSend(v15, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("APFS volume '%@' found as '%@'."), v5, v10);
LABEL_22:

          goto LABEL_23;
        }
      }
      else
      {
        IOObjectRelease(existing);
        v10 = 0;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      objc_msgSend(v15, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("APFS volume '%@' NOT found."), v5, v19);
      goto LABEL_22;
    }
    v17 = MatchingServices;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v18, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Failed to scan IO Registry with error - %d"), v17);

  }
  v9 = 0;
LABEL_26:
  if (existing)
    IOObjectRelease(existing);
  if (v9)
    IOObjectRelease(v9);
  if (properties)
    CFRelease(properties);
  v10 = 0;
LABEL_23:

  return v10;
}

- (id)findAPFSVolumeMountPoint:(id)a3
{
  id v3;
  int v4;
  statfs *v5;
  unint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  int *v15;
  stat v16;
  statfs *v17;

  v3 = a3;
  v17 = 0;
  if (!v3)
    goto LABEL_16;
  v4 = getmntinfo_r_np(&v17, 2);
  if (v4 < 1 || (v5 = v17) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    v15 = __error();
    objc_msgSend(v14, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Failed to get mounted filesystem info with error - %s"), strerror(*v15));

LABEL_16:
    v9 = 0;
    goto LABEL_14;
  }
  v6 = 0;
  v7 = 2168 * v4;
  while (1)
  {
    if (!strncmp("apfs", v5[v6 / 0x878].f_fstypename, 0xFuLL))
    {
      v8 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      v5 = v17;
      if (!strncmp(v8, v17[v6 / 0x878].f_mntfromname, 0xFuLL))
        break;
    }
    v6 += 2168;
    if (v7 == v6)
    {
      v9 = 0;
      goto LABEL_13;
    }
  }
  memset(&v16, 0, sizeof(v16));
  v10 = stat(v5[v6 / 0x878].f_mntonname, &v16);
  if ((_DWORD)v10)
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v12, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Mount point corrupted with error - %d"), v11);

    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17[v6 / 0x878].f_mntonname));
  }
  v5 = v17;
LABEL_13:
  free(v5);
LABEL_14:

  return v9;
}

- (BOOL)mountAPFSVolume:(id)a3 atMountPoint:(id)a4 withAttributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  void *v20;
  void *v21;
  uint64_t v22;
  int *v23;
  id v24;
  id v25;
  stat v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[20];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = 0;
  v11 = 0;
  v46 = 0u;
  *(_OWORD *)v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  memset(&v26, 0, sizeof(v26));
  v12 = 0;
  if (v7 && v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v25 = 0;
    v13 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v25);
    v12 = v25;
    if ((v13 & 1) != 0)
    {
      v14 = objc_retainAutorelease(v8);
      v15 = stat((const char *)objc_msgSend(v14, "UTF8String"), &v26);
      if ((_DWORD)v15)
      {
        v22 = v15;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
        objc_msgSend(v20, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Failed to get file stat with error - %d"), v22);
      }
      else
      {
        v27 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
        WORD4(v28) = 1;
        *(_QWORD *)&v47[12] = *(_QWORD *)&v26.st_uid;
        LODWORD(v28) = 0x100000;
        v16 = objc_retainAutorelease(v14);
        if (mount("apfs", (const char *)objc_msgSend(v16, "UTF8String"), 0x100000, &v27))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
          v23 = __error();
          objc_msgSend(v20, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Failed to mount APFS volume with error - %s"), strerror(*v23));
        }
        else
        {
          if (!v9)
          {
            v11 = 1;
            goto LABEL_10;
          }
          v24 = v12;
          v17 = objc_msgSend(v10, "setAttributes:ofItemAtPath:error:", v9, v16, &v24);
          v18 = v24;

          if ((v17 & 1) != 0)
          {
            v11 = 1;
            v12 = v18;
            goto LABEL_10;
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
          objc_msgSend(v20, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Failed to set file attributes on mount point - %@"), v18);
          v12 = v18;
        }
      }
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
      objc_msgSend(v20, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Failed to create mount point at '%@' -  %@"), v8, v21);

    }
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (BOOL)moveStagingToFinal:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v27 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/private/var/demo_backup/backup")))
  {
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enumeratorAtPath:", v27));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v5)
    {
      v6 = v5;
      v24 = 0;
      v25 = v4;
      v7 = *(_QWORD *)v31;
      v26 = v3;
      v23 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v10 = objc_autoreleasePoolPush();
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingPathComponent:", v9));
          if (objc_msgSend(v3, "fileExistsAtPath:", v11))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/demo_backup/backup"), "stringByAppendingPathComponent:", v9));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByDeletingLastPathComponent"));
            if ((objc_msgSend(v3, "fileExistsAtPath:", v12) & 1) == 0
              && objc_msgSend(v3, "fileExistsAtPath:", v13))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
              objc_msgSend(v14, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Moving %@ to %@"), v11, v12);

              v29 = v24;
              v15 = objc_msgSend(v3, "moveItemAtPath:toPath:error:", v11, v12, &v29);
              v16 = v29;

              if (!v15)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedDescription"));
                objc_msgSend(v21, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Cannot move %@ to %@ with error - %@"), v11, v12, v22);

                objc_autoreleasePoolPop(v10);
                v17 = 0;
                v18 = v25;
                v3 = v26;
                v4 = v25;
                goto LABEL_19;
              }
              v24 = v16;
              v7 = v23;
            }

            v4 = v25;
            v3 = v26;
          }

          objc_autoreleasePoolPop(v10);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v6)
          continue;
        break;
      }
      v17 = 1;
      v18 = v4;
      v16 = v24;
    }
    else
    {
      v16 = 0;
      v17 = 1;
      v18 = v4;
    }
    goto LABEL_19;
  }
  v19 = objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  v17 = 1;
  objc_msgSend((id)v19, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Moving %@ to %@"), v27, CFSTR("/private/var/demo_backup/backup"));

  v28 = 0;
  LOBYTE(v19) = objc_msgSend(v3, "moveItemAtPath:toPath:error:", v27, CFSTR("/private/var/demo_backup/backup"), &v28);
  v16 = v28;
  if ((v19 & 1) == 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedDescription"));
    objc_msgSend(v4, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Could not move %@ to %@ with error - %@"), v27, CFSTR("/private/var/demo_backup/backup"), v18);
    v17 = 0;
LABEL_19:

  }
  return v17;
}

@end
