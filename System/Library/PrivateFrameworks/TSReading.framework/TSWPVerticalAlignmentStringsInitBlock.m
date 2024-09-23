@implementation TSWPVerticalAlignmentStringsInitBlock

uint64_t s_TSWPVerticalAlignmentStringsInitBlock_block_invoke_6()
{
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = &unk_24D8FB0B8;
  v1[1] = &unk_24D8FB0D0;
  v2[0] = &unk_24D8FAB18;
  v2[1] = &unk_24D8FAB30;
  v1[2] = &unk_24D8FB0E8;
  v1[3] = &unk_24D8FB100;
  v2[2] = &unk_24D8FAB48;
  v2[3] = &unk_24D8FAB60;
  return objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
}

@end
