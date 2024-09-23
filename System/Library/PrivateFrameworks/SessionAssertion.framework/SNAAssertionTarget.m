@implementation SNAAssertionTarget

- (SNAAssertionTarget)initWithBundleIdentifier:(id)a3
{
  id v5;
  SNAAssertionTarget *v6;
  SNAAssertionTarget *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNAAssertionTarget;
  v6 = -[SNAAssertionTarget init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
