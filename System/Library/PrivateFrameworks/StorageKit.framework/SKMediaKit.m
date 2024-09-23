@implementation SKMediaKit

+ (id)getMediaKitFilesystemType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SKMediaKit getMediaKitFilesystemInfo:](SKMediaKit, "getMediaKitFilesystemInfo:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "fsType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "fsType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getMediaKitFilesystemInfo:(id)a3
{
  SKMediaKitFSInfo *v3;
  void *v4;

  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v3 = (SKMediaKitFSInfo *)MKMediaCreateWithPath();
  if (v3)
  {
    v4 = (void *)MKCFCreateFSInfo();
    CFRelease(v3);
    if (v4)
      v3 = -[SKMediaKitFSInfo initWithFSInfo:]([SKMediaKitFSInfo alloc], "initWithFSInfo:", v4);
    else
      v3 = 0;

  }
  return v3;
}

+ (id)newMediaRefForDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a4;
  objc_msgSend(a3, "diskIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("/dev/r%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)MKMediaCreateWithPath();

  if (!v12)
  {
    +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 0, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[14];
  _QWORD v21[15];

  v21[14] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/dev/%@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKMediaKit getMediaKitFilesystemInfo:](SKMediaKit, "getMediaKitFilesystemInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fsInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("Filesystem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "fsInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("Attributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("Case sensitive"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    +[SKFilesystem filesystemFor:caseSensitive:](SKFilesystem, "filesystemFor:caseSensitive:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v4, "fsInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("Attributes"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("Journaled"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
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
