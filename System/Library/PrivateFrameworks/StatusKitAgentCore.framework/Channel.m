@implementation Channel

+ (NSString)identifierKeyPath
{
  return (NSString *)CFSTR("identifier");
}

+ (NSString)personalKeyPath
{
  return (NSString *)CFSTR("personal");
}

+ (NSString)decomissionedKeyPath
{
  return (NSString *)CFSTR("decomissioned");
}

+ (NSString)statusTypeKeyPath
{
  return (NSString *)CFSTR("statusType");
}

+ (NSString)encryptionKeysKeyPath
{
  return (NSString *)CFSTR("encryptionKeys");
}

+ (id)dateChannelCreatedKeyPath
{
  return CFSTR("dateChannelCreated");
}

+ (NSString)presenceIdentifierKeyPath
{
  return (NSString *)CFSTR("presenceIdentifier");
}

+ (NSString)channelTypeKeyPath
{
  return (NSString *)CFSTR("channelType");
}

+ (id)predicateForStatusTypeIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[Channel statusTypeKeyPath](Channel, "statusTypeKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForPersonal:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1758];
  +[Channel personalKeyPath](Channel, "personalKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K == %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForDecomissioned:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1758];
  +[Channel decomissionedKeyPath](Channel, "decomissionedKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K == %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForChannelTypeStatus
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1758];
  +[Channel channelTypeKeyPath](Channel, "channelTypeKeyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K == %@"), v3, &unk_24D98DD98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForChannelTypePresence
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1758];
  +[Channel channelTypeKeyPath](Channel, "channelTypeKeyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K == %@"), v3, &unk_24D98DDB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForPresenceIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[Channel presenceIdentifierKeyPath](Channel, "presenceIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForChannelIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[Channel identifierKeyPath](Channel, "identifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForCreationDateNotNil
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1758];
  +[Channel dateChannelCreatedKeyPath](Channel, "dateChannelCreatedKeyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K != nil"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sortDescriptorForStatusTypeIdentifierOrderedAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C0];
  +[Channel statusTypeKeyPath](Channel, "statusTypeKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sortDescriptorForPersonalOrderedAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C0];
  +[Channel personalKeyPath](Channel, "personalKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sortDescriptorForChannelIdentifierOrderedAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C0];
  +[Channel identifierKeyPath](Channel, "identifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sortDescriptorForCreationDateAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C0];
  +[Channel dateChannelCreatedKeyPath](Channel, "dateChannelCreatedKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Channel"));
}

@end
