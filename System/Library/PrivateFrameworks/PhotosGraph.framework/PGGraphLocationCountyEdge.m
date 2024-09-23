@implementation PGGraphLocationCountyEdge

- (id)initFromLocationNode:(id)a3 toCountyNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphLocationCountyEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphLocationCountyEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphLocationCountyEdge *)-[PGGraphLocationCountyEdge initFromLocationNode:toCountyNode:](self, "initFromLocationNode:toCountyNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("COUNTY");
  return CFSTR("COUNTY");
}

- (unsigned)domain
{
  return 200;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("COUNTY"), 200);
}

@end
