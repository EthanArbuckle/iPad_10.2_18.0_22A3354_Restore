@implementation PKBannerHandleRequest

- (PKBannerHandleRequest)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBannerHandleRequest)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  PKBannerHandleRequest *v7;
  PKBannerHandleRequest *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if (v5 <= 2 && (v6 = v5, objc_opt_class()) && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKBannerHandleRequest;
      v7 = -[PKBannerHandleRequest init](&v11, sel_init);
      if (v7)
        v7->_type = v6;
    }
    else
    {
      v7 = 0;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKBannerHandleRequest"), 0, 0);
    objc_msgSend(v4, "failWithError:", v9);

    v8 = 0;
  }

  return v8;
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
