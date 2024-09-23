@implementation PKPayLaterAccountFeatureDescriptor

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountFeatureDescriptor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterAccountFeatureDescriptor *v4;
  PKPayLaterAccountFeatureDescriptor *v5;
  BOOL v6;

  v4 = (PKPayLaterAccountFeatureDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountFeatureDescriptor isEqualToAccountFeatureDescriptor:](self, "isEqualToAccountFeatureDescriptor:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterAccountFeatureDescriptor;
  return -[PKAccountFeatureDescriptor copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end
