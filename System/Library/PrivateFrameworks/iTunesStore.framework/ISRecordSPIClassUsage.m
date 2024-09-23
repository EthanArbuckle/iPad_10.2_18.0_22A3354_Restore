@implementation ISRecordSPIClassUsage

id ____ISRecordSPIClassUsage_block_invoke(uint64_t a1)
{
  objc_class *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("No Class");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  __ISCurrentProcessName();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("No Client");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  NSStringFromSelector(*(SEL *)(a1 + 40));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("No Selector");
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  if (*(_QWORD *)(a1 + 48))
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@:%i"), v17, *(unsigned int *)(a1 + 56));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = CFSTR("No Location");
  }
  v21[0] = CFSTR("Client");
  v21[1] = CFSTR("Class");
  v22[0] = v10;
  v22[1] = v6;
  v21[2] = CFSTR("Selector");
  v21[3] = CFSTR("Location");
  v22[2] = v14;
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
