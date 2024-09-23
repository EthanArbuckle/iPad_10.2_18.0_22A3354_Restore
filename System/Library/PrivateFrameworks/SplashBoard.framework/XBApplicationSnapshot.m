@implementation XBApplicationSnapshot

- (id)imageForInterfaceOrientation:(int64_t)a3 generationOptions:(unint64_t)a4
{
  void *v7;

  -[XBApplicationSnapshot beginImageAccess](self, "beginImageAccess");
  -[XBApplicationSnapshot loadImageWithGenerationOptions:](self, "loadImageWithGenerationOptions:", a4);
  -[XBApplicationSnapshot cachedImageForInterfaceOrientation:](self, "cachedImageForInterfaceOrientation:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshot endImageAccess](self, "endImageAccess");
  return v7;
}

- (void)loadImageWithGenerationOptions:(unint64_t)a3
{
  os_unfair_lock_s *p_loadImageLock;
  XBApplicationSnapshot *v6;
  XBApplicationSnapshotGenerationContext *v7;
  XBApplicationSnapshotGenerationContext *generationContext;
  void *v9;
  _QWORD block[5];

  -[XBApplicationSnapshot beginImageAccess](self, "beginImageAccess");
  p_loadImageLock = &self->_loadImageLock;
  os_unfair_lock_assert_not_owner(&self->_loadImageLock);
  os_unfair_lock_lock(&self->_loadImageLock);
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_cachedImage)
    goto LABEL_2;
  generationContext = v6->_generationContext;
  if (generationContext)
  {
    v7 = generationContext;
    goto LABEL_5;
  }
  if (v6->_path)
  {
    -[XBApplicationSnapshot _locked_synchronized_loadImageViaFile](v6, "_locked_synchronized_loadImageViaFile");
LABEL_2:
    v7 = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  if (!v6->_imageGenerator)
    goto LABEL_2;
  v9 = (void *)MEMORY[0x219A10DF4]();
  v7 = 0;
LABEL_6:
  objc_sync_exit(v6);

  if (v7)
  {
    -[XBApplicationSnapshot _locked_loadImageViaGenerationContext:options:](v6, "_locked_loadImageViaGenerationContext:options:", v7, a3);
  }
  else if (v9)
  {
    -[XBApplicationSnapshot _locked_loadImageViaGeneratorFunction:](v6, "_locked_loadImageViaGeneratorFunction:", v9);
  }
  os_unfair_lock_unlock(p_loadImageLock);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__XBApplicationSnapshot_loadImageWithGenerationOptions___block_invoke;
  block[3] = &unk_24D7F4328;
  block[4] = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)beginImageAccess
{
  XBApplicationSnapshot *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_imageAccessCount;
  objc_sync_exit(obj);

}

- (id)cachedImageForInterfaceOrientation:(int64_t)a3
{
  XBApplicationSnapshot *v4;
  XBApplicationSnapshotImage *v5;

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_cachedImage)
    v5 = -[XBApplicationSnapshotImage initWithSnapshot:interfaceOrientation:]([XBApplicationSnapshotImage alloc], "initWithSnapshot:interfaceOrientation:", v4, a3);
  else
    v5 = 0;
  objc_sync_exit(v4);

  return v5;
}

- (void)_locked_synchronized_loadImageViaFile
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_217702000, v4, v5, "Loading image failed file load for %{public}@ : %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)endImageAccess
{
  XBApplicationSnapshot *v3;
  unint64_t imageAccessCount;
  void *v5;
  XBApplicationSnapshot *obj;

  obj = self;
  objc_sync_enter(obj);
  v3 = obj;
  imageAccessCount = obj->_imageAccessCount;
  if (!imageAccessCount)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("XBApplicationSnapshot.m"), 807, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_imageAccessCount != 0"));

    v3 = obj;
    imageAccessCount = obj->_imageAccessCount;
  }
  v3->_imageAccessCount = imageAccessCount - 1;
  -[XBApplicationSnapshot _purgeCachedImageIfAppropriate:](v3, "_purgeCachedImageIfAppropriate:", 0);
  objc_sync_exit(obj);

}

- (void)_purgeCachedImageIfAppropriate:(BOOL)a3
{
  _BOOL4 v3;
  XBApplicationSnapshot *v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  UIImage *cachedImage;
  NSObject *cachedImageTransaction;
  id v13;
  unint64_t imageAccessCount;
  _BOOL4 keepImageAccessUntilExpiration;
  int v16;
  _BOOL4 keepImageAccessForPreHeat;
  int v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (!v3
    && (v4->_imageAccessCount
     || v4->_keepImageAccessUntilExpiration
     || (-[BSAtomicFlag getFlag](v4->_hasProtectedContent, "getFlag") & 1) != 0
     || v4->_keepImageAccessForPreHeat))
  {
    if (v4->_cachedImage)
    {
      XBLogSnapshot();
      cachedImageTransaction = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(cachedImageTransaction, OS_LOG_TYPE_INFO))
      {
        -[XBApplicationSnapshot logIdentifier](v4, "logIdentifier");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        imageAccessCount = v4->_imageAccessCount;
        keepImageAccessUntilExpiration = v4->_keepImageAccessUntilExpiration;
        v16 = -[BSAtomicFlag getFlag](v4->_hasProtectedContent, "getFlag");
        keepImageAccessForPreHeat = v4->_keepImageAccessForPreHeat;
        v18 = 138544642;
        v19 = v13;
        v20 = 1024;
        v21 = 0;
        v22 = 2048;
        v23 = imageAccessCount;
        v24 = 1024;
        v25 = keepImageAccessUntilExpiration;
        v26 = 1024;
        v27 = v16;
        v28 = 1024;
        v29 = keepImageAccessForPreHeat;
        _os_log_impl(&dword_217702000, cachedImageTransaction, OS_LOG_TYPE_INFO, "%{public}@ not purging the cached image; force: %d; _imageAccessCount: %lu; _keepImageAccessUntilExpiration: %"
          "d; _hasProtectedContent: %d; _keepImageAccessForPreheat: %d",
          (uint8_t *)&v18,
          0x2Eu);

      }
LABEL_13:

    }
  }
  else if (v4->_cachedImage)
  {
    XBLogSnapshot();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[XBApplicationSnapshot logIdentifier](v4, "logIdentifier");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v4->_imageAccessCount;
      v8 = v4->_keepImageAccessUntilExpiration;
      v9 = -[BSAtomicFlag getFlag](v4->_hasProtectedContent, "getFlag");
      v10 = v4->_keepImageAccessForPreHeat;
      v18 = 138544642;
      v19 = v6;
      v20 = 1024;
      v21 = v3;
      v22 = 2048;
      v23 = v7;
      v24 = 1024;
      v25 = v8;
      v26 = 1024;
      v27 = v9;
      v28 = 1024;
      v29 = v10;
      _os_log_impl(&dword_217702000, v5, OS_LOG_TYPE_INFO, "%{public}@ Purging the cached image; force: %d; _imageAccessCount: %lu; _keepImageAccessUntilExpiration: %d; _ha"
        "sProtectedContent: %d; _keepImageAccessForPreheat: %d",
        (uint8_t *)&v18,
        0x2Eu);

    }
    cachedImage = v4->_cachedImage;
    v4->_cachedImage = 0;

    cachedImageTransaction = v4->_cachedImageTransaction;
    v4->_cachedImageTransaction = 0;
    goto LABEL_13;
  }
  objc_sync_exit(v4);

}

- (NSString)logIdentifier
{
  XBApplicationSnapshot *v2;
  void *v3;
  void *v4;
  NSString *baseLogIdentifier;
  void *v6;
  uint64_t v7;
  NSString *logIdentifier;
  NSString *v9;
  NSString *v10;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_logContainerIdentifierDirty)
  {
    -[XBApplicationSnapshot containerIdentity](v2, "containerIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    baseLogIdentifier = v2->_baseLogIdentifier;
    if (v3)
    {
      objc_msgSend(v3, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingFormat:](baseLogIdentifier, "stringByAppendingFormat:", CFSTR(" [%@]"), v6);
      v7 = objc_claimAutoreleasedReturnValue();
      logIdentifier = v2->_logIdentifier;
      v2->_logIdentifier = (NSString *)v7;

    }
    else
    {
      v9 = baseLogIdentifier;
      v6 = v2->_logIdentifier;
      v2->_logIdentifier = v9;
    }

    v2->_logContainerIdentifierDirty = 0;
  }
  v10 = v2->_logIdentifier;
  objc_sync_exit(v2);

  return v10;
}

- (XBSnapshotContainerIdentity)containerIdentity
{
  return (XBSnapshotContainerIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (void)clearImageGenerator
{
  id imageGenerator;
  NSString *dataProviderClassName;
  XBApplicationSnapshot *obj;

  obj = self;
  objc_sync_enter(obj);
  imageGenerator = obj->_imageGenerator;
  obj->_imageGenerator = 0;

  dataProviderClassName = obj->_dataProviderClassName;
  obj->_dataProviderClassName = 0;

  objc_sync_exit(obj);
}

- (BOOL)isValidWithReason:(id *)a3
{
  XBApplicationSnapshot *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;

  v4 = self;
  objc_sync_enter(v4);
  if (-[XBApplicationSnapshot isExpired](v4, "isExpired"))
  {
    if (a3)
    {
      -[XBApplicationSnapshot expirationDate](v4, "expirationDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v5);
      objc_msgSend(v6, "stringWithFormat:", CFSTR("expired. expirationDate: %@; how long ago (seconds): %f"), v5, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v9 = 0;
LABEL_9:

      goto LABEL_14;
    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (!-[XBApplicationSnapshot hasCachedImage](v4, "hasCachedImage")
    && !-[XBApplicationSnapshot _hasGenerationContext](v4, "_hasGenerationContext"))
  {
    -[XBApplicationSnapshot imageGenerator](v4, "imageGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v9 = 1;
      goto LABEL_9;
    }
    if (!-[XBApplicationSnapshot fileExists](v4, "fileExists"))
    {
      if (a3)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        -[XBApplicationSnapshot path](v4, "path");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("no cached image. no generation context. no image generator. no file at path: %@"), v5);
        v9 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      goto LABEL_13;
    }
  }
  v9 = 1;
LABEL_14:
  objc_sync_exit(v4);

  return v9;
}

- (BOOL)isExpired
{
  XBApplicationSnapshot *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[XBApplicationSnapshot _synchronized_isExpired](v2, "_synchronized_isExpired");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_synchronized_isExpired
{
  NSDate *expirationDate;
  void *v3;

  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(expirationDate) = -[NSDate isAfterDate:](expirationDate, "isAfterDate:", v3) ^ 1;

  }
  return (char)expirationDate;
}

- (BOOL)hasCachedImage
{
  XBApplicationSnapshot *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[XBApplicationSnapshot _synchronized_hasCachedImage:](v2, "_synchronized_hasCachedImage:", 0);
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_synchronized_hasCachedImage:(id *)a3
{
  UIImage *cachedImage;
  void *v6;
  unint64_t imageAccessCount;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  cachedImage = self->_cachedImage;
  if (a3 && cachedImage)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    imageAccessCount = self->_imageAccessCount;
    if (self->_keepImageAccessUntilExpiration)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    if (-[BSAtomicFlag getFlag](self->_hasProtectedContent, "getFlag"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    if (self->_keepImageAccessForPreHeat)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("_imageAccessCount: %lu; _keepImageAccessUntilExpiration: %@; _hasProtectedContent: %@; _keepImageAccessForPreHeat: %@"),
      imageAccessCount,
      v8,
      v9,
      v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return cachedImage != 0;
}

- (BOOL)_hasGenerationContext
{
  XBApplicationSnapshot *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_generationContext != 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)imageGenerator
{
  XBApplicationSnapshot *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x219A10DF4](v2->_imageGenerator);
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)fileExists
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[XBApplicationSnapshot path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    XBLogSnapshot();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_217702000, v7, OS_LOG_TYPE_INFO, "%{public}@ we have a path but it doesn't exist: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    goto LABEL_7;
  }
  v6 = 1;
LABEL_8:

  return v6;
}

- (NSString)path
{
  XBApplicationSnapshot *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSString copy](v2->_path, "copy");
  objc_sync_exit(v2);

  return (NSString *)v3;
}

+ (id)normalizeSnapshotName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a3, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("png"));

    if (!v6)
    {
      objc_msgSend(v4, "stringByDeletingPathExtension");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Default")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF7500]) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (XBStatusBarSettings)statusBarSettings
{
  return self->_statusBarSettings;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (NSString)requiredOSVersion
{
  return self->_requiredOSVersion;
}

- (double)imageScale
{
  return self->_imageScale;
}

- (NSString)_sortableName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[XBApplicationSnapshot name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    FAKE_NIL_PTR();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)_sortableScheme
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[XBApplicationSnapshot scheme](self, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    FAKE_NIL_PTR();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (XBDisplayEdgeInsetsWrapper)customSafeAreaInsets
{
  return self->_customSafeAreaInsets;
}

- (id)_cachedImage
{
  XBApplicationSnapshot *v2;
  UIImage *cachedImage;
  UIImage *v4;

  v2 = self;
  objc_sync_enter(v2);
  cachedImage = v2->_cachedImage;
  if (cachedImage)
    v4 = cachedImage;
  objc_sync_exit(v2);

  return cachedImage;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __56__XBApplicationSnapshot_loadImageWithGenerationOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endImageAccess");
}

- (BOOL)isImageOpaque
{
  return self->_imageOpaque;
}

- (unint64_t)_interfaceOrientationMask
{
  return 1 << -[XBApplicationSnapshot interfaceOrientation](self, "interfaceOrientation");
}

- (void)encodeWithCoder:(id)a3
{
  NSString *relativePath;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_scheme, CFSTR("scheme"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_variantID, CFSTR("variantID"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_groupID, CFSTR("groupID"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_requiredOSVersion, CFSTR("requiredOSVersion"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_launchInterfaceIdentifier, CFSTR("launchInterfaceIdentifier"));
  relativePath = self->_relativePath;
  if (relativePath)
  {
    v5 = CFSTR("relativePath");
  }
  else
  {
    objc_msgSend(v10, "encodeObject:forKey:", self->_path, CFSTR("path"));
    relativePath = self->_filename;
    v5 = CFSTR("filename");
  }
  objc_msgSend(v10, "encodeObject:forKey:", relativePath, v5);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_fileLocation, CFSTR("fileLocation"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_lastUsedDate, CFSTR("lastUsedDate"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_contentType, CFSTR("contentType"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_fullScreen, CFSTR("fullScreen"));
  if (self->_referenceSize.width != *MEMORY[0x24BDBF148]
    || self->_referenceSize.height != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend(v10, "encodeCGSize:forKey:", CFSTR("referenceSize"));
  }
  if (!CGRectEqualToRect(self->_contentFrame, *MEMORY[0x24BDBF090]))
    objc_msgSend(v10, "encodeCGRect:forKey:", CFSTR("contentFrame"), self->_contentFrame.origin.x, self->_contentFrame.origin.y, self->_contentFrame.size.width, self->_contentFrame.size.height);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_interfaceOrientation, CFSTR("interfaceOrientation"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_userInterfaceStyle, CFSTR("userInterfaceStyle"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_customSafeAreaInsets, CFSTR("customSafeAreaInsets"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_imageOpaque, CFSTR("imageOpaque"));
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("imageScale"), self->_imageScale);
  objc_msgSend(v10, "encodeObject:forKey:", self->_statusBarSettings, CFSTR("statusBarSettings"));
  UIApplicationSceneStringForClassicMode();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("classicMode"));

  UIApplicationSceneStringForCompatibilityMode();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("compatibilityMode"));

  objc_msgSend(MEMORY[0x24BDF6800], "_stringForBackgroundStyle:", self->_backgroundStyle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("backgroundStyle"));

  -[XBApplicationSnapshot extendedData](self, "extendedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("extendedData"));

  if (-[NSMutableDictionary count](self->_variantsByID, "count"))
    objc_msgSend(v10, "encodeObject:forKey:", self->_variantsByID, CFSTR("variants"));

}

- (NSDictionary)extendedData
{
  return (NSDictionary *)objc_getProperty(self, a2, 296, 1);
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (CGRectEqualToRect(self->_contentFrame, *MEMORY[0x24BDBF090]))
  {
    -[XBApplicationSnapshot _referenceBounds](self, "_referenceBounds");
  }
  else
  {
    x = self->_contentFrame.origin.x;
    y = self->_contentFrame.origin.y;
    width = self->_contentFrame.size.width;
    height = self->_contentFrame.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_referenceBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  BSRectWithSize();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE38398], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_variantID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:", self->_groupID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

uint64_t __33__XBApplicationSnapshot_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualStrings();

  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void)setStatusBarSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setReferenceSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v8;

  height = a3.height;
  width = a3.width;
  if (a3.width == *MEMORY[0x24BDBF148] && a3.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 530, CFSTR("invalid reference size set by client"));

  }
  self->_referenceSize.width = width;
  self->_referenceSize.height = height;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setLaunchInterfaceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void)setImageScale:(double)a3
{
  self->_imageScale = a3;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (void)setCustomSafeAreaInsets:(id)a3
{
  objc_storeStrong((id *)&self->_customSafeAreaInsets, a3);
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (void)_locked_loadImageViaGenerationContext:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;
  XBApplicationSnapshot *v13;
  NSObject *v14;
  NSObject *p_super;
  XBApplicationSnapshotGenerationContext *generationContext;
  void *v17;
  XBApplicationSnapshot *v18;
  XBApplicationSnapshotGenerationContext *v19;
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_assert_owner(&self->_loadImageLock);
  XBLogSnapshot();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    -[XBApplicationSnapshot containerIdentity](self, "containerIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = (uint64_t)v9;
    v27 = 2114;
    v28 = CFSTR("generationContext");
    _os_signpost_emit_with_name_impl(&dword_217702000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SnapshotImageLoading", "BundleIdOverride=%{public, signpost.description:attribute}@ imageSource=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ", buf, 0x16u);

  }
  +[XBLaunchImageProvider sharedInstance](XBLaunchImageProvider, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v10, "createLaunchImageGeneratorWithContext:asyncImageData:error:", v6, v4 & 1, &v24);
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v12 = v24;

  v13 = self;
  objc_sync_enter(v13);
  if (v11)
  {
    -[XBApplicationSnapshot setExpirationDate:](v13, "setExpirationDate:", 0);
    objc_sync_exit(v13);

    XBLogCapture();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[XBApplicationSnapshot _locked_loadImageViaGenerationContext:options:].cold.2(v13);

    ((void (**)(_QWORD, XBApplicationSnapshot *))v11)[2](v11, v13);
    XBLogCapture();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      -[XBApplicationSnapshot _locked_loadImageViaGenerationContext:options:].cold.1(v13);
  }
  else
  {
    generationContext = v13->_generationContext;
    v13->_generationContext = 0;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[XBApplicationSnapshot setExpirationDate:](v13, "setExpirationDate:", v17);

    objc_sync_exit(v13);
    p_super = &v13->super;
  }

  v18 = v13;
  objc_sync_enter(v18);
  v19 = v18->_generationContext;
  v18->_generationContext = 0;

  -[XBApplicationSnapshot clearImageGenerator](v18, "clearImageGenerator");
  objc_sync_exit(v18);

  if (v12
    && (objc_msgSend(v12, "domain"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("XBLaunchStoryboardErrorDomain")),
        v20,
        v21))
  {
    v22 = objc_msgSend(v12, "code");
  }
  else
  {
    v22 = 0;
  }
  XBLogSnapshot();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v23))
  {
    *(_DWORD *)buf = 134349056;
    v26 = v22;
    _os_signpost_emit_with_name_impl(&dword_217702000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SnapshotImageLoading", "error=%{public, signpost.telemetry:number1}zu enableTelemetry=YES ", buf, 0xCu);
  }

}

- (void)setExpirationDate:(id)a3
{
  NSDate *v5;
  XBApplicationSnapshot *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  NSDate *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (NSDate *)a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_expirationDate != v5)
  {
    if (v5)
    {
      XBLogSnapshot();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[XBApplicationSnapshot logIdentifier](v6, "logIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v8;
        v12 = 2114;
        v13 = v5;
        _os_log_impl(&dword_217702000, v7, OS_LOG_TYPE_INFO, "%{public}@ Set expiration date to %{public}@", (uint8_t *)&v10, 0x16u);

      }
    }
    else
    {
      XBLogSnapshot();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[XBApplicationSnapshot logIdentifier](v6, "logIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_217702000, v7, OS_LOG_TYPE_INFO, "%{public}@ Clearing expiration date", (uint8_t *)&v10, 0xCu);

      }
    }

    objc_storeStrong((id *)&v6->_expirationDate, a3);
  }
  -[XBApplicationSnapshot _synchronized_evaluateImageAccessUntilExpirationEnablingIfNecessary:](v6, "_synchronized_evaluateImageAccessUntilExpirationEnablingIfNecessary:", 0);
  objc_sync_exit(v6);

}

- (void)_synchronized_evaluateImageAccessUntilExpirationEnablingIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  if (-[XBApplicationSnapshot _synchronized_isExpired](self, "_synchronized_isExpired"))
  {
    if (self->_keepImageAccessUntilExpiration)
    {
      XBLogSnapshot();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v6;
        _os_log_impl(&dword_217702000, v5, OS_LOG_TYPE_INFO, "%{public}@ Dropping image access until expiration because the expiration has already occurred", (uint8_t *)&v9, 0xCu);

      }
      self->_keepImageAccessUntilExpiration = 0;
      -[XBApplicationSnapshot _purgeCachedImageIfAppropriate:](self, "_purgeCachedImageIfAppropriate:", 0);
    }
  }
  else if (v3)
  {
    XBLogSnapshot();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_217702000, v7, OS_LOG_TYPE_INFO, "%{public}@ Keeping image access on until expiration", (uint8_t *)&v9, 0xCu);

    }
    self->_keepImageAccessUntilExpiration = 1;
  }
}

- (id)_initWithContainerIdentity:(id)a3 store:(id)a4 groupID:(id)a5 generationContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  XBApplicationSnapshot *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  XBSnapshotContainerIdentity *containerIdentity;
  uint64_t v20;
  NSString *groupID;
  NSDate *v22;
  NSDate *creationDate;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerIdentity"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupID"));

LABEL_4:
  v28.receiver = self;
  v28.super_class = (Class)XBApplicationSnapshot;
  v15 = -[XBApplicationSnapshot init](&v28, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[XBApplicationSnapshot _commonInitWithIdentifier:](v15, "_commonInitWithIdentifier:", v17);

    v18 = objc_msgSend(v11, "copy");
    containerIdentity = v15->_containerIdentity;
    v15->_containerIdentity = (XBSnapshotContainerIdentity *)v18;

    objc_storeStrong((id *)&v15->_store, a4);
    v20 = objc_msgSend(v13, "copy");
    groupID = v15->_groupID;
    v15->_groupID = (NSString *)v20;

    v22 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
    creationDate = v15->_creationDate;
    v15->_creationDate = v22;

    v15->_imageScale = 0.0;
    v15->_imageOrientation = 0;
    v15->_interfaceOrientation = 0;
    v15->_userInterfaceStyle = 0;
    v15->_imageOpaque = 1;
    objc_storeStrong((id *)&v15->_generationContext, a6);
    v15->_fileFormat = -1;
  }

  return v15;
}

- (void)_commonInitWithIdentifier:(id)a3
{
  id v4;
  BSAtomicFlag *v5;
  BSAtomicFlag *hasProtectedContent;
  NSString *v7;
  NSString *identifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *variantsByID;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *baseLogIdentifier;
  id v17;

  v4 = a3;
  v5 = (BSAtomicFlag *)objc_opt_new();
  hasProtectedContent = self->_hasProtectedContent;
  self->_hasProtectedContent = v5;

  self->_logContainerIdentifierDirty = 1;
  self->_loadImageLock._os_unfair_lock_opaque = 0;
  v7 = (NSString *)objc_msgSend(v4, "copy");

  identifier = self->_identifier;
  self->_identifier = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  variantsByID = self->_variantsByID;
  self->_variantsByID = v9;

  self->_logContainerIdentifierDirty = 1;
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString componentsSeparatedByString:](self->_identifier, "componentsSeparatedByString:", CFSTR("-"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p; …%@>"), v17, self, v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  baseLogIdentifier = self->_baseLogIdentifier;
  self->_baseLogIdentifier = v15;

}

- (BOOL)isValid
{
  return -[XBApplicationSnapshot isValidWithReason:](self, "isValidWithReason:", 0);
}

- (NSDate)expirationDate
{
  XBApplicationSnapshot *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_expirationDate;
  objc_sync_exit(v2);

  return v3;
}

- (id)variants
{
  return (id)-[NSMutableDictionary allValues](self->_variantsByID, "allValues");
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_imageAccessCount)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_imageAccessCount == 0"));

  }
  -[XBApplicationSnapshot _invalidate](self, "_invalidate");
  v5.receiver = self;
  v5.super_class = (Class)XBApplicationSnapshot;
  -[XBApplicationSnapshot dealloc](&v5, sel_dealloc);
}

- (void)_invalidate
{
  XBApplicationSnapshot *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_invalidated)
  {
    v2->_invalidated = 1;
    XBLogSnapshot();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[XBApplicationSnapshot logIdentifier](v2, "logIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_217702000, v3, OS_LOG_TYPE_INFO, "%{public}@ Invalidating snapshot", (uint8_t *)&v5, 0xCu);

    }
  }
  *(_WORD *)&v2->_keepImageAccessUntilExpiration = 0;
  objc_sync_exit(v2);

  -[XBApplicationSnapshot _purgeCachedImageIfAppropriate:](v2, "_purgeCachedImageIfAppropriate:", 1);
}

- (NSString)variantID
{
  return self->_variantID;
}

- (BOOL)_shouldDeleteFileOnPurge:(id *)a3
{
  uint64_t v5;
  unint64_t contentType;
  const __CFString *v7;

  v5 = XBApplicationSnapshotContentTypeMaskForContentType(self->_contentType) & 3;
  if (a3 && v5)
  {
    contentType = self->_contentType;
    if (contentType > 2)
      v7 = CFSTR("{!InvalidType!}");
    else
      v7 = off_24D7F4858[contentType];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_contentType: %@(%ld)"), v7, self->_contentType);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5 != 0;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (BOOL)isEqual:(id)a3
{
  XBApplicationSnapshot *v4;
  void *v5;
  uint64_t v6;
  XBApplicationSnapshot *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[5];
  XBApplicationSnapshot *v14;
  _QWORD v15[5];
  XBApplicationSnapshot *v16;
  _QWORD v17[5];
  XBApplicationSnapshot *v18;

  v4 = (XBApplicationSnapshot *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE38390], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __33__XBApplicationSnapshot_isEqual___block_invoke;
    v17[3] = &unk_24D7F47C0;
    v17[4] = self;
    v18 = v4;
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __33__XBApplicationSnapshot_isEqual___block_invoke_2;
    v15[3] = &unk_24D7F47C0;
    v15[4] = self;
    v7 = v18;
    v16 = v7;
    v8 = (void *)MEMORY[0x219A10DF4](v15);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __33__XBApplicationSnapshot_isEqual___block_invoke_3;
    v13[3] = &unk_24D7F47C0;
    v13[4] = self;
    v14 = v7;
    v9 = (void *)MEMORY[0x219A10DF4](v13);
    objc_msgSend(v5, "appendEqualsBlocks:", v17, v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual");

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProviderClassName, 0);
  objc_storeStrong(&self->_imageGenerator, 0);
  objc_storeStrong((id *)&self->_customSafeAreaInsets, 0);
  objc_storeStrong((id *)&self->_cachedImageTransaction, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_baseLogIdentifier, 0);
  objc_storeStrong((id *)&self->_hasProtectedContent, 0);
  objc_storeStrong((id *)&self->_extendedData, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_generationContext, 0);
  objc_storeStrong((id *)&self->_statusBarSettings, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_requiredOSVersion, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_launchInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_variantsByID, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

- (XBStatusBarSettings)_sortableStatusBarSettings
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[XBApplicationSnapshot statusBarSettings](self, "statusBarSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    FAKE_NIL_PTR();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (XBStatusBarSettings *)v5;
}

- (unint64_t)_contentTypeMask
{
  return (1 << -[XBApplicationSnapshot contentType](self, "contentType"));
}

- (BOOL)hasProtectedContent
{
  return -[BSAtomicFlag getFlag](self->_hasProtectedContent, "getFlag");
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (XBApplicationSnapshot)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 258, CFSTR("don't do that"));

  return (XBApplicationSnapshot *)-[XBApplicationSnapshot _initWithContainerIdentity:store:groupID:generationContext:](self, "_initWithContainerIdentity:store:groupID:generationContext:", 0, 0, 0, 0);
}

- (NSString)description
{
  return (NSString *)-[XBApplicationSnapshot descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

uint64_t __33__XBApplicationSnapshot_isEqual___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 40), "variantID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualStrings();

  return v2;
}

uint64_t __33__XBApplicationSnapshot_isEqual___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 40), "groupID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualStrings();

  return v2;
}

+ (NSSet)secureCodableCustomExtendedDataClasses
{
  return (NSSet *)(id)objc_msgSend((id)__clientSpecifiedSecureCodableCustomExtendedDataClasses, "copy");
}

+ (void)setSecureCodableCustomExtendedDataClasses:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v10, "conformsToProtocol:", &unk_254F007B8) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("XBApplicationSnapshot.m"), 352, CFSTR("Extended data client class '%@' does not conform to NSSecureCoding"), v10);

        }
        if ((objc_msgSend(v10, "supportsSecureCoding") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("XBApplicationSnapshot.m"), 353, CFSTR("Extended data client class '%@' does not support NSSecureCoding"), v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  v13 = objc_msgSend(v5, "copy");
  v14 = (void *)__clientSpecifiedSecureCodableCustomExtendedDataClasses;
  __clientSpecifiedSecureCodableCustomExtendedDataClasses = v13;

}

+ (id)_allSecureCodingClassesIncludingDefaultAndClientSpecified
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (__clientSpecifiedSecureCodableCustomExtendedDataClasses)
  {
    v13 = (id)__clientSpecifiedSecureCodableCustomExtendedDataClasses;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_msgSend(v12, "unionSet:", v13);

  return v12;
}

+ (BOOL)isValidImageFileExtension:(id)a3
{
  return XBApplicationSnapshotOnDiskFormatForFileExtension(a3) != -1;
}

- (int64_t)_fileLocation
{
  return self->_fileLocation;
}

- (void)_setFileLocation:(int64_t)a3
{
  self->_fileLocation = a3;
}

- (id)_sanitizedPathForPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "fileSystemRepresentationWithPath:", v4);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    XBLogSnapshot();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_217702000, v8, OS_LOG_TYPE_INFO, "%{public}@ received an empty or nil path for _sanitizedPathForPath: %{public}@. That's weird.", (uint8_t *)&v12, 0x16u);

    }
    v7 = v4;
  }
  v10 = v7;

  return v10;
}

- (void)_setPath:(id)a3
{
  id v4;
  XBApplicationSnapshot *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSString *path;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSString isEqualToString:](v5->_path, "isEqualToString:", v4))
  {
    XBLogSnapshot();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[XBApplicationSnapshot logIdentifier](v5, "logIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_217702000, v6, OS_LOG_TYPE_INFO, "%{public}@ Sanitizing new path before set %{public}@", (uint8_t *)&v10, 0x16u);

    }
    -[XBApplicationSnapshot _sanitizedPathForPath:](v5, "_sanitizedPathForPath:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v8;

  }
  objc_sync_exit(v5);

}

- (void)_setRelativePath:(id)a3
{
  id v4;
  XBApplicationSnapshot *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSString *relativePath;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSString isEqualToString:](v5->_relativePath, "isEqualToString:", v4))
  {
    XBLogSnapshot();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[XBApplicationSnapshot logIdentifier](v5, "logIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_217702000, v6, OS_LOG_TYPE_INFO, "%{public}@ Sanitizing new relativePath before set %{public}@", (uint8_t *)&v10, 0x16u);

    }
    -[XBApplicationSnapshot _sanitizedPathForPath:](v5, "_sanitizedPathForPath:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    relativePath = v5->_relativePath;
    v5->_relativePath = (NSString *)v8;

  }
  objc_sync_exit(v5);

}

- (NSString)filename
{
  XBApplicationSnapshot *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSString copy](v2->_filename, "copy");
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (CGSize)naturalSize
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v2 = 144;
  if ((unint64_t)(self->_interfaceOrientation - 3) >= 2)
    v3 = 144;
  else
    v3 = 152;
  if ((unint64_t)(self->_interfaceOrientation - 3) >= 2)
    v2 = 152;
  v4 = *(double *)((char *)&self->super.isa + v2);
  v5 = *(double *)((char *)&self->super.isa + v3);
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectEqualToRect(a3, *MEMORY[0x24BDBF090]))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 525, CFSTR("invalid content frame set by client"));

  }
  self->_contentFrame.origin.x = x;
  self->_contentFrame.origin.y = y;
  self->_contentFrame.size.width = width;
  self->_contentFrame.size.height = height;
}

- (BOOL)hasFullSizedContent
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[XBApplicationSnapshot _referenceBounds](self, "_referenceBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[XBApplicationSnapshot contentFrame](self, "contentFrame");
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  v13 = CGRectIntersection(v12, v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  return CGRectEqualToRect(v13, v15);
}

- (id)variantWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_variantsByID, "objectForKey:", a3);
}

- (void)willDeleteVariant:(id)a3
{
  XBApplicationSnapshot *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary allKeysForObject:](v4->_variantsByID, "allKeysForObject:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](v4->_variantsByID, "removeObjectsForKeys:", v5);

  objc_sync_exit(v4);
}

- (id)imageForInterfaceOrientation:(int64_t)a3
{
  return -[XBApplicationSnapshot imageForInterfaceOrientation:generationOptions:](self, "imageForInterfaceOrientation:generationOptions:", a3, 0);
}

- (void)loadImageForPreHeat
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[XBApplicationSnapshot _beginPreHeatImageAccess](self, "_beginPreHeatImageAccess");
  -[XBApplicationSnapshot loadImage](self, "loadImage");
  v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__XBApplicationSnapshot_loadImageForPreHeat__block_invoke;
  block[3] = &unk_24D7F4328;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __44__XBApplicationSnapshot_loadImageForPreHeat__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endPreHeatImageAccess");
}

- (void)loadImage
{
  -[XBApplicationSnapshot loadImageWithGenerationOptions:](self, "loadImageWithGenerationOptions:", 0);
}

- (void)_locked_loadImageViaGeneratorFunction:(id)a3
{
  void (**v4)(id, XBApplicationSnapshot *);
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  XBApplicationSnapshot *v10;
  XBApplicationSnapshotGenerationContext *generationContext;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, XBApplicationSnapshot *))a3;
  os_unfair_lock_assert_owner(&self->_loadImageLock);
  XBLogSnapshot();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    -[XBApplicationSnapshot containerIdentity](self, "containerIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2114;
    v16 = CFSTR("generatorFunction");
    _os_signpost_emit_with_name_impl(&dword_217702000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SnapshotImageLoading", "BundleIdOverride=%{public, signpost.description:attribute}@ imageSource=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ", (uint8_t *)&v13, 0x16u);

  }
  XBLogCapture();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[XBApplicationSnapshot _locked_loadImageViaGeneratorFunction:].cold.2(self);

  v4[2](v4, self);
  XBLogCapture();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[XBApplicationSnapshot _locked_loadImageViaGeneratorFunction:].cold.1(self);

  v10 = self;
  objc_sync_enter(v10);
  generationContext = v10->_generationContext;
  v10->_generationContext = 0;

  -[XBApplicationSnapshot clearImageGenerator](v10, "clearImageGenerator");
  objc_sync_exit(v10);

  XBLogSnapshot();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    v13 = 134349056;
    v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_217702000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SnapshotImageLoading", "error=%{public, signpost.telemetry:number1}zu enableTelemetry=YES ", (uint8_t *)&v13, 0xCu);
  }

}

- (void)purgeImage
{
  -[XBApplicationSnapshot _purgeCachedImageIfAppropriate:](self, "_purgeCachedImageIfAppropriate:", 1);
}

- (void)beginImageAccessUntilExpiration
{
  XBApplicationSnapshot *v3;
  void *v4;
  void *v5;
  XBApplicationSnapshot *obj;

  obj = self;
  objc_sync_enter(obj);
  v3 = obj;
  if (!obj->_expirationDate)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("XBApplicationSnapshot.m"), 775, CFSTR("Expiration date is required in order to keep alive until expiration."));

    v3 = obj;
  }
  if (v3->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("XBApplicationSnapshot.m"), 776, CFSTR("Cannot keep alive an image that is already invalidated."));

    v3 = obj;
  }
  -[XBApplicationSnapshot _synchronized_evaluateImageAccessUntilExpirationEnablingIfNecessary:](v3, "_synchronized_evaluateImageAccessUntilExpirationEnablingIfNecessary:", 1);
  objc_sync_exit(obj);

}

- (void)_beginPreHeatImageAccess
{
  XBApplicationSnapshot *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_keepImageAccessForPreHeat = 1;
  objc_sync_exit(obj);

}

- (void)_endPreHeatImageAccess
{
  XBApplicationSnapshot *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_keepImageAccessForPreHeat = 0;
  -[XBApplicationSnapshot _purgeCachedImageIfAppropriate:](obj, "_purgeCachedImageIfAppropriate:", 0);
  objc_sync_exit(obj);

}

- (id)descriptionWithoutVariants
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshot _descriptionBuilderWithMultilinePrefix:includeVariants:](self, "_descriptionBuilderWithMultilinePrefix:includeVariants:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_manifestQueueDecode_setStore:(id)a3
{
  XBSnapshotManifestStore *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (XBSnapshotManifestStore *)a3;
  if (self->_store != v5)
  {
    objc_storeStrong((id *)&self->_store, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSMutableDictionary allValues](self->_variantsByID, "allValues", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_manifestQueueDecode_setStore:", v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setImageGeneratingByProvider:(id)a3 withBlockingImageGenerator:(id)a4
{
  NSString *v6;
  XBApplicationSnapshot *v7;
  uint64_t v8;
  id imageGenerator;
  NSString *dataProviderClassName;
  id v11;

  v6 = (NSString *)a3;
  v11 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = objc_msgSend(v11, "copy");
  imageGenerator = v7->_imageGenerator;
  v7->_imageGenerator = (id)v8;

  dataProviderClassName = v7->_dataProviderClassName;
  v7->_dataProviderClassName = v6;

  objc_sync_exit(v7);
}

- (BOOL)_path:(id)a3 isRelativeToPath:(id)a4 outRelativePath:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (v8 && !objc_msgSend(v7, "rangeOfString:", v8))
  {
    objc_msgSend(v7, "substringFromIndex:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 1;
    if (!a5)
      goto LABEL_5;
    goto LABEL_4;
  }
  v10 = 0;
  v11 = 0;
  if (a5)
LABEL_4:
    *a5 = objc_retainAutorelease(v11);
LABEL_5:

  return v10;
}

- (id)_determineRelativePathForPath:(id)a3 location:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  int64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  BOOL v18;
  id v19;
  id v21;
  id v22;
  id v23;
  id v24;

  v6 = a3;
  -[XBApplicationSnapshot containerIdentity](self, "containerIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "snapshotContainerPathForSnapshot:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v9 = -[XBApplicationSnapshot _path:isRelativeToPath:outRelativePath:](self, "_path:isRelativeToPath:outRelativePath:", v6, v8, &v24);
  v10 = v24;

  if (v9)
  {
    v11 = 1;
    if (!a4)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v7, "bundlePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v10;
  v13 = -[XBApplicationSnapshot _path:isRelativeToPath:outRelativePath:](self, "_path:isRelativeToPath:outRelativePath:", v6, v12, &v23);
  v14 = v23;

  if (v13)
  {
    v11 = 3;
    v10 = v14;
    if (!a4)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v7, "bundleContainerPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v14;
  v16 = -[XBApplicationSnapshot _path:isRelativeToPath:outRelativePath:](self, "_path:isRelativeToPath:outRelativePath:", v6, v15, &v22);
  v10 = v22;

  if (v16)
  {
    v11 = 4;
    if (!a4)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v7, "dataContainerPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v10;
  v18 = -[XBApplicationSnapshot _path:isRelativeToPath:outRelativePath:](self, "_path:isRelativeToPath:outRelativePath:", v6, v17, &v21);
  v19 = v21;

  if (v18)
  {
    v11 = 2;
    v10 = v19;
    if (!a4)
      goto LABEL_15;
    goto LABEL_14;
  }
  v10 = v6;

  v11 = 0;
  if (a4)
LABEL_14:
    *a4 = v11;
LABEL_15:

  return v10;
}

- (BOOL)_validateWithContainerIdentity:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSString *relativePath;
  unint64_t fileLocation;
  const __CFString *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  unint64_t contentType;
  const __CFString *v19;
  NSObject *v20;
  void *v21;
  int64_t v22;
  NSString *v23;
  NSString *v24;
  const char *v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;
  void *v29;
  int64_t v30;
  NSString *v31;
  NSObject *v32;
  void *v33;
  NSString *path;
  NSString *filename;
  void *v36;
  NSString *v37;
  NSString *v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  NSObject *v43;
  void *v44;
  NSString *v45;
  const char *v46;
  __CFString *v47;
  id v48;
  NSString *v49;
  NSObject *v50;
  void *v51;
  NSString *v52;
  void *v53;
  NSString *v54;
  char v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v61;
  NSString *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  XBApplicationSnapshot *v66;
  id v67;
  id v68;
  char v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  int64_t v73;
  __int16 v74;
  const __CFString *v75;
  __int16 v76;
  NSString *v77;
  __int16 v78;
  NSObject *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 945, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerIdentity"));

  }
  -[XBApplicationSnapshot containerIdentity](self, "containerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    -[XBApplicationSnapshot setContainerIdentity:](self, "setContainerIdentity:", v5);
    self->_logContainerIdentifierDirty = 1;
  }
  if (self->_contentType == 1 && !self->_launchInterfaceIdentifier)
  {
    XBLogFileManifest();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      contentType = self->_contentType;
      if (contentType > 2)
        v19 = CFSTR("{!InvalidType!}");
      else
        v19 = off_24D7F4858[contentType];
      *(_DWORD *)buf = 138543618;
      v71 = v16;
      v72 = 2114;
      v73 = (int64_t)v19;
      v25 = "%{public}@ we're invalid because we don't have a launchInterfaceIdentifier and our content type is: %{public}@";
      goto LABEL_54;
    }
  }
  else
  {
    if (self->_path && !self->_relativePath)
    {
      -[XBApplicationSnapshot _determineRelativePathForPath:location:](self, "_determineRelativePathForPath:location:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[XBApplicationSnapshot _setRelativePath:](self, "_setRelativePath:", v8);

      XBLogFileManifest();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        relativePath = self->_relativePath;
        fileLocation = self->_fileLocation;
        if (fileLocation > 4)
          v14 = CFSTR("(unknown)");
        else
          v14 = off_24D7F4870[fileLocation];
        *(_DWORD *)buf = 138543874;
        v71 = v10;
        v72 = 2114;
        v73 = (int64_t)relativePath;
        v74 = 2114;
        v75 = v14;
        _os_log_impl(&dword_217702000, v9, OS_LOG_TYPE_INFO, "%{public}@ Snapshot migrated snapshot path to %{public}@, relative to %{public}@", buf, 0x20u);

      }
    }
    if (self->_relativePath)
    {
      switch(self->_fileLocation)
      {
        case 0:
          XBLogFileManifest();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = self->_relativePath;
            v22 = self->_fileLocation;
            *(_DWORD *)buf = 138543874;
            v71 = (uint64_t)v21;
            v72 = 2048;
            v73 = v22;
            v74 = 2114;
            v75 = (const __CFString *)v23;
            _os_log_impl(&dword_217702000, v20, OS_LOG_TYPE_INFO, "%{public}@ has fileLocation of %ld\nsetting to newPath: %{public}@", buf, 0x20u);

          }
          v15 = self->_relativePath;
          break;
        case 1:
          objc_msgSend(v5, "snapshotContainerPathForSnapshot:", self);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        case 2:
          objc_msgSend(v5, "dataContainerPath");
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        case 3:
          objc_msgSend(v5, "bundlePath");
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        case 4:
          objc_msgSend(v5, "bundleContainerPath");
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_29:
          v27 = v26;
          if (!v26)
            goto LABEL_33;
          -[__CFString stringByAppendingPathComponent:](v26, "stringByAppendingPathComponent:", self->_relativePath);
          v15 = objc_claimAutoreleasedReturnValue();
          XBLogFileManifest();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = self->_relativePath;
            v30 = self->_fileLocation;
            *(_DWORD *)buf = 138544386;
            v71 = (uint64_t)v29;
            v72 = 2048;
            v73 = v30;
            v74 = 2114;
            v75 = v27;
            v76 = 2114;
            v77 = v31;
            v78 = 2114;
            v79 = v15;
            _os_log_impl(&dword_217702000, v28, OS_LOG_TYPE_INFO, "%{public}@ has fileLocation of %ld\ncalculated rootPath of %{public}@\nrelativePath: %{public}@\nsetting to newPath: %{public}@", buf, 0x34u);

          }
          break;
        default:
LABEL_33:
          v15 = 0;
          break;
      }
      if ((BSEqualStrings() & 1) == 0)
      {
        -[XBApplicationSnapshot _setPath:](self, "_setPath:", v15);
        if (self->_path)
        {
          XBLogFileManifest();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            path = self->_path;
            *(_DWORD *)buf = 138543618;
            v71 = (uint64_t)v33;
            v72 = 2114;
            v73 = (int64_t)path;
            _os_log_impl(&dword_217702000, v32, OS_LOG_TYPE_INFO, "%{public}@ Snapshot rebuilt absolute path to: %{public}@", buf, 0x16u);

          }
        }
      }
      filename = self->_filename;
      if (!filename)
      {
        -[NSString lastPathComponent](self->_relativePath, "lastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (NSString *)objc_msgSend(v36, "copy");
        v38 = self->_filename;
        self->_filename = v37;

        filename = self->_filename;
      }
      -[NSString pathExtension](filename, "pathExtension");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      self->_fileFormat = XBApplicationSnapshotOnDiskFormatForFileExtension(v39);

      if (!self->_identifier || !self->_groupID)
        goto LABEL_62;
      if (!self->_path)
        goto LABEL_70;
      if (-[XBApplicationSnapshot isExpired](self, "isExpired"))
      {
LABEL_62:
        if (self->_path)
        {
          v68 = 0;
          LODWORD(v47) = -[XBApplicationSnapshot _shouldDeleteFileOnPurge:](self, "_shouldDeleteFileOnPurge:", &v68);
          v48 = v68;
          if ((_DWORD)v47)
          {
            XBLogFileManifest();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = self->_path;
              *(_DWORD *)buf = 138543874;
              v71 = (uint64_t)v51;
              v72 = 2114;
              v73 = (int64_t)v48;
              v74 = 2114;
              v75 = (const __CFString *)v52;
              _os_log_impl(&dword_217702000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ deleting file on purge because we're invalid.\n\tdeleteReason: %{public}@;\n"
                "\tpath: %{public}@",
                buf,
                0x20u);

            }
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = self->_path;
            v67 = 0;
            v55 = objc_msgSend(v53, "removeItemAtPath:error:", v54, &v67);
            v47 = (__CFString *)v67;

            if ((v55 & 1) != 0)
              goto LABEL_75;
            -[__CFString domain](v47, "domain");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v56, "isEqualToString:", *MEMORY[0x24BDD0B88]))
            {
              v57 = -[__CFString code](v47, "code");

              if (v57 == 4)
              {
LABEL_75:

                LOBYTE(v47) = 0;
                goto LABEL_76;
              }
            }
            else
            {

            }
            XBLogFileManifest();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = self->_path;
              *(_DWORD *)buf = 138543874;
              v71 = (uint64_t)v61;
              v72 = 2114;
              v73 = (int64_t)v62;
              v74 = 2114;
              v75 = v47;
              _os_log_error_impl(&dword_217702000, v58, OS_LOG_TYPE_ERROR, "%{public}@ Error deleting file on purge at %{public}@: %{public}@", buf, 0x20u);

            }
            goto LABEL_75;
          }
LABEL_76:
          v59 = (void *)-[NSMutableDictionary copy](self->_variantsByID, "copy");
          v64[0] = MEMORY[0x24BDAC760];
          v64[1] = 3221225472;
          v64[2] = __56__XBApplicationSnapshot__validateWithContainerIdentity___block_invoke;
          v64[3] = &unk_24D7F47E8;
          v65 = v5;
          v66 = self;
          objc_msgSend(v59, "enumerateKeysAndObjectsUsingBlock:", v64);

          goto LABEL_77;
        }
LABEL_70:
        LOBYTE(v47) = 0;
        v48 = 0;
        goto LABEL_76;
      }
      v69 = 0;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "fileExistsAtPath:isDirectory:", self->_path, &v69);
      if (v69)
        v42 = 0;
      else
        v42 = v41;

      if ((v42 & 1) != 0 || !v69)
      {
        if (v42)
        {
          v48 = 0;
          LOBYTE(v47) = 1;
          goto LABEL_76;
        }
        XBLogFileManifest();
        v43 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          goto LABEL_61;
        -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = self->_path;
        *(_DWORD *)buf = 138543618;
        v71 = (uint64_t)v44;
        v72 = 2114;
        v73 = (int64_t)v49;
        v46 = "%{public}@ we're invalid because _path doesn't exist: %{public}@";
      }
      else
      {
        XBLogFileManifest();
        v43 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
LABEL_61:

          goto LABEL_62;
        }
        -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = self->_path;
        *(_DWORD *)buf = 138543618;
        v71 = (uint64_t)v44;
        v72 = 2114;
        v73 = (int64_t)v45;
        v46 = "%{public}@ we're invalid because _path is a directory: %{public}@";
      }
      _os_log_impl(&dword_217702000, v43, OS_LOG_TYPE_DEFAULT, v46, buf, 0x16u);

      goto LABEL_61;
    }
    XBLogFileManifest();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = self->_path;
      *(_DWORD *)buf = 138543618;
      v71 = (uint64_t)v17;
      v72 = 2114;
      v73 = (int64_t)v24;
      v25 = "%{public}@ we're invalid because we don't have a relativePath. path: %{public}@";
LABEL_54:
      _os_log_impl(&dword_217702000, v15, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);

    }
  }
  LOBYTE(v47) = 0;
LABEL_77:

  return (char)v47;
}

void __56__XBApplicationSnapshot__validateWithContainerIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v6, "_validateWithContainerIdentity:", *(_QWORD *)(a1 + 32))
    || (objc_msgSend(v6, "variantID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = BSEqualObjects(),
        v7,
        (v8 & 1) == 0))
  {
    XBLogFileManifest();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "logIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "succinctDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2114;
      v15 = v5;
      v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_217702000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Found invalid variant. Removing. variantID: %{public}@; variant: %{public}@",
        (uint8_t *)&v12,
        0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", v5);
  }

}

- (BOOL)_isInvalidated
{
  XBApplicationSnapshot *v2;
  BOOL invalidated;

  v2 = self;
  objc_sync_enter(v2);
  invalidated = v2->_invalidated;
  objc_sync_exit(v2);

  return invalidated;
}

- (id)_createVariantWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 1075, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variantID"));

  }
  if (!-[XBApplicationSnapshot _isInvalidated](self, "_isInvalidated"))
  {
    -[XBApplicationSnapshot variantWithIdentifier:](self, "variantWithIdentifier:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (v8)
    {
      if (-[NSObject isValid](v8, "isValid"))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 1084, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variant == nil || ![variant isValid]"));

      }
      XBLogFileManifest();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v10;
      v19 = 2114;
      v20 = v5;
      v21 = 2114;
      v22 = v6;
      v11 = "[%{public}@] had invalid variant -- overwriting. variantID: %{public}@\n old variant: %{public}@";
      v12 = v9;
      v13 = 32;
    }
    else
    {
      XBLogFileManifest();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        v7 = -[XBApplicationSnapshot _initWithContainerIdentity:store:groupID:generationContext:]([XBApplicationSnapshot alloc], "_initWithContainerIdentity:store:groupID:generationContext:", self->_containerIdentity, self->_store, self->_groupID, 0);
        objc_msgSend(v7, "setName:", self->_name);
        objc_msgSend(v7, "setScheme:", self->_scheme);
        objc_msgSend(v7, "setVariantID:", v5);
        objc_msgSend(v7, "setRequiredOSVersion:", self->_requiredOSVersion);
        objc_msgSend(v7, "setExpirationDate:", 0);
        objc_msgSend(v7, "setContentType:", self->_contentType);
        objc_msgSend(v7, "setLaunchInterfaceIdentifier:", self->_launchInterfaceIdentifier);
        objc_msgSend(v7, "setFullScreen:", self->_fullScreen);
        objc_msgSend(v7, "setReferenceSize:", self->_referenceSize.width, self->_referenceSize.height);
        objc_msgSend(v7, "setContentFrame:", self->_contentFrame.origin.x, self->_contentFrame.origin.y, self->_contentFrame.size.width, self->_contentFrame.size.height);
        objc_msgSend(v7, "setInterfaceOrientation:", self->_interfaceOrientation);
        objc_msgSend(v7, "setUserInterfaceStyle:", self->_userInterfaceStyle);
        objc_msgSend(v7, "setCustomSafeAreaInsets:", self->_customSafeAreaInsets);
        objc_msgSend(v7, "setStatusBarSettings:", self->_statusBarSettings);
        objc_msgSend(v7, "setClassicMode:", self->_classicMode);
        objc_msgSend(v7, "setCompatibilityMode:", self->_compatibilityMode);
        objc_msgSend(v7, "setBackgroundStyle:", self->_backgroundStyle);
        objc_msgSend(v7, "setImageOpaque:", self->_imageOpaque);
        objc_msgSend(v7, "setImageScale:", self->_imageScale);
        objc_msgSend(v7, "setImageOrientation:", self->_imageOrientation);
        -[NSMutableDictionary setObject:forKey:](self->_variantsByID, "setObject:forKey:", v7, v5);
        goto LABEL_16;
      }
      -[XBApplicationSnapshot logIdentifier](self, "logIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 2114;
      v20 = v5;
      v11 = "[%{public}@] creating new variant. variantID: %{public}@";
      v12 = v9;
      v13 = 22;
    }
    _os_log_impl(&dword_217702000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);

    goto LABEL_15;
  }
  XBLogFileManifest();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[XBApplicationSnapshot _createVariantWithIdentifier:].cold.1(self);
  v7 = 0;
LABEL_16:

  return v7;
}

- (id)_configureDefaultPathWithinGroupForFormat:(int64_t)a3
{
  XBApplicationSnapshot *v6;
  double v7;
  void *v8;
  double v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  NSString *v14;
  NSString *filename;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;

  if (self->_filename)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 1123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_filename == nil"));

  }
  if (self->_path)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 1124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_path == nil"));

  }
  if (self->_relativePath)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 1125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_relativePath == nil"));

  }
  v6 = self;
  objc_sync_enter(v6);
  -[XBApplicationSnapshot imageScale](v6, "imageScale");
  if (v7 <= 1.0)
  {
    v10 = &stru_24D7F6BF0;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[XBApplicationSnapshot imageScale](v6, "imageScale");
    objc_msgSend(v8, "stringWithFormat:", CFSTR("@%lux"), (unint64_t)v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ((unint64_t)a3 > 3)
    v11 = 0;
  else
    v11 = off_24D7F4898[a3];
  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[XBApplicationSnapshot identifier](v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (NSString *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@%@.%@"), v13, v10, v11);
  filename = self->_filename;
  self->_filename = v14;

  v6->_fileFormat = a3;
  -[XBApplicationSnapshot _setRelativePath:](v6, "_setRelativePath:", self->_filename);
  v6->_fileLocation = 1;
  -[XBApplicationSnapshot containerIdentity](v6, "containerIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "snapshotContainerPathForSnapshot:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingPathComponent:", self->_filename);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshot _setPath:](v6, "_setPath:", v18);

  objc_sync_exit(v6);
  return -[XBApplicationSnapshot path](v6, "path");
}

- (void)_configureWithPath:(id)a3
{
  XBApplicationSnapshot *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *filename;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (self->_filename)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 1140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_filename == nil"));

  }
  if (self->_path)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 1141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_path == nil"));

  }
  if (self->_relativePath)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshot.m"), 1142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_relativePath == nil"));

  }
  v5 = self;
  objc_sync_enter(v5);
  -[XBApplicationSnapshot _setPath:](v5, "_setPath:", v15);
  -[XBApplicationSnapshot _determineRelativePathForPath:location:](v5, "_determineRelativePathForPath:location:", v15, &v5->_fileLocation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshot _setRelativePath:](v5, "_setRelativePath:", v6);

  -[NSString lastPathComponent](self->_relativePath, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)objc_msgSend(v7, "copy");
  filename = self->_filename;
  self->_filename = v8;

  objc_msgSend(v15, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "isValidImageFileExtension:", v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("XBApplicationSnapshot.m"), 1149, CFSTR("Invalid file extension: %@ for path: %@"), v10, v15);

  }
  v5->_fileFormat = XBApplicationSnapshotOnDiskFormatForFileExtension(v10);

  objc_sync_exit(v5);
}

- (void)_cacheImage:(id)a3
{
  UIImage *v4;
  uint64_t v5;
  OS_os_transaction *cachedImageTransaction;
  UIImage *cachedImage;
  XBApplicationSnapshot *obj;

  v4 = (UIImage *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_cachedImageTransaction)
  {
    v5 = os_transaction_create();
    cachedImageTransaction = obj->_cachedImageTransaction;
    obj->_cachedImageTransaction = (OS_os_transaction *)v5;

  }
  -[XBApplicationSnapshot _purgeCachedImageIfAppropriate:](obj, "_purgeCachedImageIfAppropriate:", 1);
  cachedImage = obj->_cachedImage;
  obj->_cachedImage = v4;

  objc_sync_exit(obj);
}

- (BOOL)_generateImageIfPossible
{
  XBApplicationSnapshot *v2;
  id imageGenerator;
  void (**v4)(_QWORD, _QWORD);

  v2 = self;
  objc_sync_enter(v2);
  imageGenerator = v2->_imageGenerator;
  if (imageGenerator)
    v4 = (void (**)(_QWORD, _QWORD))objc_msgSend(imageGenerator, "copy");
  else
    v4 = 0;
  objc_sync_exit(v2);

  if (v4)
    ((void (**)(_QWORD, XBApplicationSnapshot *))v4)[2](v4, v2);

  return v4 != 0;
}

- (void)_setHasProtectedContent:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  NSDate *expirationDate;
  XBApplicationSnapshot *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  -[BSAtomicFlag setFlag:](obj->_hasProtectedContent, "setFlag:", v3);
  if (v3 && !obj->_expirationDate)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 480.0);
    v4 = objc_claimAutoreleasedReturnValue();
    expirationDate = obj->_expirationDate;
    obj->_expirationDate = (NSDate *)v4;

  }
  objc_sync_exit(obj);

}

+ (id)dataForImage:(id)a3 withFormat:(int64_t)a4
{
  id v6;
  void *v7;
  UIImage *v8;
  uint64_t v9;
  __CFData *Mutable;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CGImage *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  const __CFDictionary *v24;
  CGImageDestination *v25;
  CGImageDestination *v26;
  BOOL v27;
  NSObject *v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (a4 == -1)
    goto LABEL_11;
  v8 = (UIImage *)objc_retainAutorelease(v6);
  if (!-[UIImage CGImage](v8, "CGImage"))
    goto LABEL_11;
  if (a4 == 3)
  {
    _UIImageJPEGRepresentation();
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!a4)
  {
    UIImagePNGRepresentation(v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    Mutable = (__CFData *)v9;
    goto LABEL_12;
  }
  if ((unint64_t)a4 > 2)
  {
LABEL_11:
    Mutable = 0;
    goto LABEL_12;
  }
  v11 = *MEMORY[0x24BDD9260];
  v33[0] = *MEMORY[0x24BDD91F8];
  v33[1] = v11;
  v34[0] = &unk_24D8008C0;
  v34[1] = &unk_24D8008D8;
  v12 = MEMORY[0x24BDBD1C8];
  v33[2] = *MEMORY[0x24BDD9768];
  v33[3] = CFSTR("kCGImageConversionReason");
  v34[2] = MEMORY[0x24BDBD1C8];
  v34[3] = CFSTR("XBApplicationSnapshot");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (CGImage *)objc_msgSend(a1, "_createCGImageWithPreferredOptions:fromCGImage:", v13, -[UIImage CGImage](objc_retainAutorelease(v8), "CGImage"));
  if (a4 == 2)
  {
    v15 = *MEMORY[0x24BDD9268];
    v16 = *MEMORY[0x24BDD9270];
    v31[0] = *MEMORY[0x24BDD93D8];
    v31[1] = v16;
    v32[0] = v15;
    v32[1] = v12;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = v32;
    v19 = v31;
    v20 = 2;
  }
  else
  {
    v22 = *MEMORY[0x24BDD93D8];
    v29[0] = *MEMORY[0x24BDD92A0];
    v29[1] = v22;
    v23 = *MEMORY[0x24BDD92A8];
    v30[0] = &unk_24D8008F0;
    v30[1] = v23;
    v29[2] = *MEMORY[0x24BDD92B8];
    v30[2] = v12;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = v30;
    v19 = v29;
    v20 = 3;
  }
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
  v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  Mutable = CFDataCreateMutable(0, 0);
  v25 = CGImageDestinationCreateWithData(Mutable, CFSTR("com.apple.atx"), 1uLL, 0);
  if (!v25
    || (v26 = v25, CGImageDestinationAddImage(v25, v14, v24),
                   v27 = CGImageDestinationFinalize(v26),
                   CFRelease(v26),
                   !v27))
  {
    XBLogSnapshot();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      +[XBApplicationSnapshot dataForImage:withFormat:].cold.1();

  }
  CGImageRelease(v14);

LABEL_12:
  return Mutable;
}

+ (CGImage)_createCGImageWithPreferredOptions:(id)a3 fromCGImage:(CGImage *)a4
{
  id v5;
  void *v6;
  CGImage *v7;

  v5 = a3;
  if (a4)
  {
    CGImageGetImageProvider();
    v6 = (void *)CGImageProviderCopyIOSurface();
    if (!v6 || (v7 = (CGImage *)CGImageCreateFromIOSurface()) == 0)
    {
      CGImageRetain(a4);
      v7 = a4;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (XBApplicationSnapshot)initWithCoder:(id)a3
{
  id v4;
  XBApplicationSnapshot *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *scheme;
  uint64_t v12;
  NSString *variantID;
  uint64_t v14;
  NSString *groupID;
  uint64_t v16;
  NSString *requiredOSVersion;
  uint64_t v18;
  NSString *launchInterfaceIdentifier;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *filename;
  uint64_t v24;
  NSDate *creationDate;
  uint64_t v26;
  NSDate *lastUsedDate;
  uint64_t v28;
  NSDate *expirationDate;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  uint64_t v36;
  XBDisplayEdgeInsetsWrapper *customSafeAreaInsets;
  double v38;
  uint64_t v39;
  XBStatusBarSettings *statusBarSettings;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSDictionary *extendedData;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSMutableDictionary *variantsByID;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)XBApplicationSnapshot;
  v5 = -[XBApplicationSnapshot init](&v56, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x219A10C5C]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[XBApplicationSnapshot _commonInitWithIdentifier:](v5, "_commonInitWithIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheme"));
    v10 = objc_claimAutoreleasedReturnValue();
    scheme = v5->_scheme;
    v5->_scheme = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variantID"));
    v12 = objc_claimAutoreleasedReturnValue();
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v14 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiredOSVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    requiredOSVersion = v5->_requiredOSVersion;
    v5->_requiredOSVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchInterfaceIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    launchInterfaceIdentifier = v5->_launchInterfaceIdentifier;
    v5->_launchInterfaceIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relativePath"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[XBApplicationSnapshot _setRelativePath:](v5, "_setRelativePath:", v20);

    if (!v5->_relativePath)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[XBApplicationSnapshot _setPath:](v5, "_setPath:", v21);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filename"));
      v22 = objc_claimAutoreleasedReturnValue();
      filename = v5->_filename;
      v5->_filename = (NSString *)v22;

    }
    v5->_fileLocation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fileLocation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUsedDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    lastUsedDate = v5->_lastUsedDate;
    v5->_lastUsedDate = (NSDate *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v28 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v28;

    v5->_contentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentType"));
    v5->_fullScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fullScreen"));
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("referenceSize"));
    v5->_referenceSize.width = v30;
    v5->_referenceSize.height = v31;
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("contentFrame"));
    v5->_contentFrame.origin.x = v32;
    v5->_contentFrame.origin.y = v33;
    v5->_contentFrame.size.width = v34;
    v5->_contentFrame.size.height = v35;
    v5->_interfaceOrientation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interfaceOrientation"));
    v5->_userInterfaceStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("userInterfaceStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customSafeAreaInsets"));
    v36 = objc_claimAutoreleasedReturnValue();
    customSafeAreaInsets = v5->_customSafeAreaInsets;
    v5->_customSafeAreaInsets = (XBDisplayEdgeInsetsWrapper *)v36;

    v5->_imageOpaque = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("imageOpaque"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("imageScale"));
    v5->_imageScale = v38;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusBarSettings"));
    v39 = objc_claimAutoreleasedReturnValue();
    statusBarSettings = v5->_statusBarSettings;
    v5->_statusBarSettings = (XBStatusBarSettings *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classicMode"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_classicMode = UIApplicationSceneClassicModeForString();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compatibilityMode"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_compatibilityMode = UIApplicationSceneCompatibilityModeForString();

    v43 = (void *)MEMORY[0x24BDF6800];
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundStyle"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_backgroundStyle = objc_msgSend(v43, "_backgroundStyleForString:", v44);

    +[XBApplicationSnapshot _allSecureCodingClassesIncludingDefaultAndClientSpecified](XBApplicationSnapshot, "_allSecureCodingClassesIncludingDefaultAndClientSpecified");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("extendedData"));
    v46 = objc_claimAutoreleasedReturnValue();
    extendedData = v5->_extendedData;
    v5->_extendedData = (NSDictionary *)v46;

    v48 = (void *)MEMORY[0x24BDBCF20];
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, v50, objc_opt_class(), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v51, CFSTR("variants"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v52);
      v53 = objc_claimAutoreleasedReturnValue();
      variantsByID = v5->_variantsByID;
      v5->_variantsByID = (NSMutableDictionary *)v53;

    }
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)descriptionForStateCaptureWithMultilinePrefix:(id)a3
{
  id v5;
  XBApplicationSnapshot *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *);
  void *v15;
  XBApplicationSnapshot *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[4];
  id v24;
  XBApplicationSnapshot *v25;
  SEL v26;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[XBApplicationSnapshot succinctDescriptionBuilder](v6, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = MEMORY[0x24BDAC760];
  if (v6->_cachedImage)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke;
    v23[3] = &unk_24D7F4660;
    v24 = v7;
    v25 = v6;
    v26 = a2;
    objc_msgSend(v24, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Cache"), v5, v23);

  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (-[NSMutableDictionary count](v6->_variantsByID, "count"))
  {
    v12 = v9;
    v13 = 3221225472;
    v14 = __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke_2;
    v15 = &unk_24D7F4638;
    v16 = v6;
    v17 = v8;
    v18 = &v19;
    objc_msgSend(v17, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Variants"), v5, &v12);

  }
  if (v6->_cachedImage || *((_BYTE *)v20 + 24))
  {
    objc_msgSend(v8, "build", v12, v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v19, 8);

  objc_sync_exit(v6);
  return v10;
}

void __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  CGImage *v7;
  id v8;
  size_t Height;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPointer:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 280), CFSTR("_cachedImage"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "ioSurface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "CGImage");
  if (v3)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPointer:withName:", v3, CFSTR("IOSurfaceRef"));
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInt64:withName:", objc_msgSend(v3, "allocationSize"), CFSTR("allocSize"));
  }
  else
  {
    v7 = (CGImage *)v4;
    if (v4)
    {
      v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPointer:withName:", v4, CFSTR("CGImageRef"));
      Height = CGImageGetHeight(v7);
      v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", CGImageGetBytesPerRow(v7) * Height, CFSTR("allocSize"));
    }
  }
  v11 = *(void **)(a1 + 40);
  v15 = 0;
  objc_msgSend(v11, "_synchronized_hasCachedImage:", &v15);
  v12 = v15;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("XBApplicationSnapshot.m"), 1438, CFSTR("_synchronized_hasCachedImage: isn't giving us a reason even though we have a cached image"));

  }
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v12, CFSTR("reason"));

}

void __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 24);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke_3;
  v6[3] = &unk_24D7F4810;
  v4 = v2;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionForStateCaptureWithMultilinePrefix:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", v8, v10, 1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshot succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_name, CFSTR("name"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_identifier, CFSTR("identifier"), 1);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_scheme, CFSTR("scheme"), 1);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_launchInterfaceIdentifier, CFSTR("launchInterfaceIdentifier"), 1);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_variantID, CFSTR("variantID"), 1);
  XBApplicationSnapshotContentTypeDescription(self->_contentType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("contentType"));

  v11 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("referenceSize"), self->_referenceSize.width, self->_referenceSize.height);
  XBStringForInterfaceOrientation(self->_interfaceOrientation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("interfaceOrientation"));

  XBStringForUserInterfaceStyle(self->_userInterfaceStyle);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("userInterfaceStyle"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[XBApplicationSnapshot descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[XBApplicationSnapshot _descriptionBuilderWithMultilinePrefix:includeVariants:](self, "_descriptionBuilderWithMultilinePrefix:includeVariants:", a3, 1);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 includeVariants:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  XBApplicationSnapshot *v13;
  BOOL v14;

  v6 = a3;
  -[XBApplicationSnapshot succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke;
  v11[3] = &unk_24D7F4390;
  v8 = v7;
  v12 = v8;
  v13 = self;
  v14 = a4;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v6, v11);

  v9 = v8;
  return v9;
}

void __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  uint64_t v36;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("requiredOSVersion"), 1);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), 3, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("creationDate"), 1);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), 3, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v7, CFSTR("lastUsedDate"), 1);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), 3, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", v10, CFSTR("expirationDate"), 1);

  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 307), CFSTR("keepsImageAccessUntilExpiration"));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_hasGenerationContext"), CFSTR("hasGenerationContext"));
  v36 = 0;
  if (!fsctl((const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "UTF8String"), 0x40084A47uLL, &v36, 0))
  {
    if ((v36 & 0x400) != 0)
    {
      v16 = *(void **)(a1 + 32);
      v17 = CFSTR("medium");
    }
    else
    {
      v14 = *(void **)(a1 + 32);
      if ((v36 & 0x800) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("disallowed(%llu)"), v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "appendString:withName:", v15, CFSTR("purge"));

        goto LABEL_8;
      }
      v17 = CFSTR("high");
      v16 = *(void **)(a1 + 32);
    }
    objc_msgSend(v16, "appendString:withName:", v17, CFSTR("purge"));
  }
LABEL_8:
  v18 = *(void **)(a1 + 32);
  objc_msgSend(v18, "activeMultilinePrefix");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_2;
  v33[3] = &unk_24D7F45F0;
  v21 = *(id *)(a1 + 32);
  v22 = *(_QWORD *)(a1 + 40);
  v34 = v21;
  v35 = v22;
  objc_msgSend(v18, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("context"), v19, v33);

  v23 = *(void **)(a1 + 32);
  objc_msgSend(v23, "activeMultilinePrefix");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_4;
  v30[3] = &unk_24D7F45F0;
  v25 = *(id *)(a1 + 32);
  v26 = *(_QWORD *)(a1 + 40);
  v31 = v25;
  v32 = v26;
  objc_msgSend(v23, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("imageContext"), v24, v30);

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("variants"), 1);
  v27 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "extendedData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v27, "appendObject:withName:skipIfNil:", v28, CFSTR("extendedData"), 1);

}

void __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v2 = *(void **)(a1 + 32);
  XBApplicationSnapshotContentTypeDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 208));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("contentType"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 305), CFSTR("fullScreen"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", CFSTR("referenceSize"), *(double *)(*(_QWORD *)(a1 + 40) + 144), *(double *)(*(_QWORD *)(a1 + 40) + 152));
  if (!CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 40) + 160), *MEMORY[0x24BDBF090]))
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", CFSTR("contentFrame"), *(double *)(*(_QWORD *)(a1 + 40) + 160), *(double *)(*(_QWORD *)(a1 + 40) + 168), *(double *)(*(_QWORD *)(a1 + 40) + 176), *(double *)(*(_QWORD *)(a1 + 40) + 184));
  v8 = *(void **)(a1 + 32);
  XBStringForInterfaceOrientation(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 192));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("interfaceOrientation"));

  v11 = *(void **)(a1 + 32);
  XBStringForUserInterfaceStyle(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 200));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "appendObject:withName:", v12, CFSTR("userInterfaceStyle"));

  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 360), CFSTR("customSafeAreaInsets"), 1);
  v15 = *(void **)(a1 + 32);
  objc_msgSend(v15, "activeMultilinePrefix");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_3;
  v19[3] = &unk_24D7F45F0;
  v17 = *(id *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v20 = v17;
  v21 = v18;
  objc_msgSend(v15, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("additionalContext"), v16, v19);

}

void __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_3(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 240), CFSTR("statusBarSettings"), 1);
  v3 = *(_QWORD **)(a1 + 40);
  if (v3[32])
  {
    v4 = *(void **)(a1 + 32);
    UIApplicationSceneStringForCompatibilityMode();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, CFSTR("compatibilityMode"), 1);

    v3 = *(_QWORD **)(a1 + 40);
  }
  if (v3[31])
  {
    v7 = *(void **)(a1 + 32);
    UIApplicationSceneStringForClassicMode();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "appendObject:withName:skipIfNil:", v8, CFSTR("classicMode"), 1);

    v3 = *(_QWORD **)(a1 + 40);
  }
  if (v3[33])
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDF6800], "_stringForBackgroundStyle:");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "appendObject:withName:skipIfNil:", v12, CFSTR("backgroundStyle"), 1);

  }
}

id __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;
  unint64_t v4;
  const __CFString *v5;
  id v6;
  id v7;
  unint64_t v8;
  __CFString *v9;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("scale"), 1, *(double *)(*(_QWORD *)(a1 + 40) + 224));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 306), CFSTR("opaque"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112);
  if (v4 > 4)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_24D7F4870[v4];
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v5, CFSTR("fileRelativeLocation"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), CFSTR("path"), 1);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216);
  if (v8 > 3)
    v9 = 0;
  else
    v9 = off_24D7F4898[v8];
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", v9, CFSTR("fileFormat"), 1);
}

- (void)setVariantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)launchInterfaceIdentifier
{
  return self->_launchInterfaceIdentifier;
}

- (void)setRequiredOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)_setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)fileFormat
{
  return self->_fileFormat;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedDate, a3);
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (int64_t)classicMode
{
  return self->_classicMode;
}

- (void)setClassicMode:(int64_t)a3
{
  self->_classicMode = a3;
}

- (int64_t)compatibilityMode
{
  return self->_compatibilityMode;
}

- (void)setCompatibilityMode:(int64_t)a3
{
  self->_compatibilityMode = a3;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (XBApplicationSnapshotGenerationContext)generationContext
{
  return self->_generationContext;
}

- (void)setExtendedData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (XBSnapshotManifestStore)_store
{
  return self->_store;
}

- (void)setContainerIdentity:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void)setImageGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void)setImageOpaque:(BOOL)a3
{
  self->_imageOpaque = a3;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

- (NSString)dataProviderClassName
{
  return self->_dataProviderClassName;
}

- (void)setDataProviderClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)_relativePath
{
  return self->_relativePath;
}

- (int64_t)fileLocation
{
  return self->_fileLocation;
}

- (void)setFileLocation:(int64_t)a3
{
  self->_fileLocation = a3;
}

- (CGAffineTransform)imageTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[8].tx;
  return self;
}

- (void)setImageTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_imageTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_imageTransform.tx = v4;
  *(_OWORD *)&self->_imageTransform.a = v3;
}

- (NSString)_sortableLaunchInterfaceIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[XBApplicationSnapshot launchInterfaceIdentifier](self, "launchInterfaceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    FAKE_NIL_PTR();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)_sortableRequiredOSVersion
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[XBApplicationSnapshot requiredOSVersion](self, "requiredOSVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    FAKE_NIL_PTR();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (void)_sanitizedPathForPath:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_217702000, log, OS_LOG_TYPE_FAULT, "%{public}@ received invalid path\npath: %{public}@", buf, 0x16u);

}

- (void)_locked_loadImageViaGenerationContext:(void *)a1 options:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "logIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_217702000, v2, v3, "%{public}@ finished calling imageGenerator", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_locked_loadImageViaGenerationContext:(void *)a1 options:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "logIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_217702000, v2, v3, "%{public}@ calling imageGenerator", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_locked_loadImageViaGeneratorFunction:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "logIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_217702000, v2, v3, "%{public}@ finished calling generatorFunction", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_locked_loadImageViaGeneratorFunction:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "logIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_217702000, v2, v3, "%{public}@ calling generatorFunction", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_createVariantWithIdentifier:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "logIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_217702000, v2, v3, "[%{public}@] asked to create variant but we're invalidated. variantID: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

+ (void)dataForImage:withFormat:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_217702000, v0, OS_LOG_TYPE_ERROR, "Failed to generate ATX data for %@", v1, 0xCu);
}

@end
