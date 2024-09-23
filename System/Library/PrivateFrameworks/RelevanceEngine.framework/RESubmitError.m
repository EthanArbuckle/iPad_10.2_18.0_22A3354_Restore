@implementation RESubmitError

void __RESubmitError_block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(__CFString **)(a1 + 32);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = CFSTR("error");
  v6[1] = v4;
  v7[0] = v4;
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

@end
