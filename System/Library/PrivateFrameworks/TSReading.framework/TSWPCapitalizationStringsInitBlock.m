@implementation TSWPCapitalizationStringsInitBlock

uint64_t s_TSWPCapitalizationStringsInitBlock_block_invoke_3()
{
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = &unk_24D8FB0B8;
  v1[1] = &unk_24D8FB0D0;
  v2[0] = &unk_24D8FAA28;
  v2[1] = &unk_24D8FAA40;
  v1[2] = &unk_24D8FB0E8;
  v1[3] = &unk_24D8FB100;
  v2[2] = &unk_24D8FAA58;
  v2[3] = &unk_24D8FAA70;
  return objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
}

@end
