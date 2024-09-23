@implementation BlockedPlugin

- (id)init:(id)a3 plugName:(id)a4 plugVersion:(id)a5
{
  BlockedPlugin *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BlockedPlugin;
  v8 = -[BlockedPlugin init](&v10, sel_init);
  if (v8)
  {
    v8->_bundleName = (NSString *)a3;
    v8->_plugName = (NSString *)a4;
    v8->_plugVersion = (NSString *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BlockedPlugin;
  -[BlockedPlugin dealloc](&v3, sel_dealloc);
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (NSString)plugName
{
  return self->_plugName;
}

- (NSString)plugVersion
{
  return self->_plugVersion;
}

@end
