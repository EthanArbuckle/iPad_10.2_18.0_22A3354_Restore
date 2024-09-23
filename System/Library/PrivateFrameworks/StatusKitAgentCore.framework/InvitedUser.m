@implementation InvitedUser

+ (NSString)invitedHandleKeyPath
{
  return (NSString *)CFSTR("invitedHandle");
}

+ (NSString)senderHandleKeyPath
{
  return (NSString *)CFSTR("senderHandle");
}

+ (id)channelKeyPath
{
  return CFSTR("channel");
}

+ (id)predicateForInvitedHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[InvitedUser invitedHandleKeyPath](InvitedUser, "invitedHandleKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForSenderHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[InvitedUser senderHandleKeyPath](InvitedUser, "senderHandleKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForChannel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[InvitedUser channelKeyPath](InvitedUser, "channelKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("InvitedUser"));
}

@end
