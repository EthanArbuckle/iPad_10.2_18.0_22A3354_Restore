@implementation PGGraphMemoryFeaturesEdge

- (id)initFromMemoryNode:(id)a3 toFeatureNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphMemoryFeaturesEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphMemoryFeaturesEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphMemoryFeaturesEdge *)-[PGGraphMemoryFeaturesEdge initFromMemoryNode:toFeatureNode:](self, "initFromMemoryNode:toFeatureNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("MEMORY_FEATURES");
  return CFSTR("MEMORY_FEATURES");
}

- (unsigned)domain
{
  return 1100;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("MEMORY_FEATURES"), 1100);
}

@end
