@implementation MISUserTrustSignature

- (MISUserTrustSignature)initWithSignature:(id)a3
{
  id v5;
  MISUserTrustSignature *v6;
  MISUserTrustSignature *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MISUserTrustSignature;
  v6 = -[MISUserTrustSignature init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->signature, a3);

  return v7;
}

- (NSData)signature
{
  return self->signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->signature, 0);
}

@end
