@implementation SAUILayoutModePreference

- (SAUILayoutModePreference)initWithPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  SAUILayoutModePreference *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SAUILayoutModePreference;
  result = -[SAUILayoutModePreference init](&v7, sel_init);
  if (result)
  {
    result->_preferredLayoutMode = a3;
    result->_layoutModeChangeReason = a4;
  }
  return result;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = objc_opt_class();
  SAUIStringFromElementViewLayoutMode(self->_preferredLayoutMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAUIStringFromLayoutModeChangeReason(self->_layoutModeChangeReason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; _preferredLayoutMode: %@; _layoutModeChangeReason: %@>"),
                 v4,
                 self,
                 v5,
                 v6);

  return (NSString *)v7;
}

- (BOOL)layoutModePreferenceMayBeImplicitlyInvalidated
{
  return ((self->_layoutModeChangeReason - 3) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (int64_t)layoutModeChangeReason
{
  return self->_layoutModeChangeReason;
}

@end
