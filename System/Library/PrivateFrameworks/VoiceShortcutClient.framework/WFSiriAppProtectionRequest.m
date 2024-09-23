@implementation WFSiriAppProtectionRequest

- (WFSiriAppProtectionRequest)initWithBundleIdentifier:(id)a3
{
  id v5;
  WFSiriAppProtectionRequest *v6;
  WFSiriAppProtectionRequest *v7;
  WFSiriAppProtectionRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriAppProtectionRequest;
  v6 = -[WFSiriActionRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (WFSiriAppProtectionRequest)initWithCoder:(id)a3
{
  id v4;
  WFSiriAppProtectionRequest *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  WFSiriAppProtectionRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriAppProtectionRequest;
  v5 = -[WFSiriActionRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSiriAppProtectionRequest;
  v4 = a3;
  -[WFSiriActionRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSiriAppProtectionRequest bundleIdentifier](self, "bundleIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
