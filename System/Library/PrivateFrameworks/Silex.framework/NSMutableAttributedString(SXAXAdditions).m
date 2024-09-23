@implementation NSMutableAttributedString(SXAXAdditions)

- (void)sxaxApplyLowerPitchTokenToRange:()SXAXAdditions
{
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BDFEBC8];
  v9[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAttributes:range:", v7, a3, a4);

}

@end
