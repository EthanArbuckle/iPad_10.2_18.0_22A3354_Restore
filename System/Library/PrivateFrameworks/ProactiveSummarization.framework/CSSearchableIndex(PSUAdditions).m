@implementation CSSearchableIndex(PSUAdditions)

+ (id)psu_criticalIndexWithName:()PSUAdditions protectionClass:bundleIdentifier:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x24BDC2470];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "_initWithName:protectionClass:bundleIdentifier:options:", v10, v9, v8, 32);

  return v11;
}

@end
