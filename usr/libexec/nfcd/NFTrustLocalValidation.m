@implementation NFTrustLocalValidation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustLocalValidation)initWithCoder:(id)a3
{
  id v4;
  NFTrustLocalValidation *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NFTrustLocalValidation;
  v5 = -[NFTrustObject initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
    v5->_primitiveLocalValidation = objc_msgSend(v4, "decodeIntForKey:", CFSTR("primitiveLocalValidation"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NFTrustLocalValidation primitiveLocalValidation](self, "primitiveLocalValidation"), CFSTR("primitiveLocalValidation"));

}

+ (id)withPrimitiveLocalValidation:(unsigned __int8)a3
{
  uint64_t v3;
  NFTrustLocalValidation *v4;
  NFTrustLocalValidation *v5;

  v3 = a3;
  v4 = [NFTrustLocalValidation alloc];
  v5 = v4;
  if (v4)
    -[NFTrustLocalValidation setPrimitiveLocalValidation:](v4, "setPrimitiveLocalValidation:", v3);
  return v5;
}

+ (id)localValidationWithPassCode
{
  return objc_msgSend(a1, "withPrimitiveLocalValidation:", 1);
}

+ (id)localValidationWithTouchID
{
  return objc_msgSend(a1, "withPrimitiveLocalValidation:", 2);
}

+ (id)localValidationWithFaceID
{
  return objc_msgSend(a1, "withPrimitiveLocalValidation:", 4);
}

- (id)description
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[NFTrustLocalValidation primitiveLocalValidation](self, "primitiveLocalValidation");
  v3 = CFSTR("PassCode");
  if (v2 == 2)
    v3 = CFSTR("TouchID");
  if (v2 == 4)
    return CFSTR("FaceID");
  else
    return (id)v3;
}

- (unsigned)primitiveLocalValidation
{
  return self->_primitiveLocalValidation;
}

- (void)setPrimitiveLocalValidation:(unsigned __int8)a3
{
  self->_primitiveLocalValidation = a3;
}

@end
