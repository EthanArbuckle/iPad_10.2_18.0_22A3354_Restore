@implementation SiriCoreGetConnectionNetworkPathReport

uint64_t __SiriCoreGetConnectionNetworkPathReport_block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  const char *name;
  void *v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", nw_interface_get_type(v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("type"));

    name = nw_interface_get_name(v3);
    if (name)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", name);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", nw_interface_get_index(v3));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("index"));

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

    }
  }

  return 1;
}

uint64_t __SiriCoreGetConnectionNetworkPathReport_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  _getEndpointInfo(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

@end
