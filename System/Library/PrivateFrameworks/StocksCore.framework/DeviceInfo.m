@implementation DeviceInfo

void __DeviceInfo_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ProductVersion();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("make=\"Apple\"; model=\"iPhone\"; os=\"iPhone\"; osver=\"%@\"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)DeviceInfo_DeviceInfo;
  DeviceInfo_DeviceInfo = v1;

}

@end
