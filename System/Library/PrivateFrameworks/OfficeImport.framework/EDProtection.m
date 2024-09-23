@implementation EDProtection

+ (EDProtection)protectionWithHidden:(BOOL)a3 locked:(BOOL)a4
{
  return (EDProtection *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHidden:locked:", a3, a4);
}

- (EDProtection)initWithHidden:(BOOL)a3 locked:(BOOL)a4
{
  EDProtection *result;

  result = -[EDProtection init](self, "init");
  if (result)
  {
    result->mHidden = a3;
    result->mLocked = a4;
  }
  return result;
}

- (EDProtection)init
{
  EDProtection *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDProtection;
  result = -[EDProtection init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->mHidden = 256;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHidden:locked:", self->mHidden, self->mLocked);
}

- (BOOL)isEqual:(id)a3
{
  EDProtection *v4;
  EDProtection *v5;
  BOOL v6;

  v4 = (EDProtection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDProtection isEqualToProtection:](self, "isEqualToProtection:", v5);

  return v6;
}

- (BOOL)isEqualToProtection:(id)a3
{
  return self->mHidden == *((unsigned __int8 *)a3 + 8) && self->mLocked == *((unsigned __int8 *)a3 + 9);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  v2 = 256;
  if (!self->mHidden)
    v2 = 512;
  v3 = 1;
  if (!self->mLocked)
    v3 = 2;
  return v3 | v2;
}

- (BOOL)isHidden
{
  return self->mHidden;
}

- (BOOL)isLocked
{
  return self->mLocked;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDProtection;
  -[EDProtection description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
