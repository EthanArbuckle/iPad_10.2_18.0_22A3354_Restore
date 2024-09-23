@implementation BurstTrieDictionary

- (unsigned)payloadForString:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BurstTrieDictionary;
  return -[_PASCFBurstTrie payloadForString:](&v4, sel_payloadForString_, a3) - 1;
}

- (id)objectForKeyedSubscript:(id)a3
{
  unsigned int v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BurstTrieDictionary;
  v3 = -[_PASCFBurstTrie payloadForString:](&v6, sel_payloadForString_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
