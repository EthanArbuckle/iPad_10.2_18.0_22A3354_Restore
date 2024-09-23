@implementation WFShortcutSigningCertificate

- (NSString)commonName
{
  CFStringRef commonName;

  commonName = 0;
  if (SecCertificateCopyCommonName(-[WFShortcutSigningCertificate certificate](self, "certificate"), &commonName))
    return (NSString *)0;
  else
    return (NSString *)(id)commonName;
}

- (__SecKey)copyPublicKey
{
  return SecCertificateCopyKey(-[WFShortcutSigningCertificate certificate](self, "certificate"));
}

- (id)generateAuthData
{
  return SecCertificateCopyData(-[WFShortcutSigningCertificate certificate](self, "certificate"));
}

- (WFShortcutSigningCertificate)initWithCertificate:(__SecCertificate *)a3
{
  WFShortcutSigningCertificate *v4;
  WFShortcutSigningCertificate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFShortcutSigningCertificate;
  v4 = -[WFShortcutSigningCertificate init](&v7, sel_init);
  if (v4)
  {
    v4->_certificate = (__SecCertificate *)CFRetain(a3);
    v5 = v4;
  }

  return v4;
}

- (WFShortcutSigningCertificate)initWithCertificateData:(id)a3
{
  SecCertificateRef v4;
  WFShortcutSigningCertificate *v5;

  v4 = SecCertificateCreateWithData(0, (CFDataRef)a3);
  if (v4)
  {
    self = -[WFShortcutSigningCertificate initWithCertificate:](self, "initWithCertificate:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_certificate);
  v3.receiver = self;
  v3.super_class = (Class)WFShortcutSigningCertificate;
  -[WFShortcutSigningCertificate dealloc](&v3, sel_dealloc);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(__SecCertificate *)a3
{
  self->_certificate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
