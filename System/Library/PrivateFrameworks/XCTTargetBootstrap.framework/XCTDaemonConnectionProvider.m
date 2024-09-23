@implementation XCTDaemonConnectionProvider

- (id)makeNewDaemonConnectionWithServiceName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD1988];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithMachServiceName:options:", v4, 0);

  return v5;
}

@end
