@implementation PKSharingIDSChannelDescriptor

- (id)_initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4 subtype:(unint64_t)a5
{
  id v9;
  id v10;
  id *v11;
  id *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKSharingIDSChannelDescriptor;
  v11 = -[PKSharingChannelDescriptor _initWithType:](&v14, sel__initWithType_, 4);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 4, a3);
    objc_storeStrong(v12 + 3, a4);
    v12[2] = (id)a5;
  }

  return v12;
}

- (PKSharingIDSChannelDescriptor)initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4
{
  return (PKSharingIDSChannelDescriptor *)-[PKSharingIDSChannelDescriptor _initWithSessionIdentifier:deviceIdentifier:subtype:](self, "_initWithSessionIdentifier:deviceIdentifier:subtype:", a3, a4, 0);
}

+ (id)createWithDeviceIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSharingIDSChannelDescriptor _initWithSessionIdentifier:deviceIdentifier:subtype:]([PKSharingIDSChannelDescriptor alloc], "_initWithSessionIdentifier:deviceIdentifier:subtype:", 0, v3, 0);

  return v4;
}

+ (id)existingForSessionIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSharingIDSChannelDescriptor _initWithSessionIdentifier:deviceIdentifier:subtype:]([PKSharingIDSChannelDescriptor alloc], "_initWithSessionIdentifier:deviceIdentifier:subtype:", v3, 0, 2);

  return v4;
}

+ (id)createWithRemoteAddress:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSharingIDSChannelDescriptor _initWithSessionIdentifier:deviceIdentifier:subtype:]([PKSharingIDSChannelDescriptor alloc], "_initWithSessionIdentifier:deviceIdentifier:subtype:", 0, v3, 1);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingIDSChannelDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKSharingIDSChannelDescriptor *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  uint64_t v8;
  NSString *deviceIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSharingIDSChannelDescriptor;
  v5 = -[PKSharingChannelDescriptor initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSharingIDSChannelDescriptor;
  v4 = a3;
  -[PKSharingChannelDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceIdentifier"));

}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
