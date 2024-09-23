@implementation SFSymmetricKeyAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong(&self->_symmetricKeyAttributesInternal, 0);
}

- (SFSymmetricKeyAttributes)initWithSpecifier:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  SFSymmetricKeyAttributes *v8;
  SFSymmetricKeyAttributes_Ivars *v9;
  id symmetricKeyAttributesInternal;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SFSymmetricKeyAttributes;
  v8 = -[SFSymmetricKeyAttributes init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(SFSymmetricKeyAttributes_Ivars);
    symmetricKeyAttributesInternal = v8->_symmetricKeyAttributesInternal;
    v8->_symmetricKeyAttributesInternal = v9;

    v11 = objc_msgSend(v6, "copy");
    v12 = v8->_symmetricKeyAttributesInternal;
    v13 = (void *)v12[3];
    v12[3] = v11;

    v14 = objc_msgSend(v7, "copy");
    v15 = v8->_symmetricKeyAttributesInternal;
    v16 = (void *)v15[4];
    v15[4] = v14;

  }
  return v8;
}

- (SFSymmetricKeyAttributes)initWithSpecifier:(id)a3
{
  return -[SFSymmetricKeyAttributes initWithSpecifier:domain:](self, "initWithSpecifier:domain:", a3, CFSTR("SFKeyDomainCPU"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSpecifier:domain:", *((_QWORD *)self->_symmetricKeyAttributesInternal + 3), *((_QWORD *)self->_symmetricKeyAttributesInternal + 4));
  objc_msgSend(v4, "setLocalizedLabel:", *((_QWORD *)self->_symmetricKeyAttributesInternal + 1));
  objc_msgSend(v4, "setLocalizedDescription:", *((_QWORD *)self->_symmetricKeyAttributesInternal + 2));
  return v4;
}

- (void)setLocalizedLabel:(id)a3
{
  uint64_t v4;
  _QWORD *symmetricKeyAttributesInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  symmetricKeyAttributesInternal = self->_symmetricKeyAttributesInternal;
  v6 = (void *)symmetricKeyAttributesInternal[1];
  symmetricKeyAttributesInternal[1] = v4;

}

- (void)setLocalizedDescription:(id)a3
{
  uint64_t v4;
  _QWORD *symmetricKeyAttributesInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  symmetricKeyAttributesInternal = self->_symmetricKeyAttributesInternal;
  v6 = (void *)symmetricKeyAttributesInternal[2];
  symmetricKeyAttributesInternal[2] = v4;

}

- (NSString)localizedLabel
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_symmetricKeyAttributesInternal + 1), "copy");
}

- (NSString)localizedDescription
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_symmetricKeyAttributesInternal + 2), "copy");
}

- (_SFKeySpecifier)keySpecifier
{
  return (_SFKeySpecifier *)(id)objc_msgSend(*((id *)self->_symmetricKeyAttributesInternal + 3), "copy");
}

- (void)setKeySpecifier:(id)a3
{
  uint64_t v4;
  _QWORD *symmetricKeyAttributesInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  symmetricKeyAttributesInternal = self->_symmetricKeyAttributesInternal;
  v6 = (void *)symmetricKeyAttributesInternal[3];
  symmetricKeyAttributesInternal[3] = v4;

}

- (NSString)keyDomain
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_symmetricKeyAttributesInternal + 4), "copy");
}

- (NSString)persistentIdentifier
{
  return self->persistentIdentifier;
}

@end
