@implementation SFKeyPair_Ivars

- (void)dealloc
{
  __SecKey *secKey;
  objc_super v4;

  secKey = self->secKey;
  if (secKey)
    CFRelease(secKey);
  v4.receiver = self;
  v4.super_class = (Class)SFKeyPair_Ivars;
  -[SFKeyPair_Ivars dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->privateKeyDomain, 0);
}

@end
