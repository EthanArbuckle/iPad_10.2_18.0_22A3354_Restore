@implementation PGGraphIsHomeWorkEdge

- (id)initFromAddressNode:(id)a3 toHomeWorkNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphIsHomeWorkEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphIsHomeWorkEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphIsHomeWorkEdge *)-[PGGraphIsHomeWorkEdge initFromAddressNode:toHomeWorkNode:](self, "initFromAddressNode:toHomeWorkNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("IS_HOME_WORK");
  return CFSTR("IS_HOME_WORK");
}

- (unsigned)domain
{
  return 202;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("IS_HOME_WORK"), 202);
}

@end
