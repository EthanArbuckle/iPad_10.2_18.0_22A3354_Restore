@implementation PRSWallpaperObserverSnapshotUpdate

- (PRSWallpaperObserverSnapshotUpdate)initWithPath:(id)a3 snapshotType:(id)a4
{
  id v7;
  id v8;
  PRSWallpaperObserverSnapshotUpdate *v9;
  uint64_t v10;
  NSString *snapshotType;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PRSWallpaperObserverSnapshotUpdate;
  v9 = -[PRSWallpaperObserverSnapshotUpdate init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    snapshotType = v9->_snapshotType;
    v9->_snapshotType = (NSString *)v10;

    objc_storeStrong((id *)&v9->_path, a3);
  }

  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  PFServerPosterPath *path;
  id v5;

  path = self->_path;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", path, CFSTR("p"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_snapshotType, CFSTR("t"));

}

- (PRSWallpaperObserverSnapshotUpdate)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRSWallpaperObserverSnapshotUpdate *v5;
  uint64_t v6;
  PFServerPosterPath *path;
  uint64_t v8;
  NSString *snapshotType;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSWallpaperObserverSnapshotUpdate;
  v5 = -[PRSWallpaperObserverSnapshotUpdate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("p"));
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (PFServerPosterPath *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t"));
    v8 = objc_claimAutoreleasedReturnValue();
    snapshotType = v5->_snapshotType;
    v5->_snapshotType = (NSString *)v8;

  }
  return v5;
}

- (NSString)description
{
  NSString *snapshotType;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;

  snapshotType = self->_snapshotType;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFServerPosterPath identity](self->_path, "identity");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (snapshotType)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: path=(%@) snapshotType=(%@)>"), v6, v7, self->_snapshotType);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: path=(%@)>"), v6, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (NSString)snapshotType
{
  return self->_snapshotType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotType, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
