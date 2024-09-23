@implementation PKProxCardRequest

- (PKProxCardRequest)initWithProxCardType:(int64_t)a3
{
  PKProxCardRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKProxCardRequest;
  result = -[PKProxCardRequest init](&v5, sel_init);
  if (result)
    result->_proxCardType = a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_proxCardType, CFSTR("proxCardType"));
}

- (PKProxCardRequest)initWithCoder:(id)a3
{
  id v4;
  PKProxCardRequest *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proxCardType")) == 1
    && objc_opt_class()
    && (objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[PKProxCardRequest initWithProxCardType:](self, "initWithProxCardType:", 1);
    v5 = self;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKProxCardRequest"), 0, 0);
    objc_msgSend(v4, "failWithError:", v6);

    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)proxCardType
{
  return self->_proxCardType;
}

@end
