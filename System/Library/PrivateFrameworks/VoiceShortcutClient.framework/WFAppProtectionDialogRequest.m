@implementation WFAppProtectionDialogRequest

- (WFAppProtectionDialogRequest)initWithAppBundleIdentifier:(id)a3
{
  id v5;
  WFDialogAttribution *v6;
  WFAppProtectionDialogRequest *v7;
  WFAppProtectionDialogRequest *v8;
  objc_super v10;

  v5 = a3;
  v6 = -[WFDialogAttribution initWithTitle:icon:]([WFDialogAttribution alloc], "initWithTitle:icon:", 0, 0);
  v10.receiver = self;
  v10.super_class = (Class)WFAppProtectionDialogRequest;
  v7 = -[WFDialogRequest initWithAttribution:prompt:](&v10, sel_initWithAttribution_prompt_, v6, 0);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_bundleIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAppProtectionDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFAppProtectionDialogRequest bundleIdentifier](self, "bundleIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

}

- (WFAppProtectionDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFAppProtectionDialogRequest *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  WFAppProtectionDialogRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFAppProtectionDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
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
