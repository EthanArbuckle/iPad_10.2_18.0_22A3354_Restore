@implementation TSWPTOCScopeStringsInitBlock

uint64_t s_TSWPTOCScopeStringsInitBlock_block_invoke_5()
{
  _QWORD v1[3];
  _QWORD v2[4];

  v2[3] = *MEMORY[0x24BDAC8D0];
  v1[0] = &unk_24D8FB0D0;
  v1[1] = &unk_24D8FB0E8;
  v2[0] = &unk_24D8FAAD0;
  v2[1] = &unk_24D8FAAE8;
  v1[2] = &unk_24D8FB0B8;
  v2[2] = &unk_24D8FAB00;
  return objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 3);
}

@end
