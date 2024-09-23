@implementation SKDiskImage

+ (id)diskImageWithURL:(id)a3 params:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_msgSend(a1, "diskImageUnsafeWithURL:params:error:", v8, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError nilWithError:error:](SKError, "nilWithError:error:", v11, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

id __45__SKDiskImage_diskImageWithURL_params_error___block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKDiskImage.m", 95);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)diskImageUnsafeWithURL:(id)a3 params:(id)a4 error:(id *)a5
{
  char *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  SKDiskImageAttachParams *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  int v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *v26;
  const __CFString *v27;
  NSObject *v28;
  const __CFString *v29;
  NSObject *v30;
  void *v31;
  int v33;
  const char *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = a4;
  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if ((unint64_t)objc_msgSend(v9, "numBlocks") <= 0x4F)
    {
      +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 28, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
    objc_msgSend(a1, "createBlankAt:params:error:", v8, v9, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      SKGetOSLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        if (a5)
          v25 = (const __CFString *)*a5;
        else
          v25 = &stru_24FDC08E8;
        v33 = 136315394;
        v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
        v35 = 2112;
        v36 = v25;
        _os_log_impl(&dword_22FE50000, v24, OS_LOG_TYPE_ERROR, "%s: Failed to create blank disk image %@", (uint8_t *)&v33, 0x16u);
      }

      v22 = 0;
      goto LABEL_45;
    }
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:diParams:error:", v8, v15, a5);
    if (!v16)
    {
      SKGetOSLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        if (a5)
          v27 = (const __CFString *)*a5;
        else
          v27 = &stru_24FDC08E8;
        v33 = 136315394;
        v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
        v35 = 2112;
        v36 = v27;
        _os_log_impl(&dword_22FE50000, v26, OS_LOG_TYPE_ERROR, "%s: Failed to create disk image %@", (uint8_t *)&v33, 0x16u);
      }

      v23 = 1;
LABEL_43:
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeItemAtURL:error:", v8, 0);

      v22 = 0;
LABEL_44:
      if (!v23)
      {
        v22 = v22;
        v12 = v22;
        goto LABEL_47;
      }
LABEL_45:
      v12 = 0;
LABEL_47:

      goto LABEL_48;
    }
    v17 = objc_alloc_init(SKDiskImageAttachParams);
    -[SKDiskImageAttachParams setPolicy:](v17, "setPolicy:", 0);
    -[SKDiskImageAttachParams setIsManagedAttach:](v17, "setIsManagedAttach:", 1);
    objc_msgSend(v16, "attachWithParams:error:", v17, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      eraseDisk(v18, v9, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v19, "ejectWithError:", 0);
        SKGetOSLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v33 = 138412290;
          v34 = v8;
          _os_log_impl(&dword_22FE50000, v21, OS_LOG_TYPE_DEFAULT, "Created disk image successfully at %@", (uint8_t *)&v33, 0xCu);
        }

        v22 = v16;
        v23 = 0;
LABEL_42:

        if (v22)
          goto LABEL_44;
        goto LABEL_43;
      }
      SKGetOSLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v33 = 138412290;
        v34 = (const char *)v19;
        _os_log_impl(&dword_22FE50000, v30, OS_LOG_TYPE_ERROR, "Failed to erase %@", (uint8_t *)&v33, 0xCu);
      }

      objc_msgSend(v19, "ejectWithError:", 0);
    }
    else
    {
      SKGetOSLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        if (a5)
          v29 = (const __CFString *)*a5;
        else
          v29 = &stru_24FDC08E8;
        v33 = 136315394;
        v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
        v35 = 2112;
        v36 = v29;
        _os_log_impl(&dword_22FE50000, v28, OS_LOG_TYPE_ERROR, "%s: Failed to attach after create %@", (uint8_t *)&v33, 0x16u);
      }

    }
    v22 = 0;
    v23 = 1;
    goto LABEL_42;
  }
  objc_msgSend(v9, "diConvertParamsWithOutputURL:error:", v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "diskImageConvertFromParamsAt:params:error:", v8, v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SKGetOSLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (a5)
        v14 = (const __CFString *)*a5;
      else
        v14 = &stru_24FDC08E8;
      v33 = 136315394;
      v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_22FE50000, v13, OS_LOG_TYPE_ERROR, "%s: Could not create 'convert params' %@", (uint8_t *)&v33, 0x16u);
    }

    v12 = 0;
  }

LABEL_48:
  return v12;
}

+ (id)diskImageConvertFromParamsAt:(id)a3 params:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x24BE2D0D8], "convertWithParams:error:", v9, a5) & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:diParams:error:", v8, v9, a5);
  }
  else
  {
    SKGetOSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (a5)
        v12 = (const __CFString *)*a5;
      else
        v12 = &stru_24FDC08E8;
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_ERROR, "Could not convert with %@", (uint8_t *)&v14, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

+ (id)createBlankAt:(id)a3 params:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "diCreateParamsWithURL:error:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SKGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (a5)
        v9 = (const __CFString *)*a5;
      else
        v9 = &stru_24FDC08E8;
      v15 = 136315394;
      v16 = "+[SKDiskImage createBlankAt:params:error:]";
      v17 = 2112;
      v18 = v9;
      v11 = "%s: Failed to create 'create params' %@";
      v12 = v8;
      v13 = 22;
      goto LABEL_14;
    }
LABEL_15:

    v7 = 0;
    goto LABEL_16;
  }
  if ((objc_msgSend(MEMORY[0x24BE2D0D8], "createBlankWithParams:error:", v6, a5) & 1) == 0)
  {
    SKGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (a5)
        v10 = (const __CFString *)*a5;
      else
        v10 = &stru_24FDC08E8;
      v15 = 138412290;
      v16 = (const char *)v10;
      v11 = "Failed to create disk image %@";
      v12 = v8;
      v13 = 12;
LABEL_14:
      _os_log_impl(&dword_22FE50000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, v13);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v7 = v6;
LABEL_16:

  return v7;
}

- (BOOL)isAttached
{
  SKIOObject *v3;
  id v4;
  SKIOMedia *v5;
  SKIOMedia *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  SKIOMedia *v11;
  BOOL v12;
  SKIOObject *v14;
  mach_timespec_t waitTime;

  waitTime = (mach_timespec_t)5;
  IOKitWaitQuiet(*MEMORY[0x24BDD8B18], &waitTime);
  v3 = -[SKIOObject initWithClassName:]([SKIOObject alloc], "initWithClassName:", CFSTR("AppleDiskImagesController"));
  v4 = -[SKIOObject newIteratorWithOptions:](v3, "newIteratorWithOptions:", 0);
  v5 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v4);
  if (v5)
  {
    v6 = v5;
    v14 = v3;
    while (1)
    {
      if (IOObjectConformsTo(-[SKIOObject ioObj](v6, "ioObj", v14), "AppleDiskImageDevice"))
      {
        v7 = -[SKIOObject copyPropertyWithClass:key:](v6, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("DiskImageURL"));
        -[SKDiskImage imageURL](self, "imageURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "absoluteString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "isEqualToString:", v9);

        if (v10)
          break;
      }
      v11 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v4);

      v6 = v11;
      if (!v11)
      {
        v12 = 0;
        goto LABEL_9;
      }
    }
    v12 = 1;
LABEL_9:
    v3 = v14;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (SKDiskImage)initWithURL:(id)a3 error:(id *)a4
{
  return -[SKDiskImage initWithURL:diParams:error:](self, "initWithURL:diParams:error:", a3, 0, a4);
}

- (SKDiskImage)initWithURL:(id)a3 diParams:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  SKDiskImage *v11;
  void *v12;
  void *v13;
  char v14;
  SKDiskImage *v15;
  SKDiskImage *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SKDiskImage;
  v11 = -[SKDiskImage init](&v18, sel_init);
  if (objc_msgSend(v9, "isFileURL")
    && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "path"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "fileExistsAtPath:", v13),
        v13,
        v12,
        (v14 & 1) == 0))
  {
    +[SKError nilWithSKErrorCode:error:](SKError, "nilWithSKErrorCode:error:", 253, a5);
    v15 = (SKDiskImage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11)
    {
      objc_storeStrong((id *)&v11->_imageURL, a3);
      objc_storeStrong((id *)&v11->_diParams, a4);
    }
    v15 = v11;
  }
  v16 = v15;

  return v16;
}

- (id)attachWithError:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  -[SKDiskImage attachWithParams:error:](self, "attachWithParams:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attachNoMountWithError:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setPolicy:", 0);
  -[SKDiskImage attachWithParams:error:](self, "attachWithParams:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attachWithParams:(id)a3 error:(id *)a4
{
  NSObject *v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    SKGetOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskImage imageURL](self, "imageURL");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_22FE50000, v7, OS_LOG_TYPE_DEFAULT, "Attaching %@ with %@", (uint8_t *)&v18, 0x16u);

    }
    -[SKDiskImage diAttachWithParams:error:](self, "diAttachWithParams:error:", v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SKDiskImage mount:params:outError:](self, "mount:params:outError:", v9, v6, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        SKGetOSLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[SKDiskImage imageURL](self, "imageURL");
          v12 = (char *)objc_claimAutoreleasedReturnValue();
          v18 = 138412546;
          v19 = v12;
          v20 = 2112;
          v21 = v10;
          _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_DEFAULT, "Attached disk image %@ to %@ device successfully", (uint8_t *)&v18, 0x16u);

        }
        v10 = v10;
        v13 = v10;
      }
      else
      {
        SKGetOSLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v18 = 136315394;
          v19 = "-[SKDiskImage attachWithParams:error:]";
          v20 = 2112;
          v21 = v9;
          _os_log_impl(&dword_22FE50000, v16, OS_LOG_TYPE_ERROR, "%s: Couldn't mount disk %@", (uint8_t *)&v18, 0x16u);
        }

        v13 = 0;
      }
    }
    else
    {
      SKGetOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[SKDiskImage imageURL](self, "imageURL");
        v15 = objc_claimAutoreleasedReturnValue();
        v18 = 136315394;
        v19 = "-[SKDiskImage attachWithParams:error:]";
        v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_22FE50000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to attach %@", (uint8_t *)&v18, 0x16u);

      }
      v13 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError nilWithError:error:](SKError, "nilWithError:error:", v14, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

id __38__SKDiskImage_attachWithParams_error___block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKDiskImage.m", 239);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (BOOL)retrieveDIInfoWithParams:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  uint8_t v19[16];

  v6 = a3;
  -[SKDiskImage diParams](self, "diParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BE2D0C8]);
  if (v7)
  {
    -[SKDiskImage diParams](self, "diParams");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithExistingParams:error:", v9, a4);
  }
  else
  {
    -[SKDiskImage imageURL](self, "imageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithURL:error:", v9, a4);
  }
  v11 = (void *)v10;

  if (!v11)
  {
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v12 = objc_msgSend(v6, "stdinPassPhrase");
  v13 = objc_msgSend(v11, "readPassphraseFlags");
  if (v12)
    v14 = v13 | 8;
  else
    v14 = v13;
  objc_msgSend(v11, "setReadPassphraseFlags:", v14);
  objc_msgSend(v11, "setExtraInfo:", objc_msgSend(v6, "extraInfo"));
  if ((objc_msgSend(MEMORY[0x24BE2D0D8], "retrieveInfoWithParams:error:", v11, a4) & 1) == 0)
  {
    SKGetOSLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_22FE50000, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve image info", v19, 2u);
    }

    goto LABEL_13;
  }
  -[SKDiskImage setDiParams:](self, "setDiParams:", v11);
  objc_msgSend(v11, "imageInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageInfo:", v15);

  v16 = 1;
LABEL_14:

  return v16;
}

- (id)retrieveInfoWithParams:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[SKDiskImage retrieveDIInfoWithParams:error:](self, "retrieveDIInfoWithParams:error:", v6, a4))
  {
    v7 = (void *)objc_opt_new();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setReadOnly:", 1);
      objc_msgSend(v8, "setIsManagedAttach:", 1);
      objc_msgSend(v8, "setPolicy:", 0);
      -[SKDiskImage attachWithParams:error:](self, "attachWithParams:error:", v8, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v6, "getInfoDictWithDisk:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          +[SKError nilWithSKErrorCode:error:](SKError, "nilWithSKErrorCode:error:", 254, a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        SKGetOSLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v13 = 136315138;
          v14 = "-[SKDiskImage retrieveInfoWithParams:error:]";
          _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_ERROR, "%s: Attach failed", (uint8_t *)&v13, 0xCu);
        }

        v10 = 0;
      }

    }
    else
    {
      +[SKError nilWithSKErrorCode:error:](SKError, "nilWithSKErrorCode:error:", 251, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)diAttachWithParams:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  char *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  char *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id obj;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  obj = 0;
  SKGetOSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[SKDiskImage imageURL](self, "imageURL");
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v8;
    v38 = 2112;
    v39 = v6;
    _os_log_impl(&dword_22FE50000, v7, OS_LOG_TYPE_DEBUG, "Attaching %@ with %@", buf, 0x16u);

  }
  -[SKDiskImage diParams](self, "diParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    SKGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FE50000, v10, OS_LOG_TYPE_DEBUG, "Using saved instance of di2 params", buf, 2u);
    }

    -[SKDiskImage diParams](self, "diParams");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v6, "diAttachParamsWithExistingParams:error:", v11, &v34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v34;

    if (v12)
      goto LABEL_13;
  }
  else
  {
    -[SKDiskImage imageURL](self, "imageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v6, "diAttachParamsWithURL:error:", v14, &v33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v33;

    -[SKDiskImage setDiParams:](self, "setDiParams:", v12);
    if (v12)
      goto LABEL_13;
  }
  if (objc_msgSend(v13, "code") == 45)
  {
    SKGetOSLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskImage imageURL](self, "imageURL");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v16;
      v38 = 2112;
      v39 = v6;
      _os_log_impl(&dword_22FE50000, v15, OS_LOG_TYPE_DEFAULT, "Fallback attaching %@ with %@", buf, 0x16u);

    }
    v17 = (void *)MEMORY[0x24BE2D098];
    -[SKDiskImage imageURL](self, "imageURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v19 = objc_msgSend(v17, "diskImageAttach:readOnly:autoMount:BSDName:error:", v18, objc_msgSend(v6, "readOnly"), 0, &v32, a4);
    v20 = v32;

LABEL_26:
    v26 = 0;
    if (v19 && v20)
    {
      v26 = (void *)objc_opt_new();
      obj = v26;
      objc_msgSend(v26, "setBSDName:", v20);
    }

    if ((v19 & 1) != 0)
      goto LABEL_30;
    goto LABEL_33;
  }
LABEL_13:
  if (a4 && v13)
    *a4 = objc_retainAutorelease(v13);
  SKGetOSLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v12)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[SKDiskImage diAttachWithParams:error:]";
      _os_log_impl(&dword_22FE50000, v22, OS_LOG_TYPE_ERROR, "%s: Failed to create attach params", buf, 0xCu);
    }

    goto LABEL_36;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[SKDiskImage imageURL](self, "imageURL");
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v23;
    v38 = 2112;
    v39 = v12;
    _os_log_impl(&dword_22FE50000, v22, OS_LOG_TYPE_DEFAULT, "Attaching %@ with %@", buf, 0x16u);

  }
  if (!objc_msgSend(v6, "isManagedAttach"))
  {
    v31 = 0;
    v19 = objc_msgSend(MEMORY[0x24BE2D098], "diskImageAttach:BSDName:error:", v12, &v31, a4);
    v20 = v31;
    goto LABEL_26;
  }
  objc_msgSend(v6, "mountParams");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mountPoint");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUniqueDevice:", v25 != 0);

  if (!objc_msgSend(MEMORY[0x24BE2D0D8], "managedAttachWithParams:handle:error:", v12, &obj, a4))
  {
LABEL_33:
    SKGetOSLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FE50000, v29, OS_LOG_TYPE_ERROR, "Failed to attach disk image", buf, 2u);
    }

LABEL_36:
    v28 = 0;
    goto LABEL_37;
  }
  v26 = obj;
LABEL_30:
  objc_storeStrong((id *)&self->_deviceHandle, v26);
  SKGetOSLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = (const char *)obj;
    _os_log_impl(&dword_22FE50000, v27, OS_LOG_TYPE_DEFAULT, "Attached device %@", buf, 0xCu);
  }

  -[SKDiskImage deduceDiskWithError:](self, "deduceDiskWithError:", a4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

  return v28;
}

- (id)deduceDiskWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[SKManager syncSharedManager](SKManager, "syncSharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskImage deviceHandle](self, "deviceHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKDiskImage deviceHandle](self, "deviceHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "BSDName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "diskForString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;
    }
    else
    {
      SKGetOSLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[SKDiskImage deviceHandle](self, "deviceHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "BSDName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_22FE50000, v12, OS_LOG_TYPE_ERROR, "Couldn't discover disk %@ after attach", (uint8_t *)&v16, 0xCu);

      }
      +[SKError nilWithSKErrorCode:error:](SKError, "nilWithSKErrorCode:error:", 251, a3);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

  }
  else
  {
    +[SKError nilWithSKErrorCode:error:](SKError, "nilWithSKErrorCode:error:", 251, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)ejectWithError:(id *)a3
{
  void *v4;
  void *v5;
  char v6;

  -[SKDiskImage deduceDiskWithError:](self, "deduceDiskWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "ejectWithError:", a3);
  else
    v6 = 0;

  return v6;
}

- (id)mount:(id)a3 params:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "policy");
  if (v9 != 2)
  {
    if (v9 == 1)
    {
      SKGetOSLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412546;
        v19 = v7;
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_22FE50000, v15, OS_LOG_TYPE_DEFAULT, "Mounting disk %@ with %@", (uint8_t *)&v18, 0x16u);
      }

      objc_msgSend(v8, "mountParams");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mountWithParams:error:", v16, 0);

    }
    else if (v9)
    {
      +[SKError nilWithSKErrorCode:error:](SKError, "nilWithSKErrorCode:error:", 250, a5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v14 = v10;
      goto LABEL_14;
    }
LABEL_12:
    v10 = v7;
    goto LABEL_13;
  }
  SKGetOSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_DEFAULT, "Mounting disk %@ with %@", (uint8_t *)&v18, 0x16u);
  }

  objc_msgSend(v8, "mountParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "mountWithParams:error:", v12, a5);

  if ((v13 & 1) != 0)
    goto LABEL_12;
  objc_msgSend(v7, "ejectWithError:", 0);
  v14 = 0;
LABEL_14:

  return v14;
}

- (unint64_t)diResize:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v6 = a3;
  -[SKDiskImage diParams](self, "diParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BE2D0D0]);
  if (v7)
  {
    -[SKDiskImage diParams](self, "diParams");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithExistingParams:size:error:", v9, objc_msgSend(v6, "size"), a4);

    if (!v10)
      goto LABEL_10;
  }
  else
  {
    -[SKDiskImage imageURL](self, "imageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithURL:size:error:", v11, objc_msgSend(v6, "size"), a4);

    -[SKDiskImage setDiParams:](self, "setDiParams:", v10);
    if (!v10)
    {
LABEL_10:
      v15 = 0;
      goto LABEL_11;
    }
  }
  v12 = objc_msgSend(v6, "stdinPassPhrase");
  v13 = objc_msgSend(v10, "readPassphraseFlags");
  if (v12)
    v14 = v13 | 8;
  else
    v14 = v13;
  objc_msgSend(v10, "setReadPassphraseFlags:", v14);
  if (!objc_msgSend(MEMORY[0x24BE2D0D8], "resizeWithParams:error:", v10, a4))
    goto LABEL_10;
  v15 = objc_msgSend(v10, "size");
LABEL_11:

  return v15;
}

- (id)redactedDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  DIDeviceHandle *deviceHandle;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  deviceHandle = self->_deviceHandle;
  if (deviceHandle)
  {
    -[DIDeviceHandle BSDName](deviceHandle, "BSDName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { device: \"%@\"}>"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { device: \"%@\"}>"), v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  DIDeviceHandle *deviceHandle;
  NSURL *imageURL;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  imageURL = self->_imageURL;
  deviceHandle = self->_deviceHandle;
  if (deviceHandle)
  {
    -[DIDeviceHandle BSDName](deviceHandle, "BSDName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { image URL: \"%@\", device: \"%@\"}>"), v5, imageURL, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { image URL: \"%@\", device: \"%@\"}>"), v5, self->_imageURL, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (DIDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (void)setDeviceHandle:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHandle, a3);
}

- (DIBaseParams)diParams
{
  return self->_diParams;
}

- (void)setDiParams:(id)a3
{
  objc_storeStrong((id *)&self->_diParams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diParams, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

- (id)newShallowResizerWithParams:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  SKDiskImageResizer *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setShallow:", objc_msgSend(v6, "shallow"));
  objc_msgSend(v7, "setStdinPassPhrase:", objc_msgSend(v6, "stdinPassPhrase"));
  -[SKDiskImage resizeLimitsShallowInternalWithLimitsParams:error:](self, "resizeLimitsShallowInternalWithLimitsParams:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[SKDiskImageResizerBase initWithDiskImage:limits:resizeParams:error:]([SKDiskImageResizer alloc], "initWithDiskImage:limits:resizeParams:error:", self, v8, v6, a4);
  }
  else
  {
    SKGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[SKDiskImage(Resize) newShallowResizerWithParams:error:]";
      _os_log_impl(&dword_22FE50000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to get shallow limits", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)newResizerWithParams:(id)a3 error:(id *)a4
{
  id v6;
  SKDiskImagePartitionLessResizer *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  SKLastPartitions *v14;
  void *v15;
  void *v16;
  __objc2_class **v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  SKDiskImagePartitionLessResizer *v24;
  int v26;
  SKLastPartitions *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!objc_msgSend(v6, "shallow"))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setShallow:", objc_msgSend(v6, "shallow"));
    objc_msgSend(v8, "setStdinPassPhrase:", objc_msgSend(v6, "stdinPassPhrase"));
    -[SKDiskImage resizeLimitsInternalWithLimitsParams:error:](self, "resizeLimitsInternalWithLimitsParams:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SKDiskImage deduceDiskWithError:](self, "deduceDiskWithError:", a4);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        -[NSObject type](v10, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = +[SKDiskImageSizeLimits isSupportedWholeDisk:](SKDiskImageSizeLimits, "isSupportedWholeDisk:", v12);

        if (v13)
        {
          v14 = -[SKLastPartitions initWithDisk:]([SKLastPartitions alloc], "initWithDisk:", v11);
          -[SKLastPartitions resizablePart](v14, "resizablePart");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "type");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", kSKDiskTypeAPFSPS[0]))
          {

            v17 = off_24FDBF410;
          }
          else
          {
            -[SKLastPartitions resizablePart](v14, "resizablePart");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "type");
            v27 = v14;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v21, "isEqualToString:", kSKDiskTypeHFS[0]);

            v14 = v27;
            v17 = off_24FDBF428;
            if (v26)
              v17 = off_24FDBF410;
          }
          v7 = (SKDiskImagePartitionLessResizer *)objc_msgSend(objc_alloc(*v17), "initWithDiskImage:limits:resizeParams:error:", self, v9, v6, a4);

          goto LABEL_23;
        }
        -[NSObject type](v11, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEqualToString:", kSKDiskTypeAPFSPS[0]))
        {

        }
        else
        {
          -[NSObject type](v11, "type");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", kSKDiskTypeHFS[0]);

          if (!v23)
          {
            -[NSObject ejectWithError:](v11, "ejectWithError:", 0);
            +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 45, a4);
            v24 = (SKDiskImagePartitionLessResizer *)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
        }
        v24 = -[SKDiskImageResizerBase initWithDiskImage:limits:resizeParams:error:]([SKDiskImagePartitionLessResizer alloc], "initWithDiskImage:limits:resizeParams:error:", self, v9, v6, a4);
LABEL_22:
        v7 = v24;
        goto LABEL_23;
      }
      SKGetOSLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[SKDiskImage(Resize) newResizerWithParams:error:]";
        _os_log_impl(&dword_22FE50000, v18, OS_LOG_TYPE_ERROR, "%s: Failed to get root disk of disk image", buf, 0xCu);
      }

    }
    else
    {
      SKGetOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[SKDiskImage(Resize) newResizerWithParams:error:]";
        _os_log_impl(&dword_22FE50000, v11, OS_LOG_TYPE_ERROR, "%s: Failed to get limits", buf, 0xCu);
      }
    }
    v7 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v7 = -[SKDiskImage newShallowResizerWithParams:error:](self, "newShallowResizerWithParams:error:", v6, a4);
LABEL_24:

  return v7;
}

- (BOOL)resizeWithParams:(id)a3 progress:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  SKDiskImageResizeParams *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  BOOL v22;

  v8 = a3;
  v9 = a4;
  v10 = -[SKDiskImage newResizerWithParams:error:](self, "newResizerWithParams:error:", v8, a5);
  v11 = v10;
  if (!v10)
    goto LABEL_14;
  v12 = objc_msgSend(v10, "requestedSize");
  objc_msgSend(v11, "limits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "currentBytes");

  if (v12 != v14)
  {
    if (objc_msgSend(v11, "requiredSizeForRecoveryMove"))
    {
      v15 = -[SKDiskImageResizeParams initWithSize:]([SKDiskImageResizeParams alloc], "initWithSize:", objc_msgSend(v11, "requiredSizeForRecoveryMove"));
      -[SKDiskImageResizeParams setShallow:](v15, "setShallow:", 1);
      v16 = -[SKDiskImage newResizerWithParams:error:](self, "newResizerWithParams:error:", v15, a5);
      v17 = v16;
      if (!v16
        || (objc_msgSend(v16, "progress"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "chainChildProgress:withPendingUnitCount:", v18, 50),
            v18,
            (objc_msgSend(v17, "resizeWithError:", a5) & 1) == 0))
      {

        goto LABEL_14;
      }
      v19 = -[SKDiskImage newResizerWithParams:error:](self, "newResizerWithParams:error:", v8, a5);

      if (!v19)
      {
        v11 = 0;
        goto LABEL_14;
      }
      v20 = 50;
      v11 = v19;
    }
    else
    {
      v20 = 100;
    }
    objc_msgSend(v11, "progress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chainChildProgress:withPendingUnitCount:", v21, v20);

    if (objc_msgSend(v11, "resizeWithError:", a5))
    {
      objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "totalUnitCount"));
      goto LABEL_12;
    }
LABEL_14:
    v22 = 0;
    goto LABEL_15;
  }
LABEL_12:
  v22 = 1;
LABEL_15:

  return v22;
}

- (BOOL)attachBeforeResizeWithStdinPass:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;

  v5 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPolicy:", 0);
  objc_msgSend(v7, "setIsManagedAttach:", 1);
  objc_msgSend(v7, "setStdinPassPhrase:", objc_msgSend(v7, "stdinPassPhrase") | v5);
  -[SKDiskImage attachWithParams:error:](self, "attachWithParams:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = v8 != 0;

  return (char)a4;
}

- (id)resizeWithParams:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  +[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 100);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKManager sharedManager](SKManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frameworkAsyncOperationsQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __56__SKDiskImage_Resize__resizeWithParams_completionBlock___block_invoke;
  v17[3] = &unk_24FDC0260;
  v20 = v7;
  v17[4] = self;
  v18 = v6;
  v11 = v8;
  v19 = v11;
  v12 = v6;
  v13 = v7;
  dispatch_async(v10, v17);

  v14 = v19;
  v15 = v11;

  return v15;
}

void __56__SKDiskImage_Resize__resizeWithParams_completionBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;

  if (objc_msgSend(*(id *)(a1 + 32), "isAttached"))
  {
    v12 = 0;
    +[SKError failWithPOSIXCode:error:](SKError, "failWithPOSIXCode:error:", 16, &v12);
    v2 = v12;
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "stdinPassPhrase");
    v11 = 0;
    v5 = objc_msgSend(v3, "attachBeforeResizeWithStdinPass:error:", v4, &v11);
    v2 = v11;
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v10 = v2;
      objc_msgSend(v6, "resizeWithParams:progress:error:", v7, v8, &v10);
      v9 = v10;

      v2 = v9;
    }
    objc_msgSend(*(id *)(a1 + 32), "ejectWithError:", 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)resize:(id)a3 completionBlock:(id)a4
{
  id v4;

  v4 = -[SKDiskImage resizeWithParams:completionBlock:](self, "resizeWithParams:completionBlock:", a3, a4);
}

- (id)resizeLimitsShallowInternalWithLimitsParams:(id)a3 error:(id *)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  SKLastPartitions *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  -[SKDiskImage deduceDiskWithError:](self, "deduceDiskWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SKGetOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_22FE50000, v7, OS_LOG_TYPE_ERROR, "%s: Failed to attach disk image", buf, 0xCu);
    }
    goto LABEL_22;
  }
  v7 = objc_opt_new();
  if (!-[SKDiskImage retrieveDIInfoWithParams:error:](self, "retrieveDIInfoWithParams:error:", v7, a4))
  {
LABEL_22:
    v21 = 0;
    goto LABEL_40;
  }
  -[NSObject imageInfo](v7, "imageInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKDiskImageInfoParams size_info_key](SKDiskImageInfoParams, "size_info_key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKDiskImageInfoParams format_info_key](SKDiskImageInfoParams, "format_info_key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Max Size Bytes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v46 = v13;
    v14 = objc_msgSend(v13, "unsignedLongLongValue");
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("RAW")))
    {
      +[SKManager syncSharedManager](SKManager, "syncSharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKDiskImage imageURL](self, "imageURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "diskForPath:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = objc_msgSend(v46, "unsignedLongLongValue");
        v20 = objc_msgSend(v18, "freeSpace");
        if (v19 >= v20)
          v14 = v20;
        else
          v14 = v19;
      }

    }
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setCurrentBytes:", objc_msgSend(v6, "unformattedSize"));
    v22 = objc_msgSend(v21, "currentBytes");
    if (v22 <= v14)
      v23 = v14;
    else
      v23 = v22;
    objc_msgSend(v21, "setMaxBytes:", v23);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Min Size Bytes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = objc_msgSend(v24, "unsignedLongLongValue");
      v27 = objc_msgSend(v21, "currentBytes");
      if (v26 >= v27)
        v28 = v27;
      else
        v28 = v26;
    }
    else
    {
      v28 = objc_msgSend(v21, "currentBytes");
    }
    objc_msgSend(v21, "setMinBytes:", v28, v12);
    v31 = -[SKLastPartitions initWithDisk:]([SKLastPartitions alloc], "initWithDisk:", v6);
    SKGetOSLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      -[SKLastPartitions resizablePart](v31, "resizablePart");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
      v49 = 2112;
      v50 = v33;
      v51 = 2048;
      v52 = -[SKLastPartitions nonResizableSize](v31, "nonResizableSize");
      _os_log_impl(&dword_22FE50000, v32, OS_LOG_TYPE_DEFAULT, "%s: Resizable partition: %@, non-resizable size: %lld bytes", buf, 0x20u);

    }
    -[SKLastPartitions resizablePart](v31, "resizablePart");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = objc_msgSend(v21, "minBytes");
      v36 = objc_msgSend(v34, "startLocation");
      v37 = objc_msgSend(v34, "unformattedSize") + v36;
      v38 = v35 <= v37 ? v37 : v35;
      objc_msgSend(v21, "setMinBytes:", v38);
      if ((objc_msgSend(v34, "isEqual:", v6) & 1) == 0)
      {
        objc_msgSend(v6, "type");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setMinBytes:", objc_msgSend(v21, "minBytes")+ +[SKLastPartitions secondaryPartitionTableSizeWithDiskType:](SKLastPartitions, "secondaryPartitionTableSizeWithDiskType:", v39));

        -[SKLastPartitions recoveryPart](v31, "recoveryPart");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          SKGetOSLog();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            -[SKLastPartitions recoveryPart](v31, "recoveryPart");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
            v49 = 2112;
            v50 = v42;
            _os_log_impl(&dword_22FE50000, v41, OS_LOG_TYPE_DEFAULT, "%s: Recovery partition: %@", buf, 0x16u);

          }
          -[SKLastPartitions recoveryPart](v31, "recoveryPart");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setMinBytes:", objc_msgSend(v21, "minBytes") + objc_msgSend(v43, "unformattedSize"));

        }
      }
    }
    alignResizeLimits(v21);
    objc_claimAutoreleasedReturnValue();

    v12 = v45;
  }
  else
  {
    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &__block_literal_global_7);

    SKGetOSLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_22FE50000, v30, OS_LOG_TYPE_FAULT, "%s: Failed to inspect size info", buf, 0xCu);
    }

    -[SKDiskImage setDeviceHandle:](self, "setDeviceHandle:", 0);
    +[SKError nilWithPOSIXCode:error:](SKError, "nilWithPOSIXCode:error:", 22, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_40:
  return v21;
}

id __73__SKDiskImage_Resize__resizeLimitsShallowInternalWithLimitsParams_error___block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKDiskImage+Resize.m", 175);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)resizeLimitsInternalWithLimitsParams:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  SKLastPartitions *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SKDiskImage resizeLimitsShallowInternalWithLimitsParams:error:](self, "resizeLimitsShallowInternalWithLimitsParams:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SKDiskImage deduceDiskWithError:](self, "deduceDiskWithError:", a4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v7, "physicalStoreMinimumSizeFromStore:", v8);
LABEL_13:
        objc_msgSend(v7, "setMinBytes:", v9);
LABEL_26:
        alignResizeLimits(v7);
        objc_claimAutoreleasedReturnValue();
        v11 = v7;
        goto LABEL_27;
      }
      -[NSObject type](v8, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", kSKDiskTypeHFS[0]);

      if (v13)
      {
        v9 = +[SKLastPartitions hfsMinimalSizeForDisk:currentSize:](SKLastPartitions, "hfsMinimalSizeForDisk:currentSize:", v8, 0);
        goto LABEL_13;
      }
      v14 = -[SKLastPartitions initWithDisk:]([SKLastPartitions alloc], "initWithDisk:", v8);
      -[SKLastPartitions resizablePart](v14, "resizablePart");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = objc_msgSend(v15, "totalSpace");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = objc_msgSend(v7, "physicalStoreMinimumSizeFromStore:", v16);
          goto LABEL_19;
        }
        objc_msgSend(v16, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", kSKDiskTypeHFS[0]);

        if (v20)
        {
          v18 = +[SKLastPartitions hfsMinimalSizeForDisk:currentSize:](SKLastPartitions, "hfsMinimalSizeForDisk:currentSize:", v16, 0);
LABEL_19:
          v21 = v18;
          if (v18 != -1)
          {
            -[NSObject type](v8, "type");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = +[SKLastPartitions secondaryPartitionTableSizeWithDiskType:](SKLastPartitions, "secondaryPartitionTableSizeWithDiskType:", v22);

            v24 = objc_msgSend(v16, "startLocation");
            if (v17 >= v21)
              v25 = v21;
            else
              v25 = v17;
            objc_msgSend(v7, "setMinBytes:", v23 + v24 + v25);
            -[SKLastPartitions recoveryPart](v14, "recoveryPart");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              -[SKLastPartitions recoveryPart](v14, "recoveryPart");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setMinBytes:", objc_msgSend(v7, "minBytes") + objc_msgSend(v27, "totalSpace"));

            }
          }
        }
      }

      goto LABEL_26;
    }
    SKGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v29 = 136315138;
      v30 = "-[SKDiskImage(Resize) resizeLimitsInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_22FE50000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to attach disk image", (uint8_t *)&v29, 0xCu);
    }

  }
  else
  {
    SKGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v29 = 136315138;
      v30 = "-[SKDiskImage(Resize) resizeLimitsInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_22FE50000, v8, OS_LOG_TYPE_ERROR, "%s: Failed to get limits", (uint8_t *)&v29, 0xCu);
    }
  }
  v11 = 0;
LABEL_27:

  return v11;
}

- (id)resizeLimitsWithLimitsParams:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[SKDiskImage isAttached](self, "isAttached");
  if (-[SKDiskImage attachBeforeResizeWithStdinPass:error:](self, "attachBeforeResizeWithStdinPass:error:", objc_msgSend(v6, "stdinPassPhrase"), a4))
  {
    if (objc_msgSend(v6, "shallow"))
      -[SKDiskImage resizeLimitsShallowInternalWithLimitsParams:error:](self, "resizeLimitsShallowInternalWithLimitsParams:error:", v6, a4);
    else
      -[SKDiskImage resizeLimitsInternalWithLimitsParams:error:](self, "resizeLimitsInternalWithLimitsParams:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!v7)
        -[SKDiskImage ejectWithError:](self, "ejectWithError:", 0);
      -[SKDiskImage setDeviceHandle:](self, "setDeviceHandle:", 0);
      v9 = v8;
    }
    else
    {
      SKGetOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315138;
        v13 = "-[SKDiskImage(Resize) resizeLimitsWithLimitsParams:error:]";
        _os_log_impl(&dword_22FE50000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to get limits", (uint8_t *)&v12, 0xCu);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)resizeLimitsWithError:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  -[SKDiskImage resizeLimitsWithLimitsParams:error:](self, "resizeLimitsWithLimitsParams:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
