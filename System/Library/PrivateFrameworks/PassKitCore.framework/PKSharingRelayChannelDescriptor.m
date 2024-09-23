@implementation PKSharingRelayChannelDescriptor

- (id)_initWithSubType:(unint64_t)a3 region:(id)a4 stateful:(BOOL)a5 existingChannelURL:(id)a6 mailboxIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id *v16;
  id *v17;
  objc_super v19;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PKSharingRelayChannelDescriptor;
  v16 = -[PKSharingChannelDescriptor _initWithType:](&v19, sel__initWithType_, 3);
  v17 = v16;
  if (v16)
  {
    v16[3] = (id)a3;
    objc_storeStrong(v16 + 4, a4);
    *((_BYTE *)v17 + 16) = a5;
    objc_storeStrong(v17 + 5, a6);
    objc_storeStrong(v17 + 6, a7);
  }

  return v17;
}

+ (id)createChannelWithRegion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSharingRelayChannelDescriptor _initWithSubType:region:stateful:existingChannelURL:mailboxIdentifier:]([PKSharingRelayChannelDescriptor alloc], "_initWithSubType:region:stateful:existingChannelURL:mailboxIdentifier:", 1, v3, 1, 0, 0);

  return v4;
}

+ (id)createChannelWithRegion:(id)a3 stateful:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = -[PKSharingRelayChannelDescriptor _initWithSubType:region:stateful:existingChannelURL:mailboxIdentifier:]([PKSharingRelayChannelDescriptor alloc], "_initWithSubType:region:stateful:existingChannelURL:mailboxIdentifier:", 1, v5, v4, 0, 0);

  return v6;
}

+ (id)existingChannelForURL:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSharingRelayChannelDescriptor _initWithSubType:region:stateful:existingChannelURL:mailboxIdentifier:]([PKSharingRelayChannelDescriptor alloc], "_initWithSubType:region:stateful:existingChannelURL:mailboxIdentifier:", 2, 0, 0, v3, 0);

  return v4;
}

+ (id)existingChannelForMailboxIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSharingRelayChannelDescriptor _initWithSubType:region:stateful:existingChannelURL:mailboxIdentifier:]([PKSharingRelayChannelDescriptor alloc], "_initWithSubType:region:stateful:existingChannelURL:mailboxIdentifier:", 2, 0, 0, 0, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingRelayChannelDescriptor)initWithCoder:(id)a3
{
  id v4;
  PKSharingRelayChannelDescriptor *v5;
  void *v6;
  uint64_t v7;
  NSString *region;
  void *v9;
  uint64_t v10;
  NSString *existingChannelURL;
  uint64_t v12;
  NSString *existingMailboxIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKSharingRelayChannelDescriptor;
  v5 = -[PKSharingChannelDescriptor initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtype"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_subtype = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v7 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateful"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_stateful = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("existingChannelURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    existingChannelURL = v5->_existingChannelURL;
    v5->_existingChannelURL = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("existingMailboxIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    existingMailboxIdentifier = v5->_existingMailboxIdentifier;
    v5->_existingMailboxIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKSharingRelayChannelDescriptor;
  v4 = a3;
  -[PKSharingChannelDescriptor encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_subtype, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("subtype"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_region, CFSTR("region"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_stateful);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("stateful"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_existingChannelURL, CFSTR("existingChannelURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_existingMailboxIdentifier, CFSTR("existingMailboxIdentifier"));

}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (NSString)region
{
  return self->_region;
}

- (BOOL)stateful
{
  return self->_stateful;
}

- (NSString)existingChannelURL
{
  return self->_existingChannelURL;
}

- (NSString)existingMailboxIdentifier
{
  return self->_existingMailboxIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingMailboxIdentifier, 0);
  objc_storeStrong((id *)&self->_existingChannelURL, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
