@implementation SFPublicKey_Ivars

- (void)dealloc
{
  __SecKey *secKey;
  objc_super v4;

  secKey = self->secKey;
  if (secKey)
    CFRelease(secKey);
  v4.receiver = self;
  v4.super_class = (Class)SFPublicKey_Ivars;
  -[SFPublicKey_Ivars dealloc](&v4, sel_dealloc);
}

@end
