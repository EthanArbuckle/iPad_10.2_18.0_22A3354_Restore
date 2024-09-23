@implementation PGZeroKeywordMapping

- (PGZeroKeywordMapping)initWithDisplayNode:(id)a3 mappedMeaningNodes:(id)a4
{
  id v7;
  id v8;
  PGZeroKeywordMapping *v9;
  PGZeroKeywordMapping *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGZeroKeywordMapping;
  v9 = -[PGZeroKeywordMapping init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayNode, a3);
    objc_storeStrong((id *)&v10->_mappedMeaningNodes, a4);
  }

  return v10;
}

- (PGGraphMeaningNode)displayNode
{
  return self->_displayNode;
}

- (NSArray)mappedMeaningNodes
{
  return self->_mappedMeaningNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedMeaningNodes, 0);
  objc_storeStrong((id *)&self->_displayNode, 0);
}

@end
