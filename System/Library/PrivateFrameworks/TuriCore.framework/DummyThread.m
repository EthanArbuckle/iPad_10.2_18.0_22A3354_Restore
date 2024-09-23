@implementation DummyThread

- (DummyThread)init
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", self, sel_dummy, 0);
  objc_msgSend(v3, "start");

  return self;
}

@end
