@implementation RCDisplayLinkBlockTargetProxy

- (RCDisplayLinkBlockTargetProxy)initWithHandlerBlock:(id)a3
{
  RCDisplayLinkBlockTargetProxy *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCDisplayLinkBlockTargetProxy;
  result = -[RCDisplayLinkBlockTargetProxy init](&v5, sel_init);
  if (result)
    result->_handlerBlock = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCDisplayLinkBlockTargetProxy;
  -[RCDisplayLinkBlockTargetProxy dealloc](&v3, sel_dealloc);
}

- (void)displayLinkFired:(id)a3
{
  uint64_t (**handlerBlock)(id, SEL);

  handlerBlock = (uint64_t (**)(id, SEL))self->_handlerBlock;
  if (handlerBlock)
  {
    if ((handlerBlock[2](handlerBlock, a2) & 1) == 0)
      objc_msgSend(a3, "invalidate");
  }
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

@end
