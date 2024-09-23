@implementation SBIconViewDragInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueIdentifier;
  id v5;

  uniqueIdentifier = self->_uniqueIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_launchURL, CFSTR("launchURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_startLocation, CFSTR("startLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customIconDataSourceConfigurations, CFSTR("customIconDataSourceConfigurations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeCustomIconDataSourceUniqueIdentifier, CFSTR("activeCustomIconDataSourceUniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gridSizeClass, CFSTR("gridSizeClass"));

}

- (SBIconViewDragInfo)initWithCoder:(id)a3
{
  id v4;
  SBIconViewDragInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *uniqueIdentifier;
  void *v9;
  uint64_t v10;
  NSString *applicationBundleIdentifier;
  void *v12;
  uint64_t v13;
  NSURL *launchURL;
  uint64_t v15;
  NSArray *customIconDataSourceConfigurations;
  uint64_t v17;
  NSString *activeCustomIconDataSourceUniqueIdentifier;
  void *v19;
  uint64_t v20;
  NSString *gridSizeClass;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBIconViewDragInfo;
  v5 = -[SBIconViewDragInfo init](&v23, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("uniqueIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("applicationBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v10;

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("launchURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    launchURL = v5->_launchURL;
    v5->_launchURL = (NSURL *)v13;

    v5->_startLocation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("startLocation"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("customIconDataSourceConfigurations"));
    v15 = objc_claimAutoreleasedReturnValue();
    customIconDataSourceConfigurations = v5->_customIconDataSourceConfigurations;
    v5->_customIconDataSourceConfigurations = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("activeCustomIconDataSourceUniqueIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    activeCustomIconDataSourceUniqueIdentifier = v5->_activeCustomIconDataSourceUniqueIdentifier;
    v5->_activeCustomIconDataSourceUniqueIdentifier = (NSString *)v17;

    objc_opt_self();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, CFSTR("gridSizeClass"));
    v20 = objc_claimAutoreleasedReturnValue();
    gridSizeClass = v5->_gridSizeClass;
    v5->_gridSizeClass = (NSString *)v20;

  }
  return v5;
}

- (NSString)description
{
  return (NSString *)-[SBIconViewDragInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconViewDragInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconViewDragInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_launchURL, CFSTR("launchURL"));
  v8 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_startLocation, CFSTR("startLocation"));
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", self->_customIconDataSourceConfigurations, CFSTR("customIconDataSourceConfigurations"));
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", self->_activeCustomIconDataSourceUniqueIdentifier, CFSTR("activeCustomIconDataSourceUniqueIdentifier"));
  objc_msgSend(v4, "appendString:withName:", self->_gridSizeClass, CFSTR("gridSizeClass"));
  return v4;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(int64_t)a3
{
  self->_startLocation = a3;
}

- (NSString)activeCustomIconDataSourceUniqueIdentifier
{
  return self->_activeCustomIconDataSourceUniqueIdentifier;
}

- (void)setActiveCustomIconDataSourceUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)customIconDataSourceConfigurations
{
  return self->_customIconDataSourceConfigurations;
}

- (void)setCustomIconDataSourceConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (void)setGridSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_customIconDataSourceConfigurations, 0);
  objc_storeStrong((id *)&self->_activeCustomIconDataSourceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
