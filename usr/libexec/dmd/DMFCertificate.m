@implementation DMFCertificate

- (id)initWithCertificateRef:(__SecCertificate *)a3 isIdentity:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  CFDataRef v8;
  void *v9;
  DMFCertificate *v10;

  v4 = a4;
  v7 = (void *)SecCertificateCopyCommonNames(a3, a2);
  v8 = SecCertificateCopyData(a3);
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  }
  else
  {
    v9 = 0;
  }
  v10 = -[DMFCertificate initWithCommonName:data:isIdentity:](self, "initWithCommonName:data:isIdentity:", v9, v8, v4);

  return v10;
}

@end
