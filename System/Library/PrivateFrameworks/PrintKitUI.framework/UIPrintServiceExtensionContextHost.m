@implementation UIPrintServiceExtensionContextHost

- (UIPrintServiceExtensionContextHost)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPrintServiceExtensionContextHost;
  return -[UIPrintServiceExtensionContextHost init](&v3, sel_init);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F01B45C0);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0199378);
}

@end
