@implementation PKBannerHandleState

- (PKBannerHandleState)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBannerHandleState)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  PKBannerHandleState *v6;
  PKBannerHandleState *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if (v5 <= 1 && objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      v10.receiver = self;
      v10.super_class = (Class)PKBannerHandleState;
      v6 = -[PKBannerHandleState init](&v10, sel_init);
      if (v6)
        v6->_type = v5;
    }
    else
    {
      v6 = 0;
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKBannerHandleState"), 0, 0);
    objc_msgSend(v4, "failWithError:", v8);

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("type"));
}

- (int64_t)type
{
  return self->_type;
}

@end
