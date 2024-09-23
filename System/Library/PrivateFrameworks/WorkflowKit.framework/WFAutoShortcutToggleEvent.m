@implementation WFAutoShortcutToggleEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)toggleType
{
  return self->_toggleType;
}

- (void)setToggleType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleType, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
