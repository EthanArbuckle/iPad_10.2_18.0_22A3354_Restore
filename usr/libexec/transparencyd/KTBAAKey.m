@implementation KTBAAKey

- (KTBAAKey)initWithKey:(__SecKey *)a3 certificates:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  KTBAAKey *v10;
  KTBAAKey *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)KTBAAKey;
  v10 = -[KTBAAKey init](&v13, "init");
  if (v10)
  {
    if (a3)
      CFRetain(a3);
    -[KTBAAKey setReferenceKey:](v10, "setReferenceKey:", a3);
    -[KTBAAKey setCertificates:](v10, "setCertificates:", v8);
    -[KTBAAKey setError:](v10, "setError:", v9);
    v11 = v10;
  }

  return v10;
}

- (BOOL)validBAAKey
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[KTBAAKey referenceKey](self, "referenceKey"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTBAAKey certificates](self, "certificates"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTBAAKey error](self, "error"));
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  __SecKey *v3;
  objc_super v4;

  v3 = -[KTBAAKey referenceKey](self, "referenceKey");
  if (v3)
    CFRelease(v3);
  -[KTBAAKey setReferenceKey:](self, "setReferenceKey:", 0);
  v4.receiver = self;
  v4.super_class = (Class)KTBAAKey;
  -[KTBAAKey dealloc](&v4, "dealloc");
}

- (__SecKey)referenceKey
{
  return self->_referenceKey;
}

- (void)setReferenceKey:(__SecKey *)a3
{
  self->_referenceKey = a3;
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end
