@implementation ClientInfo

void __ClientInfo_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDD17C8];
  ProductVersion();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("vendor=\"Apple\"; model=\"Stocks\"; version=\"1.0.0.%@\"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)ClientInfo_ClientInfo;
  ClientInfo_ClientInfo = v1;

}

@end
