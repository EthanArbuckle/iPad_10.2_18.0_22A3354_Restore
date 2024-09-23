@implementation ICQUsageApp

- (float)dataSize
{
  float v3;
  float v4;
  float v5;

  -[ICQUsageApp dynamicSize](self, "dynamicSize");
  v4 = v3;
  -[ICQUsageApp specialSize](self, "specialSize");
  return v4 + v5;
}

- (float)totalSize
{
  float v3;
  float v4;
  float v5;

  -[ICQUsageApp staticSize](self, "staticSize");
  v4 = v3;
  -[ICQUsageApp dataSize](self, "dataSize");
  return v4 + v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleVersion, a3);
}

- (float)staticSize
{
  return self->_staticSize;
}

- (void)setStaticSize:(float)a3
{
  self->_staticSize = a3;
}

- (float)dynamicSize
{
  return self->_dynamicSize;
}

- (void)setDynamicSize:(float)a3
{
  self->_dynamicSize = a3;
}

- (float)specialSize
{
  return self->_specialSize;
}

- (void)setSpecialSize:(float)a3
{
  self->_specialSize = a3;
}

- (BOOL)isSystemApp
{
  return self->_systemApp;
}

- (void)setSystemApp:(BOOL)a3
{
  self->_systemApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
