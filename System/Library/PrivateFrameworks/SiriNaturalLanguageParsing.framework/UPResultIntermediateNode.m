@implementation UPResultIntermediateNode

- (UPResultIntermediateNode)initWithLabel:(id)a3 andLeafNodes:(id)a4
{
  id v7;
  UPResultIntermediateNode *v8;
  UPResultIntermediateNode *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UPResultIntermediateNode;
  v8 = -[UPResultNode initWithLabel:](&v11, sel_initWithLabel_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_leafNodes, a4);

  return v9;
}

- (NSArray)leafNodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafNodes, 0);
}

@end
