@implementation SFKeySearchFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFKeySearchFilter)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFKeySearchFilter;
  return -[SFKeySearchFilter init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSpecifiers:", *((_QWORD *)self->_keySearchFilterInternal + 1));
  objc_msgSend(v4, "setDomains:", *((_QWORD *)self->_keySearchFilterInternal + 2));
  return v4;
}

- (NSArray)specifiers
{
  return (NSArray *)(id)objc_msgSend(*((id *)self->_keySearchFilterInternal + 1), "copy");
}

- (void)setSpecifiers:(id)a3
{
  uint64_t v4;
  _QWORD *keySearchFilterInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  keySearchFilterInternal = self->_keySearchFilterInternal;
  v6 = (void *)keySearchFilterInternal[1];
  keySearchFilterInternal[1] = v4;

}

- (NSArray)domains
{
  return (NSArray *)(id)objc_msgSend(*((id *)self->_keySearchFilterInternal + 2), "copy");
}

- (void)setDomains:(id)a3
{
  uint64_t v4;
  _QWORD *keySearchFilterInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  keySearchFilterInternal = self->_keySearchFilterInternal;
  v6 = (void *)keySearchFilterInternal[2];
  keySearchFilterInternal[2] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keySearchFilterInternal, 0);
}

@end
