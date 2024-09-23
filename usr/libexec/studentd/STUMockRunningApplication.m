@implementation STUMockRunningApplication

- (STUMockRunningApplication)initWithBundleIdentifier:(id)a3
{
  id v4;
  STUMockRunningApplication *v5;
  NSString *v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUMockRunningApplication;
  v5 = -[STUMockRunningApplication init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v6;

  }
  return v5;
}

- (BOOL)activateWithOptions:(unint64_t)a3
{
  return 1;
}

- (BOOL)hide
{
  return 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
