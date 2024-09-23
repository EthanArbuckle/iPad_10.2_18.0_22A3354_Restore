@implementation USOGraphNode

- (USOGraphNode)initWithCppGraphNode:(UsoGraphNode *)a3
{
  USOGraphNode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)USOGraphNode;
  result = -[USOGraphNode init](&v5, sel_init);
  if (result)
    result->_usoGraphNode = a3;
  return result;
}

- (void)setSuccessor:(const void *)a3 successor:(id)a4 enumeration:(unsigned int)a5
{
  siri::ontology::UsoGraphNode::setSuccessor((siri::ontology::UsoGraphNode *)self->_usoGraphNode, (const siri::ontology::OntologyEdgeName *)a3, *((const UsoGraphNode **)a4 + 1), a5);
}

@end
