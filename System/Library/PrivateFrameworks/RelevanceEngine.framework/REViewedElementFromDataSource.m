@implementation REViewedElementFromDataSource

void __REViewedElementFromDataSource_block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v1 = *(void **)(a1 + 32);
  v7 = CFSTR("viewedSources");
  v2 = v1;
  if (v2)
  {
    v3 = (void *)REStoredMetrics;
    if (!REStoredMetrics)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)REStoredMetrics;
      REStoredMetrics = v4;

      v3 = (void *)REStoredMetrics;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)REStoredMetrics, "setObject:forKeyedSubscript:");
    }
    objc_msgSend(v6, "addObject:", v2);

  }
}

@end
