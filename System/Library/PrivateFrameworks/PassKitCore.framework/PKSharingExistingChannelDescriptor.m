@implementation PKSharingExistingChannelDescriptor

- (id)_initWithTransportIdentifier:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingExistingChannelDescriptor;
  v6 = -[PKSharingChannelDescriptor _initWithType:](&v9, sel__initWithType_, 1);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 2, a3);

  return v7;
}

+ (id)existingForTransportIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSharingExistingChannelDescriptor _initWithTransportIdentifier:]([PKSharingExistingChannelDescriptor alloc], "_initWithTransportIdentifier:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingExistingChannelDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKSharingExistingChannelDescriptor *v5;
  uint64_t v6;
  NSString *transportIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingExistingChannelDescriptor;
  v5 = -[PKSharingChannelDescriptor initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transportIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    transportIdentifier = v5->_transportIdentifier;
    v5->_transportIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSharingExistingChannelDescriptor;
  v4 = a3;
  -[PKSharingChannelDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transportIdentifier, CFSTR("transportIdentifier"), v5.receiver, v5.super_class);

}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
}

@end
