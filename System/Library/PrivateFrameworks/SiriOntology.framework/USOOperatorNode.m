@implementation USOOperatorNode

- (USOOperatorNode)initWithCppOperatorNode:(UsoOperatorNode *)a3
{
  USOOperatorNode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)USOOperatorNode;
  result = -[USOGraphNode initWithCppGraphNode:](&v5, sel_initWithCppGraphNode_);
  if (result)
    result->_usoOperatorNode = a3;
  return result;
}

@end
