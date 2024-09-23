@implementation NISystemConfiguration

- (NISystemConfiguration)init
{
  NISystemConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NISystemConfiguration;
  result = -[NIConfiguration initInternal](&v3, "initInternal");
  if (result)
  {
    result->_prewarmUWB = 0;
    result->_prewarmSecureElementChannel = 0;
  }
  return result;
}

+ (NISystemConfiguration)new
{
  return objc_alloc_init(NISystemConfiguration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NISystemConfiguration;
  v4 = -[NIConfiguration copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setPrewarmUWB:", self->_prewarmUWB);
  objc_msgSend(v4, "setPrewarmSecureElementChannel:", self->_prewarmSecureElementChannel);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NISystemConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_prewarmUWB, CFSTR("prewarmUWB"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_prewarmSecureElementChannel, CFSTR("prewarmSecureElementChannel"));

}

- (NISystemConfiguration)initWithCoder:(id)a3
{
  id v4;
  NISystemConfiguration *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  NISystemConfiguration *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NISystemConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prewarmUWB"));
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prewarmSecureElementChannel"));
    v5->_prewarmUWB = v6;
    v5->_prewarmSecureElementChannel = v7;
    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NISystemConfiguration *v7;
  NISystemConfiguration *v8;
  unsigned int v9;
  int prewarmUWB;
  unsigned int v11;
  BOOL v13;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NISystemConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v13 = 1;
    }
    else
    {
      v9 = -[NISystemConfiguration prewarmUWB](v7, "prewarmUWB");
      prewarmUWB = self->_prewarmUWB;
      v11 = -[NISystemConfiguration prewarmSecureElementChannel](v8, "prewarmSecureElementChannel");
      v13 = prewarmUWB == v9 && self->_prewarmSecureElementChannel == v11;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_prewarmUWB ^ self->_prewarmSecureElementChannel ^ 0x1Fu;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NISystemConfiguration descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<prewarm [UWB: %d, secureElementChannel: %d]>"), self->_prewarmUWB, self->_prewarmSecureElementChannel);
}

- (BOOL)prewarmUWB
{
  return self->_prewarmUWB;
}

- (void)setPrewarmUWB:(BOOL)a3
{
  self->_prewarmUWB = a3;
}

- (BOOL)prewarmSecureElementChannel
{
  return self->_prewarmSecureElementChannel;
}

- (void)setPrewarmSecureElementChannel:(BOOL)a3
{
  self->_prewarmSecureElementChannel = a3;
}

@end
