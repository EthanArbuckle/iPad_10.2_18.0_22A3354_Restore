@implementation PKSharingLocalChannelDescriptor

+ (id)createSourceWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSharingLocalChannelDescriptor _initWithBaseTransportIdentifier:subtype:]([PKSharingLocalChannelDescriptor alloc], "_initWithBaseTransportIdentifier:subtype:", v3, 0);

  return v4;
}

+ (id)createDestinationWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSharingLocalChannelDescriptor _initWithBaseTransportIdentifier:subtype:]([PKSharingLocalChannelDescriptor alloc], "_initWithBaseTransportIdentifier:subtype:", v3, 1);

  return v4;
}

- (id)_initWithBaseTransportIdentifier:(id)a3 subtype:(unint64_t)a4
{
  id v7;
  id *v8;
  id *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSharingLocalChannelDescriptor;
  v8 = -[PKSharingChannelDescriptor _initWithType:](&v11, sel__initWithType_, 5);
  v9 = v8;
  if (v8)
  {
    v8[3] = (id)a4;
    objc_storeStrong(v8 + 2, a3);
  }

  return v9;
}

- (NSString)transportIdentifier
{
  return (NSString *)PKCreateSharingLocalChannelDescriptorTransportIdentifier(self->_baseTransportIdentifier, self->_subtype);
}

- (id)contraChannelTransportIdentifier
{
  unint64_t subtype;
  uint64_t v3;

  subtype = self->_subtype;
  if (!subtype)
  {
    v3 = 1;
    goto LABEL_5;
  }
  if (subtype == 1)
  {
    v3 = 0;
LABEL_5:
    PKCreateSharingLocalChannelDescriptorTransportIdentifier(self->_baseTransportIdentifier, v3);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingLocalChannelDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKSharingLocalChannelDescriptor *v5;
  uint64_t v6;
  NSString *baseTransportIdentifier;
  __CFString *v8;
  __CFString *v9;
  BOOL v10;
  char v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  _BOOL8 v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKSharingLocalChannelDescriptor;
  v5 = -[PKSharingChannelDescriptor initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseTransportIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    baseTransportIdentifier = v5->_baseTransportIdentifier;
    v5->_baseTransportIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtype"));
    v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v8 == CFSTR("Source") || v8 == 0;
    v15 = 0;
    if (!v10)
    {
      v11 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Source"));

      if ((v11 & 1) == 0)
      {
        v12 = v9;
        if (v12 == CFSTR("Destination")
          || (v13 = v12,
              v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("Destination")),
              v13,
              v14))
        {
          v15 = 1;
        }
      }
    }

    v5->_subtype = v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t subtype;
  const __CFString *v6;
  const __CFString *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKSharingLocalChannelDescriptor;
  v4 = a3;
  -[PKSharingChannelDescriptor encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_baseTransportIdentifier, CFSTR("baseTransportIdentifier"), v8.receiver, v8.super_class);
  subtype = self->_subtype;
  v6 = &stru_1E2ADF4C0;
  if (subtype == 1)
    v6 = CFSTR("Destination");
  if (subtype)
    v7 = v6;
  else
    v7 = CFSTR("Source");
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subtype"));

}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseTransportIdentifier, 0);
}

@end
