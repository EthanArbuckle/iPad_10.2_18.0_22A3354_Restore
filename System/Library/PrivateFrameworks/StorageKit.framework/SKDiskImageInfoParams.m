@implementation SKDiskImageInfoParams

+ (id)format_info_key
{
  return CFSTR("Image Format");
}

+ (id)format_desc_info_key
{
  return CFSTR("Format Description");
}

+ (id)identity_info_key
{
  return CFSTR("Identity Info");
}

+ (id)size_info_key
{
  return CFSTR("Size Info");
}

+ (id)compression_info_key
{
  return CFSTR("Compression Info");
}

+ (id)encryption_info_key
{
  return CFSTR("Encryption Info");
}

+ (id)checksum_info_key
{
  return CFSTR("Master Checksum Info");
}

+ (id)asif_info_key
{
  return CFSTR("ASIF Info");
}

+ (id)runs_info_key
{
  return CFSTR("Runs");
}

+ (id)partitions_info_key
{
  return CFSTR("Partitions");
}

+ (id)getDictDescriptionWithDisk:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ioContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "ioContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("content-hint"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKey:", CFSTR("N/A"), CFSTR("content-hint"));
  }

  objc_msgSend(v3, "volumeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "volumeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("volume-name"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKey:", CFSTR("N/A"), CFSTR("volume-name"));
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v3, "totalSpace"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("total-space"));

  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v3, "usedSpace"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("used-space"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKey:", CFSTR("N/A"), CFSTR("used-space"));
  }

  return v4;
}

- (id)getInfoDictWithDisk:(id)a3
{
  id v4;
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
  id v16;

  v4 = a3;
  -[SKDiskImageInfoParams imageInfo](self, "imageInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    while (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKManager syncSharedManager](SKManager, "syncSharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "childDisksForWholeDisk:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v11);

      +[SKDiskImageInfoParams getDictDescriptionWithDisk:](SKDiskImageInfoParams, "getDictDescriptionWithDisk:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      if (objc_msgSend(v9, "isMemberOfClass:", objc_opt_class()))
      {
        objc_msgSend(v9, "container");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "volumes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v14);

        +[SKDiskImageInfoParams getDictDescriptionWithDisk:](SKDiskImageInfoParams, "getDictDescriptionWithDisk:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

      }
      objc_msgSend(v8, "removeObjectAtIndex:", 0);

    }
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("Partitions"));
    v16 = v6;

  }
  return v6;
}

- (BOOL)stdinPassPhrase
{
  return self->_stdinPassPhrase;
}

- (void)setStdinPassPhrase:(BOOL)a3
{
  self->_stdinPassPhrase = a3;
}

- (BOOL)extraInfo
{
  return self->_extraInfo;
}

- (void)setExtraInfo:(BOOL)a3
{
  self->_extraInfo = a3;
}

- (NSDictionary)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageInfo, 0);
}

@end
