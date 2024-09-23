@implementation SXAdIgnorableViewFactory

- (id)createView
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BDF6F90]);
  return (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

@end
