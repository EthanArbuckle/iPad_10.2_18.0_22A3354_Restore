@implementation SUSUIFakeSURollbackDescriptor

- (SUSUIFakeSURollbackDescriptor)init
{
  SUSUIFakeSURollbackDescriptor *v3;
  objc_super v4;
  SEL v5;
  SUSUIFakeSURollbackDescriptor *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSUIFakeSURollbackDescriptor;
  v6 = -[SURollbackDescriptor init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)restoreVersion
{
  return CFSTR("99.1.100.0.0");
}

- (id)productVersion
{
  return CFSTR("99.1");
}

- (id)productBuildVersion
{
  return CFSTR("99A100");
}

- (id)releaseType
{
  return CFSTR("Internal");
}

@end
