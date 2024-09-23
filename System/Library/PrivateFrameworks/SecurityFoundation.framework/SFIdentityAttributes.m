@implementation SFIdentityAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFIdentityAttributes)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFIdentityAttributes;
  return -[SFIdentityAttributes init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLocalizedLabel:", *((_QWORD *)self->_identityAttributesInternal + 1));
  objc_msgSend(v4, "setLocalizedDescription:", *((_QWORD *)self->_identityAttributesInternal + 2));
  objc_msgSend(v4, "setKeySpecifier:", *((_QWORD *)self->_identityAttributesInternal + 3));
  objc_msgSend(v4, "setIdentityName:", *((_QWORD *)self->_identityAttributesInternal + 4));
  return v4;
}

- (NSString)localizedLabel
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_identityAttributesInternal + 1), "copy");
}

- (void)setLocalizedLabel:(id)a3
{
  uint64_t v4;
  _QWORD *identityAttributesInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  identityAttributesInternal = self->_identityAttributesInternal;
  v6 = (void *)identityAttributesInternal[1];
  identityAttributesInternal[1] = v4;

}

- (NSString)localizedDescription
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_identityAttributesInternal + 2), "copy");
}

- (void)setLocalizedDescription:(id)a3
{
  uint64_t v4;
  _QWORD *identityAttributesInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  identityAttributesInternal = self->_identityAttributesInternal;
  v6 = (void *)identityAttributesInternal[2];
  identityAttributesInternal[2] = v4;

}

- (_SFKeySpecifier)keySpecifier
{
  return (_SFKeySpecifier *)(id)objc_msgSend(*((id *)self->_identityAttributesInternal + 3), "copy");
}

- (void)setKeySpecifier:(id)a3
{
  uint64_t v4;
  _QWORD *identityAttributesInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  identityAttributesInternal = self->_identityAttributesInternal;
  v6 = (void *)identityAttributesInternal[3];
  identityAttributesInternal[3] = v4;

}

- (NSString)identityName
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_identityAttributesInternal + 4), "copy");
}

- (void)setIdentityName:(id)a3
{
  uint64_t v4;
  _QWORD *identityAttributesInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  identityAttributesInternal = self->_identityAttributesInternal;
  v6 = (void *)identityAttributesInternal[4];
  identityAttributesInternal[4] = v4;

}

- (BOOL)hasCertificate
{
  return *((_BYTE *)self->_identityAttributesInternal + 48);
}

- (NSString)persistentIdentifier
{
  return self->persistentIdentifier;
}

- (NSString)privateKeyDomain
{
  return self->_privateKeyDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKeyDomain, 0);
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong(&self->_identityAttributesInternal, 0);
}

@end
