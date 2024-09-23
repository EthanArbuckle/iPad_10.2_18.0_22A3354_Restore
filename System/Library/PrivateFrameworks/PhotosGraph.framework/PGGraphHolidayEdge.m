@implementation PGGraphHolidayEdge

- (id)initFromDateNode:(id)a3 toHolidayNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphHolidayEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphHolidayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphHolidayEdge *)-[PGGraphHolidayEdge initFromDateNode:toHolidayNode:](self, "initFromDateNode:toHolidayNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("HOLIDAY");
  return CFSTR("HOLIDAY");
}

- (unsigned)domain
{
  return 401;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("HOLIDAY"), 401);
}

@end
