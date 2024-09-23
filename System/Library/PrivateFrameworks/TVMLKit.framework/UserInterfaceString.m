@implementation UserInterfaceString

void __UserInterfaceString_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24EBCCA18;
  v2[1] = &unk_24EBCCA30;
  v3[0] = CFSTR("phone");
  v3[1] = CFSTR("pad");
  v2[2] = &unk_24EBCCA48;
  v2[3] = &unk_24EBCCA60;
  v3[2] = CFSTR("tv");
  v3[3] = CFSTR("carPlay");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)UserInterfaceString_userInterfaceStrings;
  UserInterfaceString_userInterfaceStrings = v0;

}

@end
