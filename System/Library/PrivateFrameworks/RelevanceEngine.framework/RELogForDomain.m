@implementation RELogForDomain

void __RELogForDomain_block_invoke()
{
  uint64_t i;
  const char *v1;
  os_log_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 22);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 22; ++i)
  {
    v1 = RELogNameForDomain(i);
    v2 = os_log_create("com.apple.RelevanceEngine", v1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v2, v3);

  }
  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)RELogForDomain_LogForDomains;
  RELogForDomain_LogForDomains = v4;

}

@end
