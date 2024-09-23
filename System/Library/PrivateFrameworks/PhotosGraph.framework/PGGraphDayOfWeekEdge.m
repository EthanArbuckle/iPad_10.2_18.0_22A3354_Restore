@implementation PGGraphDayOfWeekEdge

- (id)initFromDateNode:(id)a3 toDayOfWeekNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphDayOfWeekEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphDayOfWeekEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphDayOfWeekEdge *)-[PGGraphDayOfWeekEdge initFromDateNode:toDayOfWeekNode:](self, "initFromDateNode:toDayOfWeekNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("DAYOFWEEK");
  return CFSTR("DAYOFWEEK");
}

- (unsigned)domain
{
  return 400;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("DAYOFWEEK"), 400);
}

@end
