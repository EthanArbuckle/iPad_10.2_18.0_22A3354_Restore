@implementation CNContactStoreConfiguration(TUConversation)

+ (id)tu_contactStoreConfigurationForConversation:()TUConversation
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C972A0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "assumedIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tu_assumedIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "setAssumedIdentity:", v7);

  return v5;
}

@end
