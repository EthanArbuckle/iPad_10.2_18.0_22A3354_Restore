@implementation SSSystemPreferenceResultBuilder

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSSystemPreferenceResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSSystemPreferenceResultBuilder *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSSystemPreferenceResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v9, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "applicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSSystemPreferenceResultBuilder setBundleId:](v5, "setBundleId:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSSystemPreferenceResultBuilder setName:](v5, "setName:", v7);

  }
  return v5;
}

- (id)buildThumbnail
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSSystemPreferenceResultBuilder;
  -[SSResultBuilder buildThumbnail](&v9, sel_buildThumbnail);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder result](self, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesCompactDisplay");

  if (v5)
  {
    -[SSResultBuilder buildBadgingImageWithThumbnail:](self, "buildBadgingImageWithThumbnail:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
