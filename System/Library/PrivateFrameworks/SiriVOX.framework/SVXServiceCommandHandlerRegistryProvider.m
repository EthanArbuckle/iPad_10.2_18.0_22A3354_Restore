@implementation SVXServiceCommandHandlerRegistryProvider

- (id)createWithHandlers:(id)a3
{
  id v3;
  SVXServiceCommandHandlerRegistry *v4;

  v3 = a3;
  v4 = -[SVXServiceCommandHandlerRegistry initWithHandlers:]([SVXServiceCommandHandlerRegistry alloc], "initWithHandlers:", v3);

  return v4;
}

@end
