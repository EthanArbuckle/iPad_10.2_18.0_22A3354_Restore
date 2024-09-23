@implementation UMUserPersonaContext

- (UMUserPersonaContext)init
{
  UMUserPersonaContext *v2;
  uint64_t v3;
  OS_voucher *voucher;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UMUserPersonaContext;
  v2 = -[UMUserPersonaContext init](&v6, sel_init);
  if (v2)
  {
    v3 = voucher_copy();
    voucher = v2->_voucher;
    v2->_voucher = (OS_voucher *)v3;

  }
  return v2;
}

- (void)contextAdopt
{
  OS_voucher *voucher;
  OS_voucher *v4;
  void *v5;

  voucher = self->_voucher;
  if (voucher)
  {
    v4 = voucher;

    v5 = self->_voucher;
    self->_voucher = 0;
  }
  else
  {
    v5 = (void *)voucher_adopt();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
}

+ (id)currentPersonaContext
{
  return (id)objc_opt_new();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)copyPersonaContext:(id *)a3
{
  if (a3)
    *a3 = 0;
  return 0;
}

@end
