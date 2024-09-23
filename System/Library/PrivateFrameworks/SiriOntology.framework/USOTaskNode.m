@implementation USOTaskNode

- (USOTaskNode)initWithCppTaskNode:(void *)a3
{
  USOTaskNode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)USOTaskNode;
  result = -[USOEntityNode initWithCppEntityNode:](&v5, sel_initWithCppEntityNode_);
  if (result)
    result->_usoTaskNode = a3;
  return result;
}

@end
