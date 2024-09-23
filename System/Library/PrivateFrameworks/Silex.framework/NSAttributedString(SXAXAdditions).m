@implementation NSAttributedString(SXAXAdditions)

+ (id)sxaxAttributedStringForSpeakingStringInLowerPitch:()SXAXAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDD1458];
  v4 = a3;
  v5 = [v3 alloc];
  v9 = *MEMORY[0x24BDFEBC8];
  v10[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:attributes:", v4, v6);

  return v7;
}

@end
