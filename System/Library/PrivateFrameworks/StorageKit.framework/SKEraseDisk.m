@implementation SKEraseDisk

- (SKEraseDisk)initWithRootDisk:(id)a3 descriptors:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  SKEraseDisk *v11;
  SKEraseDisk *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *diskRepresentation;
  uint64_t v22;
  SKProgress *progress;
  SKEraseDisk *v24;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SKEraseDisk;
  v11 = -[SKEraseDisk init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_disk, a3);
    if (!v10)
    {
      -[SKEraseDisk formattableFilesystems](v12, "formattableFilesystems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "majorType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("msdos"));

      if (v16)
        v17 = CFSTR("NO NAME");
      else
        v17 = CFSTR("Untitled");
      +[SKVolumeDescriptor descriptorWithName:filesystem:](SKVolumeDescriptor, "descriptorWithName:filesystem:", v17, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKPartitionDescriptor descriptorWithVolume:](SKPartitionDescriptor, "descriptorWithVolume:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)&v12->_descriptors, v10);
    objc_msgSend(v9, "minimalDictionaryRepresentation");
    v20 = objc_claimAutoreleasedReturnValue();
    diskRepresentation = v12->_diskRepresentation;
    v12->_diskRepresentation = (NSDictionary *)v20;

    +[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100);
    v22 = objc_claimAutoreleasedReturnValue();
    progress = v12->_progress;
    v12->_progress = (SKProgress *)v22;

  }
  -[SKEraseDisk validateWithError:](v12, "validateWithError:", a5);
  v24 = (SKEraseDisk *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)eraseDiskWithRootDisk:(id)a3 descriptors:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRootDisk:descriptors:error:", v8, v7, a5);

  return v9;
}

+ (id)eraseDiskWithRootDisk:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRootDisk:descriptors:error:", v5, 0, a4);

  return v6;
}

- (void)eraseWithCompletionBlock:(id)a3
{
  -[SKEraseDisk eraseProgressReportingWithCompletionBlock:](self, "eraseProgressReportingWithCompletionBlock:", a3);

}

- (id)eraseProgressReportingWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCancellable:", 0);
  v17 = CFSTR("kSKDiskMountOptionForce");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKEraseDisk forceUnmount](self, "forceUnmount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKEraseDisk disk](self, "disk");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__SKEraseDisk_eraseProgressReportingWithCompletionBlock___block_invoke;
  v14[3] = &unk_24FDC01F0;
  v16 = v4;
  v14[4] = self;
  v9 = v5;
  v15 = v9;
  v10 = v4;
  objc_msgSend(v8, "unmountWithOptions:completionBlock:", v7, v14);

  v11 = v15;
  v12 = v9;

  return v12;
}

void __57__SKEraseDisk_eraseProgressReportingWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eraseWithEraser:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 10);
    objc_msgSend(*(id *)(a1 + 40), "chainChildProgress:withPendingUnitCount:", v4, 90);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  -[SKEraseDisk disk](self, "disk");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKEraseDisk descriptors](self, "descriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { disk: \"%@\", descriptors: \"%@\"}>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)formattableFilesystems
{
  void *v2;
  void *v3;

  -[SKEraseDisk disk](self, "disk");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattableFilesystems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SKEraseDisk diskRepresentation](self, "diskRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("diskRepresentation"));

  -[SKEraseDisk descriptors](self, "descriptors");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("descriptors"));

}

- (SKEraseDisk)initWithCoder:(id)a3
{
  id v4;
  SKEraseDisk *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *diskRepresentation;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *descriptors;
  void *v22;
  uint64_t v23;
  SKDisk *disk;
  uint64_t v25;
  SKProgress *progress;
  void *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SKEraseDisk;
  v5 = -[SKEraseDisk init](&v29, sel_init);
  if (v5)
  {
    v28 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("diskRepresentation"));
    v15 = objc_claimAutoreleasedReturnValue();
    diskRepresentation = v5->_diskRepresentation;
    v5->_diskRepresentation = (NSDictionary *)v15;

    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("descriptors"));
    v20 = objc_claimAutoreleasedReturnValue();
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v20;

    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "knownDiskForDictionary:", v5->_diskRepresentation);
    v23 = objc_claimAutoreleasedReturnValue();
    disk = v5->_disk;
    v5->_disk = (SKDisk *)v23;

    +[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100);
    v25 = objc_claimAutoreleasedReturnValue();
    progress = v5->_progress;
    v5->_progress = (SKProgress *)v25;

  }
  return v5;
}

- (id)validateWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  SKEraseDisk *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  unint64_t i;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  uint8_t v54[128];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[24];
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  -[SKEraseDisk disk](self, "disk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    SKGetOSLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[SKEraseDisk disk](self, "disk");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v61 = 136315394;
      *(_QWORD *)&v61[4] = "-[SKEraseDisk validateWithError:]";
      *(_WORD *)&v61[12] = 2112;
      *(_QWORD *)&v61[14] = v20;
      _os_log_impl(&dword_22FE50000, v19, OS_LOG_TYPE_ERROR, "%s: Disk %@ not valid for erase", v61, 0x16u);

    }
    +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 22, a3);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  -[SKEraseDisk disk](self, "disk");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canPartitionDisk");

  if ((v7 & 1) == 0)
  {
    SKGetOSLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[SKEraseDisk disk](self, "disk");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v61 = 136315394;
      *(_QWORD *)&v61[4] = "-[SKEraseDisk validateWithError:]";
      *(_WORD *)&v61[12] = 2112;
      *(_QWORD *)&v61[14] = v23;
      _os_log_impl(&dword_22FE50000, v22, OS_LOG_TYPE_ERROR, "%s: Disk %@ not valid for erase, should be whole disk not APFSContainer", v61, 0x16u);

    }
    +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 45, a3);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  -[SKEraseDisk descriptors](self, "descriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (-[SKEraseDisk descriptors](self, "descriptors"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8,
        !v10))
  {
    SKGetOSLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v61 = 136315138;
      *(_QWORD *)&v61[4] = "-[SKEraseDisk validateWithError:]";
      _os_log_impl(&dword_22FE50000, v24, OS_LOG_TYPE_ERROR, "%s: Missing partition descriptors for erase disk", v61, 0xCu);
    }

    +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 22, a3);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v25 = (void *)v21;
    return v25;
  }
  *(_QWORD *)v61 = 0;
  *(_QWORD *)&v61[8] = v61;
  *(_QWORD *)&v61[16] = 0x2020000000;
  v62 = 0;
  -[SKEraseDisk descriptors](self, "descriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __33__SKEraseDisk_validateWithError___block_invoke;
  v53[3] = &unk_24FDC0238;
  v53[4] = v61;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v53);

  v12 = *(_QWORD *)(*(_QWORD *)&v61[8] + 24);
  -[SKEraseDisk disk](self, "disk");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = v12 > objc_msgSend(v13, "unformattedSize");

  if ((v12 & 1) != 0)
  {
    SKGetOSLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(*(_QWORD *)&v61[8] + 24);
      -[SKEraseDisk disk](self, "disk");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unformattedSize");
      *(_DWORD *)buf = 136315650;
      v56 = "-[SKEraseDisk validateWithError:]";
      v57 = 2048;
      v58 = v15;
      v59 = 2048;
      v60 = v17;
      _os_log_impl(&dword_22FE50000, v14, OS_LOG_TYPE_ERROR, "%s: New size %lu exceeds %llu", buf, 0x20u);

    }
    +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 28, a3);
    v18 = (SKEraseDisk *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  for (i = 0; ; ++i)
  {
    -[SKEraseDisk descriptors](self, "descriptors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count") - 1 > i;

    if (!v29)
      break;
    -[SKEraseDisk descriptors](self, "descriptors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", i);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "size") == 0;

    if (v32)
    {
      SKGetOSLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "-[SKEraseDisk validateWithError:]";
        v57 = 1024;
        LODWORD(v58) = i;
        _os_log_impl(&dword_22FE50000, v43, OS_LOG_TYPE_ERROR, "%s: Non last descriptor %d zero size", buf, 0x12u);
      }

      +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 22, a3);
      v18 = (SKEraseDisk *)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[SKEraseDisk descriptors](self, "descriptors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  obj = v33;
  if (!v34)
    goto LABEL_33;
  v35 = *(_QWORD *)v50;
  while (2)
  {
    v36 = 0;
    do
    {
      if (*(_QWORD *)v50 != v35)
        objc_enumerationMutation(obj);
      v37 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v36);
      -[SKEraseDisk disk](self, "disk");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "filesystem");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "formattableFilesystemWithFilesystem:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
        SKGetOSLog();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v37, "filesystem");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKEraseDisk formattableFilesystems](self, "formattableFilesystems");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v56 = "-[SKEraseDisk validateWithError:]";
          v57 = 2112;
          v58 = v45;
          v59 = 2112;
          v60 = (uint64_t)v46;
          _os_log_impl(&dword_22FE50000, v44, OS_LOG_TYPE_ERROR, "%s: FS to format %@ not found in supported filesystems %@", buf, 0x20u);

        }
        v47 = 45;
        goto LABEL_43;
      }
      objc_msgSend(v37, "innerDescriptor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFilesystem:", v40);

      objc_msgSend(v37, "innerDescriptor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v41) = objc_msgSend(v42, "validateForErase");

      if (!(_DWORD)v41)
      {
        v47 = 22;
LABEL_43:
        +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", v47, a3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_38;
      }

      ++v36;
    }
    while (v34 != v36);
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v34)
      continue;
    break;
  }
LABEL_33:

  v18 = self;
LABEL_37:
  v25 = v18;
LABEL_38:
  _Block_object_dispose(v61, 8);
  return v25;
}

uint64_t __33__SKEraseDisk_validateWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "size");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (SKDisk)disk
{
  return self->_disk;
}

- (void)setDisk:(id)a3
{
  objc_storeStrong((id *)&self->_disk, a3);
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_descriptors, a3);
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
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_disk, 0);
}

@end
