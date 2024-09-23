@implementation SBAppVisibilityPreferences

- (BOOL)update
{
  BOOL v3;
  BOOL result;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize((CFStringRef)self->_bundleID);
  _CFPreferencesAppSynchronizeWithContainer();
  keyExistsAndHasValidFormat = 0;
  _CFPreferencesGetAppBooleanValueWithContainer();
  v3 = CFPreferencesGetAppBooleanValue(CFSTR("SBIconVisibility"), (CFStringRef)self->_bundleID, &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
    v3 = -[SBAppVisibilityPreferences isDefaultVisible](self, "isDefaultVisible");
  result = v3 ^ -[SBAppVisibilityPreferences isCurrentlyVisible](self, "isCurrentlyVisible");
  self->_currentlyVisible = v3;
  return result;
}

- (BOOL)isDefaultVisible
{
  return self->_defaultVisible;
}

- (BOOL)isCurrentlyVisible
{
  return self->_currentlyVisible;
}

- (SBAppVisibilityPreferences)initWithDefaultVisible:(BOOL)a3 bundleID:(id)a4 containerPath:(id)a5
{
  id v8;
  id v9;
  SBAppVisibilityPreferences *v10;
  uint64_t v11;
  NSString *bundleID;
  uint64_t v13;
  NSString *containerPath;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBAppVisibilityPreferences;
  v10 = -[SBAppVisibilityPreferences init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    containerPath = v10->_containerPath;
    v10->_containerPath = (NSString *)v13;

    v10->_defaultVisible = a3;
    v10->_currentlyVisible = a3;
    -[SBAppVisibilityPreferences update](v10, "update");
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, bundle=%@ default=%i current=%i>"), v5, self, self->_bundleID, -[SBAppVisibilityPreferences isDefaultVisible](self, "isDefaultVisible"), -[SBAppVisibilityPreferences isCurrentlyVisible](self, "isCurrentlyVisible"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)setCurrentlyVisible:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 25) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
