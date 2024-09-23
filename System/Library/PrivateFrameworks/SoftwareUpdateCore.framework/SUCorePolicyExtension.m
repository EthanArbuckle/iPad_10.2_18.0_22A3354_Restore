@implementation SUCorePolicyExtension

- (SUCorePolicyExtension)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUCorePolicyExtension;
  return -[SUCorePolicyExtension init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyExtension)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUCorePolicyExtension;
  return -[SUCorePolicyExtension init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(SUCorePolicyExtension);
}

- (id)extensionName
{
  return CFSTR("SUCorePolicyExtension");
}

- (id)filterDocumentationAssetArray:(id)a3
{
  return a3;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  return a3;
}

- (id)summary
{
  return CFSTR("SUCorePolicyExtension");
}

- (id)description
{
  return CFSTR("SUCorePolicyExtension");
}

@end
