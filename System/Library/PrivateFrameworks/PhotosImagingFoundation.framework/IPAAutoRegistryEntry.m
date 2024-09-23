@implementation IPAAutoRegistryEntry

- (Class)autoSettingsClass
{
  return self->_autoSettingsClass;
}

- (void)setAutoSettingsClass:(Class)a3
{
  objc_storeStrong((id *)&self->_autoSettingsClass, a3);
}

- (BOOL)persistable
{
  return self->_persistable;
}

- (void)setPersistable:(BOOL)a3
{
  self->_persistable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoSettingsClass, 0);
}

@end
