@implementation OBBundle

+ (OBBundle)bundleWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[OBBundleManager sharedManager](OBBundleManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (OBBundle *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceeIdentifierSetsCache, 0);
  objc_storeStrong((id *)&self->_replacementPreconditionCache, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

- (NSBundle)underlyingBundle
{
  return self->_bundle;
}

+ (id)bundleAtPath:(id)a3 isLinkBundle:(BOOL)a4 isReplacementBundle:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  OBBundle *v8;

  v5 = a5;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = -[OBBundle initWithBundle:isLinkBundle:isReplacementBundle:]([OBBundle alloc], "initWithBundle:isLinkBundle:isReplacementBundle:", v7, v6, v5);
  else
    v8 = 0;

  return v8;
}

- (OBBundle)initWithBundle:(id)a3 isLinkBundle:(BOOL)a4 isReplacementBundle:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OBBundle *v10;
  OBBundle *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *bundleVersion;
  void *v16;
  uint64_t v17;
  NSString *name;
  void *v19;
  uint64_t v20;
  NSString *replacementPreconditionCache;
  uint64_t v22;
  NSArray *replaceeIdentifierSetsCache;
  objc_super v25;

  v5 = a5;
  v9 = a3;
  v25.receiver = self;
  v25.super_class = (Class)OBBundle;
  v10 = -[OBBundle init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundle, a3);
    objc_msgSend(v9, "bundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_msgSend(v9, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
    v14 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v11->_bundleVersion;
    v11->_bundleVersion = (NSString *)v14;

    v11->_isPlaceholder = 0;
    v11->_isLinkBundle = a4;
    -[NSString componentsSeparatedByString:](v11->_identifier, "componentsSeparatedByString:", CFSTR("com.apple.onboarding."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = objc_claimAutoreleasedReturnValue();
    name = v11->_name;
    v11->_name = (NSString *)v17;

    v11->_isReplacementBundle = v5;
    if (v5)
    {
      -[OBBundle privacyFlow](v11, "privacyFlow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "replacementPrecondition");
      v20 = objc_claimAutoreleasedReturnValue();
      replacementPreconditionCache = v11->_replacementPreconditionCache;
      v11->_replacementPreconditionCache = (NSString *)v20;

      objc_msgSend(v19, "replaceeIdentifierSets");
      v22 = objc_claimAutoreleasedReturnValue();
      replaceeIdentifierSetsCache = v11->_replaceeIdentifierSetsCache;
      v11->_replaceeIdentifierSetsCache = (NSArray *)v22;

    }
  }

  return v11;
}

- (NSString)replacementPreconditionCache
{
  return self->_replacementPreconditionCache;
}

- (id)privacyFlow
{
  return +[OBPrivacyFlow flowWithBundle:](OBPrivacyFlow, "flowWithBundle:", self);
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)bundleAtPath:(id)a3
{
  void *v3;
  OBBundle *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[OBBundle initWithBundle:]([OBBundle alloc], "initWithBundle:", v3);
  else
    v4 = 0;

  return v4;
}

+ (id)bundleAtPath:(id)a3 placeholderIdentifier:(id)a4
{
  id v5;
  void *v6;
  OBBundle *v7;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[OBBundle initWithBundle:placeholderIdentifier:]([OBBundle alloc], "initWithBundle:placeholderIdentifier:", v6, v5);
  else
    v7 = 0;

  return v7;
}

- (OBBundle)initWithBundle:(id)a3
{
  return -[OBBundle initWithBundle:isLinkBundle:isReplacementBundle:](self, "initWithBundle:isLinkBundle:isReplacementBundle:", a3, 0, 0);
}

- (OBBundle)initWithBundle:(id)a3 placeholderIdentifier:(id)a4
{
  id v6;
  OBBundle *v7;
  uint64_t v8;
  NSString *identifier;

  v6 = a4;
  v7 = -[OBBundle initWithBundle:](self, "initWithBundle:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_isPlaceholder = 1;
  }

  return v7;
}

+ (id)identifierWithName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.onboarding."), a3);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)isLinkBundle
{
  return self->_isLinkBundle;
}

- (void)setIsLinkBundle:(BOOL)a3
{
  self->_isLinkBundle = a3;
}

- (BOOL)isReplacementBundle
{
  return self->_isReplacementBundle;
}

- (void)setIsReplacementBundle:(BOOL)a3
{
  self->_isReplacementBundle = a3;
}

- (void)setReplacementPreconditionCache:(id)a3
{
  objc_storeStrong((id *)&self->_replacementPreconditionCache, a3);
}

- (NSArray)replaceeIdentifierSetsCache
{
  return self->_replaceeIdentifierSetsCache;
}

- (void)setReplaceeIdentifierSetsCache:(id)a3
{
  objc_storeStrong((id *)&self->_replaceeIdentifierSetsCache, a3);
}

@end
