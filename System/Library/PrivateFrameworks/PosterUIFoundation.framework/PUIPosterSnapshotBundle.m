@implementation PUIPosterSnapshotBundle

+ (id)snapshotBundleAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  PUIPosterSnapshotBundle *v7;

  v5 = a3;
  PUIPosterSnapshotBundleURLForComponent(v5, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", a4))
    v7 = -[PUIPosterSnapshotBundle initWithURL:]([PUIPosterSnapshotBundle alloc], "initWithURL:", v5);
  else
    v7 = 0;

  return v7;
}

+ (id)snapshotBundleForInfoDictionary:(id)a3 levelToImage:(id)a4 colorStatistics:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  PUIPosterSnapshotBundle *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PUIPosterSnapshotBundle initWithInfoDictionary:levelToImage:colorStatistics:]([PUIPosterSnapshotBundle alloc], "initWithInfoDictionary:levelToImage:colorStatistics:", v10, v9, v8);

  return v11;
}

- (PUIPosterSnapshotBundle)initWithURL:(id)a3
{
  id v4;
  void *v5;
  NSURL *v6;
  NSURL *bundleURL;
  void *v8;
  uint64_t v9;
  PUIPosterSnapshotBundle *v10;

  v4 = a3;
  v5 = v4;
  if (!self)
    goto LABEL_3;
  v6 = (NSURL *)objc_msgSend(v4, "copy");
  bundleURL = self->_bundleURL;
  self->_bundleURL = v6;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    v10 = 0;
  else
LABEL_3:
    v10 = self;

  return v10;
}

- (PUIPosterSnapshotBundle)initWithInfoDictionary:(id)a3 levelToImage:(id)a4
{
  return -[PUIPosterSnapshotBundle initWithInfoDictionary:levelToImage:colorStatistics:](self, "initWithInfoDictionary:levelToImage:colorStatistics:", a3, a4, 0);
}

- (PUIPosterSnapshotBundle)initWithInfoDictionary:(id)a3 levelToImage:(id)a4 colorStatistics:(id)a5
{
  id v8;
  id v9;
  id v10;
  PUIPosterSnapshotBundle *v11;
  uint64_t v12;
  NSDictionary *infoDictionary;
  uint64_t v14;
  NSDictionary *levelToImage;
  uint64_t v16;
  PUIColorStatistics *colorStatistics;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PUIPosterSnapshotBundle;
  v11 = -[PUIPosterSnapshotBundle init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    infoDictionary = v11->_infoDictionary;
    v11->_infoDictionary = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    levelToImage = v11->_levelToImage;
    v11->_levelToImage = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    colorStatistics = v11->_colorStatistics;
    v11->_colorStatistics = (PUIColorStatistics *)v16;

  }
  return v11;
}

- (BOOL)isValidBundle
{
  void *v2;
  BOOL v3;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PUIPosterSnapshotBundle *v4;
  PUIPosterSnapshotBundle *v5;
  BOOL v6;

  v4 = (PUIPosterSnapshotBundle *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = -[PUIPosterSnapshotBundle isEqualToSnapshotBundle:](self, "isEqualToSnapshotBundle:", v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToSnapshotBundle:(id)a3
{
  PUIPosterSnapshotBundle *v4;
  PUIPosterSnapshotBundle *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;

  v4 = (PUIPosterSnapshotBundle *)a3;
  v5 = v4;
  if (self == v4)
    goto LABEL_11;
  if (!v4)
    goto LABEL_12;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_12;
  -[PUIPosterSnapshotBundle infoDictionary](v5, "infoDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

  if (!v10)
    goto LABEL_12;
  -[PUIPosterSnapshotBundle bundleURL](v5, "bundleURL");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[PUIPosterSnapshotBundle bundleURL](self, "bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PUIPosterSnapshotBundle bundleURL](v5, "bundleURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterSnapshotBundle bundleURL](self, "bundleURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if (!v16)
        goto LABEL_12;
    }
  }
  -[PUIPosterSnapshotBundle colorStatistics](self, "colorStatistics");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_11;
  v18 = (void *)v17;
  -[PUIPosterSnapshotBundle colorStatistics](v5, "colorStatistics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19
    || (-[PUIPosterSnapshotBundle colorStatistics](self, "colorStatistics"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PUIPosterSnapshotBundle colorStatistics](v5, "colorStatistics"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v20, "isEqual:", v21),
        v21,
        v20,
        v22))
  {
LABEL_11:
    v23 = 1;
  }
  else
  {
LABEL_12:
    v23 = 0;
  }

  return v23;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPosterSnapshotBundle bundleURL](self, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("bundleURL"));

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", v6, CFSTR("infoDictionary"), 1);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)URLForComponent:(int64_t)a3
{
  return PUIPosterSnapshotBundleURLForComponent(self->_bundleURL, a3);
}

- (NSDictionary)infoDictionary
{
  PUIPosterSnapshotBundle *v2;
  NSDictionary *infoDictionary;
  NSDictionary *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSDictionary *v9;
  id v11;

  v2 = self;
  objc_sync_enter(v2);
  infoDictionary = v2->_infoDictionary;
  if (infoDictionary)
  {
    v4 = infoDictionary;
  }
  else
  {
    PUIPosterSnapshotBundleURLForComponent(v2->_bundleURL, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v5, 1, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = MEMORY[0x24BDBD1B8];
    }
    v9 = v2->_infoDictionary;
    v2->_infoDictionary = (NSDictionary *)v8;

    v4 = v2->_infoDictionary;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)updateInfoDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  if (!a3)
    return 1;
  v6 = a3;
  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "addEntriesFromDictionary:", v6);
  LOBYTE(a4) = -[PUIPosterSnapshotBundle setInfoDictionary:error:](self, "setInfoDictionary:error:", v8, a4);

  return (char)a4;
}

- (BOOL)setInfoDictionary:(id)a3 error:(id *)a4
{
  id v6;
  PUIPosterSnapshotBundle *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  NSDictionary *infoDictionary;
  id v16;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[PUIPosterSnapshotBundle URLForComponent:](v7, "URLForComponent:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 100, 0, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (!v10)
  {
    if (objc_msgSend(v9, "writeToURL:options:error:", v8, 1, a4))
    {
      objc_msgSend(v8, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBCC68], 0);
      v13 = objc_msgSend(v6, "copy");
      infoDictionary = v7->_infoDictionary;
      v7->_infoDictionary = (NSDictionary *)v13;

      v12 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  if (!a4)
    goto LABEL_6;
  v12 = 0;
  *a4 = objc_retainAutorelease(v10);
LABEL_7:

  objc_sync_exit(v7);
  return v12;
}

- (NSDate)dateCreated
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_safeObjectForKey:ofType:", CFSTR("PUIPosterSnapshotBundleInfoKeyDateCreated"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    PUIPosterSnapshotBundleSharedDateFormatter();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSDate *)v6;
}

- (unint64_t)snapshotEpoch
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotEpoch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)snapshotBundleVersion
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotBundleVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)posterVersion
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyPosterVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (int64_t)interfaceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyInterfaceOrientation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (int64_t)deviceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyDeviceInterfaceOrientation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (NSString)hardwareIdentifier
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyHardwareIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)snapshotLevelSets
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotLevels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x24BDD1620];
        objc_opt_self();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "unarchivedObjectOfClass:fromData:error:", v12, v10, 0, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bs_safeAddObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return (NSArray *)v14;
}

- (CGSize)assetSize
{
  void *v2;
  NSString *v3;
  CGSize v4;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  CGSize result;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyAssetSize"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = CGSizeFromString(v3);
    width = v4.width;
    height = v4.height;
  }
  else
  {
    width = *(double *)(MEMORY[0x24BDBF028] + 16);
    height = *(double *)(MEMORY[0x24BDBF028] + 24);
  }

  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)snapshotScale
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyScale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_25156AD80;
  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  return v6;
}

- (int64_t)userInterfaceStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyUserInterfaceStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (NSUUID)posterUUID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_safeObjectForKey:ofType:", CFSTR("PUIPosterSnapshotBundleInfoKeyPosterUUID"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
  else
    v5 = 0;

  return (NSUUID *)v5;
}

- (NSString)posterProvider
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyPosterProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIImage)foregroundSnapshot
{
  return (UIImage *)-[PUIPosterSnapshotBundle _decodeImageForComponent:error:](self, "_decodeImageForComponent:error:", 5, 0);
}

- (UIImage)floatingSnapshot
{
  return (UIImage *)-[PUIPosterSnapshotBundle _decodeImageForComponent:error:](self, "_decodeImageForComponent:error:", 7, 0);
}

- (UIImage)backgroundSnapshot
{
  return (UIImage *)-[PUIPosterSnapshotBundle _decodeImageForComponent:error:](self, "_decodeImageForComponent:error:", 6, 0);
}

- (UIImage)compositeSnapshot
{
  return (UIImage *)-[PUIPosterSnapshotBundle _decodeImageForComponent:error:](self, "_decodeImageForComponent:error:", 8, 0);
}

- (NSString)snapshotDefinitionIdentifier
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotBundle infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotDefinitionIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_decodeImageForComponent:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  PUIImageEncoder *v15;
  void *v16;
  id v17;
  id v19;

  if ((unint64_t)(a3 - 5) <= 4)
  {
    v7 = (void *)MEMORY[0x249515064](self, a2);
    if (self->_levelToImage)
    {
      _posterLevelSetForComponent(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](self->_levelToImage, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v9;

        objc_autoreleasePoolPop(v7);
LABEL_13:

        return v10;
      }

    }
    if (self->_bundleURL)
    {
      -[PUIPosterSnapshotBundle interfaceOrientation](self, "interfaceOrientation");
      -[PUIPosterSnapshotBundle deviceOrientation](self, "deviceOrientation");
      -[PUIPosterSnapshotBundle snapshotScale](self, "snapshotScale");
      v12 = v11;
      PUIPosterSnapshotBundleURLForComponent(self->_bundleURL, a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterSnapshotBundle ondiskFormat](self, "ondiskFormat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PUIImageEncoder initWithURL:format:]([PUIImageEncoder alloc], "initWithURL:format:", v13, v14);
      v19 = 0;
      -[PUIImageEncoder createUIImageWithOrientation:scale:error:](v15, "createUIImageWithOrientation:scale:error:", PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation(), &v19, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v19;

      objc_autoreleasePoolPop(v7);
      if (a4 && v17)
      {
        v17 = objc_retainAutorelease(v17);
        *a4 = v17;
      }
    }
    else
    {
      objc_autoreleasePoolPop(v7);
      v16 = 0;
      v17 = 0;
    }
    v10 = v16;

    goto LABEL_13;
  }
  v10 = 0;
  return v10;
}

- (id)_decodeImageForLevelSet:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  PUIImageEncoder *v15;

  v6 = a3;
  v7 = _componentForLevelSet(v6);
  if (v7)
  {
    -[PUIPosterSnapshotBundle _decodeImageForComponent:error:](self, "_decodeImageForComponent:error:", v7, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSDictionary objectForKey:](self->_levelToImage, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v8 = v9;
    }
    else if (self->_bundleURL)
    {
      -[PUIPosterSnapshotBundle interfaceOrientation](self, "interfaceOrientation");
      -[PUIPosterSnapshotBundle deviceOrientation](self, "deviceOrientation");
      -[PUIPosterSnapshotBundle snapshotScale](self, "snapshotScale");
      v12 = v11;
      PUIPosterSnapshotBundleURLForPosterLevelSet(self->_bundleURL, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterSnapshotBundle ondiskFormat](self, "ondiskFormat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PUIImageEncoder initWithURL:format:]([PUIImageEncoder alloc], "initWithURL:format:", v13, v14);
      -[PUIImageEncoder createUIImageWithOrientation:scale:error:](v15, "createUIImageWithOrientation:scale:error:", PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation(), a4, v12);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)imageForComponent:(int64_t)a3
{
  return -[PUIPosterSnapshotBundle _decodeImageForComponent:error:](self, "_decodeImageForComponent:error:", a3, 0);
}

- (id)snapshotForLevelSet:(id)a3
{
  return -[PUIPosterSnapshotBundle _decodeImageForLevelSet:error:](self, "_decodeImageForLevelSet:error:", a3, 0);
}

- (PUIImageOnDiskFormat)ondiskFormat
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[PUIPosterSnapshotBundle objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PUIPosterSnapshotBundleInfoKeySnapshotImageFormat"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("atx")))
  {
    if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("png")))
      +[PUIImageOnDiskFormat defaultFormat](PUIImageOnDiskFormat, "defaultFormat");
    else
      +[PUIImageOnDiskFormat png](PUIImageOnDiskFormat, "png");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PUIImageOnDiskFormat defaultATX](PUIImageOnDiskFormat, "defaultATX");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return (PUIImageOnDiskFormat *)v4;
}

- (PUIColorStatistics)colorStatistics
{
  PUIPosterSnapshotBundle *v2;
  PUIColorStatistics *colorStatistics;
  PUIColorStatistics *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PUIColorStatistics *v13;

  v2 = self;
  objc_sync_enter(v2);
  colorStatistics = v2->_colorStatistics;
  if (colorStatistics)
  {
    v4 = colorStatistics;
  }
  else
  {
    -[PUIPosterSnapshotBundle infoDictionary](v2, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("PUIPosterSnapshotBundleInfoKeyContainsColorStatistics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) != 0)
    {
      PUIPosterSnapshotBundleURLForComponent(v2->_bundleURL, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v8, 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDD1620];
      objc_opt_self();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unarchivedObjectOfClass:fromData:error:", v11, v9, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v2->_colorStatistics;
      v2->_colorStatistics = (PUIColorStatistics *)v12;

      v4 = v2->_colorStatistics;
    }
    else
    {
      v4 = 0;
    }
  }
  objc_sync_exit(v2);

  return v4;
}

- (NSURL)bundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)bootSessionidentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootSessionidentifier, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_levelToImage, 0);
  objc_storeStrong((id *)&self->_colorStatistics, 0);
}

@end
