@implementation SBNewWindowRequestSwitcherEventResponse

- (SBNewWindowRequestSwitcherEventResponse)initWithBundleIdentifier:(id)a3
{
  id v4;
  SBNewWindowRequestSwitcherEventResponse *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBNewWindowRequestSwitcherEventResponse;
  v5 = -[SBChainableModifierEventResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (int64_t)type
{
  return 21;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
