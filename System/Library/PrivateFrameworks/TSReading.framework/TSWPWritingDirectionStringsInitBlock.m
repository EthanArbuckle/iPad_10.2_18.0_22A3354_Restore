@implementation TSWPWritingDirectionStringsInitBlock

uint64_t s_TSWPWritingDirectionStringsInitBlock_block_invoke_4()
{
  _QWORD v1[3];
  _QWORD v2[4];

  v2[3] = *MEMORY[0x24BDAC8D0];
  v1[0] = &unk_24D8FB6B8;
  v1[1] = &unk_24D8FB6D0;
  v2[0] = &unk_24D8FAA88;
  v2[1] = &unk_24D8FAAA0;
  v1[2] = &unk_24D8FB6E8;
  v2[2] = &unk_24D8FAAB8;
  return objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 3);
}

@end
