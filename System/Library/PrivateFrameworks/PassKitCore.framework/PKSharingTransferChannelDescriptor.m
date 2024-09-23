@implementation PKSharingTransferChannelDescriptor

- (id)_initWithTransferToken:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingTransferChannelDescriptor;
  v6 = -[PKSharingChannelDescriptor _initWithType:](&v9, sel__initWithType_, 2);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 2, a3);

  return v7;
}

+ (id)createForTransferToken:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSharingTransferChannelDescriptor _initWithTransferToken:]([PKSharingTransferChannelDescriptor alloc], "_initWithTransferToken:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingTransferChannelDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKSharingTransferChannelDescriptor *v5;
  uint64_t v6;
  NSString *transferToken;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingTransferChannelDescriptor;
  v5 = -[PKSharingChannelDescriptor initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    transferToken = v5->_transferToken;
    v5->_transferToken = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSharingTransferChannelDescriptor;
  v4 = a3;
  -[PKSharingChannelDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transferToken, CFSTR("transferToken"), v5.receiver, v5.super_class);

}

- (NSString)transferToken
{
  return self->_transferToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferToken, 0);
}

@end
