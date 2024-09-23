@implementation SFIdentitySearchFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFIdentitySearchFilter)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFIdentitySearchFilter;
  return -[SFIdentitySearchFilter init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setCertificateSerialNumbers:", *((_QWORD *)self->_identitySearchFilterInternal + 1));
  objc_msgSend(v4, "setCertificateTypes:", *((_QWORD *)self->_identitySearchFilterInternal + 2));
  objc_msgSend(v4, "setKeySpecifiers:", *((_QWORD *)self->_identitySearchFilterInternal + 3));
  return v4;
}

- (NSArray)certificateSerialNumbers
{
  return (NSArray *)(id)objc_msgSend(*((id *)self->_identitySearchFilterInternal + 1), "copy");
}

- (void)setCertificateSerialNumbers:(id)a3
{
  uint64_t v4;
  _QWORD *identitySearchFilterInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  identitySearchFilterInternal = self->_identitySearchFilterInternal;
  v6 = (void *)identitySearchFilterInternal[1];
  identitySearchFilterInternal[1] = v4;

}

- (NSArray)certificateTypes
{
  return (NSArray *)(id)objc_msgSend(*((id *)self->_identitySearchFilterInternal + 2), "copy");
}

- (void)setCertificateTypes:(id)a3
{
  uint64_t v4;
  _QWORD *identitySearchFilterInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  identitySearchFilterInternal = self->_identitySearchFilterInternal;
  v6 = (void *)identitySearchFilterInternal[2];
  identitySearchFilterInternal[2] = v4;

}

- (NSArray)keySpecifiers
{
  return (NSArray *)(id)objc_msgSend(*((id *)self->_identitySearchFilterInternal + 3), "copy");
}

- (void)setKeySpecifiers:(id)a3
{
  uint64_t v4;
  _QWORD *identitySearchFilterInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  identitySearchFilterInternal = self->_identitySearchFilterInternal;
  v6 = (void *)identitySearchFilterInternal[3];
  identitySearchFilterInternal[3] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_identitySearchFilterInternal, 0);
}

@end
