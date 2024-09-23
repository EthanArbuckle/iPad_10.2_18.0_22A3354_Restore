@implementation PKDownloadRemoteAssetConfiguration

- (PKDownloadRemoteAssetConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDownloadRemoteAssetConfiguration;
  return -[PKDownloadRemoteAssetConfiguration init](&v3, sel_init);
}

+ (id)configurationWithSEIDs:(id)a3
{
  NSArray *v3;
  PKDownloadRemoteAssetConfiguration *v4;
  NSArray *seids;

  v3 = (NSArray *)a3;
  v4 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  seids = v4->_seids;
  v4->_seids = v3;

  return v4;
}

+ (id)configurationWithCloudStoreDelegate:(id)a3
{
  PKCloudStoreCoordinatorDelegate *v3;
  PKDownloadRemoteAssetConfiguration *v4;
  PKCloudStoreCoordinatorDelegate *cloudStoreCoordinatorDelegate;

  v3 = (PKCloudStoreCoordinatorDelegate *)a3;
  v4 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  cloudStoreCoordinatorDelegate = v4->_cloudStoreCoordinatorDelegate;
  v4->_cloudStoreCoordinatorDelegate = v3;

  return v4;
}

+ (id)configurationWithCloudStoreDelegate:(id)a3 seids:(id)a4
{
  PKCloudStoreCoordinatorDelegate *v5;
  NSArray *v6;
  PKDownloadRemoteAssetConfiguration *v7;
  PKCloudStoreCoordinatorDelegate *cloudStoreCoordinatorDelegate;
  PKCloudStoreCoordinatorDelegate *v9;
  NSArray *seids;

  v5 = (PKCloudStoreCoordinatorDelegate *)a3;
  v6 = (NSArray *)a4;
  v7 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  cloudStoreCoordinatorDelegate = v7->_cloudStoreCoordinatorDelegate;
  v7->_cloudStoreCoordinatorDelegate = v5;
  v9 = v5;

  seids = v7->_seids;
  v7->_seids = v6;

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("seids: '%@'; "), self->_seids);
  objc_msgSend(v6, "appendFormat:", CFSTR("cloudStoreCoordinatorDelegate: '%@'; "),
    self->_cloudStoreCoordinatorDelegate);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_screenScale);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("screenScale: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("suffix: '%@'; "), self->_suffix);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ignoreRequiredAssetDownloadFailures);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("ignoreRequiredAssetDownloadFailures: '%@'; "), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_seids)
    objc_msgSend(v3, "addObject:");
  if (self->_cloudStoreCoordinatorDelegate)
    objc_msgSend(v4, "addObject:");
  if (self->_suffix)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = (unint64_t)self->_screenScale - v5 + 32 * v5;
  v7 = self->_ignoreRequiredAssetDownloadFailures - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKDownloadRemoteAssetConfiguration *v4;
  PKDownloadRemoteAssetConfiguration *v5;
  BOOL v6;

  v4 = (PKDownloadRemoteAssetConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKDownloadRemoteAssetConfiguration isEqualToDownloadRemoteAssetConfiguration:](self, "isEqualToDownloadRemoteAssetConfiguration:", v5);

  return v6;
}

- (BOOL)isEqualToDownloadRemoteAssetConfiguration:(id)a3
{
  double *v4;
  NSArray *seids;
  NSArray *v6;
  BOOL v7;
  PKCloudStoreCoordinatorDelegate *cloudStoreCoordinatorDelegate;
  PKCloudStoreCoordinatorDelegate *v9;
  NSString *suffix;
  NSString *v11;
  BOOL v12;

  v4 = (double *)a3;
  seids = self->_seids;
  v6 = (NSArray *)*((_QWORD *)v4 + 2);
  if (seids)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (seids != v6)
      goto LABEL_20;
  }
  else if ((-[NSArray isEqual:](seids, "isEqual:") & 1) == 0)
  {
    goto LABEL_20;
  }
  cloudStoreCoordinatorDelegate = self->_cloudStoreCoordinatorDelegate;
  v9 = (PKCloudStoreCoordinatorDelegate *)*((_QWORD *)v4 + 3);
  if (cloudStoreCoordinatorDelegate && v9)
  {
    if ((-[PKCloudStoreCoordinatorDelegate isEqual:](cloudStoreCoordinatorDelegate, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (cloudStoreCoordinatorDelegate != v9)
  {
    goto LABEL_20;
  }
  if (self->_screenScale != v4[4])
    goto LABEL_20;
  suffix = self->_suffix;
  v11 = (NSString *)*((_QWORD *)v4 + 5);
  if (!suffix || !v11)
  {
    if (suffix == v11)
      goto LABEL_18;
LABEL_20:
    v12 = 0;
    goto LABEL_21;
  }
  if ((-[NSString isEqual:](suffix, "isEqual:") & 1) == 0)
    goto LABEL_20;
LABEL_18:
  v12 = self->_ignoreRequiredAssetDownloadFailures == *((unsigned __int8 *)v4 + 8);
LABEL_21:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKDownloadRemoteAssetConfiguration *v4;
  uint64_t v5;
  NSArray *seids;
  uint64_t v7;
  NSString *suffix;

  v4 = -[PKDownloadRemoteAssetConfiguration init](+[PKDownloadRemoteAssetConfiguration allocWithZone:](PKDownloadRemoteAssetConfiguration, "allocWithZone:", a3), "init");
  v5 = -[NSArray copy](self->_seids, "copy");
  seids = v4->_seids;
  v4->_seids = (NSArray *)v5;

  objc_storeStrong((id *)&v4->_cloudStoreCoordinatorDelegate, self->_cloudStoreCoordinatorDelegate);
  v4->_screenScale = self->_screenScale;
  v7 = -[NSString copy](self->_suffix, "copy");
  suffix = v4->_suffix;
  v4->_suffix = (NSString *)v7;

  v4->_ignoreRequiredAssetDownloadFailures = self->_ignoreRequiredAssetDownloadFailures;
  return v4;
}

- (NSArray)seids
{
  return self->_seids;
}

- (void)setSeids:(id)a3
{
  objc_storeStrong((id *)&self->_seids, a3);
}

- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinatorDelegate
{
  return self->_cloudStoreCoordinatorDelegate;
}

- (void)setCloudStoreCoordinatorDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStoreCoordinatorDelegate, a3);
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_suffix, a3);
}

- (BOOL)ignoreRequiredAssetDownloadFailures
{
  return self->_ignoreRequiredAssetDownloadFailures;
}

- (void)setIgnoreRequiredAssetDownloadFailures:(BOOL)a3
{
  self->_ignoreRequiredAssetDownloadFailures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_cloudStoreCoordinatorDelegate, 0);
  objc_storeStrong((id *)&self->_seids, 0);
}

@end
