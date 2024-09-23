@implementation SFRevocationPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRevocationPolicy)init
{
  return -[SFRevocationPolicy initWithRevocationMethods:networkLookup:](self, "initWithRevocationMethods:networkLookup:", 0xFFFFFFFFLL, 1);
}

- (SFRevocationPolicy)initWithRevocationMethods:(unint64_t)a3 networkLookup:(int64_t)a4
{
  SFRevocationPolicy *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFRevocationPolicy;
  result = -[SFRevocationPolicy init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result->_revocationPolicyInternal + 1) = a3;
    *((_QWORD *)result->_revocationPolicyInternal + 2) = a4;
  }
  return result;
}

- (SFRevocationPolicy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFRevocationPolicy;
  return -[SFRevocationPolicy init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRevocationMethods:networkLookup:", *((_QWORD *)self->_revocationPolicyInternal + 1), *((_QWORD *)self->_revocationPolicyInternal + 2));
}

- (unint64_t)revocationMethods
{
  return *((_QWORD *)self->_revocationPolicyInternal + 1);
}

- (void)setRevocationMethods:(unint64_t)a3
{
  *((_QWORD *)self->_revocationPolicyInternal + 1) = a3;
}

- (int64_t)networkLookup
{
  return *((_QWORD *)self->_revocationPolicyInternal + 2);
}

- (void)setNetworkLookup:(int64_t)a3
{
  *((_QWORD *)self->_revocationPolicyInternal + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_revocationPolicyInternal, 0);
}

@end
