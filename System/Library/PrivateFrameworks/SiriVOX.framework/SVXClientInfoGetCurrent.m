@implementation SVXClientInfoGetCurrent

void __SVXClientInfoGetCurrent_block_invoke()
{
  SVXClientInfo *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [SVXClientInfo alloc];
  v1 = objc_msgSend(v5, "processIdentifier");
  objc_msgSend(v5, "processName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SVXClientInfo initWithProcessIdentifier:processName:](v0, "initWithProcessIdentifier:processName:", v1, v2);
  v4 = (void *)SVXClientInfoGetCurrent_clientInfo;
  SVXClientInfoGetCurrent_clientInfo = v3;

}

@end
