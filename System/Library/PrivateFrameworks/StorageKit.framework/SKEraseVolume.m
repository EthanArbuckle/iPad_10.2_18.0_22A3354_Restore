@implementation SKEraseVolume

- (SKEraseVolume)initWithChildDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  SKEraseVolume *v11;
  SKEraseVolume *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSDictionary *diskRepresentation;
  uint64_t v24;
  SKProgress *progress;
  SKEraseVolume *v26;
  _QWORD v28[4];
  id v29;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SKEraseVolume;
  v11 = -[SKEraseVolume init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_disk, a3);
    if (!v10)
    {
      -[SKEraseVolume formattableFilesystems](v12, "formattableFilesystems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKEraseVolume formattableFilesystems](v12, "formattableFilesystems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "filesystem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x24BDD1758];
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __52__SKEraseVolume_initWithChildDisk_descriptor_error___block_invoke;
        v28[3] = &unk_24FDC01A0;
        v29 = v9;
        objc_msgSend(v17, "predicateWithBlock:", v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "filteredArrayUsingPredicate:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "count"))
        {
          objc_msgSend(v19, "firstObject");
          v20 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v20;
        }

      }
      objc_msgSend(v9, "volumeName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKVolumeDescriptor descriptorWithName:filesystem:](SKVolumeDescriptor, "descriptorWithName:filesystem:", v21, v15);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)&v12->_descriptor, v10);
    objc_msgSend(v9, "minimalDictionaryRepresentation");
    v22 = objc_claimAutoreleasedReturnValue();
    diskRepresentation = v12->_diskRepresentation;
    v12->_diskRepresentation = (NSDictionary *)v22;

    +[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100);
    v24 = objc_claimAutoreleasedReturnValue();
    progress = v12->_progress;
    v12->_progress = (SKProgress *)v24;

  }
  -[SKEraseVolume validateWithError:](v12, "validateWithError:", a5);
  v26 = (SKEraseVolume *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __52__SKEraseVolume_initWithChildDisk_descriptor_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "majorType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "filesystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "majorType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v6))
  {
    v7 = objc_msgSend(v3, "isCaseSensitive");
    objc_msgSend(*(id *)(a1 + 32), "filesystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == objc_msgSend(v8, "isCaseSensitive"))
    {
      v10 = objc_msgSend(v3, "isEncrypted");
      objc_msgSend(*(id *)(a1 + 32), "filesystem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v10 ^ objc_msgSend(v11, "isEncrypted") ^ 1;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)eraseVolumeWithChildDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v9 = v7;
  objc_msgSend(v9, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10
    || (objc_msgSend(v10, "volumes"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        v13 < 2))
  {

LABEL_8:
    v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChildDisk:descriptor:error:", v7, v8, a5);
    goto LABEL_9;
  }
  SKGetOSLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v19 = 136315394;
    v20 = "+[SKEraseVolume eraseVolumeWithChildDisk:descriptor:error:]";
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_22FE50000, v14, OS_LOG_TYPE_ERROR, "%s: More than 1 volume on %@ physical store", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(v11, "volumes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 301, v15, MEMORY[0x24BDBD1B8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError nilWithError:error:](SKError, "nilWithError:error:", v16, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v17;
}

+ (id)eraseVolumeWithChildDisk:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChildDisk:descriptor:error:", v5, 0, a4);

  return v6;
}

+ (id)eraseVolumeWithAPFSStoreDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChildDisk:descriptor:error:", v8, v7, a5);

  return v9;
}

+ (id)eraseVolumeWithAPFSContainerDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "designatedPhysicalStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend(v7, "designatedPhysicalStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eraseVolumeWithAPFSStoreDisk:descriptor:error:", v11, v8, a5);
  }
  else
  {
    +[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 117, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError nilWithError:error:](SKError, "nilWithError:error:", v11, a5);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setDisk:(id)a3
{
  NSDictionary *v5;
  NSDictionary *diskRepresentation;
  id v7;

  objc_storeStrong((id *)&self->_disk, a3);
  v7 = a3;
  objc_msgSend(v7, "minimalDictionaryRepresentation");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  diskRepresentation = self->_diskRepresentation;
  self->_diskRepresentation = v5;

}

- (void)eraseWithCompletionBlock:(id)a3
{
  -[SKEraseVolume eraseProgressReportingWithCompletionBlock:](self, "eraseProgressReportingWithCompletionBlock:", a3);

}

- (id)eraseProgressReportingWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCancellable:", 0);
  -[SKEraseVolume descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "validateForErase");

  if ((v7 & 1) != 0)
  {
    v19[0] = kSKAPFSDiskUnmountIgnoreGroup;
    v19[1] = CFSTR("kSKDiskMountOptionRecursive");
    v20[0] = MEMORY[0x24BDBD1C8];
    v20[1] = MEMORY[0x24BDBD1C8];
    v19[2] = CFSTR("kSKDiskMountOptionForce");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKEraseVolume forceUnmount](self, "forceUnmount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKEraseVolume disk](self, "disk");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke;
    v16[3] = &unk_24FDC01F0;
    v18 = v4;
    v16[4] = self;
    v11 = v5;
    v17 = v11;
    objc_msgSend(v10, "unmountWithOptions:completionBlock:", v9, v16);

    v12 = v17;
    v13 = v11;

  }
  else
  {
    +[SKError errorWithPOSIXCode:error:](SKError, "errorWithPOSIXCode:error:", 22, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v14);

  }
  return v5;
}

void __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  uint64_t v11;
  id v12;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke_2;
    v10 = &unk_24FDC01C8;
    v5 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v5;
    objc_msgSend(v3, "eraseWithEraser:completionBlock:", v4, &v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 10, v7, v8, v9, v10);
    objc_msgSend(*(id *)(a1 + 40), "chainChildProgress:withPendingUnitCount:", v6, 90);

  }
}

void __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (!v5)
    {
      v12 = *(_QWORD *)(a1 + 40);
      +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 117, MEMORY[0x24BDBD1A8], 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "container");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "volumes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = objc_claimAutoreleasedReturnValue();

        SKGetOSLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 136315394;
          v20 = "-[SKEraseVolume eraseProgressReportingWithCompletionBlock:]_block_invoke";
          v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_DEFAULT, "%s: The new APFS volume is: %@", (uint8_t *)&v19, 0x16u);
        }
        v5 = (id)v10;
      }
      else
      {
        if (!objc_msgSend(v8, "isLiveFSAPFSDisk")
          || (objc_msgSend(*(id *)(a1 + 32), "descriptor"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v14, "filesystem"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "isEncrypted"),
              v15,
              v14,
              !v16))
        {
          v17 = *(_QWORD *)(a1 + 40);
          +[SKError errorWithCode:debugDescription:error:](SKError, "errorWithCode:debugDescription:error:", 117, CFSTR("No APFS volumes found after erase"), 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

          goto LABEL_12;
        }
        SKGetOSLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 136315394;
          v20 = "-[SKEraseVolume eraseProgressReportingWithCompletionBlock:]_block_invoke_2";
          v21 = 2112;
          v22 = (uint64_t)v5;
          _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_DEFAULT, "%s: Volume was formatted to encrypted APFS, returning %@", (uint8_t *)&v19, 0x16u);
        }
      }

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
LABEL_12:

LABEL_13:
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKEraseVolume disk](self, "disk");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKEraseVolume descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { disk: \"%@\", descriptor: \"%@\"}>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SKEraseVolume descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("descriptor"));

  -[SKEraseVolume diskRepresentation](self, "diskRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("diskRepresentation"));

}

- (id)formattableFilesystems
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  -[SKEraseVolume disk](self, "disk");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  -[SKEraseVolume disk](self, "disk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLiveFSAPFSDisk");

  if (!v5)
  {
LABEL_6:
    -[SKEraseVolume disk](self, "disk");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formattableFilesystems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[SKEraseVolume disk](self, "disk");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "hasVolumeSiblings"))
  {
LABEL_5:

    goto LABEL_6;
  }
  +[SKFilesystem extensionFilesystems](SKFilesystem, "extensionFilesystems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_115);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

uint64_t __39__SKEraseVolume_formattableFilesystems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "majorType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("apfs"));

  return v3;
}

- (SKEraseVolume)initWithCoder:(id)a3
{
  id v4;
  SKEraseVolume *v5;
  void *v6;
  uint64_t v7;
  SKVolumeDescriptor *descriptor;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *diskRepresentation;
  void *v20;
  uint64_t v21;
  SKDisk *disk;
  uint64_t v23;
  SKProgress *progress;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SKEraseVolume;
  v5 = -[SKEraseVolume init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("descriptor"));
    v7 = objc_claimAutoreleasedReturnValue();
    descriptor = v5->_descriptor;
    v5->_descriptor = (SKVolumeDescriptor *)v7;

    v26 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("diskRepresentation"));
    v18 = objc_claimAutoreleasedReturnValue();
    diskRepresentation = v5->_diskRepresentation;
    v5->_diskRepresentation = (NSDictionary *)v18;

    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "knownDiskForDictionary:", v5->_diskRepresentation);
    v21 = objc_claimAutoreleasedReturnValue();
    disk = v5->_disk;
    v5->_disk = (SKDisk *)v21;

    +[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100);
    v23 = objc_claimAutoreleasedReturnValue();
    progress = v5->_progress;
    v5->_progress = (SKProgress *)v23;

  }
  return v5;
}

- (id)validateWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SKEraseVolume *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  _QWORD v66[4];

  v66[3] = *MEMORY[0x24BDAC8D0];
  -[SKEraseVolume disk](self, "disk");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[SKError nilWithPOSIXCode:debugDescription:error:](SKError, "nilWithPOSIXCode:debugDescription:error:", 22, CFSTR("No disk specified"), a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v66[0] = kSKDiskTypeGPTWholeDisk[0];
  v66[1] = kSKDiskTypeMBRWholeDisk[0];
  v66[2] = kSKDiskTypeAPMWholeDisk[0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKEraseVolume disk](self, "disk");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isMemberOfClass:", objc_opt_class());
  v59 = v8;
  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[SKEraseVolume disk](self, "disk");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      -[SKEraseVolume disk](self, "disk");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
      {

        goto LABEL_36;
      }
      v11 = 1;
    }
  }
  -[SKEraseVolume disk](self, "disk");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "containsObject:", v14);

  if (v11)
  if ((v10 & 1) == 0)
  {

    if ((v15 & 1) == 0)
      goto LABEL_15;
LABEL_36:
    v47 = (void *)MEMORY[0x24BDD17C8];
    -[SKEraseVolume disk](self, "disk");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("Volume %@ not valid for erase"), v16);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError nilWithPOSIXCode:debugDescription:error:](SKError, "nilWithPOSIXCode:debugDescription:error:", 45, v48, a3);
    v27 = (SKEraseVolume *)objc_claimAutoreleasedReturnValue();

LABEL_50:
    v21 = v59;
    goto LABEL_51;
  }

  if (v15)
    goto LABEL_36;
LABEL_15:
  -[SKEraseVolume disk](self, "disk");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SKEraseVolume descriptor](self, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filesystem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "majorType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("apfs"));

    if ((v20 & 1) != 0)
      goto LABEL_22;
    -[SKEraseVolume disk](self, "disk");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v59;
    if (objc_msgSend(v16, "hasVolumeSiblings"))
    {
      SKGetOSLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "container");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v61 = "-[SKEraseVolume validateWithError:]";
        v62 = 2112;
        v63 = v23;
        _os_log_impl(&dword_22FE50000, v22, OS_LOG_TYPE_ERROR, "%s: More than 1 volume on %@ container", buf, 0x16u);

      }
      objc_msgSend(v16, "container");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "volumes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKError errorWithCode:disks:userInfo:](SKError, "errorWithCode:disks:userInfo:", 301, v25, MEMORY[0x24BDBD1B8]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKError nilWithError:error:](SKError, "nilWithError:error:", v26, a3);
      v27 = (SKEraseVolume *)objc_claimAutoreleasedReturnValue();

      goto LABEL_51;
    }
  }

LABEL_22:
  -[SKEraseVolume disk](self, "disk");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = v59;
    goto LABEL_29;
  }
  -[SKEraseVolume disk](self, "disk");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isLiveFSAPFSDisk");

  v21 = v59;
  if (!v29)
    goto LABEL_30;
  -[SKEraseVolume disk](self, "disk");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "hasVolumeSiblings"))
  {
    SKGetOSLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "container");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v61 = "-[SKEraseVolume validateWithError:]";
      v62 = 2112;
      v63 = v31;
      _os_log_impl(&dword_22FE50000, v30, OS_LOG_TYPE_ERROR, "%s: More than 1 volume on %@ container, erase will be destructive", buf, 0x16u);

    }
    +[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 301, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError nilWithError:error:](SKError, "nilWithError:error:", v32, a3);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  objc_msgSend(v16, "container");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "designatedPhysicalStore");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKEraseVolume setDisk:](self, "setDisk:", v57);

  -[SKEraseVolume disk](self, "disk");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
LABEL_29:

LABEL_30:
    -[SKEraseVolume disk](self, "disk");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEraseVolume descriptor](self, "descriptor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "filesystem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "formattableFilesystemWithFilesystem:", v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      SKGetOSLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        -[SKEraseVolume descriptor](self, "descriptor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "filesystem");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKEraseVolume formattableFilesystems](self, "formattableFilesystems");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v61 = "-[SKEraseVolume validateWithError:]";
        v62 = 2112;
        v63 = v51;
        v64 = 2112;
        v65 = v52;
        _os_log_impl(&dword_22FE50000, v49, OS_LOG_TYPE_ERROR, "%s: FS to format %@ not found in supported filesystems %@", buf, 0x20u);

      }
      +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 45, a3);
      v27 = (SKEraseVolume *)objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    }
    -[SKEraseVolume descriptor](self, "descriptor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFilesystem:", v16);

    -[SKEraseVolume descriptor](self, "descriptor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "filesystem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "majorType");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("apfs"));

    if (v41)
    {
      +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKEraseVolume disk](self, "disk");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "wholeDiskForDisk:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "type");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "isEqualToString:", kSKDiskTypeMBRWholeDisk[0]))
      {
        v46 = objc_msgSend(v44, "childCount");

        if (v46 >= 2)
          goto LABEL_43;
      }
      else
      {

      }
      objc_msgSend(v44, "type");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v53, "isEqualToString:", kSKDiskTypeAPMWholeDisk[0]))
      {
        v54 = objc_msgSend(v44, "childCount");

        if (v54 >= 3)
        {
LABEL_43:
          +[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 301, 0);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          +[SKError nilWithError:error:](SKError, "nilWithError:error:", v55, a3);
          v27 = (SKEraseVolume *)objc_claimAutoreleasedReturnValue();

          goto LABEL_50;
        }
      }
      else
      {

      }
    }
    v27 = self;
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find physical store for %@"), v16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError nilWithSKErrorCode:debugDescription:error:](SKError, "nilWithSKErrorCode:debugDescription:error:", 117, v32, a3);
  v33 = objc_claimAutoreleasedReturnValue();
LABEL_46:
  v27 = (SKEraseVolume *)v33;

LABEL_51:
  return v27;
}

- (SKDisk)disk
{
  return self->_disk;
}

- (SKVolumeDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (BOOL)forceUnmount
{
  return self->_forceUnmount;
}

- (void)setForceUnmount:(BOOL)a3
{
  self->_forceUnmount = a3;
}

- (SKProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSDictionary)diskRepresentation
{
  return self->_diskRepresentation;
}

- (void)setDiskRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_diskRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskRepresentation, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_disk, 0);
}

@end
