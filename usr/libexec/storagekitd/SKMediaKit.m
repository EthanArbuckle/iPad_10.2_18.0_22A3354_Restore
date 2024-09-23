@implementation SKMediaKit

+ (id)getMediaKitFilesystemType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKMediaKit getMediaKitFilesystemInfo:](SKMediaKit, "getMediaKitFilesystemInfo:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fsType"));
    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fsType"));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getMediaKitFilesystemInfo:(id)a3
{
  uint64_t v3;
  SKMediaKitFSInfo *v4;
  void *v5;
  int v7;
  int v8;

  v8 = 0;
  v3 = MKMediaCreateWithPath(kCFAllocatorDefault, objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0, &v8);
  v4 = (SKMediaKitFSInfo *)v3;
  if (v3)
  {
    v7 = 0;
    v5 = (void *)MKCFCreateFSInfo(v3, &off_100047D18, &v7);
    CFRelease(v4);
    if (v5)
      v4 = -[SKMediaKitFSInfo initWithFSInfo:]([SKMediaKitFSInfo alloc], "initWithFSInfo:", v5);
    else
      v4 = 0;

  }
  return v4;
}

+ (id)newMediaRefForDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v13;

  v13 = 0;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "diskIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/r%@"), v8));

  v10 = objc_retainAutorelease(v9);
  v11 = (void *)MKMediaCreateWithPath(kCFAllocatorDefault, objc_msgSend(v10, "UTF8String"), v7, &v13);

  if (!v11)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", v13, a5));

  return v11;
}

+ (id)getFilesystem:(id)a3
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[14];
  _QWORD v21[14];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/%@"), a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKMediaKit getMediaKitFilesystemInfo:](SKMediaKit, "getMediaKitFilesystemInfo:", v3));

  if (v4)
  {
    v20[0] = CFSTR("HFS Unknown variant");
    v20[1] = CFSTR("HFS");
    v21[0] = CFSTR("hfs");
    v21[1] = CFSTR("hfs");
    v20[2] = CFSTR("HFS+");
    v20[3] = CFSTR("HFS+ Embedded");
    v21[2] = CFSTR("hfs");
    v21[3] = CFSTR("hfs");
    v20[4] = CFSTR("HFS+ Extended");
    v20[5] = CFSTR("APFS");
    v21[4] = CFSTR("hfs");
    v21[5] = CFSTR("apfs");
    v20[6] = CFSTR("FAT");
    v20[7] = CFSTR("FAT12");
    v21[6] = CFSTR("msdos");
    v21[7] = CFSTR("msdos");
    v20[8] = CFSTR("FAT16");
    v20[9] = CFSTR("FAT32");
    v21[8] = CFSTR("msdos");
    v21[9] = CFSTR("msdos");
    v20[10] = CFSTR("NTFS");
    v20[11] = CFSTR("ExFAT");
    v21[10] = CFSTR("ntfs");
    v21[11] = CFSTR("exfat");
    v20[12] = CFSTR("UFS");
    v20[13] = CFSTR("ISO9660");
    v21[12] = CFSTR("ufs");
    v21[13] = CFSTR("cd9660");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 14));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fsInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Filesystem")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fsInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Attributes")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("Case sensitive")));
    v12 = objc_msgSend(v11, "BOOLValue");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SKFilesystem filesystemFor:caseSensitive:](SKFilesystem, "filesystemFor:caseSensitive:", v8, v12));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fsInfo"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("Attributes")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Journaled")));
      v17 = objc_msgSend(v16, "BOOLValue");

      objc_msgSend(v13, "setIsJournaled:", v17);
      v18 = v13;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
