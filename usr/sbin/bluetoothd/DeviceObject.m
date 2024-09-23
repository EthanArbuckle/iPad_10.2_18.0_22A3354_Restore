@implementation DeviceObject

- (DeviceObject)initWithDevice:(id)a3 andBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  DeviceObject *v9;
  DeviceObject *v10;
  uint64_t v11;
  NSMutableArray *bundleIdentifiers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DeviceObject;
  v9 = -[DeviceObject init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    bundleIdentifiers = v10->_bundleIdentifiers;
    v10->_bundleIdentifiers = (NSMutableArray *)v11;

    if (v8)
      -[NSMutableArray addObject:](v10->_bundleIdentifiers, "addObject:", v8);
  }

  return v10;
}

- (NSUUID)device
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)bundleIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
