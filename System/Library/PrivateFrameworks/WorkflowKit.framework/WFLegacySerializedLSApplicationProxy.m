@implementation WFLegacySerializedLSApplicationProxy

- (void)encodeWithCoder:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLegacySerializedLSApplicationProxy.m"), 20, CFSTR("Encoding is not supported, this object should only be used for legacy deserialization of LSApplicationProxy!"));

}

- (WFLegacySerializedLSApplicationProxy)initWithCoder:(id)a3
{
  id v4;
  WFLegacySerializedLSApplicationProxy *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  WFLegacySerializedLSApplicationProxy *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLegacySerializedLSApplicationProxy;
  v5 = -[WFLegacySerializedLSApplicationProxy init](&v10, sel_init);
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
