@implementation PPTTLDeletionPolicyRule

- (PPTTLDeletionPolicyRule)initWithBundleIdentifier:(id)a3 groupIdentifier:(id)a4 maxAgeSeconds:(id)a5
{
  id v9;
  id v10;
  id v11;
  PPTTLDeletionPolicyRule *v12;
  PPTTLDeletionPolicyRule *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PPTTLDeletionPolicyRule;
  v12 = -[PPTTLDeletionPolicyRule init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v13->_groupIdentifier, a4);
    objc_storeStrong((id *)&v13->_maxAgeSeconds, a5);
  }

  return v13;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPTTLDeletionPolicyRule b:%@ g:%@ m:%@>"), self->_bundleIdentifier, self->_groupIdentifier, self->_maxAgeSeconds);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSNumber)maxAgeSeconds
{
  return self->_maxAgeSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxAgeSeconds, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
