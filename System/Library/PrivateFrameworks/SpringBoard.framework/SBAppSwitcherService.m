@implementation SBAppSwitcherService

+ (id)switcherServiceWithName:(id)a3 viewServiceClassName:(id)a4
{
  id v5;
  id v6;
  SBAppSwitcherService *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SBAppSwitcherService);
  -[SBAppSwitcherService setBundleIdentifier:](v7, "setBundleIdentifier:", v6);

  -[SBAppSwitcherService setViewServiceClassName:](v7, "setViewServiceClassName:", v5);
  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)viewServiceClassName
{
  return self->_viewServiceClassName;
}

- (void)setViewServiceClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewServiceClassName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
