@implementation ICNavigationItemConfiguration

- (BOOL)updateAnimated:(BOOL)a3
{
  _BOOL4 v4;

  v4 = -[ICNavigationItemConfiguration needsUpdate](self, "needsUpdate", a3);
  if (v4)
    -[ICNavigationItemConfiguration setLastUpdateHash:](self, "setLastUpdateHash:", -[ICNavigationItemConfiguration hash](self, "hash"));
  return v4;
}

- (void)setLastUpdateHash:(unint64_t)a3
{
  self->_lastUpdateHash = a3;
}

- (void)reset
{
  -[ICNavigationItemConfiguration setLastUpdateHash:](self, "setLastUpdateHash:", -1);
}

- (BOOL)needsUpdate
{
  uint64_t v3;

  v3 = -[ICNavigationItemConfiguration hash](self, "hash");
  return v3 != -[ICNavigationItemConfiguration lastUpdateHash](self, "lastUpdateHash");
}

- (unint64_t)lastUpdateHash
{
  return self->_lastUpdateHash;
}

- (ICNavigationItemConfiguration)init
{
  ICNavigationItemConfiguration *v2;
  ICNavigationItemConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNavigationItemConfiguration;
  v2 = -[ICNavigationItemConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ICNavigationItemConfiguration reset](v2, "reset");
  return v3;
}

@end
