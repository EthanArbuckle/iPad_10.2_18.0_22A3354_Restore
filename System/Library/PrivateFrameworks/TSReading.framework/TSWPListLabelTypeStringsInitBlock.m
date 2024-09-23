@implementation TSWPListLabelTypeStringsInitBlock

uint64_t s_TSWPListLabelTypeStringsInitBlock_block_invoke()
{
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = &unk_24D8FB0B8;
  v1[1] = &unk_24D8FB0D0;
  v2[0] = &unk_24D8FA3C8;
  v2[1] = &unk_24D8FA3E0;
  v1[2] = &unk_24D8FB0E8;
  v1[3] = &unk_24D8FB100;
  v2[2] = &unk_24D8FA3F8;
  v2[3] = &unk_24D8FA410;
  return objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
}

@end
