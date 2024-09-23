@implementation MSDSessionHubTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDSessionHubTrustEvaluate;
  if (-[MSDSessionBaseTrustEvaluate trustServer:isRedirect:](&v7, "trustServer:isRedirect:", a3, a4)
    || -[MSDSessionBaseTrustEvaluate isDone](self, "isDone")
    || (v5 = -[MSDSessionHubTrustEvaluate isHubCertificatePinnedTo:applePKI:](self, "isHubCertificatePinnedTo:applePKI:", -[MSDSessionBaseTrustEvaluate leafCertificate](self, "leafCertificate"), -[MSDSessionBaseTrustEvaluate applePKI](self, "applePKI"))))
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isHubCertificatePinnedTo:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hubCertificateIdentifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionBaseTrustEvaluate identifierFor:applePKI:](self, "identifierFor:applePKI:", a3, v4));
  if (v9)
    v10 = objc_msgSend(v8, "isEqualToString:", v9);
  else
    v10 = 0;

  return v10;
}

@end
