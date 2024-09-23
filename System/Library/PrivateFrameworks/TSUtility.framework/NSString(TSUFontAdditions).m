@implementation NSString(TSUFontAdditions)

- (double)tsu_boundingSizeWithFont:()TSUFontAdditions
{
  uint64_t v4;
  double result;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "platformFont");
  if (!v4)
    return *MEMORY[0x24BDBF148];
  v6 = *MEMORY[0x24BDF65F8];
  v7[0] = v4;
  objc_msgSend(a1, "sizeWithAttributes:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  return result;
}

@end
