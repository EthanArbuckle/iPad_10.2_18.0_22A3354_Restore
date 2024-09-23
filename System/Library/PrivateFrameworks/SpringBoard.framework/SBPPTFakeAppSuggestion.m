@implementation SBPPTFakeAppSuggestion

- (SBPPTFakeAppSuggestion)initWithBundleIdentifier:(id)a3
{
  id v5;
  SBPPTFakeAppSuggestion *v6;
  uint64_t v7;
  NSUUID *uuid;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBPPTFakeAppSuggestion;
  v6 = -[SBPPTFakeAppSuggestion init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v6;
}

- (id)uniqueIdentifier
{
  return self->_uuid;
}

- (id)bundleIdentifier
{
  return (id)-[NSString copy](self->_bundleIdentifier, "copy");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPPTFakeAppSuggestion uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SBPPTFakeAppSuggestion uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)activityType
{
  return CFSTR("Testing");
}

- (id)originatingDeviceName
{
  return CFSTR("Simulated Cute Device Name");
}

- (id)originatingDeviceType
{
  return CFSTR("Simulated iPhone");
}

- (id)suggestedLocationName
{
  return CFSTR("Work");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
