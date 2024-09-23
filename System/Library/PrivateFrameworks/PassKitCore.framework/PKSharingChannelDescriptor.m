@implementation PKSharingChannelDescriptor

- (PKSharingChannelDescriptor)init
{

  return 0;
}

- (id)_initWithType:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSharingChannelDescriptor;
  result = -[PKSharingChannelDescriptor init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingChannelDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKSharingChannelDescriptor *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKSharingChannelDescriptor;
  v5 = -[PKSharingChannelDescriptor init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  unint64_t type;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", type);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
