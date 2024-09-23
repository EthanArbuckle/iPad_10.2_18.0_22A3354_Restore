@implementation SizeClassString

void __SizeClassString_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24EBCCA30;
  v2[1] = &unk_24EBCCA48;
  v3[0] = CFSTR("compact");
  v3[1] = CFSTR("regular");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SizeClassString_sizeClassStrings;
  SizeClassString_sizeClassStrings = v0;

}

@end
