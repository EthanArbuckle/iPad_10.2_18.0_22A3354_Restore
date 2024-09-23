@implementation SVXAFConnectionFactory

- (id)createWithDispatchQueue:(id)a3 instanceContext:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BE09170];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithTargetQueue:instanceContext:", v7, v6);

  return v8;
}

@end
