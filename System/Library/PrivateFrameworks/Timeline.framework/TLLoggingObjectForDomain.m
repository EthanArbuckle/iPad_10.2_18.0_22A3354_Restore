@implementation TLLoggingObjectForDomain

void __TLLoggingObjectForDomain_block_invoke()
{
  void *v0;
  uint64_t v1;
  char v2;
  char v3;
  const char *v4;
  os_log_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = 0;
  v2 = 1;
  do
  {
    v3 = v2;
    if ((v2 & 1) != 0)
      v4 = "default";
    else
      v4 = "timeline";
    v5 = os_log_create("Timeline", v4);
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "setObject:forKey:", v5, v6);

    }
    v2 = 0;
    v1 = 1;
  }
  while ((v3 & 1) != 0);
  v7 = (void *)TLLoggingObjectForDomain___logObjects;
  TLLoggingObjectForDomain___logObjects = (uint64_t)v0;

}

@end
