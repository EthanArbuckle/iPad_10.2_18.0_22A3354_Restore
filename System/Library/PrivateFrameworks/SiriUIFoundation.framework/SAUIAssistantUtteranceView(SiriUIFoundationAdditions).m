@implementation SAUIAssistantUtteranceView(SiriUIFoundationAdditions)

- (uint64_t)sruif_isUtterance
{
  return 1;
}

- (id)sruif_insertionContext
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "encodedClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x24BE82678]);
  objc_msgSend(a1, "dialogIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x24BE82680]);

  return v2;
}

@end
