@implementation SidecarService_Camera

- (id)mutableRequestMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v8;
  void *v9;
  NSString *v10;
  CGFloat width;
  CGFloat height;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;
  NSSize v23;
  NSSize v24;

  v22 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)SidecarService_Camera;
  -[SidecarService mutableRequestMessage](&v19, sel_mutableRequestMessage);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("ContinuityCameraImageQuality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ContinuityCameraImageQuality"));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "doubleValue");
      if (v6 > 0.0 && v6 <= 1.0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ContinuityCameraImageQuality"));

      }
    }
  }
  objc_msgSend(v4, "stringForKey:", CFSTR("ContinuityCameraImageSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(&unk_24E5E69A8, "containsObject:", v10))
    {
      objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ContinuityCameraImageSize"));
    }
    else
    {
      v23 = NSSizeFromString(v10);
      width = v23.width;
      height = v23.height;
      if (!NSEqualSizes(v23, *MEMORY[0x24BDD1410]))
      {
        v24.width = width;
        v24.height = height;
        NSStringFromSize(v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ContinuityCameraImageSize"));

      }
    }
  }
  objc_msgSend(v4, "stringForKey:", CFSTR("ContinuityCameraImageType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "_typeWithIdentifier:allowUndeclared:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "conformsToType:", *MEMORY[0x24BDF8410]))
      objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ContinuityCameraImageType"));

  }
  if (objc_msgSend(v3, "count"))
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v3;
      _os_log_impl(&dword_220044000, v17, OS_LOG_TYPE_INFO, "defaults: %{public}@", buf, 0xCu);
    }

    SidecarMessageSetDefaults(v2, (const char *)v3);
  }

  return v2;
}

- (id)serviceIdentifier
{
  return CFSTR("com.apple.sidecar.camera");
}

- (id)serviceExtension
{
  return CFSTR("com.apple.sidecar.extension.camera");
}

- (id)localizedDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return SidecarLocalizedString(CFSTR("Take Photo"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)localizedItemName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return SidecarLocalizedString(CFSTR("Image"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)name
{
  __CFString *v2;

  v2 = CFSTR("SidecarServiceNameTakePhoto");
  return CFSTR("SidecarServiceNameTakePhoto");
}

+ (id)returnTypes
{
  if (returnTypes_once_543 != -1)
    dispatch_once(&returnTypes_once_543, &__block_literal_global_544);
  return (id)returnTypes_types_545;
}

+ (int64_t)minimumRapportVersion
{
  return 1600000;
}

@end
