@implementation NSBundle(PosterFoundation)

+ (id)pf_uniqueBundleWithURL:()PosterFoundation
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD1488];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "_initUniqueWithURL:", v4);

  return v5;
}

@end
