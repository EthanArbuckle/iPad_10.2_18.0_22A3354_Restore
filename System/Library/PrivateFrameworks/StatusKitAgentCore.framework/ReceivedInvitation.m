@implementation ReceivedInvitation

+ (NSString)dateInvitationCreatedKeyPath
{
  return (NSString *)CFSTR("dateInvitationCreated");
}

+ (id)senderHandleKeyPath
{
  return CFSTR("senderHandle");
}

+ (id)statusTypeIdentifierKeyPath
{
  return CFSTR("statusTypeIdentifier");
}

+ (id)predicateForSenderHandle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "normalizedHandleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForSenderHandleString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForSenderHandleString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[ReceivedInvitation senderHandleKeyPath](ReceivedInvitation, "senderHandleKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForStatusTypeIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[ReceivedInvitation statusTypeIdentifierKeyPath](ReceivedInvitation, "statusTypeIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sortDescriptorForDateInvitationCreatedOrderedAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C0];
  +[ReceivedInvitation dateInvitationCreatedKeyPath](ReceivedInvitation, "dateInvitationCreatedKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sortDescriptorForSenderHandleOrderedAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C0];
  +[ReceivedInvitation senderHandleKeyPath](ReceivedInvitation, "senderHandleKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ReceivedInvitation"));
}

@end
