@implementation WFURLContentLocation(Icon)

- (id)icon
{
  id v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BEC1610]);
  v1 = objc_alloc(MEMORY[0x24BEC14D0]);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1398]), "initWithSystemColor:", 4);
  v3 = (void *)objc_msgSend(v1, "initWithColor:", v2);
  v4 = (void *)objc_msgSend(v0, "initWithSymbolName:background:", CFSTR("network"), v3);

  return v4;
}

@end
