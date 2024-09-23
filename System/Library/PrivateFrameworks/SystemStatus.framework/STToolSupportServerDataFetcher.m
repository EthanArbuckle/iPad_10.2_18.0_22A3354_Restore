@implementation STToolSupportServerDataFetcher

- (id)serverDataForDomains:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[STStatusDomainXPCServerHandle sharedMachServiceServerHandle](STStatusDomainXPCServerHandle, "sharedMachServiceServerHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverDataForDomains:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
