@implementation PRSWallpaperObserverPathUpdate

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_identity, CFSTR("i"));
  objc_msgSend(v5, "encodeUInt64:forKey:", self->_locations, CFSTR("l"));
  objc_msgSend(v5, "encodeUInt64:forKey:", self->_changed, CFSTR("c"));

}

- (PRSWallpaperObserverPathUpdate)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRSWallpaperObserverPathUpdate *v5;
  uint64_t v6;
  PFServerPosterPath *path;
  uint64_t v8;
  PFServerPosterIdentity *identity;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSWallpaperObserverPathUpdate;
  v5 = -[PRSWallpaperObserverPathUpdate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("p"));
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (PFServerPosterPath *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v8 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (PFServerPosterIdentity *)v8;

    v5->_locations = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("l"));
    v5->_changed = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("c"));
  }

  return v5;
}

- (NSString)description
{
  PFServerPosterPath *path;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  path = self->_path;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PRSWallpaperObserverLocationsDescription(self->_locations);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PRSWallpaperObserverLocationsDescription(self->_changed);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (path)
  {
    -[PFServerPosterPath identity](self->_path, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: locs=(%@) changed=(%@) path=%@>"), v6, v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: locs=(%@) changed=(%@) identity=%@>"), v6, v7, v8, self->_identity);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v11;
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (PFServerPosterIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (unint64_t)locations
{
  return self->_locations;
}

- (void)setLocations:(unint64_t)a3
{
  self->_locations = a3;
}

- (unint64_t)changed
{
  return self->_changed;
}

- (void)setChanged:(unint64_t)a3
{
  self->_changed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
