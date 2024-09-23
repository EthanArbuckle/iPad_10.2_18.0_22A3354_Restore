@implementation _SFAsymmetricKeyAttributes

- (_SFAsymmetricKeyAttributes)initWithSpecifier:(id)a3
{
  return -[_SFAsymmetricKeyAttributes initWithSpecifier:domain:](self, "initWithSpecifier:domain:", a3, CFSTR("SFKeyDomainCPU"));
}

- (_SFAsymmetricKeyAttributes)initWithSpecifier:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  _SFAsymmetricKeyAttributes *v8;
  uint64_t v9;
  _SFKeySpecifier *asymmetricKeySpecifier;
  uint64_t v11;
  NSString *asymmetricKeyDomain;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SFAsymmetricKeyAttributes;
  v8 = -[_SFAsymmetricKeyAttributes init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    asymmetricKeySpecifier = v8->_asymmetricKeySpecifier;
    v8->_asymmetricKeySpecifier = (_SFKeySpecifier *)v9;

    v11 = objc_msgSend(v7, "copy");
    asymmetricKeyDomain = v8->_asymmetricKeyDomain;
    v8->_asymmetricKeyDomain = (NSString *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSpecifier:domain:", self->_asymmetricKeySpecifier, self->_asymmetricKeyDomain);
}

- (_SFKeySpecifier)keySpecifier
{
  return self->_asymmetricKeySpecifier;
}

- (NSString)keyDomain
{
  return self->_asymmetricKeyDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asymmetricKeyDomain, 0);
  objc_storeStrong((id *)&self->_asymmetricKeySpecifier, 0);
}

@end
