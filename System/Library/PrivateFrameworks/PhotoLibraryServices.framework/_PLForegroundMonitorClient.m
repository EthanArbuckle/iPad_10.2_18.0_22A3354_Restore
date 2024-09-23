@implementation _PLForegroundMonitorClient

- (_PLForegroundMonitorClient)initWithBundleIdentifiers:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _PLForegroundMonitorClient *v8;
  uint64_t v9;
  NSSet *bundleIdentifiers;
  uint64_t v11;
  id block;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PLForegroundMonitorClient;
  v8 = -[_PLForegroundMonitorClient init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleIdentifiers = v8->_bundleIdentifiers;
    v8->_bundleIdentifiers = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    block = v8->_block;
    v8->_block = (id)v11;

  }
  return v8;
}

- (NSSet)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

@end
