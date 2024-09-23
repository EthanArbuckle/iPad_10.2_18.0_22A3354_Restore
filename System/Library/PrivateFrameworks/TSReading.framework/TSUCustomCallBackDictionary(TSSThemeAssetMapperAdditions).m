@implementation TSUCustomCallBackDictionary(TSSThemeAssetMapperAdditions)

- (uint64_t)initForThemeAssetMapperWithCapacity:()TSSThemeAssetMapperAdditions
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = *MEMORY[0x24BDBD6A0];
  v6[1] = 0;
  v3 = *(_QWORD *)(MEMORY[0x24BDBD6A0] + 24);
  v6[2] = 0;
  v6[3] = v3;
  v4 = *(_QWORD *)(MEMORY[0x24BDBD6A0] + 40);
  v6[4] = String;
  v6[5] = v4;
  return objc_msgSend(a1, "initWithCapacity:keyCallBacks:valueCallBacks:", a3, v6, MEMORY[0x24BDBD6B0]);
}

@end
