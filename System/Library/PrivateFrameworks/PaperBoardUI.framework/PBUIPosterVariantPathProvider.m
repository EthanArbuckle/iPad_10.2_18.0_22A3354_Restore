@implementation PBUIPosterVariantPathProvider

- (PBUIPosterVariantPathProvider)initWithInstanceURL:(id)a3 variant:(int64_t)a4
{
  id v7;
  PBUIPosterVariantPathProvider *v8;
  PBUIPosterVariantPathProvider *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBUIPosterVariantPathProvider;
  v8 = -[PBUIPosterVariantPathProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_instanceURL, a3);
    v9->_variant = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PBUIPosterVariantPathProvider *v4;
  PBUIPosterVariantPathProvider *v5;
  BOOL v6;

  v4 = (PBUIPosterVariantPathProvider *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PBUIPosterVariantPathProvider isEqualToPosterVariantPathProvider:](self, "isEqualToPosterVariantPathProvider:", v5);

  return v6;
}

- (BOOL)isEqualToPosterVariantPathProvider:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = objc_msgSend(v4, "variant"), v6 == -[PBUIPosterVariantPathProvider variant](self, "variant")))
  {
    -[PBUIPosterVariantPathProvider snapshotContentDirectory](self, "snapshotContentDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "snapshotContentDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)snapshotContentDirectory
{
  return self->_instanceURL;
}

- (NSURL)snapshotURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[PBUIPosterVariantViewController snapshotFormat](PBUIPosterVariantViewController, "snapshotFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filenameExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBUIPosterVariantPathProvider snapshotContentDirectory](self, "snapshotContentDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  PBUIStringForWallpaperVariant(-[PBUIPosterVariantPathProvider variant](self, "variant"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("RuntimeSnapshot-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathExtension:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v10;
}

- (NSURL)snapshotMetadataURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PBUIPosterVariantPathProvider snapshotContentDirectory](self, "snapshotContentDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  PBUIStringForWallpaperVariant(-[PBUIPosterVariantPathProvider variant](self, "variant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("RuntimeSnapshotMetadata-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:conformingToType:", v6, *MEMORY[0x1E0CEC5A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (NSURL)snapshotColorStatisticsURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PBUIPosterVariantPathProvider snapshotContentDirectory](self, "snapshotContentDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  PBUIStringForWallpaperVariant(-[PBUIPosterVariantPathProvider variant](self, "variant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("RuntimeSnapshotColorStatisticsMetadata-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:conformingToType:", v6, *MEMORY[0x1E0CEC5A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (NSURL)instanceURL
{
  return self->_instanceURL;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceURL, 0);
}

@end
