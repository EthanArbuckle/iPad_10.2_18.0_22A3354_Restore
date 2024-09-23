@implementation ISRecordSPIFunctionUsage

id ____ISRecordSPIFunctionUsage_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  __ISCurrentProcessName();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = CFSTR("No Client");
  if (v2)
    v4 = (__CFString *)v2;
  v5 = v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("No Selector");
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%i"), v9, *(unsigned int *)(a1 + 48));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("No Location");
  }
  v13[0] = CFSTR("Client");
  v13[1] = CFSTR("Class");
  v14[0] = v5;
  v14[1] = CFSTR("No Class");
  v13[2] = CFSTR("Selector");
  v13[3] = CFSTR("Location");
  v14[2] = v6;
  v14[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
