@implementation WFNodeWrapper

- (WFNodeWrapper)initWithNode:(_xmlNode *)a3
{
  WFNodeWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFNodeWrapper;
  result = -[WFNodeWrapper init](&v5, sel_init);
  if (result)
    result->_node = a3;
  return result;
}

- (_xmlNode)node
{
  return self->_node;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFNodeWrapper;
  -[WFNodeWrapper dealloc](&v2, sel_dealloc);
}

@end
