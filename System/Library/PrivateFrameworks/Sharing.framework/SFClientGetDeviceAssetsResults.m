@implementation SFClientGetDeviceAssetsResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFClientGetDeviceAssetsResults)initWithCoder:(id)a3
{
  id v4;
  SFClientGetDeviceAssetsResults *v5;
  id v6;
  SFClientGetDeviceAssetsResults *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFClientGetDeviceAssetsResults;
  v5 = -[SFClientGetDeviceAssetsResults init](&v9, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *assetBundlePath;

  assetBundlePath = self->_assetBundlePath;
  if (assetBundlePath)
    objc_msgSend(a3, "encodeObject:forKey:", assetBundlePath, CFSTR("abp"));
}

- (NSString)assetBundlePath
{
  return self->_assetBundlePath;
}

- (void)setAssetBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetBundlePath, 0);
}

@end
