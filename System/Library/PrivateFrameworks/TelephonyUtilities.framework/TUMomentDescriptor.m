@implementation TUMomentDescriptor

- (TUMomentDescriptor)initWithPhotosAppAssetIdentifier:(id)a3
{
  id v5;
  TUMomentDescriptor *v6;
  TUMomentDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUMomentDescriptor;
  v6 = -[TUMomentDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_photosAssetIdentifier, a3);

  return v7;
}

- (TUMomentDescriptor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUMomentDescriptor.m"), 25, CFSTR("%s is unavailable"), "-[TUMomentDescriptor init]");

  return 0;
}

- (NSURL)photoViewingAppURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TUMomentDescriptor photosAssetIdentifier](self, "photosAssetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("photos://asset?identifier=%@&albumname=camera-roll"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUMomentDescriptor photosAssetIdentifier](self, "photosAssetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" pAI=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (TUMomentDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  TUMomentDescriptor *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_photosAssetIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TUMomentDescriptor initWithPhotosAppAssetIdentifier:](self, "initWithPhotosAppAssetIdentifier:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TUMomentDescriptor photosAssetIdentifier](self, "photosAssetIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_photosAssetIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)photosAssetIdentifier
{
  return self->_photosAssetIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosAssetIdentifier, 0);
}

@end
