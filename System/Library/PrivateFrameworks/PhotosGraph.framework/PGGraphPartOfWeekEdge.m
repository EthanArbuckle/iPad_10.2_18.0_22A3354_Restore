@implementation PGGraphPartOfWeekEdge

- (id)initFromMomentNode:(id)a3 toPartOfWeekNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPartOfWeekEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphPartOfWeekEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPartOfWeekEdge *)-[PGGraphPartOfWeekEdge initFromMomentNode:toPartOfWeekNode:](self, "initFromMomentNode:toPartOfWeekNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PARTOFWEEK");
  return CFSTR("PARTOFWEEK");
}

- (unsigned)domain
{
  return 400;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("PARTOFWEEK"), 400);
}

@end
