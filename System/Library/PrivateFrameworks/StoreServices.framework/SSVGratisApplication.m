@implementation SSVGratisApplication

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleIdentifier;
  NSString *bundleVersion;
  NSNumber *externalVersionIdentifier;
  NSString *itemIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", bundleIdentifier, CFSTR("bid"));
  bundleVersion = self->_bundleVersion;
  if (bundleVersion)
    objc_msgSend(v4, "setObject:forKey:", bundleVersion, CFSTR("bvrs"));
  externalVersionIdentifier = self->_externalVersionIdentifier;
  if (externalVersionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", externalVersionIdentifier, CFSTR("vid"));
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier)
    objc_msgSend(v4, "setObject:forKey:", itemIdentifier, CFSTR("id"));
  return (NSDictionary *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setBundleIdentifier:", self->_bundleIdentifier);
  objc_msgSend(v4, "setBundleVersion:", self->_bundleVersion);
  objc_msgSend(v4, "setExternalVersionIdentifier:", self->_externalVersionIdentifier);
  objc_msgSend(v4, "setItemIdentifier:", self->_itemIdentifier);
  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
