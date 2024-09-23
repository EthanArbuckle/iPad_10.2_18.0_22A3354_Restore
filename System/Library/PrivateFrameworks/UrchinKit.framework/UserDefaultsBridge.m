@implementation UserDefaultsBridge

+ (id)createWithSuiteName:(id)a3 container:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDBCF50];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "_initWithSuiteName:container:", v7, v6);

  return v8;
}

@end
